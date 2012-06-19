% r4_5g_specD5/XSG core config
r4_5g_specD5_XSG_core_config_type         = 'xps_xsg';
r4_5g_specD5_XSG_core_config_param        = '';

% r4_5g_specD5/acc_cnt
r4_5g_specD5_acc_cnt_type         = 'xps_sw_reg';
r4_5g_specD5_acc_cnt_param        = 'out';
r4_5g_specD5_acc_cnt_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specD5_acc_cnt_addr_start   = hex2dec('01000000');
r4_5g_specD5_acc_cnt_addr_end     = hex2dec('010000FF');

% r4_5g_specD5/acc_len
r4_5g_specD5_acc_len_type         = 'xps_sw_reg';
r4_5g_specD5_acc_len_param        = 'in';
r4_5g_specD5_acc_len_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specD5_acc_len_addr_start   = hex2dec('01000100');
r4_5g_specD5_acc_len_addr_end     = hex2dec('010001FF');

% r4_5g_specD5/adc_5G_dmux
r4_5g_specD5_adc_5G_dmux_type         = 'xps_adc_5g_dmux';
r4_5g_specD5_adc_5G_dmux_param        = 'adc = adc0 / interleave = off';
r4_5g_specD5_adc_5G_dmux_ip_name      = 'adc_5g_dmux_interface';

% r4_5g_specD5/cnt_rst
r4_5g_specD5_cnt_rst_type         = 'xps_sw_reg';
r4_5g_specD5_cnt_rst_param        = 'in';
r4_5g_specD5_cnt_rst_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specD5_cnt_rst_addr_start   = hex2dec('01000200');
r4_5g_specD5_cnt_rst_addr_end     = hex2dec('010002FF');

% r4_5g_specD5/led0_sync
r4_5g_specD5_led0_sync_type         = 'xps_gpio';
r4_5g_specD5_led0_sync_param        = '';
r4_5g_specD5_led0_sync_ip_name      = 'gpio_simulink2ext';

% r4_5g_specD5/led1_new_acc
r4_5g_specD5_led1_new_acc_type         = 'xps_gpio';
r4_5g_specD5_led1_new_acc_param        = '';
r4_5g_specD5_led1_new_acc_ip_name      = 'gpio_simulink2ext';

% r4_5g_specD5/snap_adc/addr
r4_5g_specD5_snap_adc_addr_type         = 'xps_sw_reg';
r4_5g_specD5_snap_adc_addr_param        = 'out';
r4_5g_specD5_snap_adc_addr_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specD5_snap_adc_addr_addr_start   = hex2dec('01000300');
r4_5g_specD5_snap_adc_addr_addr_end     = hex2dec('010003FF');

% r4_5g_specD5/snap_adc/bram
r4_5g_specD5_snap_adc_bram_type         = 'xps_bram';
r4_5g_specD5_snap_adc_bram_param        = '1024';
r4_5g_specD5_snap_adc_bram_ip_name      = 'bram_if';
r4_5g_specD5_snap_adc_bram_addr_start   = hex2dec('01001000');
r4_5g_specD5_snap_adc_bram_addr_end     = hex2dec('01001FFF');

% r4_5g_specD5/snap_adc/ctrl
r4_5g_specD5_snap_adc_ctrl_type         = 'xps_sw_reg';
r4_5g_specD5_snap_adc_ctrl_param        = 'in';
r4_5g_specD5_snap_adc_ctrl_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specD5_snap_adc_ctrl_addr_start   = hex2dec('01002000');
r4_5g_specD5_snap_adc_ctrl_addr_end     = hex2dec('010020FF');

% r4_5g_specD5/snap_vacc0/addr
r4_5g_specD5_snap_vacc0_addr_type         = 'xps_sw_reg';
r4_5g_specD5_snap_vacc0_addr_param        = 'out';
r4_5g_specD5_snap_vacc0_addr_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specD5_snap_vacc0_addr_addr_start   = hex2dec('01002100');
r4_5g_specD5_snap_vacc0_addr_addr_end     = hex2dec('010021FF');

% r4_5g_specD5/snap_vacc0/bram
r4_5g_specD5_snap_vacc0_bram_type         = 'xps_bram';
r4_5g_specD5_snap_vacc0_bram_param        = '1024';
r4_5g_specD5_snap_vacc0_bram_ip_name      = 'bram_if';
r4_5g_specD5_snap_vacc0_bram_addr_start   = hex2dec('01003000');
r4_5g_specD5_snap_vacc0_bram_addr_end     = hex2dec('01003FFF');

% r4_5g_specD5/snap_vacc0/ctrl
r4_5g_specD5_snap_vacc0_ctrl_type         = 'xps_sw_reg';
r4_5g_specD5_snap_vacc0_ctrl_param        = 'in';
r4_5g_specD5_snap_vacc0_ctrl_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specD5_snap_vacc0_ctrl_addr_start   = hex2dec('01004000');
r4_5g_specD5_snap_vacc0_ctrl_addr_end     = hex2dec('010040FF');

% r4_5g_specD5/snap_vacc1/addr
r4_5g_specD5_snap_vacc1_addr_type         = 'xps_sw_reg';
r4_5g_specD5_snap_vacc1_addr_param        = 'out';
r4_5g_specD5_snap_vacc1_addr_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specD5_snap_vacc1_addr_addr_start   = hex2dec('01004100');
r4_5g_specD5_snap_vacc1_addr_addr_end     = hex2dec('010041FF');

% r4_5g_specD5/snap_vacc1/bram
r4_5g_specD5_snap_vacc1_bram_type         = 'xps_bram';
r4_5g_specD5_snap_vacc1_bram_param        = '1024';
r4_5g_specD5_snap_vacc1_bram_ip_name      = 'bram_if';
r4_5g_specD5_snap_vacc1_bram_addr_start   = hex2dec('01005000');
r4_5g_specD5_snap_vacc1_bram_addr_end     = hex2dec('01005FFF');

% r4_5g_specD5/snap_vacc1/ctrl
r4_5g_specD5_snap_vacc1_ctrl_type         = 'xps_sw_reg';
r4_5g_specD5_snap_vacc1_ctrl_param        = 'in';
r4_5g_specD5_snap_vacc1_ctrl_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specD5_snap_vacc1_ctrl_addr_start   = hex2dec('01006000');
r4_5g_specD5_snap_vacc1_ctrl_addr_end     = hex2dec('010060FF');

% r4_5g_specD5/snap_vacc2/addr
r4_5g_specD5_snap_vacc2_addr_type         = 'xps_sw_reg';
r4_5g_specD5_snap_vacc2_addr_param        = 'out';
r4_5g_specD5_snap_vacc2_addr_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specD5_snap_vacc2_addr_addr_start   = hex2dec('01006100');
r4_5g_specD5_snap_vacc2_addr_addr_end     = hex2dec('010061FF');

% r4_5g_specD5/snap_vacc2/bram
r4_5g_specD5_snap_vacc2_bram_type         = 'xps_bram';
r4_5g_specD5_snap_vacc2_bram_param        = '1024';
r4_5g_specD5_snap_vacc2_bram_ip_name      = 'bram_if';
r4_5g_specD5_snap_vacc2_bram_addr_start   = hex2dec('01007000');
r4_5g_specD5_snap_vacc2_bram_addr_end     = hex2dec('01007FFF');

% r4_5g_specD5/snap_vacc2/ctrl
r4_5g_specD5_snap_vacc2_ctrl_type         = 'xps_sw_reg';
r4_5g_specD5_snap_vacc2_ctrl_param        = 'in';
r4_5g_specD5_snap_vacc2_ctrl_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specD5_snap_vacc2_ctrl_addr_start   = hex2dec('01008000');
r4_5g_specD5_snap_vacc2_ctrl_addr_end     = hex2dec('010080FF');

% r4_5g_specD5/snap_vacc3/addr
r4_5g_specD5_snap_vacc3_addr_type         = 'xps_sw_reg';
r4_5g_specD5_snap_vacc3_addr_param        = 'out';
r4_5g_specD5_snap_vacc3_addr_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specD5_snap_vacc3_addr_addr_start   = hex2dec('01008100');
r4_5g_specD5_snap_vacc3_addr_addr_end     = hex2dec('010081FF');

% r4_5g_specD5/snap_vacc3/bram
r4_5g_specD5_snap_vacc3_bram_type         = 'xps_bram';
r4_5g_specD5_snap_vacc3_bram_param        = '1024';
r4_5g_specD5_snap_vacc3_bram_ip_name      = 'bram_if';
r4_5g_specD5_snap_vacc3_bram_addr_start   = hex2dec('01009000');
r4_5g_specD5_snap_vacc3_bram_addr_end     = hex2dec('01009FFF');

% r4_5g_specD5/snap_vacc3/ctrl
r4_5g_specD5_snap_vacc3_ctrl_type         = 'xps_sw_reg';
r4_5g_specD5_snap_vacc3_ctrl_param        = 'in';
r4_5g_specD5_snap_vacc3_ctrl_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specD5_snap_vacc3_ctrl_addr_start   = hex2dec('0100A000');
r4_5g_specD5_snap_vacc3_ctrl_addr_end     = hex2dec('0100A0FF');

% r4_5g_specD5/sync_cnt
r4_5g_specD5_sync_cnt_type         = 'xps_sw_reg';
r4_5g_specD5_sync_cnt_param        = 'out';
r4_5g_specD5_sync_cnt_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specD5_sync_cnt_addr_start   = hex2dec('0100A100');
r4_5g_specD5_sync_cnt_addr_end     = hex2dec('0100A1FF');

