#!/usr/bin/env python

'''
Grabs the contents of "snap_xaui" for analysis.
Assumes 4 bit quantisation.
Assumes the correlator is already initialsed and running etc.

'''
import corr, time, numpy, struct, sys, stats

#brams
brams=['bram_msb','bram_lsb','bram_oob']
#dev_name = 'snap_xaui0'
dev_name = 'snap_xaui1'

# OOB signalling bit allocations:
linkdn_bit = 8
mrst_bit = 4
adc_bit = 3
eof_bit = 2
sync_bit = 1
hdr_bit = 0

n_ants_per_ibob=2

def write_int_all(register,value):
    """Writes to register on all fpgas. 
    Returns 'ok' or string outlining failure."""
    for f,fpga in enumerate(fpgas):
        out = fpga.write_int(register,value)
        if out['status'] != ('SUCCESS'):
            return('''Failed to program %s:%s-%s''' %(servers[f],out['status'],out['data']))
    return('''ok''')

def read_int_all(register):
    """Reads a value from register 'device' for all BEE FPGAs."""
    rv = [fpga.read_int(register) for fpga in fpgas]
#    for f,fpga in enumerate(fpgas):
#        rv.append(fpga.read_int(register))
    return rv

def read_all(register,bram_size):
    rv = [fpga.read(register,bram_size) for fpga in fpgas]
    return rv

def sync_check():
#    print 'Checking sync...'
    max_mcnt_difference=4
    mcnts=dict()
    mcnts_list=[]
    mcnt_tot=0

    for f,fpga in enumerate(fpgas):
        mcnts[f]=dict()
        try:
            hdr_index=bram_oob[f]['hdr'].index(1)
        except:
            print 'ERR: No headers found in BRAM. Are the F engines properly connected?'
            exit()

        pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*hdr_index):(4*hdr_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*hdr_index):(4*hdr_index)+4])[0]
        mcnts[f]['mcnt'] =(pkt_64bit&((2**64)-(2**16)))>>16
        mcnts_list.append(mcnts[f]['mcnt'])
#        print '[%s] MCNT: %i'%(servers[f],mcnts[f]['mcnt'])

    mcnts['mean']=stats.mean(mcnts_list)
    mcnts['median']=stats.median(mcnts_list)
    mcnts['mode']=stats.mode(mcnts_list)
    mcnts['modalmean']=stats.mean(mcnts['mode'][1])

#    print 'mean: %i, median: %i, modal mean: %i mode:'%(mcnts['mean'],mcnts['median'],mcnts['modalmean']),mcnts['mode']
    
    for f,fpga in enumerate(fpgas):
        if mcnts[f]['mcnt']>(mcnts['modalmean']+max_mcnt_difference) or mcnts[f]['mcnt'] < (mcnts['modalmean']-max_mcnt_difference):
            print '%s OUT OF SYNC!!'%servers[f]
            mcnts[f]['sync_status']='FAIL with error of %i'%(mcnts[f]['mcnt']-mcnts['modalmean'])
        else:
            mcnts[f]['sync_status']='PASS'

    return mcnts



def feng_unpack(f,hdr_index,pkt_len,skip_indices):
    pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*hdr_index):(4*hdr_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*hdr_index):(4*hdr_index)+4])[0]
    pkt_mcnt =(pkt_64bit&((2**64)-(2**16)))>>16
    pkt_ant = pkt_64bit&((2**16)-1)

    sum_polQ_r = 0
    sum_polQ_i = 0
    sum_polI_r = 0
    sum_polI_i = 0

    #average the packet contents - ignore first entry (header)
    for pkt_index in range(1,(pkt_len)+len(skip_indices)):
        abs_index = hdr_index + pkt_index
        pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*abs_index):(4*abs_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*abs_index):(4*abs_index)+4])[0]

        if skip_indices.count(abs_index)>0: 
            #print 'Skipped %i'%abs_index
            continue

        #print 'Processing %i'%abs_index

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

    num_accs = (pkt_len-1)*(64/16)

    level_polQ_r = numpy.sqrt(float(sum_polQ_r)/ num_accs)
    level_polQ_i = numpy.sqrt(float(sum_polQ_i)/ num_accs)
    level_polI_r = numpy.sqrt(float(sum_polI_r)/ num_accs)
    level_polI_i = numpy.sqrt(float(sum_polI_i)/ num_accs)

    rms_polQ = numpy.sqrt(((level_polQ_r)**2)  +  ((level_polQ_i)**2))
    rms_polI = numpy.sqrt(((level_polI_r)**2)  +  ((level_polI_i)**2))
        
    if level_polQ_r < 1.0/(2**num_bits):
        ave_bits_used_Q_r = 0
    else:
        ave_bits_used_Q_r = numpy.log2(level_polQ_r*(2**binary_point))

    if level_polQ_i < 1.0/(2**num_bits):
        ave_bits_used_Q_i = 0
    else:
        ave_bits_used_Q_i = numpy.log2(level_polQ_i*(2**binary_point))

    if level_polI_r < 1.0/(2**num_bits):
        ave_bits_used_I_r = 0
    else:
        ave_bits_used_I_r = numpy.log2(level_polI_r*(2**binary_point))

    if level_polI_i < 1.0/(2**num_bits):
        ave_bits_used_I_i = 0
    else:
        ave_bits_used_I_i = numpy.log2(level_polI_i*(2**binary_point))

    return {'pkt_mcnt': pkt_mcnt,\
            'pkt_ant':pkt_ant,\
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

binary_point = config['feng_fix_pnt_pos']
num_bits = config['feng_bits']
if num_bits != 4:
    print 'This script is only written to work with 4 bit quantised values.'
    exit()

packet_len=config['10gbe_pkt_len']

if opts.man_trigger:
    man_trigger = 2
else:
    man_trigger = 0

report = dict()

print '------------------------'
print 'Triggering Capture...',
write_int_all(dev_name+'_ctrl',0)
print write_int_all(dev_name+'_ctrl',1+man_trigger)
time.sleep(4)

bram_size=read_int_all(dev_name+'_addr')[0]['data']

bram_dmp=dict()
for bram in brams:
    bram_name = dev_name+'_'+bram
    print 'Reading %i values from bram %s...'%(bram_size,bram_name),
    bram_dmp[bram]=read_all(bram_name,bram_size*4)
    sys.stdout.flush()
    for f,fpga in enumerate(fpgas):
        if bram_dmp[bram][f]['status'] != 'SUCCESS':
            print 'Failed on %s'%(servers[f])
            exit(0)
    print 'ok'

#print 'BRAM DUMPS:'
#print bram_dmp

print 'Unpacking bram out of band contents...',
sys.stdout.flush()
bram_oob=dict()
for f,fpga in enumerate(fpgas):
    bram_oob[f]={'raw':struct.unpack('>%iL'%bram_size,bram_dmp[brams[2]][f]['data'])}
#    print bram_oob[f]['raw']
    bram_oob[f].update({'linkdn':[bool(i&(2**linkdn_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'mrst':[bool(i&(2**mrst_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'adc':[bool(i & (2**adc_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'eof':[bool(i & (2**eof_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'sync':[bool(i&(2**sync_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'hdr':[bool(i & (2**hdr_bit)) for i in bram_oob[f]['raw']]})
print 'Done.'

print 'Analysing packets...'

for f,fpga in enumerate(fpgas):
    print servers[f] + ': '
    report[f]=dict()
    report[f]['pkt_total']=0
    pkt_hdr_idx = -1
    for i in range(0,bram_size):
        if opts.verbose:
            pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])[0]
            print '[%s @ %i]: %X'%(servers[f],i,pkt_64bit)

        if bram_oob[f]['linkdn'][i]:
            print '[%s] LINK DOWN AT %i'%(servers[f],i)

        elif bram_oob[f]['adc'][i]:
            adc_amps = struct.unpack('>HHHH',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])
            print '[%s] ADC amplitude update at index %i: '%(servers[f],i),adc_amps
            skip_indices.append(i)

        elif bram_oob[f]['hdr'][i]:
            pkt_hdr_idx = i
            #skip_indices records positions in table which are ADC updates and should not be counted towards standard data.
            skip_indices=[]
#            print ('HEADER RECEIVED')

        elif bram_oob[f]['eof'][i]:
            #skip the first packet entry which has no header (snap block triggered on sync)
            if pkt_hdr_idx<0: continue

#            print ('EOF RECEIVED')
            
            pkt_len=i-pkt_hdr_idx+1
            feng_unpkd_pkt=feng_unpack(f,pkt_hdr_idx,pkt_len,skip_indices)

            print '[%s] [Pkt@ %4i Len: %2i]     (MCNT %12u ANT: %1i)    {4 bit: Qr: %1.2f (%2.1f bits) Qi: %1.2f (%2.1f bits) Ir %1.2f (%2.1f bits) Ii: %1.2f (%2.1f bits)}'%(servers[f],\
                pkt_hdr_idx,\
                pkt_len-len(skip_indices),\
                feng_unpkd_pkt['pkt_mcnt'],\
                feng_unpkd_pkt['pkt_ant'],\
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

print 'Checking sync status...'
sync_stat=sync_check()
for f,fpga in enumerate(fpgas):
    report[f]['sync_status']=sync_stat[f]['sync_status']
print '=========================='


print '\n\nDone with all servers.\nSummary:\n==========================' 
for server,srvr in enumerate(servers):
    print '------------------------'
    print srvr
    print '------------------------'
    for key in report[server].iteritems():
        print key[0],': ',key[1]
print '=========================='

