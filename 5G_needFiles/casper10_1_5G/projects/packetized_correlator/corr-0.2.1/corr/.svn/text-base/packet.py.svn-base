"""
Defines a correlator packet format, and a standard interface for en/decoding it.

Rev 1.0b
Modified: Jason Manley
Date: 08/29/2007
    Hardcoded and changed defaults of some endian stuff 
    for packet decoding from cn_corrs

Author: Aaron Parsons
Modified: Jason Manley
Date: 08/29/2007
Revisions: 1.0a


"""
#import struct
import struct, socket, time, sys, threading
#try: import numpy
#except(ImportError): pass

#  ____                          _   _     ____            _        _   
# / ___|__ _ ___ _ __   ___ _ __| \ | |   |  _ \ __ _  ___| | _____| |_ 
#| |   / _` / __| '_ \ / _ \ '__|  \| |   | |_) / _` |/ __| |/ / _ \ __|
#| |__| (_| \__ \ |_) |  __/ |  | |\  |   |  __/ (_| | (__|   <  __/ |_ 
# \____\__,_|___/ .__/ \___|_|  |_| \_|___|_|   \__,_|\___|_|\_\___|\__|
#               |_|                  |_____|                            

class CasperN_RawPacket:
    """Define a packet header format to be:
        8 bytes (double) time
        1 byte x engine number
        4 bytes (unsigned int) vector number within an integration
        4 bytes (unsigned int) flags
        4 bytes (unsigned int) data length (in bytes)"""

    def __init__(self, endian='<'):
        self.endian = endian
        self.header_fmt = '%sdbiii' % (endian)
        self.header_size = struct.calcsize(self.header_fmt)

    def get_hdr_size(self):
        return self.header_size

    def pack(self, d):
        """Create a packet from d, which should be a dictionary with keys:
        time, xengine_num, index (part x of y for this x engine's integration), and flags."""
        return struct.pack(self.header_fmt, d['time'], d['xengine_num'], d['index'], d['flags'], len(d['raw_data'])) + d['raw_data']

    def unpack_header(self, buf):
        """Return a dictionary of all the (unpacked) fields in the raw packet string 'buf'."""
        #print 'Header format: %s'%self.header_fmt,
        #print ' Expected header size: %i' % self.header_size,
        #print ' Header buffer size: %i' %len(buf)
        if (len(buf) >= self.header_size):
            v = struct.unpack(self.header_fmt, buf[:self.header_size])
            #print 'Unpacked header: time: %d, xeng: %i, index: %i, datasize: %i' %(v[0],v[1],v[2],v[4])
            return {'time':v[0], 'xengine_num':v[1], 'index':v[2], 'flags':v[3],'data_size':v[4]}
        else:
            print ('ERR: Buffer is too small for header unpack')
            return None

    def unpack_raw_data(self, buf):
        return {'raw_data': buf}

    def unpack(self, buf):
        d = self.unpack_header(buf)
        if not d == None:
            buf_data = buf[self.header_size:self.header_size + d['data_size']]
            if not buf_data == None:
                d.update(self.unpack_raw_data(buf_data))
                return d
            else:
                print "ERR: storing raw data failed"
                return None
        else:
            print "ERR: could not unpack header"
            return None

    def unpack_from_file(self, f):
        hdr = f.read(self.header_size)
        if (len(hdr) != 0):
            #print 'length of header: %i' %len(hdr)
            d = self.unpack_header(hdr)
            if not d == None:
                data = f.read(d['data_size'])
                if (len(data) == d['data_size']):
                    print 'data_size: %i' %d['data_size']
                    d.update(self.unpack_raw_data(data))
                    return d
                else:
                    print 'ERR: END OF FILE REACHED while reading data'
                    return None
            else:
                print 'ERR unpacking header'
                return None
        
class CasperN_Packet(CasperN_RawPacket):
    """Pack and unpack the binary correlation data in a CasperN packet,
    assuming the data is stored as signed (4 byte) integers."""
    def __init__(self, endian='<'):
        CasperN_RawPacket.__init__(self, endian=endian)
        self.data_fmt = 'i'
        self.word_size = struct.calcsize(self.data_fmt)
        #print 'word size: ',self.word_size
    def pack(self, d):
        if not d.has_key('raw_data'):
            fmt = '%s%di' % (self.endian, len(d['data']))
            d['raw_data'] = struct.pack(fmt, d['data'])
        return CasperN_RawPacket.pack(self, d)
    def unpack(self, buf):
        d = CasperN_RawPacket.unpack(self, buf)
        if not d == None:
            return self.convert_raw_data(d)
        else: return None
    def convert_raw_data(self, d):
        #print 'length of raw data: %i. word size: %i'%(len(d['raw_data']), self.word_size)
        assert(len(d['raw_data']) % self.word_size == 0)
        fmt = '>%di' % (d['data_size'] / self.word_size)
        d['data'] = struct.unpack(fmt, d['raw_data'])
        return d
    def pack_from_prms(self, t, xengine_num, index, flags, data):
        d = {'time':t, 'xengine_num':xengine_num, 'index':index, 
            'flags':flags}
        if type(data) is str: d['raw_data'] = data
        else: d['data'] = data
        return self.pack(d)

    def unpack_from_file(self, f):
        d = CasperN_RawPacket.unpack_from_file(self, f)
        return self.convert_raw_data(d)


#  _______  __    ____             _        _
# \_   _\ \/ /   / ___|  ___   ___| | _____| |_
#   | |  \  /    \___ \ / _ \ / __| |/ / _ \ __|
#   | |  /  \     ___) | (_) | (__|   <  __/ |_
#   |_| /_/\_\___|____/ \___/ \___|_|\_\___|\__|
#           |_____|

class UDP_TX_Socket(socket.socket):
    """Implements a UDP socket which transmits at a given ip, port."""
    def __init__(self, ip, port):
        self.ip = ip
        #print 'Set ip to %s' %self.ip
        self.port = port
        socket.socket.__init__(self, type=socket.SOCK_DGRAM)
        #self.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, 20)
        #self.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_LOOP, 1)
        #req = struct.pack('4sl', socket.inet_aton(ip), socket.INADDR_ANY)
        #self.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, req)
    def tx(self, data):
        """Send a UDP packet containing binary 'data'."""
        #print 'Sending to ip %s on port %i' %(self.ip,self.port)
        self.sendto(data, (self.ip, self.port))

class CasperN_TX_Socket(UDP_TX_Socket, CasperN_Packet):
    """Combines a UDP_TX_Socket with the casper_n packet format."""
    def __init__(self, ip, port, endian='<'):
        UDP_TX_Socket.__init__(self, ip, port)
        CasperN_RawPacket.__init__(self, endian=endian)
    def send_packet(self, t, xengine_num, cnt, flags, data):
        """Send a UDP packet using the casper_n packet format."""
        self.tx(self.pack_from_prms(t, xengine_num, cnt, flags, data))

#  ____  __  __    ____             _        _   
# |  _ \ \ \/ /   / ___|  ___   ___| | _____| |_ 
# | |_) | \  /    \___ \ / _ \ / __| |/ / _ \ __|
# |  _ <  /  \     ___) | (_) | (__|   <  __/ |_ 
# |_| \_\/_/\_\___|____/ \___/ \___|_|\_\___|\__|
#            |_____|              

class UDP_RX_Socket(socket.socket):
    """An interface for receiving UDP packets over an ip, port."""
    def __init__(self,port=8888):
        # Create datagram socket
        socket.socket.__init__(self, type=socket.SOCK_DGRAM)
        # Setup to allow reuse of address (is this necessary?)
        self.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF,200000)
        # Bind socket
        self.bind(('', port))
        #print 'Made a new socket on port %i'%port
        #self.setblocking(False)

class CasperN_RX_correlator(UDP_RX_Socket, CasperN_Packet):
    def __init__(self, port=8888, payload_len=8192, hdr_size=21, endian='>'):
        self.sock = UDP_RX_Socket(port)
        self.payload_len = payload_len
        self.hdr_size = hdr_size

    def get_a_packet(self):
        try: 
            output=self.sock.recv(self.payload_len + self.hdr_size)
        except socket.error: 
            output=None
            #time.sleep(0.01)
        return output

