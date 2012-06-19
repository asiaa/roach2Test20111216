#!/usr/bin/env python
'''
This script demonstrates programming an FPGA, configuring a wideband spectrometer and plotting the received data using the Python KATCP library along with the katcp_wrapper distributed in the corr package. Designed for use with TUT3 at the 2009 CASPER workshop.\n

You need to have KATCP and CORR installed. Get them from http://pypi.python.org/pypi/katcp and http://casper.berkeley.edu/svn/trunk/projects/packetized_correlator/corr-0.4.0/

Modified for 5G spectrometer. 2010-03-26
Added DDR 2010-04-14 homin
The model file largely copied from r_spec_2048_r102 which is different with r_spec_2048_r103 
For debug purpose. Model file : tb_5g_spi_rw2.  homin

\nAuthor: Jason Manley, November 2009.

This program is mainly for low level debugging. printing raw ADC data. Push the 5G adc to its max. freq.

'''

#TODO: add support for ADC histogram plotting.
#TODO: add support for determining ADC input level 

import corr,time,numpy,struct,sys,logging,pylab
import ctypes

#bitstream = 'tb_adc_5g_spi_V3_All_OK.bof'
#bitstream = 'tb_adc_5g_spi_V3_2010_Apr_30_450MHz.bof' # adc clock 450MHz
#bitstream = 'tb_adc_5g_spi_V3_2010_Apr_30_400MHz.bof'
bitstream = 'tb_adc_5g_spi_V5_2010_May_17_2clk.bof' # clock domain crossing
#bitstream = 'tb_adc_5g_spi_V5_2010_May_17_BUFR.bof'
#bitstream = 'tb_adc_5g_spi_V5_2010_May_21_1332.bof'  # 
#bitstream = 'tb_adc_5g_spi_V5_2010_May_24_BUFG.bof' # global clock
#bitstream = 'tb_adc_5g_spi_V5_2010_May_25_fifo256.bof' # global clock, FIFO depth 256
#bitstream = 'tb_adc_5g_spi_V5_2010_May_26_latch.bof' # global clock, fifo write only after FIFO empty until full
bitstream = 'tb_adc_5g_spi_V5_2010_May_27_IDDR2clk.bof' # global clock, fifo write only after FIFO empty until full,IDDR_2CLK


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

    fpga.write_int('snap64_ctrl',0)

#    hi_bram = dict;
#    lo_bram = dict;

#    hi_bram[2048*4] = 	fpga.read('snap64_bram_msb',2048*4)
#    lo_bram[2048*4] = 	fpga.read('snap64_bram_msb',2048*4)

	
    a_0=struct.unpack('>1024i',fpga.read('snap64_bram_msb',1024*4,0))
    a_1=struct.unpack('>1024i',fpga.read('snap64_bram_lsb',1024*4,0))

#    a_0=struct.unpack('>2048l',fpga.read('snap64_bram_msb',2048*4,0))
#    a_1=struct.unpack('>2048l',fpga.read('snap64_bram_lsb',2048*4,0))

    fpga.write_int('snap64_ctrl',1)

 
    interleave_a=[]	
 
	 
    for i in range(1024):
	bytei0 = a_0[i] / 0x1000000
	bytei1 = (a_0[i] / 0x10000) % 0x100
	bytei2 = (a_0[i] % 0x10000) / 0x100
	bytei3 = a_0[i] % 0x100

	byteq0 = a_1[i] / 0x1000000
	byteq1 = (a_1[i] / 0x10000) % 0x100
	byteq2 = (a_1[i] % 0x10000) / 0x100
	byteq3 = a_1[i] % 0x100

#	bytei0 = ctypes.c_uint8(bytei0).value
#	bytei1 = ctypes.c_uint8(bytei1).value
#	bytei2 = ctypes.c_uint8(bytei2).value
#	bytei3 = ctypes.c_uint8(bytei3).value

#	byteq0 = ctypes.c_uint8(byteq0).value
#	byteq1 = ctypes.c_uint8(byteq1).value
#	byteq2 = ctypes.c_uint8(byteq2).value
#	byteq3 = ctypes.c_uint8(byteq3).value

	bytei0 = ctypes.c_int8(bytei0).value
	bytei1 = ctypes.c_int8(bytei1).value
	bytei2 = ctypes.c_int8(bytei2).value
	bytei3 = ctypes.c_int8(bytei3).value

	byteq0 = ctypes.c_int8(byteq0).value
	byteq1 = ctypes.c_int8(byteq1).value
	byteq2 = ctypes.c_int8(byteq2).value
	byteq3 = ctypes.c_int8(byteq3).value
#
#
	print '%u %u %u %u %u %u %u %u' %(bytei0,bytei1,bytei2,bytei3,byteq0,byteq1,byteq2,byteq3)

# 	interleave_a.append(a_0[i])
#	interleave_a.append(a_1[i])
	offset = 0
	interleave_a.append(bytei0-offset)
	interleave_a.append(bytei1-offset)
	interleave_a.append(bytei2-offset)
	interleave_a.append(bytei3-offset)
	interleave_a.append(byteq0-offset)
	interleave_a.append(byteq1-offset)
	interleave_a.append(byteq2-offset)
	interleave_a.append(byteq3-offset)

#    print '--------------------------'
#    print interleave_a

    pylab.figure(num=1,figsize=(10,10))
    pylab.ioff()
   
    #pylab.semilogy(interleave_a)
    pylab.plot(interleave_a)
#    pylab.title('Integration number %i.'%prev_integration)
    pylab.ylabel('Count (8 bit)')
    pylab.grid()
    pylab.xlabel('sample')
#    pylab.xlim(0,1024)
    pylab.xlim(0,128)
    pylab.ylim(-128,128) # 8 bits resolution
#    pylab.xlim(0,4096)

    pylab.ioff()

    pylab.hold(False)
    pylab.show()
    pylab.draw()
    
#START OF MAIN:

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('5gADC.py <ROACH_HOSTNAME_or_IP> [options]')
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
    fpga.write_int('snap64_ctrl',1)
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
        time.sleep(2)
#        print 'Grabbing integration number %i'%prev_integration
        plot_spectrum()
        fname ='./data/20100517/5gADC_20100517_15G_L%d'%cnt_plot
        pylab.title('ADC Clock=1500MHz Clock Domain Crossing %i.'%cnt_plot)
#        pylab.savefig(fname)
        cnt_plot = cnt_plot + 1
	#    time.sleep(0.5)
except KeyboardInterrupt:
    exit_clean()
except:
    exit_fail()

exit_clean()

