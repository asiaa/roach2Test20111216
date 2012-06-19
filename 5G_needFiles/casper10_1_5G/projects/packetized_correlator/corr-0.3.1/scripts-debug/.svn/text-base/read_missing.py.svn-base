#! /usr/bin/env python
"""
Reads the error counters on the correlator and reports accumulated XAUI and
packet errors.

Good as at X engine version 310.

"""
import corr, time, sys,struct

if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('read_missing.py [options] CONFIG_FILE')
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
n_xaui_ports_per_fpga=config['n_xaui_ports_per_fpga']

print('Using servers: '),
print(servers)

start_t = time.time()
#clear the screen:
print '%c[2J'%chr(27)

while True:
    sum_pkts = 0
    sum_xaui = 0
    x_miss=range(n_xeng_per_fpga)
    x_cnt=range(n_xeng_per_fpga)
    xaui_errors=range(n_xaui_ports_per_fpga)
    xaui_rx_cnt=range(n_xaui_ports_per_fpga)
    print 'Time:', time.time() - start_t
    # move cursor home
    print '%c[2J'%chr(27)
    for fpga,f in enumerate(fpgas):
        try: 
            print '  ', servers[fpga]

            for x in range(n_xaui_ports_per_fpga):
                xaui_errors[x]=(f.read_uint('xaui_err%i'%(x))['data'])
                xaui_rx_cnt[x]=(f.read_uint('xaui_cnt%i'%(x))['data'])
                gbe_tx_cnt = f.read_uint('gbe_tx_cnt%i'%(x))['data']
                gbe_tx_err = f.read_uint('gbe_tx_err_cnt%i'%(x))['data']

                print '\tXAUI%i         RX cnt: %10i    Errors: %10i'%(x,xaui_rx_cnt[x],xaui_errors[x])
                print '\t10GbE%i        TX cnt: %10i    Errors: %10i'%(x,gbe_tx_cnt,gbe_tx_err) 

            for x in range(min(n_xaui_ports_per_fpga,n_xeng_per_fpga)):
                rx_cnt = f.read_uint('rx_cnt%i'%(x))['data']
                gbe_rx_cnt = f.read_uint('gbe_rx_cnt%i'%x)['data']
                rx_err_cnt = f.read_uint('rx_err_cnt%i'%x)['data']
                mcnt = f.read_uint('loopback_mux%i_mcnt'%(x))['data']
                loopmcnt = mcnt/(2**16)
                gbemcnt = mcnt&((2**16)-1)
                print "\t10GbE%i        RX cnt: %10i"%(x,gbe_rx_cnt)
                print "\tLoopback_mux%i RX cnt: %10i    Errors: %10i"%(x,rx_cnt,rx_err_cnt)
                print '\tLoopback_mux%i mcnt: %6i'%(x,loopmcnt)
                print '\tGBE%i          mcnt: %6i'%(x,gbemcnt) 

            for x in range(n_xeng_per_fpga):
                #x_cnt[x]=(f.read_uint('spectr_cnt%i'%(x))['data'])
                x_cnt[x]=(f.read_uint('pkt_reord_cnt%i'%(x))['data'])
                #x_miss[x]=(f.read_uint('spectr_err%i'%(x))['data'] / 128.)
                x_miss[x]=(f.read_uint('pkt_reord_err%i'%(x))['data'] / 128.)
                print '\tX engine%i Spectr cnt: %10i    Errors: %10i'%(x,x_cnt[x],x_miss[x])

            sum_pkts += sum(x_miss)
            sum_xaui += sum(xaui_errors)

        except KeyboardInterrupt:
                exit()
        except: 
                print 'An error occured while extracting data from %s. '%(servers[fpga])#, sys.exc_info()[0]
                #raise
                time.sleep(1)
                continue

    print 'Total dropped packets:', sum_pkts
    print 'Total dropped XAUI words:',sum_xaui
    print ''
    time.sleep(2)
