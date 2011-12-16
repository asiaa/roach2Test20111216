% r2_5g_f01/XSG core config
r2_5g_f01_XSG_core_config_type         = 'xps_xsg';
r2_5g_f01_XSG_core_config_param        = '';

% r2_5g_f01/acc_len
r2_5g_f01_acc_len_type         = 'xps_sw_reg';
r2_5g_f01_acc_len_param        = 'in';
r2_5g_f01_acc_len_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_acc_len_addr_start   = hex2dec('01000000');
r2_5g_f01_acc_len_addr_end     = hex2dec('010000FF');

% r2_5g_f01/adc5g
r2_5g_f01_adc5g_type         = 'xps_adc5g';
r2_5g_f01_adc5g_param        = '';
r2_5g_f01_adc5g_ip_name      = 'adc5g_dmux1_interface';

% r2_5g_f01/cnt_rst
r2_5g_f01_cnt_rst_type         = 'xps_sw_reg';
r2_5g_f01_cnt_rst_param        = 'in';
r2_5g_f01_cnt_rst_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_cnt_rst_addr_start   = hex2dec('01000100');
r2_5g_f01_cnt_rst_addr_end     = hex2dec('010001FF');

% r2_5g_f01/snap_adc0/bram
r2_5g_f01_snap_adc0_bram_type         = 'xps_bram';
r2_5g_f01_snap_adc0_bram_param        = '16384';
r2_5g_f01_snap_adc0_bram_ip_name      = 'bram_if';
r2_5g_f01_snap_adc0_bram_addr_start   = hex2dec('01010000');
r2_5g_f01_snap_adc0_bram_addr_end     = hex2dec('0101FFFF');

% r2_5g_f01/snap_adc0/ctrl
r2_5g_f01_snap_adc0_ctrl_type         = 'xps_sw_reg';
r2_5g_f01_snap_adc0_ctrl_param        = 'in';
r2_5g_f01_snap_adc0_ctrl_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_snap_adc0_ctrl_addr_start   = hex2dec('01020000');
r2_5g_f01_snap_adc0_ctrl_addr_end     = hex2dec('010200FF');

% r2_5g_f01/snap_adc0/status
r2_5g_f01_snap_adc0_status_type         = 'xps_sw_reg';
r2_5g_f01_snap_adc0_status_param        = 'out';
r2_5g_f01_snap_adc0_status_ip_name      = 'opb_register_simulink2ppc';
r2_5g_f01_snap_adc0_status_addr_start   = hex2dec('01020100');
r2_5g_f01_snap_adc0_status_addr_end     = hex2dec('010201FF');

% r2_5g_f01/snap_vacc0/addr
r2_5g_f01_snap_vacc0_addr_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc0_addr_param        = 'out';
r2_5g_f01_snap_vacc0_addr_ip_name      = 'opb_register_simulink2ppc';
r2_5g_f01_snap_vacc0_addr_addr_start   = hex2dec('01020200');
r2_5g_f01_snap_vacc0_addr_addr_end     = hex2dec('010202FF');

% r2_5g_f01/snap_vacc0/bram
r2_5g_f01_snap_vacc0_bram_type         = 'xps_bram';
r2_5g_f01_snap_vacc0_bram_param        = '2048';
r2_5g_f01_snap_vacc0_bram_ip_name      = 'bram_if';
r2_5g_f01_snap_vacc0_bram_addr_start   = hex2dec('01022000');
r2_5g_f01_snap_vacc0_bram_addr_end     = hex2dec('01023FFF');

% r2_5g_f01/snap_vacc0/ctrl
r2_5g_f01_snap_vacc0_ctrl_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc0_ctrl_param        = 'in';
r2_5g_f01_snap_vacc0_ctrl_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_snap_vacc0_ctrl_addr_start   = hex2dec('01024000');
r2_5g_f01_snap_vacc0_ctrl_addr_end     = hex2dec('010240FF');

% r2_5g_f01/snap_vacc1/addr
r2_5g_f01_snap_vacc1_addr_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc1_addr_param        = 'out';
r2_5g_f01_snap_vacc1_addr_ip_name      = 'opb_register_simulink2ppc';
r2_5g_f01_snap_vacc1_addr_addr_start   = hex2dec('01024100');
r2_5g_f01_snap_vacc1_addr_addr_end     = hex2dec('010241FF');

% r2_5g_f01/snap_vacc1/bram
r2_5g_f01_snap_vacc1_bram_type         = 'xps_bram';
r2_5g_f01_snap_vacc1_bram_param        = '2048';
r2_5g_f01_snap_vacc1_bram_ip_name      = 'bram_if';
r2_5g_f01_snap_vacc1_bram_addr_start   = hex2dec('01026000');
r2_5g_f01_snap_vacc1_bram_addr_end     = hex2dec('01027FFF');

% r2_5g_f01/snap_vacc1/ctrl
r2_5g_f01_snap_vacc1_ctrl_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc1_ctrl_param        = 'in';
r2_5g_f01_snap_vacc1_ctrl_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_snap_vacc1_ctrl_addr_start   = hex2dec('01028000');
r2_5g_f01_snap_vacc1_ctrl_addr_end     = hex2dec('010280FF');

% r2_5g_f01/snap_vacc2/addr
r2_5g_f01_snap_vacc2_addr_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc2_addr_param        = 'out';
r2_5g_f01_snap_vacc2_addr_ip_name      = 'opb_register_simulink2ppc';
r2_5g_f01_snap_vacc2_addr_addr_start   = hex2dec('01028100');
r2_5g_f01_snap_vacc2_addr_addr_end     = hex2dec('010281FF');

% r2_5g_f01/snap_vacc2/bram
r2_5g_f01_snap_vacc2_bram_type         = 'xps_bram';
r2_5g_f01_snap_vacc2_bram_param        = '2048';
r2_5g_f01_snap_vacc2_bram_ip_name      = 'bram_if';
r2_5g_f01_snap_vacc2_bram_addr_start   = hex2dec('0102A000');
r2_5g_f01_snap_vacc2_bram_addr_end     = hex2dec('0102BFFF');

% r2_5g_f01/snap_vacc2/ctrl
r2_5g_f01_snap_vacc2_ctrl_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc2_ctrl_param        = 'in';
r2_5g_f01_snap_vacc2_ctrl_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_snap_vacc2_ctrl_addr_start   = hex2dec('0102C000');
r2_5g_f01_snap_vacc2_ctrl_addr_end     = hex2dec('0102C0FF');

% r2_5g_f01/snap_vacc3/addr
r2_5g_f01_snap_vacc3_addr_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc3_addr_param        = 'out';
r2_5g_f01_snap_vacc3_addr_ip_name      = 'opb_register_simulink2ppc';
r2_5g_f01_snap_vacc3_addr_addr_start   = hex2dec('0102C100');
r2_5g_f01_snap_vacc3_addr_addr_end     = hex2dec('0102C1FF');

% r2_5g_f01/snap_vacc3/bram
r2_5g_f01_snap_vacc3_bram_type         = 'xps_bram';
r2_5g_f01_snap_vacc3_bram_param        = '2048';
r2_5g_f01_snap_vacc3_bram_ip_name      = 'bram_if';
r2_5g_f01_snap_vacc3_bram_addr_start   = hex2dec('0102E000');
r2_5g_f01_snap_vacc3_bram_addr_end     = hex2dec('0102FFFF');

% r2_5g_f01/snap_vacc3/ctrl
r2_5g_f01_snap_vacc3_ctrl_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc3_ctrl_param        = 'in';
r2_5g_f01_snap_vacc3_ctrl_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_snap_vacc3_ctrl_addr_start   = hex2dec('01030000');
r2_5g_f01_snap_vacc3_ctrl_addr_end     = hex2dec('010300FF');

% r2_5g_f01/snap_vacc4/addr
r2_5g_f01_snap_vacc4_addr_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc4_addr_param        = 'out';
r2_5g_f01_snap_vacc4_addr_ip_name      = 'opb_register_simulink2ppc';
r2_5g_f01_snap_vacc4_addr_addr_start   = hex2dec('01030100');
r2_5g_f01_snap_vacc4_addr_addr_end     = hex2dec('010301FF');

% r2_5g_f01/snap_vacc4/bram
r2_5g_f01_snap_vacc4_bram_type         = 'xps_bram';
r2_5g_f01_snap_vacc4_bram_param        = '2048';
r2_5g_f01_snap_vacc4_bram_ip_name      = 'bram_if';
r2_5g_f01_snap_vacc4_bram_addr_start   = hex2dec('01032000');
r2_5g_f01_snap_vacc4_bram_addr_end     = hex2dec('01033FFF');

% r2_5g_f01/snap_vacc4/ctrl
r2_5g_f01_snap_vacc4_ctrl_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc4_ctrl_param        = 'in';
r2_5g_f01_snap_vacc4_ctrl_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_snap_vacc4_ctrl_addr_start   = hex2dec('01034000');
r2_5g_f01_snap_vacc4_ctrl_addr_end     = hex2dec('010340FF');

% r2_5g_f01/snap_vacc5/addr
r2_5g_f01_snap_vacc5_addr_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc5_addr_param        = 'out';
r2_5g_f01_snap_vacc5_addr_ip_name      = 'opb_register_simulink2ppc';
r2_5g_f01_snap_vacc5_addr_addr_start   = hex2dec('01034100');
r2_5g_f01_snap_vacc5_addr_addr_end     = hex2dec('010341FF');

% r2_5g_f01/snap_vacc5/bram
r2_5g_f01_snap_vacc5_bram_type         = 'xps_bram';
r2_5g_f01_snap_vacc5_bram_param        = '2048';
r2_5g_f01_snap_vacc5_bram_ip_name      = 'bram_if';
r2_5g_f01_snap_vacc5_bram_addr_start   = hex2dec('01036000');
r2_5g_f01_snap_vacc5_bram_addr_end     = hex2dec('01037FFF');

% r2_5g_f01/snap_vacc5/ctrl
r2_5g_f01_snap_vacc5_ctrl_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc5_ctrl_param        = 'in';
r2_5g_f01_snap_vacc5_ctrl_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_snap_vacc5_ctrl_addr_start   = hex2dec('01038000');
r2_5g_f01_snap_vacc5_ctrl_addr_end     = hex2dec('010380FF');

% r2_5g_f01/snap_vacc6/addr
r2_5g_f01_snap_vacc6_addr_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc6_addr_param        = 'out';
r2_5g_f01_snap_vacc6_addr_ip_name      = 'opb_register_simulink2ppc';
r2_5g_f01_snap_vacc6_addr_addr_start   = hex2dec('01038100');
r2_5g_f01_snap_vacc6_addr_addr_end     = hex2dec('010381FF');

% r2_5g_f01/snap_vacc6/bram
r2_5g_f01_snap_vacc6_bram_type         = 'xps_bram';
r2_5g_f01_snap_vacc6_bram_param        = '2048';
r2_5g_f01_snap_vacc6_bram_ip_name      = 'bram_if';
r2_5g_f01_snap_vacc6_bram_addr_start   = hex2dec('0103A000');
r2_5g_f01_snap_vacc6_bram_addr_end     = hex2dec('0103BFFF');

% r2_5g_f01/snap_vacc6/ctrl
r2_5g_f01_snap_vacc6_ctrl_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc6_ctrl_param        = 'in';
r2_5g_f01_snap_vacc6_ctrl_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_snap_vacc6_ctrl_addr_start   = hex2dec('0103C000');
r2_5g_f01_snap_vacc6_ctrl_addr_end     = hex2dec('0103C0FF');

% r2_5g_f01/snap_vacc7/addr
r2_5g_f01_snap_vacc7_addr_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc7_addr_param        = 'out';
r2_5g_f01_snap_vacc7_addr_ip_name      = 'opb_register_simulink2ppc';
r2_5g_f01_snap_vacc7_addr_addr_start   = hex2dec('0103C100');
r2_5g_f01_snap_vacc7_addr_addr_end     = hex2dec('0103C1FF');

% r2_5g_f01/snap_vacc7/bram
r2_5g_f01_snap_vacc7_bram_type         = 'xps_bram';
r2_5g_f01_snap_vacc7_bram_param        = '2048';
r2_5g_f01_snap_vacc7_bram_ip_name      = 'bram_if';
r2_5g_f01_snap_vacc7_bram_addr_start   = hex2dec('0103E000');
r2_5g_f01_snap_vacc7_bram_addr_end     = hex2dec('0103FFFF');

% r2_5g_f01/snap_vacc7/ctrl
r2_5g_f01_snap_vacc7_ctrl_type         = 'xps_sw_reg';
r2_5g_f01_snap_vacc7_ctrl_param        = 'in';
r2_5g_f01_snap_vacc7_ctrl_ip_name      = 'opb_register_ppc2simulink';
r2_5g_f01_snap_vacc7_ctrl_addr_start   = hex2dec('01040000');
r2_5g_f01_snap_vacc7_ctrl_addr_end     = hex2dec('010400FF');

