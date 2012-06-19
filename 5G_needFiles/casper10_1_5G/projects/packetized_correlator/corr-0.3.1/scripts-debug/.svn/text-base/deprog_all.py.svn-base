#! /usr/bin/env python
""" 
Script for unloading the casper_n correlator's FPGAs. 

Author: Jason Manley
date: 17 Mar 2008
"""
import corr, time, sys, numpy, os

def write_int_all(register,value):
    """Writes to register on all fpgas. 
    Returns 'ok' or string outlining failure."""
    for f,fpga in enumerate(fpgas):
        out = fpga.write_int(register,value)
        if out['status'] != ('SUCCESS'):
            return('''Failed to program %s:%s-%s''' %(servers[f],out['status'],out['data']))
    return('''ok''')

def write_all_ibobs(addr,data):
    write_int_all('ibob_addr',(2**32)-1)
    write_int_all('ibob_data',data)
    return write_int_all('ibob_addr',addr)

def write_all_ibobs_ctrl(input_sel=0, use_sram_tvg=False, use_fft_tvg=False, arm_rst=False, sync_rst=False, fft_shift=1023):
    """Writes a value to the ibob control registers connected to all BEEs."""
    value = input_sel<<20 | use_sram_tvg<<19 | use_fft_tvg<<18 | arm_rst<<17 | sync_rst<<16 | fft_shift
    return write_all_ibobs(addr=8192,data=value)

def arm():
    write_all_ibobs_ctrl(arm_rst=False)    
    return write_all_ibobs_ctrl(arm_rst=True)

def read_int_all(register):
    """Reads a value from register 'device' for all BEE FPGAs."""
    rv = [fpga.read_int(register) for fpga in fpgas]
#    for f,fpga in enumerate(fpgas):
#        rv.append(fpga.read_int(register))
    return rv

def get_gbe_conf(port,start_addr,fpga):
    """Generates a 10GbE configuration string starting from ip "start_addr"."""
    gbe_conf = """begin\n\tmac = 00:12:6D:AE:%02X:%02X\n\tip = %i.%i.%i.%i\n\tgateway = %i.%i.0.1\n\tport = %i\nend\n""" + chr(255)
    ip = start_addr + fpga
    ip_1 = (ip/(2**24))
    ip_2 = (ip%(2**24))/(2**16)
    ip_3 = (ip%(2**16))/(2**8)
    ip_4 = (ip%(2**8))
    #print gbe_conf % (ip_3,ip_4,ip_1,ip_2,ip_3,ip_4,ip_1,ip_2,port)
    return gbe_conf % (ip_3,ip_4,ip_1,ip_2,ip_3,ip_4,ip_1,ip_2,port)

def rst_cnt():
    """Resets all error counters"""
    rv = write_int_all('tvg_sel', 1 << 8)
    time.sleep(1)
    write_int_all('tvg_sel', 0)
    return rv

def check_x_miss():
    """Returns the number of X engines which have missed packets."""
    rv = 0
    for x_eng in range(num_xeng_per_fpga):
        #print('trying to read from register: ' + 'x%i_miss'%(x_eng+1))
        firstpass_check = read_int_all('x%i_miss'%(x_eng+1))
        #print firstpass_check
        for f,fpga in enumerate(fpgas):
            if (firstpass_check[f]['data'] !=0):
                print ('FAILURE! X engine %i on %s is not receiving all of its packet data.'%((x_eng+1),servers[f]))
                rv += 1
    #print ('RV: %i' %rv)
    return rv

def check_xaui_error():
    """Returns the number of BEE FPGAs with bad XAUI links."""
    rv = 0
    out = read_int_all('xaui_errors')
    #print firstpass_check
    for f,fpga in enumerate(fpgas):
        if (out[f]['data'] !=0):
            print ('FAILURE! XAUI connection on %s has damaged %i packets.'%(servers[f], out[f]['data']))
            rv += 1
    return rv

def check_loopback_mcnt():
    """Checks to see if the mux_pkts block has become stuck waiting for a 
    crazy mcnt value to be received from 10GbE. 
    Returns the number of x engines with blocked mux_pkts blocks."""
    rv=0
    firstpass_check = read_int_all('mux_pkts_mcnt')
    time.sleep(2)
    secondpass_check = read_int_all('mux_pkts_mcnt')
    for f,fpga in enumerate(fpgas):
        if ((secondpass_check[f]['data']>>16 == firstpass_check[f]['data']>>16)|(secondpass_check[f]['data']&4294901760 == firstpass_check[f]['data']&4294901760)):
            print('FAILURE! Loopback mux on %s is stalled.' %(servers[f]))
            rv+=1
    return rv

def flush_loopback_mcnt():
    """Flush the mux_pkts buffers. Sometimes the block gets stuck waiting for some ridiculous mcnt value to be received from 10GbE. Bit 0 = register reset, bit 1 = loopback buffer flush. COMING SOON: hardware fix"""
    rv=(write_int_all('mux_pkts_rst_mcnt_regs', 3))
    time.sleep(1)
    write_int_all('mux_pkts_rst_mcnt_regs', 0)
    time.sleep(1)
    return rv

def monitor():
    if check(): print('''System sync'd and running...''')
    else: attempt_fix()

    while opts.n_retries < 0:
        if check(): print('''System sync'd and running...''')
        else: attempt_fix()

    if not check(): print('''FAILED.''')

def attempt_fix():
    while ((not check()) and opts.n_retries!=0):
        print('\a Attempting resync:')
        print('    Flushing local loopback... %s' %flush_loopback_mcnt())
        print('    Rearm... '),arm()

        time.sleep(2)
        print('    Resetting counters... %s' %rst_cnt())
        time.sleep(2)
        if opts.n_retries >0:
            opts.n_retries-=1
            print ' Retries remaining: %i'%opts.n_retries
        print' Rechecking...',

   
def check():
    if ((check_loopback_mcnt() != 0) or (check_xaui_error() != 0) or (check_x_miss() !=0)):
        return False
    else:
        return True


if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('init_corr.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-m', '--monitor_only', dest='monitor_only', action='store_true', default=False, 
        help='Skip the initialision. ie Only monitor.')
    p.add_option('-t', '--init_time', dest='init_time',action='store_true', default=False, 
        help='Set the BEEs time from the timeserver specified in the config file.  Default: do not set time')
    p.add_option('-r', '--n_retries', dest='n_retries', type='int', default=-1, 
        help='Number of times to try and sync the system before giving up. Set to -1 for infinity. Default: -1')

    opts, args = p.parse_args(sys.argv[1:])

    if args==[]:
        print 'Please specify a configuration file! \nExiting.'
        exit()

    config = corr.cn_conf.CorrConf(args[0])
    config_status = config.read_all()
    print '\n\nParsing config file %s...%s'%(args[0],config_status)
    sys.stdout.flush()
    if not config_status == 'OK': exit()

servers = [s['server'] for s in config['servers']]

print('Using servers: '),
print(servers)
fpgas = [corr.udp_client.UDPClient(s['server'], s['port']) for s in config['servers']]


# PROGRAM THE DEVICES
print '''De-programming the FPGAs...'''
for f,fpga in enumerate(fpgas):
    out = fpga.progdev('')
    print '''%s: %s:%s''' %(servers[f],out['status'],out['data'])
print '''done'''
