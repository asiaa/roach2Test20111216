#!/usr/bin/env python

'''
Grabs the contents of "snap_xaui" for analysis.
Does not use the standard 'corr_functions' error checking.
Assumes 4 bit values for power calculations.
Assumes the correlator is already initialsed and running etc.

Author: Jason Manley
Date: 2009-07-01

Revisions:
2009-07-01: JRM Ported to use corr_functions connectivity
                Fixed number of bits calculation

'''
import corr, time, numpy, struct, sys, logging, stats

#brams
brams=['bram_msb','bram_lsb','bram_oob']
dev_name = 'snap_xaui0'

# OOB signalling bit allocations:
linkdn_bit = 8
mrst_bit = 4
adc_bit = 3
eof_bit = 2
sync_bit = 1
hdr_bit = 0

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


def feng_unpack(f,hdr_index,pkt_len,skip_indices):
    pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f][(4*hdr_index):(4*hdr_index)+4]+bram_dmp['bram_lsb'][f][(4*hdr_index):(4*hdr_index)+4])[0]
    pkt_mcnt =(pkt_64bit&((2**64)-(2**16)))>>16
    pkt_ant  = pkt_64bit&((2**16)-1)
    pkt_freq = pkt_mcnt%n_chans
    sum_polQ_r = 0
    sum_polQ_i = 0
    sum_polI_r = 0
    sum_polI_i = 0

    #average the packet contents - ignore first entry (header)
    for pkt_index in range(1,(pkt_len)):
        abs_index = hdr_index + pkt_index
        
        if skip_indices.count(abs_index)>0: 
            #print 'Skipped %i'%abs_index
            continue

        pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f][(4*abs_index):(4*abs_index)+4]+bram_dmp['bram_lsb'][f][(4*abs_index):(4*abs_index)+4])[0]


        for offset in range(0,64,16):
            polQ_r = (pkt_64bit & ((2**(offset+16)) - (2**(offset+12))))>>(offset+12)
            polQ_i = (pkt_64bit & ((2**(offset+12)) - (2**(offset+8))))>>(offset+8)
            polI_r = (pkt_64bit & ((2**(offset+8)) - (2**(offset+4))))>>(offset+4)
            polI_i = (pkt_64bit & ((2**(offset+4)) - (2**(offset))))>>offset

            #square each number and then sum it
            sum_polQ_r += (float(((numpy.int8(polQ_r << 4)>> 4)))/(2**binary_point))**2
            sum_polQ_i += (float(((numpy.int8(polQ_i << 4)>> 4)))/(2**binary_point))**2
            sum_polI_r += (float(((numpy.int8(polI_r << 4)>> 4)))/(2**binary_point))**2
            sum_polI_i += (float(((numpy.int8(polI_i << 4)>> 4)))/(2**binary_point))**2
        
        #print 'Processed %i. Sum Qr now %f...'%(abs_index, sum_polQ_r)

    num_accs = (pkt_len-len(skip_indices))*(64/16)

    level_polQ_r = numpy.sqrt(float(sum_polQ_r)/ num_accs)
    level_polQ_i = numpy.sqrt(float(sum_polQ_i)/ num_accs)
    level_polI_r = numpy.sqrt(float(sum_polI_r)/ num_accs)
    level_polI_i = numpy.sqrt(float(sum_polI_i)/ num_accs)

    rms_polQ = numpy.sqrt(((level_polQ_r)**2)  +  ((level_polQ_i)**2))
    rms_polI = numpy.sqrt(((level_polI_r)**2)  +  ((level_polI_i)**2))
        
    if level_polQ_r < 1.0/(2**num_bits):
        ave_bits_used_Q_r = 0
    else:
        ave_bits_used_Q_r = numpy.log2(level_polQ_r*(2**(num_bits)))

    if level_polQ_i < 1.0/(2**num_bits):
        ave_bits_used_Q_i = 0
    else:
        ave_bits_used_Q_i = numpy.log2(level_polQ_i*(2**(num_bits)))

    if level_polI_r < 1.0/(2**num_bits):
        ave_bits_used_I_r = 0
    else:
        ave_bits_used_I_r = numpy.log2(level_polI_r*(2**(num_bits)))

    if level_polI_i < 1.0/(2**num_bits):
        ave_bits_used_I_i = 0
    else:
        ave_bits_used_I_i = numpy.log2(level_polI_i*(2**(num_bits)))

    return {'pkt_mcnt': pkt_mcnt,\
            'pkt_ant':pkt_ant,\
            'pkt_freq':pkt_freq,\
            'rms_polQ':rms_polQ,\
            'rms_polI':rms_polI,\
            'level_polQ_r':level_polQ_r,\
            'level_polQ_i':level_polQ_i,\
            'level_polI_r':level_polI_r,\
            'level_polI_i':level_polI_i,\
            'ave_bits_used_Q_r':ave_bits_used_Q_r,\
            'ave_bits_used_Q_i':ave_bits_used_Q_i,\
            'ave_bits_used_I_r':ave_bits_used_I_r,\
            'ave_bits_used_I_i':ave_bits_used_I_i}
    

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('snap_xaui.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-t', '--man_trigger', dest='man_trigger', action='store_true',
        help='Trigger the snap block manually')   
    p.add_option('-v', '--verbose', dest='verbose', action='store_true',
        help='Print raw output.')  
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

    if num_bits != 4:
        print 'This script is only written to work with 4 bit quantised values.'
        exit()
    
    bram_dmp=c.snap_x(dev_name,brams,man_trig=man_trigger,wait_period=3,offset=0)
#    for f,fpga in enumerate(c.fpgas):
#        for b,bram in enumerate(brams):
#            print servers[f] + ': ' + bram + ': ',len(bram_dmp[brams[b]][f])
#    print 'BRAM DUMPS:',bram_dmp

    print 'Unpacking bram out of band contents...',
    sys.stdout.flush()
    bram_oob=dict()
    for f,server in enumerate(c.servers):
        if len(bram_dmp[brams[2]][f])<=4:
            print 'No data for X engine %s.'%server,
            bram_oob[f]={}
        else:
            if opts.verbose:
                print 'Got %i values from %s.'%(len(bram_dmp[brams[2]][f])/4,server),
            bram_oob[f]={'raw':struct.unpack('>%iL'%(len(bram_dmp[brams[2]][f])/4),bram_dmp[brams[2]][f])}
            #print bram_oob[f]['raw']
            bram_oob[f].update({'linkdn':[bool(i&(2**linkdn_bit)) for i in bram_oob[f]['raw']]})
            bram_oob[f].update({'mrst':[bool(i&(2**mrst_bit)) for i in bram_oob[f]['raw']]})
            bram_oob[f].update({'adc':[bool(i & (2**adc_bit)) for i in bram_oob[f]['raw']]})
            bram_oob[f].update({'eof':[bool(i & (2**eof_bit)) for i in bram_oob[f]['raw']]})
            bram_oob[f].update({'sync':[bool(i&(2**sync_bit)) for i in bram_oob[f]['raw']]})
            bram_oob[f].update({'hdr':[bool(i & (2**hdr_bit)) for i in bram_oob[f]['raw']]})
    print 'Done.'

    print 'Analysing packets...'

    skip_indices=[]
    for f,server in enumerate(c.servers):
        print c.servers[f] + ': '
        report.append(dict())
        report[f]['pkt_total']=0
        pkt_hdr_idx = -1
        for i in range(0,len(bram_dmp[brams[2]][f])/4):
            if opts.verbose:
                pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f][(4*i):(4*i)+4])[0]
                hdr_str = 'Link:%i, MRST:%i, ADC_amp:%i, EOF:%i, sync:%i, HDR:%i.'%(bram_oob[f]['linkdn'][i],bram_oob[f]['mrst'][i],bram_oob[f]['adc'][i],bram_oob[f]['eof'][i],bram_oob[f]['sync'][i],bram_oob[f]['hdr'][i])
                print '[%s @ %4i]: %016X %s'%(c.servers[f],i,pkt_64bit,hdr_str)

            if bram_oob[f]['linkdn'][i]:
                print '[%s] LINK DOWN AT %i'%(c.servers[f],i)

            elif bram_oob[f]['adc'][i]:
                adc,amp = struct.unpack('>II',bram_dmp['bram_msb'][f][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f][(4*i):(4*i)+4])
                print '[%s] ADC amplitude update at index %i for input %i with raw value 0x%08x. (average ADC number %3f)'%(c.servers[f],i,adc,amp,numpy.sqrt(float(amp)/adc_levels_acc_len))
                skip_indices.append(i)

            elif bram_oob[f]['hdr'][i]:
                pkt_hdr_idx = i
                #skip_indices records positions in table which are ADC updates and should not be counted towards standard data.
                skip_indices=[]
    #            print ('HEADER RECEIVED')

            elif bram_oob[f]['eof'][i]:
                #skip the first packet entry which has no header (snap block triggered on sync)
                if pkt_hdr_idx<0: continue
            
                pkt_len=i-pkt_hdr_idx+1
                feng_unpkd_pkt=feng_unpack(f,pkt_hdr_idx,pkt_len,skip_indices)

                print '[%s] [Pkt@ %4i Len: %2i]     (MCNT %12u ANT: %1i, Freq: %4i)    {4 bit: Qr: %1.2f (%2.1f bits) Qi: %1.2f (%2.1f bits) Ir %1.2f (%2.1f bits) Ii: %1.2f (%2.1f bits)}'%(c.servers[f],\
                    pkt_hdr_idx,\
                    pkt_len-len(skip_indices),\
                    feng_unpkd_pkt['pkt_mcnt'],\
                    feng_unpkd_pkt['pkt_ant'],\
                    feng_unpkd_pkt['pkt_mcnt']%n_chans,\
                    feng_unpkd_pkt['level_polQ_r'],\
                    feng_unpkd_pkt['ave_bits_used_Q_r'],\
                    feng_unpkd_pkt['level_polQ_i'],\
                    feng_unpkd_pkt['ave_bits_used_Q_i'],\
                    feng_unpkd_pkt['level_polI_r'],\
                    feng_unpkd_pkt['ave_bits_used_I_r'],\
                    feng_unpkd_pkt['level_polI_i'],\
                    feng_unpkd_pkt['ave_bits_used_I_i'])

            #packet_len is length of data, not including header
                if pkt_len-len(skip_indices) != (packet_len+1):
                    print 'MALFORMED PACKET! of length %i starting at index %i'%(pkt_len-len(skip_indices),i)
                    print 'len of skip_indices: %i:'%len(skip_indices),skip_indices
                    if not report[f].has_key('Malformed packets'):
                        report[f]['Malformed packets'] = 1
                    else: 
                        report[f]['Malformed packets'] +=1
                        
                if not report[f].has_key('pkt_ant_%i'%feng_unpkd_pkt['pkt_ant']):
                    report[f]['pkt_ant_%i'%feng_unpkd_pkt['pkt_ant']] = 1
                else: 
                    report[f]['pkt_ant_%i'%feng_unpkd_pkt['pkt_ant']] +=1
                report[f]['pkt_total'] += 1

    print '=========================='
    print '''Checking sync status... Note that this sync check only gaurantees that the F engines '''\
            '''are sync'd to within one sync pulse and not that the system is '''\
            '''actually in sync...'''
    print c.check_xaui_sync()
    print '=========================='


    print '\n\nDone with all servers.\nSummary:\n==========================' 

    for server,srvr in enumerate(c.servers):
        keys = report[server].keys()
        keys.sort()
        print '------------------------'
        print srvr
        print '------------------------'
        for key in keys:
            print key,': ',report[server][key]
    print '=========================='

except KeyboardInterrupt:
    exit_clean()
except:
    exit_fail()

exit_clean()

