#! /usr/bin/env python
"""
Script for checking received simulation data from raw correlator numpyDB file (usually corr.dbraw).

author: Jason Manley
date: 10 Oct 2007

"""
import struct, packet, time, corr.plotdb, corr.sim_cn_data, anydbm


if __name__ == '__main__':
    import sys
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('cn_rx.py [options]')
    p.set_description(__doc__)
    p.add_option('-d', '--dbfile', dest='dbfile', default=None,
        help='Write output data to a database file (for plotting).  The usual place for this is ~/public_html/corr.db')
    p.add_option('-v', '--verbose', dest='verbose', action='store_true',
        help='Be verbose (good for debugging)')
    opts, args = p.parse_args(sys.argv[1:])

if not opts.dbfile:
    print "Please specify location of numpy db file."
    sys.exit()

print "Looking for numpy db file in %s"%opts.dbfile

db = corr.plotdb.NumpyDB(opts.dbfile+'.raw', mode='r')
corr.plotdb.PrintInfoFile(opts.dbfile)
n_chan = anydbm.open(opts.dbfile+'.info', 'r')['n_chans']
n_chan = int(n_chan)

keys=db.keys()

if opts.verbose:
    print "found keys: ",keys

for key in keys:
    value=db.read(key)
    if opts.verbose:
        print key,value
    for chan in range(0,n_chan):
        dec_sel = corr.sim_cn_data.decode_32bit(value[chan])
        if opts.verbose:
            print "Key: %s Channel: %i"%(key,chan),
            print " Decoded Data: Baseline: %i "%dec_sel[0],
            print corr.sim_cn_data.bl2ij(dec_sel[0]),
            print " Channel:",(dec_sel[3]),
            print " Stokes parameter:", (dec_sel[1]),
            print " Real-Imag: ",(dec_sel[2])
