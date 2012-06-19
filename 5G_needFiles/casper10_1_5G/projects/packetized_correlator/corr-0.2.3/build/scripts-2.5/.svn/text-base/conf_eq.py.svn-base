#!/usr/bin/python
import corr.borph, numpy,sys,os,corr.packet
import sys
from optparse import OptionParser


def special_all(device, value):
    rv = []
    for b in bees: rv.append(b.special(device, value))
    return rv

def check_special_result(results):
    """Checks the returned list to make sure that all registers were successfully written to. Returns 'ok' or string outlining failure."""
    for b in enumerate(bees):
        if results[b[0]]['status'] != ('SUCCESS'):
            return('''Failed to program %s''' %(servers[b[0]]))
    return('''ok''')

def apply_eq(chans, gains):
    """Apply equalization coefficients to the IBOB."""
    for c, g in zip(chans, gains):
        # For eq_coeff: 11b addr, 3b skip, 1b en, 3b skip, 9b coeff
        write_all('ibob_eq_coeff', (c << 20) | 1 << 17 | int(g))
        print 'Writing %i for channel %i'%(int(g),int(c))
    write_all('ibob_eq_coeff', 0)

def write_all(device, value):
    """Writes a value to the register 'device' for all BEE FPGAs."""
    rv = []
    for b in bees: rv.append(b.write(device, value))
    return rv

def read_all(device):
    """Reads a value from register 'device' for all BEE FPGAs."""
    rv = []
    for b in bees: rv.append(b.read(device))
    return rv



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
    p.set_usage('cn_tx.py [options] ')
    p.set_description(__doc__)
    p.add_option('-f', '--fft_shift', dest='fft_shift', type='str', default='03ff',
        help='FFT Shifting schedule in hex.  Default 03FF')
    p.add_option('-a', '--acc_len', dest='acc_len',type='int', default=6, 
        help='Set the accumulation length. 2^x s. Default: 6 (64 seconds)')
    p.add_option('-p', '--ctrl_port', dest='ctrl_port', type='int', default=9999, 
        help='Correlator TCP control port.  Default is 9999')
    p.add_option('-l', '--adc_clk', dest='adc_clk', type='float', default=.600,
        help='ADC clock rate in GHz.  Default .600')
    p.add_option('-c', '--n_chan', dest='n_chan', type='int', default=2048, 
        help='Number of frequency channels computed in the correlator.  Default is 2048')
    p.add_option('-y', '--clk_per_sync', dest='clk_per_sync', type='long', default=2**27, 
        help='Number of clocks per sync pulse.  Default 2^27')
    p.add_option('-i', '--init_eq', dest='init_eq', action='store_true', default=False, 
        help='''Initialise all ibobs' equaliser channels to first entry in EQ polynomial.  Default False''')
    p.add_option('-q', '--eq_poly', dest='eq_poly', default=[3500], 
        help='Equalization Polynomial (used if automatic equalization is off). Default 3500')
    opts, args = p.parse_args(sys.argv[1:])

servers = args
fpgas = ['FPGA0','FPGA1','FPGA2','FPGA3']

bees = [corr.borph.BorphClient(s, opts.ctrl_port) for s in servers]
input_sel=0
use_sram_tvg=False
use_fft_tvg=False
arm_rst=False
sync_rst=False

print('Equalising IBOBs on '),
print(servers),
print(' on control port %i'%opts.ctrl_port)

if opts.init_eq:
    print '''Resetting all ibobs' %i channels' gains to %i...'''%(opts.n_chan,opts.eq_poly[0]),
    sys.stdout.flush()
    print check_special_result(special_all('init_eq', [opts.n_chan,opts.eq_poly[0]]))
else:

    # Calculate gain in IBOB to extrapolate back to 4b values
    #auto_gain = float(opts.acc_len * (opts.clk_per_sync / n_chan))
    #cross_gain = auto_gain / (2**(4+4*cross_shift))
    # Set a default equalization
    equalization = numpy.polyval(opts.eq_poly, range(0,opts.n_chan))
    apply_eq(range(0,opts.n_chan), equalization)
