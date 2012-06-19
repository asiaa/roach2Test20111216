#!/usr/bin/env python

'''
Grabs the contents of "snap_descramble" for analysis. Valid for rev310 and onwards only. This has no OOB capturing.
Assumes the correlator is already initialsed and running etc.

'''
import corr, time, numpy, struct, sys

n_ants_per_ibob=2

#brams
bram='bram'
dev_name = 'snap_descramble0'
xeng_on_this_fpga=0

# OOB signalling bit offsets:
data_bit_width =16
data_bit_offset = 16
mcnt_bit_width = 13
mcnt_bit_offset = 3
valid_bit = 2
flag_bit = 1
rcvd_bit = 0


mcnt_mask = (2**(mcnt_bit_width+mcnt_bit_offset)) -(2**mcnt_bit_offset)
data_mask = (2**(data_bit_width+data_bit_offset)) -(2**data_bit_offset)


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

def xeng_in_unpack(f,start_index):

    sum_polQ_r = 0
    sum_polQ_i = 0
    sum_polI_r = 0
    sum_polI_i = 0

    rcvd_errs = 0
    flag_errs = 0

    #average the packet contents from the very first entry
    for slice_index in range(xeng_acc_len):
        abs_index = start_index + slice_index
        polQ_r = (bram_oob[f]['data'][abs_index] & ((2**(16)) - (2**(12))))>>(12)
        polQ_i = (bram_oob[f]['data'][abs_index] & ((2**(12)) - (2**(8))))>>(8)
        polI_r = (bram_oob[f]['data'][abs_index] & ((2**(8)) - (2**(4))))>>(4)
        polI_i = (bram_oob[f]['data'][abs_index] & ((2**(4)) - (2**(0))))>>0

        #square each number and then sum it
        sum_polQ_r += (float(((numpy.int8(polQ_r << 4)>> 4)))/(2**binary_point))**2
        sum_polQ_i += (float(((numpy.int8(polQ_i << 4)>> 4)))/(2**binary_point))**2
        sum_polI_r += (float(((numpy.int8(polI_r << 4)>> 4)))/(2**binary_point))**2
        sum_polI_i += (float(((numpy.int8(polI_i << 4)>> 4)))/(2**binary_point))**2

        if not bram_oob[f]['rcvd'][abs_index]: rcvd_errs +=1
        if bram_oob[f]['flag'][abs_index]: flag_errs +=1

    num_accs = xeng_acc_len

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
            'rcvd_errs':rcvd_errs,\
            'flag_errs':flag_errs,\
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
    p.add_option('-n', '--n_chans', dest='n_chans', type='int', default=0,
        help='How many channels should we retrieve?')   
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
xeng_acc_len=config['xeng_acc_len']
n_ants=config['n_ants']
n_chans=config['n_chans']
x_per_fpga=config['x_per_fpga']
n_xeng = x_per_fpga*len(servers)

trig_offset=0

if opts.man_trigger:
    man_trigger = 2
else:
    man_trigger = 0

if opts.n_chans != 0:
    exp_len_from_descr = opts.n_chans/n_xeng * n_ants * xeng_acc_len
else:
    exp_len_from_descr = n_chans/n_xeng * n_ants * xeng_acc_len

print 'Retrieving  %i words from each x engine.'%exp_len_from_descr

#bram_dmp = [[0 for i in range(exp_len_from_descr*4)] for f in fpgas]
bram_dmp = [[] for f in fpgas]
report = dict()

print '------------------------'
while trig_offset<exp_len_from_descr:

    print 'Triggering Capture at offset %i...'%trig_offset,
    if write_int_all(dev_name+'_ctrl',0) != 'ok': print 'ERR'
    if write_int_all(dev_name+'_trig_offset',trig_offset) != 'ok': print 'ERR'
    print write_int_all(dev_name+'_ctrl',1+man_trigger)
    time.sleep(1)

    bram_size=read_int_all(dev_name+'_addr')

    bram_tmp=[0 for f in fpgas]

    for f,fpga in enumerate(fpgas):
        bram_name = dev_name+'_'+bram
        print 'Reading %i values from bram %s on FPGA %s...'%(bram_size[f]['data']+1,bram_name,servers[f]),
        sys.stdout.flush()
        bram_tmp[f]=fpga.read(bram_name,(bram_size[f]['data']+1)*4)
        if bram_tmp[f]['status'] != 'SUCCESS':
            print 'Failed on %s'%(servers[f])
            print bram_tmp
            exit(0)
        else:
            #print 'Writing to locations %i:%i'%(trig_offset*4,(trig_offset+bram_size[f]['data']+1)*4),
            bram_dmp[f].append(bram_tmp[f]['data'])
        print 'ok'
    trig_offset += (bram_size[f]['data']+1)
    time.sleep(1)


#print 'BRAM DUMPS:'
#print bram_dmp

#print 'Total size for each x engine: %i bytes'%len(bram_dmp[0])

print 'Unpacking bram contents...',
sys.stdout.flush()
bram_oob=dict()
for f,fpga in enumerate(fpgas):
    bram_dmp[f]=''.join(bram_dmp[f])
    sys.stdout.flush()
    bram_oob[f]={'raw':struct.unpack('>%iL'%(len(bram_dmp[f])/4),bram_dmp[f])}
    bram_oob[f].update({'rcvd':[bool(i & (2**rcvd_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'flag':[bool(i & (2**flag_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'valid':[bool(i & (2**valid_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'mcnt':[(i&mcnt_mask)>>mcnt_bit_offset for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'data':[(i&data_mask)>>data_bit_offset for i in bram_oob[f]['raw']]})
    #print '\n\nFPGA %i, bramoob:'%f,bram_oob
print 'Done unpacking.'


if opts.verbose:
    for f,fpga in enumerate(fpgas):
        for i in range(len(bram_oob[f]['data'])):
            pkt_mcnt=bram_oob[f]['mcnt'][i]
            pkt_data=bram_oob[f]['data'][i]
            exp_ant=(i/xeng_acc_len)%n_ants
            exp_freq=(i/xeng_acc_len)/n_ants * n_xeng + ((x_per_fpga)*f + xeng_on_this_fpga)
            xeng_slice=i%xeng_acc_len+1
            print '[%s]'%(servers[f]),
            if bram_oob[f]['valid'][i]: print '[VALID]',
            if bram_oob[f]['rcvd'][i]: print '[RCVD]',
            if bram_oob[f]['flag'][i]: print '[FLAG_BAD]',
            print 'IDX: %6i MAX_MCNT: %6i. Data: %10x. Slice %3i/%3i of ant %3i, freq (this x eng) %3i.'%(i,pkt_mcnt,pkt_data,xeng_slice,xeng_acc_len,exp_ant,exp_freq)

report = dict()
mcnts = dict()

print 'Analysing contents...'

for f,fpga in enumerate(fpgas):
    report[f]=dict()

    for i in range(0,len(bram_oob[f]['data']),xeng_acc_len):        
        pkt_mcnt=bram_oob[f]['mcnt'][i]
        pkt_data=bram_oob[f]['data'][i]
        exp_ant=(i/xeng_acc_len)%n_ants
        exp_freq=(i/xeng_acc_len)/n_ants * n_xeng + ((x_per_fpga)*f + xeng_on_this_fpga)

        xeng_unpkd=xeng_in_unpack(f,i)
        print '[%s] IDX: %6i. ANT: %4i. FREQ: %4i. 4 bit power: PolQ: %4.2f, PolI: %4.2f'%(servers[f],i,exp_ant,exp_freq,xeng_unpkd['rms_polQ'],xeng_unpkd['rms_polI']),
        if xeng_unpkd['rcvd_errs']>0: 
            print '[%i RCV ERRS!]'%xeng_unpkd['rcvd_errs'],
            if not report[f].has_key('Rcv Errors'):
                report[f]['Rcv Errors'] = 1
            else:
                report[f]['Rcv Errors'] += 1

        if xeng_unpkd['flag_errs']>0: 
            print '[%i FLAGGED DATA]'%xeng_unpkd['flag_errs'],
            if not report[f].has_key('Flagged bad data'):
                report[f]['Flagged bad data'] = 1
            else:
                report[f]['Flagged bad data'] += 1
        print ''


print '\n\nDone with all servers.\nSummary:\n=========================='

for server,srvr in enumerate(servers):
    print '------------------------'
    print srvr
    print '------------------------'
    for key in report[server].iteritems():
        print key[0],': ',key[1]
print '=========================='
                                                
