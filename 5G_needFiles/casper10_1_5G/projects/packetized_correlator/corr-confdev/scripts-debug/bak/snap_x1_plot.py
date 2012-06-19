#!/usr/bin/env python
"""
Grabs a sample of the data going into the X1 engine. Format looks like this:
len_xeng_acc samples of each antenna, for each freq channel.
eg, for FPGA0 on a 4 ant system (assuming 4 x engines too)
128x ant0, freq0
128x ant1, freq0
128x ant2, freq0
128x ant3, freq0
128x ant0, freq4
128x ant1, freq4
etc.
"""
import corr,sys, time, numpy, pylab, struct, pylab

dev_name='snap_x0'

def complex_power(c):
    return c.real ** 2 + c.imag ** 2

def read_all(register,bram_size):
    """Reads from a register on all fpgas"""
    rv = [fpga.read(register,bram_size) for fpga in fpgas]
    return rv


def read_int_all(register):
    """Reads a value from register 'device' for all BEE FPGAs."""
    rv = [fpga.read_int(register) for fpga in fpgas]
#    for f,fpga in enumerate(fpgas):
#        rv.append(fpga.read_int(register))
    return rv

def write_int_all(register,value):
    """Writes to register on all fpgas. 
    Returns 'ok' or string outlining failure."""
    for f,fpga in enumerate(fpgas):
        out = fpga.write_int(register,value)
        if out['status'] != ('SUCCESS'):
            return('''Failed to program %s:%s-%s''' %(servers[f],out['status'],out['data']))
    return('''ok''')

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('snap_x1_plot.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-f', '--sel_fpga', dest='sel_fpga', type='int', default=-1, 
        help='Select a specific fpga to sample. Default: -1 (all)')

    opts, args = p.parse_args(sys.argv[1:])

    if args==[]:
        print 'Please specify a configuration file! \nExiting.'
        exit()

    config = corr.cn_conf.CorrConf(args[0])
    config_status = config.read_all()
    print '\n\nParsing config file %s...%s'%(args[0],config_status)
    sys.stdout.flush()
    if not config_status == 'OK': exit()

    if opts.sel_fpga<1:
        servers = [s['server'] for s in config['servers']]
        fpgas = [corr.udp_client.UDPClient(s['server'], s['port']) for s in config['servers']]
    else:
        servers = [s['server'] for s in config['servers'][opts.sel_fpga]]
        fpgas = [corr.udp_client.UDPClient(s['server'], s['port']) for s in config['servers'][opts.sel_fpga]]
        

    n_ants = config['n_ants']
    n_chans = config['n_chans']
    n_stokes = config['n_stokes']
    n_xeng = config['x_per_fpga'] * len(servers)
    n_chans_xeng = n_chans / n_xeng
    xeng_acc_len=config['xeng_acc_len']
    n_16_words = n_chans_xeng * xeng_acc_len * n_ants


print('Using servers: '),
print(servers)

print 'Expecting %i values out of each descramble block per spectrum.'%n_16_words

print ('Triggering...'),
print '------------------------'
print 'Triggering Capture...',
write_int_all(dev_name+'_ctrl',0)
print write_int_all(dev_name+'_ctrl',1)
time.sleep(10)

bram_size=read_int_all(dev_name+'_addr')[0]['data']+1

bram_name = dev_name+'_'+'bram'
print 'Reading %i values from bram %s...'%(bram_size,bram_name),
bram_dmp=read_all(bram_name,bram_size*4)
sys.stdout.flush()
for f,fpga in enumerate(fpgas):
    if bram_dmp[f]['status'] != 'SUCCESS':
        print 'Failed on %s'%(servers[f])
        exit(0)
print 'ok'

if opts.verbose:
    print 'BRAM DUMPS:'
    for f,fpga in enumerate(fpgas):
        for i in range(bram_size):
            pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])[0]
            print '[%s @ %i] %X'%(servers[f],i,pkt_64bit)




print 'Done. Printing...'
pylab.show()
