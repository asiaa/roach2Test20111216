#!/usr/bin/python

'''
Reads the values of the RMS amplitude accumulators on the ibob through the BEE's XAUI connection.
Requires F engine rev 302 or later and X engine rev 308 or later.

'''
import corr.borph, time, numpy, struct

#defaults that will be used if not executed from the command line
servers = ['beecourageous']
ctrl_port = 9999
fpgas = ['FPGA0','FPGA1','FPGA2','FPGA3']
dev_adc0 = 'adc0_pwr'
dev_adc1 = 'adc1_pwr'
#dev_adc0 = 'adc_pol01'
#dev_adc1 = 'adc_pol01'

binary_point=14
adc_num_bits = 8

if __name__ == '__main__':
    import sys
    servers = sys.argv[1:]
    if not servers:
        print 'Please specify the BEE board(s).'
        exit()

bees = [corr.borph.BorphClient(s, ctrl_port) for s in servers]

#clear the screen:
print '%c[2J'%chr(27)
while(1):
    for server,b in enumerate(bees):

        #get the data
        adc0 = b.binary_read(dev_adc0,4)
        adc1 = b.binary_read(dev_adc1,4)
        
        if adc0[fpgas[0]]['status'] != 'SUCCESS':
            print 'ERR reading ADC values for %s'%servers[server]
            sys.exit()

        #unpack the data
        adcs=dict()
        for nf,f in enumerate(fpgas):
            adcs[f]=dict()
            adcs[f]['adc_bot_I'],adcs[f]['adc_bot_Q'] = struct.unpack('>HH', adc0[f]['data'])
            adcs[f]['adc_top_I'],adcs[f]['adc_top_Q'] = struct.unpack('>HH', adc1[f]['data'])


        adc_rms=dict()
        adc_bits_used = dict()
        for f in fpgas:
            adc_rms[f] = dict()
            adc_bits_used[f] = dict()

        #calculate RMS values:
            adc_rms[f]['adc_top_I'] = numpy.sqrt(adcs[f]['adc_top_I']/(2.0**binary_point))
            adc_rms[f]['adc_top_Q'] = numpy.sqrt(adcs[f]['adc_top_Q']/(2.0**binary_point))
            adc_rms[f]['adc_bot_I'] = numpy.sqrt(adcs[f]['adc_bot_I']/(2.0**binary_point))
            adc_rms[f]['adc_bot_Q'] = numpy.sqrt(adcs[f]['adc_bot_Q']/(2.0**binary_point))

        #calculate bits used:
            if adcs[f]['adc_top_I'] == 0:
                adc_bits_used[f]['adc_top_I'] = 0        
            else:    
                adc_bits_used[f]['adc_top_I'] = (numpy.log2(adc_rms[f]['adc_top_I'] * (2**(adc_num_bits))))
            
            if adcs[f]['adc_top_Q'] == 0:
                adc_bits_used[f]['adc_top_Q'] = 0        
            else:    
                adc_bits_used[f]['adc_top_Q'] = (numpy.log2(adc_rms[f]['adc_top_Q'] * (2**(adc_num_bits))))

            if adcs[f]['adc_bot_I'] == 0:
                adc_bits_used[f]['adc_bot_I'] = 0        
            else:    
                adc_bits_used[f]['adc_bot_I'] = (numpy.log2(adc_rms[f]['adc_bot_I'] * (2**(adc_num_bits))))

            if adcs[f]['adc_bot_Q'] == 0:
                adc_bits_used[f]['adc_bot_Q'] = 0        
            else:    
                adc_bits_used[f]['adc_bot_Q'] = (numpy.log2(adc_rms[f]['adc_bot_Q'] * (2**(adc_num_bits))))

        #Move cursor home:
        print '%c[H'%chr(27)

        print 'ADC amplitudes for ibobs on %s'%servers[server]
        print '-----------------------------------------'
        for nf, f in enumerate(fpgas):
            print '%s ADC bottom I (ant %i%s): %.3f (%2.2f bits used)'%(f, nf*2+0, 'x', adc_rms[f]['adc_bot_I'],adc_bits_used[f]['adc_bot_I'])
            print '%s ADC bottom Q (ant %i%s): %.3f (%2.2f bits used)'%(f, nf*2+0, 'y', adc_rms[f]['adc_bot_Q'],adc_bits_used[f]['adc_bot_Q'])
            print '%s ADC top I    (ant %i%s): %.3f (%2.2f bits used)'%(f, nf*2+1, 'x', adc_rms[f]['adc_top_I'],adc_bits_used[f]['adc_top_I'])
            print '%s ADC top Q    (ant %i%s): %.3f (%2.2f bits used)'%(f, nf*2+1, 'y', adc_rms[f]['adc_top_Q'],adc_bits_used[f]['adc_top_Q'])
        time.sleep(1)
       
        print '--------------------'

print 'Done with all'
    
