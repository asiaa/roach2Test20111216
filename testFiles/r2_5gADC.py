#!/usr/bin/env python
'''

This program is mainly for testing.

'''

#TODO: add support for ADC histogram plotting.
#TODO: add support for determining ADC input level 

import corr,time,numpy,struct,sys,pylab,logging,binstr
import ctypes
from matplotlib import *
from pylab import *

bitstream = 'adc5g_r2_char_b02_2011_Dec_2500M.bof' 
#bitstream = 'r2_5g_f01_2011_Dec_13_2057.bof' # spectrum + adc snap

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
#    fpga.write_int('snap_adc0_ctrl',0)
    fpga.write_int('snapshot0_ctrl',0)
	
#    a_0=struct.unpack('>4096I',fpga.read('snap_adc0_bram',4096*4,0))
    a_0=struct.unpack('>4096I',fpga.read('snapshot0_bram',4096*4,0))
#   a_1=struct.unpack('>1024I',fpga.read('snapshot0_bram',1024*4,0))
#    fpga.write_int('snap_adc0_ctrl',1)
    fpga.write_int('snapshot0_ctrl',1)
    print a_0
    noise=[]
    interleave_a=[]
	 
#    for i in range(1024):
    for i in range(4096):

	bytei0 = a_0[i] / 0x1000000
	bytei1 = (a_0[i] / 0x10000) % 0x100
	bytei2 = (a_0[i] % 0x10000) / 0x100
	bytei3 = a_0[i] % 0x100

#	byteq0 = a_1[i] / 0x1000000
#	byteq1 = (a_1[i] / 0x10000) % 0x100
#	byteq2 = (a_1[i] % 0x10000) / 0x100
#	byteq3 = a_1[i] % 0x100


	bytei0 = ctypes.c_uint8(bytei0).value
	bytei1 = ctypes.c_uint8(bytei1).value
	bytei2 = ctypes.c_uint8(bytei2).value
	bytei3 = ctypes.c_uint8(bytei3).value

#	byteq0 = ctypes.c_int8(byteq0).value
#	byteq1 = ctypes.c_int8(byteq1).value
#	byteq2 = ctypes.c_int8(byteq2).value
#	byteq3 = ctypes.c_int8(byteq3).value
#

	print '%u %u %u %u' %(bytei0,bytei1,bytei2,bytei3)

#	interleave_a.append(bytei0)
#	interleave_a.append(bytei1)
#	interleave_a.append(bytei2)
#	interleave_a.append(bytei3)
#	interleave_a.append(a_0[i])
#	interleave_a.append(a_1[i])
	offset = 128
	noise.append(bytei0-offset)
	noise.append(bytei1-offset)
	noise.append(bytei2-offset)
	noise.append(bytei3-offset)

#	interleave_a.append(byteq0-offset)
#	interleave_a.append(byteq1-offset)
#	interleave_a.append(byteq2-offset)
#	interleave_a.append(byteq3-offset)

    datafile_c0=open('datafile.txt','w')
#    datafile_c0.write(str(noise)+'\n')
#    datafile_c0.write(str(interleave_a)+'\n')
    datafile_c0.close()


#    print '--------------------------'
#    print interleave_a

    pylab.figure(num=1,figsize=(10,10))
    pylab.ioff()

    pylab.plot(noise)
#    pylab.title('noise')
    pylab.grid()
    pylab.xlim(0,128*8)
    pylab.ylim(-128,128)

#    pylab.ioff()

#    pylab.hold(False)
    pylab.show()
#    pylab.draw()

####################### plot spectrum ##############################
    NFFT = len(noise)
    clockFreq = 2500
    print "length of file = %i"%NFFT

    spec_cmplex=fft(noise,NFFT)
    print spec_cmplex
    spec_pwr = abs(spec_cmplex[1:NFFT/2+1])
    spec_log = 10*log10(spec_pwr)
    print spec_log

    f=linspace(0.0,clockFreq,NFFT/2+1)
    spec_range = f[1:NFFT/2+1]

    pylab.figure(num=2,figsize=(10,10))
    plot(spec_range,spec_log)
    
    xlim(0,clockFreq)
    ylim(0,50)
    title('5G ADC dmux1:1 Clock= %i MHz'%clockFreq)
    xlabel('Frequency(MHz)')
    ylabel('Power(dB)')
    grid()
    ioff()
    show()

#START OF MAIN:

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('adctest_test1.py <ROACH_HOSTNAME_or_IP> [options]')
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

#    print 'Configuring accumulation period...',
#    fpga.write_int('acc_len',opts.acc_len)
#    print 'done'

#    print 'Configuring SPI...',
#    fpga.write_int('spi_data_pr',0x810308)
#    fpga.write_int('spi_data_pr',0x810348)
# demc 1:1 only work at clock slower than 400M
#    fpga.write_int('spi_cs_pr',0xffffff)
#    fpga.write_int('en',0xff)

#    print 'done'
#    time.sleep(1)

#    print 'Resetting counters...',
#    fpga.write_int('cnt_rst',1) 
#    fpga.write_int('cnt_rst',0) 
#    print 'done'

    print 'Enabling write to Vacc ...',
#    fpga.write_int('snap_adc0_ctrl',1)
    fpga.write_int('snapshot0_ctrl',1)
#    fpga.write_int('snap_vacc0_ctrl',0)


    print 'done'

#    fpga.write_int('cnt_rst',0) 
#    print 'done'


#    print 'Setting digital gain of all channels to %i...'%opts.gain,
#    if not opts.skip:
#        fpga.write_int('quant0_gain',opts.gain) #write the same gain for # all inputs, all channels
#        print 'done'
#    else:   
#        print 'Skipped.'

    time.sleep(2)

#    prev_integration = fpga.read_uint('acc_cnt')
    cnt_plot =0
    while(1):
        time.sleep(1)
#        print 'Grabbing integration number %i'%prev_integration
        plot_spectrum()
        fname ='./data/20100517/5gADC_20100517_15G_L%d'%cnt_plot
        pylab.title('ADC Clock=2500MHz Roach2 %i'%cnt_plot)
#        pylab.savefig(fname)
        cnt_plot = cnt_plot + 1
	#    time.sleep(0.5)
except KeyboardInterrupt:
    exit_clean()
except:
    exit_fail()

exit_clean()


