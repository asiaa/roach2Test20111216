#!/usr/bin/env python

'''
\n\nNOT YET PORTED. UNTESTED AND INCOMPLETE.\n\n
Grabs the contents of "snap_xout1" (one per FPGA) at the output of the X eng
and prints any non-zero values.
Assumes the correlator is already initialsed and running etc.

'''

import corr, time, numpy, pylab, struct, sys, logging

#brams
brams=['bram']
dev_name = 'snap_xeng0'

def exit_fail():
    print 'FAILURE DETECTED. Log entries:\n',lh.printMessages()
    print "Unexpected error:", sys.exc_info()

    try:
        c.disconnect_all()
    except: pass
    raise
    exit()

def exit_clean():
    try:
        c.disconnect_all()
    except: pass
    exit()

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('snap_xeng_out.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-t', '--man_trigger', dest='man_trigger', action='store_true',
        help='Trigger the snap block manually')   
    p.add_option('-v', '--print_all', dest='print_all', action='store_true', 
        help='Print all the decoded results (be verbose).')
    p.add_option('-r', '--n_retries', dest='n_retries', type='int', default=-1,
        help='Number of times to try after an error before giving up. Set to -1 for infinity. Default: -1')
    opts, args = p.parse_args(sys.argv[1:])

    if args==[]:
        print 'Please specify a configuration file! \nExiting.'
        exit()

    n_retries = opts.n_retries
    if opts.man_trigger: man_trigger=True
    else: man_trigger=False

report=[]
lh=corr.log_handlers.DebugLogHandler()

try:
    print 'Parsing configuration file...',
    c=corr.corr_functions.Correlator(args[0],lh)
    for s,server in enumerate(c.config['servers']): c.loggers[s].setLevel(10)
    print 'done.'

    binary_point = c.config['feng_fix_pnt_pos']
    packet_len=c.config['10gbe_pkt_len']
    n_chans=c.config['n_chans']
    num_bits = c.config['feng_bits']
    adc_bits = c.config['adc_bits']
    adc_levels_acc_len = c.config['adc_levels_acc_len']
    x_per_fpga = c.config['x_per_fpga']
    n_ants = c.config['n_ants']
    n_stokes = c.config['n_stokes']
    xeng_acc_len = c.config['xeng_acc_len']
    n_bls = n_ants * (n_ants+1)/2

    report = dict()

    if num_bits !=4:
        print 'ERR: this script is only written to interpret 4 bit data. Your F engine outputs %i bits.'%num_bits
        exit_fail()
    if xeng_acc_len !=128:
        print 'ERR: this script is only written to interpret data from X engines with acc length of 128. Your X engine accumulates for %i samples.'%xeng_acc_len
        exit_fail()

    print '------------------------'
    print 'Triggering Capture...',
    sys.stdout.flush()
    bram_dmp=c.snap_x(dev_name,brams,man_trig=man_trigger,wait_period=3,offset=1024)
    print 'Done.'

    print 'Unpacking bram contents...',
   #hardcode unpack of 16 bit values. Assumes bitgrowth of log2(128)=7 bits and input of 4_3 * 4_3.
    sys.stdout.flush()
    bram_data=dict()
    for f,fpga in enumerate(c.fpgas):
        bram_data[f]=dict()
        unpack_length=(bram_dmp['lengths'][f])
        if unpack_length>0:
            for bram in brams:
                bram_data[f][bram]=struct.unpack('>%ii'%(unpack_length), bram_dmp[bram][f])
        else:
            print 'Got no data back for %s'%c.servers[f]
            for bram in brams:
                bram_data[f][bram]=[]
    print 'Done.'
    print '========================\n'

    print 'Interleaving data...',
    sys.stdout.flush()
    combined_data=[[] for f in c.fpgas]
    for f,fpga in enumerate(c.fpgas):
        for i in range(bram_dmp['lengths'][f]):
            for bram in brams:
                combined_data[f].append(bram_data[f][bram][i])
    print 'Done.'

    for f,fpga in enumerate(c.fpgas):
        print '--------------------'
        print '\nX engine %i'%(f*x_per_fpga)
        print '--------------------'
        for i in range(len(combined_data[f])/2):
            if (combined_data[f][2*i] != 0) or (combined_data[f][2*i+1] != 0) or (opts.print_all):
                bln=corr.sim_cn_data.bl2ij(corr.sim_cn_data.get_bl_order(n_ants)[((i/n_stokes)%n_bls)])
                print '[%s], %s, Index: %4i. Raw value (complex): 0x%05x and 0x%05x (%6i + %6ij). freq slice %4i. Stokes: %1i. BL='%(c.servers[f], bram, i, combined_data[f][i*2], combined_data[f][2*i+1],combined_data[f][i*2], combined_data[f][2*i+1],((i)/n_bls), i%n_stokes),bln
    print 'Done with %s, X engine %i'%(c.servers[f],f*x_per_fpga)
    print 'Done with all'

except KeyboardInterrupt:
    exit_clean()
except:
    exit_fail()

exit_clean()

