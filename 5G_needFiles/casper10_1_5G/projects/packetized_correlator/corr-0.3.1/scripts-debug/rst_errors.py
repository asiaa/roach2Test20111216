#! /usr/bin/env python
"""Resets the cumulative error counters on the X engine."""
import corr, time, sys, numpy, os

def write_int_all(register,value):
    """Writes to register on all fpgas. Returns 'ok' or string outlining failure."""    
    for f,fpga in enumerate(fpgas):
        out = fpga.write_int(register,value)
        if out['status'] != ('SUCCESS'):
            return('''Failed to program %s:%s-%s''' %(servers[f],out['status'],out['data']))
    return('''ok''')

def write_all_ibobs(addr,data):
    failures=0
    for i in range(n_xaui_ports_per_fpga):
        if write_int_all('ibob_addr%i'%i,(2**32)-1)!='ok':
            failures+=1
        if write_int_all('ibob_data%i'%i,data)!='ok':
            failures+=1
        if write_int_all('ibob_addr%i'%i,addr)!='ok':
            failures+=1
    if failures == 0: return '''ok'''
    else: return '%i Failures!'%failures
def write_all_ibobs_ctrl(input_sel=0, use_sram_tvg=False, use_fft_tvg=False, arm_rst=False, sync_rst=False, fft_shift=1023):
    """Writes a value to the ibob control registers connected to all BEEs."""
    value = input_sel<<20 | use_sram_tvg<<19 | use_fft_tvg<<18 | arm_rst<<17 | sync_rst<<16 | fft_shift
    return write_all_ibobs(addr=8192,data=value)


def arm():
    rv=write_all_ibobs_ctrl(arm_rst=False)
    if rv != 'ok': return rv
    return write_all_ibobs_ctrl(arm_rst=True)


def rst_cnt():
    """Resets all error counters"""
    rv = write_int_all('tvg_sel', 1 << 8)
    if rv != 'ok': return rv
    time.sleep(1)
    return write_int_all('tvg_sel', 0)



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

print('Using servers: '),
print(servers)

print('\nResetting error counters...'),
sys.stdout.flush()
print rst_cnt()
