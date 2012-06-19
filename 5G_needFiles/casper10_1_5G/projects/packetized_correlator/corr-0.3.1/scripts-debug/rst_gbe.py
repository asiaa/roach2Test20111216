#! /usr/bin/env python
"""
Resets the 10GbE core.
Good for revisions 310 and upwards.
"""
import corr, time, sys, numpy, os

def write_int_all(register,value):
    """Writes to register on all fpgas. 
    Returns 'ok' or string outlining failure."""
    for f,fpga in enumerate(fpgas):
        out = fpga.write_int(register,value)
        if out['status'] != ('SUCCESS'):
            return('''Failed to program %s:%s-%s''' %(servers[f],out['status'],out['data']))
    return('''ok''')

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('rst_gbe.py CONFIG_FILE')
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

print('\nResetting all GbE cores...'),
write_int_all('tvg_sel', 1<<15)
print write_int_all('tvg_sel', 0)
