#!/usr/bin/env python
import time, os, threading, subprocess, corr.sim_cn_data, corr.packet,struct,sys

class CorrTX:
    def __init__(self, pids, x_per_fpga=2, endian='<',ip='127.0.0.1', port=8888, sim_tx=False,sim_acc_len=4, sim_nstokes=4, sim_nchans=2048, payload_len=4096,verbose=False):
        self.pids=pids
        self.endian = endian
        self.casper_sock=corr.packet.CasperN_TX_Socket(ip,port,endian)
        self.x_per_fpga = x_per_fpga
        self.tx_thread = None
        self.ip=ip
        self.port=port
        self.sim_tx=sim_tx
        self.sim_acc_len=sim_acc_len
        self.sim_nstokes=sim_nstokes
        self.sim_nchans=sim_nchans
        self.payload_len=payload_len
        self.verbose=verbose
        self.n_ants = 2 * len(self.pids) #only for simulation
        self.tx_sock = corr.packet.CasperN_TX_Socket(ip,port,endian)

        self.snap_addr=[]
        self.snap_bram=[]
        self.snap_en=[]
        for i, pid in enumerate(pids):
            for x in range(x_per_fpga):
                self.snap_addr.append(open('/proc/%i/hw/ioreg/snap_acc%i_addr'%(pid,x),'r'))
                self.snap_bram.append(open('/proc/%i/hw/ioreg/snap_acc%i_bram'%(pid,x),'r'))
                self.snap_en.append(open('/proc/%i/hw/ioreg/snap_acc%i_en'%(pid,x),'w'))

        print ('Ready to send output data to IP %s on port %i' %(ip,port))

    def read_addr(self,xeng):
        self.snap_addr[xeng].flush()
        self.snap_addr[xeng].seek(0)
        self.snap_addr[xeng].flush()
        return struct.unpack('L',self.snap_addr[xeng].read(4))[0]

    def read_bram(self,xeng,size):
        """Reads "size" bytes from bram for xengine number xeng"""
        self.snap_bram[xeng].flush()
        self.snap_bram[xeng].seek(0)
        return self.snap_bram[xeng].read(size*4)

    def get_base_ant(self):
        b_a=open('/proc/%i/hw/ioreg/base_ant0'%(self.pids[0]),'r')
        base_ant=struct.unpack('L',b_a.read(4))[0]
        b_a.close()
        return base_ant

    def snap_get_new(self,xeng):
        self.snap_en[xeng].seek(0)
        self.snap_en[xeng].write(struct.pack('L',1))
        self.snap_en[xeng].flush()
        self.snap_en[xeng].seek(0)
        self.snap_en[xeng].write(struct.pack('L',0))
        self.snap_en[xeng].flush()
        
    def start(self):
        self._quit = False
        self._tx_thread = threading.Thread(target=self._tx,args='')
        self._tx_thread.setDaemon(1)
        print 'Beginning transmission...'
        self._tx_thread.start()

    def empty_buffers(self):
        base_ant=self.get_base_ant()
        print 'Flushing buffers...'
        for xnum in range(self.x_per_fpga*len(self.pids)):
            if self._quit: break
            x_num=xnum+base_ant
            num = 0
            tot_xeng_vectors=0
            data = []
            # Wait for data to become available
            while num == 0 and not self._quit:
                time.sleep(.005)
                num = self.read_addr(xnum)
            while not self._quit:
                time.sleep(.001)
                addr = self.read_addr(xnum)
                if addr == 0:
                    print '\t: Flushed %i vectors for X engine %i.'%(tot_xeng_vectors, x_num)
                    break
                num = addr + 1
                tot_xeng_vectors += num
                self.snap_get_new(xnum)

    def _tx(self):
        """Continuously transmit correlator data over udp packets."""
        base_ant=self.get_base_ant() 
        target_pkt_size=(self.payload_len+self.casper_sock.header_size)

        if self.sim_tx:
            print ('Simulating %i antennas, %i channels with %i stokes parameters every %i seconds with a packet payload of %i bytes' %(self.n_ants, self.sim_nchans, self.sim_nstokes, 2**self.sim_acc_len, self.payload_len))
        else:
            self.empty_buffers()
            self.empty_buffers()

        n_integrations = 0
        while not self._quit:
            t = None
            if self.sim_tx: time.sleep(self.sim_acc_len)
            for xnum in range(self.x_per_fpga*len(self.pids)):
                if self._quit: break
                x_num=xnum+base_ant
                print x_num,
                num = 0
                tot_xeng_vectors=0
                data = []
                if self.sim_tx:
                    if t is None: t = time.time()
                    data.append(corr.sim_cn_data.sim_x_engine(x_num, self.n_ants, self.sim_nstokes, self.sim_nchans, self.endian))
                else:
                    # Wait for data to become available
                    while num == 0 and t is None and not self._quit:
                        time.sleep(.005)
                        num = self.read_addr(xnum)
                    while not self._quit:
                        time.sleep(.001)
                        addr = self.read_addr(xnum)
                        if addr == 0:
                            if t is None: t = time.time()
                            print '\t: Collected %i vectors for X engine %i timestamp %i.'%(tot_xeng_vectors, x_num, t),
                            sys.stdout.flush()
                            break
                        num = addr + 1
                        tot_xeng_vectors += num
                        #print 'Got %i vectors for engine %i. Total now %i.'%(num,xnum,tot_xeng_vectors)
                        sys.stdout.write('.'); sys.stdout.flush()
                        data.append(self.read_bram(xnum,num))
                        self.snap_get_new(xnum)
                #Now that we have collected all this Xengine's data, send the packets:
                data = ''.join(data)
                cnt = 0
                #while n_integrations >= 2 and len(data) > 0 and not self._quit:
                    #d, data = data[:self.payload_len], data[self.payload_len:]
                    #self.casper_sock.send_packet((t*1000000), x_num, cnt*self.payload_len, 0, d)
                    #cnt += 1
                for cnt in range((len(data)/self.payload_len)):
                    if self.casper_sock.send_packet((t*1000000), x_num, cnt*self.payload_len, 0, data[cnt*self.payload_len:(cnt+1)*self.payload_len]) != target_pkt_size: print 'TX fail!' 
                    time.sleep(.002)
                print '%i packets sent.'%(cnt+1)
            n_integrations += 1

    def stop(self):
        print 'Stopping Transmission...'
        self._quit = True
        self._tx_thread.join()

if __name__ == '__main__':
    from optparse import OptionParser
    import sys, corr.borph

    p = OptionParser()
    p.set_usage('cn_tx.py [options] pid0 pid1 pid2 pid3')
    p.set_description(__doc__)
    p.add_option('-i', '--udp_ip', dest='udp_ip', default='127.0.0.1',
        help='IP address to use for UDP transmission of correlator data.  Default is 127.0.0.1')
    p.add_option('-k', '--udp_port', dest='udp_port', type='int', default=8888,
        help='Port to use for UDP correlator data transmission.  Default is 8888')
    p.add_option('-x', '--x_per_fpga', dest='x_per_fpga', type='int', default=2,
        help='Number of X engines per FPGA.  Default is 2')
    p.add_option('-v', '--verbose', dest='verbose', action='store_true',
        help='Be verbose')
    p.add_option('-s', '--sim', dest='sim_tx', action='store_true',default=False,
        help='Simulate data')
    p.add_option('-l', '--payload_len', dest='payload_len', type='int',default=4096,
        help='The length in bytes of each packet (data or payload only). Default 4096')
    opts, args = p.parse_args(sys.argv[1:])
    if len(args) < 1: 
        print 'Please specify PID of Xengine BORPH processes.'
        exit()
    pids = [int(i) for i in args]
    c = CorrTX(pids, x_per_fpga=opts.x_per_fpga, ip=opts.udp_ip, port=opts.udp_port, sim_tx=opts.sim_tx, sim_acc_len=4, sim_nstokes=4, sim_nchans=2048, payload_len=opts.payload_len, verbose=opts.verbose)
    c.start()
    try:
        while True: time.sleep(1)
    except(KeyboardInterrupt): c.stop()
    except: c.stop()
