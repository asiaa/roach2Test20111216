
'''
This Class provides a Python interface to the standard UDP interface for 
all CASPER hardware.

Author: Jason Manley
Date: 2008/01/21
Version: 0.0.1

TBD:    Indexed write
        blind writes
'''

import time, numpy, os, struct, socket

PROGDEV=10
STATUS=20
LISTCMD=30
LISTBOF=35
LISTDEV=40
READ=50
INDEXEDREAD=51
WRITE=60
INDEXEDWRITE=61

ERR=110
REPORT=120
AVAILCMND=130
AVAILBOF=135
AVAILDEV=140
DATA=160


RCVBUF = 200000
PKTSIZ = 4000
PAYLOADSIZ=1400

SUCCESS = 'SUCCESS'
ERRBADRESPONSE = 'ERR: Bad reply'
ERRNORESPONSE = 'ERR: No response'
ERRSOCK = 'ERR: Socket error'
REMERR = 'REMOTE ERROR'
ERRVERIFY = 'ERR: Verify failed'
ERRINDEX = 'ERR: Indexing error'


def get_ip_address(ifname):
    """Perform a hostname lookup to retrieve the corresponding ip address."""
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    return socket.inet_ntoa(fcntl.ioctl(
        s.fileno(),
        0x8915,  # SIOCGIFADDR
        struct.pack('256s', ifname[:15])
    )[20:24])

def get_rand_id():
    return int(numpy.random.rand()*255)

class UDPClient:
    def __init__(self,ip,port):
        self.ip_port = (ip, port)
        self._sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self._sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self._sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF,RCVBUF)
        self._sock.connect(self.ip_port)
        self.cmds = []
        self.devs = []

    def flush_recv_buffer(self):
        cont = True
        self._sock.setblocking(False)
        while cont:
            try: 
                output=self._sock.recv(PKTSIZ)
            except socket.error: 
                cont = False
        self._sock.settimeout(10)

    def progdev(self,boffile):
        """ Program the device with the specified file """
        assert(type(boffile)==str)
        self.flush_recv_buffer()
        print 'trying to program the device with file %s'%boffile
        try:
            self._sock.send(struct.pack('B',PROGDEV) + boffile)
        except socket.error:
            return {'status':ERRSOCK, 'data':None} 

    def status(self):
        """ Get the device status """
        self.flush_recv_buffer()
        tx_id = get_rand_id()
        try:
            self._sock.send(struct.pack('BB',STATUS,tx_id))
            data=self._sock.recv(PKTSIZ)
            if len(data) >= 2 :
                rx_type,rx_id=struct.unpack('BB',data[0:2])
                #print data
                #print 'type: %i, id_tx %i, id_rx %i'%(rx_type, tx_id, rx_id)
                if (rx_type==REPORT) and (rx_id == tx_id):
                    return {'status':SUCCESS, 'data':data[2:]}
                elif (rx_type==ERR) and (rx_id == tx_id):
                    return {'status':REMERR, 'data':data[2:]}
                else:
                    return {'status':ERRBADRESPONSE, 'data':None}
            else: return {'status':ERRBADRESPONSE, 'data':None}
        except socket.timeout:
            return {'status':ERRNORESPONSE, 'data':None}
        except socket.error:
            return {'status':ERRSOCK, 'data':None}  
            
    def listcmd(self):
        """ List all the commands available on the device """
        self.flush_recv_buffer()
        tx_id = get_rand_id()
        try:
            self._sock.send(struct.pack('BB',LISTCMD,tx_id))
            data=self._sock.recv(PKTSIZ) 
            if len(data) >= 2 :
                rx_type,rx_id=struct.unpack('BB',data[0:2])
                #print data
                #print 'type: %i, id_tx %i, id_rx %i'%(rx_type, tx_id, rx_id)
                if (rx_type==AVAILCMND) and (rx_id == tx_id):
                    start_index=2
                    self.cmds=[]
                    for i in range(2,len(data)):
                        if (ord(data[i]) == 0):
                            self.cmds.append(data[start_index:i])
                            start_index=i+1
                    #cmds.append(data[start_index:(len(data)-1)])
                    return {'status':SUCCESS, 'data':self.cmds}
                elif (rx_type==ERR) and (rx_id == tx_id):
                    return {'status':REMERR, 'data':data[2:]}
                else:
                    return {'status':ERRBADRESPONSE, 'data':None}
            else: return {'status':ERRBADRESPONSE, 'data':None}
        except socket.timeout:
            return {'status':ERRNORESPONSE, 'data':None}
        except socket.error:
            return {'status':ERRSOCK, 'data':None}            

    def listbof(self):
        """ List all the bof files available on the device """
        self.flush_recv_buffer()
        tx_id = get_rand_id()
        try:
            self._sock.send(struct.pack('BB',LISTBOF,tx_id))
            data=self._sock.recv(PKTSIZ) 
            if len(data) >= 2 :
                rx_type,rx_id=struct.unpack('BB',data[0:2])
                #print data
                #print 'type: %i, id_tx %i, id_rx %i'%(rx_type, tx_id, rx_id)
                if (rx_type==AVAILBOF) and (rx_id == tx_id):
                    start_index=2
                    self.bof=[]
                    for i in range(2,len(data)):
                        if (ord(data[i]) == 0):
                            self.bof.append(data[start_index:i])
                            start_index=i+1
                    #cmds.append(data[start_index:(len(data)-1)])
                    return {'status':SUCCESS, 'data':self.bof}
                elif (rx_type==ERR) and (rx_id == tx_id):
                    return {'status':REMERR, 'data':data[2:]}
                else:
                    return {'status':ERRBADRESPONSE, 'data':None}
            else: return {'status':ERRBADRESPONSE, 'data':None}
        except socket.timeout:
            return {'status':ERRNORESPONSE, 'data':None}
        except socket.error:
            return {'status':ERRSOCK, 'data':None}            

    def listdev(self):
        """ List all the devices (registers, brams etc) available on the device """
        self.flush_recv_buffer()
        tx_id = get_rand_id()
        try:
            self._sock.send(struct.pack('BB',LISTDEV,tx_id))
            data=self._sock.recv(PKTSIZ) 
            if len(data) >= 2 :
                rx_type,rx_id=struct.unpack('BB',data[0:2])
                #print data
                #print 'type: %i, id_tx %i, id_rx %i'%(rx_type, tx_id, rx_id)
                if (rx_type==AVAILDEV) and (rx_id == tx_id):
                    start_index=2
                    self.devs=[]
                    for i in range(2,len(data)):
                        if (ord(data[i]) == 0):
                            self.devs.append(data[start_index:i])
                            start_index=i+1
                    #cmds.append(data[start_index:(len(data)-1)])
                    return {'status':SUCCESS, 'data':self.devs}
                elif (rx_type==ERR) and (rx_id == tx_id):
                    return {'status':REMERR, 'data':data[2:]}
                else:
                    return {'status':ERRBADRESPONSE, 'data':None}
            else: return {'status':ERRBADRESPONSE, 'data':None}
        except socket.timeout:
            return {'status':ERRNORESPONSE, 'data':None}
        except socket.error:
            return {'status':ERRSOCK, 'data':None}
 
    def _read_single_ui(self,register,num_bytes,offset=0):
        """Read a specified number of bytes from a specified register. 
        Maximum total length is PKTSIZ."""
        assert(type(register)==str)
        self.flush_recv_buffer()
        tx_id = get_rand_id()
        while True:
            try:
                #print struct.pack('>BBLL',READ,tx_id,offset,num_bytes)
                self._sock.send(struct.pack('>BBLL',READ,tx_id,offset,num_bytes)+register)
                data=self._sock.recv(PKTSIZ) 
                if len(data) >= 2 :
                    rx_type,rx_id=struct.unpack('BB',data[0:2])
                    if (rx_type==DATA) and (rx_id == tx_id):
                        return {'status':SUCCESS, 'data':data[2:]}
                    elif (rx_type==ERR) and (rx_id == tx_id):
                        return {'status':REMERR, 'data':data[2:]}
                    #else:
                    #    return {'status':ERRBADRESPONSE, 'data':ERRBADRESPONSE}
                #else: return {'status':ERRBADRESPONSE, 'data':ERRBADRESPONSE}
            except socket.timeout:
                return {'status':ERRNORESPONSE, 'data':ERRNORESPONSE}
            except socket.error:
                return {'status':ERRSOCK, 'data':ERRSOCK}

    def _write_single_ui(self,register,data,offset=0):
        """ Write to a register. Data is verified by reading back. 
        Can only write a maximum length of one packet."""
        assert(type(register)==str)
        assert(type(data)==str)
        self.flush_recv_buffer()
        tx_id = get_rand_id()
        try:
            self._sock.send(struct.pack('>BBLL',WRITE,tx_id,offset,len(data))+register+chr(0)+data)
        except socket.timeout:
            return {'status':ERRNORESPONSE, 'data':None}
        except socket.error:
            return {'status':ERRSOCK, 'data':None}
        output = self._read_single_ui(register,len(data),offset)
        if (output['status'] == SUCCESS) and (output['data']==data):
            return output
        else:
            output['status']=ERRVERIFY
            return output

    def write_ui(self,register,data,offset=0):
        """Write to a register. Verify write ok. Unlimited data length."""
        num_pkts = int(numpy.ceil(len(data)/float(PAYLOADSIZ)))
        ok = True
        for i in range(num_pkts):
            st_offset = (i*PAYLOADSIZ)
            sp_offset = numpy.min([len(data[st_offset:]),PAYLOADSIZ]) + st_offset-1
            if self._write_single_ui(register,data=data[st_offset:sp_offset],offset=offset+st_offset)['status'] != SUCCESS:
                return {'status':ERRVERIFY, 'data':None}
        return {'status':SUCCESS,'data':data}

    def read_ui(self,register,num_bytes,offset=0):
        num_pkts = int(numpy.ceil(num_bytes/float(PAYLOADSIZ)))
        output = {'status':SUCCESS,'data':''}
        for i in range(num_pkts):
            st_offset = (i*PAYLOADSIZ)+offset
            num_bytes_pkt = numpy.min([num_bytes-(i*PAYLOADSIZ),PAYLOADSIZ])
            result=(self._read_single_ui(register,offset=st_offset,num_bytes=num_bytes_pkt))
            if result['status'] != SUCCESS:
                return {'status':result['status'], 'data':result['data']}
            else:
                output['data']+=(result['data'])
        return output
                    
    def _read_single_i(self,register_index,num_bytes,offset=0):
        """Uses the indexed read mode. 
        Maximum read length: PAYLOADSIZ bytes"""
        assert(type(register_index)==int)
        self.flush_recv_buffer()
        tx_id = get_rand_id()
        while True:
            try:
                self._sock.send(struct.pack('>BBLLB',INDEXEDREAD,tx_id,offset,num_bytes,register_index))
                data=self._sock.recv(PKTSIZ) 
                if len(data) >= 2 :
                    rx_type,rx_id=struct.unpack('BB',data[0:2])
                    if (rx_type==DATA) and (rx_id == tx_id):
                        return {'status':SUCCESS, 'data':data[2:]}
                    elif (rx_type==ERR) and (rx_id == tx_id):
                        return {'status':REMERR, 'data':data[2:]}
                    #else:
                    #    return {'status':ERRBADRESPONSE, 'data':ERRBADRESPONSE}
                #else: return {'status':ERRBADRESPONSE, 'data':ERRBADRESPONSE}
            except socket.timeout:
                return {'status':ERRNORESPONSE, 'data':ERRNORESPONSE}
            except socket.error:
                return {'status':ERRSOCK, 'data':ERRSOCK}


    def read(self,register,num_bytes,offset=0):
        """ Reads binary data. Optionally with a byte offset. 
        Returns raw string. Uses indexed read mode."""
        assert(type(register)==str)
        try:
            index = self.devs.index(register)
        except:
            self.listdev()
            try:
                index = self.devs.index(register)
            except:
                return {'status':ERRINDEX,'data':None}

        num_pkts = int(numpy.ceil(num_bytes/float(PAYLOADSIZ)))
        output = {'status':SUCCESS,'data':''}
        for i in range(num_pkts):
            st_offset = (i*PAYLOADSIZ)+offset
            num_bytes_pkt = numpy.min([num_bytes-(i*PAYLOADSIZ),PAYLOADSIZ])
            result=(self._read_single_i(register_index=index,offset=st_offset,num_bytes=num_bytes_pkt))
            if result['status'] != SUCCESS:
                return {'status':result['status'], 'data':result['data']}
            else:
                output['data']+=(result['data'])
        return output

    def read_uint(self,register,offset=0):
        """Read an unsigned integer (32 bit software register)
        Offset specified in 32 bit increments."""
        assert(type(register)==str)
        try:
            index = self.devs.index(register)
        except:
            self.listdev()
            try:
                index = self.devs.index(register)
            except:
                return {'status':ERRINDEX,'data':None}

        output = self._read_single_i(index,num_bytes=4,offset=offset*4)
        if (output['status'] == SUCCESS):
            output['data'] = struct.unpack('>L',output['data'])[0]
        return output

    def read_int(self,register,offset=0):
        """ Read a signed integer (32 bit software register).
        Offset specified in 32 bit increments. Uses indexed read mode."""
        assert(type(register)==str)
        try:
            index = self.devs.index(register)
        except:
            self.listdev()
            try:
                index = self.devs.index(register)
            except:
                return {'status':ERRINDEX,'data':None}

        output = self._read_single_i(index,num_bytes=4,offset=offset*4)
        if (output['status'] == SUCCESS):
            output['data'] = struct.unpack('>l',output['data'])[0]
        return output

    def write_int(self,register,value,offset=0):
        """Write an integer value to a 32 bit register, 
        with an optional byte offset (useful for DRAMs/BRAMs). 
        Offset specified in 32 bit incr."""
        value_int=struct.pack('>l',value)
        out=self._write_single_ui(register=register,data=value_int,offset=(offset*4))
        if out['status']==SUCCESS:
            out['data']=struct.unpack('>l',out['data'])[0]
        return out
    

    def write_blind(self,register,data,offset=0):
        """Writes to a register without checking anything. Uses indexed mode.
        Be sure to call "listdev()" first!"""

    
