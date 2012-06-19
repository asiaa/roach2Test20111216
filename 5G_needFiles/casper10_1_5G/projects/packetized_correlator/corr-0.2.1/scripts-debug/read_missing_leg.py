#! /usr/bin/env python
import corr.borph, time, sys

['FPGA', 'PATH', 'base_ant', 'gbe', 'gbe_ip', 'gbe_port', 'gbe_rx_cnt', 'ibob_ctrl', 'ibob_eq_coeff', 'loopback_status', 'mux_pkts_mcnt', 'mux_pkts_snap_addr', 'mux_pkts_snap_bram', 'mux_pkts_snap_ctrl', 'mux_pkts_state', 'n_ants', 'rx_cnt', 'snap_cnt_addr', 'snap_cnt_bram', 'snap_cnt_ctrl', 'snap_gbe_addr', 'snap_gbe_bram', 'snap_gbe_ctrl', 'snap_loop_addr', 'snap_loop_bram', 'snap_loop_ctrl', 'snap_x1_addr', 'snap_x1_bram', 'snap_x1_ctrl', 'snap_x2_addr', 'snap_x2_bram', 'snap_x2_ctrl', 'tvg_sel', 'tx_cnt', 'tx_discard', 'x1_miss', 'x2_miss']


servers = sys.argv[1:]
if not servers:
    print 'Please specify a BEE. Usage read_missing.py [servers]'
    exit()
fpgas = ['FPGA0', 'FPGA1', 'FPGA2', 'FPGA3']
port = 9999

start_t = time.time()
while True:
    sum_pkts = 0
    sum_xaui = 0
    print 'Time:', time.time() - start_t
    for s in servers:
        print s
        b = corr.borph.BorphClient(s, port)
        for f in fpgas:
            print '  ', f
            x1_miss = b.read('x1_miss')[f]['data'] / 128.
            x2_miss = b.read('x2_miss')[f]['data'] / 128.
            xaui_errors = b.read('xaui_errors')[f]['data']
            mcnt = b.read('mux_pkts_mcnt')[f]['data']
            tx_cnt = b.read('tx_cnt')[f]['data']
            rx_cnt = b.read('rx_cnt')[f]['data']
            gbe_rx_cnt = b.read('gbe_rx_cnt')[f]['data']
            print '    ', 'x1:', x1_miss
            print '    ', 'x2:', x2_miss
            print '    ', 'XAUI:',xaui_errors
            print '    ', 'mcnt:', hex(mcnt)
            print '    ', 'tx_cnt:', tx_cnt
            print '    ', 'rx_cnt:', rx_cnt, 'gbe_rx_cnt:', gbe_rx_cnt
            sum_pkts += x1_miss + x2_miss
            #sum_xaui += xaui_errors
    print 'Total dropped packets:', sum_pkts
    print 'Total dropped XAUI words:',sum_xaui
    print ''
    time.sleep(5)
