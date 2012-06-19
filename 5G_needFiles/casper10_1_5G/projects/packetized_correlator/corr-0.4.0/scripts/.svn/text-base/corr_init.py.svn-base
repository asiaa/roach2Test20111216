#! /usr/bin/env python
""" 
Script for initialising casper_n correlators. Requires X engine version 310 and F engine 303 or greater.\n
Can be left running (assuming sufficient bandwidth) and will continuously check that system is sync'd. will attempt recovery if sync is lost.\n\n

Author: Jason Manley\n
Revisions:\n
2009-12-02  JRM Re-enabled acc_len config.\n
2009-11-20: JRM Hardcoded 10GbE configuration call.\n
2009-11-10: JRM Added EQ config.\n
2009-07-02: JRM Switch to use corr_functions.\n
2009-06-15  JRM New 10GbE config scheme for ROACH.\n
2009-05-25  JRM Switched to KATCP.\n
2008-10-30  JRM Removed loopback flush since this has been fixed in hardware\n
2008-09-12  JRM Added support for different numbers of X and F engines\n
2008-02-20  JRM Now uses UDP borphserver\n
                New ibob address/data communication scheme\n
2008-02-14  JRM Fixed gbe_config for >1 BEE\n
2008-01-09  JRM DESIGNED FOR Cn rev 308b and upwards\n
                New loopback_mux flush\n
                Now grabs config settings from global corr.conf file \n
"""
import corr, time, sys, numpy, os, logging, katcp

def exit_fail():
    print 'FAILURE DETECTED. Log entries:\n',lh.printMessages()
    print "Unexpected error:", sys.exc_info()
    try:
        c.disconnect_all()
    except: pass
    #raise
    exit()

def exit_clean():
    try:
        c.disconnect_all()
    except: pass
    exit()

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('init_corr.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-m', '--monitor_only', dest='monitor_only', action='store_true', default=False, 
        help='Skip the initialision. ie Only monitor.')
    p.add_option('-r', '--n_retries', dest='n_retries', type='int', default=-1, 
        help='Number of times to try after an error before giving up. Set to -1 for infinity. Default: -1')
    p.add_option('-s', '--skip_prog', dest='prog_fpga',action='store_false', default=True, 
        help='Skip FPGA programming (assumes already programmed).  Default: program the FPGAs')
    p.add_option('-c', '--skip_core_init', dest='prog_10gbe_cores',action='store_false', default=True, 
        help='Skip configuring the 10GbE cores (ie starting tgtap drivers).  Default: start all drivers')
    p.add_option('-v', '--verbose', dest='verbose',action='store_true', default=False, 
        help='Be verbose about errors.')

    opts, args = p.parse_args(sys.argv[1:])

    if args==[]:
        print 'Please specify a configuration file! \nExiting.'
        exit()
    verbose=opts.verbose
    prog_fpga=opts.prog_fpga

lh=corr.log_handlers.DebugLogHandler()

try:
    print 'Connecting...',
    c=corr.corr_functions.Correlator(args[0],lh)
    for s,server in enumerate(c.config['servers']): c.loggers[s].setLevel(10)
    print 'done'

    if prog_fpga:
        print '''Clearing the FPGAs...''',
        sys.stdout.flush()
        c.deprog_all()
        print 'done.'

        # PROGRAM THE DEVICES
        print '''Programming the FPGAs with %s...'''%c.config['bitstream'],
        sys.stdout.flush()
        c.prog_all()
        print 'done.'
    else: print 'Skipped programming FPGAs.'

    # Disable 10GbE cores until the network's been setup and ARP tables have settled. Need to do a reset here too to flush buffers in the core.
    print('\nPausing 10GbE data exchange, resetting the 10GbE cores and clearing X engine TVGs...'),
    sys.stdout.flush()
    c.write_all_xeng_ctrl(gbe_disable=True, gbe_rst=True)
    print 'done.'

    if opts.prog_10gbe_cores:
        # Configure the 10 GbE cores and load tgtap drivers
        print('''Configuring the 10GbE cores...'''),
        sys.stdout.flush()
        c.config_roach_10gbe_ports()
        print 'done'

    # TURN OFF ANY TVGs
    print 'Clearing F engine TVG register...',
    sys.stdout.flush()
    c.write_all_feng_ctrl()
    print 'done'

    # ARM THE BEEs
    print '''Syncing the iBOBs, resetting F engine TVGs & setting FFT shift...''',
    sys.stdout.flush()
    print 'Armed. Expecting trigger at %s local.'%(time.strftime('%H:%M:%S',time.localtime(c.arm())))

    # Set the Accumulation Length (number of vectors to accumulate)
    int_time = float(c.config['n_chans'])*c.config['xeng_acc_len']*c.config['acc_len']/(c.config['adc_clk']*1000000000/c.config['ddc_decimation'])
    print ('''Setting the accumulation length to %i (%2.2f seconds)...'''%(c.config['acc_len'],int_time)),
    sys.stdout.flush()
    c.set_acc_len()
    print 'done'

    # Set antenna indices
    print('''Setting the antenna indices...'''),
    sys.stdout.flush()
    ant = 0
    for x in range(c.config['n_xaui_ports_per_fpga']):
        for f,fpga in enumerate(c.fpgas):
            fpga.write_int('base_ant%i'%x, ant)
            print('%i'%ant),
            sys.stdout.flush()
            ant += c.config['n_ants_per_xaui']
    print ('''done''')

    # Set UDP TX data port
    print ('''Setting the UDP TX data port to %i'''%(c.config['10gbe_port'])),
    sys.stdout.flush()
    c.write_int_all('gbe_port', c.config['10gbe_port'])
    print 'done'

    # Set UDP TX/RX ip
    print ('''Setting the 10GbE IP addresses...'''),
    sys.stdout.flush()
    for xaui in range(c.config['n_xaui_ports_per_fpga']):
        for f,fpga in enumerate(c.fpgas):
            ip = c.config['10gbe_ip'] + f + xaui*(len(c.fpgas))
            fpga.write_int('gbe_ip%i'%xaui, ip)
    print ('''done''')

    #print('''\nWaiting for ARP to complete...'''),
    #sys.stdout.flush()
    #time.sleep(15)
    #print '''done'''

    #print('Resetting 10GbE cores...'),
    #sys.stdout.flush()
    #c.write_all_xeng_ctrl(gbe_rst=True)
    #c.write_all_xeng_ctrl(gbe_rst=False)
    #print 'done.'

    # Disable 10GbE cores until the network's been setup and ARP tables have settled.
    print('Starting 10GbE data exchange...'),
    sys.stdout.flush()
    c.write_all_xeng_ctrl(gbe_disable=False)
    print 'done.'
    
    print('Configuring UDP output...'),
    sys.stdout.flush()
    c.config_udp_output()
    print 'done.'

    print 'Configuring EQ...',
    sys.stdout.flush()
    c.ibob_eq_init()
    print 'done'

    print('''\nWait for system to stabalise...'''),
    sys.stdout.flush()
    time.sleep(5)
    print '''done'''

    print('''Resetting error counters...'''),
    sys.stdout.flush()
    c.rst_cnt()
    print '''done'''

    print ('''\n All done with setup. Verifying correct operation...\n''')
    time.sleep(1)

#    print("""Checking that all XAUI links are working..."""),
#    if check_xaui_error(): print 'ok'
#    else: print ('FAILURES detected!')

#    print('''Checking that all BEE FPGAs are sending 10GbE packets...'''),
#    sys.stdout.flush()
#    if check_10gbe_tx(): print 'ok'
#    else: print ('FAILURES detected!')

#    print('''Checking that all BEE FPGAs are receiving 10GbE packets...'''),
#    sys.stdout.flush()
#    if check_10gbe_rx(): print 'ok'
#    else: print ('FAILURES detected!')

#    print '''Checking that all X engines are receiving all their packets...''',
#    sys.stdout.flush()
#    rst_cnt()
#    time.sleep(1)

#    monitor()
except KeyboardInterrupt:
    exit_clean()
except:
    exit_fail()
