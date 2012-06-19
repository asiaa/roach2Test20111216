"""
Module for plotting data from a central database repository of correlator
data.

Author: Aaron Parsons
Modified Jason Manley
Date: 10/03/2007

Known problems:
Can't plot semilog if there are no non-zero values in a vector.

Revisions:
    2008/01/30: JRM Removed seperate info file and integrated with existing numpydb
                    Removed gain (scaleback) option - cn_rx now scales by default
                    Misc neatening
                
    10/01/2007: JRM added new plotting functions
                    necessary 'cos plotting all 512 baselines of 32 antennas not feasible.
                    added bits to take advantage of new database info file
                    added option to scale back amplitudes to ibob values (ie divide by integration gain)
                    should be (mostly) backwards compatible!

    06/09/07    arp Made interface more abstract and simple for PocketCorr.
"""

import pylab, numpy, anydbm, os, time

#colors = ('b', 'g', 'r', 'c', 'm', 'y', 'k')
#symbols = ('','.',',','o','^','v','<','>','s','+','x','D','d',
#           '1','2','3','4','h','H','p','|','_')
#lines = ('-','--','-.',':','')


class NumpyDB:
    """Module for holding numpy arrays in a database."""
    def __init__(self, dbfile, mode='c'):
        try: 
            self.db = anydbm.open(dbfile, mode)
            self.dbfile=dbfile
        except(anydbm.error):
            os.remove(dbfile)
            self.db = anydbm.open(dbfile, mode)

    def write(self, name, data):
        self.wr_metadata(name, data)
        self.db[name] = data.tostring()
        #print "written %s to database as type %s with shape %s."%(data.tostring(), str(data.dtype),str(data.shape))
        self.db.sync()
    def wr_metadata(self, name, data):
        mname = '_' + name + '_'
        self.db[mname+'type'] = str(data.dtype)
        self.db[mname+'shape'] = str(data.shape)
    def read(self, name):
        type, shape = self.rd_metadata(name)
        data = numpy.fromstring(self.db[name], dtype=type)
        data.shape = shape
        return data
    def rd_metadata(self, name):
        mname = '_' + name + '_'
        type = self.db[mname+'type']
        shape = eval(self.db[mname+'shape'])
        return type, shape
    def keys(self):
        return [k for k in self.db.keys() if not k.startswith('_')]
    def data_date(self):
        return time.ctime(os.stat(self.dbfile)[-1])

class PlotDB(NumpyDB):
    """ Various functions for plotting correlator ouput."""
    def __init__(self, dbfile, mode='r'):
        NumpyDB.__init__(self, dbfile, mode=mode)
        if mode == 'r':
            self.ReadInfoFile()
        self.plot_type()
        self.plot_mode()

    def WriteInfoFile(self,adc_clk_rate,ddc_decimation,ddc_mix_freq,n_chans,n_ants,n_stokes,xeng_acc_len,acc_len, eq_polys):
        """Add correlator metadata to a numpy database. This is expected for plotting."""
        import numpy
        self.write('n_chans',numpy.int16(n_chans))
        self.write('n_ants',numpy.int16(n_ants))
        self.write('n_stokes',numpy.int16(n_stokes))
        self.write('bandwidth',numpy.float32(adc_clk_rate/ddc_decimation) )
        self.write('mix_freq',numpy.float32(adc_clk_rate*ddc_mix_freq) )
#        self.write('eq_polys',numpy.array(eq_polys))
#   fix this calculation:
#        self.write('int_len',numpy.float32(xeng_acc_len*acc_len*ddc_decimation*ddc_mix_freq/adc_clk_rate))

    def ReadInfoFile(self):
        self.n_chans = self.read('n_chans')
        self.n_ants = self.read('n_ants')
        self.n_stokes = self.read('n_stokes')
        self.bandwidth = self.read('bandwidth')
        self.mix_freq = self.read('mix_freq')
        self.stokes = ['xy','yx','xx','yy'][:self.n_stokes]
#        self.eq_polys = self.read('eq_polys')

    def PrintInfoFile(dbfile):
        """ Print the ouput of the metadata file in raw text."""
        print 'Number of channels: %i' %self.read('n_chans')
        print 'Number of Antennas: %i' %self.read('n_ants')
        print 'Number of Stokes params: %i' %self.read('n_stokes')
        print 'Total correlator bandwidth (GHz): %f' %self.read('bandwidth')
        print 'Mixing Frequency (GHz): %f' %self.read('mix_freq')
  #      for i in range(self.read('n_ants')):
  #          print 'Equalisation polynomial antenna %i: '%i,self.read('eq_polys')[i]


    def plot_type(self, type1='linear', type2='linear'):
        if type1 == 'linear': 
            self.plot_func1 = pylab.plot
        else: 
            self.plot_func1 = pylab.semilogy
        if type2 == 'semilogy': 
            self.plotfunc2 = pylab.semilogy
        else: 
            self.plot_func2 = pylab.plot

    def plot_mode(self, mode1='power', mode2='wrap'):
        if mode1 == 'rms': 
            self.ymap1 = lambda x: numpy.sqrt(numpy.abs(x))
            self.ylabel1 = 'Power (RMS)'
        elif mode1=='raw':
            self.ymap1 = numpy.real
            self.ylabel1 = "Raw value"
        else: 
            self.ymap1 = numpy.abs
            self.ylabel1 = 'Power (r^2 + i^2)'
        if mode2 == 'unwrap':
            try:
                import scipy
                self.ymap2 = lambda x: scipy.unwrap(numpy.angle(x))
                self.ylabel2='Unwrapped Phase'
            except(ImportError): pass
        elif mode2=='raw':
            self.ymap2=numpy.imag
            self.ylabel2='Raw Value'
        else: 
            self.ymap2 = numpy.angle
            self.ylabel2='Wrapped Phase (rad/s)'


    def plot(self,keys=None,outfile=None):
        """ Legacy support - prints all auto correlations"""
        self.plot_auto(keys,outfile)

    def plot_auto(self, keys=None, outfile=None):
        """ Plots all autocorrelations, unless user selects keys.
            Outfile specifies optional ouput to .png graphic file. 
        """
        starttime = time.time()
        if keys is None: keys = self.keys()
        keys.sort()
        auto_keys=dict()
        for pol in self.stokes:
            auto_keys[pol]=[]

        for k in (keys): 
            #find the auto-correlations:
            if (k[0]==k[2]):
                for pol in self.stokes:
                   if (k[4:] == pol):
                       auto_keys[pol].append(k)

        pylab.figure(num=1,figsize=(10,10))
        ax1 = pylab.subplot(411)

        for pol,stokes in enumerate(self.stokes):
            pylab.subplot(411+pol, sharex=ax1)
            pylab.title('%s'%stokes)
            for k in auto_keys[self.stokes[pol]]: 
                dataseries= self.read(k)
                self.plot_func1(self.ymap1(numpy.array(dataseries)), label=k[0:3])
            pylab.xlim(0,self.n_chans)
            pylab.ylabel(self.ylabel1)
            pylab.grid()

        pylab.xlabel('Channel')
        pylab.legend(loc='lower right')

        pylab.subplot(411, sharex=ax1)
        pylab.title('Auto-Correlations\nUpdated %s from data file dated %s.'%(time.asctime()[0:19],self.data_date()[0:19]))

        # Plot the data to the screen, or save it to a file
        if outfile is None: pylab.show()
        else: pylab.savefig(outfile, format='png')

        #print 'Compute time: %is' %(time.time() - starttime)


    def plot_cross(self, keys=None, outfile=None, chan1=0, chan2=0):
        """Plot cross correlations between channel 1 and channel 2. 
           If outfile is specified, generate a .png graphic,
           else output to screen. Keys allows user to specify keys
           to index, else prints entire database file. 
        """
        starttime=time.time()
        if keys is None: keys = self.keys()
        keys.sort()
        if (chan1 > chan2):
            #print 'Reversing channel lookup indices'
            tempvalue = chan2
            chan2 = chan1
            chan1 = tempvalue
        pylab.figure(num=1,figsize=(10,10))
        ax1 = pylab.subplot(211)
        pylab.xlim(0,self.n_chans)
        # Make this axis invisible (to share with the one below it)
        pylab.setp(ax1.get_xticklabels(), visible=False)
        dataseries=[]
        for s,pol in enumerate(self.stokes):
            key='%i-%i,%s'%(chan1,chan2,pol)
            #print('looking up key:%s'%key)
            dataseries.append(self.read(key))
            self.plot_func1(self.ymap1(numpy.array(dataseries[s])), label=key)
            pylab.xlim(0,self.n_chans)
        pylab.setp(ax1.get_xticklabels(), visible=False)
        pylab.ylabel(self.ylabel1)
        pylab.xlim(0,self.n_chans)
        #pylab.ylim(1,100)
        pylab.title('Cross-Correlation ant %i vs %i,\nUpdated %s from data file dated %s.'%(chan1,chan2,time.asctime()[0:19],self.data_date()[0:19]))
        pylab.grid()
        
        # Share the x axis with plot above it
        pylab.subplot(212, sharex=ax1)

        #plot the phase:
        for s,pol in enumerate(self.stokes):
            key='%i-%i,%s'%(chan1,chan2,pol)
            self.plot_func2(self.ymap2(dataseries[s]),label=key)
            pylab.xlim(0,self.n_chans)
        pylab.ylabel(self.ylabel2)
        pylab.xlim(0,self.n_chans)
        pylab.legend(loc='lower right')


        # Plot the data to the screen, or save it to a file
        if outfile is None:
            pylab.show()
        else: 
            pylab.savefig(outfile, format='png')

        #print 'Compute time: %is' %(time.time() - starttime)

    def plot_raw(self, keys=None, outfile=None, chan1=0, chan2=0):
        """ Print the raw real and imaginary values from the correlator
            for a given baseline.
        """
        starttime=time.time()
        if keys is None: keys = self.keys()
        keys.sort()
        #print 'Number of baselines found: %i '%len(keys)
        #print 'Keys found:'
        #print (keys)
        if (chan1 > chan2):
            #print 'Reversing channel lookup indices'
            tempvalue = chan2
            chan2 = chan1
            chan1 = tempvalue

        dataseries=[]
        pylab.figure(num=1,figsize=(10,10))
        ax1 = pylab.subplot(411)          
        # Make this axis invisible (to share with the one below it)
        pylab.setp(ax1.get_xticklabels(), visible=False)


        for s in range(0,4):
            key='%i-%i,p%i'%(chan1,chan2,s)
            #print('looking up key:%s'%key)
            dataseries.append(self.read(key))
            pylab.subplot((411 + s), sharex=ax1)
            self.plot_func1(numpy.array(dataseries[s]).real, label='real')
            self.plot_func1(numpy.array(dataseries[s]).imag, label='imag')
            pylab.grid()
            pylab.ylabel(self.ylabel1)
            #pylab.ylim(-1,100)
            pylab.xlim(0,self.n_chans)            
            pylab.legend(loc='lower right')

        pylab.subplot(411, sharex=ax1)
        pylab.title('Raw Cross-Correlation values: ant %i vs %i,\nUpdated %s from data file dated %s.'%(chan1,chan2,time.asctime()[0:19],self.data_date()[0:19]))

        # Plot the data to the screen, or save it to a file
        if outfile is None:
            #print 'outfile is None' 
            pylab.show()
        else: 
            #print 'Saving to file %s'%outfile
            pylab.savefig(outfile, format='png')

        #print 'Compute time: %is' %(time.time() - starttime)

