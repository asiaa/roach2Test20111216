#! /usr/bin/env python
""" 
Script for initialising casper_n correlators. 
Can be left running (assuming sufficient bandwidth) and will continuously check that system is sync'd. will attempt recovery if sync is lost.

Author: Jason Manley
date: 09 Jan 2008
2008-09-12  JRM Added support for different numbers of X and F engines

2008-02-20  JRM Now uses UDP borphserver
                New ibob address/data communication scheme

2008-02-14  JRM Fixed gbe_config for >1 BEE

2008-01-09  JRM DESIGNED FOR Cn rev 308b and upwards
                New loopback_mux flush
                Now grabs config settings from global corr.conf file 

eg usage: ./init_corr.py -c ~/corr.conf

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
    failures=0
    for i in range(n_xaui_ports_per_fpga):
        if write_int_all('ibob_addr%i'%i,(2**32)-1)!='ok': 
            failures+=1
        if write_int_all('ibob_data%i'%i,data)!='ok': 
            failures+=1
        if write_int_all('ibob_addr%i'%i,addr)!='ok': 
            failures+=1
    if failures == 0: return '''ok'''
    else: return '%i Failures!'%failures

def write_all_ibobs_ctrl(input_sel=0, use_sram_tvg=False, use_fft_tvg=False, arm_rst=False, sync_rst=False, fft_shift=1023):
    """Writes a value to the ibob control registers connected to all BEEs."""
    value = input_sel<<20 | use_sram_tvg<<19 | use_fft_tvg<<18 | arm_rst<<17 | sync_rst<<16 | fft_shift
    return write_all_ibobs(addr=8192,data=value)

def arm():
    rv=write_all_ibobs_ctrl(arm_rst=False)    
    if rv != 'ok': return rv
    return write_all_ibobs_ctrl(arm_rst=True)

def read_int_all(register):
    """Reads a value from register 'device' for all BEE FPGAs."""
    rv = [fpga.read_int(register) for fpga in fpgas]
#    for f,fpga in enumerate(fpgas):
#        rv.append(fpga.read_int(register))
    return rv

def get_gbe_conf(port,start_addr,fpga):
    """Generates a 10GbE configuration string starting from ip "start_addr"."""
    gbe_conf = """begin\n\tmac = 00:12:6D:AE:%02X:%02X\n\tip = %i.%i.%i.%i\n\tgateway = %i.%i.0.1\n\tport = %i\nend\n""" + chr(255) #+ chr(255)
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
    if rv != 'ok': return rv 
    time.sleep(1)
    return write_int_all('tvg_sel', 0)

def check_x_miss():
    """Returns the number of X engines which have missed packets."""
    rv = 0
    for x_eng in range(n_xeng_per_fpga):
        #print('trying to read from register: ' + 'x%i_miss'%(x_eng+1))
        firstpass_check = read_int_all('x_miss%i'%(x_eng))
        #print firstpass_check
        for f,fpga in enumerate(fpgas):
            if (firstpass_check[f]['data'] !=0):
                print ('FAILURE! X engine %i on %s is not receiving all of its packet data.'%((x_eng),servers[f]))
                rv += 1
    #print ('RV: %i' %rv)
    return rv

def check_xaui_error():
    """Returns the number of BEE FPGAs with bad XAUI links."""
    rv = 0
    for x in range(n_xaui_ports_per_fpga):
        out = read_int_all('xaui_errors%i'%x)
        for f,fpga in enumerate(fpgas):
            if (out[f]['data'] !=0):
                print ('FAILURE! XAUI port %i on %s has damaged %i packets.'%(x,servers[f], out[f]['data']))
                rv += 1
    return rv

def check_loopback_mcnt():
    """Checks to see if the mux_pkts block has become stuck waiting for a 
    crazy mcnt value to be received from 10GbE. 
    Returns the number of x engines with blocked mux_pkts blocks."""
    rv=0
    for x in range(min(n_xaui_ports_per_fpga,n_xeng_per_fpga)):
        firstpass_check = read_int_all('mux_pkts%i_mcnt'%x)
        #print firstpass_check
        time.sleep(2)
        secondpass_check = read_int_all('mux_pkts%i_mcnt'%x)
        #print secondpass_check
        for f,fpga in enumerate(fpgas):
            if ((secondpass_check[f]['data']>>16 == firstpass_check[f]['data']>>16)|(secondpass_check[f]['data']&4294901760 == firstpass_check[f]['data']&4294901760)):
                print('FAILURE! Loopback mux on %s GbE port %i is stalled.' %(servers[f],x))
                rv+=1
    return rv

def flush_loopback_mcnt():
    """Flush the mux_pkts buffers. Sometimes the block gets stuck waiting for some ridiculous mcnt value to be received from 10GbE. Bit 0 = register reset, bit 1 = loopback buffer flush. COMING SOON: hardware fix"""
    for x in range(min(n_xaui_ports_per_fpga,n_xeng_per_fpga)):
        rv = (write_int_all('mux_pkts%i_rst_mcnt_regs'%x, 3))
        if rv != 'ok': return rv
        time.sleep(1)
        rv = write_int_all('mux_pkts%i_rst_mcnt_regs'%x, 0)
        if rv != 'ok': return rv
    return rv

def monitor():
    """Monitors the system health by continuously checking that the system is sync'd, the loopback has not become stuck, and all x engines are receiving all their packets."""
    if check(): print('''System sync'd and running!''')
    else: attempt_fix()

    while opts.n_retries < 0:
        if check(): print('''%s: System sync'd and running...'''%time.asctime())
        else: 
            attempt_fix()
            print 'Rechecking...'

    if not check(): print('''%s: Resync attempts FAILED. Giving up.'''%time.asctime())

def attempt_fix():
    """Try to fix (sync) the system. If n_retries is <0, retry forever. Otherwise, retry for n_retries."""
    while ((not check()) and opts.n_retries!=0):
        print('\a Attempting resync:')
        print('    Rearm... '),arm()
        time.sleep(1)
        print('    Flushing local loopback... %s' %flush_loopback_mcnt())
        time.sleep(2)
        print('    Resetting counters... %s' %rst_cnt())
        time.sleep(2)
        if opts.n_retries >0:
            opts.n_retries-=1
            print ' Retries remaining: %i'%opts.n_retries

   
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
    p.add_option('-s', '--skip_prog', dest='prog_fpga',action='store_false', default=True, 
        help='Skip FPGA programming (assumes already programmed).  Default: program the FPGAs')

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
acc_len = config['acc_len']
n_xeng_per_fpga = config['x_per_fpga']
n_xaui_ports_per_fpga= config['n_xaui_ports_per_fpga']
n_ants_per_xaui = config['n_ants_per_xaui']
data_port = config['10gbe_port']
n_chan = config['n_chans']
fft_shift = config['fft_shift']
gbe_start_ip = config['10gbe_ip']
gbe_port = config['10gbe_port']
time_server = config['timeserver']

print('Using servers: '),
print(servers)
fpgas = [corr.udp_client.UDPClient(s['server'], s['port']) for s in config['servers']]

if opts.monitor_only:
    monitor()


# PROGRAM THE DEVICES
if opts.prog_fpga:
    print '''Programming the FPGAs with %s...'''%config['bitstream']
    sys.stdout.flush()

    for f,fpga in enumerate(fpgas):
        while opts.n_retries!=0:
            print '''\t%s...'''%servers[f],
            sys.stdout.flush()
            out=fpga.progdev(config['bitstream'])
            print '''%s:%s''' %(out['status'],out['data'])
            if out['status'] == ('SUCCESS'): 
                break
            elif opts.n_retries >0:
                opts.n_retries-=1
                print ' Retries remaining: %i'%opts.n_retries
            if opts.n_retries==0: 
                print 'Failed.\n'
                exit()

            time.sleep(5) #delay for BEE2s - shouldn't need for ROACH
        #print '''ok'''

# TURN OFF ANY TVGs
write_int_all('tvg_sel', 0)

# SET THE TIME
if opts.init_time:
    print '''Setting the time...''',
    sys.stdout.flush()
    for f,fpga in enumerate(fpgas):
        out = fpga.execute('ntpdate '+time_server)
        if out['status'] != ('SUCCESS'):
            print '''Failed to set time on %s: %s:%s''' %(servers[f],out['status'],out['data'])
else:
    print 'Skipping time set'


# ARM THE BEEs
print '''Syncing the ibobs & setting FFT shift...''',
sys.stdout.flush()
print arm()


# Set the Accumulation Length (in # of syncs)
print ('''Setting the accumulation length to %i...''' %(acc_len)),
sys.stdout.flush()
print (write_int_all('acc_len', acc_len))

# Set antenna indices
print('''Setting the antenna indices...'''),
sys.stdout.flush()
ant = 0
for x in range(n_xaui_ports_per_fpga):
    for f,fpga in enumerate(fpgas):
        if (fpga.write_int('base_ant%i'%x, ant)['status'] != 'SUCCESS'):
            print 'Failed to program XAUI port %i on %s!'%(x,servers[f])     
        else:
            print('%i'%ant),
            sys.stdout.flush()
        ant += n_ants_per_xaui
print ('''done''')

# Set UDP TX data port
print ('''Setting the UDP TX data port to %i'''%(data_port)),
sys.stdout.flush()
print write_int_all('gbe_port', data_port)


# Set UDP TX/RX ip
print ('''Setting the 10GbE IP addresses...'''),
sys.stdout.flush()
for xaui in range(n_xaui_ports_per_fpga):
    for f,fpga in enumerate(fpgas):
        ip = gbe_start_ip + f + xaui*(len(fpgas))
        if (fpga.write_int('gbe_ip%i'%xaui, ip)['status'] != 'SUCCESS'):
            print('''Failed to program %s''' %(servers[f]))     
print ('''done''')

# Configure the 10 GbE data ports
print('''Configuring the 10GbE cores...'''),
sys.stdout.flush()
for x in range(n_xaui_ports_per_fpga):
    for f,fpga in enumerate(fpgas):
        new_gbe_conf=get_gbe_conf(port=gbe_port,start_addr=gbe_start_ip,fpga=f+x*len(fpgas))
        #print 'Length of GBE config string: %i'%len(new_gbe_conf) #SHOULD BE 86
        rv=fpga.write_ui('gbe%i'%x, new_gbe_conf)
        if rv['status'] != 'SUCCESS':
            print '''Failed to program 10GbE core %i on %s. %s:%s'''%(x,servers[f], rv['status'],rv['data'])
            exit(1)
print 'ok'

print('''\nWaiting for the system to stabalise...'''),
sys.stdout.flush()
time.sleep(4)
print '''ok'''

print('''Flushing loopback MCNT...'''),
time.sleep(1)
print flush_loopback_mcnt()

print('''Resetting error counters...'''),
print rst_cnt()
time.sleep(1)

print ('''\n All done with setup!''')

print('''\nVERIFYING...\n''')

print("""Checking that all XAUI links are working..."""),
bad_xauis = check_xaui_error()
if bad_xauis !=0:
    print ('%i bad XAUI links!'%bad_xauis)
else:
    print 'ok'

print('''Checking that all BEE FPGAs are sending 10GbE packets...'''),
sys.stdout.flush()
for x in range(n_xaui_ports_per_fpga):
    firstpass_check = read_int_all('gbe_tx_cnt%i'%x)
    time.sleep(2)
    secondpass_check = read_int_all('gbe_tx_cnt%i'%x)
    for f,fpga in enumerate(fpgas):
        if (secondpass_check[f]['data'] <= firstpass_check[f]['data']):
            print('FAILED!\n 10GbE core %i on %s is not sending any packets.' %(x,servers[f]))
            print 'Firstpass: ', firstpass_check
            print 'Secondpass: ', secondpass_check
            sys.exit()
print('''ok''')

print('''Checking that all BEE FPGAs are receiving 10GbE packets...'''),
sys.stdout.flush()

for x in range(min(n_xaui_ports_per_fpga,n_xeng_per_fpga)):
    time.sleep(2)
    firstpass_check = read_int_all('gbe_rx_cnt%i'%x)
    time.sleep(2)
    secondpass_check = read_int_all('gbe_rx_cnt%i'%x)

    for f,fpga in enumerate(fpgas):
        if (secondpass_check[f]['data'] <= firstpass_check[f]['data']):
            print('Failed. 10GbE core %i on %s is not receiving any packets.''' %(x, servers[f]))
            print 'Firstpass: ', firstpass_check
            print 'Secondpass: ', secondpass_check
            sys.exit()
print('''ok''')

print '''Checking that all X engines are receiving all their packets...''',
rst_cnt()
time.sleep(1)

monitor()
