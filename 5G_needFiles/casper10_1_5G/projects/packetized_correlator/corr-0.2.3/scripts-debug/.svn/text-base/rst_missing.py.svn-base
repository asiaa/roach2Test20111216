#! /usr/bin/env python
import corr.borph,sys

if not sys.argv[1:]:
    print 'Please specify one or more servers.'
    exit()
servers = sys.argv[1:]
port = 9999
for s in servers:
    b = corr.borph.BorphClient(s, port)
    print  b.write('tvg_sel', 1 << 8)
    print b.write('tvg_sel', 0)
