#! /usr/bin/env python
import corr.borph,sys

port = 9999
if not sys.argv[1:]:
    print "Please specify a BEE. \nUsage: \nget_info.py [BORPHSERVER]"
    exit()

b = corr.borph.BorphClient(sys.argv[1], port)
data = b.get_info()
for k in data.keys():
    print k, ':'
    devs = data[k]
    devs.sort()
    print devs
    print
