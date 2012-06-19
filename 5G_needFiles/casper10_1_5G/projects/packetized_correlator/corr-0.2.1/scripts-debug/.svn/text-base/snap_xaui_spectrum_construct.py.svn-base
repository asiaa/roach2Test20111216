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
n_chans=2048
n_captures=20

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
    print 'Triggering Manually'
    man_trigger = 2
else:
    man_trigger = 0
    
report = dict()
snap_levels={}

for capture in range(n_captures):
    print '\n\nCapture number %i'%capture
    for server,b in enumerate(bees):
        print '========================'
        print 'Capturing on %s...'%s
        print '------------------------'
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
        
        print 'Analysing packets:'
        report[server]=dict()
        for fn,f in enumerate(fpgas):
            report[server][f]=dict()
            report[server][f]['pkt_total']=0
            pkt_len = 0
            pkt_mcnt = 0
            pkt_freq = 0
            pkt_ant = 0
            print f,
            for i in range(0,len(bram_dmp[brams[0]][fpgas[0]]['data'])/4):
                if bram_oob[f][i]['adc']:
                    adc_amps = struct.unpack('>HHHH',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])
                    print '[%s]: ADC amplitude update at index %i: '%(f,i),adc_amps
                elif bram_oob[f][i]['hdr']:
                    pkt_len = 0
                    pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])[0]
                    pkt_mcnt =(pkt_64bit&((2**64)-(2**16)))>>16 
                    pkt_ant = (pkt_64bit&((2**16)-1))+(fn*2)
                    pkt_freq = pkt_mcnt%n_chans
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

                    
                    if not snap_levels.has_key(pkt_ant):
                        snap_levels[pkt_ant]={'freq':[],'Q_r':[],'Q_i':[],'I_r':[],'I_i':[]}

                    snap_levels[pkt_ant]['freq'].extend([pkt_freq])
                    snap_levels[pkt_ant]['Q_r'].extend([level_polQ_r])
                    snap_levels[pkt_ant]['Q_i'].extend([level_polQ_i])
                    snap_levels[pkt_ant]['I_r'].extend([level_polI_r])
                    snap_levels[pkt_ant]['I_i'].extend([level_polI_i])

print '\n\nDone Capturing. Plotting...' 
ax=[i for i in snap_levels]
for ant in snap_levels:
    pylab.figure(ant)
    ax[ant]=pylab.subplot(411)
    pylab.title('"Q" input real')
    pylab.plot(snap_levels[ant]['freq'],snap_levels[ant]['Q_r'],'.',label='ant%i'%ant)
    pylab.ylim((0,1))
    pylab.xlim(0,n_chans)

    pylab.subplot(412,sharex=ax[ant])
    pylab.title('"Q" input imag')
    pylab.plot(snap_levels[ant]['freq'],snap_levels[ant]['Q_i'],'.',label='ant%i'%ant)
    pylab.ylim((0,1))
    pylab.xlim(0,n_chans)

    pylab.subplot(413,sharex=ax[ant])
    pylab.title('"I" input real')
    pylab.plot(snap_levels[ant]['freq'],snap_levels[ant]['I_r'],'.',label='ant%i'%ant)
    pylab.ylim((0,1))
    pylab.xlim(0,n_chans)

    pylab.subplot(414, sharex=ax[ant])
    pylab.title('"I" input imag')
    pylab.plot(snap_levels[ant]['freq'],snap_levels[ant]['I_i'],'.',label='ant%i'%ant)
    pylab.ylim((0,1))
    pylab.xlim(0,n_chans)

pylab.legend(loc='lower right')
pylab.show()

