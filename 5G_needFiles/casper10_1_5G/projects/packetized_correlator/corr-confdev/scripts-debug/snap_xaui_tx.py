#!/usr/bin/env python

'''
Grabs the contents of "snap_gbe_tx" for analysis.
Assumes the correlator is already initialsed and running etc.

'''
import corr, time, numpy, struct, sys

n_ants_per_ibob=2

#brams
brams=['bram_msb','bram_lsb','bram_oob']
dev_name = 'snap_xaui_tx0'

# OOB signalling bit offsets:
ip_addr_bit_width = 24
ip_addr_bit_offset = 5
eof_bit = 4
ibob_sync_bit = 3
link_down_bit = 2
mrst_bit = 1
pkt_err_bit = 0

pkt_ip_mask = (2**(ip_addr_bit_width+ip_addr_bit_offset)) -(2**ip_addr_bit_offset)


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

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('snap_10gbe_tx.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-t', '--man_trigger', dest='man_trigger', action='store_true',
        help='Trigger the snap block manually')   
    p.add_option('-v', '--verbose', dest='verbose', action='store_true',
        help='Be Verbose; print raw packet contents.')   
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

report = dict()
print 'Unpacking bram contents...',
sys.stdout.flush()
bram_oob=dict()
for f,fpga in enumerate(fpgas):
    sys.stdout.flush()
    bram_oob[f]={'raw':struct.unpack('>%iL'%bram_size,bram_dmp[brams[2]][f]['data'])}
    bram_oob[f].update({'mrst':[bool(i&(2**mrst_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'eof':[bool(i & (2**eof_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'sync':[bool(i&(2**ibob_sync_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'pkt_err':[bool(i&(2**pkt_err_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'link_down':[bool(i&(2**link_down_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'ip_addr':[(i&pkt_ip_mask)>>ip_addr_bit_offset for i in bram_oob[f]['raw']]})
    #print '\n\nFPGA %i, bramoob:'%f,bram_oob
print 'Done unpacking.'

print 'Analysing packets:'
for f,fpga in enumerate(fpgas):
    report[f]=dict()
    report[f]['pkt_total']=0
    pkt_len = 0
    pkt_mcnt = 0
    pkt_ant = 0
    for i in range(bram_size):
        if opts.man_trigger:
            pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])[0]
            print 'IDX: %i Contents: %x'%(i,pkt_64bit)

        if bram_oob[f]['link_down'][i] or bram_oob[f]['pkt_err'][i]:
            print 'Found a packet error at index %i'%i
        elif bram_oob[f]['eof'][i]:
            if pkt_len == 0:
                continue
            elif i <= packet_len:
                pkt_len=0
            else:
                #get the header
                hdr_index = i - pkt_len
                pkt_len += 1
                sum_polQ_r = 0
                sum_polQ_i = 0
                sum_polI_r = 0
                sum_polI_i = 0

                pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*hdr_index):(4*hdr_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*hdr_index):(4*hdr_index)+4])[0]
                pkt_mcnt =(pkt_64bit&((2**64)-(2**16)))>>16 
                pkt_ant = pkt_64bit&((2**16)-1)

                #average the packet contents - ignore first entry (header)
                for pkt_index in range(1,(pkt_len)):
                    abs_index = hdr_index + pkt_index
                    pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*abs_index):(4*abs_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*abs_index):(4*abs_index)+4])[0]
                    
                    #print 'index: %2i, value %016X'%(pkt_index, pkt_64bit)
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

                rms_polQ = numpy.sqrt(((level_polQ_r)**2)  +  ((level_polQ_i)**2))
                rms_polI = numpy.sqrt(((level_polI_r)**2)  +  ((level_polI_i)**2))

                pkt_ip_str = ip2str(bram_oob[f]['ip_addr'][abs_index])

                print '[%s] HDR @ %4i DestIP: %s MCNT %12u Ant: %1i Len: %2i. 4 bit power: PolQ: %4.2f, PolI: %4.2f'%(servers[f],hdr_index,pkt_ip_str,pkt_mcnt,pkt_ant,pkt_len,rms_polQ,rms_polI)            

                if not report[f].has_key('Antenna%i'%pkt_ant):
                    report[f]['Antenna%i'%pkt_ant] = 1
                else: 
                    report[f]['Antenna%i'%pkt_ant] += 1

                
                if not report[f].has_key('dest_ips'):
                    report[f].update({'dest_ips':{pkt_ip_str:1}})
                elif report[f]['dest_ips'].has_key(pkt_ip_str): 
                    report[f]['dest_ips'][pkt_ip_str] += 1
                else:
                    report[f]['dest_ips'].update({pkt_ip_str:1})

                report[f]['pkt_total'] += 1
                pkt_len = 0
        else:
            pkt_len += 1

print 'Done with all servers. \n REPORT:'
    

print '\n\nDone with all servers.\nSummary:\n==========================' 

for server,srvr in enumerate(servers):
    print '------------------------'
    print srvr
    print '------------------------'
    for key in report[server].iteritems():
        print key[0],': ',key[1]
print '=========================='        
