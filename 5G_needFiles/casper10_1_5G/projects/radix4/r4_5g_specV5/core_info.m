% r4_5g_specV5/XSG core config
r4_5g_specV5_XSG_core_config_type         = 'xps_xsg';
r4_5g_specV5_XSG_core_config_param        = '';

% r4_5g_specV5/acc_cnt
r4_5g_specV5_acc_cnt_type         = 'xps_sw_reg';
r4_5g_specV5_acc_cnt_param        = 'out';
r4_5g_specV5_acc_cnt_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specV5_acc_cnt_addr_start   = hex2dec('01000000');
r4_5g_specV5_acc_cnt_addr_end     = hex2dec('010000FF');

% r4_5g_specV5/acc_len
r4_5g_specV5_acc_len_type         = 'xps_sw_reg';
r4_5g_specV5_acc_len_param        = 'in';
r4_5g_specV5_acc_len_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specV5_acc_len_addr_start   = hex2dec('01000100');
r4_5g_specV5_acc_len_addr_end     = hex2dec('010001FF');

% r4_5g_specV5/adc_5g
r4_5g_specV5_adc_5g_type         = 'xps_adc_5g';
r4_5g_specV5_adc_5g_param        = 'adc = adc0 / interleave = off';
r4_5g_specV5_adc_5g_ip_name      = 'adc_5g_interface';

% r4_5g_specV5/cnt_rst
r4_5g_specV5_cnt_rst_type         = 'xps_sw_reg';
r4_5g_specV5_cnt_rst_param        = 'in';
r4_5g_specV5_cnt_rst_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specV5_cnt_rst_addr_start   = hex2dec('01000200');
r4_5g_specV5_cnt_rst_addr_end     = hex2dec('010002FF');

% r4_5g_specV5/led0_sync
r4_5g_specV5_led0_sync_type         = 'xps_gpio';
r4_5g_specV5_led0_sync_param        = '';
r4_5g_specV5_led0_sync_ip_name      = 'gpio_simulink2ext';

% r4_5g_specV5/led1_new_acc
r4_5g_specV5_led1_new_acc_type         = 'xps_gpio';
r4_5g_specV5_led1_new_acc_param        = '';
r4_5g_specV5_led1_new_acc_ip_name      = 'gpio_simulink2ext';

% r4_5g_specV5/snap_adc/addr
r4_5g_specV5_snap_adc_addr_type         = 'xps_sw_reg';
r4_5g_specV5_snap_adc_addr_param        = 'out';
r4_5g_specV5_snap_adc_addr_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specV5_snap_adc_addr_addr_start   = hex2dec('01000300');
r4_5g_specV5_snap_adc_addr_addr_end     = hex2dec('010003FF');

% r4_5g_specV5/snap_adc/bram_lsb
r4_5g_specV5_snap_adc_bram_lsb_type         = 'xps_bram';
r4_5g_specV5_snap_adc_bram_lsb_param        = '8192';
r4_5g_specV5_snap_adc_bram_lsb_ip_name      = 'bram_if';
r4_5g_specV5_snap_adc_bram_lsb_addr_start   = hex2dec('01008000');
r4_5g_specV5_snap_adc_bram_lsb_addr_end     = hex2dec('0100FFFF');

% r4_5g_specV5/snap_adc/bram_msb
r4_5g_specV5_snap_adc_bram_msb_type         = 'xps_bram';
r4_5g_specV5_snap_adc_bram_msb_param        = '8192';
r4_5g_specV5_snap_adc_bram_msb_ip_name      = 'bram_if';
r4_5g_specV5_snap_adc_bram_msb_addr_start   = hex2dec('01010000');
r4_5g_specV5_snap_adc_bram_msb_addr_end     = hex2dec('01017FFF');

% r4_5g_specV5/snap_adc/ctrl
r4_5g_specV5_snap_adc_ctrl_type         = 'xps_sw_reg';
r4_5g_specV5_snap_adc_ctrl_param        = 'in';
r4_5g_specV5_snap_adc_ctrl_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specV5_snap_adc_ctrl_addr_start   = hex2dec('01018000');
r4_5g_specV5_snap_adc_ctrl_addr_end     = hex2dec('010180FF');

% r4_5g_specV5/snap_vacc0/addr
r4_5g_specV5_snap_vacc0_addr_type         = 'xps_sw_reg';
r4_5g_specV5_snap_vacc0_addr_param        = 'out';
r4_5g_specV5_snap_vacc0_addr_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specV5_snap_vacc0_addr_addr_start   = hex2dec('01018100');
r4_5g_specV5_snap_vacc0_addr_addr_end     = hex2dec('010181FF');

% r4_5g_specV5/snap_vacc0/bram
r4_5g_specV5_snap_vacc0_bram_type         = 'xps_bram';
r4_5g_specV5_snap_vacc0_bram_param        = '1024';
r4_5g_specV5_snap_vacc0_bram_ip_name      = 'bram_if';
r4_5g_specV5_snap_vacc0_bram_addr_start   = hex2dec('01019000');
r4_5g_specV5_snap_vacc0_bram_addr_end     = hex2dec('01019FFF');

% r4_5g_specV5/snap_vacc0/ctrl
r4_5g_specV5_snap_vacc0_ctrl_type         = 'xps_sw_reg';
r4_5g_specV5_snap_vacc0_ctrl_param        = 'in';
r4_5g_specV5_snap_vacc0_ctrl_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specV5_snap_vacc0_ctrl_addr_start   = hex2dec('0101A000');
r4_5g_specV5_snap_vacc0_ctrl_addr_end     = hex2dec('0101A0FF');

% r4_5g_specV5/snap_vacc1/addr
r4_5g_specV5_snap_vacc1_addr_type         = 'xps_sw_reg';
r4_5g_specV5_snap_vacc1_addr_param        = 'out';
r4_5g_specV5_snap_vacc1_addr_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specV5_snap_vacc1_addr_addr_start   = hex2dec('0101A100');
r4_5g_specV5_snap_vacc1_addr_addr_end     = hex2dec('0101A1FF');

% r4_5g_specV5/snap_vacc1/bram
r4_5g_specV5_snap_vacc1_bram_type         = 'xps_bram';
r4_5g_specV5_snap_vacc1_bram_param        = '1024';
r4_5g_specV5_snap_vacc1_bram_ip_name      = 'bram_if';
r4_5g_specV5_snap_vacc1_bram_addr_start   = hex2dec('0101B000');
r4_5g_specV5_snap_vacc1_bram_addr_end     = hex2dec('0101BFFF');

% r4_5g_specV5/snap_vacc1/ctrl
r4_5g_specV5_snap_vacc1_ctrl_type         = 'xps_sw_reg';
r4_5g_specV5_snap_vacc1_ctrl_param        = 'in';
r4_5g_specV5_snap_vacc1_ctrl_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specV5_snap_vacc1_ctrl_addr_start   = hex2dec('0101C000');
r4_5g_specV5_snap_vacc1_ctrl_addr_end     = hex2dec('0101C0FF');

% r4_5g_specV5/snap_vacc2/addr
r4_5g_specV5_snap_vacc2_addr_type         = 'xps_sw_reg';
r4_5g_specV5_snap_vacc2_addr_param        = 'out';
r4_5g_specV5_snap_vacc2_addr_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specV5_snap_vacc2_addr_addr_start   = hex2dec('0101C100');
r4_5g_specV5_snap_vacc2_addr_addr_end     = hex2dec('0101C1FF');

% r4_5g_specV5/snap_vacc2/bram
r4_5g_specV5_snap_vacc2_bram_type         = 'xps_bram';
r4_5g_specV5_snap_vacc2_bram_param        = '1024';
r4_5g_specV5_snap_vacc2_bram_ip_name      = 'bram_if';
r4_5g_specV5_snap_vacc2_bram_addr_start   = hex2dec('0101D000');
r4_5g_specV5_snap_vacc2_bram_addr_end     = hex2dec('0101DFFF');

% r4_5g_specV5/snap_vacc2/ctrl
r4_5g_specV5_snap_vacc2_ctrl_type         = 'xps_sw_reg';
r4_5g_specV5_snap_vacc2_ctrl_param        = 'in';
r4_5g_specV5_snap_vacc2_ctrl_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specV5_snap_vacc2_ctrl_addr_start   = hex2dec('0101E000');
r4_5g_specV5_snap_vacc2_ctrl_addr_end     = hex2dec('0101E0FF');

% r4_5g_specV5/snap_vacc3/addr
r4_5g_specV5_snap_vacc3_addr_type         = 'xps_sw_reg';
r4_5g_specV5_snap_vacc3_addr_param        = 'out';
r4_5g_specV5_snap_vacc3_addr_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specV5_snap_vacc3_addr_addr_start   = hex2dec('0101E100');
r4_5g_specV5_snap_vacc3_addr_addr_end     = hex2dec('0101E1FF');

% r4_5g_specV5/snap_vacc3/bram
r4_5g_specV5_snap_vacc3_bram_type         = 'xps_bram';
r4_5g_specV5_snap_vacc3_bram_param        = '1024';
r4_5g_specV5_snap_vacc3_bram_ip_name      = 'bram_if';
r4_5g_specV5_snap_vacc3_bram_addr_start   = hex2dec('0101F000');
r4_5g_specV5_snap_vacc3_bram_addr_end     = hex2dec('0101FFFF');

% r4_5g_specV5/snap_vacc3/ctrl
r4_5g_specV5_snap_vacc3_ctrl_type         = 'xps_sw_reg';
r4_5g_specV5_snap_vacc3_ctrl_param        = 'in';
r4_5g_specV5_snap_vacc3_ctrl_ip_name      = 'opb_register_ppc2simulink';
r4_5g_specV5_snap_vacc3_ctrl_addr_start   = hex2dec('01020000');
r4_5g_specV5_snap_vacc3_ctrl_addr_end     = hex2dec('010200FF');

% r4_5g_specV5/sync_cnt
r4_5g_specV5_sync_cnt_type         = 'xps_sw_reg';
r4_5g_specV5_sync_cnt_param        = 'out';
r4_5g_specV5_sync_cnt_ip_name      = 'opb_register_simulink2ppc';
r4_5g_specV5_sync_cnt_addr_start   = hex2dec('01020100');
r4_5g_specV5_sync_cnt_addr_end     = hex2dec('010201FF');

