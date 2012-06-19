#! /usr/bin/env python
"""
INCOMPLETE and UNTESTED
Select test vector generator from CasperN correlator. Good for BEE designs rev 306 and upwards.
Author: Jason Manley 
Date: 10/01/2007
Revisions: None
"""
import corr.borph, time, sys

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('cn_tx.py [options] ')
    p.set_description(__doc__)
    p.add_option('-p', '--tcp_port', dest='tcp_port', type='int', default=9999, 
        help='Correlator control port.  Default is 9999')
    p.add_option('-d', '--descramble_tvg', dest='descramble_tvg', type='int', default=0, 
        help='Descramble TVG (input to x engine)')
    p.add_option('-x', '--xeng_tvg', dest='xeng_tvg', type='int', default=0, 
        help='X engine TVG (output of X engine)')
    opts, args = p.parse_args(sys.argv[1:])

servers = args
fpgas = ['FPGA0','FPGA1','FPGA2','FPGA3']


print('Using the following servers:')
print(servers)

bees = [corr.borph.BorphClient(s, opts.tcp_port) for s in servers]
def write_all(device, value):
    rv = []
    for b in bees: rv.append(b.write(device, value))
    return rv

def read_all(device):
    rv = []
    for b in bees: rv.append(b.read(device))
    return rv

#print write_all('tvg_sel', opts.descramble_tvg<<3 + opts.xeng_tvg<<1)
#print write_all('tvg_sel', 2<<2) #select X_tvg #2
print write_all('tvg_sel', 0) #select no tvg
