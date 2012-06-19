//-----------------------------------------------------------------------------
// r4_5g_specv5_adc_5g_wrapper.v
//-----------------------------------------------------------------------------

module r4_5g_specv5_adc_5g_wrapper
  (
    adc_clk_p,
    adc_clk_n,
    adc_sync_p,
    adc_sync_n,
    adc_overrange_p,
    adc_overrange_n,
    adc_di_d_p,
    adc_di_d_n,
    adc_di_p,
    adc_di_n,
    adc_dq_d_p,
    adc_dq_d_n,
    adc_dq_p,
    adc_dq_n,
    user_datai0,
    user_datai1,
    user_datai2,
    user_datai3,
    user_dataq0,
    user_dataq1,
    user_dataq2,
    user_dataq3,
    user_outofrange0,
    user_outofrange1,
    user_sync0,
    user_sync1,
    user_sync2,
    user_sync3,
    user_data_valid,
    dcm_reset,
    ctrl_reset,
    ctrl_clk_in,
    ctrl_clk_out,
    ctrl_clk90_out,
    ctrl_clk180_out,
    ctrl_clk270_out,
    ctrl_dcm_locked,
    dcm_psclk,
    dcm_psen,
    dcm_psincdec,
    dcm_psdone
  );
  input adc_clk_p;
  input adc_clk_n;
  input adc_sync_p;
  input adc_sync_n;
  input adc_overrange_p;
  input adc_overrange_n;
  input [7:0] adc_di_d_p;
  input [7:0] adc_di_d_n;
  input [7:0] adc_di_p;
  input [7:0] adc_di_n;
  input [7:0] adc_dq_d_p;
  input [7:0] adc_dq_d_n;
  input [7:0] adc_dq_p;
  input [7:0] adc_dq_n;
  output [7:0] user_datai0;
  output [7:0] user_datai1;
  output [7:0] user_datai2;
  output [7:0] user_datai3;
  output [7:0] user_dataq0;
  output [7:0] user_dataq1;
  output [7:0] user_dataq2;
  output [7:0] user_dataq3;
  output user_outofrange0;
  output user_outofrange1;
  output user_sync0;
  output user_sync1;
  output user_sync2;
  output user_sync3;
  output user_data_valid;
  input dcm_reset;
  input ctrl_reset;
  input ctrl_clk_in;
  output ctrl_clk_out;
  output ctrl_clk90_out;
  output ctrl_clk180_out;
  output ctrl_clk270_out;
  output ctrl_dcm_locked;
  input dcm_psclk;
  input dcm_psen;
  input dcm_psincdec;
  output dcm_psdone;

  adc_5g_interface
    r4_5g_specV5_adc_5g (
      .adc_clk_p ( adc_clk_p ),
      .adc_clk_n ( adc_clk_n ),
      .adc_sync_p ( adc_sync_p ),
      .adc_sync_n ( adc_sync_n ),
      .adc_overrange_p ( adc_overrange_p ),
      .adc_overrange_n ( adc_overrange_n ),
      .adc_di_d_p ( adc_di_d_p ),
      .adc_di_d_n ( adc_di_d_n ),
      .adc_di_p ( adc_di_p ),
      .adc_di_n ( adc_di_n ),
      .adc_dq_d_p ( adc_dq_d_p ),
      .adc_dq_d_n ( adc_dq_d_n ),
      .adc_dq_p ( adc_dq_p ),
      .adc_dq_n ( adc_dq_n ),
      .user_datai0 ( user_datai0 ),
      .user_datai1 ( user_datai1 ),
      .user_datai2 ( user_datai2 ),
      .user_datai3 ( user_datai3 ),
      .user_dataq0 ( user_dataq0 ),
      .user_dataq1 ( user_dataq1 ),
      .user_dataq2 ( user_dataq2 ),
      .user_dataq3 ( user_dataq3 ),
      .user_outofrange0 ( user_outofrange0 ),
      .user_outofrange1 ( user_outofrange1 ),
      .user_sync0 ( user_sync0 ),
      .user_sync1 ( user_sync1 ),
      .user_sync2 ( user_sync2 ),
      .user_sync3 ( user_sync3 ),
      .user_data_valid ( user_data_valid ),
      .dcm_reset ( dcm_reset ),
      .ctrl_reset ( ctrl_reset ),
      .ctrl_clk_in ( ctrl_clk_in ),
      .ctrl_clk_out ( ctrl_clk_out ),
      .ctrl_clk90_out ( ctrl_clk90_out ),
      .ctrl_clk180_out ( ctrl_clk180_out ),
      .ctrl_clk270_out ( ctrl_clk270_out ),
      .ctrl_dcm_locked ( ctrl_dcm_locked ),
      .dcm_psclk ( dcm_psclk ),
      .dcm_psen ( dcm_psen ),
      .dcm_psincdec ( dcm_psincdec ),
      .dcm_psdone ( dcm_psdone )
    );

endmodule

// synthesis attribute x_core_info of r4_5g_specv5_adc_5g_wrapper is adc_5g_interface_v1_00_a;

