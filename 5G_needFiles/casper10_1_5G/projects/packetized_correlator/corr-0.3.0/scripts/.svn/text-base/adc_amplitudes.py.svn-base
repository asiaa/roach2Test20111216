#!/usr/bin/env python

'''
Reads the values of the RMS amplitude accumulators on the ibob through the BEE's XAUI connection.
Requires F engine rev 302 or later and X engine rev 308 or later.

'''
import corr.borph, time, numpy, struct

pol_map={'I':'x','Q':'y'}
binary_point=14
adc_num_bits = 8

import corr, time, sys

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('adc_amplitudes.py [options] CONFIG FILE')
    p.set_description(__doc__)
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
fpgas = [corr.udp_client.UDPClient(s['server'], s['port']) for s in config['servers']]
servers = [s['server'] for s in config['servers']]
n_ants_per_xaui = config['n_ants_per_xaui']
n_xaui_ports_per_fpga = config['n_xaui_ports_per_fpga']

fpgas = [corr.udp_client.UDPClient(s['server'], s['port']) for s in config['servers']]

print('Using servers: '),
print(servers)

while(1):
    #get the data...    
    adcs=range(len(fpgas))
    for f,fpga in enumerate(fpgas):
        adcs[f]=range(n_xaui_ports_per_fpga)
        for x in range(n_xaui_ports_per_fpga):
            adcs[f][x]=range(n_ants_per_xaui)
            for a in range(n_ants_per_xaui):
                adcs[f][x][a] = fpga.read('adc%i_pwr%i'%(a,x),4)
                
                if (adcs[f][x][a]['status'] != 'SUCCESS'):
                    print 'ERR reading ADC%i on XAUI%i for %s'%(a,x,servers[f])
                    sys.exit()

    for f,fpga in enumerate(fpgas):
        for x in range(n_xaui_ports_per_fpga):
            for a in range(n_ants_per_xaui):
                #unpack the data
                adcs[f][x][a]['adc_I'],adcs[f][x][a]['adc_Q'] = struct.unpack('>HH', adcs[f][x][a]['data'])
                for p in ['I','Q']:
                    #calculate RMS values:
                    adcs[f][x][a]['adc_%s_rms'%(p)] = numpy.sqrt(adcs[f][x][a]['adc_%s'%(p)]/(2.0**binary_point))

                    #calculate bits used:
                    if adcs[f][x][a]['adc_%s'%(p)] == 0:
                        adcs[f][x][a]['adc_%s_bits_used'%(p)] = 0        
                    else:    
                        adcs[f][x][a]['adc_%s_bits_used'%(p)] = (numpy.log2(adcs[f][x][a]['adc_%s_rms'%(p)] * (2**(adc_num_bits))))
    

    #print the output                
    time.sleep(1)
    #Move cursor home:
    print '%c[H'%chr(27)
    #clear the screen:
    print '%c[2J'%chr(27)
    print 'IBOB: ADC0 is bottom (furthest from power port), ADC1 is top (closest to power port).'
    
    for x in range(n_xaui_ports_per_fpga):
        for f,fpga in enumerate(fpgas):
            print '''ADC amplitudes for F engine on %s's XAUI %i'''%(servers[f],x)
            print '------------------------------------------------'
            for a in range(n_ants_per_xaui):
                for p in ['I','Q']:
                    ant=a + n_ants_per_xaui*f + (n_ants_per_xaui*len(fpgas))*x
                    print 'ADC%i pol %s (ant %i%s): %.3f (%2.2f bits used)'%(a,p,ant,pol_map[p], adcs[f][x][a]['adc_%s_rms'%(p)],adcs[f][x][a]['adc_%s_bits_used'%(p)])
                   
            print '--------------------'

print 'Done with all'
    
