#! /usr/bin/env python
import corr.borph, time, sys

#servers = ['beegentle', 'beekind']
servers = sys.argv[1:]

print('Using the following servers:')
print(servers)

port = 9999
bees = [corr.borph.BorphClient(s, port) for s in servers]
def write_all(device, value):
    rv = []
    for b in bees: rv.append(b.write(device, value))
    return rv

def read_all(device):
    rv = []
    for b in bees: rv.append(b.read(device))
    return rv

write_all('tvg_sel', 0)
print write_all('ibob_ctrl', int('04005555',16))
print write_all('ibob_ctrl', int('04025555',16))
#print bees[0].write('ibob_ctrl', int('04035555',16), fpgas='FPGA0')
