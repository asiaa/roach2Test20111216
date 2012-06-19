#! /usr/bin/env python
"""
Expects UDP packets from a single X engine. 
Plots the DRAM contents and optionally looks for non-zero values.

Defaults for 8 antenna, 2048 channel system with 4 pols (18432 vectors per DRAM_VACC)

Author: Jason Manley
Date: 2007-12-01
"""
import corr.c2m, corr.packet, corr.sim_cn_data, corr.plotdb
import time, numpy, os, struct, pylab

class C2M_RX:
    def __init__(self, mrec, dram_len=18432, dbfile=None):
        self.dram_len=dram_len
        self.pkt_data = None
        self.pkt = corr.packet.CasperN_Packet()
        self.prev_x_eng=0
        # Optional database file for plotting and web-interfacing
#        self.ndb = None
#        self.rawndb = corr.plotdb.NumpyDB(dbfile+'.raw')
        self.cnt = 0
        self.data = numpy.ma.zeros((self.dram_len, 4),dtype=numpy.int32)
        self.quit = False

    def apply_data(self):
#        print self.pkt_data['raw_data'][0:100]
#        print 'Raw data length: %i'%len(self.pkt_data['raw_data'])
        for i in range(0,((self.dram_len)*16),16): #((self.dram_len-1)*4)
            #self.data[(i/16)][0] = self.pkt_data['raw_data'][i:i+16]
            val1=struct.unpack('>I',self.pkt_data['raw_data'][i:i+4])[0]
            val2=struct.unpack('>I',self.pkt_data['raw_data'][i+4:i+8])[0]
            val3=struct.unpack('>I',self.pkt_data['raw_data'][i+8:i+12])[0]
            val4=struct.unpack('>I',self.pkt_data['raw_data'][i+12:i+16])[0]
            self.data[(i/16)] = [val1,val2,val3,val4]
#            print self.data[i/16]

    def find_non_zeros(self,num_int=2048):
        print 'NON ZEROS FOUND:'
        print 'Addr, \t 4x32 bit DRAM contents, \t 4x32bit Per-acc average'
        for i in range(0,len(self.data)):
            if ((self.data[i][0] != 0) or (self.data[i][1] != 0) or (self.data[i][2] != 0) or (self.data[i][3] != 0)): #
                print i,'\t', self.data[i],'\t',(numpy.array(self.data[i])/float(num_int))   
        print 'Done searching for non-zeros'

    def file_data(self, t):
        print 'Recording data for timestamp %d'%t   
        self.data.shape = (self.dram_len, 4)        
        for i in range(0,self.dram_len):
            rawd=self.data[i,:]
            self.rawndb.write('vector%i' %i, rawd)

        # Clear the data buffer
        self.data.shape = (self.dram_len, 4)
        self.data *= 0
        print 'Filed.'

    def plot_data(self,t):
        print 'Plotting data for timestamp %d'%t
        pylab.figure()
        ax1 = pylab.subplot(411)
        # Make this axis invisible (to share with the one below it)
        pylab.setp(ax1.get_xticklabels(), visible=False)
        pylab.xlim(0,self.dram_len)
        pylab.plot(self.data[...,0])
        pylab.setp(ax1.get_xticklabels(), visible=False)
        pylab.ylabel('unsigned Amp')
        pylab.title('most significant 32 bits')
        pylab.grid()

        # Share the x axis with plot above it
        pylab.subplot(412, sharex=ax1)
        pylab.plot(self.data[...,1])
        pylab.xlim(0,self.dram_len)
        pylab.ylabel('unsigned Amp')
        pylab.grid()

        # Share the x axis with plot above it
        pylab.subplot(413, sharex=ax1)
        pylab.plot(self.data[...,2])
        pylab.xlim(0,self.dram_len)
        pylab.ylabel('unsigned Amp')
        pylab.grid()
    
        # Share the x axis with plot above it
        pylab.subplot(414, sharex=ax1)
        pylab.title('least sig 32 bits')
        pylab.plot(self.data[...,3])
        pylab.xlim(0,self.dram_len)
        pylab.ylabel('unsigned Amp')
        pylab.grid()

        pylab.show()
        print 'Done plotting'

    def process_packets(self,num_listeners=1, port=8888, num_acc=8192, look_non_zeros=False, payload_len=8192, hdr_size=21, verbose=False, req_x_eng=0):
        """Assumes there are an equal number of x engines as antennas. Rewritten in Sept 2007. Confirmed good for 8 ant sys."""
        correlator=corr.packet.CasperN_RX_correlator(port=port)
        #total_p_size = 2 * self.n_stokes * self.n_bls * self.n_chans/self.n_ants
        total_p_size = self.dram_len*4
        self.req_x_eng=req_x_eng
        print 'expecting total DRAM vector length of %i (or data length of %i 32 bit numbers)'%(self.dram_len,total_p_size)

        while not self.quit:
            """Called whenever a new packet arrives. """
            raw_p=correlator.get_a_packet()

            # unpack the incoming packet
            p = self.pkt.unpack(raw_p)

            if not p == None:
                #print 'Decoded a packet with keys',
                #print p.keys()
                p['data'] = list(p['data'])
                
                if verbose:
                    print ' Got offset %i for X engine %i, timestamp %d with labelled length %i. Raw length %i, %i vectors.' %(p['offset'],p['xeng'],p['time'],p['data_size'],len(raw_p),len(p['data']))
                
                if self.pkt_data == None:
                    if p['offset']==0:
                        print 'Got first packet for X engine ',p['xeng']
                        self.pkt_data = p
                        self.cnt = p['data_size']
                    else:
                        if verbose:
                            print 'Waiting for new X engine start.'
                else:
                    # we expect to receive packets in order, check that this is the case
                    if self.cnt != p['offset']:
                      print 'Got index %i for x engine %i instead of %i for x engine %i'%(p['offset'], p['xeng'], self.cnt, self.prev_x_eng)
                      self.cnt = 0
                      #self.quit = True
                    else:
                        #append this new data to the packet
                        self.pkt_data['data'] += p['data']
                        self.pkt_data['raw_data'] += p['raw_data']
                        print ('.'),
                        sys.stdout.flush()

                    if verbose:
                        print('pkt_data length now %i'%len(self.pkt_data['data']))
                        print('pkt_data raw length now %i'%len(self.pkt_data['raw_data']))

                    #check to see if we need to process this x engine
                    if (len(self.pkt_data['data']) == total_p_size):
                        if (p['xeng'] == self.prev_x_eng):
                            self.apply_data()
                            print "\nGot all the data for X engine %i."%self.prev_x_eng
                            if (p['xeng']==self.req_x_eng):
                                if look_non_zeros:
                                    print "Looking for non-zeros"
                                    self.find_non_zeros(num_int=num_acc)
                                self.plot_data(self.pkt_data['time'])
                                self.quit = True
                            else:
                                print '\n"These are not the packets you are looking for..." "Move along!"' 
                        self.cnt = 0
                        self.pkt_data=None

                    else:
                        self.cnt += p['data_size'] 
                        self.prev_x_eng=p['xeng']    
                    
            else:
               print '\n ERR decoding packet. Exiting.'
               self.quit = True
   
#  ____            _       _     ___       _             __                
# / ___|  ___ _ __(_)_ __ | |_  |_ _|_ __ | |_ ___ _ __ / _| __ _  ___ ___ 
# \___ \ / __| '__| | '_ \| __|  | || '_ \| __/ _ \ '__| |_ / _` |/ __/ _ \
#  ___) | (__| |  | | |_) | |_   | || | | | ||  __/ |  |  _| (_| | (_|  __/
# |____/ \___|_|  |_| .__/ \__| |___|_| |_|\__\___|_|  |_|  \__,_|\___\___|
#                   |_|                                                    

if __name__ == '__main__':
    import sys
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('cn_rx.py [options]')
    p.set_description(__doc__)
    p.add_option('-d', '--dbfile', dest='dbfile', default='dram_dmp',
        help='Write output data to a database file (for plotting).  The usual place for this is dram_dmp also writes a raw file and an info file')
    p.add_option('-k', '--udp_port', dest='udp_port', type='int', default=8888, 
        help='Port to use for UDP correlator data reception.  Default is 8888.')
    p.add_option('-p', '--payload_len', dest='payload_len',type='int',default=8192,
        help='Expected maximum length of packets in bytes. Default=8192')
    p.add_option('-a', '--num_acc', dest='num_acc',type='int',default=8192,
        help='Number of accumulations (used for scaling back output). Default=8192')
    p.add_option('-l', '--dram_len', dest='dram_len', type='int', default=18432, 
        help='Number of 128 bit vectors to capture from DRAM.  Default is 18432') 
    p.add_option('-v', '--verbose', dest='verbose', action='store_true',
        help='Be verbose (good for debugging)')
    p.add_option('-z', '--look_non-zeros', dest='look_non_zeros', action='store_true',
        help='Optionally look for non-zeros in the data.')
    p.add_option('-x', '--x_engine_num', dest='req_x_eng', type='int', default=0,
        help='Plot this X engine (dram dimm). default=0')
    opts, args = p.parse_args(sys.argv[1:])
  
    udp_rx = C2M_RX(None, dram_len=opts.dram_len, dbfile=opts.dbfile)

    rp=corr.packet.CasperN_Packet()

    print 'Listening on port %i' %opts.udp_port
    udp_rx.process_packets(port=opts.udp_port, payload_len=opts.payload_len, num_acc=opts.num_acc, look_non_zeros=opts.look_non_zeros, hdr_size=rp.get_hdr_size(),verbose=opts.verbose, req_x_eng=opts.req_x_eng)
