#! /usr/bin/env python
"""
plot autocorrelations
to do:
paramaterize properly
"""

import matplotlib, numpy, os, sys, struct, corr

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('plot_raw.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    opts, args = p.parse_args(sys.argv[1:])

    if args==[]:
        print 'Please specify a configuration file! \nExiting.'
        exit()

    config = corr.cn_conf.CorrConf(args[0])
    config_status = config.read_all()
    print '\n\nParsing config file %s...%s'%(args[0],config_status)
    sys.stdout.flush()
    if not config_status == 'OK': exit()

matplotlib.use('Agg')
db = corr.plotdb.PlotDB(config['db_file'])
print '''Database file Details:'''
print 'Number of channels: %s' %db.n_chans
print 'Number of Antennas: %s' %db.n_ants
print 'Number of Stokes params: %s' %db.n_stokes
print 'Total correlator bandwidth (GHz): %s' %db.bandwidth
print 'Mixing Frequency (GHz): %s' %db.mix_freq
#print 'Equalisation polynomial: %s<br>'%db.eq_poly
db.plot_type(type1='linear', type2='linear')
db.plot_mode(mode1='power',mode2='unwrap')
db.plot_raw()
