#! /usr/bin/env python
""" 
Script for initialising casper_n correlators. 
Can be left running (assuming sufficient bandwidth) and will continuously check that system is sync'd. will attempt recovery if sync is lost.

Author: Jason Manley
date: 09 Jan 2008

Rev 1.1 JRM DESIGNED FOR Cn rev 308b and upwards
            New loopback_mux flush
            New XAUI link monitor
            Now grabs config settings from global corr.conf file 

eg usage: ./init_corr.py -c ~/corr.conf

"""
import corr.borph, time, sys, numpy, os, corr.cn_conf

gbe_conf = """begin\n\tmac = 00:12:6D:AE:00:%s\n\tip = 10.0.0.%d\n\tgateway = 10.0.0.1\n\tport = 8888\nend\n"""

def special_all(device, value):
    rv = []
    for b in bees: rv.append(b.special(device, value))
    return rv

def check_special_result(results):
    """Checks the returned list to make sure that all registers were successfully written to. Returns 'ok' or string outlining failure."""
    for b in enumerate(bees):
        if results[b[0]]['status'] != ('SUCCESS'):
            return('''Failed to program %s''' %(servers[b[0]]))
    return('''ok''')

def write_all_ibobs_ctrl(input_sel=0, use_sram_tvg=False, use_fft_tvg=False, arm_rst=False, sync_rst=False, fft_shift=1023):
    """Writes a value to the ibob control registers connected to all BEEs."""
    value = input_sel<<20 | use_sram_tvg<<19 | use_fft_tvg<<18 | arm_rst<<17 | sync_rst<<16 | fft_shift
    rv = []
    for b in bees: rv.append(b.write('ibob_ctrl', value))
    return rv

def write_all(device, value):
    """Writes a value to the register 'device' for all BEE FPGAs."""
    rv = []
    for b in bees: rv.append(b.write(device, value))
    return rv

def read_all(device):
    """Reads a value from register 'device' for all BEE FPGAs."""
    rv = []
    for b in bees: rv.append(b.read(device))
    return rv

def get_gbe_conf(num):
    """Generates a 10GbE configuration string starting from ip x.y.z.128 (see constant definition gbe_conf)."""
    ip = 128 + num
    haddr = hex(num)[2:]
    if len(haddr) < 2: haddr = '0' + haddr
    return gbe_conf % (haddr.upper(),ip)

def rst_cnt():
    """Resets all error counters"""
    rv = check_result(write_all('tvg_sel', 1 << 8))
    time.sleep(1)
    write_all('tvg_sel', 0)
    return rv

def check_result(results):
    """Checks the returned list to make sure that all registers were successfully written to. Returns 'ok' or string outlining failure."""
    for b in enumerate(bees):
        for f in fpgas:
            if results[b[0]][f]['status'] != ('SUCCESS'):
                return('''Failed to program %s on %s''' %(f,servers[b[0]]))
    return('''ok''')

def check_x_miss():
    """Returns the number of X engines which have missed packets."""
    rv = 0
    for x_eng in range(num_xengines_per_fpga):
        #print('trying to read from register: ' + 'x%i_miss'%(x_eng+1))
        firstpass_check = read_all('x%i_miss'%(x_eng+1))
        #print firstpass_check
        for b in enumerate(bees):
            for f in fpgas:
                if (firstpass_check[b[0]][f]['data'] !=0):
                    print ('FAILURE! X engine %i on %s on %s is not receiving all of its packet data.'%((x_eng+1),f,servers[b[0]]))
                    rv += 1
    #print ('RV: %i' %rv)
    return rv

def check_xaui_error():
    """Returns the number of BEE FPGAs with bad XAUI links."""
    rv = 0
    firstpass_check = read_all('xaui_errors')
    for b in enumerate(bees):
        for f in fpgas:
            if (firstpass_check[b[0]][f]['data'] !=0):
                print ('FAILURE! XAUI connection on %s on %s has damaged %i packets.'%(f,servers[b[0]], firstpass_check[b[0]][f]['data']))
                rv += 1
    return rv

def check_loopback_mcnt():
    """Checks to see if the mux_pkts block has become stuck waiting for a crazy mcnt value to be received from 10GbE. Returns the number of x engines with blocked mux_pkts blocks."""
    rv=0
    firstpass_check = read_all('mux_pkts_mcnt')
    time.sleep(2)
    secondpass_check = read_all('mux_pkts_mcnt')
    for b in enumerate(bees):
        for f in fpgas:
            if ((secondpass_check[b[0]][f]['data']>>16 == firstpass_check[b[0]][f]['data']>>16)|(secondpass_check[b[0]][f]['data']&4294901760 == firstpass_check[b[0]][f]['data']&4294901760)):
                print('FAILURE! Loopback mux on %s on %s is stalled.' %(f,servers[b[0]]))
                rv+=1
    return rv

def flush_loopback_mcnt():
    """Flush the mux_pkts buffers. Sometimes the block gets stuck waiting for some ridiculous mcnt value to be received from 10GbE. Bit 0 = register reset, bit 1 = loopback buffer flush. COMING SOON: hardware fix"""
    rv=check_result(write_all('mux_pkts_rst_mcnt_regs', 3))
    #legacy:
    write_all('mux_pkts_get_lb_data', 1)
    time.sleep(1)
    write_all('mux_pkts_rst_mcnt_regs', 0)
    #legacy:
    write_all('mux_pkts_get_lb_data', 0)
    time.sleep(1)
    return rv

def start_tx():
    for b in self.boards: print b.special('start_tx', 0)

def stop_tx():
    for b in self.boards: print b.special('stop_tx', 0)

def monitor():
    while(1):
        while ((check_xaui_error() != 0) or (check_loopback_mcnt() != 0) or (check_x_miss() !=0)):
            print('\a Attempting resync:')
            print('    Flushing buffers... %s' %flush_loopback_mcnt())
            print('    Rearm... '),
            write_all_ibobs_ctrl(input_sel=0, use_sram_tvg=False, use_fft_tvg=False, arm_rst=False, sync_rst=False, fft_shift=int(fft_shift,16))
            print check_result(write_all_ibobs_ctrl(input_sel=0, use_sram_tvg=False, use_fft_tvg=False, arm_rst=True, sync_rst=False, fft_shift=int(fft_shift,16)))
            time.sleep(2)
            print('    Resetting counters... %s' %rst_cnt())
            time.sleep(2)
            print'Rechecking...',
        print('''System sync'd and running...''')
        time.sleep(10)


def check():
    if ((check_xaui_error() != 0) or (check_loopback_mcnt() != 0) or (check_x_miss() !=0)):
        return False
    else:
        return True


if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('init_corr.py [options] [servers] ')
    p.set_description(__doc__)
    p.add_option('-m', '--monitor_only', dest='monitor_only', action='store_true', default=False, 
        help='Skip the initialision. ie Only monitor.')
    p.add_option('-c', '--config_file', dest='config_file', default=None,
        help='The correlator configuration file.')
    p.add_option('-t', '--init_time', dest='init_time',action='store_true', default=False, 
        help='Set the BEEs time from the timeserver specified in the config file.  Default: do not set time')
    p.add_option('-g', '--eq_gain', dest='eq_gain', type='int', default=0, 
        help='Initial gain for all channels of all ibobs.  Default is no eq.')

    opts, args = p.parse_args(sys.argv[1:])


    if not opts.config_file:
        print 'Please specify a configuration file! \nExiting.'
        exit()

    config = corr.cn_conf.CorrConf(opts.config_file)
    if not config.file_exists():
        print 'Could not file config file %s! \nExiting.'%opts.config_file
        exit()

    config_status = config.read_all()   
    print '\n\nParsing config file %s...%s'%(opts.config_file,config_status)
    if not config_status == 'OK':
        exit()

servers = [s['server'] for s in config['servers']]
fpgas = ['FPGA0','FPGA1','FPGA2','FPGA3']

acc_len = config['acc_len']
num_xengines_per_fpga = config['x_per_fpga']
data_port = config['10gbe_port']
n_chan = config['n_chans']
fft_shift = config['fft_shift']
gbe_ip = config['10gbe_ip']
time_server = config['timeserver']

bees = [corr.borph.BorphClient(s['server'], s['port']) for s in config['servers']]

print('Using servers: '),
print(servers)

if opts.monitor_only:
    monitor()

write_all('tvg_sel', 0)

# SET THE TIME
if opts.init_time:
    print '''Setting the time...''',
    sys.stdout.flush()
    print check_special_result(special_all('execute', 'ntpdate '+time_server))
else:
    print 'Skipping time set'


# Initialise the IBOBs' EQ gains to defaults
if opts.eq_gain>0:
    print '''Resetting all ibobs' %i channels' gains to %i...'''%(n_chan,opts.eq_gain),
    sys.stdout.flush()
    print check_special_result(special_all('init_eq', [n_chan,opts.eq_gain]))
else:
    print 'Skipping EQ reset'



# ARM THE BEEs
print '''Syncing the ibobs & setting FFT shift...''',
sys.stdout.flush()
write_all_ibobs_ctrl(input_sel=0, use_sram_tvg=False, use_fft_tvg=False, arm_rst=False, sync_rst=False, fft_shift=int(fft_shift,16))
print check_result(write_all_ibobs_ctrl(input_sel=0, use_sram_tvg=False, use_fft_tvg=False, arm_rst=True, sync_rst=False, fft_shift=int(fft_shift,16)))


# Set the Accumulation Length (in # of syncs)
print ('''Setting the accumulation length to %i...''' %(acc_len)),
print (check_result(write_all('acc_len', acc_len)))

# Set antenna indices
print('''Setting the antenna indices...'''),
ant = 0
for b in bees:
    for f in fpgas:
        if (b.write('base_ant', ant, fpgas=[f])[f]['status'] != 'SUCCESS'):
            print('''Failed to program ''' + f + ''' on ''' + servers[bees.index(b)])     
        ant += num_xengines_per_fpga
print ('''done''')

# Set UDP TX data port
print ('''Setting the UDP TX data port to %i'''%(data_port)),
print (check_result(write_all('gbe_port', data_port)))


# Set UDP TX/RX ip
print ('''Setting the 10GbE IP addresses...'''),
for b in bees:
    for f in fpgas:
        if (b.write('gbe_ip', gbe_ip, fpgas=[f])[f]['status'] != 'SUCCESS'):
            print('''Failed to program %s on %s''' %(f,servers[bees.index(b)]))     
        gbe_ip += 1
print ('''done''')

# Configure the 10 GbE data ports
print('''Configuring the 10GbE cores and verifying...'''),
fpga = 0
for b in bees:
    for f in fpgas:
        new_gbe_conf=get_gbe_conf(fpga)
        if (b.binary_write('gbe', new_gbe_conf, fpgas=[f])[f]['status'] != 'SUCCESS'):
            print('''Failed to program %s on %s''' %(f,servers[bees.index(b)]))     
        if (b.binary_read('gbe',num=-1)[f]['data'] != new_gbe_conf): 
            print('''Failed verification for %s on %s''' %(f,servers[bees.index(b)]))
        fpga += 1
print('ok')


print('''\nAll done with setup!''')

print('''\nVERIFYING THE SETUP...\n''')
time.sleep(2)
print('''Resetting error counters...'''),
print rst_cnt()
time.sleep(2)

print('''Checking that all XAUI links are working...'''),
bad_xauis = check_xaui_error()
if (bad_xauis != 0):
    print('%i bad XAUI links... ' %bad_xauis)
else:
    print('''ok''')


print('''Checking that all BEE FPGAs are sending 10GbE packets...'''),
firstpass_check = read_all('tx_cnt')
time.sleep(2)
secondpass_check = read_all('tx_cnt')
for b in enumerate(bees):
    for f in fpgas:
        if (secondpass_check[b[0]][f]['data'] <= firstpass_check[b[0]][f]['data']):
            print('FAILED!\n %s on %s is not sending any packets.' %(f,servers[b[0]]))
            print('Maybe a bad XAUI connection?')
            sys.exit()
print('''ok''')



print('''Checking that all BEE FPGAs are receiving 10GbE packets...'''),
firstpass_check = read_all('gbe_rx_cnt')
time.sleep(2)
secondpass_check = read_all('gbe_rx_cnt')
for b in enumerate(bees):
    for f in fpgas:
        if (secondpass_check[b[0]][f]['data'] <= firstpass_check[b[0]][f]['data']):
            print('FAILED!\n %s on %s is not receiving any packets''' %(f,servers[b[0]]))
            sys.exit()
print('''ok''')

print '''Checking that all X engines are receiving all their packets...''',
rst_cnt()
time.sleep(1)

monitor()
