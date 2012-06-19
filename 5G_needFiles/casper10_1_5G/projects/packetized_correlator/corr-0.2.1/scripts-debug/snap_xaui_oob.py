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
brams=['bram']
dev_name = 'xaui_oob'

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
report = dict()

if opts.man_trigger:
    man_trigger = 2
else:
    man_trigger = 0

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
            bram_oob[f].update({i:{'raw':struct.unpack('>L',bram_dmp['bram'][f]['data'][(4*i):(4*i)+4])[0]}})
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

    for fn,f in enumerate(fpgas):
        report[server][f]=dict()
        report[server][f]['pkt_total']=0
        pkt_len = 0
        pkt_mcnt = 0
        pkt_ant = 99
        for i in range(0,len(bram_dmp[brams[0]][fpgas[0]]['data'])/4):
            if bram_oob[f][i]['adc']:
                print '[%s]: ADC amplitude update at index %i: '%(f,i)
            elif bram_oob[f][i]['hdr']:
                pkt_len = 0
                pkt_mcnt =0
                pkt_ant = 99
#                print ('HEADER RECEIVED')
            elif bram_oob[f][i]['eof']:
                pkt_len += 1
                sum_pwr_polQ = 0
                sum_pwr_polI = 0
                num_accs = pkt_len*(64/16)
                print '[%s] EOF received at %4i with mcnt %12u for antenna %1i with len %2i. Number of accs: %i'%(f,i,pkt_mcnt,pkt_ant,pkt_len,num_accs)            
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

print 'Done with all servers:', report

    
