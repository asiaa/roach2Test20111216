#!/usr/bin/env python

'''
Grabs the contents of "snap_gbe_rx_mux" for analysis. Valid for rev310 and onwards only. This has no OOB capturing.
Assumes the correlator is already initialsed and running etc.

'''
import corr, time, numpy, struct, sys

n_ants_per_ibob=2

#brams
brams=['bram_msb','bram_lsb']
dev_name = 'snap_gbe_rx_mux0'


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

bram_size=read_int_all(dev_name+'_addr')[0]['data']+1

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

if opts.verbose:
    print 'BRAM DUMPS:'
    for f,fpga in enumerate(fpgas):
        for i in range(bram_size):
            pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])[0]
            print '[%s @ %i] %X'%(servers[f],i,pkt_64bit)
    #        pkt_mcnt =(pkt_64bit&((2**64)-(2**16)))>>16 
    #        pkt_ant = pkt_64bit&((2**16)-1)
    #        print 'Idx: %i: MCNT: %i, ANT: %i'%(i,pkt_mcnt,pkt_ant)



report = dict()

print 'Analysing packets:'
for f,fpga in enumerate(fpgas):
    report[f]=dict()
    report[f]['pkt_total']=0
    pkt_len = packet_len+header_len
    #print 'Packet length:%i'%pkt_len
    pkt_mcnt = 0
    pkt_ant = 0
    for i in range(packet_len+header_len,bram_size,packet_len+header_len):
            #get the header
            abs_index = i - (pkt_len)
            #print 'Expecting a packet length of %i at index %i'%(pkt_len,abs_index)
            sum_polQ_r = 0
            sum_polQ_i = 0
            sum_polI_r = 0
            sum_polI_i = 0

            pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*abs_index):(4*abs_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*abs_index):(4*abs_index)+4])[0]
            pkt_mcnt =(pkt_64bit&((2**64)-(2**16)))>>16 
            pkt_ant = pkt_64bit&((2**16)-1)

            #average the packet contents - ignore first entry (header)
            for pkt_index in range(1,(packet_len)):
                abs_index = i + pkt_index - pkt_len+1
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

            print '[%s] EOF @ %4i MCNT %12u Ant: %1i Len: %2i. 4 bit power: PolQ: %4.2f, PolI: %4.2f'%(servers[f],i,pkt_mcnt,pkt_ant,pkt_len,rms_polQ,rms_polI)            

            if not report[f].has_key('Antenna%i'%pkt_ant):
                report[f]['Antenna%i'%pkt_ant] = 1
            else: 
                report[f]['Antenna%i'%pkt_ant] += 1

                report[f]['pkt_total'] += 1

print 'Done with all servers. \n REPORT:'
    

print '\n\nDone with all servers.\nSummary:\n==========================' 

for server,srvr in enumerate(servers):
    print '------------------------'
    print srvr
    print '------------------------'
    for key in report[server].iteritems():
        print key[0],': ',key[1]
print '=========================='        
