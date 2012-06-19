"""A module for interfacing to an IBOB over a serial port."""
import serial, struct, time, math

class RawIBOBSerial(serial.Serial):
    """A low-level interface to an IBOB over a serial port."""
    def __init__(self, devices, port='/dev/ttyUSB0', endian='>'):
        """devices:     A dictionary of device names and hardware addresses
        port:        The location of the serial connection to the IBOB
        endian:      The endian-ness of numbers from the IBOB (don't change)"""
        serial.Serial.__init__(self, port, baudrate=115200, timeout=1)
        self.devices = devices
        self.endian = endian
    def force_write(self, data):
        """Write data over serial connection, and hang until it is written."""
        while True:
            try:
                serial.Serial.write(self, data)
                break
            except(OSError): pass
    def binary_read(self, dev, num, max_num=127):
        """Read 'num' bytes (must be a multiple of 32) from 'dev'.  Don't mess
        with 'max_num'."""
        assert(num % 4 == 0)
        addr = self.devices[dev]
        buf = ''
        while len(buf) < num:
            L = len(buf)
            read_num = min((num-L)/4, max_num)
            self.flushInput()
            self.force_write('\x80' + chr(read_num) + \
                struct.pack(self.endian+'I', addr+L))
            while self.inWaiting() < 4 * read_num: time.sleep(.01)
            buf += serial.Serial.read(self, self.inWaiting())
        return buf
    def binary_write(self, dev, data, max_num=127):
        """Write the binary string 'data' to 'dev'.  Don't mess with 
        'max_num'."""
        addr = self.devices[dev]
        assert(len(data) % 4 == 0)
        num = int(math.ceil(float(len(data)/4) / max_num))
        for i in range(num):
            d = data[4*i*max_num:4*(i+1)*max_num]
            n = len(d) / 4
            self.force_write('\x80' + chr(128 | n) + \
                struct.pack(self.endian+'I', addr))
            self.force_write(d)

class IBOBSerial(RawIBOBSerial):
    """A higher-level interface to an IBOB."""
    def __init__(self, devices, type_dict={}, port='/dev/ttyUSB0'):
        """type_dict:   A dictionary of device names and data types (from the
                        formats outlined in the struct module).
            See RawIBOBSerial documentation for other parameters."""
        RawIBOBSerial.__init__(self, devices, port=port)
        self.type_dict = type_dict
        for k in self.devices.keys():
            if not self.type_dict.has_key(k): self.type_dict[k] = 'I'
    def read(self, dev, num=1):
        """Read 'num' values (as outlined in type_dict above) from 'dev'."""
        T = self.type_dict[dev]
        Tsize = struct.calcsize(T)
        buf = self.binary_read(dev, num*Tsize)
        N = len(buf) / Tsize
        rv = struct.unpack(self.endian + str(N)+T, buf)
        if len(rv) == 1: return rv[0]
        else: return rv
    def write(self, dev, nums):
        """Write 'nums'--a sequence of numbers--to 'dev'."""
        T = self.type_dict[dev]
        try: buf = struct.pack(self.endian + str(len(nums)) + T, *nums)
        except(TypeError): buf = struct.pack(self.endian + T, nums)
        self.binary_write(dev, buf)
    def __getitem__(self, dev):
        return self.read(dev)
    def __setitem__(self, dev, num):
        assert(self.devices.has_key(dev))
        self.write(dev, num)
        
