#! /usr/bin/env python
"""
Good for revisions 308b and upwards.

"""

import corr.borph,sys

#servers = ['beegentle', 'beekind']
if not sys.argv[1:]:
    print "Please specify one or more servers."
    exit()

servers = sys.argv[1:]
port = 9999
for s in servers:
    print s + '... ',
    b = corr.borph.BorphClient(s, port)
    print b.write('tvg_sel', 1<<15)['FPGA0']['status']
    b.write('tvg_sel', 0)
