#!/usr/bin/env python

import corr.borph, time, numpy, pylab

#defaults that will be used if not executed from the command line
servers = ['beesweet']
ctrl_port = 9999
fpgas = ['FPGA0','FPGA1','FPGA2','FPGA3']

ins_counter_sel = 0 #optionally insert a counter
inj_vector_sel = 1 #optionally inject a vector
valid_sel = 1 #select synthetic valid pulses
data_sel = 1 #select TVG dataset
num_valids = 8192*18432
num_per_group = 72
group_period = 1024
inject_vector_location = 1
inject_vector_value = 1
x_per_fpga = 2

if __name__ == '__main__':
    import sys
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('cn_rx.py [options]')
    p.set_description(__doc__)
    p.add_option('-v', '--num_valids', dest='num_valids', type='int', default=18432*8192,
        help='Number of valid pulses to send to DRAM.  Default 18432*8192')
    p.add_option('-g', '--num_per_group', dest='num_per_group', type='int', default=72,
        help='Number of valid pulses in a window or group.  Default 72')
    p.add_option('-p', '--group_period', dest='group_period', type='int', default=1024,
        help='Number of clocks per window, or group.  Default 1024')
    p.add_option('-l', '--inject_vector location', dest='inject_vector_location', type='int', default=1,
        help='Position of injected vector.  Default 1')
    p.add_option('-a', '--inject_vector_value', dest='inject_vector_value', type='int', default=1,
        help='Inject vector pulse amplitude.  Default 1')
    p.add_option('-x', '--x_per_fpga', dest='x_per_fpga', type='int', default=2,
        help='Number of X engine chains (and hence DRAM TVGs) on each FPGA.  Default 2')
    p.add_option('-c', '--counter', dest='ins_counter_sel', type='int', default=0,
        help='Optionally insert a counter in the lower 32 bits. 0=off, 1=insert. Default=0 (OFF)')
    p.add_option('-i', '--inj_vector', dest='inj_vector_sel', type='int', default=1,
        help='Optionally inject a vector. Default 1 (ON)')
    p.add_option('-s', '--valid_sel', dest='valid_sel', type='int', default=1,
        help='Select source of valid pulses 0=external (x engine), 1=TVG. Default 1 (TVG)')
    p.add_option('-d', '--data_sel', dest='data_sel', type='int', default=1,
        help='''Select source of data 0=external (x engine), 1=TVG. If using internal (TVG) as valid source, don't select external data source as it will be misaligned. Default 1 (TVG)''')
    
    opts, args = p.parse_args(sys.argv[1:])
    servers = args

    
    ins_counter_sel = opts.ins_counter_sel
    inj_vector_sel = opts.inj_vector_sel
    valid_sel = opts.valid_sel
    data_sel = opts.data_sel
    num_valids = opts.num_valids
    num_per_group = opts.num_per_group
    group_period = opts.group_period
    inject_vector_location = opts.inject_vector_location
    inject_vector_value = opts.inject_vector_value
    x_per_fpga = opts.x_per_fpga

bees = [corr.borph.BorphClient(s, ctrl_port) for s in servers]

for server,b in enumerate(bees):
    print '==================\n'
    print 'PROGRAMMING SERVER %s'%servers[server]
    print '------------------'
    print'Selecting dram tvg: ',b.write('tvg_sel',(data_sel<<10)+(valid_sel<<11)+(inj_vector_sel<<12)+(ins_counter_sel<<13)).values()[0]['data']

    for x in range(x_per_fpga):
        print 'X ENG %i...\nSetting constants'%(x+1)
        b.write('dram_tvg%i_write1'%(x+1),0) # P0,P2r              MSB  96-127
        b.write('dram_tvg%i_write2'%(x+1),0) # P0,P2i                   64- 95
        b.write('dram_tvg%i_write3'%(x+1),0) # P1,P3r                   32- 63
        b.write('dram_tvg%i_write4'%(x+1),0) # P1,P3i              LSB  0 - 31
    
    
        print 'setting number of vectors %i: '%num_valids,b.write('dram_tvg%i_num_pulses'%(x+1),num_valids).values()[0]['data']
        print 'num_per group %i: '%num_per_group,b.write('dram_tvg%i_num_per_group'%(x+1),num_per_group).values()[0]['data']
        print 'group period %i: '%group_period,b.write('dram_tvg%i_group_period'%(x+1),group_period).values()[0]['data']
    
        if inj_vector_sel==1:
            print 'Configuring injector...'
            print 'inject vector location %i: '%inject_vector_location,b.write('dram_tvg%i_inject_vector_location'%(x+1),inject_vector_location).values()[0]['data']
            print 'inject vector value %i: '%inject_vector_value,b.write('dram_tvg%i_inject_vector_value'%(x+1),inject_vector_value).values()[0]['data']
    
        if ins_counter_sel==1:
            print 'Counter will be inserted into lower 32 bits'
        print('----------')

    print 'Sending new_acc...',b.write('tvg_sel',(data_sel<<10)+(valid_sel<<11)+(inj_vector_sel<<12)+(ins_counter_sel<<13)+(1<<14)).values()[0]['data']
#    print 'Sending New_acc and starting accumulation...',b.write('tvg_sel',(data_sel<<10)+(valid_sel<<11)+(inj_vector_sel<<12)+(ins_counter_sel<<13)+(1<<9)+(1<<14)).values()[0]['data']
    print 'Starting accumulation...',b.write('tvg_sel',(data_sel<<10)+(valid_sel<<11)+(inj_vector_sel<<12)+(ins_counter_sel<<13)+(1<<9)).values()[0]['data']
    print '==================\n'
    
time.sleep(17)

print 'Done. '
