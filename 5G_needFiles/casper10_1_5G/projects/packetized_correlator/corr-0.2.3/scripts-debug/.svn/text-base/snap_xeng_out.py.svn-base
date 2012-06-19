#!/usr/bin/env python

'''
Grabs the contents of "snap_128bit" (one per FPGA) at the output of the X engines for analysis.
Assumes the correlator is already initialsed and running etc.

'''
import corr.borph, time, numpy, pylab, struct, corr.sim_cn_data

#defaults that will be used if not executed from the command line
servers = ['beesweet']
ctrl_port = 9999
fpgas = ['FPGA0','FPGA1','FPGA2','FPGA3']
brams=['bram0','bram1','bram2','bram3']
x_per_fpga = 1
n_ants = 8

dev_name = 'snap_xout'

if __name__ == '__main__':
    import sys
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('snap_xeng_out.py [options] [servers]')
    p.set_description(__doc__)
    p.add_option('-x', '--x_per_fpga', dest='x_per_fpga', type='int', default=1,
        help='Number of X engines to read per fpga.  Default 1')
    p.add_option('-n', '--n_ants', dest='n_ants', type='int', default=8, 
        help='Number of antennas in system.  Default is 8')
    p.add_option('-a', '--print_all', dest='print_all', action='store_true', 
        help='Print all the decoded results')
   
    opts, args = p.parse_args(sys.argv[1:])
    servers = args
    x_per_fpga = opts.x_per_fpga
    n_ants = opts.n_ants
    n_bls = n_ants * (n_ants+1)/2

bees = [corr.borph.BorphClient(s, ctrl_port) for s in servers]

for server,b in enumerate(bees):
    print 'Checking %s'%s
    print '--------------------'
    b.write('out_rst',0)
    b.write('out_rst',1)
    print ('Waiting...')
    time.sleep(2)
    print ('Retrieving...')
    bram_dmp=dict()

    for xeng in range(x_per_fpga):
        print 'X engine %i'%xeng
        print '--------------------'
        for bramindex in brams:
            bram_name = dev_name+('%i'%(xeng+1))+'_'+bramindex
            print 'Reading bram %s'%bram_name
            bram_dmp[bramindex]=b.binary_read(bram_name,-1)
            if bram_dmp[bramindex][fpgas[0]]['status'] != 'SUCCESS':
                print 'Failed to read BRAM %s on %s'%(bram_name,server)
                exit(0)

        print 'Unpacking bram contents...',
        sys.stdout.flush()

        bram_data=dict()
        for f in fpgas:
            bram_data[f]=dict()
            for bramindex in brams:
                bram_data[f][bramindex]=[]
                for i in range(0,len(bram_dmp[brams[0]][fpgas[0]]['data']),2):
                    bram_data[f][bramindex].append(struct.unpack('>h', bram_dmp[bramindex][f]['data'][i:i+2])[0])
        
        print 'Done.'

        
        print 'Checking for non-zero values:'

            
        for f in fpgas:
            for bramindex in brams:
                for i in range(0,len(bram_dmp[brams[0]][fpgas[0]]['data'])/2,2):
                    if (bram_data[f][bramindex][i] != 0) or (bram_data[f][bramindex][i+1] != 0) or (opts.print_all):
                        bln=corr.sim_cn_data.bl2ij(corr.sim_cn_data.get_bl_order(8)[((i/2)%n_bls)])
                        print '%s, %s, Index: %i. \t freq slice %i. \t raw value (complex): %i and %i. \t BL='%(f, bramindex, i/2, ((i/2)/n_bls), bram_data[f][bramindex][i],bram_data[f][bramindex][i+1]),bln
        
        
        print 'Done with %s, X engine %i'%(server,xeng)
        print '--------------------'

print 'Done with all'
    
