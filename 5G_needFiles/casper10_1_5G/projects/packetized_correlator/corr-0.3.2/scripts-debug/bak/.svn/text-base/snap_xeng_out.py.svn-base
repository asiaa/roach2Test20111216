#!/usr/bin/env python

'''
Grabs the contents of "snap_xout1" (one per FPGA) at the output of the X eng
and prints any non-zero values.
Assumes the correlator is already initialsed and running etc.

'''

import corr, time, numpy, pylab, struct, sys

#brams
brams=['bram0','bram1','bram2','bram3']
dev_name = 'snap_xout1'
bram_size=2048

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
    
def rst_cnt():
    """Resets all error counters"""
    write_int_all('tvg_sel', 0)
    rv = write_int_all('tvg_sel', 1 << 8)
    time.sleep(1)
    write_int_all('tvg_sel', 0)
    return rv


if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('snap_xeng_out.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-t', '--man_trigger', dest='man_trigger', action='store_true',
        help='Trigger the snap block manually')   
    p.add_option('-a', '--print_all', dest='print_all', action='store_true', 
        help='Print all the decoded results')
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

x_per_fpga = config['x_per_fpga']
n_ants = config['n_ants']
n_bls = n_ants * (n_ants+1)/2

if opts.man_trigger:
    man_trigger = 2
else:
    man_trigger = 0

report = dict()

print '------------------------'
print 'Triggering Capture...',
print rst_cnt()
time.sleep(2)

bram_dmp=dict()
for bram in brams:
    bram_name = dev_name+'_'+bram
    print 'Reading bram %s...'%bram_name,
    bram_dmp[bram]=read_all(bram_name,bram_size*4)
    sys.stdout.flush()
    for f,fpga in enumerate(fpgas):
        if bram_dmp[bram][f]['status'] != 'SUCCESS':
            print 'Failed on %s'%(servers[f])
            exit(0)
    print 'ok'

print 'Unpacking bram contents...',
sys.stdout.flush()

bram_data=dict()
for f,fpga in enumerate(fpgas):
    bram_data[f]=dict()
    for bram in brams:
        bram_data[f][bram]=struct.unpack('>%ih'%(bram_size*2), bram_dmp[bram][f]['data'])
print 'Done.'

for f,fpga in enumerate(fpgas):
    print 'X engine %i'%f*x_per_fpga
    print '--------------------'
    
    print 'Checking for non-zero values:'

    for bram in brams:
        for i in range(bram_size):
            if (bram_data[f][bram][i*2] != 0) or (bram_data[f][bram][2*i+1] != 0) or (opts.print_all):
                bln=corr.sim_cn_data.bl2ij(corr.sim_cn_data.get_bl_order(n_ants)[((i)%n_bls)])
                print '[%s], %s, Index: %i. \t freq slice %i. \t raw value (complex): %i and %i. \t BL='%(servers[f], bram, i, ((i)/n_bls), bram_data[f][bram][i*2],bram_data[f][bram][2*i+1]),bln
        
    print 'Done with %s, X engine %i'%(servers[f],f*x_per_fpga)
    print '--------------------'

print 'Done with all'
