#!/usr/bin/env python
'''
This script demonstrates programming an FPGA, configuring a wideband spectrometer and plotting the received data using the Python KATCP library along with the katcp_wrapper distributed in the corr package. Designed for use with TUT3 at the 2009 CASPER workshop.\n

You need to have KATCP and CORR installed. Get them from http://pypi.python.org/pypi/katcp and http://casper.berkeley.edu/svn/trunk/projects/packetized_correlator/corr-0.4.0/

Modified for 5G spectrometer. 2010-03-26
Added DDR 2010-04-14 homin
The model file largely copied from r_spec_2048_r102 which is different with r_spec_2048_r103 
2010-04-23 tested the model file which the spi control moved to verilog file
\nAuthor: Jason Manley, November 2009.
'''

#TODO: add support for ADC histogram plotting.
#TODO: add support for determining ADC input level 

import corr,time,numpy,struct,sys,logging,pylab

#bitstream = 'adc_5g_specV5LX_2010_May_28_IDDR2clk.bof' # global clock, clock domain crossing, FIFO latch. IDDR_2CLK, LX110
#bitstream = 'adc5gSpecD4_2010_Aug_05_8tap.bof' #dmux 1:2 
#bitstream = 'adc5gSpecD4_2010_Aug_05_4tap.bof' #dmux 1:2 
#bitstream = 'adc5gSpecD4_2010_Aug_06_1509.bof' # re-ordered
#bitstream = 'adc5gSpecD4_2010_Aug_10_8tap.bof' 
#bitstream = 'adc5g_r00_2011_Oct_20_1732.bof'                             # roach2 spectrum
bitstream = 'r2_5g_f00_2011_Dec_07_2104.bof'  # 1024 channels
bitstream = 'r2_5g_f01_2011_Dec_13_2057.bof'  # adc snap

katcp_port=7147

def exit_fail():
    print 'FAILURE DETECTED. Log entries:\n',lh.printMessages()
    try:
        fpga.stop()
    except: pass
    raise
    exit()

def exit_clean():
    try:
        fpga.stop()
    except: pass
    exit()

def plot_spectrum():
    #get the data...    

    fpga.write_int('snap_vacc0_ctrl',0)
    fpga.write_int('snap_vacc1_ctrl',0)
    fpga.write_int('snap_vacc2_ctrl',0)
    fpga.write_int('snap_vacc3_ctrl',0)
    fpga.write_int('snap_vacc4_ctrl',0)
    fpga.write_int('snap_vacc5_ctrl',0)
    fpga.write_int('snap_vacc6_ctrl',0)
    fpga.write_int('snap_vacc7_ctrl',0)

    a_0=struct.unpack('>1024l',fpga.read('snap_vacc0_bram',1024*4,0))
    a_1=struct.unpack('>1024l',fpga.read('snap_vacc1_bram',1024*4,0))
    a_2=struct.unpack('>1024l',fpga.read('snap_vacc2_bram',1024*4,0))
    a_3=struct.unpack('>1024l',fpga.read('snap_vacc3_bram',1024*4,0))
    a_4=struct.unpack('>1024l',fpga.read('snap_vacc4_bram',1024*4,0))
    a_5=struct.unpack('>1024l',fpga.read('snap_vacc5_bram',1024*4,0))
    a_6=struct.unpack('>1024l',fpga.read('snap_vacc6_bram',1024*4,0))
    a_7=struct.unpack('>1024l',fpga.read('snap_vacc7_bram',1024*4,0))

#    print 'a_0---------------------'
#    print a_0

#    print 'a_1---------------------'
#    print a_1


#    print 'a_2---------------------'
#    print a_2

#    print 'a_3---------------------'
#    print a_3

#    print 'a_4---------------------'
#    print a_4

#    print 'a_5---------------------'
#    print a_5


#    print 'a_6---------------------'
#    print a_6

#    print 'a_7---------------------'
#    print a_7

#    a_0=struct.unpack('>1024l',fpga.read('snap_fft0_bram',1024*4,0))
#    a_1=struct.unpack('>1024l',fpga.read('snap_fft1_bram',1024*4,0))

    fpga.write_int('snap_vacc0_ctrl',1)
    fpga.write_int('snap_vacc1_ctrl',1)
    fpga.write_int('snap_vacc2_ctrl',1)
    fpga.write_int('snap_vacc3_ctrl',1)
    fpga.write_int('snap_vacc4_ctrl',1)
    fpga.write_int('snap_vacc5_ctrl',1)
    fpga.write_int('snap_vacc6_ctrl',1)
    fpga.write_int('snap_vacc7_ctrl',1)

    interleave_a=[]	
    print'******************************** \n';
    for i in range(128):
#     for i in range(8):

        print'....'
	print a_0[i],a_1[i],a_2[i],a_3[i],a_4[i],a_5[i],a_6[i],a_7[i]

#    for i in range(8):
#        interleave_a.append(a_0[i]+a_1[i])
#        interleave_a.append(a_2[i]+a_3[i])
#        interleave_a.append(a_4[i]+a_5[i])
#        interleave_a.append(a_6[i]+a_7[i])



#    for i in [0,2,4,6]:
#     for i in range(8):
        interleave_a.append(a_0[i])
        interleave_a.append(a_1[i])
        interleave_a.append(a_2[i])
        interleave_a.append(a_3[i])
        interleave_a.append(a_4[i])
        interleave_a.append(a_5[i])
        interleave_a.append(a_6[i])
        interleave_a.append(a_7[i])

#    for i in [1,3,5,7]:

#        interleave_a.append(a_0[i])
#        interleave_a.append(a_1[i])
#        interleave_a.append(a_2[i])
#        interleave_a.append(a_3[i])
#        interleave_a.append(a_4[i])
#        interleave_a.append(a_5[i])
#        interleave_a.append(a_6[i])
#        interleave_a.append(a_7[i])

#    for i in range(8):

#        interleave_a.append(a_0[i]+a_0[i+2])
#        interleave_a.append(a_1[i]+a_1[i+2])
#        interleave_a.append(a_2[i]+a_2[i+2])
#        interleave_a.append(a_3[i]+a_3[i+2])
#        interleave_a.append(a_4[i]+a_4[i+2])
#        interleave_a.append(a_5[i]+a_5[i+2])
#        interleave_a.append(a_6[i]+a_6[i+2])
#        interleave_a.append(a_7[i]+a_7[i+2])






    pylab.figure(num=1,figsize=(10,10))
    pylab.ioff()
   
    pylab.semilogy(interleave_a)
#    pylab.plot(interleave_a)
#    pylab.title('Integration number %i.'%prev_integration)
    pylab.ylabel('Power (arbitrary units)')
    pylab.grid()
    pylab.xlabel('Channel')
#    pylab.xlim(0,63)
    pylab.xlim(0,1023)
#    pylab.xlim(0,4096*2)
    pylab.ioff()

    pylab.hold(False)
    pylab.show()
    pylab.draw()
    
#START OF MAIN:

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('spectrometer_5G.py <ROACH_HOSTNAME_or_IP> [options]')
    p.set_description(__doc__)
    p.add_option('-l', '--acc_len', dest='acc_len', type='int',default=2*(2**28)/2048,
        help='Set the number of vectors to accumulate between dumps. default is 2*(2^28)/2048, or just under 2 seconds.')
    p.add_option('-g', '--gain', dest='gain', type='int',default=0xffffffff,
        help='Set the digital gain (6bit quantisation scalar). Default is  0xffffffff (max), good for wideband noise. Set lower for CW tones.')
    p.add_option('-s', '--skip', dest='skip', action='store_true',
        help='Skip reprogramming the FPGA and configuring EQ.')
    opts, args = p.parse_args(sys.argv[1:])

    if args==[]:
        print 'Please specify a ROACH board. Run with the -h flag to see all options.\nExiting.'
        exit()
    else:
        roach = args[0]

try:
    loggers = []
    lh=corr.log_handlers.DebugLogHandler()
    logger = logging.getLogger(roach)
    logger.addHandler(lh)
    logger.setLevel(10)

    print('Connecting to server %s on port %i... '%(roach,katcp_port)),
    fpga = corr.katcp_wrapper.FpgaClient(roach, katcp_port, timeout=10,logger=logger)
    time.sleep(1)

    if fpga.is_connected():
        print 'ok\n'
    else:
        print 'ERROR connecting to server %s on port %i.\n'%(roach,katcp_port)
        exit_fail()

    print '------------------------'
    print 'Programming FPGA...',
    if not opts.skip:
        fpga.progdev(bitstream)
        print 'done'
    else:
        print 'Skipped.'

    print 'Configuring accumulation period...',
    fpga.write_int('acc_len',opts.acc_len)
    print 'done'

#    print 'done'
#    time.sleep(1)

    print 'Resetting counters...',
    fpga.write_int('cnt_rst',1) 
    fpga.write_int('cnt_rst',0) 
    print 'done'

    print 'Enabling write to Vacc ...',
    fpga.write_int('snap_vacc0_ctrl',1)
    fpga.write_int('snap_vacc1_ctrl',1)
    fpga.write_int('snap_vacc2_ctrl',1)
    fpga.write_int('snap_vacc3_ctrl',1)
    fpga.write_int('snap_vacc4_ctrl',1)
    fpga.write_int('snap_vacc5_ctrl',1)
    fpga.write_int('snap_vacc6_ctrl',1)
    fpga.write_int('snap_vacc7_ctrl',1)

    print 'done'

    fpga.write_int('cnt_rst',0) 
    print 'done'


#    print 'Setting digital gain of all channels to %i...'%opts.gain,
#    if not opts.skip:
#        fpga.write_int('quant0_gain',opts.gain) #write the same gain for # all inputs, all channels
#        print 'done'
#    else:   
#        print 'Skipped.'

#    time.sleep(2)

#    prev_integration = fpga.read_uint('acc_cnt')
    
    while(1):
#        current_integration = fpga.read_uint('acc_cnt')
#        diff=current_integration - prev_integration
#        if diff==0:
           fpga.write_int('cnt_rst',1) 
           time.sleep(0.01)
           fpga.write_int('cnt_rst',0) 	    
           time.sleep(1.0)
#        else:
#            if diff > 1:
#                print 'WARN: We lost %i integrations!'%(current_integration - prev_integration)
#            prev_integration = fpga.read_uint('acc_cnt')
#            print '2000MHz clock,64 channel,8 taps no. %i'%prev_integration
           plot_spectrum()
#	    fname ='./data/20100811/5gSpectum_20100811_%d'%current_integration
        #    pylab.savefig(fname)
	#    time.sleep(0.5)
except KeyboardInterrupt:
    exit_clean()
except:
    exit_fail()

exit_clean()

