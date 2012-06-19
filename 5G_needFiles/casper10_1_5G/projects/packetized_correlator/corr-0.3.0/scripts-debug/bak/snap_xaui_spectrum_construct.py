#!/usr/bin/env python

'''
Grabs the contents of "snap_xaui" for analysis.
Assumes the correlator is already initialsed and running etc.

'''
import corr, time, numpy, pylab, struct, sys

#brams
brams=['bram_msb','bram_lsb','bram_oob']
dev_name = 'snap_xaui'
bram_size=4096

# OOB signalling bit allocations:
mrst_bit = 4
adc_bit = 3
eof_bit = 2
sync_bit = 1
hdr_bit = 0

n_ants_per_ibob=2

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
    p.set_usage('snap_xaui_spectrum_construct.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-n', '--n_captures', dest='n_captures', type='int',default=20,
        help='Capture this number of snap blocks. A greater number results in a complete spectrum. Default: 20')       
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
n_chans = config['n_chans']

report = dict()
snap_levels= dict()

for capture in range(opts.n_captures):
    print '------------------------'
    print 'Triggering Capture %i...'%capture,
    write_int_all(dev_name+'_ctrl',0)
    print write_int_all(dev_name+'_ctrl',3)
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

    #print 'BRAM DUMPS:'
    #print bram_dmp

    print 'Unpacking bram out of band contents...',
    sys.stdout.flush()
    bram_oob=dict()
    for f,fpga in enumerate(fpgas):
        bram_oob[f]={'raw':struct.unpack('>%iL'%bram_size,bram_dmp[brams[2]][f]['data'])}
        bram_oob[f].update({'mrst':[bool(i&(2**mrst_bit)) for i in bram_oob[f]['raw']]})
        bram_oob[f].update({'adc':[bool(i & (2**adc_bit)) for i in bram_oob[f]['raw']]})
        bram_oob[f].update({'eof':[bool(i & (2**eof_bit)) for i in bram_oob[f]['raw']]})
        bram_oob[f].update({'sync':[bool(i&(2**sync_bit)) for i in bram_oob[f]['raw']]})
        bram_oob[f].update({'hdr':[bool(i & (2**hdr_bit)) for i in bram_oob[f]['raw']]})
    print 'Done.'

    print 'Analysing packets...',
    for f,fpga in enumerate(fpgas):
        report[f]=dict()
        report[f]['pkt_total']=0
        pkt_len = 0
        pkt_mcnt = 0
        pkt_ant = 0
        pkt_freq = 0
        for i in range(0,bram_size):
            if bram_oob[f]['adc'][i]:
                adc_amps = struct.unpack('>HHHH',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])
                print '[%s]: ADC amplitude update at index %i: '%(f,i),adc_amps
            elif bram_oob[f]['hdr'][i]:
                pkt_len = 0
                pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*i):(4*i)+4]+bram_dmp['bram_lsb'][f]['data'][(4*i):(4*i)+4])[0]
                pkt_mcnt =(pkt_64bit&((2**64)-(2**16)))>>16 
                pkt_ant = (pkt_64bit&((2**16)-1))+(f*n_ants_per_ibob)
    #                print ('HEADER RECEIVED')
                pkt_freq=pkt_mcnt%n_chans

            elif bram_oob[f]['eof'][i]:
                pkt_len += 1

                sum_polQ_r = 0
                sum_polQ_i = 0
                sum_polI_r = 0
                sum_polI_i = 0

                for pkt_index in range(0,pkt_len):
                    abs_index = i + pkt_index - pkt_len+1
                    pkt_64bit = struct.unpack('>Q',bram_dmp['bram_msb'][f]['data'][(4*abs_index):(4*abs_index)+4]+bram_dmp['bram_lsb'][f]['data'][(4*abs_index):(4*abs_index)+4])[0]
    #                    print 'index: %2i, value %016X'%(pkt_index, pkt_64bit)
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

                if not snap_levels.has_key(pkt_ant):
                    snap_levels[pkt_ant]={'freq':[],'Q_r':[],'Q_i':[],'I_r':[],'I_i':[]}

                snap_levels[pkt_ant]['freq'].extend([pkt_freq])
                snap_levels[pkt_ant]['Q_r'].extend([level_polQ_r])
                snap_levels[pkt_ant]['Q_i'].extend([level_polQ_i])
                snap_levels[pkt_ant]['I_r'].extend([level_polI_r])
                snap_levels[pkt_ant]['I_i'].extend([level_polI_i])
    print 'done'

print '\n\nDone Capturing. Plotting...' 

for ant in snap_levels:
    pylab.figure(ant)
    ax1=pylab.subplot(411)
    pylab.title('Antenna %i\n"Q" input real'%ant)
    pylab.plot(snap_levels[ant]['freq'],snap_levels[ant]['Q_r'],'.',label='ant%i'%ant)
    pylab.setp(ax1.get_xticklabels(), visible=False)

    ax2=pylab.subplot(412,sharex=ax1,sharey=ax1)
    pylab.title('"Q" input imag')
    pylab.plot(snap_levels[ant]['freq'],snap_levels[ant]['Q_i'],'.',label='ant%i'%ant)
    pylab.setp(ax2.get_xticklabels(), visible=False)

    ax3=pylab.subplot(413,sharex=ax1,sharey=ax1)
    pylab.title('"I" input real')
    pylab.plot(snap_levels[ant]['freq'],snap_levels[ant]['I_r'],'.',label='ant%i'%ant)
    pylab.setp(ax3.get_xticklabels(), visible=False)

    pylab.subplot(414,sharex=ax1,sharey=ax1)
    pylab.title('"I" input imag')
    pylab.plot(snap_levels[ant]['freq'],snap_levels[ant]['I_i'],'.',label='ant%i'%ant)
    pylab.ylim((0,1))
    pylab.xlim(0,n_chans)
    pylab.xlabel('Channel')


#    pylab.legend(loc='lower right')
pylab.show()
