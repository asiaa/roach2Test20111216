#!/usr/bin/env python

import corr.borph, time, numpy, pylab

def write_int_all(register,value):
    """Writes to register on all fpgas. 
    Returns 'ok' or string outlining failure."""
    for f,fpga in enumerate(fpgas):
        out = fpga.write_int(register,value)
        if out['status'] != ('SUCCESS'):
            return('''Failed to program %s:%s-%s''' %(servers[f],out,out['data']))
    return('''ok''')

if __name__ == '__main__':
    import sys
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('dram_tvg_init.py [options] CONFIG_FILE')
    p.set_description(__doc__)
    p.add_option('-v', '--num_valids', dest='num_valids', type='int', default=18432*8192,
        help='Number of valid pulses to send to DRAM.  Default 18432*8192')
    p.add_option('-g', '--num_per_group', dest='num_per_group', type='int', default=72,
        help='Number of valid pulses in a window or group.  Default 72')
    p.add_option('-p', '--group_period', dest='group_period', type='int', default=1024,
        help='Number of clocks per window, or group.  Default 1024')

    p.add_option('-s', '--valid_sel', dest='valid_sel', type='int', default=1,
        help='Select source of valid pulses 0=external (x engine), 1=TVG. Default 1 (TVG)')
    p.add_option('-d', '--data_sel', dest='data_sel', type='int', default=1,
        help='''Select source of data 0=external (x engine), 1=TVG. If using internal (TVG) as valid source, don't select external data source as it will be misaligned. Default 1 (TVG)''')

    p.add_option('--inj_vect_amp', dest='inj_vect_amp', type='int', default=-1,
        help='Inject a vector at the input stream with this amplitude.')
    p.add_option('--inj_vect_loc', dest='inj_vect_loc', type='int', default=-1,
        help='Inject a vector at the input stream at this location.')


    p.add_option('-c', '--counter', dest='ins_counter_sel', action='store_true', default=False,
        help='Optionally insert a counter in the lower 32 bits.')
    
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

ins_counter_sel = int(opts.ins_counter_sel)
if opts.inj_vect_loc<0 or opts.inj_vect_amp<0: inj_vector_sel = 0
else: inj_vector_sel = 1
valid_sel = opts.valid_sel
data_sel = opts.data_sel
num_valids = opts.num_valids
num_per_group = opts.num_per_group
group_period = opts.group_period
x_per_fpga = config['x_per_fpga']
x_eng_clk = config['x_eng_clk']

print '\nENABLING DRAM TVG ONs %s'%servers
print '==================================='
print 'Selecting dram tvg... ',
print write_int_all('tvg_sel',(data_sel<<10)+(valid_sel<<11)+(inj_vector_sel<<12)+(ins_counter_sel<<13))
print('-------------------')
for x in range(x_per_fpga):
    print 'X ENG %i:'%(x+1)
    print '========='
    print 'Setting constants:'
    write_int_all('dram_tvg%i_write1'%(x+1),0) # P0,P2r              MSB  96-127
    write_int_all('dram_tvg%i_write2'%(x+1),0) # P0,P2i                   64- 95
    write_int_all('dram_tvg%i_write3'%(x+1),0) # P1,P3r                   32- 63
    write_int_all('dram_tvg%i_write4'%(x+1),0) # P1,P3i              LSB  0 - 31

    print 'setting number of vectors to %i...'%num_valids,write_int_all('dram_tvg%i_num_pulses'%(x+1),num_valids)
    print 'setting num_per_group to %i...'%num_per_group,write_int_all('dram_tvg%i_num_per_group'%(x+1),num_per_group)
    print 'setting group period to %i... '%group_period,write_int_all('dram_tvg%i_group_period'%(x+1),group_period)

    if inj_vector_sel > 0:
        print '\nConfiguring injector:'
        print 'setting inject vector location to %i...'%opts.inj_vect_loc,write_int_all('dram_tvg%i_inject_vector_location'%(x+1),opts.inj_vect_loc)
        print 'setting inject vector amplitude to %i...'%opts.inj_vect_amp,write_int_all('dram_tvg%i_inject_vector_value'%(x+1),opts.inj_vect_amp)

    if ins_counter_sel:
        print '\nCounter will be inserted into lower 32 bits'
    print('-------------------')


print 'Sending new_acc...',write_int_all('tvg_sel',(data_sel<<10)+(valid_sel<<11)+(inj_vector_sel<<12)+(ins_counter_sel<<13)+(1<<14))
print 'Starting accumulation...',write_int_all('tvg_sel',(data_sel<<10)+(valid_sel<<11)+(inj_vector_sel<<12)+(ins_counter_sel<<13)+(1<<9))

fill_time=num_valids*group_period/(float(x_eng_clk)*(10**6))/num_per_group
print 'Filling RAM (%2.0f seconds)...'%fill_time,
sys.stdout.flush()
time.sleep(fill_time+1)
print 'done'
print '===================================\n'
