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

#bitstream = 'tb_adc_5g_spi_V5_2010_May_26_latch.bof' # global clock, fifo write only after FIFO empty until full
#bitstream = 'tb_adc_5g_spi_V5_2010_May_27_IDDR2clk.bof' # global clock, fifo write only after FIFO empty until full,IDDR_2CLK
#bitstream = 'tb_adc_5g_D2_2010_Jul_30_1404.bof'  # dmux 1:2
#bitstream = 'tb_adc_5g_D2_2010_Aug_02_1538.bof'  # dmux 1:2
#bitstream = 'tb_adc_5g_D3_2010_Aug_06_1352.bof' 
bitstream = 'tb_adc_5g_D3_2010_Aug_11_1112.bof' 
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

def int4(a):
    if ( a == 0x00):
	return 0
    if (a == 0x01):
   	return  1
    if (a == 0x02):
   	return 2
    if (a == 0x03):
   	return 3
    if (a == 0x04):
   	return 4
    if (a == 0x05):
   	return 5
    if (a == 0x06):
   	return 6
    if (a == 0x07):
   	return  7
    if (a == 0x08):
   	return -8
    if (a == 0x09):
   	return -7
    if (a == 0x0a):
   	return -6
    if (a == 0x0b):
   	return -5
    if (a == 0x0c):
   	return -4
    if (a == 0x0d):
   	return -3
    if (a == 0x0e):
   	return -2
    if (a == 0x0f):
   	return -1

		
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
	bytei0 = a_0[i] & 0x0000000f

	bytei1 = a_0[i] & 0x000000f0
	bytei1 = bytei1 >> 4;

	bytei2 = a_0[i] & 0x00000f00
	bytei2 = bytei2 >> 8;

	bytei3 = a_0[i] & 0x0000f000
	bytei3 = bytei3 >> 12;

	bytei4 = a_0[i] & 0x000f0000
	bytei4 = bytei4 >> 16;

	bytei5 = a_0[i] & 0x00f00000
	bytei5 = bytei5 >> 20;

	bytei6 = a_0[i] & 0x0f000000
	bytei6 = bytei6 >> 24;

	bytei7 =a_0[i] & 0xf0000000
	bytei7 = bytei7 >> 28;

#### lsb
	byteq0 = a_1[i] & 0x0000000f

	byteq1 = a_1[i] & 0x000000f0
	byteq1 = byteq1 >> 4;

	byteq2 = a_1[i] & 0x00000f00
	byteq2 = byteq2 >> 8;

	byteq3 = a_1[i] & 0x0000f000
	byteq3 = byteq3 >> 12;

	byteq4 = a_1[i] & 0x000f0000
	byteq4 = byteq4 >> 16;

	byteq5 = a_1[i] & 0x00f00000
	byteq5 = byteq5 >> 20;

	byteq6 = a_1[i] & 0x0f000000
	byteq6 = byteq6 >> 24;

	byteq7 =a_1[i] & 0xf0000000
	byteq7 = byteq7 >> 28;

#
#	print '%u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u'%(bytei0,bytei1,bytei2,bytei3, bytei4,bytei5,bytei6,bytei7,byteq0,byteq1,byteq2,byteq3,byteq4,byteq5,byteq6,byteq7)


#	bytei2 = (a_0[i] / 0x10000) % 0x100
#	bytei4 = (a_0[i] % 0x10000) / 0x100
#	bytei6 = a_0[i] % 0x100

#	byteq0 = a_1[i] / 0x1000000
#	byteq1 = (a_1[i] / 0x10000) % 0x100
#	byteq2 = (a_1[i] % 0x10000) / 0x100
#	byteq3 = a_1[i] % 0x100

#	bytei0 = ctypes.c_uint8(bytei0).value
#	bytei1 = ctypes.c_uint8(bytei1).value
#	bytei2 = ctypes.c_uint8(bytei2).value
#	bytei3 = ctypes.c_uint8(bytei3).value

#	byteq0 = ctypes.c_uint8(byteq0).value
#	byteq1 = ctypes.c_uint8(byteq1).value
#	byteq2 = ctypes.c_uint8(byteq2).value
#	byteq3 = ctypes.c_uint8(byteq3).value


	bytei0 = int4(bytei0)
	bytei1 = int4(bytei1)
	bytei2 = int4(bytei2)
	bytei3 = int4(bytei3)
	bytei4 = int4(bytei4)
	bytei5 = int4(bytei5)
	bytei6 = int4(bytei6)
	bytei7 = int4(bytei7)

	byteq0 = int4(byteq0)
	byteq1 = int4(byteq1)
	byteq2 = int4(byteq2)
	byteq3 = int4(byteq3)
	byteq4 = int4(byteq4)
	byteq5 = int4(byteq5)
	byteq6 = int4(byteq6)
	byteq7 = int4(byteq7)



	bytei0 = ctypes.c_int8(bytei0).value
	bytei1 = ctypes.c_int8(bytei1).value
	bytei2 = ctypes.c_int8(bytei2).value
	bytei3 = ctypes.c_int8(bytei3).value
	bytei4 = ctypes.c_int8(bytei4).value
	bytei5 = ctypes.c_int8(bytei5).value
	bytei6 = ctypes.c_int8(bytei6).value
	bytei7 = ctypes.c_int8(bytei7).value

	byteq0 = ctypes.c_int8(byteq0).value
	byteq1 = ctypes.c_int8(byteq1).value
	byteq2 = ctypes.c_int8(byteq2).value
	byteq3 = ctypes.c_int8(byteq3).value
	byteq4 = ctypes.c_int8(byteq4).value
	byteq5 = ctypes.c_int8(byteq5).value
	byteq6 = ctypes.c_int8(byteq6).value
	byteq7 = ctypes.c_int8(byteq7).value


#	print '%u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u'%(bytei7,bytei3,byteq7,byteq3, bytei5,bytei1,byteq5,byteq1,bytei6,bytei2,byteq6,byteq2,bytei4,bytei0,byteq4,byteq0)


#	print '%u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u'%(byteq0,byteq1,byteq2,byteq3,byteq4,byteq5,byteq6,byteq7,bytei0,bytei1,bytei2,bytei3,bytei6,bytei7, bytei4,bytei5)



# 	interleave_a.append(a_0[i])
#	interleave_a.append(a_1[i])
	offset = 0


# The following swappings would be caused by the reading order of computer. The hardware output is in the order of i0 to i7(high byte) then q0 to q7(low byte)



	interleave_a.append(bytei0-offset)
	interleave_a.append(bytei1-offset)

	interleave_a.append(bytei2-offset)
	interleave_a.append(bytei3-offset)


	interleave_a.append(bytei4-offset)
	interleave_a.append(bytei5-offset)

	interleave_a.append(bytei6-offset)
	interleave_a.append(bytei7-offset)


	interleave_a.append(byteq0-offset)
	interleave_a.append(byteq1-offset)

	interleave_a.append(byteq2-offset)
	interleave_a.append(byteq3-offset)

	interleave_a.append(byteq4-offset)
	interleave_a.append(byteq5-offset)

	interleave_a.append(byteq6-offset)
	interleave_a.append(byteq7-offset)

#	interleave_a.append(byteq2-offset)
#	interleave_a.append(byteq3-offset)

#	interleave_a.append(byteq0-offset)
#	interleave_a.append(byteq1-offset)

#	interleave_a.append(byteq6-offset)
#	interleave_a.append(byteq7-offset)

#	interleave_a.append(byteq4-offset)
#	interleave_a.append(byteq5-offset)

#	interleave_a.append(bytei2-offset)
#	interleave_a.append(bytei3-offset)

#	interleave_a.append(bytei0-offset)
#	interleave_a.append(bytei1-offset)

#	interleave_a.append(bytei6-offset)
#	interleave_a.append(bytei7-offset)

#	interleave_a.append(bytei4-offset)
#	interleave_a.append(bytei5-offset)


#    print '-------------------------------------------'

#    print interleave_a

    pylab.figure(num=1,figsize=(10,10))
    pylab.ioff()
   
    #pylab.semilogy(interleave_a)
    pylab.plot(interleave_a)
#    pylab.title('Integration number %i.'%prev_integration)
    pylab.ylabel('Count (4 bit)')
    pylab.grid()
    pylab.xlabel('sample')
#   pylab.xlim(0,1024)
    pylab.xlim(0,128)
#    pylab.ylim(-128,128) # 8 bits resolution
    pylab.ylim(-8,8) # 4 bits resolution

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
        fname ='./data/dmux/20100805/5gADCdmux_20100805O%d'%cnt_plot
        pylab.title('ADC Clock=3000MHz, dmux 1:2 %i.'%cnt_plot)
        pylab.savefig(fname)
        cnt_plot = cnt_plot + 1
	time.sleep(2)

except KeyboardInterrupt:
    exit_clean()
except:
    exit_fail()

exit_clean()

