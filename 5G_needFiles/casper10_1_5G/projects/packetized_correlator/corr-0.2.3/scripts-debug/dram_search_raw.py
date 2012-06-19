'''
Search raw DRAM dumpfile for non-zero values.
Designed to be run from python prompt.

'''
import corr.plotdb

dmp = corr.plotdb.NumpyDB('/home/obs/public_html/corr.db.raw','r')
n_ants = 8
n_chans = 2048
n_stokes = 4

for i in range(0,n_ants):
    for j in range(i,n_ants):
        for pol in range(0,n_stokes):
            for chan in range (0,n_chans):
                if (dmp.read('%i-%i,p%i,r'%(i,j,pol))[chan] != 0):
                    print 'Found non-zero value at %i-%i,p%i,r on channel %i: '%(i,j,pol,chan),dmp.read('%i-%i,p%i,r'%(i,j,pol))[chan] 
                #else: print 'value at %i-%i,p%i,r on channel %i is zero'%(i,j,pol,chan)
                if (dmp.read('%i-%i,p%i,i'%(i,j,pol))[chan] != 0):
                    print 'Found non-zero value at %i-%i,p%i,i on channel %i: '%(i,j,pol,chan),dmp.read('%i-%i,p%i,i'%(i,j,pol))[chan]            
                #else: print 'value at %i-%i,p%i,i on channel %i is zero'%(i,j,pol,chan)
print 'finished searching'
