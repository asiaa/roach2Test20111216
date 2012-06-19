#! /usr/bin/env python
"""Resets the 10GbE RX mux block in the X engine."""
import corr, time, sys, numpy, os

def write_int_all(register,value):
    """Writes to register on all fpgas. 
    Returns 'ok' or string outlining failure."""
    for f,fpga in enumerate(fpgas):
        out = fpga.write_int(register,value)
        if out['status'] != ('SUCCESS'):
            return('''Failed to program %s:%s-%s''' %(servers[f],out['status'],out['data']))
    return('''ok''')

def write_all_ibobs(addr,data):
    write_int_all('ibob_addr',(2**32)-1)
    write_int_all('ibob_data',data)
    return write_int_all('ibob_addr',addr)

def write_all_ibobs_ctrl(input_sel=0, use_sram_tvg=False, use_fft_tvg=False, arm_rst=False, sync_rst=False, fft_shift=1023):
    """Writes a value to the ibob control registers connected to all BEEs."""
    value = input_sel<<20 | use_sram_tvg<<19 | use_fft_tvg<<18 | arm_rst<<17 | sync_rst<<16 | fft_shift
    return write_all_ibobs(addr=8192,data=value)

def arm():
    write_all_ibobs_ctrl(arm_rst=False)    
    return write_all_ibobs_ctrl(arm_rst=True)

def rst_cnt():
    """Resets all error counters"""
    rv = write_int_all('tvg_sel', 1 << 8)
    time.sleep(1)
    write_int_all('tvg_sel', 0)
    return rv

def flush_loopback_mcnt():
    """Flush the mux_pkts buffers. Sometimes the block gets stuck waiting for some ridiculous mcnt value to be received from 10GbE. Bit 0 = register reset, bit 1 = loopback buffer flush. COMING SOON: hardware fix"""
    for x in range(min(n_xaui_ports_per_fpga,n_xeng_per_fpga)):
        rv = (write_int_all('loopback_mux%i_rst_mcnt_regs'%x, 7))
        if rv != 'ok': return rv
        time.sleep(1)
        rv = write_int_all('loopback_mux%i_rst_mcnt_regs'%x, 0)
        if rv != 'ok': return rv
    return rv


if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('rst_errors.py CONFIG_FILE')
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


servers = [s['server'] for s in config['servers']]
fpgas = [corr.udp_client.UDPClient(s['server'], s['port']) for s in config['servers']]

n_xeng_per_fpga = config['x_per_fpga']
n_xaui_ports_per_fpga= config['n_xaui_ports_per_fpga']
n_ants_per_xaui = config['n_ants_per_xaui']


print('Using servers: '),
print(servers)

print('\nFlushing loopback mux...'),
sys.stdout.flush()
print flush_loopback_mcnt()
