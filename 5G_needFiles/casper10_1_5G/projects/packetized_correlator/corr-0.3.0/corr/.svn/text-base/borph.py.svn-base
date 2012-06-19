"""
A low-level binary interface with BORPH, represented by a dict which
is sync'd with a Borph interface.

Author: Aaron Parsons
Date: 10/25/2006
Revisions: None
"""
import os, subprocess, socket, struct, fcntl, pickle
import pickle, threading

DEV_NULL = open('/dev/null', 'w')

def get_ip_address(ifname):
    """Perform a hostname lookup to retrieve the corresponding ip address."""
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    return socket.inet_ntoa(fcntl.ioctl(
        s.fileno(),
        0x8915,  # SIOCGIFADDR
        struct.pack('256s', ifname[:15])
    )[20:24])

#  ___             ___               _    ___     _            __             
# | _ \__ ___ __ _| _ ) ___ _ _ _ __| |_ |_ _|_ _| |_ ___ _ _ / _|__ _ __ ___ 
# |   / _` \ V  V / _ \/ _ \ '_| '_ \ ' \ | || ' \  _/ -_) '_|  _/ _` / _/ -_)
# |_|_\__,_|\_/\_/|___/\___/_| | .__/_||_|___|_||_\__\___|_| |_| \__,_\__\___|
#                              |_|                                    

class RawBorphInterface(dict):
    """A low-level binary interface with BORPH, represented by a dict which
    is synchronized with a Borph interface."""
    def __init__(self, bof):
        """Initialize interface with a bof file (which is launched)."""
        dict.__init__(self)
        assert(os.path.exists(bof))
        self.info = {}
        if not bof.endswith('.bof'):
            print "'%s' doesn't end in '.bof'." % (bof)
            print "Using it as a directory for testing/debugging."
            self.path = bof + '/'
            self.info['PATH'] = self.path
            self.info['FPGA'] = 'FPGA_' + bof
        else:
            try: self.bof = subprocess.Popen(['./' + bof], stdout=DEV_NULL)
            except(OSError):
                raise OSError("Some FPGAs are already configured.  Please" + \
                    " find and kill their bof processes using ps.")
            self.path = '/proc/%d/hw/ioreg/' % (self.bof.pid)
            self.info['PATH'] = self.path
            # Retrieve FPGA number
            try:
                f = open(self.path[:-6] + 'region')
                self.info['FPGA'] = int(f.read().split('x')[-1])
            except(IOError):
                raise IOError('Programming failed with file %s' % (bof))
            # Switch to binary mode
            f = open(self.path[:-6]+'ioreg_mode', 'w'); f.write('1'); f.close()
        # Initialize dictionary with devices in ioreg
        for i in os.listdir(self.path): dict.__setitem__(self, i, None)
    def binary_read(self, dev, start_addr=0, num_bytes=4):
        """Read a raw binary string from the specified device."""
        if self.has_key(dev):
            f = open(self.path + dev)
            #f.seek(start_addr)
            buf = f.read(num_bytes)
            f.close()
            return buf
        else: return self.info[dev]
    def binary_write(self, dev, buf):
        """Write a raw binary string to the specified device."""
        f = open(self.path + dev, 'w')
        f.write(buf)
        f.close()
    def keys(self):
        """List all devices available on this borph interface."""
        return dict.keys(self) + self.info.keys()
    def __getitem__(self, dev):
        return self.read(dev)
    def __setitem__(self, dev, buf):
        assert(self.has_key(dev))
        self.write(dev, buf)
    def __del__(self):
        if self.info['FPGA'] == -1: return
        try: os.kill(self.bof.pid, 1)
        except(OSError): pass
        self.bof.wait()

#  ____                   _     ___       _             __                
# | __ )  ___  _ __ _ __ | |__ |_ _|_ __ | |_ ___ _ __ / _| __ _  ___ ___ 
# |  _ \ / _ \| '__| '_ \| '_ \ | || '_ \| __/ _ \ '__| |_ / _` |/ __/ _ \
# | |_) | (_) | |  | |_) | | | || || | | | ||  __/ |  |  _| (_| | (_|  __/
# |____/ \___/|_|  | .__/|_| |_|___|_| |_|\__\___|_|  |_|  \__,_|\___\___|
#                  |_|                                                    

class BorphInterface(RawBorphInterface):
    """A higher level borph interface which can convert lists of numbers
    into the appropriate binary strings."""
    def __init__(self, bof, type_dict={}):
        """bof:        The bof file to be executed and interfaced to
        type_dict:  A dictionary of devices and data types used to convert
                    numbers to the appropriate binary strings.  See the
                    struct module for the appropriate codes."""
        RawBorphInterface.__init__(self, bof)
        self.type_dict = type_dict
        for k in self.keys():
            if not self.type_dict.has_key(k): self.type_dict[k] = 'I'
    def read(self, dev, start_num=0, num=1):
        """Read data from the specified device and unpack it into
        numerical values."""
        if self.has_key(dev):
            T = self.type_dict[dev]
            Tsize = struct.calcsize(T)
            buf = self.binary_read(dev, start_num*Tsize, num*Tsize)
            N = len(buf) / Tsize
            rv = struct.unpack(str(N)+T, buf)
            if len(rv) == 1: return rv[0]
            else: return rv
        else: return self.info[dev]
    def write(self, dev, nums):
        """Write a list of numbers to the specified device.  Conversion to
        a binary string occurs under the hood using 'type_dict'."""
        T = self.type_dict[dev]
        try: buf = struct.pack(str(len(nums)) + T, *nums)
        except(TypeError): buf = struct.pack(T, nums)
        self.binary_write(dev, buf)
    def __getitem__(self, dev):
        return self.read(dev)
    def __setitem__(self, dev, num):
        assert(self.has_key(dev))
        self.write(dev, num)

#   ___  _     _           _   ____             _        _   
#  / _ \| |__ (_) ___  ___| |_/ ___|  ___   ___| | _____| |_ 
# | | | | '_ \| |/ _ \/ __| __\___ \ / _ \ / __| |/ / _ \ __|
# | |_| | |_) | |  __/ (__| |_ ___) | (_) | (__|   <  __/ |_ 
#  \___/|_.__// |\___|\___|\__|____/ \___/ \___|_|\_\___|\__|
#           |__/                                             

class ObjectSocket(object):
    """Implements a standard way transmitting and receiving python objects
    in pickled form over a socket file."""
    def rx_obj(self, sock_file):
        """Receive a python object from a socket file."""
        buf = ''
        while True:
            buf += sock_file.readline()
            try:
                val = pickle.loads(buf)
                break
            except(EOFError): pass
        return val
    def tx_obj(self, sock_file, obj):
        """Transmit a python object over a socket file."""
        try:
            pickle.dump(obj, sock_file)
            sock_file.write('\n')
            sock_file.flush()
        except(socket.error): pass

#  ____                   _     ____                           
# | __ )  ___  _ __ _ __ | |__ / ___|  ___ _ ____   _____ _ __ 
# |  _ \ / _ \| '__| '_ \| '_ \\___ \ / _ \ '__\ \ / / _ \ '__|
# | |_) | (_) | |  | |_) | | | |___) |  __/ |   \ V /  __/ |   
# |____/ \___/|_|  | .__/|_| |_|____/ \___|_|    \_/ \___|_|   
#                  |_|     
                
class BorphServer(ObjectSocket):
    """Implements a server on a given port and ip address which gives others
    access to data in 'data_dict'."""
    def __init__(self, ip, port, bof_ints, verbose=0, special_callbacks={}):
        """ip:         IP address to listen and respond on
        port:       Port to use
        bof_ints:   A list of bof files to be executed and then served.
        verbose:    Whether or not to print to stdout
        special_callbacks: A dictionary of devices and functions to call
                    with data written to that device."""
        ObjectSocket.__init__(self)
        # Create & bind to a socket for initiating requests
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.bind((ip, port))
        self.verbose = verbose
        self.bof_ints = {}
        if type(bof_ints) != list: bof_ints = [bof_ints]
        for b in bof_ints: self.bof_ints['FPGA'+str(b['FPGA'])] = b
        self.special_callbacks = special_callbacks
    def parse_obj(self, obj):
        """Attempt to execute a command encoded in object.  This object
        should have been created by a BorphClient._command call."""
        try: action = obj['action']
        except: action = None
        try:
            fpgas = obj['fpgas']
            if type(fpgas) != list: fpgas = [fpgas]
        except(KeyError): fpgas = self.bof_ints.keys()
        try: num = obj['num']
        except(KeyError): num = 1
        try: device = obj['device']
        except(KeyError):
            # If no device and any command other than get_info, scrub action
            if action != 'get_info': action = None
            device = None
        try: data = obj['data']
        except(KeyError):
            # If no data and writing, scrub action
            if find('write', action) != -1: device = None
        return action, device, data, num, fpgas
    def listen(self, max_connections=5):
        """Respond to incoming requests for information.  Allows
        'max_connections' clients to simultaneously connect.  Processes
        requests in a seperate thread."""
        self.sock.listen(max_connections)
        while True:
            client_sock, ip_port = self.sock.accept()
            if self.verbose: print 'Accepting connection from:', ip_port
            t = threading.Thread(target=self.process_request, 
                args=(client_sock,))
            t.setDaemon(1)
            t.start()
    def process_request(self, client_sock):
        """Fulfill the requests sent over a client socket.  This is called
        as a seperate thread by 'listen'."""
        sock_file = client_sock.makefile('r', 0)
        # Receive a request for information
        obj = self.rx_obj(sock_file)
        if self.verbose: print obj
        # Parse and fulfill request
        action, device, data, num, fpgas = self.parse_obj(obj)
        result = {}
        if action == 'get_info':
            for k in self.bof_ints: result[k] = self.bof_ints[k].keys()
            result['special'] = self.special_callbacks.keys()
        elif action == 'special':
            result['status'] = 'FAIL'
            try:
                rv = self.special_callbacks[device](data)
                result['status'] = 'SUCCESS'
            except(KeyError), msg: rv = str(msg)
            result['data'] = rv
        else:
            for f in fpgas:
                result[f] = {}
                result[f]['num'] = num
                result[f]['device'] = device
                result[f]['status'] = 'FAIL'
            if action == 'read':
                for f in fpgas:
                    try:
                        rv = self.bof_ints[f].read(device, num=num)
                        result[f]['status'] = 'SUCCESS'
                    except(KeyError, struct.error, MemoryError), msg:
                        rv = str(msg)
                    result[f]['data'] = rv
            elif action == 'binary_read':
                for f in fpgas:
                    try: 
                        rv = self.bof_ints[f].binary_read(device, 
                            num_bytes=num)
                        result[f]['status'] = 'SUCCESS'
                    except(KeyError, struct.error, MemoryError), msg:
                        rv = str(msg)
                    result[f]['data'] = rv
            elif action == 'write':
                for f in fpgas:
                    try:
                        self.bof_ints[f].write(device, data)
                        result[f]['status'] = 'SUCCESS'
                        rv = 'SUCCESS'
                    except(KeyError, struct.error, MemoryError), msg:
                        rv = str(msg)
                    result[f]['data'] = rv
            elif action == 'binary_write':
                for f in fpgas:
                    try:
                        self.bof_ints[f].binary_write(device, data)
                        result[f]['status'] = 'SUCCESS'
                        rv = 'SUCCESS'
                    except(KeyError, struct.error, MemoryError), msg:
                        rv = str(msg)
                    result[f]['data'] = rv
        self.tx_obj(sock_file, result)
        # Cleanup
        sock_file.close()
        client_sock.close()
    def __del__(self):
        self.sock.close()

#  ____                   _      ____ _ _            _   
# | __ )  ___  _ __ _ __ | |__  / ___| (_) ___ _ __ | |_ 
# |  _ \ / _ \| '__| '_ \| '_ \| |   | | |/ _ \ '_ \| __|
# | |_) | (_) | |  | |_) | | | | |___| | |  __/ | | | |_ 
# |____/ \___/|_|  | .__/|_| |_|\____|_|_|\___|_| |_|\__|
#                  |_|     

class BorphClient(ObjectSocket):
    """A class for requesting information from a BorphServer."""
    def __init__(self, ip, port):
        ObjectSocket.__init__(self)
        self.ip_port = (ip, port)
    def get_sockfile(self):
        """Create a file object representing a connection to the ip and port
        supplied during initialization."""
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.connect(self.ip_port)
        return self.sock.makefile('w', 0)
    def close_sockfile(self, sock_file):
        """Close a socket connection to a BorphServer."""
        sock_file.close()
        self.sock.close()
    def _command(self, action, device, data, num, fpgas):
        """Create a request object which is sent to BorphServer and processed
        by its 'parse_obj'."""
        sf = self.get_sockfile()
        request = {'action':action, 'device':device, 'num':num, 'data':data}
        if not fpgas is None: request['fpgas'] = fpgas
        self.tx_obj(sf, request)
        rv = self.rx_obj(sf)
        self.close_sockfile(sf)
        return rv
    def get_info(self):
        """Get all devices served by a BorphServer."""
        return self._command('get_info', None, None, None, None)
    def read(self, device, num=1, fpgas=None):
        """Read 'num' data from the specified 'device' on the listed 'fpgas'.
        'fpgas' can be a list of numbers (counting from 0) or None
        (corresponding to all FPGAs)."""
        return self._command('read', device, None, num, fpgas)
    def binary_read(self, device, num=1, fpgas=None):
        """Read 'num' bytes of data from 'device'."""
        return self._command('binary_read', device, None, num, fpgas)
    def write(self, device, data, fpgas=None):
        """Write 'data' to the specified 'device'."""
        return self._command('write', device, data, None, fpgas)
    def binary_write(self, device, data, fpgas=None):
        """Write the binary string 'data' to the specified 'device'."""
        return self._command('binary_write', device, data, None, fpgas)
    def special(self, device, data):
        """Call the function mapped to a special device with data.  Return
        the result of that function."""
        return self._command('special', device, data, None, None)
