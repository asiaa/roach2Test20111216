#!/usr/bin/env python

'''
Grabs the contents of "snap_xaui" for analysis.
Assumes the correlator is already initialsed and running etc.

'''
import corr.borph, time, numpy, pylab, struct

#defaults that will be used if not executed from the command line
servers = ['beesweet']
ctrl_port = 9999
fpgas = ['FPGA0','FPGA1','FPGA2','FPGA3']
brams=['bram_msb','bram_lsb','bram_oob']
dev_name = 'snap_xaui'
packet_len = 32 #packet length in 64 bit words
binary_point = 3
num_bits = 4

# OOB signalling bit allocations:
mrst_bit = 4
adc_bit = 3
eof_bit = 2
sync_bit = 1
hdr_bit = 0

if __name__ == '__main__':
    import sys
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('x_eng_snap.py [options] [servers]')
    p.set_description(__doc__)
    p.add_option('-t', '--man_trigger', dest='man_trigger', action='store_true',
        help='Trigger the snap block manually')   

    if not sys.argv[1:]:
        print 'No server specified. Please specify one.'
        exit()
    opts, args = p.parse_args(sys.argv[1:])
    servers = args

bees = [corr.borph.BorphClient(s, ctrl_port) for s in servers]

if opts.man_trigger:
    man_trigger = 2
else:
    man_trigger = 0
report = dict()
for server,b in enumerate(bees):
    print '------------------------'
    print 'Capturing on %s...'%s
    b.write(dev_name+'_ctrl',0)
    b.write(dev_name+'_ctrl',1+man_trigger)
    time.sleep(2)
    print ('Retrieving...')
    
    bram_dmp=dict()

    for bramindex in brams:
        bram_name = dev_name+'_'+bramindex
        print 'Reading bram %s'%bram_name
        bram_dmp[bramindex]=b.binary_read(bram_name,-1)
        if bram_dmp[bramindex][fpgas[0]]['status'] != 'SUCCESS':
            print 'Failed to read BRAM %s on %s'%(bram_name,server)
            exit(0)

    print 'Unpacking bram contents...',
    sys.stdout.flush()
    bram_oob=dict()
    for f in fpgas:
        bram_oob[f]=dict()
   
        for i in range(0,len(bram_dmp[brams[0]][fpgas[0]]['data'])/4):
            bram_oob[f].update({i:{'raw':struct.unpack('>L',bram_dmp['bram_oob'][f]['data'][(4*i):(4*i)+4])[0]}})
            bram_oob[f][i].update({'mrst':bool(bram_oob[f][i]['raw'] & (2**mrst_bit))})
            bram_oob[f][i].update({'adc':bool(bram_oob[f][i]['raw'] & (2**adc_bit))})
            bram_oob[f][i].update({'eof':bool(bram_oob[f][i]['raw'] & (2**eof_bit))})
            bram_oob[f][i].update({'sync':bool(bram_oob[f][i]['raw'] & (2**sync_bit))})
            bram_oob[f][i].update({'hdr':bool(bram_oob[f][i]['raw'] & (2**hdr_bit))})
    print 'Done unpacking.'
    
#    print 'Printing:'
#    for f in fpgas:
#        for i in range(0,len(bram_data['FPGA0'])):
#            print '%s, index %i, value %#X'%(f,i,bram_data[f][i])


    print 'Analysing packets:'
    report[server]=dict()
    for fn,f in enumerate(['FPGA0']):
        report[server][f]=dict()
        report[server][f]['pkt_total']=0
        pkt_len = 0
        pkt_mcnt = 0
        pkt_ant = 99
        for i in range(0,len(bram_dmp[brams[0]][fpgas[0]]['data'])/4):
            if bram_oob[f][i]['adc']:
                adc_amps = struct.unpack('>HHHH',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])
                print '[%s]: ADC amplitude update at index %i: '%(f,i),adc_amps
            elif bram_oob[f][i]['hdr']:
                pkt_len = 0
                pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])[0]
                pkt_mcnt =(pkt_64bit&((2**64)-(2**16)))>>16 
                pkt_ant = pkt_64bit&((2**16)-1)
#                print ('HEADER RECEIVED')
            elif bram_oob[f][i]['eof']:
                pkt_len += 1

                sum_polQ_r = 0
                sum_polQ_i = 0
                sum_polI_r = 0
                sum_polI_i = 0

                for pkt_index in range(0,pkt_len):
                    abs_index = i + pkt_index - pkt_len+1
                    pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*abs_index):(4*abs_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*abs_index):(4*abs_index)+4])[0]
#                    print 'index: %2i, value %016X'%(pkt_index, pkt_64bit)
                    for offset in range(0,64,16):
                        polQ_r = (pkt_64bit & ((2**(offset+16)) - (2**(offset+12))))>>(offset+12)
                        polQ_i = (pkt_64bit & ((2**(offset+12)) - (2**(offset+8))))>>(offset+8)
                        polI_r = (pkt_64bit & ((2**(offset+8)) - (2**(offset+4))))>>(offset+4)
                        polI_i = (pkt_64bit & ((2**(offset+4)) - (2**(offset))))>>offset

                        sum_polQ_r += (float(((numpy.int8(polQ_r << 4)>> 4)))/(2**binary_point))**2
                        sum_polQ_i += (float(((numpy.int8(polQ_i << 4)>> 4)))/(2**binary_point))**2
                        sum_polI_r += (float(((numpy.int8(polI_r << 4)>> 4)))/(2**binary_point))**2
                        sum_polI_i += (float(((numpy.int8(polI_i << 4)>> 4)))/(2**binary_point))**2

                num_accs = pkt_len*(64/16)

                level_polQ_r = numpy.sqrt(float(sum_polQ_r)/ num_accs) 
                level_polQ_i = numpy.sqrt(float(sum_polQ_i)/ num_accs) 
                level_polI_r = numpy.sqrt(float(sum_polI_r)/ num_accs) 
                level_polI_i = numpy.sqrt(float(sum_polI_i)/ num_accs) 

                

                if level_polQ_r < 1.0/(2**num_bits):
                    ave_bits_used_Q_r = 0
                else:
                    ave_bits_used_Q_r = numpy.log2(level_polQ_r*(2**binary_point))

                if level_polQ_i < 1.0/(2**num_bits):
                    ave_bits_used_Q_i = 0
                else:
                    ave_bits_used_Q_i = numpy.log2(level_polQ_i*(2**binary_point))

                if level_polQ_r < 1.0/(2**num_bits):
                    ave_bits_used_I_r = 0
                else:
                    ave_bits_used_I_r = numpy.log2(level_polI_r*(2**binary_point))

                if level_polI_i < 1.0/(2**num_bits):
                    ave_bits_used_I_i = 0
                else:
                    ave_bits_used_I_i = numpy.log2(level_polI_i*(2**binary_point))


                print '[%s @ Indx: %4i] MCNT %12u ANT: %1i LEN %2i. 4 bit: Qr: %1.2f (%2.1f bits) Qi: %1.2f (%2.1f bits) Ir %1.2f (%2.1f bits) Ii: %1.2f (%2.1f bits)'%(f,i,pkt_mcnt,pkt_ant,pkt_len,level_polQ_r,ave_bits_used_Q_r,level_polQ_i,ave_bits_used_Q_i,level_polI_r,ave_bits_used_I_r,level_polI_i,ave_bits_used_I_i)
                if not report[server][f].has_key(pkt_ant):
                    report[server][f][pkt_ant] = 1
                else: 
                    report[server][f][pkt_ant] +=1
                report[server][f]['pkt_total'] += 1
                pkt_len = 0
            else:
                pkt_len += 1

    print 'Done with %s.'%(servers[server])
    print '--------------------'

print '\n\nDone with all servers:' 

#for server,srvr in enumerate(servers):
#    print srvr + ':'
#    print '==============='
#    for f in fpgas:
#        print 'Total packets received: %i'%report[server][f]['pkt_total']
#        for ant in report[server][f].keys
#    
#    print report[s]
    
