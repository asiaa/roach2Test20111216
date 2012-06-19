#!/usr/bin/env python

'''
Grabs the contents of "snap_reord0_snap_rd" for analysis. Valid for rev310 and onwards only.

Can optionally search for non-received data and trigger on that.

'''
import corr, time, numpy, struct, sys

n_ants_per_ibob=2

#brams
brams=['bram_msb','bram_lsb']
dev_name = 'reord0_snap_rd'

# OOB signalling bit offsets:
mcnt_bit_width = 27
mcnt_bit_offset = 37
curr_window_bit_width = 3
curr_window_bit_offset = 34
dout_bit_width = 16
dout_bit_offset = 18
rd_addr_bit_width = 13
rd_addr_bit_offset = 5
sync_bit = 4
valid_bit = 3
flag_bit = 2
rcvd_bit = 1
we_bit = 0


dout_mask = (2**(dout_bit_width+dout_bit_offset)) -(2**dout_bit_offset)
mcnt_mask = (2**(mcnt_bit_width+mcnt_bit_offset)) -(2**mcnt_bit_offset)
curr_window_mask = (2**(curr_window_bit_width+curr_window_bit_offset)) -(2**curr_window_bit_offset)
rd_addr_mask = (2**(rd_addr_bit_width+rd_addr_bit_offset)) -(2**rd_addr_bit_offset)


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

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('snap_10gbe_tx.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-t', '--man_trigger', dest='man_trigger', action='store_true',
        help='Trigger the snap block manually')   
    p.add_option('-e', '--trig_err', dest='trig_err', action='store_true',
        help='Continue capturing until not-received data is encountered.')   
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

if opts.trig_err:
    man_trigger += 8

report = dict()

print '------------------------'
print 'Triggering Capture...',
write_int_all(dev_name+'_ctrl',man_trigger)
print write_int_all(dev_name+'_ctrl',1+man_trigger)

#wait 'till the snap block has filled:

bram_size=read_int_all(dev_name+'_addr')
while bram_size[0]['data'] != read_int_all(dev_name+'_addr')[0]['data']:
    bram_size=read_int_all(dev_name+'_addr')
    print '.',
    sys.stdout.flush()
    time.sleep(2)
    

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
    bram_oob[f]={}
    bram_oob[f]['raw']=[]

    for i in range(bram_size[f]['data']+1):
        bram_oob[f]['raw'].append(struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])[0])

    bram_oob[f].update({'we':[bool(i & (2**we_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'flag':[bool(i & (2**flag_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'rcvd':[bool(i & (2**rcvd_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'valid':[bool(i & (2**valid_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'sync':[bool(i & (2**sync_bit)) for i in bram_oob[f]['raw']]})

    bram_oob[f].update({'mcnt':[(i&mcnt_mask)>>mcnt_bit_offset for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'curr_window_mask':[(i&curr_window_mask)>>curr_window_bit_offset for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'rd_addr':[(i&rd_addr_mask)>>rd_addr_bit_offset for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'dout':[(i&dout_mask)>>dout_bit_offset for i in bram_oob[f]['raw']]})
    #print '\n\nFPGA %i, bramoob:'%f,bram_oob
print 'Done unpacking.'


#if opts.verbose:
for f,fpga in enumerate(fpgas):
    for i in range(bram_size[f]['data']+1):
        mcnt=bram_oob[f]['mcnt'][i]
        crr_rd_window=bram_oob[f]['curr_window_mask'][i]
        rd_addr=bram_oob[f]['rd_addr'][i]
        dout=bram_oob[f]['dout'][i]
        print '[%s] IDX: %6i max_MCNT: %6i. rd_window: %2i rd_addr: %6i Contents: %5x'%(servers[f],i,mcnt,crr_rd_window,rd_addr,dout),
        if bram_oob[f]['we'][i] & bram_oob[f]['valid'][i]: print '[valid]',
        else: print 'SNAP ERR!'
        if bram_oob[f]['sync'][i]: print '[sync]',
        if bram_oob[f]['flag'][i]: print '[BAD FLAG!]',
        if not bram_oob[f]['rcvd'][i]: print '[NOT RCVD!]',
        print ''
        
