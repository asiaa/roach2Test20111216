#! /usr/bin/env python
import corr.borph,sys


gbe_conf = """
begin
    ip = 10.0.0.%d
    mac = 00:12:6D:AE:00:%s
    gateway = 10.0.0.1
    port = 8888
end
"""
def get_gbe_conf(num):
    ip = 128 + num
    haddr = hex(num)[2:]
    if len(haddr) < 2: haddr = '0' + haddr
    return gbe_conf % (ip, haddr.upper())

servers = sys.argv[1:]
print('programming servers ' + str(servers) + ''' with IP addr starting 10.0.0.128''')

#fpgas = ['FPGA0', 'FPGA1', 'FPGA2', 'FPGA3']
fpgas = ['FPGA2']
port = 9999
bees = [corr.borph.BorphClient(s, port) for s in servers]
def write_all(device, value):
    rv = []
    for b in bees: 
        rv.append(b.write(device, value))
    return rv

def read_all(device):
    rv = []
    for b in bees:
        rv.append(b.read(device))
    return rv

# Set UDP TX port
write_all('gbe_port', 8888)

# Configure the 10 GbE core
fpga = 0
for b in bees:
    for f in fpgas:
        b.binary_write('gbe', get_gbe_conf(fpga), fpgas=[f])
        fpga += 1

# Verify the 10 GbE configuration by reading and printing it out
fpga = 0
for s, b in zip(servers, bees):
    print s
    conf = b.binary_read('gbe', num=-1)
    for f in fpgas:
        print f
        print conf[f]['data']
