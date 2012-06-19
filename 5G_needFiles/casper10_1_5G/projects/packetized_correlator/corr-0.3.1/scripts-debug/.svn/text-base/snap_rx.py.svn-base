#!/usr/bin/env python

'''
Grabs the contents of "snap_gbe_rx_mux" for analysis. Valid for rev310 and onwards only. This has no OOB capturing.
Assumes the correlator is already initialsed and running etc.

'''
import corr, time, numpy, struct, sys

n_ants_per_ibob=2

#brams
brams=['bram_msb','bram_lsb','bram_oob']
#dev_name = 'descramble_window0_snap_in'
dev_name = 'snap_rx0'

# OOB signalling bit offsets:
ip_addr_bit_width = 8
ip_addr_bit_offset = 24
ant_bit_width = 7
ant_bit_offset = 17
mcnt_bit_width = 12
mcnt_bit_offset = 5
loop_ack_bit = 4
gbe_ack_bit = 3
valid_bit = 2
eof_bit = 1
flag_bit = 0


pkt_ip_mask = (2**(ip_addr_bit_width+ip_addr_bit_offset)) -(2**ip_addr_bit_offset)
ant_mask = (2**(ant_bit_width+ant_bit_offset)) -(2**ant_bit_offset)
mcnt_mask = (2**(mcnt_bit_width+mcnt_bit_offset)) -(2**mcnt_bit_offset)


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

def ip2str(pkt_ip):
    ip_4 = (pkt_ip&((2**32)-(2**24)))>>24
    ip_3 = (pkt_ip&((2**24)-(2**16)))>>16
    ip_2 = (pkt_ip&((2**16)-(2**8)))>>8
    ip_1 = (pkt_ip&((2**8)-(2**0)))>>0
    #print 'IP:%i. decoded to: %i.%i.%i.%i'%(pkt_ip,ip_4,ip_3,ip_2,ip_1)
    return '%i.%i.%i.%i'%(ip_4,ip_3,ip_2,ip_1)    

def feng_unpack(f,hdr_index,pkt_len):
    #the loopback block unpacks the packet in firmware and removes the header from the data stream. Thus don't need to unpack here.
    #pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*hdr_index):(4*hdr_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*hdr_index):(4*hdr_index)+4])[0]
    #pkt_mcnt =(pkt_64bit&((2**64)-(2**16)))>>16
    #pkt_ant = pkt_64bit&((2**16)-1)

    sum_polQ_r = 0
    sum_polQ_i = 0
    sum_polI_r = 0
    sum_polI_i = 0

    #average the packet contents from the very first entry
    for pkt_index in range(0,(pkt_len)):
        abs_index = hdr_index + pkt_index
        pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*abs_index):(4*abs_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*abs_index):(4*abs_index)+4])[0]

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

    return {'rms_polQ':rms_polQ,\
            'rms_polI':rms_polI,\
            'ave_bits_used_Q_r':ave_bits_used_Q_r,\
            'ave_bits_used_Q_i':ave_bits_used_Q_i,\
            'ave_bits_used_I_r':ave_bits_used_I_r,\
            'ave_bits_used_I_i':ave_bits_used_I_i}


if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('snap_10gbe_tx.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-t', '--man_trigger', dest='man_trigger', action='store_true',
        help='Trigger the snap block manually')   
    p.add_option('-v', '--verbose', dest='verbose', action='store_true',
        help='Print raw contents.')   
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
packet_len=config['10gbe_pkt_len']
n_ants=config['n_ants']
n_chans=config['n_chans']

header_len=1

if opts.man_trigger:
    man_trigger = 2
else:
    man_trigger = 0

report = dict()

print '------------------------'
print 'Triggering Capture...',
write_int_all(dev_name+'_ctrl',0)
print write_int_all(dev_name+'_ctrl',1+man_trigger)
time.sleep(2)

bram_size=read_int_all(dev_name+'_addr')

bram_dmp=dict()
for bram in brams:
    bram_dmp[bram]=[0 for f in fpgas]
    for f,fpga in enumerate(fpgas):
        bram_name = dev_name+'_'+bram
        print 'Reading %i values from bram %s on FPGA %s...'%(bram_size[f]['data']+1,bram_name,servers[f]),
        sys.stdout.flush()
        bram_dmp[bram][f]=fpga.read(bram_name,(bram_size[f]['data']+1)*4)
        if bram_dmp[bram][f]['status'] != 'SUCCESS':
            print 'Failed on %s'%(servers[f])
            print bram_dmp
            exit(0)
        print 'ok'

#print 'BRAM DUMPS:'
#print bram_dmp


print 'Unpacking bram contents...',
sys.stdout.flush()
bram_oob=dict()
for f,fpga in enumerate(fpgas):
    sys.stdout.flush()
    bram_oob[f]={'raw':struct.unpack('>%iL'%(bram_size[f]['data']+1),bram_dmp[brams[2]][f]['data'])}
    bram_oob[f].update({'eof':[bool(i & (2**eof_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'valid':[bool(i & (2**valid_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'gbe_ack':[bool(i & (2**gbe_ack_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'loop_ack':[bool(i & (2**loop_ack_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'ip_addr':[(i&pkt_ip_mask)>>ip_addr_bit_offset for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'ant':[(i&ant_mask)>>ant_bit_offset for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'mcnt':[(i&mcnt_mask)>>mcnt_bit_offset for i in bram_oob[f]['raw']]})
    #print '\n\nFPGA %i, bramoob:'%f,bram_oob
print 'Done unpacking.'


if opts.verbose:
    for f,fpga in enumerate(fpgas):
        for i in range(bram_size[f]['data']+1):
            pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])[0]
            pkt_ip_str = ip2str(bram_oob[f]['ip_addr'][i])
            pkt_mcnt=bram_oob[f]['mcnt'][i]
            pkt_ant=bram_oob[f]['ant'][i]
            print '[%s]'%(servers[f]),
            if bram_oob[f]['valid'][i]: print '[VALID]',
            if bram_oob[f]['gbe_ack'][i]: print '[GBE ]',
            if bram_oob[f]['loop_ack'][i]: print '[Loop]',
            print 'IDX: %6i IP: %s. MCNT: %6i. ANT: %4i.  Contents: %16x'%(i,pkt_ip_str,pkt_mcnt,pkt_ant,pkt_64bit),
            if bram_oob[f]['eof'][i]: print '[EOF!]'
            else: print ''
            



report = dict()
mcnts = dict()

print 'Analysing packets:'
for f,fpga in enumerate(fpgas):
    report[f]=dict()
    mcnts[f]=dict()
    report[f]['pkt_total']=0
    report[f]['mcnt_errors']=0
    pkt_len = 0
    prev_eof_index=-1

    for i in range(bram_size[f]['data']+1):
        if bram_oob[f]['eof'][i]:

            pkt_ip_str = ip2str(bram_oob[f]['ip_addr'][i])
            pkt_mcnt=bram_oob[f]['mcnt'][i]
            pkt_ant=bram_oob[f]['ant'][i]
            pkt_freq=bram_oob[f]['mcnt'][i]%n_chans

            print '[%s] EOF at %4i. IP: %12s. MCNT: %6i. Freq: %4i ANT: %4i. Len: %3i. '%(servers[f],i,pkt_ip_str,pkt_mcnt,pkt_freq,pkt_ant,i-prev_eof_index),
            if bram_oob[f]['gbe_ack'][i]: print '[GBE ]',
            elif bram_oob[f]['loop_ack'][i]: print '[Loop]',

            report[f]['pkt_total']+=1
            hdr_index=prev_eof_index+1
            pkt_len=i-prev_eof_index
            prev_eof_index=i

            if not report[f].has_key('dest_ips'):
                report[f].update({'dest_ips':{pkt_ip_str:1}})
            elif report[f]['dest_ips'].has_key(pkt_ip_str):
                report[f]['dest_ips'][pkt_ip_str] += 1
            else:
                report[f]['dest_ips'].update({pkt_ip_str:1})


            if pkt_len != packet_len:
                print 'Malformed Fengine Packet'
                if not report[f].has_key('Malformed F-engine Packets'):
                    report[f]['Malformed F-engine Packets'] = 1
                else:
                    report[f]['Malformed F-engine Packets'] += 1

            else:
                feng_unpkd_pkt=feng_unpack(f,hdr_index,pkt_len)

                first_mcnt = bram_oob[f]['mcnt'][hdr_index]
                for pkt_index in range(hdr_index,hdr_index+pkt_len):
                    if first_mcnt != bram_oob[f]['mcnt'][pkt_index]:
                        report[f]['mcnt_errors'] += 1
                if report[f]['mcnt_errors'] != 0: 
                    print '[MCNT ERR]',

                try: mcnts[f][pkt_mcnt][pkt_ant]=i
                except:
                    mcnts[f][pkt_mcnt]=numpy.zeros(n_ants,numpy.int)
                    mcnts[f][pkt_mcnt][pkt_ant]=i
                #print mcnts

                print 'HDR @ %4i. 4 bit power: PolQ: %4.2f, PolI: %4.2f'%(hdr_index,feng_unpkd_pkt['rms_polQ'],feng_unpkd_pkt['rms_polI'])
                
                if not report[f].has_key('Antenna%i'%pkt_ant):
                    report[f]['Antenna%i'%pkt_ant] = 1
                else:
                    report[f]['Antenna%i'%pkt_ant] += 1

    rcvd_mcnts = mcnts[f].keys()
    rcvd_mcnts.sort()

    if opts.verbose: print 'Received mcnts: ',rcvd_mcnts
    report[f]['min_pkt_latency']=9999
    report[f]['max_pkt_latency']=-1
    for i in rcvd_mcnts:
        max_mcnt = max(mcnts[f][i])/pkt_len
        min_mcnt = min(mcnts[f][i])/pkt_len
        if opts.verbose: print 'MCNT: %i. Max: %i, Min: %i. Diff: %i'%(i,max_mcnt,min_mcnt,max_mcnt-min_mcnt)
        if (max_mcnt-min_mcnt)>0:
            if report[f]['max_pkt_latency']<(max_mcnt-min_mcnt) and min_mcnt>0: report[f]['max_pkt_latency']=max_mcnt-min_mcnt
            if report[f]['min_pkt_latency']>(max_mcnt-min_mcnt) and min_mcnt>0: report[f]['min_pkt_latency']=max_mcnt-min_mcnt

print 'Done with all servers. '


print '\n REPORT:'
    

print '\n\nDone with all servers.\nSummary:\n==========================' 

for server,srvr in enumerate(servers):
    print '------------------------'
    print srvr
    print '------------------------'
    for key in report[server].iteritems():
        print key[0],': ',key[1]
print '=========================='        
