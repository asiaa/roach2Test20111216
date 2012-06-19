"""
A module for writing MIRIAD data sets from correlator data.

Author: Aaron Parsons
Date: 10/18/2006
Revisions: 
    11/08/2006  arp     Changed pol uv.var recorded to follow Miriad convention
                        for linear feeds (-5,-6,-7,-8) for (xx, yy, xy, yx).
                        Also added flagging for data with correlator errors.
    11/12/2006  arp     Stopped writing data to disk which is flagged by
                        correlator.  Added option to choose output directory.
                        Put in automatic rfi-by-frequency flagging.
    03/30/2007  arp     Updated to receive data from x_engine-based tx
                        (which allows for rx from multiple boards).
    04/13/2007  arp     Split out basic file recording into separate class for 
                        use with the serial interface of a pocket correlator.
    05/17/2007  arp     Fixed MiriadRecorder to write u,v,w projected to
                        zenith (rather than raw bx,by,bz).
    01/15/2008  arp     Sync'd with aipy-0.4.2
"""
__version__ = '0.1.1'

import numpy, ephem, time, os, aipy

#  __  __ _      _           _ ____
# |  \/  (_)_ __(_) __ _  __| |  _ \ __ _ _ __ __ _ _ __ ___  ___
# | |\/| | | '__| |/ _` |/ _` | |_) / _` | '__/ _` | '_ ` _ \/ __|
# | |  | | | |  | | (_| | (_| |  __/ (_| | | | (_| | | | | | \__ \
# |_|  |_|_|_|  |_|\__,_|\__,_|_|   \__,_|_|  \__,_|_| |_| |_|___/

class MiriadParams(dict):
    """A class for passing information in this parameter file to Miriad.
    This is used in initializing new UV files."""
    def __init__(self, **kwargs):
        """nchans:         Number of channels being recorded.
        ants:           An 2D array of (antennas, positions).
        acc_len:        Number of sync pulses in an accumulation.
        adc_clk_rate:   Sample rate of ADCs (in GHz).
        comp_chans:     The number of channels actually computed by the FFT
                        (if recording fewer than are computed).  Default nchans
        schan:          If nchans < comp_chans, the index of the channel with
                        the lowest frequency of all recorded channels.  Chan 0
                        is band center.  Chan 'comp_chans/2' is the lowest
                        overall frequency.  Assumes recorded channels are
                        contiguous.  Default comp_chans/2
        clk_per_sync:   Number of clks between sync pulses.
        n_stokes:       Number of stokes parameters.  Default 4
        ddc_mix_freq:   The mixing frequency of the DDC, normalized to an
                        adc clock rate of 1.
        ddc_decimation: The level of decimation in the DDC.  Determines the
                        bandwidth of the correlator.
        bandpass:       See doc for set_bandpass().  Can be set after init.
        location:       (lat, long, [elev]) of the antenna array."""
        for k in ['nchans', 'ants', 'acc_len', 'adc_clk_rate', 'clk_per_sync',
                'ddc_mix_freq', 'ddc_decimation', 'location']:
            assert(kwargs.has_key(k))
        dict.__init__(self)
        prms = {'n_stokes':4}
        prms.update(kwargs)
        # Allow for if we aren't recording all the channels which are computed
        if not prms.has_key('comp_chans'): prms['comp_chans'] = prms['nchans']
        assert(prms['comp_chans'] >= prms['nchans'])
        # schan is indexed from the center (mixing) frequency.  Convert numbers
        # in the second half of a spectrum to the negative channels they
        # represent.
        if not prms.has_key('schan'): prms['schan'] = prms['comp_chans']/2
        if prms['schan'] >= prms['comp_chans']/2:
            prms['schan'] -= prms['comp_chans']
        # Derive channel frequencies from adc_clk_rate
        bandwidth = prms['adc_clk_rate'] / prms['ddc_decimation']
        sdf = bandwidth / prms['comp_chans']
        sfreq = prms['adc_clk_rate']*prms['ddc_mix_freq'] + (prms['schan']*sdf)
        int_time = prms['clk_per_sync'] / (bandwidth * 1e9) * prms['acc_len']
        freqs = numpy.arange(prms['nchans'], dtype=numpy.float) * sdf + sfreq
        beam = aipy.ant.Beam(freqs)
        ants = [aipy.ant.Antenna(a[0],a[1],a[2],beam) for a in prms['ants']]
        # Set antenna positions in miriad file
        self.aa = aipy.ant.AntennaArray(prms['location'], ants)
        n_ants = len(self.aa.ants)
        # Set parameters used in miriad uv files.
        self['source']  = ('a', 'zenith')
        self['operator']= ('a', 'C2M Python')
        self['version'] = ('a', __version__)
        self['telescop']= ('a', 'CASPER-N')
        ants = numpy.array(prms['ants'])
        ants = ants.transpose() # To account for C-Fortran indexing
        self['antpos']  = ('d', ants.flatten())
        if prms.has_key('bandpass'): self.set_bandpass(prms['bandpass'])
        self['freq']    = ('d', sfreq)
        self['inttime'] = ('r', int_time)
        self['nants']   = ('i', n_ants)
        self['nchan']   = ('i', prms['nchans'])
        self['nspect']  = ('i', 1)
        self['sfreq']   = ('d', sfreq)
        self['sdf']     = ('d', sdf)
        self['ischan']  = ('i', 1)
        self['nschan']  = ('i', prms['nchans'])
        self['restfreq']= ('d', sfreq)
        self['npol']    = ('i', prms['n_stokes'])
        self['epoch']   = ('r', 2000.)
        self['veldop']  = ('r', 0.)
        self['vsource'] = ('r', 0.)
        self['longitu'] = ('d', self.aa.long)
        self['latitud'] = ('d', self.aa.lat)
        self['dec']     = ('d', self.aa.lat)
        self['obsdec']  = ('d', self.aa.lat)
        self['ra']      = ('d',)
        self['obsra']   = ('d',)
        self['lst']     = ('d',)
        self['pol']     = ('i',)
    def set_bandpass(self, bandpass):
        """The digital equalization which needs to be divided from the output 
        channels.  Should have dimensions of (n_baselines, nchans) and be
        dtype=complex64."""
        nants = self['nants'][-1]
        nchan = self['nchan'][-1]
        sfreq = self['sfreq'][-1]
        sdf = self['sdf'][-1]
        assert(bandpass.shape == (nants, nchan))
#        bandpass = bandpass.transpose() # To account for C-Fortran indexing - NOT NECESSARY
        self['bandpass']= bandpass.flatten()
        self['nspect0'] = nants
        self['nchan0']  = nchan
        self['ntau'] = 0
        self['nfeeds'] = 1
        self['nsols'] = 0
        self['ngains'] = nants * (self['ntau'] + self['nfeeds'])
        self['freqs'] = (nants,) + (nchan, sfreq, sdf) * nants

class MiriadRecorder(MiriadParams):
    def open_uv(self, filename):
        """Open a Miriad UV file for writing."""
        self.uv = aipy.miriad.UV(filename, 'new')
        self.open_file = filename
        self.uv['history'] = 'C2M (Python): Version=%s.\n' % (__version__)
        self.uv['obstype'] = 'crosscorrelation'
        for v in self.keys():
            val = self[v]
            # Detect if this in an item or not
            if v in aipy.miriad.itemtable: self.uv[v] = val
            else:
                self.uv.add_var(v, val[0])
                try: self.uv[v] = val[1]
                except(IndexError): pass
    def close_uv(self, filename):
        """Closes the current UV file and renames it to filename."""
        del(self.uv)
        os.rename(self.open_file, filename)
        del(self.open_file)
    def gen_preamble(self, t, i, j):
        """Generate preamble information (u, v, w, t, bl) for a given
        time and two antennas (i, j)."""
        uvw = self.aa.get_baseline(i, j)
        return (uvw, self.conv_time(t), (i,j))
    def conv_time(self, t):
        """Convert standard unix time (seconds since whenever) to a Julian 
        date."""
        t_tup = time.gmtime(t)[:6]
        return ephem.julian_date(t_tup)
    def record(self, t, i, j, pol, data):
        """Record to file 'data' for antennas i, j, stokes parameter s for
        an integration which finished at time 't' (Unix time)."""
        t -= self['inttime'][1] / 2
        p = self.gen_preamble(t, i, j)
        self.aa.set_jultime(p[-2])
        lst = self.aa.sidereal_time()
        self.uv['pol'] = aipy.miriad.str2pol[pol]
        self.uv['ra'] = lst
        self.uv['obsra'] = lst
        self.uv['lst'] = lst
        self.uv.write(p, data, numpy.zeros_like(data))
