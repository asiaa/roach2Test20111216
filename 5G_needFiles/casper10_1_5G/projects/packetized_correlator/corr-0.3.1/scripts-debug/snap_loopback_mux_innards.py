#!/usr/bin/env python

'''
Grabs the contents of "snap_descramble" for analysis. Valid for rev310 and onwards only. This has no OOB capturing.
Assumes the correlator is already initialsed and running etc.

'''
import corr, time, numpy, struct, sys

#brams
brams=['bram']
dev_name = 'loopback_mux0_snap'

# OOB signalling bit offsets:
loop_mcnt_bit_width = 12
loop_mcnt_bit_offset = 20
gbe_mcnt_bit_width = 12
gbe_mcnt_bit_offset = 8
pkt_rdy_bit = 7
eof_bit = 6
loop_valid_bit = 5
gbe_valid_bit = 4
input_sel_bit = 3
loop_rd_hdr_bit = 2
gbe_rd_hdr_bit = 1
loop_rst_bit = 0


gbe_mcnt_mask = (2**(gbe_mcnt_bit_width+gbe_mcnt_bit_offset)) -(2**gbe_mcnt_bit_offset)
loop_mcnt_mask = (2**(loop_mcnt_bit_width+loop_mcnt_bit_offset)) -(2**loop_mcnt_bit_offset)


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
    p.set_usage('snap_descramble_write.py [options] CONFIG_FILE')
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

n_ants=config['n_ants']

trig_offset=0

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
    bram_oob[f]={'raw':struct.unpack('>%iL'%(bram_size[f]['data']+1),bram_dmp[brams[0]][f]['data'])}
    bram_oob[f].update({'pkt_rdy':[bool(i & (2**pkt_rdy_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'eof':[bool(i & (2**eof_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'loop_valid':[bool(i & (2**loop_valid_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'gbe_valid':[bool(i & (2**gbe_valid_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'input_sel':[bool(i & (2**input_sel_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'loop_rd_hdr':[bool(i & (2**loop_rd_hdr_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'gbe_rd_hdr':[bool(i & (2**gbe_rd_hdr_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'loop_rst':[bool(i & (2**loop_rst_bit)) for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'gbe_mcnt':[(i&gbe_mcnt_mask)>>gbe_mcnt_bit_offset for i in bram_oob[f]['raw']]})
    bram_oob[f].update({'loop_mcnt':[(i&loop_mcnt_mask)>>loop_mcnt_bit_offset for i in bram_oob[f]['raw']]})
    #print '\n\nFPGA %i, bramoob:'%f,bram_oob
print 'Done unpacking.'


for f,fpga in enumerate(fpgas):
    for i in range(bram_size[f]['data']+1):
#        print 'Raw data: %8x'%bram_oob[f]['raw'][i]

        print '[%s]'%(servers[f]),
        if bram_oob[f]['input_sel'][i]: print '[GBE ]' ,
        else: print '[LOOP]',
        print 'idx: %5i. gbe_mcnt: %6i, loop_mcnt: %6i'%(i,bram_oob[f]['gbe_mcnt'][i],bram_oob[f]['loop_mcnt'][i]),
        if bram_oob[f]['pkt_rdy'][i]: print '[pkt_rdy]' ,
        if bram_oob[f]['loop_valid'][i]: print '[loop_valid]' ,
        if bram_oob[f]['gbe_valid'][i]: print '[GBE_valid]' ,
        if bram_oob[f]['loop_rd_hdr'][i]: print '[Getting Loopback hdr]' ,
        if bram_oob[f]['gbe_rd_hdr'][i]: print '[Getting GBE hdr]' ,
        if bram_oob[f]['loop_rst'][i]: print '[Loop TIMEOUT]' ,
        if bram_oob[f]['eof'][i]: print '[EOF]'
        else: print ''

