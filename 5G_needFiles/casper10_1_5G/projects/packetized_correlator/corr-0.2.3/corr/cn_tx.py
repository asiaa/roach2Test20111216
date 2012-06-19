#! /usr/bin/env python
import time, os, threading, subprocess, corr.sim_cn_data, corr.packet

class CorrTX:
    def __init__(self, bof_ints, x_per_fpga=2, endian='<',ip='127.0.0.1', port=8888, sim_tx=False):
        self.bof_ints = bof_ints
        self.endian = endian
        self.packet = corr.packet.CasperN_Packet(endian)
        self.sock = corr.packet.UDP_TX_Socket(ip, port)
        print ('Ready to send output data to IP %s on port %i' %(ip,port))
        self.x_per_fpga = x_per_fpga
        self.tx_thread = None

    def start(self, sim_tx=False, sim_acc_len=4, sim_nstokes=4, sim_nchans=2048, payload_len=512):
        self._quit = False
        self._tx_thread = threading.Thread(target=self._tx,args=(sim_tx, sim_acc_len, sim_nstokes, sim_nchans, payload_len))
        self._tx_thread.setDaemon(1)
        print 'Beginning transmission...'
        self._tx_thread.start()

    def _tx(self, sim_tx=True, sim_acc_len=4, sim_nstokes=4, sim_nchans=2048, payload_len=512):
        """Continuously transmit correlator data over udp packets."""
        n_ants = 2 * len(self.bof_ints)
        if sim_tx:
            print ('Simulating %i antennas, %i channels with %i stokes parameters every %i seconds with a packet payload of %i bytes' %(n_ants, sim_nchans, sim_nstokes, 2**sim_acc_len, payload_len))
        n_integrations = 0
        while not self._quit:
            t = None
            if sim_tx: time.sleep(sim_acc_len)
            for i, b in enumerate(self.bof_ints):
                for x in range(self.x_per_fpga):
                    if self._quit: break
                    x_num = 2*i+x
                    print x_num
                    dev = 'snap_acc' + str(x+1)
                    num = 0
                    data = []
                    if sim_tx:
                        if t is None: t = time.time()
                        data.append(corr.sim_cn_data.sim_x_engine(x_num, n_ants, sim_nstokes, sim_nchans, self.endian))
                    else:
                        # Wait for data to become available
                        while num == 0 and t is None and not self._quit:
                            time.sleep(.001)
                            num = b[dev+'_addr']
                        while not self._quit:
                            num = b[dev+'_addr']
			    #print ('%i,b[%s]='%(x_num,(dev+'_addr'))),num
                            if num == 0:
                                print '\t', x_num, t
                                break
                            if t is None: t = time.time()
                            sys.stdout.write('.'); sys.stdout.flush()
                            # Could send smaller packets here if you wanted to.
                            data.append(b.binary_read(dev+'_bram', 
                                num_bytes=4*(num+1)))
                            b[dev+'_en'] = 1; b[dev+'_en'] = 0
                    data = ''.join(data)
                    cnt = 0
                    while n_integrations >= 2 and len(data) > 0 and not self._quit:
                        d, data = data[:payload_len], data[payload_len:]
                        pkt = self.packet.pack_from_prms(t, x_num, cnt, 0, d)
                        self.sock.tx(pkt)
                        #self.transport.write(pkt, self.ip_port)
                        #netcat.write(pkt)
                        cnt += 1
            n_integrations += 1

    def stop(self):
        print 'Stopping Transmission...'
        self._quit = True
        self._tx_thread.join()

if __name__ == '__main__':
    from optparse import OptionParser
    import sys, corr.borph

    p = OptionParser()
    p.set_usage('cn_tx.py [options] *.bof')
    p.set_description(__doc__)
    p.add_option('-p', '--tcp_port', dest='tcp_port', type='int', default=9999,
        help='Port to receive BorphClient connections over.  Default is 9999')
    p.add_option('-i', '--udp_ip', dest='udp_ip', default='127.0.0.1',
        help='IP address to use for UDP transmission of correlator data.  Default is 127.0.0.1')
    p.add_option('-k', '--udp_port', dest='udp_port', type='int', default=8888,
        help='Port to use for UDP correlator data transmission.  Default is 8888')
    p.add_option('-x', '--x_per_fpga', dest='x_per_fpga', type='int', default=2,
        help='Number of X engines per FPGA.  Default is 2')
    p.add_option('-v', '--verbose', dest='verbose', action='store_true',
        help='Be verbose')
    p.add_option('-s', '--sim', dest='sim', action='store_true',
        help='Simulate data')
    p.add_option('-l', '--payload_len', dest='payload_len', type='int',default=4096,
        help='The length in bytes of each packet (data or payload only). Default 4096')
    opts, args = p.parse_args(sys.argv[1:])

    if opts.sim:
        c = CorrTX(args, x_per_fpga=opts.x_per_fpga, ip=opts.udp_ip, port=opts.udp_port)
        c.start(sim_tx=True, sim_acc_len=4, sim_nstokes=4, sim_nchans=2048, payload_len=opts.payload_len)
        try:
            while True: time.sleep(1)
        except(KeyboardInterrupt): c.stop()
    else:
        bof_files = args

        # Set up FPGAs
        bof_ints = [corr.borph.BorphInterface(b) for b in bof_files]

        # Create scripts for starting and stopping UDP transmission
        c = CorrTX(bof_ints, sim_tx=False, x_per_fpga=opts.x_per_fpga, ip=opts.udp_ip, port=opts.udp_port)

        def start_tx(data): 
            c.start(payload_len=opts.payload_len)

        def stop_tx(data): 
            c.stop()

        def set_payload_len(payload_len): 
            opts.payload_len = payload_len
            print 'UDP payload length changed to %s.' %opts.payload_len
            if self._quit:
                print 'Stop and restart to apply.'

        def set_udp_ip(udp_ip): 
            opts.udp_ip = udp_ip
            print 'NOT YET IMPLEMENTED: UDP target IP changed to %s' %opts.udp_ip
            
        def set_udp_port(udp_port): 
            opts.udp_port = udp_port
            print 'NOT YET IMPLEMENTED: UDP target port changed to %s' %opts.udp_port
            
        def equalize(data):
            fpga, poly, nchan = data
            print 'Setting equalization for FPGA %d to %s' % (fpga, str(poly))
            for c in range(nchan):
                gain = 0
                for i, p in enumerate(poly): gain += p * c**(len(poly) - i - 1)
                if gain < 0: gain = 0
                if gain >= 2**17: gain = 2**17 - 1
                bof_ints[fpga].write('ibob_eq_coeff', (c << 20 | 1 << 17 | int(gain)))
            print 'done.'

        def init_eq(data):
            nchan, gain = data
            for i in range(4): equalize([i, [gain], nchan])

        def execute(data):
            os.system(data)
            
        special_callbacks = {'start_tx':start_tx, 'stop_tx':stop_tx, 
            'set_payload_len':set_payload_len, 'set_udp_ip':set_udp_ip, 
            'set_udp_port':set_udp_port, 'equalize':equalize, 'init_eq':init_eq, 'execute':execute}
 
#Set up interface for TCP ctrl of correlator
        tcp_ip = corr.borph.get_ip_address('eth0')
        print 'BorphServer using ip: %s, port: %d' % (tcp_ip, opts.tcp_port)
        b = corr.borph.BorphServer(tcp_ip, opts.tcp_port, bof_ints, verbose=opts.verbose, special_callbacks=special_callbacks)

        # Wait for external interaction to start correlator
        print 'Listening'
        b.listen()

