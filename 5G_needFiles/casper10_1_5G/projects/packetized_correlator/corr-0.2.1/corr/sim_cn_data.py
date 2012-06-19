"""A module for generating simulation data for a casper_n correlator.  This
is used to verify the data-flow through the packetization and readout system.

Author: Aaron Parsons
Modified: Jason Manley
Date: 2007/10/29
Revisions:
1.1 added addr_decode and addr_encode functions

"""

import struct, packet, time, math

def xeng_encode(freq,n_xeng=8, n_chans=2048,adc_clk=600,ddc_decimation=4,ddc_mix_freq=0.25):
    bandwidth = adc_clk/ddc_decimation
    center_freq = adc_clk*ddc_mix_freq
    start_freq = center_freq - bandwidth/2
    im = freq - start_freq
    chan = int((float(im)/bandwidth * n_chans))
    out = dict()
    if (chan >= (n_chans/2)):
        chan = chan - (n_chans/2)
    else:
        chan = chan + (n_chans/2)
    out['chan'] = chan
    out['x_eng'] = int(chan % n_xeng)
    out['group'] = int(chan/n_xeng)
    return out

def xeng_decode(x_eng,chan,n_xeng=8, n_chans=2048,adc_clk=600,ddc_decimation=4,ddc_mix_freq=0.25):    
    bandwidth = float(adc_clk)/ddc_decimation
    chan_bw = bandwidth/n_chans
    print chan_bw
    center_freq = float(adc_clk)*ddc_mix_freq
    start_freq = center_freq - bandwidth/2
    freq_offset = x_eng * chan_bw
    freq = (chan*n_xeng)*chan_bw
    freq = freq + freq_offset
    if freq >= bandwidth/2:
        freq += start_freq
    else:
        freq += center_freq
    return freq

def addr_decode(address,vector_len=18432):
    if vector_len > 512:
        bit_shift = int(math.ceil(math.log(float(vector_len)/512.0,2)))
    else:
        bit_shift = 1
    #print bit_shift
    #address = (2**20) + (2**29) +(2**13)
    out = dict()
    out['bank'] = (address & ((2**28) + (2**29)))>>28
    out['row'] =  (address & (  ((2**28)-1) - ((2**14)-1)  ))>>14
    out['rank'] = (address & (2**13))>>13
    out['col'] = (address & (  ((2**13)-1) - ((2**3)-1)  ))>>3
    out['block'] = out['bank'] + ((out['row']>>bit_shift) <<2) + (out['rank']<<10)
    #print bank,row,rank,col,block
    return out

def addr_encode(int_num=0,offset=0,vector_len=18432):
    if vector_len > 512:
        bit_shift = int(math.ceil(math.log(float(vector_len)/512.0,2)))
    else:
        bit_shift = 1

    block_row_bits = 14-bit_shift

    bank = int_num & 3
    block_row = (int_num >> 2) & ((2**block_row_bits)-1) 
    rank = (int_num>>(block_row_bits + 2))

    column = offset & ((2**9)-1)
    row_offset = (offset >> 9)

    address = (column << 4) + (rank<<13) + (row_offset << 14) + (block_row<<(14 + bit_shift)) + (bank << 28)
    
    #print bank,bit_shift, block_row, block_row_bits, rank, column, row_offset
    return address


def ij2bl(i, j):
    """Convert i, j baseline notation (counting from 0) to Miriad's baseline
    notation (counting from 1, a 16 bit number)."""
    return ((i+1) << 8) | (j+1)

def bl2ij(bl):
    """Convert from Miriad's baseline notation (counting from 1, a 16 bit 
    number) to i, j baseline notation (counting from 0)."""
    return ((bl >> 8) & 255) - 1, (bl & 255) - 1

def encode_32bit(bl, stokes, r_i, chan):
    """Encode baseline, stokes, real/imaginary, and frequency info as 
    a 32 bit number."""
    return (r_i << 31) | (stokes << 29) | (chan << 16) | bl

def decode_32bit(data):
    """Decode baseline, stokes, real/imaginary, and frequency info from
    a 32 bit number."""
    bl = data & 16383
    freq = (data >> 16) & 8191
    stokes = (data >> 29) & 3
    r_i = (data >> 31) & 1
    return bl, stokes, r_i, freq

def get_bl_order(n_ants):
    """Return the order of baselines output by an x engine in the casper_n
    correlator.  Baselines are in Miriad notation."""
    order1, order2 = [], []
    for i in range(n_ants):
        for j in range(int(n_ants/2),-1,-1):
            k = (i-j) % n_ants
            if i >= k: order1.append((k, i))
            else: order2.append((i, k))
    order2 = [o for o in order2 if o not in order1]
    return [ij2bl(*o) for o in order1 + order2]

def sim_x_engine(x_num, n_ants, n_stokes, n_chans, endian='<'):
    """Generate data for an x engine in a casper_n correlator.  Each data
    sample is encoded with the baseline, stokes, real/imag, frequency
    that it represents."""
    data = []
    bls = get_bl_order(n_ants)
    # Loop through channels in X engine (spaced every n_ants channels)
    for coarse_chan in range(n_chans/n_ants):
        c = coarse_chan * n_ants + x_num
        # Loop through baseline order out of X engine
        for bl in bls:
            # Loop through stokes parameters
            for s in range(n_stokes):
                # Real and imaginary components
                for ri in (0, 1):
                    data.append(encode_32bit(bl, s, ri, c))
    fmt = '%s%dI' % (endian, len(data))
    return struct.pack(fmt, *data)

#class Sim_Bee_TX(packet.CasperN_TX_Socket):
#    """Emulate the transmission of a casper_n Bee2."""
#    def sim_tx(self, t, x_engines, n_ants, n_stokes, n_chans, vec_size=4096):
#        """Transmit simulated data for the listed 'x_engines', at the
#        specified 't'=time.
#        n_ants:     The number of antennas in the array being simulated
#        n_stokes:   The number of stokes parameters computed in the array
#        n_chans:    The number of spectral channels on each baseline
#        vec_size:   The number of results which are sent per packet """
#        for x in x_engines:
#            data = sim_x_engine(x, n_ants, n_stokes,
#                n_chans, endian=self.endian)
#            for i in range(len(data) / vec_size):
#                self.send_packet(t, x, i, 0, data[i*vec_size:(i+1)*vec_size])
#    def sim_tx_continuous(self, x_engines, n_xengines, n_stokes, n_chans,
#            vec_size=4096, int_len=8):
#        """Keep transmitting simulation data every 'int_len' seconds."""
#        while True:
#            t = time.time()
#            print t
#            self.sim_tx(t, x_engines, n_xengines, n_stokes, n_chans, 
#                vec_size=vec_size)
#            time.sleep(int_len - (time.time() - t))

if __name__ == '__main__':
    import sys
    from optparse import OptionParser
    
    p = OptionParser()
    p.set_usage('sim_cn_data.py [options] x_engine1 x_engine2 ...')
    p.set_description(__doc__)
    p.add_option('-i', '--ipaddr', dest='ip', default='225.0.0.1',
        help='The multicast group to listen to for data')
    p.add_option('-p', '--port', dest='port', default=9999, type='int',
        help='The port to listen to for UDP broadcast data.')
    p.add_option('-l', '--int_len', dest='int_len', default=8, type='int',
        help='Number of seconds between transmits.')
    p.add_option('-x', '--n_xengines', dest='n_xengines', default=16,type='int',
        help='The number of x_engines in the array.')
    p.add_option('-s', '--n_stokes', dest='n_stokes', default=4, type='int',
        help='The number of stokes parameters computed in x_engines.')
    p.add_option('-c', '--n_chans', dest='n_chans', default=2048, type='int',
        help='The number of channels per baseline.')
    p.add_option('-v', '--vec_size', dest='vec_size', default=4096, type='int',
        help='The number of results to tx per packet.')

    opts, args = p.parse_args(sys.argv[1:])
    args = map(int, args)
    sock = Sim_Bee_TX(opts.ip, opts.port)
    sock.sim_tx_continuous(args, opts.n_xengines, opts.n_stokes, opts.n_chans,
        vec_size=opts.vec_size, int_len=opts.int_len)
