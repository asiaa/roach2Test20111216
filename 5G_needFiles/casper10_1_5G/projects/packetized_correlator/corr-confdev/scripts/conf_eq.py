#! /usr/bin/env python
import corr.borph, numpy,sys,os,corr.packet
import sys
from optparse import OptionParser


def write_int_all(register,value):
    """Writes to register on all fpgas. 
    Returns 'ok' or string outlining failure."""
    for f,fpga in enumerate(fpgas):
        out = fpga.write_int(register,value)
        if out['status'] != ('SUCCESS'):
            return('''Failed to program %s:%s-%s''' %(servers[f],out['status'],out['data']))
    return('''ok''')    

def apply_eq_all(chans, gains):
    """Apply equalization coefficients to the IBOB.
    EQ channels are in the first blocks of address space."""
    write_int_all('ibob_addr',(2**32)-1)
    for xaui in range(n_xaui_ports_per_fpga):
        for antenna in range(n_ants_per_xaui):
            for c, g in zip(chans, gains):
                write_int_all('ibob_data%i'%(xaui),int(g))
                response=write_int_all('ibob_addr%i'%(xaui),c+(antenna*n_chans))
                if response != 'ok': return response 
                #print 'Wrote %i for channel %i on fpgas, xaui%i antenna %i.'%(int(g),int(c),xaui,int(antenna))
    return 'ok'

def apply_eq(fn,xaui,ant,chans, gains):
    """Apply equalization coefficients to the IBOB.
    EQ channels are in the first blocks of address space."""
    fpgas[fn].write_int('ibob_addr%i'%(xaui),(2**32)-1)
    for c, g in zip(chans, gains):
        fpgas[fn].write_int('ibob_data%i'%(xaui),int(g))
        response=fpgas[fn].write_int('ibob_addr%i'%(xaui),c+(ant*n_chans))['status']
        if response != 'SUCCESS': return response 
#        print 'Wrote %i for channel %i on %s, xaui%i antenna %i.'%(int(g),int(c),servers[fn],xaui,int(ant))
    return 'ok'

def re_equalize(self, thresh=.1, maxval=2**17-1, max_tries=10):
        """Automatically adjust equalization for maximum flatness around 4b pwr of 10."""
        print 'Equalizing'
        for i in range(max_tries):
            d = 0
            for bl in autos: d += read_acc(bl)
            d /= len(autos)
            neweq = numpy.sqrt(numpy.where(d > 0, 10/d, maxval))
            neweq *= equalization
            neweq = numpy.clip(neweq, 0, maxval)
            p = remove_spikes(numpy.log10(neweq+1e-5), return_poly=True)
            neweq = abs(10**numpy.polyval(p, numpy.arange(d.size)))
            neweq = numpy.clip(neweq, 0, maxval)
            fit = math.sqrt(numpy.average((1 - (neweq/equalization))**2))
            print '    Percent gain change:', fit, '(thresh=%f)\n' % thresh
            if fit < thresh: break
            equalization = numpy.round(neweq)
            _apply_eq(active_chans, equalization)
            curr_acc = self['acc_num']
            print '    Waiting for accumulation...'
            while self['acc_num'] <= curr_acc + 1: time.sleep(.01)


if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('conf_eq.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-a', '--auto_eq', dest='init_eq', action='store_true', default=False,
        help='''Attempt to perform automatic equalisation starting from the equalisation polynomials specified in the configuration file.''')  
    p.add_option('-i', '--init_eq', dest='init_eq', type='int', default=0,
        help='''Initialise all ibobs' equaliser channels to specified value.''')
    p.add_option('-p', '--eq_poly', dest='eq_poly', action='store_true', default=False,
        help='''Initialise all ibobs' equaliser channels to the equalization polynomials specified in the config file.''')
    opts, args = p.parse_args(sys.argv[1:])

    if args==[]:
        print 'Please specify a configuration file! \nExiting.'
        exit()

    config = corr.cn_conf.CorrConf(args[0])
    config_status = config.read_all()
    print '\n\nParsing config file %s...%s'%(args[0],config_status)
    sys.stdout.flush()
    if not config_status == 'OK': exit()


servers = [s['server'] for s in config['servers']]
fpgas = [corr.udp_client.UDPClient(s['server'], s['port']) for s in config['servers']]
n_chans = config['n_chans']
n_ants_per_xaui=config['n_ants_per_xaui']
n_xaui_ports_per_fpga=config['n_xaui_ports_per_fpga']

print'Equalising IBOBs on ',servers

if opts.init_eq>0:
    print '''Resetting all ibobs' %i channels' gains to %i...'''%(n_chans,opts.init_eq),
    sys.stdout.flush()
    print apply_eq_all(range(n_chans), [opts.init_eq for i in range(n_chans)])

elif opts.eq_poly:
    for xaui in range(n_xaui_ports_per_fpga):
        for fn,fpga in enumerate(fpgas):
            for ibob_ant in range(n_ants_per_xaui):
                ant=xaui*(len(fpgas)*n_ants_per_xaui)+fn*n_ants_per_xaui+ibob_ant
                coeffs = config['eq']['eq_polys'][ant]
                print '''Initialising EQ for antenna %i on %s's XAUI %i to'''%(ant,servers[fn],xaui),
                for term,coeff in enumerate(coeffs):
                    if term==(len(coeffs)-1): print '%i...'%(coeff),
                    else: print '%ix^%i + '%(coeff,len(coeffs)-term-1),
                sys.stdout.flush()
                equalization = numpy.polyval(coeffs, range(n_chans))
                print apply_eq(fn,xaui,ibob_ant,range(n_chans), equalization)    
    print 'All done.\n'

elif opts.auto_eq:
    print '''Not yet implemented!\n'''
    #print '''Resetting all ibobs' %i channels' gains to %i...'''%(config['n_chans'],opts.auto_eq),
    # Calculate gain in IBOB to extrapolate back to 4b values
    #auto_gain = float(opts.acc_len * (opts.clk_per_sync / n_chan))
    #cross_gain = auto_gain / (2**(4+4*cross_shift))
    # Set a default equalization
    #equalization = numpy.polyval(opts.eq_poly, range(0,opts.n_chan))
    #apply_eq(range(0,opts.n_chan), equalization)

else:
    print 'Auto-configuring based on config script...'
    print 'Not yet implemented!\n'
