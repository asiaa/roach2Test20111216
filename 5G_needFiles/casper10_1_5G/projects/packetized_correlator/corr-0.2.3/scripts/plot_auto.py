#! /usr/bin/env python
"""
plot autocorrelations
to do:
paramaterize properly
"""

import os, sys, time
import matplotlib
matplotlib.use('Agg')
import corr.plotdb
dbfile = '/home/casper/corr.db'
db = corr.plotdb.PlotDB(dbfile)
print '''Database file Details:'''
print 'Number of channels: %s' %db.n_chans
print 'Number of Antennas: %s' %db.n_ants
print 'Number of Stokes params: %s' %db.n_stokes
print 'Number of integrations: %s' %db.gain
print 'Total correlator bandwidth (GHz): %s' %db.bandwidth
print 'Mixing Frequency (GHz): %s' %db.mix_freq
#print 'Equalisation polynomial: %s<br>'%db.eq_poly

db = corr.plotdb.PlotDB(dbfile)
db.plot_type(type1='linear', type2='linear')
db.plot_mode(mode1='power',mode2='unwrap')
db.plot_scaleback(scaleback=True)
db.plot_auto()
