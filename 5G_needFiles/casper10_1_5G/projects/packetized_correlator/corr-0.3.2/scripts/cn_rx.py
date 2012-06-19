#!/usr/bin/python
"""
Record data to Miriad files from the CasperN correlator.
Author: Aaron Parsons
Modified: Jason Manley, Griffin Foster

Revisions:
2009-03-21: JRM Stripped out circular buffer

2009-02-03: GSF Write empty inegrations when incorrect packets received

2008-09-10: JRM added support for different n_xeng/n_ants combinations

2008-03-28: JRM channel agility bugfix

2008-02-08: JRM circular buffer for out-of-order packet reception
                selective single/multiple miriad file write
                new config file format
                stored integrations now correct from first one (free with circular buffer)
                receive packets now in seperate thread
                clean exit (closes miriad files after ctl-c)

2008-01-30: JRM UDP-only source
                New corr config file for params
                option to only record one file, then terminate
                bandpass recording fixes
                

"""

import corr.c2m, corr.packet, corr.sim_cn_data, corr.plotdb, corr.borph, corr.cn_conf
import time, numpy, os, threading, subprocess


class C2M_RX:
    """An interface for recording UDP correlator transmissions to Miriad 
    UV files.  Subclasses twisted's event-driven DatagramProtocol for handling 
    UDP sockets."""
    def __init__(self, loc, ants, n_chans=2048, n_xeng=8, acc_len=8192, 
        adc_clk=0.600, xeng_acc_len=128, n_stokes=4, ddc_mix_freq=0.25, 
        ddc_decimation=4, clk_per_sync=(2**18),t_per_file=3600, dbfile=None, 
        eq_polys=[1], single_capture=False, verbose=False,port=8888, buffer_size=8192):
        """t_per_file  = The number of seconds of data written to each Miriad file.
        dbfile      = An optional database file useful for plotting and web 
                      interfaces."""
        print 'Location: ',loc
        self.mrec = corr.c2m.MiriadRecorder(nchans=n_chans, ants=ants, 
            acc_len=acc_len, adc_clk_rate=adc_clk, 
            comp_chans=n_chans, clk_per_sync=clk_per_sync, 
            n_stokes=n_stokes, ddc_mix_freq=ddc_mix_freq, 
            ddc_decimation=ddc_decimation, location=loc)

        self.t_per_file = t_per_file
        self.n_ants = len(ants)
        self.n_stokes = n_stokes
        self.n_xeng = n_xeng
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
        self.pkt = corr.packet.CasperN_Packet(endian='>')
        self.start_t = 0
        self.gain = xeng_acc_len * acc_len
        self._quit=False
        self.single_capture=single_capture
        self.verbose=verbose
        self.port = port
        self.buffer_size=buffer_size
        #The timestamps received are MCNT values from the correlator. The scale factor converts it to seconds. Offset makes it since UNIX epoch. 
        # The offset value is auto-calculated based on this machine's local time.
        self.timestamp_scale_factor = 1./(adc_clk/ddc_decimation*(10**9))
        self.timestamp_offset = 0.0
        self.int_time = float(self.acc_len)*self.xeng_acc_len*self.n_chans/(self.adc_clk_rate*1000000000.0/self.ddc_decimation)

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

    def process_integration(self, data, timestamp):
        """
        data is a 2D array of shape 
        n_xeng x (2 *n_stokes*n_bls*n_chans per x_eng)

        timestamp is float in seconds since unix epoch.
        """
        for x in range(self.n_xeng):
            self.apply_data(x,data[x])
        self.file_data(timestamp)
        
        if (time.time() - self.start_t) > self.t_per_file and self.start_t>0:
            self.close_file()
            if not self.single_capture:
                self.open_file()
            else:
                print 'Grabbed a single file... exiting.'
                self._quit=True

    def apply_data(self, xeng, data):
        """
        xeng is the number of this x engine
        data is a list of all data for this x engine
        """
        for c in range(self.n_chans / self.n_xeng):
            chan = c * self.n_xeng + xeng
            #fix the spectrum (move second half to first half):
            if chan < (self.n_chans/2):
                offset1 = (c+(self.n_chans/self.n_xeng/2)) * self.n_bls * self.n_stokes * 2 
                offset2 = offset1 + self.n_bls * self.n_stokes * 2                
            else:
                offset1 = (c-(self.n_chans/self.n_xeng/2)) * self.n_bls * self.n_stokes * 2
                offset2 = offset1 + self.n_bls * self.n_stokes * 2

            try: self.data[chan] = data[offset1:offset2]
            except(ValueError): 
                print 'There was an error processing the last data chunk' \
                        ' in range %i:%i'%(offset1,offset2)
                
    def file_data(self, t):
        #print 'Recording data for timestamp %f' % t           
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

    def start(self):
        """Starts reception "process_packets" in a new thread."""
        self._rx_thread = threading.Thread(target=self._process_packets,args=())
        #self._rx_thread.setDaemon(1)
        print 'Beginning RX thread...'
        self._rx_thread.start()

    def stop(self):
        print 'Stopping...'
        self._quit = True
        self.close_file()
        #self._rx_thread.join()

    def conv_time(self, timestamp):
        return timestamp*self.timestamp_scale_factor+self.timestamp_offset 

    def conv_time_str(self, timestamp):
        return time.strftime('%H:%M:%S',time.localtime(self.conv_time(timestamp)))

    def _process_packets(self):
        """Use "start" function. Only tested for receiving in-order data from single source."""
        correlator = corr.packet.CasperN_RX_correlator(port=self.port, buffer_size=self.buffer_size,timeout=self.int_time*2)
        pkt = corr.packet.CasperN_Packet(endian='<')

        total_integration_words = 2 * self.n_stokes * self.n_bls * self.n_chans
        #total_per_x is the number of words per x engine of one integration
        total_per_x = total_integration_words/self.n_xeng
        word_size = pkt.word_size

        xeng_data=numpy.zeros([self.n_xeng,total_per_x])
        xeng_rcvd=numpy.zeros([self.n_xeng,total_per_x])
        last_timestamp=0
        total_rcvd=0

        pckt_err_cnt = 0
        int_cnt = 0
        bad_int_flag = 0
        bad_int_cnt = 0


	if self.verbose:
            print 'Total integration size: %i words or %i bytes'%(total_integration_words,total_integration_words*word_size)
            print 'Total dump size from each x engine: %i values, %i bytes, %i 128-bit DRAM vectors'%(total_per_x,total_per_x*word_size,total_per_x*word_size/16)

        #get a starting timestamp:
        print 'Waiting for first correlator output packet to determine starting time...',
        sys.stdout.flush()
        p = pkt.unpack(correlator.get_a_packet())
        if p == None:
            print 'ERR: couldnt get a good packet to determine starting time. Exiting...'
            exit()

        last_timestamp = p['time']
        last_offset=0
        
        #timestamps (MCNTs) start at zero when an observation is begun. We need to calculate the actual time the observation was begun.
        #timestamp_offset stores this value in seconds since the unix epoch (it is a float, so is accurate to more than the nearest second...
        # but there would be some network delay in the first packet reaching us, and this computers time is also probably only as accurate as NTP can make it...
        # so the stored absolute timestamps should not be taken as gospel.)

        self.timestamp_offset = time.time() - p['time'] * self.timestamp_scale_factor
        print 'Locked onto timestamp %i (%s).'%(p['time'],self.conv_time_str(p['time']))

        try:
            while not self._quit:

                # Get a packet and unpack
                p = pkt.unpack(correlator.get_a_packet())
                if p == None:
                    print 'ERR: Packet unpack error. Ignoring packet.'
                else:
                    if self.verbose:
                        print ' Got offset %i for X engine %i, timestamp %d with labelled length %i. %i numbers.' %(p['offset'], p['xeng'],p['time'],p['data_size'], len(p['data']))

                    if self.verbose: print 'Offset difference: %i'%(p['offset']-last_offset)
                    last_offset=p['offset']

                    #Does the timestamp differ from the last one received? If so, zero the receive buffer and start a new integration.
                    if p['time'] != last_timestamp:
                        if self.verbose: print 'Timestamp differs. Start of new integration. Got raw %i (%s). Last timestamp %i (%s) with %i/%i received.'%(p['time'],self.conv_time_str(p['time']),last_timestamp,self.conv_time_str(last_timestamp),xeng_rcvd.sum(),total_integration_words)

                        #Check to see if we've received a valid timestamp
                        if p['time'] < last_timestamp:
                            print 'ERR: Timestamp is in the past! Correlator was probably restarted. Locking onto new timestamp...',
                            self.timestamp_offset = time.time() - p['time']  * self.timestamp_scale_factor
                            print 'Locked onto timestamp %i (%s).'%(p['time'],self.conv_time_str(p['time']))
                            int_cnt=0

                        #Check if we received all the data for the entire integration and need to save it:
                        if xeng_rcvd.sum() != total_integration_words and int_cnt>0:
                            print 'Only received %i/%i words for integration with timestamp %i (%s). Integration will be zeroed.'%(xeng_rcvd.sum(),total_integration_words,last_timestamp,self.conv_time_str(last_timestamp))
                            bad_int_flag = 1

                        #check to see if the integration was flagged
                        if bad_int_flag == 1:
                            bad_int_cnt +=1
                            print 'Zeroing integration...'
                            xeng_data=numpy.zeros([self.n_xeng,total_per_x])

                        if int_cnt == 0:
                           print 'Ignoring first integration.'
                        else:
                            print '%i (%i bad integrations so far): Saving integration with timestamp %i (%s) %2.2f seconds ago.'%(int_cnt, bad_int_cnt, last_timestamp, self.conv_time_str(last_timestamp),(p['time']-last_timestamp)*self.timestamp_scale_factor)
                            self.process_integration(xeng_data,self.conv_time(last_timestamp))

                        #reset this data:
                        last_timestamp = p['time']
                        xeng_data=numpy.zeros([self.n_xeng,total_per_x])
                        xeng_rcvd=numpy.zeros([self.n_xeng,total_per_x])
                        bad_int_flag = 0
                        int_cnt +=1



                    #Buffer this packet:
                    start_offset = p['offset']/word_size
                    stop_offset = start_offset + p['data_size']/word_size

                    #Sanity check before appending this packet to the buffer
                    if stop_offset > total_per_x:
                        print pckt_err_cnt, "ERR: Received too many packet from X engine %i for integration %i (%s). Integration will be zeroed."%(p['xeng'],p['time'],self.conv_time_str(p['time']))
                        pckt_err_cnt +=1
                        bad_int_flag = 1
                    else:
                        if self.verbose: print 'Writing timestamp %i (%s), %i : %i'%(p['time'],self.conv_time_str(p['time']),start_offset,stop_offset)
                        xeng_data[p['xeng']][start_offset:stop_offset]=p['data']
                        xeng_rcvd[p['xeng']][start_offset:stop_offset]=1
                    

    



        except(KeyboardInterrupt):
            print 'Keyboard interrupt...',
            self.stop()   



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
    p.set_usage('cn_rx.py [options] CONFIG_FILE')
    p.set_description(__doc__)

    p.add_option('-v', '--verbose', dest='verbose', action='store_true',
        help='Be verbose (good for debugging)')

    p.add_option('-s', '--single_capture', dest='single_capture', action='store_true',
        help='Only do a single capture (one MIRIAD file). Default: continuously create new MIRIAD files.')
    opts, args = p.parse_args(sys.argv[1:])

    if args==[]:
        print 'Please specify a configuration file! \nExiting.'
        exit()

    config = corr.cn_conf.CorrConf(args[0])
    config_status = config.read_all()
    print '\n\nParsing config file %s...%s'%(args[0],config_status)
    sys.stdout.flush()
    if not config_status == 'OK': exit()

    ANTPOS = [config['antennas']['pos'][a] for a in range(config['n_ants'])]
    ants = [ANTPOS[a] for a in config['antennas']['order']] 
    LOC = config['antennas']['location']
    ADC_CLK = config['adc_clk']
    UDP_PORT = config['rx_udp_port']
    X_PER_FPGA = config['x_per_fpga']
    DDC_MIX_FREQ = config['ddc_mix_freq']
    DDC_DECIMATION = config['ddc_decimation']
    N_CHANS = config['n_chans']
    N_STOKES = config['n_stokes']
    XENG_ACC_LEN = config['xeng_acc_len']
    ACC_LEN = config['acc_len']
    CLK_PER_SYNC = config['clk_per_sync']
    N_ANTS = config['n_ants']
    N_XENG = X_PER_FPGA*len(config['servers'])
    T_PER_FILE = config['t_per_file']
    DB_FILE = config['db_file']
    RX_BUFFER_SIZE = config['rx_buffer_size']

    DEFAULT_EQ=config['eq']['eq_polys']

    n_bls = N_ANTS * (N_ANTS+1.0)/2
    int_time = float(N_CHANS)*XENG_ACC_LEN*ACC_LEN/(ADC_CLK*1000000000/DDC_DECIMATION)

    print 'Processing %.2f MHz bandwidth centred at %.2f MHz'%(ADC_CLK*1000/DDC_DECIMATION,ADC_CLK*1000*DDC_MIX_FREQ)
    print 'Integrating for %.2f seconds'%int_time
    print 'Listening on port %i' %UDP_PORT

    print '\n Please execute cn_tx.py with the following arguments: sudo cn_tx.py -m %i -i THIS_IP_ADDR -k %i -x %i -l %i PID1 PID2 PID3 PID4'%(XENG_ACC_LEN*ACC_LEN*N_CHANS, UDP_PORT, X_PER_FPGA, RX_BUFFER_SIZE/2)

    udp_rx = C2M_RX(loc=LOC, n_chans=N_CHANS, ants=ants, n_xeng=N_XENG,
        acc_len=ACC_LEN, adc_clk=ADC_CLK, xeng_acc_len=XENG_ACC_LEN, 
        n_stokes=N_STOKES, ddc_mix_freq=DDC_MIX_FREQ, verbose=opts.verbose,
        ddc_decimation=DDC_DECIMATION, t_per_file=T_PER_FILE,
        dbfile=DB_FILE,eq_polys=DEFAULT_EQ,single_capture=opts.single_capture,
        port=UDP_PORT, buffer_size=RX_BUFFER_SIZE)

    udp_rx.set_bandpass()
    udp_rx.open_file()

    udp_rx.start()

    try:
        while not udp_rx._quit: 
            time.sleep(1)
    except(KeyboardInterrupt):
            udp_rx.stop()
    print '...Exiting.'
