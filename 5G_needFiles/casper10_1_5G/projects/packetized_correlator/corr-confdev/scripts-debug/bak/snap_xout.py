#!/usr/bin/env python

'''
Grabs the contents of "snap_xout" for analysis.
Assumes the correlator is already initialsed and running etc.

As yet unfinished. 

Required: 
-limit output printing to one spectrum (currently grabs a bit of data from the next spectrum too)
-scale numbers back to -1:1 range (default correlator ouput is 32.6 format)

Author: Marco Bartolini
2008-09-19

'''
import corr, time, numpy, struct, sys, pylab

#brams ORDERING DOES MATTER!
brams=['bram0', 'bram1', 'bram2', 'bram3']

dev_name = 'snap_xout0'

def join(s1, s2):
    return s1 + "_" + s2

def complex_power(c):
    return c.real ** 2 + c.imag ** 2

def dump_bram(udpc, reg, num_bytes):
    d = udpc.read(reg, num_bytes)
    if d['status'] != 'SUCCESS':
        print 'Err: cannot read bram'
        print 'Exiting'
        sys.exit(0)
    return d['data']

class BaseLineData:
    '''Class used for bram storage. 
Stores value read from snap_xout brams blocks, reordering raw brams data
and converting those into complex numbers on the fly. 
Contains some useful plotting functions.'''
 
    def __init__(self, n_ant):
        self.n_ant = n_ant
        self.n_bls = (n_ant * (n_ant + 1)) / 2
        self.data = numpy.zeros((self.n_bls * 4,), dtype=numpy.complex)
        self.transposed = False

    def eat(self, brams_content):
        row = numpy.zeros((self.n_bls * 4,), dtype=numpy.complex)
        for i in range(self.n_bls):
            for j in range(len(brams)):
                try:
                    row[i * len(brams) + j] = self.read_complex(brams_content[j][i:i+4])
                except:
                    print 'INDEX ERROR at i=' + str(i) + ' j=' + str(j)
                    print 'BRAM SIZE: (' + str(len(brams_content)) + ', ' + str(len(brams_content[0])) + ')' 
                    raise
        self.data = numpy.vstack((self.data, row))

    def read_complex(self, c_str):
        try:
            r = struct.unpack('>h', c_str[:2])[0]
            i = struct.unpack('>h', c_str[2:])[0]
        except:
            print 'Err: unpacking complex number'
            print 'Exiting ...'
            sys.exit()
        return numpy.complex(r, i)

    def plot(self, a1, a2):
        if not self.transposed:
            self.data.transpose()
            self.transposed = True
        num_bl = self._get_bl_index(a1, a2)
        pylab.subplot(411)
        pylab.plot([complex_power(x) for x in self.data[num_bl * 4]])
        pylab.ylabel('BiAq')
        pylab.subplot(412)
        pylab.plot([complex_power(x) for x in self.data[num_bl * 4 + 1]])
        pylab.ylabel('AiBq')
        pylab.subplot(413)
        pylab.plot([complex_power(x) for x in self.data[num_bl * 4 + 2]])
        pylab.ylabel('AqBq')
        pylab.subplot(414)
        pylab.plot([complex_power(x) for x in self.data[num_bl * 4 + 3]])
        pylab.ylabel('AiBi')
        pylab.show()

    def plot_raw(self, a1, a2):
        pass

    def _get_bl_index(self, a1, a2):
        m_order = corr.sim_cn_data.get_bl_order(self.n_ant)
        bl_order = [corr.sim_cn_data.bl2ij(x) for x in m_order]
        return bl_order.index((a1, a2))

    def _get_bl(self, index):
        m_order = corr.sim_cn_data.get_bl_order(self.n_ant)
        return corr.sim_cn_data.bl2ij(m_order[index])
        
        
                
if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('snap_xout.py [options] CONFIG_FILE')
    p.set_description(__doc__)   
    p.add_option('-v', '--verbose', dest='verbose', action='store_true',
        help='Print raw output.')   
    p.add_option('--plot_raw', dest='raw', action='store_true',
        help='Plots raw data instead of power.')
    p.add_option('-f', '--fpga', dest='fpga', type='int', default=0,
        help='FPGA number.')
    p.add_option('-c', '--channel_offset', dest='channel_offset', type='int', default=0,
        help='Optionally specify a starting channel offset. In range of channels on this X engine.')
    p.add_option('--a1', dest='a1', type='int', default=0,
        help='Antenna 1')
    p.add_option('--a2', dest='a2', type='int', default=1,
        help='Antenna 2')
    opts, args = p.parse_args(sys.argv[1:])

    if args==[]:
        print 'Please specify a configuration file! \nExiting.'
        exit()

    config = corr.cn_conf.CorrConf(args[0])
    config_status = config.read_all()
    print '\n\nParsing config file %s...%s' % (args[0],config_status)
    sys.stdout.flush()
    if not config_status == 'OK': exit()

    n_ants = config['n_ants']
    n_chans = config['n_chans']
    n_stokes = config['n_stokes']
    servers = [s['server'] for s in config['servers']]
    n_xeng = config['x_per_fpga'] * len(servers) 
    n_bls = (n_ants * (n_ants + 1) / 2)
    n_chans_xeng = n_chans / n_xeng
    n_16_words = n_bls * n_chans_xeng * 2 * n_stokes
    n_128_words = n_bls * n_chans_xeng


    print 'Expecting %i data values from each X engine (%i bls x %i chans x %i stokes x 2 complex)'%(n_16_words,n_bls,n_chans_xeng,n_stokes)
    print "Instantiating UDP client ...",
    fpga = corr.udp_client.UDPClient(servers[opts.fpga], config['servers'][opts.fpga]['port'])
    print "OK"
    n_read = n_bls*opts.channel_offset
    addr = 2048
    data = BaseLineData(n_ants)
    print "Fetching data from snap_xout bram blocks..."
    while(n_read < n_128_words):
	print 'Triggering capture at offset %i, and waiting for buffers to fill...'%n_read,
	sys.stdout.flush()
        if fpga.write_int(join(dev_name, 'trig_offset'), n_read)['status']!='SUCCESS': 
            print 'Error triggering capture. /n Exiting.'
            exit()
        if fpga.write_int(join(dev_name, 'ctrl'), 0)['status']!='SUCCESS':
            print 'Error triggering capture. /n Exiting.'
            exit()
        if fpga.write_int(join(dev_name, 'ctrl'), 1)['status']!='SUCCESS':
            print 'Error triggering capture. /n Exiting.'
            exit()
        time.sleep(0.1+0.6*n_read/addr)
        print 'ok'

        ans = fpga.read_int(join(dev_name, 'addr'))
        if ans['status'] != 'SUCCESS':
            print 'ERR: error reading ' + join(dev_name, 'addr')
            print 'Exiting ...'
            sys.exit()
        while ans['data']==0:
            print 'Got no data from snap block... retrying'
            time.sleep(1)
            ans = fpga.read_int(join(dev_name, 'addr'))
            if ans['status'] != 'SUCCESS':
                print 'ERR: error reading ' + join(dev_name, 'addr')
                print 'Exiting ...'
                sys.exit()
            
        addr = ans['data']+1
        print 'Reading integration contents %i to %i... '%(n_read,n_read+addr),; sys.stdout.flush()
	sys.stdout.flush()
        words = [dump_bram(fpga, join(dev_name, x), addr * 4) for x in brams] #indexed in bytes
        print 'ok'
        #for i, w in enumerate(words):
        #    print brams[i] + ' : ' + str(len(w)) + 'B'
	#print 'length of words is : %i'%len(words)

        #check if there are any non-zero values
	for i in range(addr):
            if numpy.abs(data.read_complex(words[3][4*i:4*i+4]))>0:
                #find out which frequency channel we're dealing with
                chan=((i+n_read)/n_bls)
                #find out which baselines we're dealing with
                bl=data._get_bl((i+n_read)%(n_bls))
                print '[%i] Channel %i of %i on this Xengine, Baseline %s: '%(i+n_read,chan,n_chans_xeng,bl), data.read_complex(words[3][4*i:4*i+4])

        data.eat(words)
        n_read += addr
    print "OK"

#TRANSPOSE broken
#    print data.data
#    if not opts.raw:
#        data.plot(opts.a1, opts.a2)
