#!/usr/bin/python
"""
Record data to Miriad files from the CasperN correlator.
Author: Aaron Parsons
Modified: Jason Manley 
Date: 2007/12/13
Revisions: 1.0

Rev 1.0:    JRM UDP-only source
                New corr config file for params
                only records for one file, then terminates    
                bandpass recording fixes
                

"""

import corr.c2m, corr.packet, corr.sim_cn_data, corr.plotdb, corr.borph, corr.cn_conf, time, numpy, os

VALID_CHANS = numpy.array(range(300) + range(1700,2048))
ANT_EQ_SCALE = [1,1,1,1,1,1,1,1]


class C2M_RX:
    """An interface for recording UDP correlator transmissions to Miriad 
    UV files.  Subclasses twisted's event-driven DatagramProtocol for handling 
    UDP sockets."""
    def __init__(self, mrec, n_chans=2048, n_ants=8, acc_len=8192, adc_clk=0.600, 
        xeng_acc_len=128, n_stokes=4, ddc_mix_freq=0.25, ddc_decimation=4,
        t_per_file=3600, dbfile=None, eq_polys=[100]):
        """mrec        = A MiriadRecorder (from corr.c2m).
        t_per_file  = The number of seconds of data written to each Miriad file.
        dbfile      = An optional database file useful for plotting and web 
                      interfaces."""
        self.mrec = mrec
        self.t_per_file = t_per_file
        self.n_ants = n_ants
        self.n_stokes = n_stokes
        self.stokes = ['xy','yx','xx','yy'][:n_stokes]
        self.n_chans = n_chans
        self.acc_len = acc_len
        self.adc_clk_rate = adc_clk
        self.xeng_acc_len = xeng_acc_len
        self.ddc_mix_freq = ddc_mix_freq
        self.ddc_decimation = ddc_decimation
        self.eq_polys = eq_polys
        self.bl_order = corr.sim_cn_data.get_bl_order(self.n_ants)
        self.n_bls = len(self.bl_order)
        self.data = numpy.zeros((self.n_chans, self.n_bls*self.n_stokes*2),dtype=numpy.int32)
        self.pkt = corr.packet.CasperN_Packet(endian='<')
        self.start_t = 0
        self.gain = xeng_acc_len * acc_len

        # Optional database file for plotting and web-interfacing
        self.ndb = None
        if not dbfile is None: 
            print "Starting dbfile %s"%dbfile
            self.ndb = corr.plotdb.PlotDB(dbfile,mode='c')
            self.ndb.WriteInfoFile(self.adc_clk_rate,self.ddc_decimation,self.ddc_mix_freq,self.n_chans,self.n_ants,self.n_stokes,self.xeng_acc_len,self.acc_len, self.eq_polys)

    def open_file(self):
        """Start a Miriad file called 'zen.uv.tmp' in current directory."""
        print 'Starting file: zen.uv.tmp'
        if os.path.exists('zen.uv.tmp'): os.system('rm -rf zen.uv.tmp')
        self.mrec.open_uv('zen.uv.tmp')
        self.start_t = time.time()

    def close_file(self):
        """Close 'zen.uv.tmp' and rename it to 'zen.<Julian.Date>.uv' 
        according to its start time."""
        jd_start_t = self.mrec.conv_time(self.start_t)
        filename = 'zen.%7.5f.uv' % (jd_start_t)
        print 'Renaming zen.uv.tmp to %s' % (filename)
        self.mrec.close_uv(filename)
        self.start_t = 0

    def set_bandpass(self):
        """Setup the bandpass to be saved to this Miriad file."""
        bps = []
        for i in range(self.n_ants):
            bp = numpy.polyval(self.eq_polys[i], numpy.arange(self.n_chans))
            print 'BP[%i]:'%i,bp
            bp = numpy.clip(bp, 0, 2**17 - 1)
            bps.append(bp)
        bps = numpy.concatenate(bps, axis=0)
        bps = bps.astype(numpy.complex)
        bps = 1.0/bps
        bps.shape=(self.n_ants,self.n_chans)
        self.mrec.set_bandpass(bps)

    def apply_data(self, pkt_data):
        for c in range(self.n_chans / self.n_ants):
            chan = c * self.n_ants + pkt_data['xengine_num']
            #fix the spectrum (move second half to first half):
            if chan < (self.n_chans/2):
                offset1 = (c+(self.n_chans/self.n_ants/2)) * self.n_bls * self.n_stokes * 2 
                offset2 = (c+(self.n_chans/self.n_ants/2)+1) * self.n_bls * self.n_stokes * 2                
            else:
                offset1 = (c-(self.n_chans/self.n_ants/2)) * self.n_bls * self.n_stokes * 2
                offset2 = (c-(self.n_chans/self.n_ants/2)+1) * self.n_bls * self.n_stokes * 2

            try: self.data[chan] = pkt_data['data'][offset1:offset2]
            except(ValueError): 
                print 'There was an error processing the last data chunk' \
                        ' in range %i:%i'%(offset1,offset2)
                
    def file_data(self, t):
        print 'Recording data for timestamp %d' % t           
        self.data.shape = (self.n_chans, self.n_bls, self.n_stokes, 2)
        # Write spectrum for each stokes, baseline to file.
        for s,pol in enumerate(self.stokes):
            for b, bl in enumerate(self.bl_order):
                i, j = corr.sim_cn_data.bl2ij(bl)
                d = self.data[:,b,s,:].astype(numpy.float)
                #scale the data - fixed-point format is 32_6 by default
                d /= self.gain
                #turn the two independant values into a single complex number:
                dfloat = d[...,0] - d[...,1]*1j
                # Write to MIRIAD file
                self.mrec.record(t, i, j, pol, dfloat)
                # Optionally write to database file as well
                if not self.ndb is None:
                    self.ndb.write('%i-%i,%s' % (i, j, pol), dfloat)
        # Clear the data buffer
        self.data.shape = (self.n_chans, self.n_bls * self.n_stokes * 2)
        self.data *= 0

    def process_packets(self, num_listeners=1, port=8888, payload_len=8192, 
            hdr_size=21, verbose=False,single_capture=False):
        """Assumes there are an equal number of x engines as antennas.
        Rewritten in Sept 2007. Confirmed good for 8 ant sys."""
        correlator = corr.packet.CasperN_RX_correlator(port=port, 
            payload_len=payload_len, hdr_size=hdr_size, endian='>')
        total_p_size = 2 * self.n_stokes * self.n_bls * self.n_chans/self.n_ants
        cnt = 0
        prev_x_eng = None
        pkt_data = None
        finished = False

        while not finished:
            # Called whenever a new packet arrives.
            raw_p = correlator.get_a_packet()

            # unpack the incoming packet
            p = self.pkt.unpack(raw_p)
            if not p == None:
                p['data'] = list(p['data'])
                if verbose:
                    print ' Got index %i for X engine %i, timestamp %d with labelled ' \
                        'length %i. Raw length %i, %i vectors.' %(p['index'], 
                        p['xengine_num'],p['time'],p['data_size'],
                        len(raw_p),len(p['data']))

                #Initialise (only entered at start of new integration):
                if pkt_data == None:
                    if p['index']==0:
                        if verbose:
                            print 'Starting a new X engine: ', 
                        print p['xengine_num'],
                        sys.stdout.flush()
                        pkt_data = p
                        cnt = 1
                    else:
                        if verbose: print 'Waiting for new X engine start.'
                #We got a useful packet - try and process it
                else:
                    # we expect to receive packets in order, check that this is the case
                    if cnt != p['index']:
                      print 'Got index %i for x engine %i instead of %i for x engine %i' \
                            % (p['index'], p['xengine_num'], cnt, prev_x_eng)
                      #insert zeros for the range of missing values
                      if (p['xengine_num'] == prev_x_eng):
                            for cntr in range(cnt, p['index']): 
                                print 'Filled in a dummy packet for index %i'%cntr
                                pkt_data['data'] += list(numpy.zeros(len(p['data'])))
                            # recover and continue:
                            cnt = p['index']
                      else:
                            print "We're dealing with x engine %i now. Unlucky. Forfeiting previous x engine %i" \
                                % (p['xengine_num'], prev_x_eng)
                            pkt_data = p
                            cnt = 0
                    else:
                        #append this new data to the packet
                        pkt_data['data'] += p['data']
                    if verbose: print('pkt_data length now %i' % len(pkt_data['data']))
                    #check to see if we need to process this x engine
                    if (len(pkt_data['data']) == total_p_size):
                        if (p['xengine_num'] == prev_x_eng):
                            self.apply_data(pkt_data)
                            if verbose: print "X engine %i's data processed." % prev_x_eng
                            # If we've started a new integration, write the old one to file
                            if prev_x_eng == (self.n_ants-1):
                                print 'INTEGRATION COMPLETE'
                                self.file_data(pkt_data['time'])
                                #check if we need to stop:
                                if  time.time() - self.start_t > self.t_per_file and self.start_t > 0:
                                    self.close_file()
                                    if not single_capture:
                                        self.open_file()
                                    else: 
                                        finished = True  
                            cnt = 0
                            pkt_data = None
                        else:
                            print 'Error with packet size, discarding x engine'
                            pkt_data = None
                    else:
                        cnt += 1 
                        prev_x_eng = p['xengine_num']    
            else:
               print 'ERR decoding packet.'


   
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
    p.set_usage('cn_rx.py [options] -c <config file>')
    p.set_description(__doc__)

    p.add_option('-c', '--config_file', dest='config_file', default=None,
        help='The correlator configuration file.')

    p.add_option('-v', '--verbose', dest='verbose', action='store_true',
        help='Be verbose (good for debugging)')

    p.add_option('-s', '--single_capture', dest='single_capture', action='store_true',
        help='Only do a single capture (one MIRIAD file). Default: continuously create new MIRIAD files.')
    opts, args = p.parse_args(sys.argv[1:])

    if not opts.config_file:
        print 'Please specify a configuration file! \nExiting.'
        exit()

    config = corr.cn_conf.CorrConf(opts.config_file)
    if not config.file_exists():
        print 'Could not file config file %s! \nExiting.'%opts.config_file
        exit()

    config_status = config.read_all()   
    print '\n\nParsing config file %s...%s'%(opts.config_file,config_status)
    if not config_status == 'OK':
        exit()

    ANTPOS = [config['antennas']['pos'][a] for a in range(config['n_ants'])]
    ants = [ANTPOS[a] for a in config['antennas']['order']] 
    LOC = config['antennas']['location']
    ADC_CLK = config['adc_clk']
    UDP_PORT = config['udp_port']
    X_PER_FPGA = config['x_per_fpga']
    DDC_MIX_FREQ = config['ddc_mix_freq']
    DDC_DECIMATION = config['ddc_decimation']
    N_CHANS = config['n_chans']
    N_STOKES = config['n_stokes']
    XENG_ACC_LEN = config['xeng_acc_len']
    ACC_LEN = config['acc_len']
    CLK_PER_SYNC = config['clk_per_sync']
    N_ANTS = config['n_ants']
    T_PER_FILE = config['t_per_file']
    DB_FILE = config['db_file']
    PAYLOAD_LEN = config['max_payload_len']

    DEFAULT_EQ=config['antennas']['EQ']

    n_bls = N_ANTS * (N_ANTS+1.0)/2

    print 'Listening on port %i' %UDP_PORT
    int_size = 2 * N_STOKES * n_bls * N_CHANS
    print 'Expecting integration sizes of %i vectors, or %i bytes'%(int_size, int_size*4)

    mrec = corr.c2m.MiriadRecorder(nchans=N_CHANS, ants=ants, 
        acc_len=ACC_LEN, adc_clk_rate=ADC_CLK, 
        comp_chans=N_CHANS, clk_per_sync=CLK_PER_SYNC, 
        n_stokes=N_STOKES, ddc_mix_freq=DDC_MIX_FREQ, 
        ddc_decimation=DDC_DECIMATION, location=LOC)

    udp_rx = C2M_RX(mrec, n_chans=N_CHANS, n_ants=N_ANTS, 
        acc_len=ACC_LEN, adc_clk=ADC_CLK, xeng_acc_len=XENG_ACC_LEN, 
        n_stokes=N_STOKES, ddc_mix_freq=DDC_MIX_FREQ, 
        ddc_decimation=DDC_DECIMATION, t_per_file=T_PER_FILE, dbfile=DB_FILE,eq_polys=DEFAULT_EQ)

    rp = corr.packet.CasperN_RawPacket()

    udp_rx.set_bandpass()
    udp_rx.open_file()

    udp_rx.process_packets(port=UDP_PORT, payload_len=PAYLOAD_LEN,
            hdr_size=rp.get_hdr_size(),verbose=opts.verbose,single_capture=opts.single_capture)

    
