#! /usr/bin/env python
""" Starts CASPER packetized correlators transmitting over 10GbE"""


import corr.udp_client, time, sys, corr.cn_conf


def ip2str(pkt_ip):
    ip_4 = (pkt_ip&((2**32)-(2**24)))>>24
    ip_3 = (pkt_ip&((2**24)-(2**16)))>>16
    ip_2 = (pkt_ip&((2**16)-(2**8)))>>8
    ip_1 = (pkt_ip&((2**8)-(2**0)))>>0
    #print 'IP:%i. decoded to: %i.%i.%i.%i'%(pkt_ip,ip_4,ip_3,ip_2,ip_1)
    return '%i.%i.%i.%i'%(ip_4,ip_3,ip_2,ip_1)


def write_int_all(register,value):
    """Writes to register on all fpgas. 
    Returns 'ok' or string outlining failure."""
    for f,fpga in enumerate(fpgas):
        out = fpga.write_int(register,value)
        if out['status'] != ('SUCCESS'):
            return('''Failed to program %s:%s-%s''' %(servers[f],out['status'],out['data']))
    return('''ok''')

def read_int_all(register):
    """Reads a value from register 'device' for all BEE FPGAs."""
    rv = [fpga.read_int(register) for fpga in fpgas]
    return rv



if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('start_tx.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-l', '--legacy_tx', dest='legacy_tx', action='store_true', default=False,
        help='Enable legacy mode UDP tx (through use of snap blocks connected to DRAM and BORPH readout')

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
n_xeng_per_fpga=config['x_per_fpga']
myip=ip2str(config['rx_udp_ip'])
myport=config['rx_udp_port']

print('Starting the following servers:')
print(servers)

fpgas = [corr.udp_client.UDPClient(server['server'],server['port']) for server in config['servers']]




if opts.legacy_tx:
    #we need to start cn_tx.py on the bee to read out the DRAMVACC
    print 'LEGACY MODE. Retrieving PIDs to start cn_tx on BEE2s...'
    pids=[]
    for f,fpga in enumerate(fpgas):
        pids.append(fpga.status())
        if pids[f]['status'] != 'SUCCESS':
            print 'Error retrieving process id for %s. %s:%s'%(servers[f],pids[f]['status'],pids[f]['data'])
            exit(1)
        if (f+1)%4 == 0:
            pids=[int(pid['data'].split('/')[2]) for pid in pids]
            print '[%s]:'%(servers[f]),pids
            execstr='cn_tx.py -i %s -k %i -x %i -l 4096 %i %i %i %i'%(myip,myport,n_xeng_per_fpga,pids[f-3],pids[f-2],pids[f-1],pids[f])
            print '''[%s]" Executing: '%s'...'''%(servers[f],execstr),
            #print 'Length of command string is %i'%len(execstr)
            print fpga.execute(execstr)['status']

else:
 print 'Starting...',write_int_all('gbe_tx_en',0)
