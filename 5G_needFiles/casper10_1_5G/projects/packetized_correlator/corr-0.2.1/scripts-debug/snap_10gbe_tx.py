#!/usr/bin/env python

'''
Grabs the contents of "snap_gbe_tx" for analysis.
Assumes the correlator is already initialsed and running etc.

'''
import corr.borph, time, numpy, pylab, struct

#defaults that will be used if not executed from the command line
servers = ['beecourageous']
ctrl_port = 9999
fpgas = ['FPGA0','FPGA1','FPGA2','FPGA3']
brams=['bram_msb','bram_lsb','bram_oob']
dev_name = 'snap_gbe_tx'
binary_point = 3
num_bits = 4

# OOB signalling bit offsets:
ip_addr_bit_width = 24
ip_addr_bit_offset = 5
eof_bit = 4
ibob_sync_bit = 3
link_down_bit = 2
mrst_bit = 1
pkt_err_bit = 0

pkt_ip_mask = (2**(ip_addr_bit_width+ip_addr_bit_offset)) -(2**ip_addr_bit_offset)

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
            bram_oob[f][i].update({'pkt_err':bool(bram_oob[f][i]['raw'] & (2**pkt_err_bit))})
            bram_oob[f][i].update({'mrst':bool(bram_oob[f][i]['raw'] & (2**mrst_bit))})
            bram_oob[f][i].update({'eof':bool(bram_oob[f][i]['raw'] & (2**eof_bit))})
            bram_oob[f][i].update({'sync':bool(bram_oob[f][i]['raw'] & (2**ibob_sync_bit))})
            bram_oob[f][i].update({'link_down':bool(bram_oob[f][i]['raw'] & (2**link_down_bit))})
            bram_oob[f][i].update({'ip_addr':(bram_oob[f][i]['raw']&pkt_ip_mask)>>ip_addr_bit_offset})
    print 'Done unpacking.'
    
#    print 'Printing:'
#    for f in fpgas:
#        for i in range(0,len(bram_data['FPGA0'])):
#            print '%s, index %i, value %#X'%(f,i,bram_data[f][i])


    print 'Analysing packets:'
    report[server]=dict()
    for fn,f in enumerate(fpgas):
        report[server][f]=dict()
        report[server][f]['pkt_total']=0
        pkt_len = 0
        pkt_mcnt = 0
        pkt_ant = 99
        for i in range(len(bram_dmp[brams[0]][fpgas[0]]['data'])/4):
            if bram_oob[f][i]['link_down'] or bram_oob[f][i]['pkt_err']:
                print 'Found a packet error at index %i'%i
            elif bram_oob[f][i]['eof']:
                if pkt_len == 0:
                    continue
                else:
                    #get the header
                    abs_index = i - pkt_len
                    pkt_len += 1
                    sum_polQ_r = 0
                    sum_polQ_i = 0
                    sum_polI_r = 0
                    sum_polI_i = 0

                    pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*abs_index):(4*abs_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*abs_index):(4*abs_index)+4])[0]
                    pkt_mcnt =(pkt_64bit&((2**64)-(2**16)))>>16 
                    pkt_ant = pkt_64bit&((2**16)-1)
   
                    pkt_ip = bram_oob[f][abs_index]['ip_addr']
                    ip_4 = (pkt_ip&((2**32)-(2**24)))>>24
                    ip_3 = (pkt_ip&((2**24)-(2**16)))>>16
                    ip_2 = (pkt_ip&((2**16)-(2**8)))>>8
                    ip_1 = (pkt_ip&((2**8)-(2**0)))>>0
                    
                    #print 'IP:%i. decoded to: %i.%i.%i.%i'%(pkt_ip,ip_4,ip_3,ip_2,ip_1)

                    #average the packet contents - ignore first entry (header)
                    for pkt_index in range(1,(pkt_len)):
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

                    pkt_ip_str = '%i.%i.%i.%i'%(ip_4,ip_3,ip_2,ip_1)
                    print '[%s] EOF @ %4i DestIP: %s MCNT %12u Ant: %1i Len: %2i. 4 bit power: PolQ: %4.2f, PolI: %4.2f'%(f,i,pkt_ip_str,pkt_mcnt,pkt_ant,pkt_len,rms_polQ,rms_polI)            

                    if not report[server][f].has_key('Antenna%i'%pkt_ant):
                        report[server][f]['Antenna%i'%pkt_ant] = 1
                    else: 
                        report[server][f]['Antenna%i'%pkt_ant] += 1

                    
                    if not report[server][f].has_key('dest_ips'):
                        report[server][f].update({'dest_ips':{pkt_ip_str:1}})
                    elif report[server][f]['dest_ips'].has_key(pkt_ip_str): 
                        report[server][f]['dest_ips'][pkt_ip_str] += 1
                    else:
                        report[server][f]['dest_ips'].update({pkt_ip_str:1})

                    report[server][f]['pkt_total'] += 1
                    pkt_len = 0
            else:
                pkt_len += 1

    print 'Done with %s.'%(servers[server])
    print '--------------------'

print 'Done with all servers. \n REPORT:'
    
for server,b in enumerate(bees):
    for fn,f in enumerate(fpgas):
        print '%s, %s'%(servers[server],f)
        print '-----------------------'
        for i in report[server][f].keys():
            print i, ': ', report[server][f][i]
        print '======================='        
