library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/acc_cnt"

entity acc_cnt_entity_d7b3ec02c1 is
  port (
    reg_out: in std_logic_vector(31 downto 0); 
    convert_x0: out std_logic_vector(31 downto 0)
  );
end acc_cnt_entity_d7b3ec02c1;

architecture structural of acc_cnt_entity_d7b3ec02c1 is
  signal convert_dout_net_x0: std_logic_vector(31 downto 0);
  signal delay1_q_net_x0: std_logic_vector(31 downto 0);

begin
  delay1_q_net_x0 <= reg_out;
  convert_x0 <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => delay1_q_net_x0,
      dout => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/acc_cntrl/posedge1"

entity posedge1_entity_540938390c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end posedge1_entity_540938390c;

architecture structural of posedge1_entity_540938390c is
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal delay_q_net: std_logic;
  signal inverter_op_net: std_logic;
  signal logical_y_net_x0: std_logic;
  signal register_q_net_x0: std_logic;

begin
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  register_q_net_x0 <= in_x0;
  out_x0 <= logical_y_net_x0;

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d(0) => register_q_net_x0,
      en => '1',
      q(0) => delay_q_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip(0) => delay_q_net,
      op(0) => inverter_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => inverter_op_net,
      d1(0) => register_q_net_x0,
      y(0) => logical_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/acc_cntrl"

entity acc_cntrl_entity_48890c2acd is
  port (
    acc_len: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    new_acc: out std_logic
  );
end acc_cntrl_entity_48890c2acd;

architecture structural of acc_cntrl_entity_48890c2acd is
  signal ce_1_sg_x2: std_logic;
  signal clk_1_sg_x2: std_logic;
  signal cntr_op_net: std_logic_vector(31 downto 0);
  signal delay10_q_net_x0: std_logic;
  signal delay23_q_net_x0: std_logic_vector(31 downto 0);
  signal delay_q_net: std_logic_vector(31 downto 0);
  signal logical_y_net: std_logic;
  signal logical_y_net_x0: std_logic;
  signal logical_y_net_x2: std_logic;
  signal register_q_net_x0: std_logic;
  signal relational5_op_net_x0: std_logic;
  signal shift_op_net: std_logic_vector(31 downto 0);

begin
  delay23_q_net_x0 <= acc_len;
  ce_1_sg_x2 <= ce_1;
  clk_1_sg_x2 <= clk_1;
  delay10_q_net_x0 <= sync;
  new_acc <= logical_y_net_x2;

  cntr: entity work.counter_044fafc0c4
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      rst(0) => logical_y_net,
      op => cntr_op_net
    );

  delay: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      d => shift_op_net,
      q => delay_q_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net_x0,
      d1(0) => relational5_op_net_x0,
      y(0) => logical_y_net
    );

  posedge1_540938390c: entity work.posedge1_entity_540938390c
    port map (
      ce_1 => ce_1_sg_x2,
      clk_1 => clk_1_sg_x2,
      in_x0 => register_q_net_x0,
      out_x0 => logical_y_net_x0
    );

  posedge2_fea4697e1a: entity work.posedge1_entity_540938390c
    port map (
      ce_1 => ce_1_sg_x2,
      clk_1 => clk_1_sg_x2,
      in_x0 => relational5_op_net_x0,
      out_x0 => logical_y_net_x2
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      d(0) => delay10_q_net_x0,
      en(0) => delay10_q_net_x0,
      rst => "0",
      q(0) => register_q_net_x0
    );

  relational5: entity work.relational_8782e16b67
    port map (
      a => cntr_op_net,
      b => delay_q_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational5_op_net_x0
    );

  shift: entity work.shift_657b5342cc
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => delay23_q_net_x0,
      op => shift_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/adc/conv"

entity conv_entity_6a17fc5a2d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(7 downto 0); 
    out1: out std_logic_vector(7 downto 0)
  );
end conv_entity_6a17fc5a2d;

architecture structural of conv_entity_6a17fc5a2d is
  signal ce_1_sg_x3: std_logic;
  signal clk_1_sg_x3: std_logic;
  signal concat_y_net: std_logic_vector(7 downto 0);
  signal inverter_op_net: std_logic;
  signal r4_iadc_spec_adc_user_datai0_net_x0: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(7 downto 0);
  signal slice1_y_net: std_logic_vector(6 downto 0);
  signal slice_y_net: std_logic;

begin
  ce_1_sg_x3 <= ce_1;
  clk_1_sg_x3 <= clk_1;
  r4_iadc_spec_adc_user_datai0_net_x0 <= in1;
  out1 <= reinterpret_output_port_net_x0;

  concat: entity work.concat_83e473517e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => inverter_op_net,
      in1 => slice1_y_net,
      y => concat_y_net
    );

  inverter: entity work.inverter_e2b989a05e
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      clr => '0',
      ip(0) => slice_y_net,
      op(0) => inverter_op_net
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => concat_y_net,
      output_port => reinterpret_output_port_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 7,
      new_msb => 7,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_adc_user_datai0_net_x0,
      y(0) => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 6,
      x_width => 8,
      y_width => 7
    )
    port map (
      x => r4_iadc_spec_adc_user_datai0_net_x0,
      y => slice1_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/adc"

entity adc_entity_2c38a82c66 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    r4_iadc_spec_adc_user_datai0: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_datai1: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_datai2: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_datai3: in std_logic_vector(7 downto 0); 
    i0: out std_logic_vector(7 downto 0); 
    i1: out std_logic_vector(7 downto 0); 
    i2: out std_logic_vector(7 downto 0); 
    i3: out std_logic_vector(7 downto 0)
  );
end adc_entity_2c38a82c66;

architecture structural of adc_entity_2c38a82c66 is
  signal ce_1_sg_x7: std_logic;
  signal clk_1_sg_x7: std_logic;
  signal r4_iadc_spec_adc_user_datai0_net_x1: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_datai1_net_x1: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_datai2_net_x1: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_datai3_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x6: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x7: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x7 <= ce_1;
  clk_1_sg_x7 <= clk_1;
  r4_iadc_spec_adc_user_datai0_net_x1 <= r4_iadc_spec_adc_user_datai0;
  r4_iadc_spec_adc_user_datai1_net_x1 <= r4_iadc_spec_adc_user_datai1;
  r4_iadc_spec_adc_user_datai2_net_x1 <= r4_iadc_spec_adc_user_datai2;
  r4_iadc_spec_adc_user_datai3_net_x1 <= r4_iadc_spec_adc_user_datai3;
  i0 <= reinterpret_output_port_net_x4;
  i1 <= reinterpret_output_port_net_x5;
  i2 <= reinterpret_output_port_net_x6;
  i3 <= reinterpret_output_port_net_x7;

  conv1_3017916ccf: entity work.conv_entity_6a17fc5a2d
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      in1 => r4_iadc_spec_adc_user_datai1_net_x1,
      out1 => reinterpret_output_port_net_x5
    );

  conv2_a54d3cd439: entity work.conv_entity_6a17fc5a2d
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      in1 => r4_iadc_spec_adc_user_datai2_net_x1,
      out1 => reinterpret_output_port_net_x6
    );

  conv3_3e4fafc567: entity work.conv_entity_6a17fc5a2d
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      in1 => r4_iadc_spec_adc_user_datai3_net_x1,
      out1 => reinterpret_output_port_net_x7
    );

  conv_6a17fc5a2d: entity work.conv_entity_6a17fc5a2d
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      in1 => r4_iadc_spec_adc_user_datai0_net_x1,
      out1 => reinterpret_output_port_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_quantize/c_to_ri"

entity c_to_ri_entity_9cc0e62ce6 is
  port (
    c: in std_logic_vector(33 downto 0); 
    im: out std_logic_vector(16 downto 0); 
    re: out std_logic_vector(16 downto 0)
  );
end c_to_ri_entity_9cc0e62ce6;

architecture structural of c_to_ri_entity_9cc0e62ce6 is
  signal concat_y_net_x0: std_logic_vector(33 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(16 downto 0);
  signal slice_im_y_net: std_logic_vector(16 downto 0);
  signal slice_re_y_net: std_logic_vector(16 downto 0);

begin
  concat_y_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_ea71bb555c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_ea71bb555c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 16,
      x_width => 34,
      y_width => 17
    )
    port map (
      x => concat_y_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 17,
      new_msb => 33,
      x_width => 34,
      y_width => 17
    )
    port map (
      x => concat_y_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_quantize/ri_to_c"

entity ri_to_c_entity_d3f58c60ca is
  port (
    im: in std_logic_vector(8 downto 0); 
    re: in std_logic_vector(8 downto 0); 
    c: out std_logic_vector(17 downto 0)
  );
end ri_to_c_entity_d3f58c60ca;

architecture structural of ri_to_c_entity_d3f58c60ca is
  signal concat_y_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net: std_logic_vector(8 downto 0);
  signal force_re_output_port_net: std_logic_vector(8 downto 0);
  signal quantize_im_dout_net_x0: std_logic_vector(8 downto 0);
  signal quantize_re_dout_net_x0: std_logic_vector(8 downto 0);

begin
  quantize_im_dout_net_x0 <= im;
  quantize_re_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_f2f6490a28
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_de38ef9df5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => quantize_im_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_de38ef9df5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => quantize_re_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_quantize"

entity fir_quantize_entity_81904b561f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sum_in: in std_logic_vector(33 downto 0); 
    sum_out: out std_logic_vector(17 downto 0)
  );
end fir_quantize_entity_81904b561f;

architecture structural of fir_quantize_entity_81904b561f is
  signal ce_1_sg_x8: std_logic;
  signal clk_1_sg_x8: std_logic;
  signal concat_y_net_x2: std_logic_vector(33 downto 0);
  signal concat_y_net_x3: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(16 downto 0);
  signal quantize_im_dout_net_x0: std_logic_vector(8 downto 0);
  signal quantize_re_dout_net_x0: std_logic_vector(8 downto 0);

begin
  ce_1_sg_x8 <= ce_1;
  clk_1_sg_x8 <= clk_1;
  concat_y_net_x2 <= sum_in;
  sum_out <= concat_y_net_x3;

  c_to_ri_9cc0e62ce6: entity work.c_to_ri_entity_9cc0e62ce6
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  quantize_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 7,
      dout_width => 9,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      clr => '0',
      din => force_im_output_port_net_x0,
      dout => quantize_im_dout_net_x0
    );

  quantize_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 7,
      dout_width => 9,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      clr => '0',
      din => force_re_output_port_net_x0,
      dout => quantize_re_dout_net_x0
    );

  ri_to_c_d3f58c60ca: entity work.ri_to_c_entity_d3f58c60ca
    port map (
      im => quantize_im_dout_net_x0,
      re => quantize_re_dout_net_x0,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_1/fir_coef/c_gen"

entity c_gen_entity_814ccffc75 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_814ccffc75;

architecture structural of c_gen_entity_814ccffc75 is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x9: std_logic;
  signal clk_1_sg_x9: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay7_q_net_x0: std_logic;
  signal mem_data_net_x0: std_logic_vector(8 downto 0);

begin
  ce_1_sg_x9 <= ce_1;
  clk_1_sg_x9 <= clk_1;
  delay7_q_net_x0 <= sync_in;
  coef_out <= mem_data_net_x0;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 10,
      y_width => 10
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 1023,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_1ee993c8ed57b9ce",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      clr => '0',
      en => "1",
      rst(0) => delay7_q_net_x0,
      op => counter_op_net
    );

  mem: entity work.xlsprom
    generic map (
      c_address_width => 10,
      c_width => 9,
      core_name0 => "bmg_24_vx5_916edb207080a9d0",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_1/fir_coef"

entity fir_coef_entity_8668a3421a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_8668a3421a;

architecture structural of fir_coef_entity_8668a3421a is
  signal ce_1_sg_x10: std_logic;
  signal clk_1_sg_x10: std_logic;
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal delay7_q_net_x1: std_logic;
  signal delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x0: std_logic;

begin
  ce_1_sg_x10 <= ce_1;
  clk_1_sg_x10 <= clk_1;
  delay_q_net_x0 <= data_in;
  delay7_q_net_x1 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_814ccffc75: entity work.c_gen_entity_814ccffc75
    port map (
      ce_1 => ce_1_sg_x10,
      clk_1 => clk_1_sg_x10,
      sync_in => delay7_q_net_x1,
      coef_out => mem_data_net_x1
    );

  data_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x10,
      clk => clk_1_sg_x10,
      d => delay_q_net_x0,
      en => '1',
      q => data_delay_q_net_x0
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x10,
      clk => clk_1_sg_x10,
      d(0) => delay7_q_net_x1,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_1/fir_core/c_to_ri_d"

entity c_to_ri_d_entity_beaf200e16 is
  port (
    c: in std_logic_vector(7 downto 0); 
    im: out std_logic_vector(7 downto 0); 
    re: out std_logic_vector(7 downto 0)
  );
end c_to_ri_d_entity_beaf200e16;

architecture structural of c_to_ri_d_entity_beaf200e16 is
  signal data_delay_q_net_x1: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal slice_im_y_net: std_logic_vector(7 downto 0);
  signal slice_re_y_net: std_logic_vector(7 downto 0);

begin
  data_delay_q_net_x1 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 8,
      y_width => 8
    )
    port map (
      x => data_delay_q_net_x1,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 8,
      y_width => 8
    )
    port map (
      x => data_delay_q_net_x1,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_1/fir_core/mult_add_im"

entity mult_add_im_entity_971c6ec5b3 is
  port (
    a: in std_logic_vector(7 downto 0); 
    b: in std_logic_vector(8 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    out_x0: out std_logic_vector(16 downto 0)
  );
end mult_add_im_entity_971c6ec5b3;

architecture structural of mult_add_im_entity_971c6ec5b3 is
  signal ce_1_sg_x11: std_logic;
  signal clk_1_sg_x11: std_logic;
  signal force_im_output_port_net_x1: std_logic_vector(7 downto 0);
  signal mem_data_net_x2: std_logic_vector(8 downto 0);
  signal mult_p_net_x0: std_logic_vector(16 downto 0);

begin
  force_im_output_port_net_x1 <= a;
  mem_data_net_x2 <= b;
  ce_1_sg_x11 <= ce_1;
  clk_1_sg_x11 <= clk_1;
  out_x0 <= mult_p_net_x0;

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 8,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 8,
      c_output_width => 17,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_2f77ace24e40581e",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 15,
      p_width => 17,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x1,
      b => mem_data_net_x2,
      ce => ce_1_sg_x11,
      clk => clk_1_sg_x11,
      clr => '0',
      core_ce => ce_1_sg_x11,
      core_clk => clk_1_sg_x11,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_1/fir_core/ri_to_c"

entity ri_to_c_entity_ee8df92208 is
  port (
    im: in std_logic_vector(16 downto 0); 
    re: in std_logic_vector(16 downto 0); 
    c: out std_logic_vector(33 downto 0)
  );
end ri_to_c_entity_ee8df92208;

architecture structural of ri_to_c_entity_ee8df92208 is
  signal concat_y_net_x0: std_logic_vector(33 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(16 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(16 downto 0);
  signal force_im_output_port_net: std_logic_vector(16 downto 0);
  signal force_re_output_port_net: std_logic_vector(16 downto 0);

begin
  convert_im_dout_net_x0 <= im;
  convert_re_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_25b7e1d1f5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_573890e1c0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_im_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_573890e1c0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_re_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_1/fir_core/tap_delay"

entity tap_delay_entity_9e67ba768a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(7 downto 0); 
    out_x0: out std_logic_vector(7 downto 0)
  );
end tap_delay_entity_9e67ba768a;

architecture structural of tap_delay_entity_9e67ba768a is
  signal bram_data_out_net_x0: std_logic_vector(7 downto 0);
  signal ce_1_sg_x13: std_logic;
  signal clk_1_sg_x13: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal dout_delay_q_net_x0: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x13 <= ce_1;
  clk_1_sg_x13 <= clk_1;
  dout_delay_q_net_x0 <= in_x0;
  out_x0 <= bram_data_out_net_x0;

  bram: entity work.xlspram
    generic map (
      c_address_width => 10,
      c_width => 8,
      core_name0 => "bmg_24_vx5_b3a285035a3712ee",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x13,
      clk => clk_1_sg_x13,
      data_in => dout_delay_q_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant_op_net,
      data_out => bram_data_out_net_x0
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 1022,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_1ee993c8ed57b9ce",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x13,
      clk => clk_1_sg_x13,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_1/fir_core"

entity fir_core_entity_0a5df8185c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coef: in std_logic_vector(8 downto 0); 
    data_in: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_core_entity_0a5df8185c;

architecture structural of fir_core_entity_0a5df8185c is
  signal bram_data_out_net_x1: std_logic_vector(7 downto 0);
  signal ce_1_sg_x14: std_logic;
  signal clk_1_sg_x14: std_logic;
  signal concat_y_net_x1: std_logic_vector(33 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(16 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(16 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal dout_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal mult_p_net_x0: std_logic_vector(16 downto 0);
  signal mult_p_net_x1: std_logic_vector(16 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x2: std_logic;

begin
  ce_1_sg_x14 <= ce_1;
  clk_1_sg_x14 <= clk_1;
  mem_data_net_x4 <= coef;
  data_delay_q_net_x2 <= data_in;
  sync_delay_q_net_x1 <= sync_in;
  data_out <= bram_data_out_net_x1;
  sum_out <= concat_y_net_x1;
  sync_out <= sync_delay_q_net_x2;

  c_to_ri_d_beaf200e16: entity work.c_to_ri_d_entity_beaf200e16
    port map (
      c => data_delay_q_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  convert_im: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 15,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => mult_p_net_x0,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 15,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => mult_p_net_x1,
      dout => convert_re_dout_net_x0
    );

  dout_delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      d => data_delay_q_net_x2,
      en => '1',
      q => dout_delay_q_net_x0
    );

  mult_add_im_971c6ec5b3: entity work.mult_add_im_entity_971c6ec5b3
    port map (
      a => force_im_output_port_net_x1,
      b => mem_data_net_x4,
      ce_1 => ce_1_sg_x14,
      clk_1 => clk_1_sg_x14,
      out_x0 => mult_p_net_x0
    );

  mult_add_re_629ea0a26d: entity work.mult_add_im_entity_971c6ec5b3
    port map (
      a => force_re_output_port_net_x1,
      b => mem_data_net_x4,
      ce_1 => ce_1_sg_x14,
      clk_1 => clk_1_sg_x14,
      out_x0 => mult_p_net_x1
    );

  ri_to_c_ee8df92208: entity work.ri_to_c_entity_ee8df92208
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x1
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      d(0) => sync_delay_q_net_x1,
      en => '1',
      q(0) => sync_delay_q_net_x2
    );

  tap_delay_9e67ba768a: entity work.tap_delay_entity_9e67ba768a
    port map (
      ce_1 => ce_1_sg_x14,
      clk_1 => clk_1_sg_x14,
      in_x0 => dout_delay_q_net_x0,
      out_x0 => bram_data_out_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_1"

entity fir_tap_1_entity_92ad0c4088 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_1_entity_92ad0c4088;

architecture structural of fir_tap_1_entity_92ad0c4088 is
  signal bram_data_out_net_x2: std_logic_vector(7 downto 0);
  signal ce_1_sg_x15: std_logic;
  signal clk_1_sg_x15: std_logic;
  signal concat_y_net_x2: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal delay7_q_net_x2: std_logic;
  signal delay_q_net_x1: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  ce_1_sg_x15 <= ce_1;
  clk_1_sg_x15 <= clk_1;
  delay_q_net_x1 <= data_in;
  delay7_q_net_x2 <= sync_in;
  data_out <= bram_data_out_net_x2;
  sum_out <= concat_y_net_x2;
  sync_out <= sync_delay_q_net_x3;

  fir_coef_8668a3421a: entity work.fir_coef_entity_8668a3421a
    port map (
      ce_1 => ce_1_sg_x15,
      clk_1 => clk_1_sg_x15,
      data_in => delay_q_net_x1,
      sync_in => delay7_q_net_x2,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_0a5df8185c: entity work.fir_core_entity_0a5df8185c
    port map (
      ce_1 => ce_1_sg_x15,
      clk_1 => clk_1_sg_x15,
      coef => mem_data_net_x4,
      data_in => data_delay_q_net_x2,
      sync_in => sync_delay_q_net_x1,
      data_out => bram_data_out_net_x2,
      sum_out => concat_y_net_x2,
      sync_out => sync_delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_2/fir_coef/c_gen"

entity c_gen_entity_0c372febdf is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_0c372febdf;

architecture structural of c_gen_entity_0c372febdf is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x16: std_logic;
  signal clk_1_sg_x16: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mem_data_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x4: std_logic;

begin
  ce_1_sg_x16 <= ce_1;
  clk_1_sg_x16 <= clk_1;
  sync_delay_q_net_x4 <= sync_in;
  coef_out <= mem_data_net_x0;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 10,
      y_width => 10
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 1023,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_1ee993c8ed57b9ce",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x16,
      clk => clk_1_sg_x16,
      clr => '0',
      en => "1",
      rst(0) => sync_delay_q_net_x4,
      op => counter_op_net
    );

  mem: entity work.xlsprom
    generic map (
      c_address_width => 10,
      c_width => 9,
      core_name0 => "bmg_24_vx5_17f5cef47a567d97",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x16,
      clk => clk_1_sg_x16,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_2/fir_coef"

entity fir_coef_entity_279a82cb5a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_279a82cb5a;

architecture structural of fir_coef_entity_279a82cb5a is
  signal bram_data_out_net_x3: std_logic_vector(7 downto 0);
  signal ce_1_sg_x17: std_logic;
  signal clk_1_sg_x17: std_logic;
  signal concat_y_net_x3: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x5: std_logic;

begin
  ce_1_sg_x17 <= ce_1;
  clk_1_sg_x17 <= clk_1;
  bram_data_out_net_x3 <= data_in;
  concat_y_net_x3 <= sum_in;
  sync_delay_q_net_x5 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_0c372febdf: entity work.c_gen_entity_0c372febdf
    port map (
      ce_1 => ce_1_sg_x17,
      clk_1 => clk_1_sg_x17,
      sync_in => sync_delay_q_net_x5,
      coef_out => mem_data_net_x1
    );

  data_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      d => bram_data_out_net_x3,
      en => '1',
      q => data_delay_q_net_x0
    );

  sum_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      d => concat_y_net_x3,
      en => '1',
      q => sum_delay_q_net_x0
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      d(0) => sync_delay_q_net_x5,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_2/fir_core/mult_add_im"

entity mult_add_im_entity_6ff7c469f6 is
  port (
    a: in std_logic_vector(7 downto 0); 
    b: in std_logic_vector(8 downto 0); 
    c: in std_logic_vector(16 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    out_x0: out std_logic_vector(17 downto 0)
  );
end mult_add_im_entity_6ff7c469f6;

architecture structural of mult_add_im_entity_6ff7c469f6 is
  signal add_s_net_x0: std_logic_vector(17 downto 0);
  signal ce_1_sg_x18: std_logic;
  signal clk_1_sg_x18: std_logic;
  signal delay_q_net: std_logic_vector(16 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(16 downto 0);
  signal mem_data_net_x2: std_logic_vector(8 downto 0);
  signal mult_p_net: std_logic_vector(16 downto 0);

begin
  force_im_output_port_net_x2 <= a;
  mem_data_net_x2 <= b;
  force_im_output_port_net_x3 <= c;
  ce_1_sg_x18 <= ce_1;
  clk_1_sg_x18 <= clk_1;
  out_x0 <= add_s_net_x0;

  add: entity work.addsub_bfd97cd167
    port map (
      a => mult_p_net,
      b => delay_q_net,
      ce => ce_1_sg_x18,
      clk => clk_1_sg_x18,
      clr => '0',
      s => add_s_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 17
    )
    port map (
      ce => ce_1_sg_x18,
      clk => clk_1_sg_x18,
      d => force_im_output_port_net_x3,
      en => '1',
      q => delay_q_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 8,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 8,
      c_output_width => 17,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_2f77ace24e40581e",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 15,
      p_width => 17,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x2,
      b => mem_data_net_x2,
      ce => ce_1_sg_x18,
      clk => clk_1_sg_x18,
      clr => '0',
      core_ce => ce_1_sg_x18,
      core_clk => clk_1_sg_x18,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_2/fir_core"

entity fir_core_entity_cd043bfd46 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coef: in std_logic_vector(8 downto 0); 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_core_entity_cd043bfd46;

architecture structural of fir_core_entity_cd043bfd46 is
  signal add_s_net_x0: std_logic_vector(17 downto 0);
  signal add_s_net_x1: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x1: std_logic_vector(7 downto 0);
  signal ce_1_sg_x21: std_logic;
  signal clk_1_sg_x21: std_logic;
  signal concat_y_net_x1: std_logic_vector(33 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(16 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(16 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal dout_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(16 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x2: std_logic;

begin
  ce_1_sg_x21 <= ce_1;
  clk_1_sg_x21 <= clk_1;
  mem_data_net_x4 <= coef;
  data_delay_q_net_x2 <= data_in;
  sum_delay_q_net_x2 <= sum_in;
  sync_delay_q_net_x1 <= sync_in;
  data_out <= bram_data_out_net_x1;
  sum_out <= concat_y_net_x1;
  sync_out <= sync_delay_q_net_x2;

  c_to_ri_d_15258b8bdb: entity work.c_to_ri_d_entity_beaf200e16
    port map (
      c => data_delay_q_net_x2,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  c_to_ri_s_3eced4e735: entity work.c_to_ri_entity_9cc0e62ce6
    port map (
      c => sum_delay_q_net_x2,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  convert_im: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 15,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => add_s_net_x0,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 15,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => add_s_net_x1,
      dout => convert_re_dout_net_x0
    );

  dout_delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x21,
      clk => clk_1_sg_x21,
      d => data_delay_q_net_x2,
      en => '1',
      q => dout_delay_q_net_x0
    );

  mult_add_im_6ff7c469f6: entity work.mult_add_im_entity_6ff7c469f6
    port map (
      a => force_im_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_im_output_port_net_x3,
      ce_1 => ce_1_sg_x21,
      clk_1 => clk_1_sg_x21,
      out_x0 => add_s_net_x0
    );

  mult_add_re_3388d22dc6: entity work.mult_add_im_entity_6ff7c469f6
    port map (
      a => force_re_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_re_output_port_net_x3,
      ce_1 => ce_1_sg_x21,
      clk_1 => clk_1_sg_x21,
      out_x0 => add_s_net_x1
    );

  ri_to_c_22f55a5e1c: entity work.ri_to_c_entity_ee8df92208
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x1
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x21,
      clk => clk_1_sg_x21,
      d(0) => sync_delay_q_net_x1,
      en => '1',
      q(0) => sync_delay_q_net_x2
    );

  tap_delay_3e7641088b: entity work.tap_delay_entity_9e67ba768a
    port map (
      ce_1 => ce_1_sg_x21,
      clk_1 => clk_1_sg_x21,
      in_x0 => dout_delay_q_net_x0,
      out_x0 => bram_data_out_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_2"

entity fir_tap_2_entity_3d86da1238 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_2_entity_3d86da1238;

architecture structural of fir_tap_2_entity_3d86da1238 is
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(7 downto 0);
  signal ce_1_sg_x22: std_logic;
  signal clk_1_sg_x22: std_logic;
  signal concat_y_net_x4: std_logic_vector(33 downto 0);
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x6: std_logic;
  signal sync_delay_q_net_x7: std_logic;

begin
  ce_1_sg_x22 <= ce_1;
  clk_1_sg_x22 <= clk_1;
  bram_data_out_net_x4 <= data_in;
  concat_y_net_x4 <= sum_in;
  sync_delay_q_net_x6 <= sync_in;
  data_out <= bram_data_out_net_x5;
  sum_out <= concat_y_net_x5;
  sync_out <= sync_delay_q_net_x7;

  fir_coef_279a82cb5a: entity work.fir_coef_entity_279a82cb5a
    port map (
      ce_1 => ce_1_sg_x22,
      clk_1 => clk_1_sg_x22,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x4,
      sync_in => sync_delay_q_net_x6,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_cd043bfd46: entity work.fir_core_entity_cd043bfd46
    port map (
      ce_1 => ce_1_sg_x22,
      clk_1 => clk_1_sg_x22,
      coef => mem_data_net_x4,
      data_in => data_delay_q_net_x2,
      sum_in => sum_delay_q_net_x2,
      sync_in => sync_delay_q_net_x1,
      data_out => bram_data_out_net_x5,
      sum_out => concat_y_net_x5,
      sync_out => sync_delay_q_net_x7
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_3/fir_coef/c_gen"

entity c_gen_entity_1beac67e43 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_1beac67e43;

architecture structural of c_gen_entity_1beac67e43 is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x23: std_logic;
  signal clk_1_sg_x23: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mem_data_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x8: std_logic;

begin
  ce_1_sg_x23 <= ce_1;
  clk_1_sg_x23 <= clk_1;
  sync_delay_q_net_x8 <= sync_in;
  coef_out <= mem_data_net_x0;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 10,
      y_width => 10
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 1023,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_1ee993c8ed57b9ce",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x23,
      clk => clk_1_sg_x23,
      clr => '0',
      en => "1",
      rst(0) => sync_delay_q_net_x8,
      op => counter_op_net
    );

  mem: entity work.xlsprom
    generic map (
      c_address_width => 10,
      c_width => 9,
      core_name0 => "bmg_24_vx5_22468d6827fd0e85",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x23,
      clk => clk_1_sg_x23,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_3/fir_coef"

entity fir_coef_entity_7fb83a4178 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_7fb83a4178;

architecture structural of fir_coef_entity_7fb83a4178 is
  signal bram_data_out_net_x6: std_logic_vector(7 downto 0);
  signal ce_1_sg_x24: std_logic;
  signal clk_1_sg_x24: std_logic;
  signal concat_y_net_x6: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x9: std_logic;

begin
  ce_1_sg_x24 <= ce_1;
  clk_1_sg_x24 <= clk_1;
  bram_data_out_net_x6 <= data_in;
  concat_y_net_x6 <= sum_in;
  sync_delay_q_net_x9 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_1beac67e43: entity work.c_gen_entity_1beac67e43
    port map (
      ce_1 => ce_1_sg_x24,
      clk_1 => clk_1_sg_x24,
      sync_in => sync_delay_q_net_x9,
      coef_out => mem_data_net_x1
    );

  data_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x24,
      clk => clk_1_sg_x24,
      d => bram_data_out_net_x6,
      en => '1',
      q => data_delay_q_net_x0
    );

  sum_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x24,
      clk => clk_1_sg_x24,
      d => concat_y_net_x6,
      en => '1',
      q => sum_delay_q_net_x0
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x24,
      clk => clk_1_sg_x24,
      d(0) => sync_delay_q_net_x9,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_3"

entity fir_tap_3_entity_08103850b3 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_3_entity_08103850b3;

architecture structural of fir_tap_3_entity_08103850b3 is
  signal bram_data_out_net_x2: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(7 downto 0);
  signal ce_1_sg_x29: std_logic;
  signal clk_1_sg_x29: std_logic;
  signal concat_y_net_x2: std_logic_vector(33 downto 0);
  signal concat_y_net_x7: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x10: std_logic;
  signal sync_delay_q_net_x11: std_logic;

begin
  ce_1_sg_x29 <= ce_1;
  clk_1_sg_x29 <= clk_1;
  bram_data_out_net_x7 <= data_in;
  concat_y_net_x7 <= sum_in;
  sync_delay_q_net_x10 <= sync_in;
  data_out <= bram_data_out_net_x2;
  sum_out <= concat_y_net_x2;
  sync_out <= sync_delay_q_net_x11;

  fir_coef_7fb83a4178: entity work.fir_coef_entity_7fb83a4178
    port map (
      ce_1 => ce_1_sg_x29,
      clk_1 => clk_1_sg_x29,
      data_in => bram_data_out_net_x7,
      sum_in => concat_y_net_x7,
      sync_in => sync_delay_q_net_x10,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_ca3bb781c7: entity work.fir_core_entity_cd043bfd46
    port map (
      ce_1 => ce_1_sg_x29,
      clk_1 => clk_1_sg_x29,
      coef => mem_data_net_x4,
      data_in => data_delay_q_net_x2,
      sum_in => sum_delay_q_net_x2,
      sync_in => sync_delay_q_net_x1,
      data_out => bram_data_out_net_x2,
      sum_out => concat_y_net_x2,
      sync_out => sync_delay_q_net_x11
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_4/fir_coef/c_gen"

entity c_gen_entity_4bb41c0160 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_4bb41c0160;

architecture structural of c_gen_entity_4bb41c0160 is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x30: std_logic;
  signal clk_1_sg_x30: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mem_data_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x12: std_logic;

begin
  ce_1_sg_x30 <= ce_1;
  clk_1_sg_x30 <= clk_1;
  sync_delay_q_net_x12 <= sync_in;
  coef_out <= mem_data_net_x0;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 10,
      y_width => 10
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 1023,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_1ee993c8ed57b9ce",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x30,
      clk => clk_1_sg_x30,
      clr => '0',
      en => "1",
      rst(0) => sync_delay_q_net_x12,
      op => counter_op_net
    );

  mem: entity work.xlsprom
    generic map (
      c_address_width => 10,
      c_width => 9,
      core_name0 => "bmg_24_vx5_2c89c45c28fef7b6",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x30,
      clk => clk_1_sg_x30,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_4/fir_coef"

entity fir_coef_entity_b172db4c44 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_b172db4c44;

architecture structural of fir_coef_entity_b172db4c44 is
  signal bram_data_out_net_x3: std_logic_vector(7 downto 0);
  signal ce_1_sg_x31: std_logic;
  signal clk_1_sg_x31: std_logic;
  signal concat_y_net_x3: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x13: std_logic;

begin
  ce_1_sg_x31 <= ce_1;
  clk_1_sg_x31 <= clk_1;
  bram_data_out_net_x3 <= data_in;
  concat_y_net_x3 <= sum_in;
  sync_delay_q_net_x13 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_4bb41c0160: entity work.c_gen_entity_4bb41c0160
    port map (
      ce_1 => ce_1_sg_x31,
      clk_1 => clk_1_sg_x31,
      sync_in => sync_delay_q_net_x13,
      coef_out => mem_data_net_x1
    );

  data_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      d => bram_data_out_net_x3,
      en => '1',
      q => data_delay_q_net_x0
    );

  sum_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      d => concat_y_net_x3,
      en => '1',
      q => sum_delay_q_net_x0
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      d(0) => sync_delay_q_net_x13,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_4"

entity fir_tap_4_entity_3d4e2be445 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_4_entity_3d4e2be445;

architecture structural of fir_tap_4_entity_3d4e2be445 is
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(7 downto 0);
  signal ce_1_sg_x36: std_logic;
  signal clk_1_sg_x36: std_logic;
  signal concat_y_net_x4: std_logic_vector(33 downto 0);
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x14: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  ce_1_sg_x36 <= ce_1;
  clk_1_sg_x36 <= clk_1;
  bram_data_out_net_x4 <= data_in;
  concat_y_net_x4 <= sum_in;
  sync_delay_q_net_x14 <= sync_in;
  data_out <= bram_data_out_net_x5;
  sum_out <= concat_y_net_x5;
  sync_out <= sync_delay_q_net_x3;

  fir_coef_b172db4c44: entity work.fir_coef_entity_b172db4c44
    port map (
      ce_1 => ce_1_sg_x36,
      clk_1 => clk_1_sg_x36,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x4,
      sync_in => sync_delay_q_net_x14,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_c46988fe51: entity work.fir_core_entity_cd043bfd46
    port map (
      ce_1 => ce_1_sg_x36,
      clk_1 => clk_1_sg_x36,
      coef => mem_data_net_x4,
      data_in => data_delay_q_net_x2,
      sum_in => sum_delay_q_net_x2,
      sync_in => sync_delay_q_net_x1,
      data_out => bram_data_out_net_x5,
      sum_out => concat_y_net_x5,
      sync_out => sync_delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_5/fir_coef/c_gen"

entity c_gen_entity_01e0e4f438 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_01e0e4f438;

architecture structural of c_gen_entity_01e0e4f438 is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x37: std_logic;
  signal clk_1_sg_x37: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mem_data_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x4: std_logic;

begin
  ce_1_sg_x37 <= ce_1;
  clk_1_sg_x37 <= clk_1;
  sync_delay_q_net_x4 <= sync_in;
  coef_out <= mem_data_net_x0;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 10,
      y_width => 10
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 1023,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_1ee993c8ed57b9ce",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x37,
      clk => clk_1_sg_x37,
      clr => '0',
      en => "1",
      rst(0) => sync_delay_q_net_x4,
      op => counter_op_net
    );

  mem: entity work.xlsprom
    generic map (
      c_address_width => 10,
      c_width => 9,
      core_name0 => "bmg_24_vx5_7bc1e03f2e4955ca",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x37,
      clk => clk_1_sg_x37,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_5/fir_coef"

entity fir_coef_entity_673a8b0237 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_673a8b0237;

architecture structural of fir_coef_entity_673a8b0237 is
  signal bram_data_out_net_x6: std_logic_vector(7 downto 0);
  signal ce_1_sg_x38: std_logic;
  signal clk_1_sg_x38: std_logic;
  signal concat_y_net_x6: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x5: std_logic;

begin
  ce_1_sg_x38 <= ce_1;
  clk_1_sg_x38 <= clk_1;
  bram_data_out_net_x6 <= data_in;
  concat_y_net_x6 <= sum_in;
  sync_delay_q_net_x5 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_01e0e4f438: entity work.c_gen_entity_01e0e4f438
    port map (
      ce_1 => ce_1_sg_x38,
      clk_1 => clk_1_sg_x38,
      sync_in => sync_delay_q_net_x5,
      coef_out => mem_data_net_x1
    );

  data_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x38,
      clk => clk_1_sg_x38,
      d => bram_data_out_net_x6,
      en => '1',
      q => data_delay_q_net_x0
    );

  sum_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x38,
      clk => clk_1_sg_x38,
      d => concat_y_net_x6,
      en => '1',
      q => sum_delay_q_net_x0
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x38,
      clk => clk_1_sg_x38,
      d(0) => sync_delay_q_net_x5,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_5"

entity fir_tap_5_entity_6f4356a60e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_5_entity_6f4356a60e;

architecture structural of fir_tap_5_entity_6f4356a60e is
  signal bram_data_out_net_x2: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(7 downto 0);
  signal ce_1_sg_x43: std_logic;
  signal clk_1_sg_x43: std_logic;
  signal concat_y_net_x2: std_logic_vector(33 downto 0);
  signal concat_y_net_x7: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x6: std_logic;
  signal sync_delay_q_net_x7: std_logic;

begin
  ce_1_sg_x43 <= ce_1;
  clk_1_sg_x43 <= clk_1;
  bram_data_out_net_x7 <= data_in;
  concat_y_net_x7 <= sum_in;
  sync_delay_q_net_x6 <= sync_in;
  data_out <= bram_data_out_net_x2;
  sum_out <= concat_y_net_x2;
  sync_out <= sync_delay_q_net_x7;

  fir_coef_673a8b0237: entity work.fir_coef_entity_673a8b0237
    port map (
      ce_1 => ce_1_sg_x43,
      clk_1 => clk_1_sg_x43,
      data_in => bram_data_out_net_x7,
      sum_in => concat_y_net_x7,
      sync_in => sync_delay_q_net_x6,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_32ede7a64e: entity work.fir_core_entity_cd043bfd46
    port map (
      ce_1 => ce_1_sg_x43,
      clk_1 => clk_1_sg_x43,
      coef => mem_data_net_x4,
      data_in => data_delay_q_net_x2,
      sum_in => sum_delay_q_net_x2,
      sync_in => sync_delay_q_net_x1,
      data_out => bram_data_out_net_x2,
      sum_out => concat_y_net_x2,
      sync_out => sync_delay_q_net_x7
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_6/fir_coef/c_gen"

entity c_gen_entity_297990f235 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_297990f235;

architecture structural of c_gen_entity_297990f235 is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x44: std_logic;
  signal clk_1_sg_x44: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mem_data_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x8: std_logic;

begin
  ce_1_sg_x44 <= ce_1;
  clk_1_sg_x44 <= clk_1;
  sync_delay_q_net_x8 <= sync_in;
  coef_out <= mem_data_net_x0;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 10,
      y_width => 10
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 1023,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_1ee993c8ed57b9ce",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x44,
      clk => clk_1_sg_x44,
      clr => '0',
      en => "1",
      rst(0) => sync_delay_q_net_x8,
      op => counter_op_net
    );

  mem: entity work.xlsprom
    generic map (
      c_address_width => 10,
      c_width => 9,
      core_name0 => "bmg_24_vx5_8259598782c619da",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x44,
      clk => clk_1_sg_x44,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_6/fir_coef"

entity fir_coef_entity_d323099000 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0)
  );
end fir_coef_entity_d323099000;

architecture structural of fir_coef_entity_d323099000 is
  signal bram_data_out_net_x3: std_logic_vector(7 downto 0);
  signal ce_1_sg_x45: std_logic;
  signal clk_1_sg_x45: std_logic;
  signal concat_y_net_x3: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x9: std_logic;

begin
  ce_1_sg_x45 <= ce_1;
  clk_1_sg_x45 <= clk_1;
  bram_data_out_net_x3 <= data_in;
  concat_y_net_x3 <= sum_in;
  sync_delay_q_net_x9 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;

  c_gen_297990f235: entity work.c_gen_entity_297990f235
    port map (
      ce_1 => ce_1_sg_x45,
      clk_1 => clk_1_sg_x45,
      sync_in => sync_delay_q_net_x9,
      coef_out => mem_data_net_x1
    );

  data_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      d => bram_data_out_net_x3,
      en => '1',
      q => data_delay_q_net_x0
    );

  sum_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      d => concat_y_net_x3,
      en => '1',
      q => sum_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_6/fir_core"

entity fir_core_entity_afc1a299d0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coef: in std_logic_vector(8 downto 0); 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sum_out: out std_logic_vector(33 downto 0)
  );
end fir_core_entity_afc1a299d0;

architecture structural of fir_core_entity_afc1a299d0 is
  signal add_s_net_x0: std_logic_vector(17 downto 0);
  signal add_s_net_x1: std_logic_vector(17 downto 0);
  signal ce_1_sg_x48: std_logic;
  signal clk_1_sg_x48: std_logic;
  signal concat_y_net_x4: std_logic_vector(33 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(16 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(16 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(16 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);

begin
  ce_1_sg_x48 <= ce_1;
  clk_1_sg_x48 <= clk_1;
  mem_data_net_x4 <= coef;
  data_delay_q_net_x2 <= data_in;
  sum_delay_q_net_x2 <= sum_in;
  sum_out <= concat_y_net_x4;

  c_to_ri_d_b2378882ce: entity work.c_to_ri_d_entity_beaf200e16
    port map (
      c => data_delay_q_net_x2,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  c_to_ri_s_048ca862f7: entity work.c_to_ri_entity_9cc0e62ce6
    port map (
      c => sum_delay_q_net_x2,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  convert_im: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 15,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => add_s_net_x0,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 15,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => add_s_net_x1,
      dout => convert_re_dout_net_x0
    );

  mult_add_im_30bdb08ce5: entity work.mult_add_im_entity_6ff7c469f6
    port map (
      a => force_im_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_im_output_port_net_x3,
      ce_1 => ce_1_sg_x48,
      clk_1 => clk_1_sg_x48,
      out_x0 => add_s_net_x0
    );

  mult_add_re_53134e665c: entity work.mult_add_im_entity_6ff7c469f6
    port map (
      a => force_re_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_re_output_port_net_x3,
      ce_1 => ce_1_sg_x48,
      clk_1 => clk_1_sg_x48,
      out_x0 => add_s_net_x1
    );

  ri_to_c_8d2ef199ef: entity work.ri_to_c_entity_ee8df92208
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1/fir_tap_6"

entity fir_tap_6_entity_d13e1456a5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    sum_out: out std_logic_vector(33 downto 0)
  );
end fir_tap_6_entity_d13e1456a5;

architecture structural of fir_tap_6_entity_d13e1456a5 is
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal ce_1_sg_x49: std_logic;
  signal clk_1_sg_x49: std_logic;
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal concat_y_net_x6: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x10: std_logic;

begin
  ce_1_sg_x49 <= ce_1;
  clk_1_sg_x49 <= clk_1;
  bram_data_out_net_x4 <= data_in;
  concat_y_net_x5 <= sum_in;
  sync_delay_q_net_x10 <= sync_in;
  sum_out <= concat_y_net_x6;

  fir_coef_d323099000: entity work.fir_coef_entity_d323099000
    port map (
      ce_1 => ce_1_sg_x49,
      clk_1 => clk_1_sg_x49,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x5,
      sync_in => sync_delay_q_net_x10,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2
    );

  fir_core_afc1a299d0: entity work.fir_core_entity_afc1a299d0
    port map (
      ce_1 => ce_1_sg_x49,
      clk_1 => clk_1_sg_x49,
      coef => mem_data_net_x4,
      data_in => data_delay_q_net_x2,
      sum_in => sum_delay_q_net_x2,
      sum_out => concat_y_net_x6
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir1"

entity fir1_entity_f9d6e39c7e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    out_x0: out std_logic_vector(17 downto 0)
  );
end fir1_entity_f9d6e39c7e;

architecture structural of fir1_entity_f9d6e39c7e is
  signal bram_data_out_net_x10: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x8: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x9: std_logic_vector(7 downto 0);
  signal ce_1_sg_x50: std_logic;
  signal clk_1_sg_x50: std_logic;
  signal concat_y_net_x10: std_logic_vector(17 downto 0);
  signal concat_y_net_x4: std_logic_vector(33 downto 0);
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal concat_y_net_x6: std_logic_vector(33 downto 0);
  signal concat_y_net_x7: std_logic_vector(33 downto 0);
  signal concat_y_net_x8: std_logic_vector(33 downto 0);
  signal concat_y_net_x9: std_logic_vector(33 downto 0);
  signal delay7_q_net_x3: std_logic;
  signal delay_q_net_x2: std_logic_vector(7 downto 0);
  signal sync_delay_q_net_x10: std_logic;
  signal sync_delay_q_net_x11: std_logic;
  signal sync_delay_q_net_x14: std_logic;
  signal sync_delay_q_net_x6: std_logic;
  signal sync_delay_q_net_x7: std_logic;

begin
  ce_1_sg_x50 <= ce_1;
  clk_1_sg_x50 <= clk_1;
  delay_q_net_x2 <= in_x0;
  delay7_q_net_x3 <= sync_in;
  out_x0 <= concat_y_net_x10;

  fir_quantize_81904b561f: entity work.fir_quantize_entity_81904b561f
    port map (
      ce_1 => ce_1_sg_x50,
      clk_1 => clk_1_sg_x50,
      sum_in => concat_y_net_x6,
      sum_out => concat_y_net_x10
    );

  fir_tap_1_92ad0c4088: entity work.fir_tap_1_entity_92ad0c4088
    port map (
      ce_1 => ce_1_sg_x50,
      clk_1 => clk_1_sg_x50,
      data_in => delay_q_net_x2,
      sync_in => delay7_q_net_x3,
      data_out => bram_data_out_net_x4,
      sum_out => concat_y_net_x4,
      sync_out => sync_delay_q_net_x6
    );

  fir_tap_2_3d86da1238: entity work.fir_tap_2_entity_3d86da1238
    port map (
      ce_1 => ce_1_sg_x50,
      clk_1 => clk_1_sg_x50,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x4,
      sync_in => sync_delay_q_net_x6,
      data_out => bram_data_out_net_x7,
      sum_out => concat_y_net_x7,
      sync_out => sync_delay_q_net_x10
    );

  fir_tap_3_08103850b3: entity work.fir_tap_3_entity_08103850b3
    port map (
      ce_1 => ce_1_sg_x50,
      clk_1 => clk_1_sg_x50,
      data_in => bram_data_out_net_x7,
      sum_in => concat_y_net_x7,
      sync_in => sync_delay_q_net_x10,
      data_out => bram_data_out_net_x8,
      sum_out => concat_y_net_x8,
      sync_out => sync_delay_q_net_x14
    );

  fir_tap_4_3d4e2be445: entity work.fir_tap_4_entity_3d4e2be445
    port map (
      ce_1 => ce_1_sg_x50,
      clk_1 => clk_1_sg_x50,
      data_in => bram_data_out_net_x8,
      sum_in => concat_y_net_x8,
      sync_in => sync_delay_q_net_x14,
      data_out => bram_data_out_net_x9,
      sum_out => concat_y_net_x9,
      sync_out => sync_delay_q_net_x7
    );

  fir_tap_5_6f4356a60e: entity work.fir_tap_5_entity_6f4356a60e
    port map (
      ce_1 => ce_1_sg_x50,
      clk_1 => clk_1_sg_x50,
      data_in => bram_data_out_net_x9,
      sum_in => concat_y_net_x9,
      sync_in => sync_delay_q_net_x7,
      data_out => bram_data_out_net_x10,
      sum_out => concat_y_net_x5,
      sync_out => sync_delay_q_net_x11
    );

  fir_tap_6_d13e1456a5: entity work.fir_tap_6_entity_d13e1456a5
    port map (
      ce_1 => ce_1_sg_x50,
      clk_1 => clk_1_sg_x50,
      data_in => bram_data_out_net_x10,
      sum_in => concat_y_net_x5,
      sync_in => sync_delay_q_net_x11,
      sum_out => concat_y_net_x6
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir2/fir_tap_1/fir_core"

entity fir_core_entity_40051eb817 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coef: in std_logic_vector(8 downto 0); 
    data_in: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_core_entity_40051eb817;

architecture structural of fir_core_entity_40051eb817 is
  signal bram_data_out_net_x1: std_logic_vector(7 downto 0);
  signal ce_1_sg_x57: std_logic;
  signal clk_1_sg_x57: std_logic;
  signal concat_y_net_x1: std_logic_vector(33 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(16 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(16 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal dout_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal mult_p_net_x0: std_logic_vector(16 downto 0);
  signal mult_p_net_x1: std_logic_vector(16 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x2: std_logic;

begin
  ce_1_sg_x57 <= ce_1;
  clk_1_sg_x57 <= clk_1;
  mem_data_net_x4 <= coef;
  data_delay_q_net_x2 <= data_in;
  sync_delay_q_net_x1 <= sync_in;
  data_out <= bram_data_out_net_x1;
  sum_out <= concat_y_net_x1;
  sync_out <= sync_delay_q_net_x2;

  c_to_ri_d_ca8a19456b: entity work.c_to_ri_d_entity_beaf200e16
    port map (
      c => data_delay_q_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  convert_im: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 15,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => mult_p_net_x0,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 15,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => mult_p_net_x1,
      dout => convert_re_dout_net_x0
    );

  dout_delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x57,
      clk => clk_1_sg_x57,
      d => data_delay_q_net_x2,
      en => '1',
      q => dout_delay_q_net_x0
    );

  mult_add_im_9502cb5d04: entity work.mult_add_im_entity_971c6ec5b3
    port map (
      a => force_im_output_port_net_x1,
      b => mem_data_net_x4,
      ce_1 => ce_1_sg_x57,
      clk_1 => clk_1_sg_x57,
      out_x0 => mult_p_net_x0
    );

  mult_add_re_8317669e67: entity work.mult_add_im_entity_971c6ec5b3
    port map (
      a => force_re_output_port_net_x1,
      b => mem_data_net_x4,
      ce_1 => ce_1_sg_x57,
      clk_1 => clk_1_sg_x57,
      out_x0 => mult_p_net_x1
    );

  ri_to_c_1ae706f001: entity work.ri_to_c_entity_ee8df92208
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x1
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x57,
      clk => clk_1_sg_x57,
      d(0) => sync_delay_q_net_x1,
      en => '1',
      q(0) => sync_delay_q_net_x2
    );

  tap_delay_d70e25e28d: entity work.tap_delay_entity_9e67ba768a
    port map (
      ce_1 => ce_1_sg_x57,
      clk_1 => clk_1_sg_x57,
      in_x0 => dout_delay_q_net_x0,
      out_x0 => bram_data_out_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir2/fir_tap_1"

entity fir_tap_1_entity_2c4b8d4834 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_1_entity_2c4b8d4834;

architecture structural of fir_tap_1_entity_2c4b8d4834 is
  signal bram_data_out_net_x2: std_logic_vector(7 downto 0);
  signal ce_1_sg_x58: std_logic;
  signal clk_1_sg_x58: std_logic;
  signal concat_y_net_x2: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal delay2_q_net_x1: std_logic_vector(7 downto 0);
  signal delay7_q_net_x6: std_logic;
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  ce_1_sg_x58 <= ce_1;
  clk_1_sg_x58 <= clk_1;
  delay2_q_net_x1 <= data_in;
  delay7_q_net_x6 <= sync_in;
  data_out <= bram_data_out_net_x2;
  sum_out <= concat_y_net_x2;
  sync_out <= sync_delay_q_net_x3;

  fir_coef_9f29c03f10: entity work.fir_coef_entity_8668a3421a
    port map (
      ce_1 => ce_1_sg_x58,
      clk_1 => clk_1_sg_x58,
      data_in => delay2_q_net_x1,
      sync_in => delay7_q_net_x6,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_40051eb817: entity work.fir_core_entity_40051eb817
    port map (
      ce_1 => ce_1_sg_x58,
      clk_1 => clk_1_sg_x58,
      coef => mem_data_net_x4,
      data_in => data_delay_q_net_x2,
      sync_in => sync_delay_q_net_x1,
      data_out => bram_data_out_net_x2,
      sum_out => concat_y_net_x2,
      sync_out => sync_delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir2"

entity fir2_entity_68bc0c67f0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    out_x0: out std_logic_vector(17 downto 0)
  );
end fir2_entity_68bc0c67f0;

architecture structural of fir2_entity_68bc0c67f0 is
  signal bram_data_out_net_x10: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x8: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x9: std_logic_vector(7 downto 0);
  signal ce_1_sg_x93: std_logic;
  signal clk_1_sg_x93: std_logic;
  signal concat_y_net_x10: std_logic_vector(17 downto 0);
  signal concat_y_net_x4: std_logic_vector(33 downto 0);
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal concat_y_net_x6: std_logic_vector(33 downto 0);
  signal concat_y_net_x7: std_logic_vector(33 downto 0);
  signal concat_y_net_x8: std_logic_vector(33 downto 0);
  signal concat_y_net_x9: std_logic_vector(33 downto 0);
  signal delay2_q_net_x2: std_logic_vector(7 downto 0);
  signal delay7_q_net_x7: std_logic;
  signal sync_delay_q_net_x10: std_logic;
  signal sync_delay_q_net_x11: std_logic;
  signal sync_delay_q_net_x14: std_logic;
  signal sync_delay_q_net_x6: std_logic;
  signal sync_delay_q_net_x7: std_logic;

begin
  ce_1_sg_x93 <= ce_1;
  clk_1_sg_x93 <= clk_1;
  delay2_q_net_x2 <= in_x0;
  delay7_q_net_x7 <= sync_in;
  out_x0 <= concat_y_net_x10;

  fir_quantize_bf10af6463: entity work.fir_quantize_entity_81904b561f
    port map (
      ce_1 => ce_1_sg_x93,
      clk_1 => clk_1_sg_x93,
      sum_in => concat_y_net_x6,
      sum_out => concat_y_net_x10
    );

  fir_tap_1_2c4b8d4834: entity work.fir_tap_1_entity_2c4b8d4834
    port map (
      ce_1 => ce_1_sg_x93,
      clk_1 => clk_1_sg_x93,
      data_in => delay2_q_net_x2,
      sync_in => delay7_q_net_x7,
      data_out => bram_data_out_net_x4,
      sum_out => concat_y_net_x4,
      sync_out => sync_delay_q_net_x6
    );

  fir_tap_2_78bd633e2d: entity work.fir_tap_2_entity_3d86da1238
    port map (
      ce_1 => ce_1_sg_x93,
      clk_1 => clk_1_sg_x93,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x4,
      sync_in => sync_delay_q_net_x6,
      data_out => bram_data_out_net_x7,
      sum_out => concat_y_net_x7,
      sync_out => sync_delay_q_net_x10
    );

  fir_tap_3_2461e963d6: entity work.fir_tap_3_entity_08103850b3
    port map (
      ce_1 => ce_1_sg_x93,
      clk_1 => clk_1_sg_x93,
      data_in => bram_data_out_net_x7,
      sum_in => concat_y_net_x7,
      sync_in => sync_delay_q_net_x10,
      data_out => bram_data_out_net_x8,
      sum_out => concat_y_net_x8,
      sync_out => sync_delay_q_net_x14
    );

  fir_tap_4_3a5f0c73ba: entity work.fir_tap_4_entity_3d4e2be445
    port map (
      ce_1 => ce_1_sg_x93,
      clk_1 => clk_1_sg_x93,
      data_in => bram_data_out_net_x8,
      sum_in => concat_y_net_x8,
      sync_in => sync_delay_q_net_x14,
      data_out => bram_data_out_net_x9,
      sum_out => concat_y_net_x9,
      sync_out => sync_delay_q_net_x7
    );

  fir_tap_5_c2aab4d879: entity work.fir_tap_5_entity_6f4356a60e
    port map (
      ce_1 => ce_1_sg_x93,
      clk_1 => clk_1_sg_x93,
      data_in => bram_data_out_net_x9,
      sum_in => concat_y_net_x9,
      sync_in => sync_delay_q_net_x7,
      data_out => bram_data_out_net_x10,
      sum_out => concat_y_net_x5,
      sync_out => sync_delay_q_net_x11
    );

  fir_tap_6_9e62165852: entity work.fir_tap_6_entity_d13e1456a5
    port map (
      ce_1 => ce_1_sg_x93,
      clk_1 => clk_1_sg_x93,
      data_in => bram_data_out_net_x10,
      sum_in => concat_y_net_x5,
      sync_in => sync_delay_q_net_x11,
      sum_out => concat_y_net_x6
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir4/fir_quantize"

entity fir_quantize_entity_72dfc19179 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    sum_out: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end fir_quantize_entity_72dfc19179;

architecture structural of fir_quantize_entity_72dfc19179 is
  signal ce_1_sg_x137: std_logic;
  signal clk_1_sg_x137: std_logic;
  signal concat_y_net_x2: std_logic_vector(33 downto 0);
  signal concat_y_net_x3: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(16 downto 0);
  signal quantize_im_dout_net_x0: std_logic_vector(8 downto 0);
  signal quantize_re_dout_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x0: std_logic;

begin
  ce_1_sg_x137 <= ce_1;
  clk_1_sg_x137 <= clk_1;
  concat_y_net_x2 <= sum_in;
  sync_delay_q_net_x0 <= sync_in;
  sum_out <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  c_to_ri_bc7a4fc77e: entity work.c_to_ri_entity_9cc0e62ce6
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x137,
      clk => clk_1_sg_x137,
      d(0) => sync_delay_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  quantize_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 7,
      dout_width => 9,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x137,
      clk => clk_1_sg_x137,
      clr => '0',
      din => force_im_output_port_net_x0,
      dout => quantize_im_dout_net_x0
    );

  quantize_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 7,
      dout_width => 9,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x137,
      clk => clk_1_sg_x137,
      clr => '0',
      din => force_re_output_port_net_x0,
      dout => quantize_re_dout_net_x0
    );

  ri_to_c_6c3be9b063: entity work.ri_to_c_entity_d3f58c60ca
    port map (
      im => quantize_im_dout_net_x0,
      re => quantize_re_dout_net_x0,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir4/fir_tap_6/fir_coef"

entity fir_coef_entity_96f3aca08c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_96f3aca08c;

architecture structural of fir_coef_entity_96f3aca08c is
  signal bram_data_out_net_x3: std_logic_vector(7 downto 0);
  signal ce_1_sg_x174: std_logic;
  signal clk_1_sg_x174: std_logic;
  signal concat_y_net_x3: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x9: std_logic;

begin
  ce_1_sg_x174 <= ce_1;
  clk_1_sg_x174 <= clk_1;
  bram_data_out_net_x3 <= data_in;
  concat_y_net_x3 <= sum_in;
  sync_delay_q_net_x9 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_a7cce86c93: entity work.c_gen_entity_297990f235
    port map (
      ce_1 => ce_1_sg_x174,
      clk_1 => clk_1_sg_x174,
      sync_in => sync_delay_q_net_x9,
      coef_out => mem_data_net_x1
    );

  data_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      d => bram_data_out_net_x3,
      en => '1',
      q => data_delay_q_net_x0
    );

  sum_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      d => concat_y_net_x3,
      en => '1',
      q => sum_delay_q_net_x0
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      d(0) => sync_delay_q_net_x9,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir4/fir_tap_6/fir_core"

entity fir_core_entity_73c669ec2d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coef: in std_logic_vector(8 downto 0); 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_core_entity_73c669ec2d;

architecture structural of fir_core_entity_73c669ec2d is
  signal add_s_net_x0: std_logic_vector(17 downto 0);
  signal add_s_net_x1: std_logic_vector(17 downto 0);
  signal ce_1_sg_x177: std_logic;
  signal clk_1_sg_x177: std_logic;
  signal concat_y_net_x4: std_logic_vector(33 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(16 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(16 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(16 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x2: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  ce_1_sg_x177 <= ce_1;
  clk_1_sg_x177 <= clk_1;
  mem_data_net_x4 <= coef;
  data_delay_q_net_x2 <= data_in;
  sum_delay_q_net_x2 <= sum_in;
  sync_delay_q_net_x2 <= sync_in;
  sum_out <= concat_y_net_x4;
  sync_out <= sync_delay_q_net_x3;

  c_to_ri_d_92ad35b900: entity work.c_to_ri_d_entity_beaf200e16
    port map (
      c => data_delay_q_net_x2,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  c_to_ri_s_883f199766: entity work.c_to_ri_entity_9cc0e62ce6
    port map (
      c => sum_delay_q_net_x2,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  convert_im: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 15,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => add_s_net_x0,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 15,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => add_s_net_x1,
      dout => convert_re_dout_net_x0
    );

  mult_add_im_6bf9378752: entity work.mult_add_im_entity_6ff7c469f6
    port map (
      a => force_im_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_im_output_port_net_x3,
      ce_1 => ce_1_sg_x177,
      clk_1 => clk_1_sg_x177,
      out_x0 => add_s_net_x0
    );

  mult_add_re_4fcf92cc23: entity work.mult_add_im_entity_6ff7c469f6
    port map (
      a => force_re_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_re_output_port_net_x3,
      ce_1 => ce_1_sg_x177,
      clk_1 => clk_1_sg_x177,
      out_x0 => add_s_net_x1
    );

  ri_to_c_dc1220ca4b: entity work.ri_to_c_entity_ee8df92208
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x4
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x177,
      clk => clk_1_sg_x177,
      d(0) => sync_delay_q_net_x2,
      en => '1',
      q(0) => sync_delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir4/fir_tap_6"

entity fir_tap_6_entity_b76258ff2c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_6_entity_b76258ff2c;

architecture structural of fir_tap_6_entity_b76258ff2c is
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal ce_1_sg_x178: std_logic;
  signal clk_1_sg_x178: std_logic;
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal concat_y_net_x6: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x10: std_logic;
  signal sync_delay_q_net_x11: std_logic;
  signal sync_delay_q_net_x2: std_logic;

begin
  ce_1_sg_x178 <= ce_1;
  clk_1_sg_x178 <= clk_1;
  bram_data_out_net_x4 <= data_in;
  concat_y_net_x5 <= sum_in;
  sync_delay_q_net_x10 <= sync_in;
  sum_out <= concat_y_net_x6;
  sync_out <= sync_delay_q_net_x11;

  fir_coef_96f3aca08c: entity work.fir_coef_entity_96f3aca08c
    port map (
      ce_1 => ce_1_sg_x178,
      clk_1 => clk_1_sg_x178,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x5,
      sync_in => sync_delay_q_net_x10,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2,
      sync_out => sync_delay_q_net_x2
    );

  fir_core_73c669ec2d: entity work.fir_core_entity_73c669ec2d
    port map (
      ce_1 => ce_1_sg_x178,
      clk_1 => clk_1_sg_x178,
      coef => mem_data_net_x4,
      data_in => data_delay_q_net_x2,
      sum_in => sum_delay_q_net_x2,
      sync_in => sync_delay_q_net_x2,
      sum_out => concat_y_net_x6,
      sync_out => sync_delay_q_net_x11
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/fir4"

entity fir4_entity_1752d52923 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    out_x0: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end fir4_entity_1752d52923;

architecture structural of fir4_entity_1752d52923 is
  signal bram_data_out_net_x10: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x8: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x9: std_logic_vector(7 downto 0);
  signal ce_1_sg_x179: std_logic;
  signal clk_1_sg_x179: std_logic;
  signal concat_y_net_x10: std_logic_vector(17 downto 0);
  signal concat_y_net_x4: std_logic_vector(33 downto 0);
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal concat_y_net_x6: std_logic_vector(33 downto 0);
  signal concat_y_net_x7: std_logic_vector(33 downto 0);
  signal concat_y_net_x8: std_logic_vector(33 downto 0);
  signal concat_y_net_x9: std_logic_vector(33 downto 0);
  signal delay4_q_net_x2: std_logic_vector(7 downto 0);
  signal delay7_q_net_x15: std_logic;
  signal delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x10: std_logic;
  signal sync_delay_q_net_x11: std_logic;
  signal sync_delay_q_net_x14: std_logic;
  signal sync_delay_q_net_x15: std_logic;
  signal sync_delay_q_net_x6: std_logic;
  signal sync_delay_q_net_x7: std_logic;

begin
  ce_1_sg_x179 <= ce_1;
  clk_1_sg_x179 <= clk_1;
  delay4_q_net_x2 <= in_x0;
  delay7_q_net_x15 <= sync_in;
  out_x0 <= concat_y_net_x10;
  sync_out <= delay_q_net_x1;

  fir_quantize_72dfc19179: entity work.fir_quantize_entity_72dfc19179
    port map (
      ce_1 => ce_1_sg_x179,
      clk_1 => clk_1_sg_x179,
      sum_in => concat_y_net_x6,
      sync_in => sync_delay_q_net_x15,
      sum_out => concat_y_net_x10,
      sync_out => delay_q_net_x1
    );

  fir_tap_1_d5d8fe6781: entity work.fir_tap_1_entity_92ad0c4088
    port map (
      ce_1 => ce_1_sg_x179,
      clk_1 => clk_1_sg_x179,
      data_in => delay4_q_net_x2,
      sync_in => delay7_q_net_x15,
      data_out => bram_data_out_net_x4,
      sum_out => concat_y_net_x4,
      sync_out => sync_delay_q_net_x6
    );

  fir_tap_2_9b4f638e4e: entity work.fir_tap_2_entity_3d86da1238
    port map (
      ce_1 => ce_1_sg_x179,
      clk_1 => clk_1_sg_x179,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x4,
      sync_in => sync_delay_q_net_x6,
      data_out => bram_data_out_net_x7,
      sum_out => concat_y_net_x7,
      sync_out => sync_delay_q_net_x10
    );

  fir_tap_3_7c768f37ff: entity work.fir_tap_3_entity_08103850b3
    port map (
      ce_1 => ce_1_sg_x179,
      clk_1 => clk_1_sg_x179,
      data_in => bram_data_out_net_x7,
      sum_in => concat_y_net_x7,
      sync_in => sync_delay_q_net_x10,
      data_out => bram_data_out_net_x8,
      sum_out => concat_y_net_x8,
      sync_out => sync_delay_q_net_x14
    );

  fir_tap_4_c0256d7b4f: entity work.fir_tap_4_entity_3d4e2be445
    port map (
      ce_1 => ce_1_sg_x179,
      clk_1 => clk_1_sg_x179,
      data_in => bram_data_out_net_x8,
      sum_in => concat_y_net_x8,
      sync_in => sync_delay_q_net_x14,
      data_out => bram_data_out_net_x9,
      sum_out => concat_y_net_x9,
      sync_out => sync_delay_q_net_x7
    );

  fir_tap_5_94cb470a41: entity work.fir_tap_5_entity_6f4356a60e
    port map (
      ce_1 => ce_1_sg_x179,
      clk_1 => clk_1_sg_x179,
      data_in => bram_data_out_net_x9,
      sum_in => concat_y_net_x9,
      sync_in => sync_delay_q_net_x7,
      data_out => bram_data_out_net_x10,
      sum_out => concat_y_net_x5,
      sync_out => sync_delay_q_net_x11
    );

  fir_tap_6_b76258ff2c: entity work.fir_tap_6_entity_b76258ff2c
    port map (
      ce_1 => ce_1_sg_x179,
      clk_1 => clk_1_sg_x179,
      data_in => bram_data_out_net_x10,
      sum_in => concat_y_net_x5,
      sync_in => sync_delay_q_net_x11,
      sum_out => concat_y_net_x6,
      sync_out => sync_delay_q_net_x15
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/led0_sync"

entity led0_sync_entity_6d0c058729 is
  port (
    gpio_out: in std_logic; 
    convert_x0: out std_logic
  );
end led0_sync_entity_6d0c058729;

architecture structural of led0_sync_entity_6d0c058729 is
  signal convert_dout_net_x0: std_logic;
  signal relational5_op_net_x0: std_logic;

begin
  relational5_op_net_x0 <= gpio_out;
  convert_x0 <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => relational5_op_net_x0,
      dout(0) => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/pulse_ext1"

entity pulse_ext1_entity_4194692a29 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end pulse_ext1_entity_4194692a29;

architecture structural of pulse_ext1_entity_4194692a29 is
  signal ce_1_sg_x182: std_logic;
  signal clk_1_sg_x182: std_logic;
  signal constant5_op_net: std_logic_vector(24 downto 0);
  signal counter3_op_net: std_logic_vector(24 downto 0);
  signal logical_y_net_x2: std_logic;
  signal logical_y_net_x3: std_logic;
  signal relational5_op_net_x1: std_logic;

begin
  ce_1_sg_x182 <= ce_1;
  clk_1_sg_x182 <= clk_1;
  logical_y_net_x3 <= in_x0;
  out_x0 <= relational5_op_net_x1;

  constant5: entity work.constant_2ae71e3b73
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_092422ed79c7db12",
      op_arith => xlUnsigned,
      op_width => 25
    )
    port map (
      ce => ce_1_sg_x182,
      clk => clk_1_sg_x182,
      clr => '0',
      en(0) => relational5_op_net_x1,
      rst(0) => logical_y_net_x2,
      op => counter3_op_net
    );

  posedge_72f9a7df19: entity work.posedge1_entity_540938390c
    port map (
      ce_1 => ce_1_sg_x182,
      clk_1 => clk_1_sg_x182,
      in_x0 => logical_y_net_x3,
      out_x0 => logical_y_net_x2
    );

  relational5: entity work.relational_487ac75be9
    port map (
      a => counter3_op_net,
      b => constant5_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational5_op_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_bitrev/biplex_bitrev0/bit_reverse"

entity bit_reverse_entity_ee1df080c2 is
  port (
    in_x0: in std_logic_vector(7 downto 0); 
    out_x0: out std_logic_vector(7 downto 0)
  );
end bit_reverse_entity_ee1df080c2;

architecture structural of bit_reverse_entity_ee1df080c2 is
  signal bit0_y_net: std_logic;
  signal bit1_y_net: std_logic;
  signal bit2_y_net: std_logic;
  signal bit3_y_net: std_logic;
  signal bit4_y_net: std_logic;
  signal bit5_y_net: std_logic;
  signal bit6_y_net: std_logic;
  signal bit7_y_net: std_logic;
  signal concat_y_net_x0: std_logic_vector(7 downto 0);
  signal counter_op_net_x0: std_logic_vector(7 downto 0);

begin
  counter_op_net_x0 <= in_x0;
  out_x0 <= concat_y_net_x0;

  bit0: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => counter_op_net_x0,
      y(0) => bit0_y_net
    );

  bit1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => counter_op_net_x0,
      y(0) => bit1_y_net
    );

  bit2: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => counter_op_net_x0,
      y(0) => bit2_y_net
    );

  bit3: entity work.xlslice
    generic map (
      new_lsb => 3,
      new_msb => 3,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => counter_op_net_x0,
      y(0) => bit3_y_net
    );

  bit4: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 4,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => counter_op_net_x0,
      y(0) => bit4_y_net
    );

  bit5: entity work.xlslice
    generic map (
      new_lsb => 5,
      new_msb => 5,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => counter_op_net_x0,
      y(0) => bit5_y_net
    );

  bit6: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 6,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => counter_op_net_x0,
      y(0) => bit6_y_net
    );

  bit7: entity work.xlslice
    generic map (
      new_lsb => 7,
      new_msb => 7,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => counter_op_net_x0,
      y(0) => bit7_y_net
    );

  concat: entity work.concat_7673b9b993
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => bit0_y_net,
      in1(0) => bit1_y_net,
      in2(0) => bit2_y_net,
      in3(0) => bit3_y_net,
      in4(0) => bit4_y_net,
      in5(0) => bit5_y_net,
      in6(0) => bit6_y_net,
      in7(0) => bit7_y_net,
      y => concat_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_bitrev/biplex_bitrev0/c_to_ri"

entity c_to_ri_entity_06f74c44cd is
  port (
    c: in std_logic_vector(37 downto 0); 
    im: out std_logic_vector(18 downto 0); 
    re: out std_logic_vector(18 downto 0)
  );
end c_to_ri_entity_06f74c44cd;

architecture structural of c_to_ri_entity_06f74c44cd is
  signal delay2_q_net_x0: std_logic_vector(37 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(18 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(18 downto 0);
  signal slice_im_y_net: std_logic_vector(18 downto 0);
  signal slice_re_y_net: std_logic_vector(18 downto 0);

begin
  delay2_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_63700884f5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_63700884f5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 18,
      x_width => 38,
      y_width => 19
    )
    port map (
      x => delay2_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 19,
      new_msb => 37,
      x_width => 38,
      y_width => 19
    )
    port map (
      x => delay2_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_bitrev/biplex_bitrev0/ri_to_c"

entity ri_to_c_entity_c9013b8111 is
  port (
    im: in std_logic_vector(18 downto 0); 
    re: in std_logic_vector(18 downto 0); 
    c: out std_logic_vector(37 downto 0)
  );
end ri_to_c_entity_c9013b8111;

architecture structural of ri_to_c_entity_c9013b8111 is
  signal concat_y_net_x0: std_logic_vector(37 downto 0);
  signal force_im_output_port_net: std_logic_vector(18 downto 0);
  signal force_re_output_port_net: std_logic_vector(18 downto 0);
  signal ram_a_im_data_out_net_x0: std_logic_vector(18 downto 0);
  signal ram_a_re_data_out_net_x0: std_logic_vector(18 downto 0);

begin
  ram_a_im_data_out_net_x0 <= im;
  ram_a_re_data_out_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_5a12f8f9be
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_bc4405cd1e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => ram_a_im_data_out_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_bc4405cd1e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => ram_a_re_data_out_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_bitrev/biplex_bitrev0"

entity biplex_bitrev0_entity_c37b557a03 is
  port (
    a_in: in std_logic_vector(37 downto 0); 
    b_in: in std_logic_vector(37 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(37 downto 0); 
    b_out: out std_logic_vector(37 downto 0)
  );
end biplex_bitrev0_entity_c37b557a03;

architecture structural of biplex_bitrev0_entity_c37b557a03 is
  signal ce_1_sg_x185: std_logic;
  signal clk_1_sg_x185: std_logic;
  signal concat_y_net_x0: std_logic_vector(7 downto 0);
  signal concat_y_net_x3: std_logic_vector(37 downto 0);
  signal concat_y_net_x4: std_logic_vector(37 downto 0);
  signal concat_y_net_x5: std_logic_vector(37 downto 0);
  signal constant1_op_net: std_logic;
  signal constant2_op_net: std_logic;
  signal constant4_op_net: std_logic;
  signal constant6_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal counter1_op_net: std_logic;
  signal counter_op_net_x0: std_logic_vector(7 downto 0);
  signal delay1_q_net_x0: std_logic_vector(37 downto 0);
  signal delay2_q_net_x0: std_logic_vector(37 downto 0);
  signal delay_q_net_x0: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(18 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(18 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(18 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(18 downto 0);
  signal mux1_y_net_x0: std_logic_vector(37 downto 0);
  signal mux_y_net: std_logic_vector(7 downto 0);
  signal ram_a_im_data_out_net_x0: std_logic_vector(18 downto 0);
  signal ram_a_re_data_out_net_x0: std_logic_vector(18 downto 0);
  signal ram_b_im_data_out_net_x0: std_logic_vector(18 downto 0);
  signal ram_b_re_data_out_net_x0: std_logic_vector(18 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal relational_op_net: std_logic;

begin
  concat_y_net_x3 <= a_in;
  mux1_y_net_x0 <= b_in;
  ce_1_sg_x185 <= ce_1;
  clk_1_sg_x185 <= clk_1;
  delay_q_net_x0 <= sync_in;
  a_out <= concat_y_net_x4;
  b_out <= concat_y_net_x5;

  bit_reverse_ee1df080c2: entity work.bit_reverse_entity_ee1df080c2
    port map (
      in_x0 => counter_op_net_x0,
      out_x0 => concat_y_net_x0
    );

  c_to_ri1_87be8b8b23: entity work.c_to_ri_entity_06f74c44cd
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_06f74c44cd: entity work.c_to_ri_entity_06f74c44cd
    port map (
      c => delay2_q_net_x0,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  constant1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  constant4: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant4_op_net
    );

  constant6: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant6_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x185,
      clk => clk_1_sg_x185,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net_x0
    );

  counter1: entity work.counter_2943023fcf
    port map (
      ce => ce_1_sg_x185,
      clk => clk_1_sg_x185,
      clr => '0',
      en(0) => relational_op_net,
      op(0) => counter1_op_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 38
    )
    port map (
      ce => ce_1_sg_x185,
      clk => clk_1_sg_x185,
      d => mux1_y_net_x0,
      en => '1',
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 38
    )
    port map (
      ce => ce_1_sg_x185,
      clk => clk_1_sg_x185,
      d => concat_y_net_x3,
      en => '1',
      q => delay2_q_net_x0
    );

  mux: entity work.mux_7f6b7da686
    port map (
      ce => ce_1_sg_x185,
      clk => clk_1_sg_x185,
      clr => '0',
      d0 => counter_op_net_x0,
      d1 => concat_y_net_x0,
      sel(0) => counter1_op_net,
      y => mux_y_net
    );

  ram_a_im: entity work.xlspram
    generic map (
      c_address_width => 8,
      c_width => 19,
      core_name0 => "bmg_24_vx5_cd3584ee10cade7e",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x185,
      clk => clk_1_sg_x185,
      data_in => force_im_output_port_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant_op_net,
      data_out => ram_a_im_data_out_net_x0
    );

  ram_a_re: entity work.xlspram
    generic map (
      c_address_width => 8,
      c_width => 19,
      core_name0 => "bmg_24_vx5_cd3584ee10cade7e",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x185,
      clk => clk_1_sg_x185,
      data_in => force_re_output_port_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => ram_a_re_data_out_net_x0
    );

  ram_b_im: entity work.xlspram
    generic map (
      c_address_width => 8,
      c_width => 19,
      core_name0 => "bmg_24_vx5_cd3584ee10cade7e",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x185,
      clk => clk_1_sg_x185,
      data_in => force_im_output_port_net_x1,
      en => "1",
      rst => "0",
      we(0) => constant4_op_net,
      data_out => ram_b_im_data_out_net_x0
    );

  ram_b_re: entity work.xlspram
    generic map (
      c_address_width => 8,
      c_width => 19,
      core_name0 => "bmg_24_vx5_cd3584ee10cade7e",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x185,
      clk => clk_1_sg_x185,
      data_in => force_re_output_port_net_x1,
      en => "1",
      rst => "0",
      we(0) => constant6_op_net,
      data_out => ram_b_re_data_out_net_x0
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => counter_op_net_x0,
      output_port => reinterpret_output_port_net
    );

  relational: entity work.relational_53c93d0689
    port map (
      a(0) => constant1_op_net,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x185,
      clk => clk_1_sg_x185,
      clr => '0',
      op(0) => relational_op_net
    );

  ri_to_c1_a6493658be: entity work.ri_to_c_entity_c9013b8111
    port map (
      im => ram_b_im_data_out_net_x0,
      re => ram_b_re_data_out_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_c9013b8111: entity work.ri_to_c_entity_c9013b8111
    port map (
      im => ram_a_im_data_out_net_x0,
      re => ram_a_re_data_out_net_x0,
      c => concat_y_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_bitrev"

entity quadplex_bitrev_entity_ec8fe59fef is
  port (
    a_in: in std_logic_vector(37 downto 0); 
    b_in: in std_logic_vector(37 downto 0); 
    c_in: in std_logic_vector(37 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(37 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(37 downto 0); 
    b_out: out std_logic_vector(37 downto 0); 
    c_out: out std_logic_vector(37 downto 0); 
    d_out: out std_logic_vector(37 downto 0)
  );
end quadplex_bitrev_entity_ec8fe59fef;

architecture structural of quadplex_bitrev_entity_ec8fe59fef is
  signal ce_1_sg_x187: std_logic;
  signal clk_1_sg_x187: std_logic;
  signal concat_y_net_x10: std_logic_vector(37 downto 0);
  signal concat_y_net_x11: std_logic_vector(37 downto 0);
  signal concat_y_net_x12: std_logic_vector(37 downto 0);
  signal concat_y_net_x13: std_logic_vector(37 downto 0);
  signal concat_y_net_x14: std_logic_vector(37 downto 0);
  signal concat_y_net_x9: std_logic_vector(37 downto 0);
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x2: std_logic_vector(37 downto 0);
  signal mux1_y_net_x3: std_logic_vector(37 downto 0);

begin
  concat_y_net_x9 <= a_in;
  mux1_y_net_x2 <= b_in;
  concat_y_net_x10 <= c_in;
  ce_1_sg_x187 <= ce_1;
  clk_1_sg_x187 <= clk_1;
  mux1_y_net_x3 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x11;
  b_out <= concat_y_net_x12;
  c_out <= concat_y_net_x13;
  d_out <= concat_y_net_x14;

  biplex_bitrev0_c37b557a03: entity work.biplex_bitrev0_entity_c37b557a03
    port map (
      a_in => concat_y_net_x9,
      b_in => mux1_y_net_x2,
      ce_1 => ce_1_sg_x187,
      clk_1 => clk_1_sg_x187,
      sync_in => delay_q_net_x2,
      a_out => concat_y_net_x11,
      b_out => concat_y_net_x12
    );

  biplex_bitrev1_98a9c76b91: entity work.biplex_bitrev0_entity_c37b557a03
    port map (
      a_in => concat_y_net_x10,
      b_in => mux1_y_net_x3,
      ce_1 => ce_1_sg_x187,
      clk_1 => clk_1_sg_x187,
      sync_in => delay_q_net_x2,
      a_out => concat_y_net_x13,
      b_out => concat_y_net_x14
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_commutator/biplex_commutator_01/delay_b/delay_im"

entity delay_im_entity_ac37ee916d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(18 downto 0); 
    out_x0: out std_logic_vector(18 downto 0)
  );
end delay_im_entity_ac37ee916d;

architecture structural of delay_im_entity_ac37ee916d is
  signal bram_data_out_net_x0: std_logic_vector(18 downto 0);
  signal ce_1_sg_x188: std_logic;
  signal clk_1_sg_x188: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(18 downto 0);

begin
  ce_1_sg_x188 <= ce_1;
  clk_1_sg_x188 <= clk_1;
  force_im_output_port_net_x1 <= in_x0;
  out_x0 <= bram_data_out_net_x0;

  bram: entity work.xlspram
    generic map (
      c_address_width => 8,
      c_width => 19,
      core_name0 => "bmg_24_vx5_cd3584ee10cade7e",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      data_in => force_im_output_port_net_x1,
      en => "1",
      rst => "0",
      we(0) => constant_op_net,
      data_out => bram_data_out_net_x0
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 254,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_e9ef60c8c2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(37 downto 0); 
    out_x0: out std_logic_vector(37 downto 0)
  );
end delay_b_entity_e9ef60c8c2;

architecture structural of delay_b_entity_e9ef60c8c2 is
  signal bram_data_out_net_x2: std_logic_vector(18 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(18 downto 0);
  signal ce_1_sg_x190: std_logic;
  signal clk_1_sg_x190: std_logic;
  signal concat_y_net_x2: std_logic_vector(37 downto 0);
  signal concat_y_net_x3: std_logic_vector(37 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(18 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(18 downto 0);

begin
  ce_1_sg_x190 <= ce_1;
  clk_1_sg_x190 <= clk_1;
  concat_y_net_x2 <= in_x0;
  out_x0 <= concat_y_net_x3;

  c_to_ri_35f7a8c72f: entity work.c_to_ri_entity_06f74c44cd
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  delay_im_ac37ee916d: entity work.delay_im_entity_ac37ee916d
    port map (
      ce_1 => ce_1_sg_x190,
      clk_1 => clk_1_sg_x190,
      in_x0 => force_im_output_port_net_x1,
      out_x0 => bram_data_out_net_x2
    );

  delay_re_c5702ea53f: entity work.delay_im_entity_ac37ee916d
    port map (
      ce_1 => ce_1_sg_x190,
      clk_1 => clk_1_sg_x190,
      in_x0 => force_re_output_port_net_x1,
      out_x0 => bram_data_out_net_x3
    );

  ri_to_c_0c7e32a9cc: entity work.ri_to_c_entity_c9013b8111
    port map (
      im => bram_data_out_net_x2,
      re => bram_data_out_net_x3,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_62c7c5ecc6 is
  port (
    aloahi: in std_logic_vector(37 downto 0); 
    blobhi: in std_logic_vector(37 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(37 downto 0); 
    aloblo: out std_logic_vector(37 downto 0)
  );
end biplex_commutator_01_entity_62c7c5ecc6;

architecture structural of biplex_commutator_01_entity_62c7c5ecc6 is
  signal ce_1_sg_x194: std_logic;
  signal clk_1_sg_x194: std_logic;
  signal concat_y_net_x0: std_logic_vector(37 downto 0);
  signal concat_y_net_x12: std_logic_vector(37 downto 0);
  signal concat_y_net_x3: std_logic_vector(37 downto 0);
  signal concat_y_net_x4: std_logic_vector(37 downto 0);
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x3: std_logic_vector(37 downto 0);
  signal mux_y_net_x1: std_logic_vector(37 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x0 <= aloahi;
  concat_y_net_x4 <= blobhi;
  ce_1_sg_x194 <= ce_1;
  clk_1_sg_x194 <= clk_1;
  delay_q_net_x0 <= sync_in;
  ahibhi <= mux1_y_net_x3;
  aloblo <= concat_y_net_x12;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_1c25d2b550c5fffc",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x194,
      clk => clk_1_sg_x194,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_e9ef60c8c2: entity work.delay_b_entity_e9ef60c8c2
    port map (
      ce_1 => ce_1_sg_x194,
      clk_1 => clk_1_sg_x194,
      in_x0 => concat_y_net_x4,
      out_x0 => concat_y_net_x3
    );

  delay_lo_8c56070a4e: entity work.delay_b_entity_e9ef60c8c2
    port map (
      ce_1 => ce_1_sg_x194,
      clk_1 => clk_1_sg_x194,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x12
    );

  mux: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x194,
      clk => clk_1_sg_x194,
      clr => '0',
      d0 => concat_y_net_x0,
      d1 => concat_y_net_x3,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x194,
      clk => clk_1_sg_x194,
      clr => '0',
      d0 => concat_y_net_x3,
      d1 => concat_y_net_x0,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x3
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 8,
      x_width => 9,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_557363cddf is
  port (
    aloahi: in std_logic_vector(37 downto 0); 
    blobhi: in std_logic_vector(37 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(37 downto 0); 
    aloblo: out std_logic_vector(37 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_23_entity_557363cddf;

architecture structural of biplex_commutator_23_entity_557363cddf is
  signal ce_1_sg_x201: std_logic;
  signal clk_1_sg_x201: std_logic;
  signal concat_y_net_x1: std_logic_vector(37 downto 0);
  signal concat_y_net_x13: std_logic_vector(37 downto 0);
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal mux1_y_net_x0: std_logic_vector(37 downto 0);
  signal mux1_y_net_x2: std_logic_vector(37 downto 0);
  signal mux1_y_net_x4: std_logic_vector(37 downto 0);
  signal mux_y_net_x1: std_logic_vector(37 downto 0);
  signal top_bit_y_net: std_logic;

begin
  mux1_y_net_x0 <= aloahi;
  mux1_y_net_x2 <= blobhi;
  ce_1_sg_x201 <= ce_1;
  clk_1_sg_x201 <= clk_1;
  delay_q_net_x0 <= sync_in;
  ahibhi <= mux1_y_net_x4;
  aloblo <= concat_y_net_x13;
  sync_out <= delay_q_net_x3;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_1c25d2b550c5fffc",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x201,
      clk => clk_1_sg_x201,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 257,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x201,
      clk => clk_1_sg_x201,
      d(0) => delay_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay_b_99f177d54b: entity work.delay_b_entity_e9ef60c8c2
    port map (
      ce_1 => ce_1_sg_x201,
      clk_1 => clk_1_sg_x201,
      in_x0 => mux1_y_net_x2,
      out_x0 => concat_y_net_x1
    );

  delay_lo_b9f9f81ec7: entity work.delay_b_entity_e9ef60c8c2
    port map (
      ce_1 => ce_1_sg_x201,
      clk_1 => clk_1_sg_x201,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x13
    );

  mux: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x201,
      clk => clk_1_sg_x201,
      clr => '0',
      d0 => mux1_y_net_x0,
      d1 => concat_y_net_x1,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x201,
      clk => clk_1_sg_x201,
      clr => '0',
      d0 => concat_y_net_x1,
      d1 => mux1_y_net_x0,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x4
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 8,
      x_width => 9,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_commutator/biplex_commutator_ac/delay_b/delay_im"

entity delay_im_entity_4720f787f3 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(18 downto 0); 
    out_x0: out std_logic_vector(18 downto 0)
  );
end delay_im_entity_4720f787f3;

architecture structural of delay_im_entity_4720f787f3 is
  signal bram_data_out_net_x0: std_logic_vector(18 downto 0);
  signal ce_1_sg_x202: std_logic;
  signal clk_1_sg_x202: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(18 downto 0);

begin
  ce_1_sg_x202 <= ce_1;
  clk_1_sg_x202 <= clk_1;
  force_im_output_port_net_x1 <= in_x0;
  out_x0 <= bram_data_out_net_x0;

  bram: entity work.xlspram
    generic map (
      c_address_width => 9,
      c_width => 19,
      core_name0 => "bmg_24_vx5_941504d2ced01311",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x202,
      clk => clk_1_sg_x202,
      data_in => force_im_output_port_net_x1,
      en => "1",
      rst => "0",
      we(0) => constant_op_net,
      data_out => bram_data_out_net_x0
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 510,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_1c25d2b550c5fffc",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x202,
      clk => clk_1_sg_x202,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_39ff3fd89b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(37 downto 0); 
    out_x0: out std_logic_vector(37 downto 0)
  );
end delay_b_entity_39ff3fd89b;

architecture structural of delay_b_entity_39ff3fd89b is
  signal bram_data_out_net_x2: std_logic_vector(18 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(18 downto 0);
  signal ce_1_sg_x204: std_logic;
  signal clk_1_sg_x204: std_logic;
  signal concat_y_net_x2: std_logic_vector(37 downto 0);
  signal concat_y_net_x3: std_logic_vector(37 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(18 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(18 downto 0);

begin
  ce_1_sg_x204 <= ce_1;
  clk_1_sg_x204 <= clk_1;
  concat_y_net_x2 <= in_x0;
  out_x0 <= concat_y_net_x3;

  c_to_ri_1426cd9f0a: entity work.c_to_ri_entity_06f74c44cd
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  delay_im_4720f787f3: entity work.delay_im_entity_4720f787f3
    port map (
      ce_1 => ce_1_sg_x204,
      clk_1 => clk_1_sg_x204,
      in_x0 => force_im_output_port_net_x1,
      out_x0 => bram_data_out_net_x2
    );

  delay_re_2137d370c6: entity work.delay_im_entity_4720f787f3
    port map (
      ce_1 => ce_1_sg_x204,
      clk_1 => clk_1_sg_x204,
      in_x0 => force_re_output_port_net_x1,
      out_x0 => bram_data_out_net_x3
    );

  ri_to_c_150f21d370: entity work.ri_to_c_entity_c9013b8111
    port map (
      im => bram_data_out_net_x2,
      re => bram_data_out_net_x3,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_a60f675d19 is
  port (
    aloahi: in std_logic_vector(37 downto 0); 
    blobhi: in std_logic_vector(37 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(37 downto 0); 
    aloblo: out std_logic_vector(37 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_ac_entity_a60f675d19;

architecture structural of biplex_commutator_ac_entity_a60f675d19 is
  signal ce_1_sg_x208: std_logic;
  signal clk_1_sg_x208: std_logic;
  signal concat_y_net_x0: std_logic_vector(37 downto 0);
  signal concat_y_net_x3: std_logic_vector(37 downto 0);
  signal concat_y_net_x5: std_logic_vector(37 downto 0);
  signal concat_y_net_x6: std_logic_vector(37 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x1: std_logic_vector(37 downto 0);
  signal mux_y_net_x1: std_logic_vector(37 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x0 <= aloahi;
  concat_y_net_x5 <= blobhi;
  ce_1_sg_x208 <= ce_1;
  clk_1_sg_x208 <= clk_1;
  delay_q_net_x1 <= sync_in;
  ahibhi <= mux1_y_net_x1;
  aloblo <= concat_y_net_x6;
  sync_out <= delay_q_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_1ee993c8ed57b9ce",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x208,
      clk => clk_1_sg_x208,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x1,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 513,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x208,
      clk => clk_1_sg_x208,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_39ff3fd89b: entity work.delay_b_entity_39ff3fd89b
    port map (
      ce_1 => ce_1_sg_x208,
      clk_1 => clk_1_sg_x208,
      in_x0 => concat_y_net_x5,
      out_x0 => concat_y_net_x3
    );

  delay_lo_6a35c2cb3f: entity work.delay_b_entity_39ff3fd89b
    port map (
      ce_1 => ce_1_sg_x208,
      clk_1 => clk_1_sg_x208,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x6
    );

  mux: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x208,
      clk => clk_1_sg_x208,
      clr => '0',
      d0 => concat_y_net_x0,
      d1 => concat_y_net_x3,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x208,
      clk => clk_1_sg_x208,
      clr => '0',
      d0 => concat_y_net_x3,
      d1 => concat_y_net_x0,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x1
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 9,
      new_msb => 9,
      x_width => 10,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/quadplex_commutator"

entity quadplex_commutator_entity_921a5ee5e2 is
  port (
    a: in std_logic_vector(37 downto 0); 
    b: in std_logic_vector(37 downto 0); 
    c: in std_logic_vector(37 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(37 downto 0); 
    sync_in: in std_logic; 
    abcd0: out std_logic_vector(37 downto 0); 
    abcd1: out std_logic_vector(37 downto 0); 
    abcd2: out std_logic_vector(37 downto 0); 
    abcd3: out std_logic_vector(37 downto 0); 
    sync_out: out std_logic
  );
end quadplex_commutator_entity_921a5ee5e2;

architecture structural of quadplex_commutator_entity_921a5ee5e2 is
  signal ce_1_sg_x216: std_logic;
  signal clk_1_sg_x216: std_logic;
  signal concat_y_net_x10: std_logic_vector(37 downto 0);
  signal concat_y_net_x11: std_logic_vector(37 downto 0);
  signal concat_y_net_x14: std_logic_vector(37 downto 0);
  signal concat_y_net_x15: std_logic_vector(37 downto 0);
  signal concat_y_net_x16: std_logic_vector(37 downto 0);
  signal concat_y_net_x6: std_logic_vector(37 downto 0);
  signal concat_y_net_x7: std_logic_vector(37 downto 0);
  signal concat_y_net_x9: std_logic_vector(37 downto 0);
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x4: std_logic;
  signal delay_q_net_x6: std_logic;
  signal delay_q_net_x7: std_logic;
  signal mux1_y_net_x1: std_logic_vector(37 downto 0);
  signal mux1_y_net_x5: std_logic_vector(37 downto 0);
  signal mux1_y_net_x6: std_logic_vector(37 downto 0);
  signal mux1_y_net_x7: std_logic_vector(37 downto 0);

begin
  concat_y_net_x9 <= a;
  concat_y_net_x10 <= b;
  concat_y_net_x14 <= c;
  ce_1_sg_x216 <= ce_1;
  clk_1_sg_x216 <= clk_1;
  concat_y_net_x11 <= d;
  delay_q_net_x6 <= sync_in;
  abcd0 <= concat_y_net_x15;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= concat_y_net_x16;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x7;

  biplex_commutator_01_62c7c5ecc6: entity work.biplex_commutator_01_entity_62c7c5ecc6
    port map (
      aloahi => concat_y_net_x6,
      blobhi => concat_y_net_x7,
      ce_1 => ce_1_sg_x216,
      clk_1 => clk_1_sg_x216,
      sync_in => delay_q_net_x2,
      ahibhi => mux1_y_net_x6,
      aloblo => concat_y_net_x15
    );

  biplex_commutator_23_557363cddf: entity work.biplex_commutator_23_entity_557363cddf
    port map (
      aloahi => mux1_y_net_x1,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x216,
      clk_1 => clk_1_sg_x216,
      sync_in => delay_q_net_x4,
      ahibhi => mux1_y_net_x7,
      aloblo => concat_y_net_x16,
      sync_out => delay_q_net_x7
    );

  biplex_commutator_ac_a60f675d19: entity work.biplex_commutator_ac_entity_a60f675d19
    port map (
      aloahi => concat_y_net_x9,
      blobhi => concat_y_net_x14,
      ce_1 => ce_1_sg_x216,
      clk_1 => clk_1_sg_x216,
      sync_in => delay_q_net_x6,
      ahibhi => mux1_y_net_x1,
      aloblo => concat_y_net_x6,
      sync_out => delay_q_net_x2
    );

  biplex_commutator_bd_9b99e4327b: entity work.biplex_commutator_ac_entity_a60f675d19
    port map (
      aloahi => concat_y_net_x10,
      blobhi => concat_y_net_x11,
      ce_1 => ce_1_sg_x216,
      clk_1 => clk_1_sg_x216,
      sync_in => delay_q_net_x6,
      ahibhi => mux1_y_net_x5,
      aloblo => concat_y_net_x7,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_4ccd56bded is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(17 downto 0); 
    out_x0: out std_logic_vector(17 downto 0)
  );
end delay_b_entity_4ccd56bded;

architecture structural of delay_b_entity_4ccd56bded is
  signal bram_data_out_net_x1: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x2: std_logic_vector(17 downto 0);
  signal ce_1_sg_x217: std_logic;
  signal clk_1_sg_x217: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x217 <= ce_1;
  clk_1_sg_x217 <= clk_1;
  bram_data_out_net_x1 <= in_x0;
  out_x0 <= bram_data_out_net_x2;

  bram: entity work.xlspram
    generic map (
      c_address_width => 8,
      c_width => 18,
      core_name0 => "bmg_24_vx5_b56a7cdaabc490ac",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x217,
      clk => clk_1_sg_x217,
      data_in => bram_data_out_net_x1,
      en => "1",
      rst => "0",
      we(0) => constant_op_net,
      data_out => bram_data_out_net_x2
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 254,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x217,
      clk => clk_1_sg_x217,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_25d7a63480 is
  port (
    aloahi: in std_logic_vector(17 downto 0); 
    blobhi: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(17 downto 0); 
    aloblo: out std_logic_vector(17 downto 0)
  );
end biplex_commutator_01_entity_25d7a63480;

architecture structural of biplex_commutator_01_entity_25d7a63480 is
  signal bram_data_out_net_x2: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x4: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(17 downto 0);
  signal ce_1_sg_x219: std_logic;
  signal clk_1_sg_x219: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(17 downto 0);
  signal mux_y_net_x0: std_logic_vector(17 downto 0);
  signal top_bit_y_net: std_logic;

begin
  bram_data_out_net_x3 <= aloahi;
  bram_data_out_net_x4 <= blobhi;
  ce_1_sg_x219 <= ce_1;
  clk_1_sg_x219 <= clk_1;
  delay_q_net_x0 <= sync_in;
  ahibhi <= mux1_y_net_x0;
  aloblo <= bram_data_out_net_x5;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_1c25d2b550c5fffc",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x219,
      clk => clk_1_sg_x219,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_4ccd56bded: entity work.delay_b_entity_4ccd56bded
    port map (
      ce_1 => ce_1_sg_x219,
      clk_1 => clk_1_sg_x219,
      in_x0 => bram_data_out_net_x4,
      out_x0 => bram_data_out_net_x2
    );

  delay_lo_91bc7569ab: entity work.delay_b_entity_4ccd56bded
    port map (
      ce_1 => ce_1_sg_x219,
      clk_1 => clk_1_sg_x219,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x5
    );

  mux: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x219,
      clk => clk_1_sg_x219,
      clr => '0',
      d0 => bram_data_out_net_x3,
      d1 => bram_data_out_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x219,
      clk => clk_1_sg_x219,
      clr => '0',
      d0 => bram_data_out_net_x2,
      d1 => bram_data_out_net_x3,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x0
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 8,
      x_width => 9,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_dec2d919d3 is
  port (
    aloahi: in std_logic_vector(17 downto 0); 
    blobhi: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(17 downto 0); 
    aloblo: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_23_entity_dec2d919d3;

architecture structural of biplex_commutator_23_entity_dec2d919d3 is
  signal bram_data_out_net_x0: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x2: std_logic_vector(17 downto 0);
  signal ce_1_sg_x222: std_logic;
  signal clk_1_sg_x222: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x2: std_logic_vector(17 downto 0);
  signal mux1_y_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x4: std_logic_vector(17 downto 0);
  signal mux_y_net_x0: std_logic_vector(17 downto 0);
  signal top_bit_y_net: std_logic;

begin
  mux1_y_net_x2 <= aloahi;
  mux1_y_net_x3 <= blobhi;
  ce_1_sg_x222 <= ce_1;
  clk_1_sg_x222 <= clk_1;
  delay_q_net_x1 <= sync_in;
  ahibhi <= mux1_y_net_x4;
  aloblo <= bram_data_out_net_x2;
  sync_out <= delay_q_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_1c25d2b550c5fffc",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x222,
      clk => clk_1_sg_x222,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x1,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 257,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x222,
      clk => clk_1_sg_x222,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_c94df4f079: entity work.delay_b_entity_4ccd56bded
    port map (
      ce_1 => ce_1_sg_x222,
      clk_1 => clk_1_sg_x222,
      in_x0 => mux1_y_net_x3,
      out_x0 => bram_data_out_net_x0
    );

  delay_lo_1fe934716e: entity work.delay_b_entity_4ccd56bded
    port map (
      ce_1 => ce_1_sg_x222,
      clk_1 => clk_1_sg_x222,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x2
    );

  mux: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x222,
      clk => clk_1_sg_x222,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => bram_data_out_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x222,
      clk => clk_1_sg_x222,
      clr => '0',
      d0 => bram_data_out_net_x0,
      d1 => mux1_y_net_x2,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x4
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 8,
      x_width => 9,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_1bd1c4a74f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(17 downto 0); 
    out_x0: out std_logic_vector(17 downto 0)
  );
end delay_b_entity_1bd1c4a74f;

architecture structural of delay_b_entity_1bd1c4a74f is
  signal bram_data_out_net_x0: std_logic_vector(17 downto 0);
  signal ce_1_sg_x223: std_logic;
  signal clk_1_sg_x223: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal shift2_op_net_x0: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x223 <= ce_1;
  clk_1_sg_x223 <= clk_1;
  shift2_op_net_x0 <= in_x0;
  out_x0 <= bram_data_out_net_x0;

  bram: entity work.xlspram
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "bmg_24_vx5_0206823b131149d8",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x223,
      clk => clk_1_sg_x223,
      data_in => shift2_op_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant_op_net,
      data_out => bram_data_out_net_x0
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 510,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_1c25d2b550c5fffc",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x223,
      clk => clk_1_sg_x223,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_c93b4496aa is
  port (
    aloahi: in std_logic_vector(17 downto 0); 
    blobhi: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(17 downto 0); 
    aloblo: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_ac_entity_c93b4496aa;

architecture structural of biplex_commutator_ac_entity_c93b4496aa is
  signal bram_data_out_net_x0: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(17 downto 0);
  signal ce_1_sg_x225: std_logic;
  signal clk_1_sg_x225: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x3: std_logic;
  signal mux1_y_net_x3: std_logic_vector(17 downto 0);
  signal mux_y_net_x0: std_logic_vector(17 downto 0);
  signal shift2_op_net_x1: std_logic_vector(17 downto 0);
  signal shift_op_net_x0: std_logic_vector(17 downto 0);
  signal top_bit_y_net: std_logic;

begin
  shift_op_net_x0 <= aloahi;
  shift2_op_net_x1 <= blobhi;
  ce_1_sg_x225 <= ce_1;
  clk_1_sg_x225 <= clk_1;
  delay_q_net_x2 <= sync_in;
  ahibhi <= mux1_y_net_x3;
  aloblo <= bram_data_out_net_x5;
  sync_out <= delay_q_net_x3;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_1ee993c8ed57b9ce",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x2,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 513,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      d(0) => delay_q_net_x2,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay_b_1bd1c4a74f: entity work.delay_b_entity_1bd1c4a74f
    port map (
      ce_1 => ce_1_sg_x225,
      clk_1 => clk_1_sg_x225,
      in_x0 => shift2_op_net_x1,
      out_x0 => bram_data_out_net_x0
    );

  delay_lo_afe1a9707d: entity work.delay_b_entity_1bd1c4a74f
    port map (
      ce_1 => ce_1_sg_x225,
      clk_1 => clk_1_sg_x225,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x5
    );

  mux: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      clr => '0',
      d0 => shift_op_net_x0,
      d1 => bram_data_out_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      clr => '0',
      d0 => bram_data_out_net_x0,
      d1 => shift_op_net_x0,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x3
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 9,
      new_msb => 9,
      x_width => 10,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/quadplex_commutator"

entity quadplex_commutator_entity_6aa00d72e4 is
  port (
    a: in std_logic_vector(17 downto 0); 
    b: in std_logic_vector(17 downto 0); 
    c: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(17 downto 0); 
    sync_in: in std_logic; 
    abcd0: out std_logic_vector(17 downto 0); 
    abcd1: out std_logic_vector(17 downto 0); 
    abcd2: out std_logic_vector(17 downto 0); 
    abcd3: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end quadplex_commutator_entity_6aa00d72e4;

architecture structural of quadplex_commutator_entity_6aa00d72e4 is
  signal bram_data_out_net_x6: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x8: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x9: std_logic_vector(17 downto 0);
  signal ce_1_sg_x229: std_logic;
  signal clk_1_sg_x229: std_logic;
  signal delay_q_net_x4: std_logic;
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x6: std_logic;
  signal delay_q_net_x7: std_logic;
  signal mux1_y_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x5: std_logic_vector(17 downto 0);
  signal mux1_y_net_x6: std_logic_vector(17 downto 0);
  signal mux1_y_net_x7: std_logic_vector(17 downto 0);
  signal shift1_op_net_x1: std_logic_vector(17 downto 0);
  signal shift2_op_net_x2: std_logic_vector(17 downto 0);
  signal shift3_op_net_x2: std_logic_vector(17 downto 0);
  signal shift_op_net_x1: std_logic_vector(17 downto 0);

begin
  shift_op_net_x1 <= a;
  shift1_op_net_x1 <= b;
  shift2_op_net_x2 <= c;
  ce_1_sg_x229 <= ce_1;
  clk_1_sg_x229 <= clk_1;
  shift3_op_net_x2 <= d;
  delay_q_net_x6 <= sync_in;
  abcd0 <= bram_data_out_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= bram_data_out_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x7;

  biplex_commutator_01_25d7a63480: entity work.biplex_commutator_01_entity_25d7a63480
    port map (
      aloahi => bram_data_out_net_x6,
      blobhi => bram_data_out_net_x7,
      ce_1 => ce_1_sg_x229,
      clk_1 => clk_1_sg_x229,
      sync_in => delay_q_net_x4,
      ahibhi => mux1_y_net_x6,
      aloblo => bram_data_out_net_x8
    );

  biplex_commutator_23_dec2d919d3: entity work.biplex_commutator_23_entity_dec2d919d3
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x229,
      clk_1 => clk_1_sg_x229,
      sync_in => delay_q_net_x5,
      ahibhi => mux1_y_net_x7,
      aloblo => bram_data_out_net_x9,
      sync_out => delay_q_net_x7
    );

  biplex_commutator_ac_c93b4496aa: entity work.biplex_commutator_ac_entity_c93b4496aa
    port map (
      aloahi => shift_op_net_x1,
      blobhi => shift2_op_net_x2,
      ce_1 => ce_1_sg_x229,
      clk_1 => clk_1_sg_x229,
      sync_in => delay_q_net_x6,
      ahibhi => mux1_y_net_x3,
      aloblo => bram_data_out_net_x6,
      sync_out => delay_q_net_x4
    );

  biplex_commutator_bd_9e10ca7723: entity work.biplex_commutator_ac_entity_c93b4496aa
    port map (
      aloahi => shift1_op_net_x1,
      blobhi => shift3_op_net_x2,
      ce_1 => ce_1_sg_x229,
      clk_1 => clk_1_sg_x229,
      sync_in => delay_q_net_x6,
      ahibhi => mux1_y_net_x5,
      aloblo => bram_data_out_net_x7,
      sync_out => delay_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_24321f7230 is
  port (
    c: in std_logic_vector(17 downto 0); 
    im: out std_logic_vector(8 downto 0); 
    re: out std_logic_vector(8 downto 0)
  );
end c_to_ri_entity_24321f7230;

architecture structural of c_to_ri_entity_24321f7230 is
  signal bram_data_out_net_x9: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(8 downto 0);
  signal slice_im_y_net: std_logic_vector(8 downto 0);
  signal slice_re_y_net: std_logic_vector(8 downto 0);

begin
  bram_data_out_net_x9 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_ceef4fc23d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_ceef4fc23d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 8,
      x_width => 18,
      y_width => 9
    )
    port map (
      x => bram_data_out_net_x9,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 9,
      new_msb => 17,
      x_width => 18,
      y_width => 9
    )
    port map (
      x => bram_data_out_net_x9,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_f99502093e is
  port (
    im: in std_logic_vector(9 downto 0); 
    re: in std_logic_vector(9 downto 0); 
    c: out std_logic_vector(19 downto 0)
  );
end ri_to_c_entity_f99502093e;

architecture structural of ri_to_c_entity_f99502093e is
  signal concat_y_net_x0: std_logic_vector(19 downto 0);
  signal force_im_output_port_net: std_logic_vector(9 downto 0);
  signal force_re_output_port_net: std_logic_vector(9 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(9 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(9 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_9d608cd669
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_e2e786e1ed
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_e2e786e1ed
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant0_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly0"

entity butterfly0_entity_569e5b1d63 is
  port (
    a: in std_logic_vector(17 downto 0); 
    b: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(19 downto 0); 
    a_b_x0: out std_logic_vector(19 downto 0)
  );
end butterfly0_entity_569e5b1d63;

architecture structural of butterfly0_entity_569e5b1d63 is
  signal add_im_s_net: std_logic_vector(9 downto 0);
  signal add_re_s_net: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x11: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x12: std_logic_vector(17 downto 0);
  signal ce_1_sg_x230: std_logic;
  signal clk_1_sg_x230: std_logic;
  signal concat_y_net_x2: std_logic_vector(19 downto 0);
  signal concat_y_net_x3: std_logic_vector(19 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(9 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(9 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(9 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(9 downto 0);
  signal shift0_op_net: std_logic_vector(9 downto 0);
  signal shift1_op_net: std_logic_vector(9 downto 0);
  signal shift2_op_net: std_logic_vector(9 downto 0);
  signal shift3_op_net: std_logic_vector(9 downto 0);
  signal sub_im_s_net: std_logic_vector(9 downto 0);
  signal sub_re_s_net: std_logic_vector(9 downto 0);

begin
  bram_data_out_net_x11 <= a;
  bram_data_out_net_x12 <= b;
  ce_1_sg_x230 <= ce_1;
  clk_1_sg_x230 <= clk_1;
  a_b <= concat_y_net_x2;
  a_b_x0 <= concat_y_net_x3;

  add_im: entity work.addsub_793ae25d23
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x230,
      clk => clk_1_sg_x230,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_793ae25d23
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x230,
      clk => clk_1_sg_x230,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_fd2a8a0e40: entity work.c_to_ri_entity_24321f7230
    port map (
      c => bram_data_out_net_x12,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_24321f7230: entity work.c_to_ri_entity_24321f7230
    port map (
      c => bram_data_out_net_x11,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_35c16d07ce: entity work.ri_to_c_entity_f99502093e
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x3
    );

  ri_to_c_f99502093e: entity work.ri_to_c_entity_f99502093e
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x2
    );

  shift0: entity work.scale_6d627f2811
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_6d627f2811
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_6d627f2811
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_6d627f2811
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_3700bc31ba
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x230,
      clk => clk_1_sg_x230,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_3700bc31ba
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x230,
      clk => clk_1_sg_x230,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly1"

entity butterfly1_entity_4af5ad29f3 is
  port (
    a: in std_logic_vector(17 downto 0); 
    b: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(19 downto 0); 
    a_b_x0: out std_logic_vector(19 downto 0); 
    sync_out: out std_logic
  );
end butterfly1_entity_4af5ad29f3;

architecture structural of butterfly1_entity_4af5ad29f3 is
  signal add_im_s_net: std_logic_vector(9 downto 0);
  signal add_re_s_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x231: std_logic;
  signal clk_1_sg_x231: std_logic;
  signal concat_y_net_x2: std_logic_vector(19 downto 0);
  signal concat_y_net_x3: std_logic_vector(19 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x8: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal mux1_y_net_x10: std_logic_vector(17 downto 0);
  signal mux1_y_net_x9: std_logic_vector(17 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(9 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(9 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(9 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(9 downto 0);
  signal shift0_op_net: std_logic_vector(9 downto 0);
  signal shift1_op_net: std_logic_vector(9 downto 0);
  signal shift2_op_net: std_logic_vector(9 downto 0);
  signal shift3_op_net: std_logic_vector(9 downto 0);
  signal sub_im_s_net: std_logic_vector(9 downto 0);
  signal sub_re_s_net: std_logic_vector(9 downto 0);

begin
  mux1_y_net_x9 <= a;
  mux1_y_net_x10 <= b;
  ce_1_sg_x231 <= ce_1;
  clk_1_sg_x231 <= clk_1;
  delay_q_net_x8 <= sync_in;
  a_b <= concat_y_net_x2;
  a_b_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_793ae25d23
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x231,
      clk => clk_1_sg_x231,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_793ae25d23
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x231,
      clk => clk_1_sg_x231,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_d9ce3abb0f: entity work.c_to_ri_entity_24321f7230
    port map (
      c => mux1_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_2f2e0d0931: entity work.c_to_ri_entity_24321f7230
    port map (
      c => mux1_y_net_x9,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x231,
      clk => clk_1_sg_x231,
      d(0) => delay_q_net_x8,
      en => '1',
      q(0) => delay_q_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_56c5e1e607: entity work.ri_to_c_entity_f99502093e
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x3
    );

  ri_to_c_abdfa683d5: entity work.ri_to_c_entity_f99502093e
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x2
    );

  shift0: entity work.scale_6d627f2811
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_6d627f2811
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_6d627f2811
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_6d627f2811
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_3700bc31ba
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x231,
      clk => clk_1_sg_x231,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_3700bc31ba
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x231,
      clk => clk_1_sg_x231,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_ae915901f8 is
  port (
    c: in std_logic_vector(19 downto 0); 
    im: out std_logic_vector(9 downto 0); 
    re: out std_logic_vector(9 downto 0)
  );
end c_to_ri_entity_ae915901f8;

architecture structural of c_to_ri_entity_ae915901f8 is
  signal concat_y_net_x3: std_logic_vector(19 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(9 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(9 downto 0);
  signal slice_im_y_net: std_logic_vector(9 downto 0);
  signal slice_re_y_net: std_logic_vector(9 downto 0);

begin
  concat_y_net_x3 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_a5a2f0dd62
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_a5a2f0dd62
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 20,
      y_width => 10
    )
    port map (
      x => concat_y_net_x3,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 10,
      new_msb => 19,
      x_width => 20,
      y_width => 10
    )
    port map (
      x => concat_y_net_x3,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_842ef38396 is
  port (
    im: in std_logic_vector(10 downto 0); 
    re: in std_logic_vector(10 downto 0); 
    c: out std_logic_vector(21 downto 0)
  );
end ri_to_c_entity_842ef38396;

architecture structural of ri_to_c_entity_842ef38396 is
  signal concat_y_net_x0: std_logic_vector(21 downto 0);
  signal force_im_output_port_net: std_logic_vector(10 downto 0);
  signal force_re_output_port_net: std_logic_vector(10 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(10 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(10 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_a9f0cfc482
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_d517af3309
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_d517af3309
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant0_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly2"

entity butterfly2_entity_08d11e317a is
  port (
    a: in std_logic_vector(19 downto 0); 
    b: in std_logic_vector(19 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(21 downto 0); 
    a_b_x0: out std_logic_vector(21 downto 0)
  );
end butterfly2_entity_08d11e317a;

architecture structural of butterfly2_entity_08d11e317a is
  signal add_im_s_net: std_logic_vector(10 downto 0);
  signal add_re_s_net: std_logic_vector(10 downto 0);
  signal ce_1_sg_x232: std_logic;
  signal clk_1_sg_x232: std_logic;
  signal concat_y_net_x6: std_logic_vector(19 downto 0);
  signal concat_y_net_x7: std_logic_vector(19 downto 0);
  signal concat_y_net_x8: std_logic_vector(21 downto 0);
  signal concat_y_net_x9: std_logic_vector(21 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(9 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(9 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(9 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(9 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(10 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(10 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(10 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(10 downto 0);
  signal shift0_op_net: std_logic_vector(10 downto 0);
  signal shift1_op_net: std_logic_vector(10 downto 0);
  signal shift2_op_net: std_logic_vector(10 downto 0);
  signal shift3_op_net: std_logic_vector(10 downto 0);
  signal sub_im_s_net: std_logic_vector(10 downto 0);
  signal sub_re_s_net: std_logic_vector(10 downto 0);

begin
  concat_y_net_x6 <= a;
  concat_y_net_x7 <= b;
  ce_1_sg_x232 <= ce_1;
  clk_1_sg_x232 <= clk_1;
  a_b <= concat_y_net_x8;
  a_b_x0 <= concat_y_net_x9;

  add_im: entity work.addsub_74b65e93f7
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x232,
      clk => clk_1_sg_x232,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_74b65e93f7
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x232,
      clk => clk_1_sg_x232,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_4f945b4d8b: entity work.c_to_ri_entity_ae915901f8
    port map (
      c => concat_y_net_x7,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_ae915901f8: entity work.c_to_ri_entity_ae915901f8
    port map (
      c => concat_y_net_x6,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 11,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 11,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 11,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 11,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 11,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 11,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 11,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 11,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_79fb5bd70c: entity work.ri_to_c_entity_842ef38396
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x9
    );

  ri_to_c_842ef38396: entity work.ri_to_c_entity_842ef38396
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x8
    );

  shift0: entity work.scale_1a387a5a22
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_1a387a5a22
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_1a387a5a22
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_1a387a5a22
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_89c5949a28
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x232,
      clk => clk_1_sg_x232,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_89c5949a28
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x232,
      clk => clk_1_sg_x232,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly3j"

entity butterfly3j_entity_223b0a919c is
  port (
    a: in std_logic_vector(19 downto 0); 
    b: in std_logic_vector(19 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(21 downto 0); 
    a_b_x0: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end butterfly3j_entity_223b0a919c;

architecture structural of butterfly3j_entity_223b0a919c is
  signal add_im_s_net: std_logic_vector(10 downto 0);
  signal add_re_s_net: std_logic_vector(10 downto 0);
  signal ce_1_sg_x233: std_logic;
  signal clk_1_sg_x233: std_logic;
  signal concat_y_net_x6: std_logic_vector(19 downto 0);
  signal concat_y_net_x7: std_logic_vector(19 downto 0);
  signal concat_y_net_x8: std_logic_vector(21 downto 0);
  signal concat_y_net_x9: std_logic_vector(21 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(9 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(9 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(9 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(9 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(10 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(10 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(10 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(10 downto 0);
  signal shift0_op_net: std_logic_vector(10 downto 0);
  signal shift1_op_net: std_logic_vector(10 downto 0);
  signal shift2_op_net: std_logic_vector(10 downto 0);
  signal shift3_op_net: std_logic_vector(10 downto 0);
  signal sub_im_s_net: std_logic_vector(10 downto 0);
  signal sub_re_s_net: std_logic_vector(10 downto 0);

begin
  concat_y_net_x6 <= a;
  concat_y_net_x7 <= b;
  ce_1_sg_x233 <= ce_1;
  clk_1_sg_x233 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x8;
  a_b_x0 <= concat_y_net_x9;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_89c5949a28
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x233,
      clk => clk_1_sg_x233,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_74b65e93f7
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x233,
      clk => clk_1_sg_x233,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_d31293e52f: entity work.c_to_ri_entity_ae915901f8
    port map (
      c => concat_y_net_x7,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_75666b9a74: entity work.c_to_ri_entity_ae915901f8
    port map (
      c => concat_y_net_x6,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x233,
      clk => clk_1_sg_x233,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 11,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 11,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 11,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 11,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 11,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 11,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 11,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 11,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_605ca92037: entity work.ri_to_c_entity_842ef38396
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x9
    );

  ri_to_c_aeda0a50fe: entity work.ri_to_c_entity_842ef38396
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x8
    );

  shift0: entity work.scale_1a387a5a22
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_1a387a5a22
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_1a387a5a22
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_1a387a5a22
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_74b65e93f7
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x233,
      clk => clk_1_sg_x233,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_89c5949a28
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x233,
      clk => clk_1_sg_x233,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1/r4_butterfly"

entity r4_butterfly_entity_6d51a4a8c9 is
  port (
    a_in: in std_logic_vector(17 downto 0); 
    b_in: in std_logic_vector(17 downto 0); 
    c_in: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(17 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(21 downto 0); 
    b_out: out std_logic_vector(21 downto 0); 
    c_out: out std_logic_vector(21 downto 0); 
    d_out: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end r4_butterfly_entity_6d51a4a8c9;

architecture structural of r4_butterfly_entity_6d51a4a8c9 is
  signal bram_data_out_net_x13: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x14: std_logic_vector(17 downto 0);
  signal ce_1_sg_x234: std_logic;
  signal clk_1_sg_x234: std_logic;
  signal concat_y_net_x14: std_logic_vector(21 downto 0);
  signal concat_y_net_x15: std_logic_vector(21 downto 0);
  signal concat_y_net_x16: std_logic_vector(21 downto 0);
  signal concat_y_net_x17: std_logic_vector(21 downto 0);
  signal concat_y_net_x6: std_logic_vector(19 downto 0);
  signal concat_y_net_x7: std_logic_vector(19 downto 0);
  signal concat_y_net_x8: std_logic_vector(19 downto 0);
  signal concat_y_net_x9: std_logic_vector(19 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x10: std_logic;
  signal delay_q_net_x9: std_logic;
  signal mux1_y_net_x11: std_logic_vector(17 downto 0);
  signal mux1_y_net_x12: std_logic_vector(17 downto 0);

begin
  bram_data_out_net_x13 <= a_in;
  mux1_y_net_x11 <= b_in;
  bram_data_out_net_x14 <= c_in;
  ce_1_sg_x234 <= ce_1;
  clk_1_sg_x234 <= clk_1;
  mux1_y_net_x12 <= d_in;
  delay_q_net_x9 <= sync_in;
  a_out <= concat_y_net_x14;
  b_out <= concat_y_net_x15;
  c_out <= concat_y_net_x16;
  d_out <= concat_y_net_x17;
  sync_out <= delay_q_net_x10;

  butterfly0_569e5b1d63: entity work.butterfly0_entity_569e5b1d63
    port map (
      a => bram_data_out_net_x13,
      b => bram_data_out_net_x14,
      ce_1 => ce_1_sg_x234,
      clk_1 => clk_1_sg_x234,
      a_b => concat_y_net_x6,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_4af5ad29f3: entity work.butterfly1_entity_4af5ad29f3
    port map (
      a => mux1_y_net_x11,
      b => mux1_y_net_x12,
      ce_1 => ce_1_sg_x234,
      clk_1 => clk_1_sg_x234,
      sync_in => delay_q_net_x9,
      a_b => concat_y_net_x8,
      a_b_x0 => concat_y_net_x9,
      sync_out => delay_q_net_x1
    );

  butterfly2_08d11e317a: entity work.butterfly2_entity_08d11e317a
    port map (
      a => concat_y_net_x6,
      b => concat_y_net_x8,
      ce_1 => ce_1_sg_x234,
      clk_1 => clk_1_sg_x234,
      a_b => concat_y_net_x14,
      a_b_x0 => concat_y_net_x15
    );

  butterfly3j_223b0a919c: entity work.butterfly3j_entity_223b0a919c
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x9,
      ce_1 => ce_1_sg_x234,
      clk_1 => clk_1_sg_x234,
      sync_in => delay_q_net_x1,
      a_b => concat_y_net_x16,
      a_b_x0 => concat_y_net_x17,
      sync_out => delay_q_net_x10
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_1"

entity r4_dit_stage_1_entity_6507e08cde is
  port (
    a_in: in std_logic_vector(17 downto 0); 
    b_in: in std_logic_vector(17 downto 0); 
    c_in: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(17 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(21 downto 0); 
    b_out: out std_logic_vector(21 downto 0); 
    c_out: out std_logic_vector(21 downto 0); 
    d_out: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end r4_dit_stage_1_entity_6507e08cde;

architecture structural of r4_dit_stage_1_entity_6507e08cde is
  signal bram_data_out_net_x13: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x14: std_logic_vector(17 downto 0);
  signal ce_1_sg_x235: std_logic;
  signal clk_1_sg_x235: std_logic;
  signal concat_y_net_x18: std_logic_vector(21 downto 0);
  signal concat_y_net_x19: std_logic_vector(21 downto 0);
  signal concat_y_net_x20: std_logic_vector(21 downto 0);
  signal concat_y_net_x21: std_logic_vector(21 downto 0);
  signal delay_q_net_x11: std_logic;
  signal delay_q_net_x12: std_logic;
  signal delay_q_net_x9: std_logic;
  signal mux1_y_net_x11: std_logic_vector(17 downto 0);
  signal mux1_y_net_x12: std_logic_vector(17 downto 0);
  signal shift1_op_net_x2: std_logic_vector(17 downto 0);
  signal shift2_op_net_x3: std_logic_vector(17 downto 0);
  signal shift3_op_net_x3: std_logic_vector(17 downto 0);
  signal shift_op_net_x2: std_logic_vector(17 downto 0);

begin
  shift_op_net_x2 <= a_in;
  shift1_op_net_x2 <= b_in;
  shift2_op_net_x3 <= c_in;
  ce_1_sg_x235 <= ce_1;
  clk_1_sg_x235 <= clk_1;
  shift3_op_net_x3 <= d_in;
  delay_q_net_x11 <= sync_in;
  a_out <= concat_y_net_x18;
  b_out <= concat_y_net_x19;
  c_out <= concat_y_net_x20;
  d_out <= concat_y_net_x21;
  sync_out <= delay_q_net_x12;

  quadplex_commutator_6aa00d72e4: entity work.quadplex_commutator_entity_6aa00d72e4
    port map (
      a => shift_op_net_x2,
      b => shift1_op_net_x2,
      c => shift2_op_net_x3,
      ce_1 => ce_1_sg_x235,
      clk_1 => clk_1_sg_x235,
      d => shift3_op_net_x3,
      sync_in => delay_q_net_x11,
      abcd0 => bram_data_out_net_x13,
      abcd1 => mux1_y_net_x11,
      abcd2 => bram_data_out_net_x14,
      abcd3 => mux1_y_net_x12,
      sync_out => delay_q_net_x9
    );

  r4_butterfly_6d51a4a8c9: entity work.r4_butterfly_entity_6d51a4a8c9
    port map (
      a_in => bram_data_out_net_x13,
      b_in => mux1_y_net_x11,
      c_in => bram_data_out_net_x14,
      ce_1 => ce_1_sg_x235,
      clk_1 => clk_1_sg_x235,
      d_in => mux1_y_net_x12,
      sync_in => delay_q_net_x9,
      a_out => concat_y_net_x18,
      b_out => concat_y_net_x19,
      c_out => concat_y_net_x20,
      d_out => concat_y_net_x21,
      sync_out => delay_q_net_x12
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_01/delay_b/c_to_ri"

entity c_to_ri_entity_ac0d484897 is
  port (
    c: in std_logic_vector(21 downto 0); 
    im: out std_logic_vector(10 downto 0); 
    re: out std_logic_vector(10 downto 0)
  );
end c_to_ri_entity_ac0d484897;

architecture structural of c_to_ri_entity_ac0d484897 is
  signal concat_y_net_x0: std_logic_vector(21 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(10 downto 0);
  signal slice_im_y_net: std_logic_vector(10 downto 0);
  signal slice_re_y_net: std_logic_vector(10 downto 0);

begin
  concat_y_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_41416f6188
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_41416f6188
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 10,
      x_width => 22,
      y_width => 11
    )
    port map (
      x => concat_y_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 11,
      new_msb => 21,
      x_width => 22,
      y_width => 11
    )
    port map (
      x => concat_y_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_01/delay_b/delay_im"

entity delay_im_entity_cd50350364 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(10 downto 0); 
    out_x0: out std_logic_vector(10 downto 0)
  );
end delay_im_entity_cd50350364;

architecture structural of delay_im_entity_cd50350364 is
  signal bram_data_out_net_x0: std_logic_vector(10 downto 0);
  signal ce_1_sg_x236: std_logic;
  signal clk_1_sg_x236: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(5 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(10 downto 0);

begin
  ce_1_sg_x236 <= ce_1;
  clk_1_sg_x236 <= clk_1;
  force_im_output_port_net_x1 <= in_x0;
  out_x0 <= bram_data_out_net_x0;

  bram: entity work.xlspram
    generic map (
      c_address_width => 6,
      c_width => 11,
      core_name0 => "bmg_24_vx5_94232660d90f6688",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x236,
      clk => clk_1_sg_x236,
      data_in => force_im_output_port_net_x1,
      en => "1",
      rst => "0",
      we(0) => constant_op_net,
      data_out => bram_data_out_net_x0
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 62,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_fe346e03af2452eb",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 6
    )
    port map (
      ce => ce_1_sg_x236,
      clk => clk_1_sg_x236,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_4711932f41 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(21 downto 0); 
    out_x0: out std_logic_vector(21 downto 0)
  );
end delay_b_entity_4711932f41;

architecture structural of delay_b_entity_4711932f41 is
  signal bram_data_out_net_x2: std_logic_vector(10 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(10 downto 0);
  signal ce_1_sg_x238: std_logic;
  signal clk_1_sg_x238: std_logic;
  signal concat_y_net_x2: std_logic_vector(21 downto 0);
  signal concat_y_net_x3: std_logic_vector(21 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(10 downto 0);

begin
  ce_1_sg_x238 <= ce_1;
  clk_1_sg_x238 <= clk_1;
  concat_y_net_x2 <= in_x0;
  out_x0 <= concat_y_net_x3;

  c_to_ri_ac0d484897: entity work.c_to_ri_entity_ac0d484897
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  delay_im_cd50350364: entity work.delay_im_entity_cd50350364
    port map (
      ce_1 => ce_1_sg_x238,
      clk_1 => clk_1_sg_x238,
      in_x0 => force_im_output_port_net_x1,
      out_x0 => bram_data_out_net_x2
    );

  delay_re_a305e9dbea: entity work.delay_im_entity_cd50350364
    port map (
      ce_1 => ce_1_sg_x238,
      clk_1 => clk_1_sg_x238,
      in_x0 => force_re_output_port_net_x1,
      out_x0 => bram_data_out_net_x3
    );

  ri_to_c_61f2f13c6c: entity work.ri_to_c_entity_842ef38396
    port map (
      im => bram_data_out_net_x2,
      re => bram_data_out_net_x3,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_7842ff79cc is
  port (
    aloahi: in std_logic_vector(21 downto 0); 
    blobhi: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(21 downto 0); 
    aloblo: out std_logic_vector(21 downto 0)
  );
end biplex_commutator_01_entity_7842ff79cc;

architecture structural of biplex_commutator_01_entity_7842ff79cc is
  signal ce_1_sg_x242: std_logic;
  signal clk_1_sg_x242: std_logic;
  signal concat_y_net_x0: std_logic_vector(21 downto 0);
  signal concat_y_net_x3: std_logic_vector(21 downto 0);
  signal concat_y_net_x4: std_logic_vector(21 downto 0);
  signal concat_y_net_x5: std_logic_vector(21 downto 0);
  signal counter_op_net: std_logic_vector(6 downto 0);
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(21 downto 0);
  signal mux_y_net_x1: std_logic_vector(21 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x0 <= aloahi;
  concat_y_net_x4 <= blobhi;
  ce_1_sg_x242 <= ce_1;
  clk_1_sg_x242 <= clk_1;
  delay_q_net_x0 <= sync_in;
  ahibhi <= mux1_y_net_x0;
  aloblo <= concat_y_net_x5;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_722dc5ef3883365e",
      op_arith => xlUnsigned,
      op_width => 7
    )
    port map (
      ce => ce_1_sg_x242,
      clk => clk_1_sg_x242,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_4711932f41: entity work.delay_b_entity_4711932f41
    port map (
      ce_1 => ce_1_sg_x242,
      clk_1 => clk_1_sg_x242,
      in_x0 => concat_y_net_x4,
      out_x0 => concat_y_net_x3
    );

  delay_lo_829ec48d03: entity work.delay_b_entity_4711932f41
    port map (
      ce_1 => ce_1_sg_x242,
      clk_1 => clk_1_sg_x242,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x5
    );

  mux: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x242,
      clk => clk_1_sg_x242,
      clr => '0',
      d0 => concat_y_net_x0,
      d1 => concat_y_net_x3,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x242,
      clk => clk_1_sg_x242,
      clr => '0',
      d0 => concat_y_net_x3,
      d1 => concat_y_net_x0,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x0
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 6,
      x_width => 7,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_35d343ec67 is
  port (
    aloahi: in std_logic_vector(21 downto 0); 
    blobhi: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(21 downto 0); 
    aloblo: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_23_entity_35d343ec67;

architecture structural of biplex_commutator_23_entity_35d343ec67 is
  signal ce_1_sg_x249: std_logic;
  signal clk_1_sg_x249: std_logic;
  signal concat_y_net_x1: std_logic_vector(21 downto 0);
  signal concat_y_net_x3: std_logic_vector(21 downto 0);
  signal counter_op_net: std_logic_vector(6 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x2: std_logic_vector(21 downto 0);
  signal mux1_y_net_x3: std_logic_vector(21 downto 0);
  signal mux1_y_net_x4: std_logic_vector(21 downto 0);
  signal mux_y_net_x1: std_logic_vector(21 downto 0);
  signal top_bit_y_net: std_logic;

begin
  mux1_y_net_x2 <= aloahi;
  mux1_y_net_x3 <= blobhi;
  ce_1_sg_x249 <= ce_1;
  clk_1_sg_x249 <= clk_1;
  delay_q_net_x1 <= sync_in;
  ahibhi <= mux1_y_net_x4;
  aloblo <= concat_y_net_x3;
  sync_out <= delay_q_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_722dc5ef3883365e",
      op_arith => xlUnsigned,
      op_width => 7
    )
    port map (
      ce => ce_1_sg_x249,
      clk => clk_1_sg_x249,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x1,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 65,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x249,
      clk => clk_1_sg_x249,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_fe43a221ef: entity work.delay_b_entity_4711932f41
    port map (
      ce_1 => ce_1_sg_x249,
      clk_1 => clk_1_sg_x249,
      in_x0 => mux1_y_net_x3,
      out_x0 => concat_y_net_x1
    );

  delay_lo_fe4c15ef11: entity work.delay_b_entity_4711932f41
    port map (
      ce_1 => ce_1_sg_x249,
      clk_1 => clk_1_sg_x249,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x3
    );

  mux: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x249,
      clk => clk_1_sg_x249,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => concat_y_net_x1,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x249,
      clk => clk_1_sg_x249,
      clr => '0',
      d0 => concat_y_net_x1,
      d1 => mux1_y_net_x2,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x4
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 6,
      x_width => 7,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_ac/delay_b/delay_im"

entity delay_im_entity_4c807b4b4f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(10 downto 0); 
    out_x0: out std_logic_vector(10 downto 0)
  );
end delay_im_entity_4c807b4b4f;

architecture structural of delay_im_entity_4c807b4b4f is
  signal bram_data_out_net_x0: std_logic_vector(10 downto 0);
  signal ce_1_sg_x250: std_logic;
  signal clk_1_sg_x250: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(6 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(10 downto 0);

begin
  ce_1_sg_x250 <= ce_1;
  clk_1_sg_x250 <= clk_1;
  force_im_output_port_net_x1 <= in_x0;
  out_x0 <= bram_data_out_net_x0;

  bram: entity work.xlspram
    generic map (
      c_address_width => 7,
      c_width => 11,
      core_name0 => "bmg_24_vx5_491b66ad487fb1cf",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x250,
      clk => clk_1_sg_x250,
      data_in => force_im_output_port_net_x1,
      en => "1",
      rst => "0",
      we(0) => constant_op_net,
      data_out => bram_data_out_net_x0
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 126,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_722dc5ef3883365e",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 7
    )
    port map (
      ce => ce_1_sg_x250,
      clk => clk_1_sg_x250,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_a708570f23 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(21 downto 0); 
    out_x0: out std_logic_vector(21 downto 0)
  );
end delay_b_entity_a708570f23;

architecture structural of delay_b_entity_a708570f23 is
  signal bram_data_out_net_x2: std_logic_vector(10 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(10 downto 0);
  signal ce_1_sg_x252: std_logic;
  signal clk_1_sg_x252: std_logic;
  signal concat_y_net_x1: std_logic_vector(21 downto 0);
  signal concat_y_net_x22: std_logic_vector(21 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(10 downto 0);

begin
  ce_1_sg_x252 <= ce_1;
  clk_1_sg_x252 <= clk_1;
  concat_y_net_x22 <= in_x0;
  out_x0 <= concat_y_net_x1;

  c_to_ri_24556a14da: entity work.c_to_ri_entity_ac0d484897
    port map (
      c => concat_y_net_x22,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  delay_im_4c807b4b4f: entity work.delay_im_entity_4c807b4b4f
    port map (
      ce_1 => ce_1_sg_x252,
      clk_1 => clk_1_sg_x252,
      in_x0 => force_im_output_port_net_x1,
      out_x0 => bram_data_out_net_x2
    );

  delay_re_5a12da58de: entity work.delay_im_entity_4c807b4b4f
    port map (
      ce_1 => ce_1_sg_x252,
      clk_1 => clk_1_sg_x252,
      in_x0 => force_re_output_port_net_x1,
      out_x0 => bram_data_out_net_x3
    );

  ri_to_c_b84b6c60ac: entity work.ri_to_c_entity_842ef38396
    port map (
      im => bram_data_out_net_x2,
      re => bram_data_out_net_x3,
      c => concat_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_40537a2adf is
  port (
    aloahi: in std_logic_vector(21 downto 0); 
    blobhi: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(21 downto 0); 
    aloblo: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_ac_entity_40537a2adf;

architecture structural of biplex_commutator_ac_entity_40537a2adf is
  signal ce_1_sg_x256: std_logic;
  signal clk_1_sg_x256: std_logic;
  signal concat_y_net_x1: std_logic_vector(21 downto 0);
  signal concat_y_net_x19: std_logic_vector(21 downto 0);
  signal concat_y_net_x23: std_logic_vector(21 downto 0);
  signal concat_y_net_x3: std_logic_vector(21 downto 0);
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x13: std_logic;
  signal mux1_y_net_x3: std_logic_vector(21 downto 0);
  signal mux_y_net_x1: std_logic_vector(21 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x19 <= aloahi;
  concat_y_net_x23 <= blobhi;
  ce_1_sg_x256 <= ce_1;
  clk_1_sg_x256 <= clk_1;
  delay_q_net_x13 <= sync_in;
  ahibhi <= mux1_y_net_x3;
  aloblo <= concat_y_net_x3;
  sync_out <= delay_q_net_x1;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x13,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 129,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
      d(0) => delay_q_net_x13,
      en => '1',
      q(0) => delay_q_net_x1
    );

  delay_b_a708570f23: entity work.delay_b_entity_a708570f23
    port map (
      ce_1 => ce_1_sg_x256,
      clk_1 => clk_1_sg_x256,
      in_x0 => concat_y_net_x23,
      out_x0 => concat_y_net_x1
    );

  delay_lo_7ff807c024: entity work.delay_b_entity_a708570f23
    port map (
      ce_1 => ce_1_sg_x256,
      clk_1 => clk_1_sg_x256,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x3
    );

  mux: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
      clr => '0',
      d0 => concat_y_net_x19,
      d1 => concat_y_net_x1,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
      clr => '0',
      d0 => concat_y_net_x1,
      d1 => concat_y_net_x19,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x3
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 7,
      new_msb => 7,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/quadplex_commutator"

entity quadplex_commutator_entity_96d7341a91 is
  port (
    a: in std_logic_vector(21 downto 0); 
    b: in std_logic_vector(21 downto 0); 
    c: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(21 downto 0); 
    sync_in: in std_logic; 
    abcd0: out std_logic_vector(21 downto 0); 
    abcd1: out std_logic_vector(21 downto 0); 
    abcd2: out std_logic_vector(21 downto 0); 
    abcd3: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end quadplex_commutator_entity_96d7341a91;

architecture structural of quadplex_commutator_entity_96d7341a91 is
  signal ce_1_sg_x264: std_logic;
  signal clk_1_sg_x264: std_logic;
  signal concat_y_net_x21: std_logic_vector(21 downto 0);
  signal concat_y_net_x25: std_logic_vector(21 downto 0);
  signal concat_y_net_x26: std_logic_vector(21 downto 0);
  signal concat_y_net_x27: std_logic_vector(21 downto 0);
  signal concat_y_net_x28: std_logic_vector(21 downto 0);
  signal concat_y_net_x4: std_logic_vector(21 downto 0);
  signal concat_y_net_x6: std_logic_vector(21 downto 0);
  signal concat_y_net_x7: std_logic_vector(21 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x15: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mux1_y_net_x3: std_logic_vector(21 downto 0);
  signal mux1_y_net_x5: std_logic_vector(21 downto 0);
  signal mux1_y_net_x6: std_logic_vector(21 downto 0);
  signal mux1_y_net_x7: std_logic_vector(21 downto 0);

begin
  concat_y_net_x21 <= a;
  concat_y_net_x25 <= b;
  concat_y_net_x26 <= c;
  ce_1_sg_x264 <= ce_1;
  clk_1_sg_x264 <= clk_1;
  concat_y_net_x27 <= d;
  delay_q_net_x15 <= sync_in;
  abcd0 <= concat_y_net_x28;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= concat_y_net_x6;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x4;

  biplex_commutator_01_7842ff79cc: entity work.biplex_commutator_01_entity_7842ff79cc
    port map (
      aloahi => concat_y_net_x4,
      blobhi => concat_y_net_x7,
      ce_1 => ce_1_sg_x264,
      clk_1 => clk_1_sg_x264,
      sync_in => delay_q_net_x1,
      ahibhi => mux1_y_net_x6,
      aloblo => concat_y_net_x28
    );

  biplex_commutator_23_35d343ec67: entity work.biplex_commutator_23_entity_35d343ec67
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x264,
      clk_1 => clk_1_sg_x264,
      sync_in => delay_q_net_x3,
      ahibhi => mux1_y_net_x7,
      aloblo => concat_y_net_x6,
      sync_out => delay_q_net_x4
    );

  biplex_commutator_ac_40537a2adf: entity work.biplex_commutator_ac_entity_40537a2adf
    port map (
      aloahi => concat_y_net_x21,
      blobhi => concat_y_net_x26,
      ce_1 => ce_1_sg_x264,
      clk_1 => clk_1_sg_x264,
      sync_in => delay_q_net_x15,
      ahibhi => mux1_y_net_x3,
      aloblo => concat_y_net_x4,
      sync_out => delay_q_net_x1
    );

  biplex_commutator_bd_33deb1729f: entity work.biplex_commutator_ac_entity_40537a2adf
    port map (
      aloahi => concat_y_net_x25,
      blobhi => concat_y_net_x27,
      ce_1 => ce_1_sg_x264,
      clk_1 => clk_1_sg_x264,
      sync_in => delay_q_net_x15,
      ahibhi => mux1_y_net_x5,
      aloblo => concat_y_net_x7,
      sync_out => delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_10841cf09a is
  port (
    im: in std_logic_vector(11 downto 0); 
    re: in std_logic_vector(11 downto 0); 
    c: out std_logic_vector(23 downto 0)
  );
end ri_to_c_entity_10841cf09a;

architecture structural of ri_to_c_entity_10841cf09a is
  signal concat_y_net_x0: std_logic_vector(23 downto 0);
  signal force_im_output_port_net: std_logic_vector(11 downto 0);
  signal force_re_output_port_net: std_logic_vector(11 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(11 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(11 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_6188124172
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_a106f99236
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_a106f99236
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant0_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly0"

entity butterfly0_entity_b1172a4175 is
  port (
    a: in std_logic_vector(21 downto 0); 
    b: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(23 downto 0); 
    a_b_x0: out std_logic_vector(23 downto 0)
  );
end butterfly0_entity_b1172a4175;

architecture structural of butterfly0_entity_b1172a4175 is
  signal add_im_s_net: std_logic_vector(11 downto 0);
  signal add_re_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x265: std_logic;
  signal clk_1_sg_x265: std_logic;
  signal concat_y_net_x3: std_logic_vector(21 downto 0);
  signal concat_y_net_x4: std_logic_vector(23 downto 0);
  signal concat_y_net_x5: std_logic_vector(23 downto 0);
  signal delay1_q_net_x1: std_logic_vector(21 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(10 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(10 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(11 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(11 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(11 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(11 downto 0);
  signal shift0_op_net: std_logic_vector(11 downto 0);
  signal shift1_op_net: std_logic_vector(11 downto 0);
  signal shift2_op_net: std_logic_vector(11 downto 0);
  signal shift3_op_net: std_logic_vector(11 downto 0);
  signal sub_im_s_net: std_logic_vector(11 downto 0);
  signal sub_re_s_net: std_logic_vector(11 downto 0);

begin
  delay1_q_net_x1 <= a;
  concat_y_net_x3 <= b;
  ce_1_sg_x265 <= ce_1;
  clk_1_sg_x265 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_470ffe01d4
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x265,
      clk => clk_1_sg_x265,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_470ffe01d4
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x265,
      clk => clk_1_sg_x265,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_777e0d3dc3: entity work.c_to_ri_entity_ac0d484897
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_71dcbaca41: entity work.c_to_ri_entity_ac0d484897
    port map (
      c => delay1_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 12,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 12,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 12,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 12,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 12,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 12,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 12,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 12,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_a3697f1a23: entity work.ri_to_c_entity_10841cf09a
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_10841cf09a: entity work.ri_to_c_entity_10841cf09a
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x4
    );

  shift0: entity work.scale_38e99696aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_38e99696aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_38e99696aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_38e99696aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_388a97573b
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x265,
      clk => clk_1_sg_x265,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_388a97573b
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x265,
      clk => clk_1_sg_x265,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly1"

entity butterfly1_entity_3581456fac is
  port (
    a: in std_logic_vector(21 downto 0); 
    b: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(23 downto 0); 
    a_b_x0: out std_logic_vector(23 downto 0); 
    sync_out: out std_logic
  );
end butterfly1_entity_3581456fac;

architecture structural of butterfly1_entity_3581456fac is
  signal add_im_s_net: std_logic_vector(11 downto 0);
  signal add_re_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x266: std_logic;
  signal clk_1_sg_x266: std_logic;
  signal concat_y_net_x4: std_logic_vector(21 downto 0);
  signal concat_y_net_x5: std_logic_vector(21 downto 0);
  signal concat_y_net_x6: std_logic_vector(23 downto 0);
  signal concat_y_net_x7: std_logic_vector(23 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(10 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(10 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(11 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(11 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(11 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(11 downto 0);
  signal shift0_op_net: std_logic_vector(11 downto 0);
  signal shift1_op_net: std_logic_vector(11 downto 0);
  signal shift2_op_net: std_logic_vector(11 downto 0);
  signal shift3_op_net: std_logic_vector(11 downto 0);
  signal sub_im_s_net: std_logic_vector(11 downto 0);
  signal sub_re_s_net: std_logic_vector(11 downto 0);

begin
  concat_y_net_x4 <= a;
  concat_y_net_x5 <= b;
  ce_1_sg_x266 <= ce_1;
  clk_1_sg_x266 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_470ffe01d4
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x266,
      clk => clk_1_sg_x266,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_470ffe01d4
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x266,
      clk => clk_1_sg_x266,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_7018414991: entity work.c_to_ri_entity_ac0d484897
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_f87688c354: entity work.c_to_ri_entity_ac0d484897
    port map (
      c => concat_y_net_x4,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x266,
      clk => clk_1_sg_x266,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 12,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 12,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 12,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 12,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 12,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 12,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 12,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 12,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_904e686e98: entity work.ri_to_c_entity_10841cf09a
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_92ab4fbbfc: entity work.ri_to_c_entity_10841cf09a
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x6
    );

  shift0: entity work.scale_38e99696aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_38e99696aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_38e99696aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_38e99696aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_388a97573b
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x266,
      clk => clk_1_sg_x266,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_388a97573b
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x266,
      clk => clk_1_sg_x266,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_68e2f93da0 is
  port (
    c: in std_logic_vector(23 downto 0); 
    im: out std_logic_vector(11 downto 0); 
    re: out std_logic_vector(11 downto 0)
  );
end c_to_ri_entity_68e2f93da0;

architecture structural of c_to_ri_entity_68e2f93da0 is
  signal concat_y_net_x5: std_logic_vector(23 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(11 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(11 downto 0);
  signal slice_im_y_net: std_logic_vector(11 downto 0);
  signal slice_re_y_net: std_logic_vector(11 downto 0);

begin
  concat_y_net_x5 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_8f5500aea5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_8f5500aea5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 11,
      x_width => 24,
      y_width => 12
    )
    port map (
      x => concat_y_net_x5,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 12,
      new_msb => 23,
      x_width => 24,
      y_width => 12
    )
    port map (
      x => concat_y_net_x5,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_9eb71cdd6c is
  port (
    im: in std_logic_vector(12 downto 0); 
    re: in std_logic_vector(12 downto 0); 
    c: out std_logic_vector(25 downto 0)
  );
end ri_to_c_entity_9eb71cdd6c;

architecture structural of ri_to_c_entity_9eb71cdd6c is
  signal concat_y_net_x0: std_logic_vector(25 downto 0);
  signal force_im_output_port_net: std_logic_vector(12 downto 0);
  signal force_re_output_port_net: std_logic_vector(12 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(12 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(12 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_4720648850
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_18554b6b75
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_18554b6b75
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant0_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly2"

entity butterfly2_entity_8d4611b7f8 is
  port (
    a: in std_logic_vector(23 downto 0); 
    b: in std_logic_vector(23 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(25 downto 0); 
    a_b_x0: out std_logic_vector(25 downto 0)
  );
end butterfly2_entity_8d4611b7f8;

architecture structural of butterfly2_entity_8d4611b7f8 is
  signal add_im_s_net: std_logic_vector(12 downto 0);
  signal add_re_s_net: std_logic_vector(12 downto 0);
  signal ce_1_sg_x267: std_logic;
  signal clk_1_sg_x267: std_logic;
  signal concat_y_net_x10: std_logic_vector(23 downto 0);
  signal concat_y_net_x11: std_logic_vector(25 downto 0);
  signal concat_y_net_x12: std_logic_vector(25 downto 0);
  signal concat_y_net_x9: std_logic_vector(23 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(11 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(11 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(11 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(11 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(12 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(12 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(12 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(12 downto 0);
  signal shift0_op_net: std_logic_vector(12 downto 0);
  signal shift1_op_net: std_logic_vector(12 downto 0);
  signal shift2_op_net: std_logic_vector(12 downto 0);
  signal shift3_op_net: std_logic_vector(12 downto 0);
  signal sub_im_s_net: std_logic_vector(12 downto 0);
  signal sub_re_s_net: std_logic_vector(12 downto 0);

begin
  concat_y_net_x9 <= a;
  concat_y_net_x10 <= b;
  ce_1_sg_x267 <= ce_1;
  clk_1_sg_x267 <= clk_1;
  a_b <= concat_y_net_x11;
  a_b_x0 <= concat_y_net_x12;

  add_im: entity work.addsub_ed74d532a0
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x267,
      clk => clk_1_sg_x267,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_ed74d532a0
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x267,
      clk => clk_1_sg_x267,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_f5d6b8f6a2: entity work.c_to_ri_entity_68e2f93da0
    port map (
      c => concat_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_68e2f93da0: entity work.c_to_ri_entity_68e2f93da0
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 13,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 13,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 13,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 13,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_87e5cb9c6b: entity work.ri_to_c_entity_9eb71cdd6c
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x12
    );

  ri_to_c_9eb71cdd6c: entity work.ri_to_c_entity_9eb71cdd6c
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x11
    );

  shift0: entity work.scale_d11c4b5145
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_d11c4b5145
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_d11c4b5145
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_d11c4b5145
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_f11535f968
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x267,
      clk => clk_1_sg_x267,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f11535f968
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x267,
      clk => clk_1_sg_x267,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly3j"

entity butterfly3j_entity_328bf3481d is
  port (
    a: in std_logic_vector(23 downto 0); 
    b: in std_logic_vector(23 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(25 downto 0); 
    a_b_x0: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end butterfly3j_entity_328bf3481d;

architecture structural of butterfly3j_entity_328bf3481d is
  signal add_im_s_net: std_logic_vector(12 downto 0);
  signal add_re_s_net: std_logic_vector(12 downto 0);
  signal ce_1_sg_x268: std_logic;
  signal clk_1_sg_x268: std_logic;
  signal concat_y_net_x10: std_logic_vector(25 downto 0);
  signal concat_y_net_x11: std_logic_vector(25 downto 0);
  signal concat_y_net_x7: std_logic_vector(23 downto 0);
  signal concat_y_net_x9: std_logic_vector(23 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(11 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(11 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(11 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(11 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(12 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(12 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(12 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(12 downto 0);
  signal shift0_op_net: std_logic_vector(12 downto 0);
  signal shift1_op_net: std_logic_vector(12 downto 0);
  signal shift2_op_net: std_logic_vector(12 downto 0);
  signal shift3_op_net: std_logic_vector(12 downto 0);
  signal sub_im_s_net: std_logic_vector(12 downto 0);
  signal sub_re_s_net: std_logic_vector(12 downto 0);

begin
  concat_y_net_x7 <= a;
  concat_y_net_x9 <= b;
  ce_1_sg_x268 <= ce_1;
  clk_1_sg_x268 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x10;
  a_b_x0 <= concat_y_net_x11;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_f11535f968
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x268,
      clk => clk_1_sg_x268,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_ed74d532a0
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x268,
      clk => clk_1_sg_x268,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_959b0e254a: entity work.c_to_ri_entity_68e2f93da0
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_55cddcbd61: entity work.c_to_ri_entity_68e2f93da0
    port map (
      c => concat_y_net_x7,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x268,
      clk => clk_1_sg_x268,
      d(0) => delay_q_net_x3,
      en => '1',
      q(0) => delay_q_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 13,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 13,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 13,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 13,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_e3c7b791cf: entity work.ri_to_c_entity_9eb71cdd6c
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x11
    );

  ri_to_c_796f4b6fba: entity work.ri_to_c_entity_9eb71cdd6c
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x10
    );

  shift0: entity work.scale_d11c4b5145
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_d11c4b5145
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_d11c4b5145
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_d11c4b5145
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_ed74d532a0
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x268,
      clk => clk_1_sg_x268,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f11535f968
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x268,
      clk => clk_1_sg_x268,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_butterfly"

entity r4_butterfly_entity_8a62a395c7 is
  port (
    a_in: in std_logic_vector(21 downto 0); 
    b_in: in std_logic_vector(21 downto 0); 
    c_in: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(21 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(25 downto 0); 
    b_out: out std_logic_vector(25 downto 0); 
    c_out: out std_logic_vector(25 downto 0); 
    d_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end r4_butterfly_entity_8a62a395c7;

architecture structural of r4_butterfly_entity_8a62a395c7 is
  signal ce_1_sg_x269: std_logic;
  signal clk_1_sg_x269: std_logic;
  signal concat_y_net_x10: std_logic_vector(23 downto 0);
  signal concat_y_net_x11: std_logic_vector(23 downto 0);
  signal concat_y_net_x16: std_logic_vector(21 downto 0);
  signal concat_y_net_x17: std_logic_vector(21 downto 0);
  signal concat_y_net_x18: std_logic_vector(21 downto 0);
  signal concat_y_net_x19: std_logic_vector(25 downto 0);
  signal concat_y_net_x20: std_logic_vector(25 downto 0);
  signal concat_y_net_x21: std_logic_vector(25 downto 0);
  signal concat_y_net_x22: std_logic_vector(25 downto 0);
  signal concat_y_net_x7: std_logic_vector(23 downto 0);
  signal concat_y_net_x9: std_logic_vector(23 downto 0);
  signal delay1_q_net_x2: std_logic_vector(21 downto 0);
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;

begin
  delay1_q_net_x2 <= a_in;
  concat_y_net_x16 <= b_in;
  concat_y_net_x17 <= c_in;
  ce_1_sg_x269 <= ce_1;
  clk_1_sg_x269 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  butterfly0_b1172a4175: entity work.butterfly0_entity_b1172a4175
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x17,
      ce_1 => ce_1_sg_x269,
      clk_1 => clk_1_sg_x269,
      a_b => concat_y_net_x9,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_3581456fac: entity work.butterfly1_entity_3581456fac
    port map (
      a => concat_y_net_x16,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x269,
      clk_1 => clk_1_sg_x269,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x10,
      a_b_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x3
    );

  butterfly2_8d4611b7f8: entity work.butterfly2_entity_8d4611b7f8
    port map (
      a => concat_y_net_x9,
      b => concat_y_net_x10,
      ce_1 => ce_1_sg_x269,
      clk_1 => clk_1_sg_x269,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_328bf3481d: entity work.butterfly3j_entity_328bf3481d
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x269,
      clk_1 => clk_1_sg_x269,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_e5e012969f is
  port (
    c: in std_logic_vector(21 downto 0); 
    im: out std_logic_vector(10 downto 0); 
    re: out std_logic_vector(10 downto 0)
  );
end c_to_ri_entity_e5e012969f;

architecture structural of c_to_ri_entity_e5e012969f is
  signal delay1_q_net_x0: std_logic_vector(21 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(10 downto 0);
  signal slice_im_y_net: std_logic_vector(10 downto 0);
  signal slice_re_y_net: std_logic_vector(10 downto 0);

begin
  delay1_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_41416f6188
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_41416f6188
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 10,
      x_width => 22,
      y_width => 11
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 11,
      new_msb => 21,
      x_width => 22,
      y_width => 11
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1/c_to_ri1"

entity c_to_ri1_entity_235ec30cb4 is
  port (
    c: in std_logic_vector(17 downto 0); 
    im: out std_logic_vector(8 downto 0); 
    re: out std_logic_vector(8 downto 0)
  );
end c_to_ri1_entity_235ec30cb4;

architecture structural of c_to_ri1_entity_235ec30cb4 is
  signal force_im_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(8 downto 0);
  signal mem_c_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_im_y_net: std_logic_vector(8 downto 0);
  signal slice_re_y_net: std_logic_vector(8 downto 0);

begin
  mem_c_data_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_ceef4fc23d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_ceef4fc23d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 8,
      x_width => 18,
      y_width => 9
    )
    port map (
      x => mem_c_data_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 9,
      new_msb => 17,
      x_width => 18,
      y_width => 9
    )
    port map (
      x => mem_c_data_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_9b4a594b95 is
  port (
    im: in std_logic_vector(10 downto 0); 
    re: in std_logic_vector(10 downto 0); 
    c: out std_logic_vector(21 downto 0)
  );
end ri_to_c_entity_9b4a594b95;

architecture structural of ri_to_c_entity_9b4a594b95 is
  signal concat_y_net_x17: std_logic_vector(21 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(10 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(10 downto 0);
  signal force_im_output_port_net: std_logic_vector(10 downto 0);
  signal force_re_output_port_net: std_logic_vector(10 downto 0);

begin
  convert_im_dout_net_x0 <= im;
  convert_re_dout_net_x0 <= re;
  c <= concat_y_net_x17;

  concat: entity work.concat_a9f0cfc482
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x17
    );

  force_im: entity work.reinterpret_d517af3309
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_im_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_d517af3309
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_re_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1"

entity cmpy1_entity_217a9309de is
  port (
    a_in: in std_logic_vector(21 downto 0); 
    b: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    a_out: out std_logic_vector(21 downto 0); 
    bw: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end cmpy1_entity_217a9309de;

architecture structural of cmpy1_entity_217a9309de is
  signal br_add_bi_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x270: std_logic;
  signal clk_1_sg_x270: std_logic;
  signal concat_y_net_x18: std_logic_vector(21 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(10 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(10 downto 0);
  signal delay1_q_net_x1: std_logic_vector(21 downto 0);
  signal delay1_q_net_x3: std_logic_vector(21 downto 0);
  signal delay2_q_net_x0: std_logic_vector(21 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(10 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(17 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(17 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(17 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(17 downto 0);
  signal sumsum_p_net: std_logic_vector(17 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay2_q_net_x0 <= a_in;
  delay1_q_net_x1 <= b;
  ce_1_sg_x270 <= ce_1;
  clk_1_sg_x270 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x18;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_d661929060
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_235ec30cb4: entity work.c_to_ri1_entity_235ec30cb4
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_e5e012969f: entity work.c_to_ri_entity_e5e012969f
    port map (
      c => delay1_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 10,
      dout_width => 11,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 10,
      dout_width => 11,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      d(0) => delay3_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay1: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 22
    )
    port map (
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      d => delay2_q_net_x0,
      en => '1',
      q => delay1_q_net_x3
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 10,
      a_width => 11,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 11,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 11,
      c_output_width => 20,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_b0c844385805a270",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 17,
      p_width => 18,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      core_ce => ce_1_sg_x270,
      core_clk => clk_1_sg_x270,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 10,
      a_width => 11,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 11,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 11,
      c_output_width => 20,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_b0c844385805a270",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 17,
      p_width => 18,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      core_ce => ce_1_sg_x270,
      core_clk => clk_1_sg_x270,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_9b4a594b95: entity work.ri_to_c_entity_9b4a594b95
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x18
    );

  rr_add_ii: entity work.addsub_c8df442ec4
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_6dd6aca36b
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_21a1218bfe
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 10,
      a_width => 12,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 12,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 12,
      c_output_width => 22,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_c90585d1a7e9d3a6",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 17,
      p_width => 18,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      core_ce => ce_1_sg_x270,
      core_clk => clk_1_sg_x270,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy2"

entity cmpy2_entity_49bd21265a is
  port (
    b: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(21 downto 0)
  );
end cmpy2_entity_49bd21265a;

architecture structural of cmpy2_entity_49bd21265a is
  signal br_add_bi_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x271: std_logic;
  signal clk_1_sg_x271: std_logic;
  signal concat_y_net_x19: std_logic_vector(21 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(10 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(10 downto 0);
  signal delay4_q_net_x1: std_logic_vector(21 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(10 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(17 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(17 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(17 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(17 downto 0);
  signal sumsum_p_net: std_logic_vector(17 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay4_q_net_x1 <= b;
  ce_1_sg_x271 <= ce_1;
  clk_1_sg_x271 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x19;

  br_add_bi: entity work.addsub_d661929060
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_2df19ced4f: entity work.c_to_ri1_entity_235ec30cb4
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_3397767cd8: entity work.c_to_ri_entity_e5e012969f
    port map (
      c => delay4_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 10,
      dout_width => 11,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 10,
      dout_width => 11,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 10,
      a_width => 11,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 11,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 11,
      c_output_width => 20,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_b0c844385805a270",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 17,
      p_width => 18,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      core_ce => ce_1_sg_x271,
      core_clk => clk_1_sg_x271,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 10,
      a_width => 11,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 11,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 11,
      c_output_width => 20,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_b0c844385805a270",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 17,
      p_width => 18,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      core_ce => ce_1_sg_x271,
      core_clk => clk_1_sg_x271,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_8b101272cb: entity work.ri_to_c_entity_9b4a594b95
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_c8df442ec4
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_6dd6aca36b
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_21a1218bfe
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 10,
      a_width => 12,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 12,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 12,
      c_output_width => 22,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_c90585d1a7e9d3a6",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 17,
      p_width => 18,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      core_ce => ce_1_sg_x271,
      core_clk => clk_1_sg_x271,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x271,
      clk => clk_1_sg_x271,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_d5127c2c3a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_d5127c2c3a;

architecture structural of twiddle_gen1_entity_d5127c2c3a is
  signal addr_sel_y_net: std_logic_vector(1 downto 0);
  signal ce_1_sg_x273: std_logic;
  signal clk_1_sg_x273: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x5: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x273 <= ce_1;
  clk_1_sg_x273 <= clk_1;
  delay_q_net_x5 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 7,
      x_width => 8,
      y_width => 2
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x5,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom_dist
    generic map (
      addr_width => 2,
      c_address_width => 4,
      c_width => 18,
      core_name0 => "dmg_33_vx5_3b5827b9b9c34c2c",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_3f55dc5698 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_3f55dc5698;

architecture structural of twiddle_gen2_entity_3f55dc5698 is
  signal addr_sel_y_net: std_logic_vector(1 downto 0);
  signal ce_1_sg_x274: std_logic;
  signal clk_1_sg_x274: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x6: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x274 <= ce_1;
  clk_1_sg_x274 <= clk_1;
  delay_q_net_x6 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 7,
      x_width => 8,
      y_width => 2
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x274,
      clk => clk_1_sg_x274,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x6,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom_dist
    generic map (
      addr_width => 2,
      c_address_width => 4,
      c_width => 18,
      core_name0 => "dmg_33_vx5_6ab87bec3a8932d3",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x274,
      clk => clk_1_sg_x274,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_f34ccea170 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_f34ccea170;

architecture structural of twiddle_gen3_entity_f34ccea170 is
  signal addr_sel_y_net: std_logic_vector(1 downto 0);
  signal ce_1_sg_x275: std_logic;
  signal clk_1_sg_x275: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x7: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x275 <= ce_1;
  clk_1_sg_x275 <= clk_1;
  delay_q_net_x7 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 7,
      x_width => 8,
      y_width => 2
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x7,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom_dist
    generic map (
      addr_width => 2,
      c_address_width => 4,
      c_width => 18,
      core_name0 => "dmg_33_vx5_af86f8a7a0de7d76",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2/r4_twiddle"

entity r4_twiddle_entity_fe32205649 is
  port (
    a_in: in std_logic_vector(21 downto 0); 
    b: in std_logic_vector(21 downto 0); 
    c: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(21 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(21 downto 0); 
    bw: out std_logic_vector(21 downto 0); 
    cw: out std_logic_vector(21 downto 0); 
    dw: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end r4_twiddle_entity_fe32205649;

architecture structural of r4_twiddle_entity_fe32205649 is
  signal ce_1_sg_x276: std_logic;
  signal clk_1_sg_x276: std_logic;
  signal concat_y_net_x21: std_logic_vector(21 downto 0);
  signal concat_y_net_x22: std_logic_vector(21 downto 0);
  signal concat_y_net_x23: std_logic_vector(21 downto 0);
  signal concat_y_net_x29: std_logic_vector(21 downto 0);
  signal concat_y_net_x7: std_logic_vector(21 downto 0);
  signal delay1_q_net_x1: std_logic_vector(21 downto 0);
  signal delay1_q_net_x4: std_logic_vector(21 downto 0);
  signal delay2_q_net_x0: std_logic_vector(21 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay4_q_net_x1: std_logic_vector(21 downto 0);
  signal delay5_q_net_x1: std_logic_vector(21 downto 0);
  signal delay_q_net_x4: std_logic;
  signal delay_q_net_x8: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x3: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x4: std_logic_vector(17 downto 0);
  signal mux1_y_net_x8: std_logic_vector(21 downto 0);
  signal mux1_y_net_x9: std_logic_vector(21 downto 0);

begin
  concat_y_net_x29 <= a_in;
  mux1_y_net_x8 <= b;
  concat_y_net_x7 <= c;
  ce_1_sg_x276 <= ce_1;
  clk_1_sg_x276 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x8 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x22;
  dw <= concat_y_net_x23;
  sync_out <= delay_q_net_x4;

  cmpy1_217a9309de: entity work.cmpy1_entity_217a9309de
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x276,
      clk_1 => clk_1_sg_x276,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_49bd21265a: entity work.cmpy2_entity_49bd21265a
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x276,
      clk_1 => clk_1_sg_x276,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x22
    );

  cmpy3_c4d25680be: entity work.cmpy2_entity_49bd21265a
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x276,
      clk_1 => clk_1_sg_x276,
      w => mem_c_data_net_x4,
      bw => concat_y_net_x23
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 22
    )
    port map (
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      d => mux1_y_net_x8,
      en => '1',
      q => delay1_q_net_x1
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 22
    )
    port map (
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      d => concat_y_net_x29,
      en => '1',
      q => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      d(0) => delay_q_net_x8,
      en => '1',
      q(0) => delay3_q_net_x0
    );

  delay4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 22
    )
    port map (
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      d => concat_y_net_x7,
      en => '1',
      q => delay4_q_net_x1
    );

  delay5: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 22
    )
    port map (
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_d5127c2c3a: entity work.twiddle_gen1_entity_d5127c2c3a
    port map (
      ce_1 => ce_1_sg_x276,
      clk_1 => clk_1_sg_x276,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_3f55dc5698: entity work.twiddle_gen2_entity_3f55dc5698
    port map (
      ce_1 => ce_1_sg_x276,
      clk_1 => clk_1_sg_x276,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_f34ccea170: entity work.twiddle_gen3_entity_f34ccea170
    port map (
      ce_1 => ce_1_sg_x276,
      clk_1 => clk_1_sg_x276,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_2"

entity r4_dit_stage_2_entity_799bdb5f7a is
  port (
    a_in: in std_logic_vector(21 downto 0); 
    b_in: in std_logic_vector(21 downto 0); 
    c_in: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(21 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(25 downto 0); 
    b_out: out std_logic_vector(25 downto 0); 
    c_out: out std_logic_vector(25 downto 0); 
    d_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end r4_dit_stage_2_entity_799bdb5f7a;

architecture structural of r4_dit_stage_2_entity_799bdb5f7a is
  signal ce_1_sg_x277: std_logic;
  signal clk_1_sg_x277: std_logic;
  signal concat_y_net_x23: std_logic_vector(21 downto 0);
  signal concat_y_net_x24: std_logic_vector(21 downto 0);
  signal concat_y_net_x29: std_logic_vector(21 downto 0);
  signal concat_y_net_x31: std_logic_vector(21 downto 0);
  signal concat_y_net_x32: std_logic_vector(21 downto 0);
  signal concat_y_net_x33: std_logic_vector(21 downto 0);
  signal concat_y_net_x34: std_logic_vector(21 downto 0);
  signal concat_y_net_x35: std_logic_vector(21 downto 0);
  signal concat_y_net_x36: std_logic_vector(25 downto 0);
  signal concat_y_net_x37: std_logic_vector(25 downto 0);
  signal concat_y_net_x38: std_logic_vector(25 downto 0);
  signal concat_y_net_x39: std_logic_vector(25 downto 0);
  signal concat_y_net_x7: std_logic_vector(21 downto 0);
  signal delay1_q_net_x4: std_logic_vector(21 downto 0);
  signal delay_q_net_x16: std_logic;
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x6: std_logic;
  signal delay_q_net_x8: std_logic;
  signal mux1_y_net_x8: std_logic_vector(21 downto 0);
  signal mux1_y_net_x9: std_logic_vector(21 downto 0);

begin
  concat_y_net_x24 <= a_in;
  concat_y_net_x33 <= b_in;
  concat_y_net_x34 <= c_in;
  ce_1_sg_x277 <= ce_1;
  clk_1_sg_x277 <= clk_1;
  concat_y_net_x35 <= d_in;
  delay_q_net_x16 <= sync_in;
  a_out <= concat_y_net_x36;
  b_out <= concat_y_net_x37;
  c_out <= concat_y_net_x38;
  d_out <= concat_y_net_x39;
  sync_out <= delay_q_net_x6;

  quadplex_commutator_96d7341a91: entity work.quadplex_commutator_entity_96d7341a91
    port map (
      a => concat_y_net_x24,
      b => concat_y_net_x33,
      c => concat_y_net_x34,
      ce_1 => ce_1_sg_x277,
      clk_1 => clk_1_sg_x277,
      d => concat_y_net_x35,
      sync_in => delay_q_net_x16,
      abcd0 => concat_y_net_x29,
      abcd1 => mux1_y_net_x8,
      abcd2 => concat_y_net_x7,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x8
    );

  r4_butterfly_8a62a395c7: entity work.r4_butterfly_entity_8a62a395c7
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x23,
      c_in => concat_y_net_x31,
      ce_1 => ce_1_sg_x277,
      clk_1 => clk_1_sg_x277,
      d_in => concat_y_net_x32,
      sync_in => delay_q_net_x5,
      a_out => concat_y_net_x36,
      b_out => concat_y_net_x37,
      c_out => concat_y_net_x38,
      d_out => concat_y_net_x39,
      sync_out => delay_q_net_x6
    );

  r4_twiddle_fe32205649: entity work.r4_twiddle_entity_fe32205649
    port map (
      a_in => concat_y_net_x29,
      b => mux1_y_net_x8,
      c => concat_y_net_x7,
      ce_1 => ce_1_sg_x277,
      clk_1 => clk_1_sg_x277,
      d => mux1_y_net_x9,
      sync_in => delay_q_net_x8,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x23,
      cw => concat_y_net_x31,
      dw => concat_y_net_x32,
      sync_out => delay_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_f6d25b74f2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(25 downto 0); 
    out_x0: out std_logic_vector(25 downto 0)
  );
end delay_b_entity_f6d25b74f2;

architecture structural of delay_b_entity_f6d25b74f2 is
  signal ce_1_sg_x278: std_logic;
  signal clk_1_sg_x278: std_logic;
  signal slr_q_net_x1: std_logic_vector(25 downto 0);
  signal slr_q_net_x2: std_logic_vector(25 downto 0);

begin
  ce_1_sg_x278 <= ce_1;
  clk_1_sg_x278 <= clk_1;
  slr_q_net_x1 <= in_x0;
  out_x0 <= slr_q_net_x2;

  slr: entity work.xldelay
    generic map (
      latency => 16,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x278,
      clk => clk_1_sg_x278,
      d => slr_q_net_x1,
      en => '1',
      q => slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_eb2ef9379f is
  port (
    aloahi: in std_logic_vector(25 downto 0); 
    blobhi: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(25 downto 0); 
    aloblo: out std_logic_vector(25 downto 0)
  );
end biplex_commutator_01_entity_eb2ef9379f;

architecture structural of biplex_commutator_01_entity_eb2ef9379f is
  signal ce_1_sg_x280: std_logic;
  signal clk_1_sg_x280: std_logic;
  signal counter_op_net: std_logic_vector(4 downto 0);
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(25 downto 0);
  signal mux_y_net_x0: std_logic_vector(25 downto 0);
  signal slr_q_net_x2: std_logic_vector(25 downto 0);
  signal slr_q_net_x3: std_logic_vector(25 downto 0);
  signal slr_q_net_x4: std_logic_vector(25 downto 0);
  signal slr_q_net_x5: std_logic_vector(25 downto 0);
  signal top_bit_y_net: std_logic;

begin
  slr_q_net_x3 <= aloahi;
  slr_q_net_x4 <= blobhi;
  ce_1_sg_x280 <= ce_1;
  clk_1_sg_x280 <= clk_1;
  delay_q_net_x0 <= sync_in;
  ahibhi <= mux1_y_net_x0;
  aloblo <= slr_q_net_x5;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_ad5bcb1136ed8cf6",
      op_arith => xlUnsigned,
      op_width => 5
    )
    port map (
      ce => ce_1_sg_x280,
      clk => clk_1_sg_x280,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_f6d25b74f2: entity work.delay_b_entity_f6d25b74f2
    port map (
      ce_1 => ce_1_sg_x280,
      clk_1 => clk_1_sg_x280,
      in_x0 => slr_q_net_x4,
      out_x0 => slr_q_net_x2
    );

  delay_lo_7bedb2bd0d: entity work.delay_b_entity_f6d25b74f2
    port map (
      ce_1 => ce_1_sg_x280,
      clk_1 => clk_1_sg_x280,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x280,
      clk => clk_1_sg_x280,
      clr => '0',
      d0 => slr_q_net_x3,
      d1 => slr_q_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x280,
      clk => clk_1_sg_x280,
      clr => '0',
      d0 => slr_q_net_x2,
      d1 => slr_q_net_x3,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x0
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 4,
      x_width => 5,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_7472ac1b16 is
  port (
    aloahi: in std_logic_vector(25 downto 0); 
    blobhi: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(25 downto 0); 
    aloblo: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_23_entity_7472ac1b16;

architecture structural of biplex_commutator_23_entity_7472ac1b16 is
  signal ce_1_sg_x283: std_logic;
  signal clk_1_sg_x283: std_logic;
  signal counter_op_net: std_logic_vector(4 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x2: std_logic_vector(25 downto 0);
  signal mux1_y_net_x3: std_logic_vector(25 downto 0);
  signal mux1_y_net_x4: std_logic_vector(25 downto 0);
  signal mux_y_net_x0: std_logic_vector(25 downto 0);
  signal slr_q_net_x0: std_logic_vector(25 downto 0);
  signal slr_q_net_x2: std_logic_vector(25 downto 0);
  signal top_bit_y_net: std_logic;

begin
  mux1_y_net_x2 <= aloahi;
  mux1_y_net_x3 <= blobhi;
  ce_1_sg_x283 <= ce_1;
  clk_1_sg_x283 <= clk_1;
  delay_q_net_x1 <= sync_in;
  ahibhi <= mux1_y_net_x4;
  aloblo <= slr_q_net_x2;
  sync_out <= delay_q_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_ad5bcb1136ed8cf6",
      op_arith => xlUnsigned,
      op_width => 5
    )
    port map (
      ce => ce_1_sg_x283,
      clk => clk_1_sg_x283,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x1,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 17,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x283,
      clk => clk_1_sg_x283,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_81ed06dda6: entity work.delay_b_entity_f6d25b74f2
    port map (
      ce_1 => ce_1_sg_x283,
      clk_1 => clk_1_sg_x283,
      in_x0 => mux1_y_net_x3,
      out_x0 => slr_q_net_x0
    );

  delay_lo_2000f2551d: entity work.delay_b_entity_f6d25b74f2
    port map (
      ce_1 => ce_1_sg_x283,
      clk_1 => clk_1_sg_x283,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x2
    );

  mux: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x283,
      clk => clk_1_sg_x283,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x283,
      clk => clk_1_sg_x283,
      clr => '0',
      d0 => slr_q_net_x0,
      d1 => mux1_y_net_x2,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x4
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 4,
      x_width => 5,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_bb4836bc41 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(25 downto 0); 
    out_x0: out std_logic_vector(25 downto 0)
  );
end delay_b_entity_bb4836bc41;

architecture structural of delay_b_entity_bb4836bc41 is
  signal ce_1_sg_x284: std_logic;
  signal clk_1_sg_x284: std_logic;
  signal concat_y_net_x39: std_logic_vector(25 downto 0);
  signal slr_q_net_x0: std_logic_vector(25 downto 0);

begin
  ce_1_sg_x284 <= ce_1;
  clk_1_sg_x284 <= clk_1;
  concat_y_net_x39 <= in_x0;
  out_x0 <= slr_q_net_x0;

  slr: entity work.xldelay
    generic map (
      latency => 32,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x284,
      clk => clk_1_sg_x284,
      d => concat_y_net_x39,
      en => '1',
      q => slr_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_a89be2a2a4 is
  port (
    aloahi: in std_logic_vector(25 downto 0); 
    blobhi: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(25 downto 0); 
    aloblo: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_ac_entity_a89be2a2a4;

architecture structural of biplex_commutator_ac_entity_a89be2a2a4 is
  signal ce_1_sg_x286: std_logic;
  signal clk_1_sg_x286: std_logic;
  signal concat_y_net_x40: std_logic_vector(25 downto 0);
  signal concat_y_net_x41: std_logic_vector(25 downto 0);
  signal counter_op_net: std_logic_vector(5 downto 0);
  signal delay_q_net_x7: std_logic;
  signal delay_q_net_x8: std_logic;
  signal mux1_y_net_x3: std_logic_vector(25 downto 0);
  signal mux_y_net_x0: std_logic_vector(25 downto 0);
  signal slr_q_net_x0: std_logic_vector(25 downto 0);
  signal slr_q_net_x5: std_logic_vector(25 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x40 <= aloahi;
  concat_y_net_x41 <= blobhi;
  ce_1_sg_x286 <= ce_1;
  clk_1_sg_x286 <= clk_1;
  delay_q_net_x7 <= sync_in;
  ahibhi <= mux1_y_net_x3;
  aloblo <= slr_q_net_x5;
  sync_out <= delay_q_net_x8;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_fe346e03af2452eb",
      op_arith => xlUnsigned,
      op_width => 6
    )
    port map (
      ce => ce_1_sg_x286,
      clk => clk_1_sg_x286,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x7,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 33,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x286,
      clk => clk_1_sg_x286,
      d(0) => delay_q_net_x7,
      en => '1',
      q(0) => delay_q_net_x8
    );

  delay_b_bb4836bc41: entity work.delay_b_entity_bb4836bc41
    port map (
      ce_1 => ce_1_sg_x286,
      clk_1 => clk_1_sg_x286,
      in_x0 => concat_y_net_x41,
      out_x0 => slr_q_net_x0
    );

  delay_lo_58a7bc4df8: entity work.delay_b_entity_bb4836bc41
    port map (
      ce_1 => ce_1_sg_x286,
      clk_1 => clk_1_sg_x286,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x286,
      clk => clk_1_sg_x286,
      clr => '0',
      d0 => concat_y_net_x40,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x286,
      clk => clk_1_sg_x286,
      clr => '0',
      d0 => slr_q_net_x0,
      d1 => concat_y_net_x40,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x3
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 5,
      new_msb => 5,
      x_width => 6,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/quadplex_commutator"

entity quadplex_commutator_entity_099e0d8a58 is
  port (
    a: in std_logic_vector(25 downto 0); 
    b: in std_logic_vector(25 downto 0); 
    c: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    abcd0: out std_logic_vector(25 downto 0); 
    abcd1: out std_logic_vector(25 downto 0); 
    abcd2: out std_logic_vector(25 downto 0); 
    abcd3: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end quadplex_commutator_entity_099e0d8a58;

architecture structural of quadplex_commutator_entity_099e0d8a58 is
  signal ce_1_sg_x290: std_logic;
  signal clk_1_sg_x290: std_logic;
  signal concat_y_net_x44: std_logic_vector(25 downto 0);
  signal concat_y_net_x45: std_logic_vector(25 downto 0);
  signal concat_y_net_x46: std_logic_vector(25 downto 0);
  signal concat_y_net_x47: std_logic_vector(25 downto 0);
  signal delay_q_net_x10: std_logic;
  signal delay_q_net_x11: std_logic;
  signal delay_q_net_x12: std_logic;
  signal delay_q_net_x9: std_logic;
  signal mux1_y_net_x3: std_logic_vector(25 downto 0);
  signal mux1_y_net_x5: std_logic_vector(25 downto 0);
  signal mux1_y_net_x6: std_logic_vector(25 downto 0);
  signal mux1_y_net_x7: std_logic_vector(25 downto 0);
  signal slr_q_net_x6: std_logic_vector(25 downto 0);
  signal slr_q_net_x7: std_logic_vector(25 downto 0);
  signal slr_q_net_x8: std_logic_vector(25 downto 0);
  signal slr_q_net_x9: std_logic_vector(25 downto 0);

begin
  concat_y_net_x44 <= a;
  concat_y_net_x45 <= b;
  concat_y_net_x46 <= c;
  ce_1_sg_x290 <= ce_1;
  clk_1_sg_x290 <= clk_1;
  concat_y_net_x47 <= d;
  delay_q_net_x11 <= sync_in;
  abcd0 <= slr_q_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= slr_q_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x12;

  biplex_commutator_01_eb2ef9379f: entity work.biplex_commutator_01_entity_eb2ef9379f
    port map (
      aloahi => slr_q_net_x6,
      blobhi => slr_q_net_x7,
      ce_1 => ce_1_sg_x290,
      clk_1 => clk_1_sg_x290,
      sync_in => delay_q_net_x9,
      ahibhi => mux1_y_net_x6,
      aloblo => slr_q_net_x8
    );

  biplex_commutator_23_7472ac1b16: entity work.biplex_commutator_23_entity_7472ac1b16
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x290,
      clk_1 => clk_1_sg_x290,
      sync_in => delay_q_net_x10,
      ahibhi => mux1_y_net_x7,
      aloblo => slr_q_net_x9,
      sync_out => delay_q_net_x12
    );

  biplex_commutator_ac_a89be2a2a4: entity work.biplex_commutator_ac_entity_a89be2a2a4
    port map (
      aloahi => concat_y_net_x44,
      blobhi => concat_y_net_x46,
      ce_1 => ce_1_sg_x290,
      clk_1 => clk_1_sg_x290,
      sync_in => delay_q_net_x11,
      ahibhi => mux1_y_net_x3,
      aloblo => slr_q_net_x6,
      sync_out => delay_q_net_x9
    );

  biplex_commutator_bd_43aedc9fdf: entity work.biplex_commutator_ac_entity_a89be2a2a4
    port map (
      aloahi => concat_y_net_x45,
      blobhi => concat_y_net_x47,
      ce_1 => ce_1_sg_x290,
      clk_1 => clk_1_sg_x290,
      sync_in => delay_q_net_x11,
      ahibhi => mux1_y_net_x5,
      aloblo => slr_q_net_x7,
      sync_out => delay_q_net_x10
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_c4e440dcd0 is
  port (
    c: in std_logic_vector(25 downto 0); 
    im: out std_logic_vector(12 downto 0); 
    re: out std_logic_vector(12 downto 0)
  );
end c_to_ri_entity_c4e440dcd0;

architecture structural of c_to_ri_entity_c4e440dcd0 is
  signal delay1_q_net_x0: std_logic_vector(25 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(12 downto 0);
  signal slice_im_y_net: std_logic_vector(12 downto 0);
  signal slice_re_y_net: std_logic_vector(12 downto 0);

begin
  delay1_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_33580846c4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_33580846c4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 12,
      x_width => 26,
      y_width => 13
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 13,
      new_msb => 25,
      x_width => 26,
      y_width => 13
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_325cac137c is
  port (
    im: in std_logic_vector(13 downto 0); 
    re: in std_logic_vector(13 downto 0); 
    c: out std_logic_vector(27 downto 0)
  );
end ri_to_c_entity_325cac137c;

architecture structural of ri_to_c_entity_325cac137c is
  signal concat_y_net_x0: std_logic_vector(27 downto 0);
  signal force_im_output_port_net: std_logic_vector(13 downto 0);
  signal force_re_output_port_net: std_logic_vector(13 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(13 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(13 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_e5ffcbc394
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_eb72d4ea08
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_eb72d4ea08
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant0_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly0"

entity butterfly0_entity_97e519d99b is
  port (
    a: in std_logic_vector(25 downto 0); 
    b: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(27 downto 0); 
    a_b_x0: out std_logic_vector(27 downto 0)
  );
end butterfly0_entity_97e519d99b;

architecture structural of butterfly0_entity_97e519d99b is
  signal add_im_s_net: std_logic_vector(13 downto 0);
  signal add_re_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x291: std_logic;
  signal clk_1_sg_x291: std_logic;
  signal concat_y_net_x3: std_logic_vector(25 downto 0);
  signal concat_y_net_x4: std_logic_vector(27 downto 0);
  signal concat_y_net_x5: std_logic_vector(27 downto 0);
  signal delay1_q_net_x1: std_logic_vector(25 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(12 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(13 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(13 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(13 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(13 downto 0);
  signal shift0_op_net: std_logic_vector(13 downto 0);
  signal shift1_op_net: std_logic_vector(13 downto 0);
  signal shift2_op_net: std_logic_vector(13 downto 0);
  signal shift3_op_net: std_logic_vector(13 downto 0);
  signal sub_im_s_net: std_logic_vector(13 downto 0);
  signal sub_re_s_net: std_logic_vector(13 downto 0);

begin
  delay1_q_net_x1 <= a;
  concat_y_net_x3 <= b;
  ce_1_sg_x291 <= ce_1;
  clk_1_sg_x291 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_4a1b074932
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x291,
      clk => clk_1_sg_x291,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_4a1b074932
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x291,
      clk => clk_1_sg_x291,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_2232a0f520: entity work.c_to_ri_entity_c4e440dcd0
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_c4e440dcd0: entity work.c_to_ri_entity_c4e440dcd0
    port map (
      c => delay1_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 14,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 14,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 14,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 14,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_9f612090af: entity work.ri_to_c_entity_325cac137c
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_325cac137c: entity work.ri_to_c_entity_325cac137c
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x4
    );

  shift0: entity work.scale_a1339d14c7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_a1339d14c7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_a1339d14c7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_a1339d14c7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_f3687289ea
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x291,
      clk => clk_1_sg_x291,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f3687289ea
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x291,
      clk => clk_1_sg_x291,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly1"

entity butterfly1_entity_fcff71cb0a is
  port (
    a: in std_logic_vector(25 downto 0); 
    b: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(27 downto 0); 
    a_b_x0: out std_logic_vector(27 downto 0); 
    sync_out: out std_logic
  );
end butterfly1_entity_fcff71cb0a;

architecture structural of butterfly1_entity_fcff71cb0a is
  signal add_im_s_net: std_logic_vector(13 downto 0);
  signal add_re_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x292: std_logic;
  signal clk_1_sg_x292: std_logic;
  signal concat_y_net_x4: std_logic_vector(25 downto 0);
  signal concat_y_net_x5: std_logic_vector(25 downto 0);
  signal concat_y_net_x6: std_logic_vector(27 downto 0);
  signal concat_y_net_x7: std_logic_vector(27 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(12 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(13 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(13 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(13 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(13 downto 0);
  signal shift0_op_net: std_logic_vector(13 downto 0);
  signal shift1_op_net: std_logic_vector(13 downto 0);
  signal shift2_op_net: std_logic_vector(13 downto 0);
  signal shift3_op_net: std_logic_vector(13 downto 0);
  signal sub_im_s_net: std_logic_vector(13 downto 0);
  signal sub_re_s_net: std_logic_vector(13 downto 0);

begin
  concat_y_net_x4 <= a;
  concat_y_net_x5 <= b;
  ce_1_sg_x292 <= ce_1;
  clk_1_sg_x292 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_4a1b074932
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_4a1b074932
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_185192e593: entity work.c_to_ri_entity_c4e440dcd0
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_de760772e3: entity work.c_to_ri_entity_c4e440dcd0
    port map (
      c => concat_y_net_x4,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 14,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 14,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 14,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 14,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_30c4641bad: entity work.ri_to_c_entity_325cac137c
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_c962c3fe66: entity work.ri_to_c_entity_325cac137c
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x6
    );

  shift0: entity work.scale_a1339d14c7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_a1339d14c7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_a1339d14c7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_a1339d14c7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_f3687289ea
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f3687289ea
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_725a537fce is
  port (
    c: in std_logic_vector(27 downto 0); 
    im: out std_logic_vector(13 downto 0); 
    re: out std_logic_vector(13 downto 0)
  );
end c_to_ri_entity_725a537fce;

architecture structural of c_to_ri_entity_725a537fce is
  signal concat_y_net_x5: std_logic_vector(27 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(13 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(13 downto 0);
  signal slice_im_y_net: std_logic_vector(13 downto 0);
  signal slice_re_y_net: std_logic_vector(13 downto 0);

begin
  concat_y_net_x5 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_445612bb74
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_445612bb74
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 13,
      x_width => 28,
      y_width => 14
    )
    port map (
      x => concat_y_net_x5,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 14,
      new_msb => 27,
      x_width => 28,
      y_width => 14
    )
    port map (
      x => concat_y_net_x5,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_22307265ee is
  port (
    im: in std_logic_vector(14 downto 0); 
    re: in std_logic_vector(14 downto 0); 
    c: out std_logic_vector(29 downto 0)
  );
end ri_to_c_entity_22307265ee;

architecture structural of ri_to_c_entity_22307265ee is
  signal concat_y_net_x0: std_logic_vector(29 downto 0);
  signal force_im_output_port_net: std_logic_vector(14 downto 0);
  signal force_re_output_port_net: std_logic_vector(14 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(14 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(14 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_22467883b2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_0d1490be80
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_0d1490be80
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant0_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly2"

entity butterfly2_entity_6ad64805f6 is
  port (
    a: in std_logic_vector(27 downto 0); 
    b: in std_logic_vector(27 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(29 downto 0); 
    a_b_x0: out std_logic_vector(29 downto 0)
  );
end butterfly2_entity_6ad64805f6;

architecture structural of butterfly2_entity_6ad64805f6 is
  signal add_im_s_net: std_logic_vector(14 downto 0);
  signal add_re_s_net: std_logic_vector(14 downto 0);
  signal ce_1_sg_x293: std_logic;
  signal clk_1_sg_x293: std_logic;
  signal concat_y_net_x10: std_logic_vector(27 downto 0);
  signal concat_y_net_x11: std_logic_vector(29 downto 0);
  signal concat_y_net_x12: std_logic_vector(29 downto 0);
  signal concat_y_net_x9: std_logic_vector(27 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(13 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(13 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(13 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(13 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(14 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(14 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(14 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(14 downto 0);
  signal shift0_op_net: std_logic_vector(14 downto 0);
  signal shift1_op_net: std_logic_vector(14 downto 0);
  signal shift2_op_net: std_logic_vector(14 downto 0);
  signal shift3_op_net: std_logic_vector(14 downto 0);
  signal sub_im_s_net: std_logic_vector(14 downto 0);
  signal sub_re_s_net: std_logic_vector(14 downto 0);

begin
  concat_y_net_x9 <= a;
  concat_y_net_x10 <= b;
  ce_1_sg_x293 <= ce_1;
  clk_1_sg_x293 <= clk_1;
  a_b <= concat_y_net_x11;
  a_b_x0 <= concat_y_net_x12;

  add_im: entity work.addsub_79dc8835bc
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x293,
      clk => clk_1_sg_x293,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_79dc8835bc
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x293,
      clk => clk_1_sg_x293,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_21a4c8828f: entity work.c_to_ri_entity_725a537fce
    port map (
      c => concat_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_725a537fce: entity work.c_to_ri_entity_725a537fce
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 15,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 15,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 15,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 15,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 15,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 15,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 15,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 15,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_445c82a493: entity work.ri_to_c_entity_22307265ee
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x12
    );

  ri_to_c_22307265ee: entity work.ri_to_c_entity_22307265ee
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x11
    );

  shift0: entity work.scale_11a6418200
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_11a6418200
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_11a6418200
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_11a6418200
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_f4e99698eb
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x293,
      clk => clk_1_sg_x293,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f4e99698eb
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x293,
      clk => clk_1_sg_x293,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly3j"

entity butterfly3j_entity_d045a3167f is
  port (
    a: in std_logic_vector(27 downto 0); 
    b: in std_logic_vector(27 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(29 downto 0); 
    a_b_x0: out std_logic_vector(29 downto 0); 
    sync_out: out std_logic
  );
end butterfly3j_entity_d045a3167f;

architecture structural of butterfly3j_entity_d045a3167f is
  signal add_im_s_net: std_logic_vector(14 downto 0);
  signal add_re_s_net: std_logic_vector(14 downto 0);
  signal ce_1_sg_x294: std_logic;
  signal clk_1_sg_x294: std_logic;
  signal concat_y_net_x10: std_logic_vector(29 downto 0);
  signal concat_y_net_x11: std_logic_vector(29 downto 0);
  signal concat_y_net_x7: std_logic_vector(27 downto 0);
  signal concat_y_net_x9: std_logic_vector(27 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(13 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(13 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(13 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(13 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(14 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(14 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(14 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(14 downto 0);
  signal shift0_op_net: std_logic_vector(14 downto 0);
  signal shift1_op_net: std_logic_vector(14 downto 0);
  signal shift2_op_net: std_logic_vector(14 downto 0);
  signal shift3_op_net: std_logic_vector(14 downto 0);
  signal sub_im_s_net: std_logic_vector(14 downto 0);
  signal sub_re_s_net: std_logic_vector(14 downto 0);

begin
  concat_y_net_x7 <= a;
  concat_y_net_x9 <= b;
  ce_1_sg_x294 <= ce_1;
  clk_1_sg_x294 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x10;
  a_b_x0 <= concat_y_net_x11;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_f4e99698eb
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_79dc8835bc
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_57d537aaa9: entity work.c_to_ri_entity_725a537fce
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_320492105b: entity work.c_to_ri_entity_725a537fce
    port map (
      c => concat_y_net_x7,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      d(0) => delay_q_net_x3,
      en => '1',
      q(0) => delay_q_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 15,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 15,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 15,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 15,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 15,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 15,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 15,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 15,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_a59d12ffd2: entity work.ri_to_c_entity_22307265ee
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x11
    );

  ri_to_c_e65bc2bd9a: entity work.ri_to_c_entity_22307265ee
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x10
    );

  shift0: entity work.scale_11a6418200
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_11a6418200
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_11a6418200
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_11a6418200
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_79dc8835bc
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f4e99698eb
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_butterfly"

entity r4_butterfly_entity_89c1449d58 is
  port (
    a_in: in std_logic_vector(25 downto 0); 
    b_in: in std_logic_vector(25 downto 0); 
    c_in: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(29 downto 0); 
    b_out: out std_logic_vector(29 downto 0); 
    c_out: out std_logic_vector(29 downto 0); 
    d_out: out std_logic_vector(29 downto 0); 
    sync_out: out std_logic
  );
end r4_butterfly_entity_89c1449d58;

architecture structural of r4_butterfly_entity_89c1449d58 is
  signal ce_1_sg_x295: std_logic;
  signal clk_1_sg_x295: std_logic;
  signal concat_y_net_x10: std_logic_vector(27 downto 0);
  signal concat_y_net_x11: std_logic_vector(27 downto 0);
  signal concat_y_net_x16: std_logic_vector(25 downto 0);
  signal concat_y_net_x17: std_logic_vector(25 downto 0);
  signal concat_y_net_x18: std_logic_vector(25 downto 0);
  signal concat_y_net_x19: std_logic_vector(29 downto 0);
  signal concat_y_net_x20: std_logic_vector(29 downto 0);
  signal concat_y_net_x21: std_logic_vector(29 downto 0);
  signal concat_y_net_x22: std_logic_vector(29 downto 0);
  signal concat_y_net_x7: std_logic_vector(27 downto 0);
  signal concat_y_net_x9: std_logic_vector(27 downto 0);
  signal delay1_q_net_x2: std_logic_vector(25 downto 0);
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;

begin
  delay1_q_net_x2 <= a_in;
  concat_y_net_x16 <= b_in;
  concat_y_net_x17 <= c_in;
  ce_1_sg_x295 <= ce_1;
  clk_1_sg_x295 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  butterfly0_97e519d99b: entity work.butterfly0_entity_97e519d99b
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x17,
      ce_1 => ce_1_sg_x295,
      clk_1 => clk_1_sg_x295,
      a_b => concat_y_net_x9,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_fcff71cb0a: entity work.butterfly1_entity_fcff71cb0a
    port map (
      a => concat_y_net_x16,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x295,
      clk_1 => clk_1_sg_x295,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x10,
      a_b_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x3
    );

  butterfly2_6ad64805f6: entity work.butterfly2_entity_6ad64805f6
    port map (
      a => concat_y_net_x9,
      b => concat_y_net_x10,
      ce_1 => ce_1_sg_x295,
      clk_1 => clk_1_sg_x295,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_d045a3167f: entity work.butterfly3j_entity_d045a3167f
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x295,
      clk_1 => clk_1_sg_x295,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_8f4c287073 is
  port (
    c: in std_logic_vector(25 downto 0); 
    im: out std_logic_vector(12 downto 0); 
    re: out std_logic_vector(12 downto 0)
  );
end c_to_ri_entity_8f4c287073;

architecture structural of c_to_ri_entity_8f4c287073 is
  signal delay1_q_net_x0: std_logic_vector(25 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(12 downto 0);
  signal slice_im_y_net: std_logic_vector(12 downto 0);
  signal slice_re_y_net: std_logic_vector(12 downto 0);

begin
  delay1_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_33580846c4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_33580846c4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 12,
      x_width => 26,
      y_width => 13
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 13,
      new_msb => 25,
      x_width => 26,
      y_width => 13
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_5087769a76 is
  port (
    im: in std_logic_vector(12 downto 0); 
    re: in std_logic_vector(12 downto 0); 
    c: out std_logic_vector(25 downto 0)
  );
end ri_to_c_entity_5087769a76;

architecture structural of ri_to_c_entity_5087769a76 is
  signal concat_y_net_x17: std_logic_vector(25 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(12 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(12 downto 0);
  signal force_im_output_port_net: std_logic_vector(12 downto 0);
  signal force_re_output_port_net: std_logic_vector(12 downto 0);

begin
  convert_im_dout_net_x0 <= im;
  convert_re_dout_net_x0 <= re;
  c <= concat_y_net_x17;

  concat: entity work.concat_4720648850
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x17
    );

  force_im: entity work.reinterpret_18554b6b75
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_im_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_18554b6b75
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_re_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy1"

entity cmpy1_entity_b40a7576a2 is
  port (
    a_in: in std_logic_vector(25 downto 0); 
    b: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    a_out: out std_logic_vector(25 downto 0); 
    bw: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end cmpy1_entity_b40a7576a2;

architecture structural of cmpy1_entity_b40a7576a2 is
  signal br_add_bi_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x296: std_logic;
  signal clk_1_sg_x296: std_logic;
  signal concat_y_net_x18: std_logic_vector(25 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(12 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(12 downto 0);
  signal delay1_q_net_x1: std_logic_vector(25 downto 0);
  signal delay1_q_net_x3: std_logic_vector(25 downto 0);
  signal delay2_q_net_x0: std_logic_vector(25 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(19 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(19 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(19 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(19 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(19 downto 0);
  signal sumsum_p_net: std_logic_vector(19 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay2_q_net_x0 <= a_in;
  delay1_q_net_x1 <= b;
  ce_1_sg_x296 <= ce_1;
  clk_1_sg_x296 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x18;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_c0d1d84d6b
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_2080d69675: entity work.c_to_ri1_entity_235ec30cb4
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_8f4c287073: entity work.c_to_ri_entity_8f4c287073
    port map (
      c => delay1_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 19,
      din_width => 20,
      dout_arith => 2,
      dout_bin_pt => 12,
      dout_width => 13,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 19,
      din_width => 20,
      dout_arith => 2,
      dout_bin_pt => 12,
      dout_width => 13,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      d(0) => delay3_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay1: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      d => delay2_q_net_x0,
      en => '1',
      q => delay1_q_net_x3
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 12,
      a_width => 13,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 13,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 13,
      c_output_width => 22,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_845caa9bc89072e0",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 19,
      p_width => 20,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      core_ce => ce_1_sg_x296,
      core_clk => clk_1_sg_x296,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 12,
      a_width => 13,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 13,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 13,
      c_output_width => 22,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_845caa9bc89072e0",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 19,
      p_width => 20,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      core_ce => ce_1_sg_x296,
      core_clk => clk_1_sg_x296,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_5087769a76: entity work.ri_to_c_entity_5087769a76
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x18
    );

  rr_add_ii: entity work.addsub_a9cdc93774
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_370c0f2c47
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_5777994232
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 12,
      a_width => 14,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 14,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 14,
      c_output_width => 24,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_35568d5aa6a70475",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 19,
      p_width => 20,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      core_ce => ce_1_sg_x296,
      core_clk => clk_1_sg_x296,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy2"

entity cmpy2_entity_e8fce91a43 is
  port (
    b: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(25 downto 0)
  );
end cmpy2_entity_e8fce91a43;

architecture structural of cmpy2_entity_e8fce91a43 is
  signal br_add_bi_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x297: std_logic;
  signal clk_1_sg_x297: std_logic;
  signal concat_y_net_x19: std_logic_vector(25 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(12 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(12 downto 0);
  signal delay4_q_net_x1: std_logic_vector(25 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(19 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(19 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(19 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(19 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(19 downto 0);
  signal sumsum_p_net: std_logic_vector(19 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay4_q_net_x1 <= b;
  ce_1_sg_x297 <= ce_1;
  clk_1_sg_x297 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x19;

  br_add_bi: entity work.addsub_c0d1d84d6b
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_30c44c8fac: entity work.c_to_ri1_entity_235ec30cb4
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_7c4bb21801: entity work.c_to_ri_entity_8f4c287073
    port map (
      c => delay4_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 19,
      din_width => 20,
      dout_arith => 2,
      dout_bin_pt => 12,
      dout_width => 13,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 19,
      din_width => 20,
      dout_arith => 2,
      dout_bin_pt => 12,
      dout_width => 13,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 12,
      a_width => 13,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 13,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 13,
      c_output_width => 22,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_845caa9bc89072e0",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 19,
      p_width => 20,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      clr => '0',
      core_ce => ce_1_sg_x297,
      core_clk => clk_1_sg_x297,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 12,
      a_width => 13,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 13,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 13,
      c_output_width => 22,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_845caa9bc89072e0",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 19,
      p_width => 20,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      clr => '0',
      core_ce => ce_1_sg_x297,
      core_clk => clk_1_sg_x297,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_f6eafcfe7f: entity work.ri_to_c_entity_5087769a76
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_a9cdc93774
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_370c0f2c47
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_5777994232
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 12,
      a_width => 14,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 14,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 14,
      c_output_width => 24,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_35568d5aa6a70475",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 19,
      p_width => 20,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      clr => '0',
      core_ce => ce_1_sg_x297,
      core_clk => clk_1_sg_x297,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_0adbca20d8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_0adbca20d8;

architecture structural of twiddle_gen1_entity_0adbca20d8 is
  signal addr_sel_y_net: std_logic_vector(3 downto 0);
  signal ce_1_sg_x299: std_logic;
  signal clk_1_sg_x299: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x13: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x299 <= ce_1;
  clk_1_sg_x299 <= clk_1;
  delay_q_net_x13 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 7,
      x_width => 8,
      y_width => 4
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x13,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom_dist
    generic map (
      addr_width => 4,
      c_address_width => 4,
      c_width => 18,
      core_name0 => "dmg_33_vx5_efe4f2e28a6a56b5",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_dd1820052a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_dd1820052a;

architecture structural of twiddle_gen2_entity_dd1820052a is
  signal addr_sel_y_net: std_logic_vector(3 downto 0);
  signal ce_1_sg_x300: std_logic;
  signal clk_1_sg_x300: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x14: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x300 <= ce_1;
  clk_1_sg_x300 <= clk_1;
  delay_q_net_x14 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 7,
      x_width => 8,
      y_width => 4
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x300,
      clk => clk_1_sg_x300,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x14,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom_dist
    generic map (
      addr_width => 4,
      c_address_width => 4,
      c_width => 18,
      core_name0 => "dmg_33_vx5_47bf930170fd8e60",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x300,
      clk => clk_1_sg_x300,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_2ab32a7227 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_2ab32a7227;

architecture structural of twiddle_gen3_entity_2ab32a7227 is
  signal addr_sel_y_net: std_logic_vector(3 downto 0);
  signal ce_1_sg_x301: std_logic;
  signal clk_1_sg_x301: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x15: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x301 <= ce_1;
  clk_1_sg_x301 <= clk_1;
  delay_q_net_x15 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 7,
      x_width => 8,
      y_width => 4
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x15,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom_dist
    generic map (
      addr_width => 4,
      c_address_width => 4,
      c_width => 18,
      core_name0 => "dmg_33_vx5_27954da46fb8f5d8",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3/r4_twiddle"

entity r4_twiddle_entity_586dcd3c1d is
  port (
    a_in: in std_logic_vector(25 downto 0); 
    b: in std_logic_vector(25 downto 0); 
    c: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(25 downto 0); 
    bw: out std_logic_vector(25 downto 0); 
    cw: out std_logic_vector(25 downto 0); 
    dw: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end r4_twiddle_entity_586dcd3c1d;

architecture structural of r4_twiddle_entity_586dcd3c1d is
  signal ce_1_sg_x302: std_logic;
  signal clk_1_sg_x302: std_logic;
  signal concat_y_net_x21: std_logic_vector(25 downto 0);
  signal concat_y_net_x22: std_logic_vector(25 downto 0);
  signal concat_y_net_x23: std_logic_vector(25 downto 0);
  signal delay1_q_net_x1: std_logic_vector(25 downto 0);
  signal delay1_q_net_x4: std_logic_vector(25 downto 0);
  signal delay2_q_net_x0: std_logic_vector(25 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay4_q_net_x1: std_logic_vector(25 downto 0);
  signal delay5_q_net_x1: std_logic_vector(25 downto 0);
  signal delay_q_net_x16: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x3: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x4: std_logic_vector(17 downto 0);
  signal mux1_y_net_x8: std_logic_vector(25 downto 0);
  signal mux1_y_net_x9: std_logic_vector(25 downto 0);
  signal slr_q_net_x10: std_logic_vector(25 downto 0);
  signal slr_q_net_x11: std_logic_vector(25 downto 0);

begin
  slr_q_net_x10 <= a_in;
  mux1_y_net_x8 <= b;
  slr_q_net_x11 <= c;
  ce_1_sg_x302 <= ce_1;
  clk_1_sg_x302 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x16 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x22;
  dw <= concat_y_net_x23;
  sync_out <= delay_q_net_x4;

  cmpy1_b40a7576a2: entity work.cmpy1_entity_b40a7576a2
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_e8fce91a43: entity work.cmpy2_entity_e8fce91a43
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x22
    );

  cmpy3_e17f9b3d60: entity work.cmpy2_entity_e8fce91a43
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      w => mem_c_data_net_x4,
      bw => concat_y_net_x23
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      d => mux1_y_net_x8,
      en => '1',
      q => delay1_q_net_x1
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      d => slr_q_net_x10,
      en => '1',
      q => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      d(0) => delay_q_net_x16,
      en => '1',
      q(0) => delay3_q_net_x0
    );

  delay4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      d => slr_q_net_x11,
      en => '1',
      q => delay4_q_net_x1
    );

  delay5: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_0adbca20d8: entity work.twiddle_gen1_entity_0adbca20d8
    port map (
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      sync_in => delay_q_net_x16,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_dd1820052a: entity work.twiddle_gen2_entity_dd1820052a
    port map (
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      sync_in => delay_q_net_x16,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_2ab32a7227: entity work.twiddle_gen3_entity_2ab32a7227
    port map (
      ce_1 => ce_1_sg_x302,
      clk_1 => clk_1_sg_x302,
      sync_in => delay_q_net_x16,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_3"

entity r4_dit_stage_3_entity_2c3798b44c is
  port (
    a_in: in std_logic_vector(25 downto 0); 
    b_in: in std_logic_vector(25 downto 0); 
    c_in: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(29 downto 0); 
    b_out: out std_logic_vector(29 downto 0); 
    c_out: out std_logic_vector(29 downto 0); 
    d_out: out std_logic_vector(29 downto 0); 
    sync_out: out std_logic
  );
end r4_dit_stage_3_entity_2c3798b44c;

architecture structural of r4_dit_stage_3_entity_2c3798b44c is
  signal ce_1_sg_x303: std_logic;
  signal clk_1_sg_x303: std_logic;
  signal concat_y_net_x23: std_logic_vector(25 downto 0);
  signal concat_y_net_x24: std_logic_vector(25 downto 0);
  signal concat_y_net_x25: std_logic_vector(25 downto 0);
  signal concat_y_net_x48: std_logic_vector(25 downto 0);
  signal concat_y_net_x49: std_logic_vector(25 downto 0);
  signal concat_y_net_x50: std_logic_vector(25 downto 0);
  signal concat_y_net_x51: std_logic_vector(25 downto 0);
  signal concat_y_net_x52: std_logic_vector(29 downto 0);
  signal concat_y_net_x53: std_logic_vector(29 downto 0);
  signal concat_y_net_x54: std_logic_vector(29 downto 0);
  signal concat_y_net_x55: std_logic_vector(29 downto 0);
  signal delay1_q_net_x4: std_logic_vector(25 downto 0);
  signal delay_q_net_x12: std_logic;
  signal delay_q_net_x13: std_logic;
  signal delay_q_net_x14: std_logic;
  signal delay_q_net_x16: std_logic;
  signal mux1_y_net_x8: std_logic_vector(25 downto 0);
  signal mux1_y_net_x9: std_logic_vector(25 downto 0);
  signal slr_q_net_x10: std_logic_vector(25 downto 0);
  signal slr_q_net_x11: std_logic_vector(25 downto 0);

begin
  concat_y_net_x48 <= a_in;
  concat_y_net_x49 <= b_in;
  concat_y_net_x50 <= c_in;
  ce_1_sg_x303 <= ce_1;
  clk_1_sg_x303 <= clk_1;
  concat_y_net_x51 <= d_in;
  delay_q_net_x13 <= sync_in;
  a_out <= concat_y_net_x52;
  b_out <= concat_y_net_x53;
  c_out <= concat_y_net_x54;
  d_out <= concat_y_net_x55;
  sync_out <= delay_q_net_x14;

  quadplex_commutator_099e0d8a58: entity work.quadplex_commutator_entity_099e0d8a58
    port map (
      a => concat_y_net_x48,
      b => concat_y_net_x49,
      c => concat_y_net_x50,
      ce_1 => ce_1_sg_x303,
      clk_1 => clk_1_sg_x303,
      d => concat_y_net_x51,
      sync_in => delay_q_net_x13,
      abcd0 => slr_q_net_x10,
      abcd1 => mux1_y_net_x8,
      abcd2 => slr_q_net_x11,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x16
    );

  r4_butterfly_89c1449d58: entity work.r4_butterfly_entity_89c1449d58
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x23,
      c_in => concat_y_net_x24,
      ce_1 => ce_1_sg_x303,
      clk_1 => clk_1_sg_x303,
      d_in => concat_y_net_x25,
      sync_in => delay_q_net_x12,
      a_out => concat_y_net_x52,
      b_out => concat_y_net_x53,
      c_out => concat_y_net_x54,
      d_out => concat_y_net_x55,
      sync_out => delay_q_net_x14
    );

  r4_twiddle_586dcd3c1d: entity work.r4_twiddle_entity_586dcd3c1d
    port map (
      a_in => slr_q_net_x10,
      b => mux1_y_net_x8,
      c => slr_q_net_x11,
      ce_1 => ce_1_sg_x303,
      clk_1 => clk_1_sg_x303,
      d => mux1_y_net_x9,
      sync_in => delay_q_net_x16,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x23,
      cw => concat_y_net_x24,
      dw => concat_y_net_x25,
      sync_out => delay_q_net_x12
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_93a5e1d393 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(29 downto 0); 
    out_x0: out std_logic_vector(29 downto 0)
  );
end delay_b_entity_93a5e1d393;

architecture structural of delay_b_entity_93a5e1d393 is
  signal ce_1_sg_x304: std_logic;
  signal clk_1_sg_x304: std_logic;
  signal slr_q_net_x1: std_logic_vector(29 downto 0);
  signal slr_q_net_x2: std_logic_vector(29 downto 0);

begin
  ce_1_sg_x304 <= ce_1;
  clk_1_sg_x304 <= clk_1;
  slr_q_net_x1 <= in_x0;
  out_x0 <= slr_q_net_x2;

  slr: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 30
    )
    port map (
      ce => ce_1_sg_x304,
      clk => clk_1_sg_x304,
      d => slr_q_net_x1,
      en => '1',
      q => slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_a848167dd1 is
  port (
    aloahi: in std_logic_vector(29 downto 0); 
    blobhi: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(29 downto 0); 
    aloblo: out std_logic_vector(29 downto 0)
  );
end biplex_commutator_01_entity_a848167dd1;

architecture structural of biplex_commutator_01_entity_a848167dd1 is
  signal ce_1_sg_x306: std_logic;
  signal clk_1_sg_x306: std_logic;
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(29 downto 0);
  signal mux_y_net_x0: std_logic_vector(29 downto 0);
  signal slr_q_net_x2: std_logic_vector(29 downto 0);
  signal slr_q_net_x3: std_logic_vector(29 downto 0);
  signal slr_q_net_x4: std_logic_vector(29 downto 0);
  signal slr_q_net_x5: std_logic_vector(29 downto 0);
  signal top_bit_y_net: std_logic;

begin
  slr_q_net_x3 <= aloahi;
  slr_q_net_x4 <= blobhi;
  ce_1_sg_x306 <= ce_1;
  clk_1_sg_x306 <= clk_1;
  delay_q_net_x0 <= sync_in;
  ahibhi <= mux1_y_net_x0;
  aloblo <= slr_q_net_x5;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_924a7f7132ea4004",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x306,
      clk => clk_1_sg_x306,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_93a5e1d393: entity work.delay_b_entity_93a5e1d393
    port map (
      ce_1 => ce_1_sg_x306,
      clk_1 => clk_1_sg_x306,
      in_x0 => slr_q_net_x4,
      out_x0 => slr_q_net_x2
    );

  delay_lo_a273287728: entity work.delay_b_entity_93a5e1d393
    port map (
      ce_1 => ce_1_sg_x306,
      clk_1 => clk_1_sg_x306,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x306,
      clk => clk_1_sg_x306,
      clr => '0',
      d0 => slr_q_net_x3,
      d1 => slr_q_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x306,
      clk => clk_1_sg_x306,
      clr => '0',
      d0 => slr_q_net_x2,
      d1 => slr_q_net_x3,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x0
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 3,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_1d6e2e2785 is
  port (
    aloahi: in std_logic_vector(29 downto 0); 
    blobhi: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(29 downto 0); 
    aloblo: out std_logic_vector(29 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_23_entity_1d6e2e2785;

architecture structural of biplex_commutator_23_entity_1d6e2e2785 is
  signal ce_1_sg_x309: std_logic;
  signal clk_1_sg_x309: std_logic;
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x2: std_logic_vector(29 downto 0);
  signal mux1_y_net_x3: std_logic_vector(29 downto 0);
  signal mux1_y_net_x4: std_logic_vector(29 downto 0);
  signal mux_y_net_x0: std_logic_vector(29 downto 0);
  signal slr_q_net_x0: std_logic_vector(29 downto 0);
  signal slr_q_net_x2: std_logic_vector(29 downto 0);
  signal top_bit_y_net: std_logic;

begin
  mux1_y_net_x2 <= aloahi;
  mux1_y_net_x3 <= blobhi;
  ce_1_sg_x309 <= ce_1;
  clk_1_sg_x309 <= clk_1;
  delay_q_net_x1 <= sync_in;
  ahibhi <= mux1_y_net_x4;
  aloblo <= slr_q_net_x2;
  sync_out <= delay_q_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_924a7f7132ea4004",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x309,
      clk => clk_1_sg_x309,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x1,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 5,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x309,
      clk => clk_1_sg_x309,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_039962539d: entity work.delay_b_entity_93a5e1d393
    port map (
      ce_1 => ce_1_sg_x309,
      clk_1 => clk_1_sg_x309,
      in_x0 => mux1_y_net_x3,
      out_x0 => slr_q_net_x0
    );

  delay_lo_97a90868ed: entity work.delay_b_entity_93a5e1d393
    port map (
      ce_1 => ce_1_sg_x309,
      clk_1 => clk_1_sg_x309,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x2
    );

  mux: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x309,
      clk => clk_1_sg_x309,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x309,
      clk => clk_1_sg_x309,
      clr => '0',
      d0 => slr_q_net_x0,
      d1 => mux1_y_net_x2,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x4
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 3,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_aacd9de098 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(29 downto 0); 
    out_x0: out std_logic_vector(29 downto 0)
  );
end delay_b_entity_aacd9de098;

architecture structural of delay_b_entity_aacd9de098 is
  signal ce_1_sg_x310: std_logic;
  signal clk_1_sg_x310: std_logic;
  signal concat_y_net_x55: std_logic_vector(29 downto 0);
  signal slr_q_net_x0: std_logic_vector(29 downto 0);

begin
  ce_1_sg_x310 <= ce_1;
  clk_1_sg_x310 <= clk_1;
  concat_y_net_x55 <= in_x0;
  out_x0 <= slr_q_net_x0;

  slr: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 30
    )
    port map (
      ce => ce_1_sg_x310,
      clk => clk_1_sg_x310,
      d => concat_y_net_x55,
      en => '1',
      q => slr_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_bbe72acff3 is
  port (
    aloahi: in std_logic_vector(29 downto 0); 
    blobhi: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(29 downto 0); 
    aloblo: out std_logic_vector(29 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_ac_entity_bbe72acff3;

architecture structural of biplex_commutator_ac_entity_bbe72acff3 is
  signal ce_1_sg_x312: std_logic;
  signal clk_1_sg_x312: std_logic;
  signal concat_y_net_x56: std_logic_vector(29 downto 0);
  signal concat_y_net_x57: std_logic_vector(29 downto 0);
  signal counter_op_net: std_logic_vector(3 downto 0);
  signal delay_q_net_x15: std_logic;
  signal delay_q_net_x16: std_logic;
  signal mux1_y_net_x3: std_logic_vector(29 downto 0);
  signal mux_y_net_x0: std_logic_vector(29 downto 0);
  signal slr_q_net_x0: std_logic_vector(29 downto 0);
  signal slr_q_net_x5: std_logic_vector(29 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x56 <= aloahi;
  concat_y_net_x57 <= blobhi;
  ce_1_sg_x312 <= ce_1;
  clk_1_sg_x312 <= clk_1;
  delay_q_net_x15 <= sync_in;
  ahibhi <= mux1_y_net_x3;
  aloblo <= slr_q_net_x5;
  sync_out <= delay_q_net_x16;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_833a35886d0c544c",
      op_arith => xlUnsigned,
      op_width => 4
    )
    port map (
      ce => ce_1_sg_x312,
      clk => clk_1_sg_x312,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x15,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x312,
      clk => clk_1_sg_x312,
      d(0) => delay_q_net_x15,
      en => '1',
      q(0) => delay_q_net_x16
    );

  delay_b_aacd9de098: entity work.delay_b_entity_aacd9de098
    port map (
      ce_1 => ce_1_sg_x312,
      clk_1 => clk_1_sg_x312,
      in_x0 => concat_y_net_x57,
      out_x0 => slr_q_net_x0
    );

  delay_lo_bd3bf5dc80: entity work.delay_b_entity_aacd9de098
    port map (
      ce_1 => ce_1_sg_x312,
      clk_1 => clk_1_sg_x312,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x312,
      clk => clk_1_sg_x312,
      clr => '0',
      d0 => concat_y_net_x56,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x312,
      clk => clk_1_sg_x312,
      clr => '0',
      d0 => slr_q_net_x0,
      d1 => concat_y_net_x56,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x3
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 3,
      new_msb => 3,
      x_width => 4,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/quadplex_commutator"

entity quadplex_commutator_entity_3cfacc98aa is
  port (
    a: in std_logic_vector(29 downto 0); 
    b: in std_logic_vector(29 downto 0); 
    c: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(29 downto 0); 
    sync_in: in std_logic; 
    abcd0: out std_logic_vector(29 downto 0); 
    abcd1: out std_logic_vector(29 downto 0); 
    abcd2: out std_logic_vector(29 downto 0); 
    abcd3: out std_logic_vector(29 downto 0); 
    sync_out: out std_logic
  );
end quadplex_commutator_entity_3cfacc98aa;

architecture structural of quadplex_commutator_entity_3cfacc98aa is
  signal ce_1_sg_x316: std_logic;
  signal clk_1_sg_x316: std_logic;
  signal concat_y_net_x60: std_logic_vector(29 downto 0);
  signal concat_y_net_x61: std_logic_vector(29 downto 0);
  signal concat_y_net_x62: std_logic_vector(29 downto 0);
  signal concat_y_net_x63: std_logic_vector(29 downto 0);
  signal delay_q_net_x17: std_logic;
  signal delay_q_net_x18: std_logic;
  signal delay_q_net_x19: std_logic;
  signal delay_q_net_x20: std_logic;
  signal mux1_y_net_x3: std_logic_vector(29 downto 0);
  signal mux1_y_net_x5: std_logic_vector(29 downto 0);
  signal mux1_y_net_x6: std_logic_vector(29 downto 0);
  signal mux1_y_net_x7: std_logic_vector(29 downto 0);
  signal slr_q_net_x6: std_logic_vector(29 downto 0);
  signal slr_q_net_x7: std_logic_vector(29 downto 0);
  signal slr_q_net_x8: std_logic_vector(29 downto 0);
  signal slr_q_net_x9: std_logic_vector(29 downto 0);

begin
  concat_y_net_x60 <= a;
  concat_y_net_x61 <= b;
  concat_y_net_x62 <= c;
  ce_1_sg_x316 <= ce_1;
  clk_1_sg_x316 <= clk_1;
  concat_y_net_x63 <= d;
  delay_q_net_x19 <= sync_in;
  abcd0 <= slr_q_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= slr_q_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x20;

  biplex_commutator_01_a848167dd1: entity work.biplex_commutator_01_entity_a848167dd1
    port map (
      aloahi => slr_q_net_x6,
      blobhi => slr_q_net_x7,
      ce_1 => ce_1_sg_x316,
      clk_1 => clk_1_sg_x316,
      sync_in => delay_q_net_x17,
      ahibhi => mux1_y_net_x6,
      aloblo => slr_q_net_x8
    );

  biplex_commutator_23_1d6e2e2785: entity work.biplex_commutator_23_entity_1d6e2e2785
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x316,
      clk_1 => clk_1_sg_x316,
      sync_in => delay_q_net_x18,
      ahibhi => mux1_y_net_x7,
      aloblo => slr_q_net_x9,
      sync_out => delay_q_net_x20
    );

  biplex_commutator_ac_bbe72acff3: entity work.biplex_commutator_ac_entity_bbe72acff3
    port map (
      aloahi => concat_y_net_x60,
      blobhi => concat_y_net_x62,
      ce_1 => ce_1_sg_x316,
      clk_1 => clk_1_sg_x316,
      sync_in => delay_q_net_x19,
      ahibhi => mux1_y_net_x3,
      aloblo => slr_q_net_x6,
      sync_out => delay_q_net_x17
    );

  biplex_commutator_bd_5a212f8046: entity work.biplex_commutator_ac_entity_bbe72acff3
    port map (
      aloahi => concat_y_net_x61,
      blobhi => concat_y_net_x63,
      ce_1 => ce_1_sg_x316,
      clk_1 => clk_1_sg_x316,
      sync_in => delay_q_net_x19,
      ahibhi => mux1_y_net_x5,
      aloblo => slr_q_net_x7,
      sync_out => delay_q_net_x18
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_b1c71abf99 is
  port (
    c: in std_logic_vector(29 downto 0); 
    im: out std_logic_vector(14 downto 0); 
    re: out std_logic_vector(14 downto 0)
  );
end c_to_ri_entity_b1c71abf99;

architecture structural of c_to_ri_entity_b1c71abf99 is
  signal delay1_q_net_x0: std_logic_vector(29 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(14 downto 0);
  signal slice_im_y_net: std_logic_vector(14 downto 0);
  signal slice_re_y_net: std_logic_vector(14 downto 0);

begin
  delay1_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_c2430bbd90
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_c2430bbd90
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 14,
      x_width => 30,
      y_width => 15
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 15,
      new_msb => 29,
      x_width => 30,
      y_width => 15
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_e1a2caef3c is
  port (
    im: in std_logic_vector(15 downto 0); 
    re: in std_logic_vector(15 downto 0); 
    c: out std_logic_vector(31 downto 0)
  );
end ri_to_c_entity_e1a2caef3c;

architecture structural of ri_to_c_entity_e1a2caef3c is
  signal concat_y_net_x0: std_logic_vector(31 downto 0);
  signal force_im_output_port_net: std_logic_vector(15 downto 0);
  signal force_re_output_port_net: std_logic_vector(15 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(15 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(15 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_a369e00c6b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_7025463ea8
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_7025463ea8
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant0_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly0"

entity butterfly0_entity_fbbb5db33e is
  port (
    a: in std_logic_vector(29 downto 0); 
    b: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(31 downto 0); 
    a_b_x0: out std_logic_vector(31 downto 0)
  );
end butterfly0_entity_fbbb5db33e;

architecture structural of butterfly0_entity_fbbb5db33e is
  signal add_im_s_net: std_logic_vector(15 downto 0);
  signal add_re_s_net: std_logic_vector(15 downto 0);
  signal ce_1_sg_x317: std_logic;
  signal clk_1_sg_x317: std_logic;
  signal concat_y_net_x3: std_logic_vector(29 downto 0);
  signal concat_y_net_x4: std_logic_vector(31 downto 0);
  signal concat_y_net_x5: std_logic_vector(31 downto 0);
  signal delay1_q_net_x1: std_logic_vector(29 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(14 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(14 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(15 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(15 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(15 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(15 downto 0);
  signal shift0_op_net: std_logic_vector(15 downto 0);
  signal shift1_op_net: std_logic_vector(15 downto 0);
  signal shift2_op_net: std_logic_vector(15 downto 0);
  signal shift3_op_net: std_logic_vector(15 downto 0);
  signal sub_im_s_net: std_logic_vector(15 downto 0);
  signal sub_re_s_net: std_logic_vector(15 downto 0);

begin
  delay1_q_net_x1 <= a;
  concat_y_net_x3 <= b;
  ce_1_sg_x317 <= ce_1;
  clk_1_sg_x317 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_e8bb7c4e8b
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_e8bb7c4e8b
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_1cc89dcf9b: entity work.c_to_ri_entity_b1c71abf99
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_b1c71abf99: entity work.c_to_ri_entity_b1c71abf99
    port map (
      c => delay1_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_86ca4f9a8f: entity work.ri_to_c_entity_e1a2caef3c
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_e1a2caef3c: entity work.ri_to_c_entity_e1a2caef3c
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x4
    );

  shift0: entity work.scale_fa7c2ab9f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_fa7c2ab9f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_fa7c2ab9f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_fa7c2ab9f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_81ed09e952
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_81ed09e952
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly1"

entity butterfly1_entity_6b234461e3 is
  port (
    a: in std_logic_vector(29 downto 0); 
    b: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(31 downto 0); 
    a_b_x0: out std_logic_vector(31 downto 0); 
    sync_out: out std_logic
  );
end butterfly1_entity_6b234461e3;

architecture structural of butterfly1_entity_6b234461e3 is
  signal add_im_s_net: std_logic_vector(15 downto 0);
  signal add_re_s_net: std_logic_vector(15 downto 0);
  signal ce_1_sg_x318: std_logic;
  signal clk_1_sg_x318: std_logic;
  signal concat_y_net_x4: std_logic_vector(29 downto 0);
  signal concat_y_net_x5: std_logic_vector(29 downto 0);
  signal concat_y_net_x6: std_logic_vector(31 downto 0);
  signal concat_y_net_x7: std_logic_vector(31 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(14 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(14 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(15 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(15 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(15 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(15 downto 0);
  signal shift0_op_net: std_logic_vector(15 downto 0);
  signal shift1_op_net: std_logic_vector(15 downto 0);
  signal shift2_op_net: std_logic_vector(15 downto 0);
  signal shift3_op_net: std_logic_vector(15 downto 0);
  signal sub_im_s_net: std_logic_vector(15 downto 0);
  signal sub_re_s_net: std_logic_vector(15 downto 0);

begin
  concat_y_net_x4 <= a;
  concat_y_net_x5 <= b;
  ce_1_sg_x318 <= ce_1;
  clk_1_sg_x318 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_e8bb7c4e8b
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_e8bb7c4e8b
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_0b34e6739c: entity work.c_to_ri_entity_b1c71abf99
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_ce1d756820: entity work.c_to_ri_entity_b1c71abf99
    port map (
      c => concat_y_net_x4,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_6104236b73: entity work.ri_to_c_entity_e1a2caef3c
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_6b09bb1703: entity work.ri_to_c_entity_e1a2caef3c
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x6
    );

  shift0: entity work.scale_fa7c2ab9f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_fa7c2ab9f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_fa7c2ab9f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_fa7c2ab9f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_81ed09e952
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_81ed09e952
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_07b272eaae is
  port (
    c: in std_logic_vector(31 downto 0); 
    im: out std_logic_vector(15 downto 0); 
    re: out std_logic_vector(15 downto 0)
  );
end c_to_ri_entity_07b272eaae;

architecture structural of c_to_ri_entity_07b272eaae is
  signal concat_y_net_x5: std_logic_vector(31 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(15 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(15 downto 0);
  signal slice_im_y_net: std_logic_vector(15 downto 0);
  signal slice_re_y_net: std_logic_vector(15 downto 0);

begin
  concat_y_net_x5 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 15,
      x_width => 32,
      y_width => 16
    )
    port map (
      x => concat_y_net_x5,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 31,
      x_width => 32,
      y_width => 16
    )
    port map (
      x => concat_y_net_x5,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_db49a63927 is
  port (
    im: in std_logic_vector(16 downto 0); 
    re: in std_logic_vector(16 downto 0); 
    c: out std_logic_vector(33 downto 0)
  );
end ri_to_c_entity_db49a63927;

architecture structural of ri_to_c_entity_db49a63927 is
  signal concat_y_net_x0: std_logic_vector(33 downto 0);
  signal force_im_output_port_net: std_logic_vector(16 downto 0);
  signal force_re_output_port_net: std_logic_vector(16 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(16 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(16 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_25b7e1d1f5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_573890e1c0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_573890e1c0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant0_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly2"

entity butterfly2_entity_a7e3797288 is
  port (
    a: in std_logic_vector(31 downto 0); 
    b: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(33 downto 0); 
    a_b_x0: out std_logic_vector(33 downto 0)
  );
end butterfly2_entity_a7e3797288;

architecture structural of butterfly2_entity_a7e3797288 is
  signal add_im_s_net: std_logic_vector(16 downto 0);
  signal add_re_s_net: std_logic_vector(16 downto 0);
  signal ce_1_sg_x319: std_logic;
  signal clk_1_sg_x319: std_logic;
  signal concat_y_net_x10: std_logic_vector(31 downto 0);
  signal concat_y_net_x11: std_logic_vector(33 downto 0);
  signal concat_y_net_x12: std_logic_vector(33 downto 0);
  signal concat_y_net_x9: std_logic_vector(31 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(15 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(15 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(15 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(15 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(16 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(16 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(16 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(16 downto 0);
  signal shift0_op_net: std_logic_vector(16 downto 0);
  signal shift1_op_net: std_logic_vector(16 downto 0);
  signal shift2_op_net: std_logic_vector(16 downto 0);
  signal shift3_op_net: std_logic_vector(16 downto 0);
  signal sub_im_s_net: std_logic_vector(16 downto 0);
  signal sub_re_s_net: std_logic_vector(16 downto 0);

begin
  concat_y_net_x9 <= a;
  concat_y_net_x10 <= b;
  ce_1_sg_x319 <= ce_1;
  clk_1_sg_x319 <= clk_1;
  a_b <= concat_y_net_x11;
  a_b_x0 <= concat_y_net_x12;

  add_im: entity work.addsub_14b004d38d
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x319,
      clk => clk_1_sg_x319,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_14b004d38d
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x319,
      clk => clk_1_sg_x319,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_3f6fd44db1: entity work.c_to_ri_entity_07b272eaae
    port map (
      c => concat_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_07b272eaae: entity work.c_to_ri_entity_07b272eaae
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_fd492befe6: entity work.ri_to_c_entity_db49a63927
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x12
    );

  ri_to_c_db49a63927: entity work.ri_to_c_entity_db49a63927
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x11
    );

  shift0: entity work.scale_b42effccbc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_b42effccbc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_b42effccbc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_b42effccbc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_5d0bd43700
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x319,
      clk => clk_1_sg_x319,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_5d0bd43700
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x319,
      clk => clk_1_sg_x319,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly3j"

entity butterfly3j_entity_363270c24a is
  port (
    a: in std_logic_vector(31 downto 0); 
    b: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(33 downto 0); 
    a_b_x0: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end butterfly3j_entity_363270c24a;

architecture structural of butterfly3j_entity_363270c24a is
  signal add_im_s_net: std_logic_vector(16 downto 0);
  signal add_re_s_net: std_logic_vector(16 downto 0);
  signal ce_1_sg_x320: std_logic;
  signal clk_1_sg_x320: std_logic;
  signal concat_y_net_x10: std_logic_vector(33 downto 0);
  signal concat_y_net_x11: std_logic_vector(33 downto 0);
  signal concat_y_net_x7: std_logic_vector(31 downto 0);
  signal concat_y_net_x9: std_logic_vector(31 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(15 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(15 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(15 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(15 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(16 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(16 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(16 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(16 downto 0);
  signal shift0_op_net: std_logic_vector(16 downto 0);
  signal shift1_op_net: std_logic_vector(16 downto 0);
  signal shift2_op_net: std_logic_vector(16 downto 0);
  signal shift3_op_net: std_logic_vector(16 downto 0);
  signal sub_im_s_net: std_logic_vector(16 downto 0);
  signal sub_re_s_net: std_logic_vector(16 downto 0);

begin
  concat_y_net_x7 <= a;
  concat_y_net_x9 <= b;
  ce_1_sg_x320 <= ce_1;
  clk_1_sg_x320 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x10;
  a_b_x0 <= concat_y_net_x11;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_5d0bd43700
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_14b004d38d
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_c5f78f2087: entity work.c_to_ri_entity_07b272eaae
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_c40bb286f0: entity work.c_to_ri_entity_07b272eaae
    port map (
      c => concat_y_net_x7,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      d(0) => delay_q_net_x3,
      en => '1',
      q(0) => delay_q_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 17,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 17,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_1693748f7a: entity work.ri_to_c_entity_db49a63927
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x11
    );

  ri_to_c_5736bfa5cb: entity work.ri_to_c_entity_db49a63927
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x10
    );

  shift0: entity work.scale_b42effccbc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_b42effccbc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_b42effccbc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_b42effccbc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_14b004d38d
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_5d0bd43700
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_butterfly"

entity r4_butterfly_entity_6f65cb49c8 is
  port (
    a_in: in std_logic_vector(29 downto 0); 
    b_in: in std_logic_vector(29 downto 0); 
    c_in: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(29 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(33 downto 0); 
    b_out: out std_logic_vector(33 downto 0); 
    c_out: out std_logic_vector(33 downto 0); 
    d_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end r4_butterfly_entity_6f65cb49c8;

architecture structural of r4_butterfly_entity_6f65cb49c8 is
  signal ce_1_sg_x321: std_logic;
  signal clk_1_sg_x321: std_logic;
  signal concat_y_net_x10: std_logic_vector(31 downto 0);
  signal concat_y_net_x11: std_logic_vector(31 downto 0);
  signal concat_y_net_x16: std_logic_vector(29 downto 0);
  signal concat_y_net_x17: std_logic_vector(29 downto 0);
  signal concat_y_net_x18: std_logic_vector(29 downto 0);
  signal concat_y_net_x19: std_logic_vector(33 downto 0);
  signal concat_y_net_x20: std_logic_vector(33 downto 0);
  signal concat_y_net_x21: std_logic_vector(33 downto 0);
  signal concat_y_net_x22: std_logic_vector(33 downto 0);
  signal concat_y_net_x7: std_logic_vector(31 downto 0);
  signal concat_y_net_x9: std_logic_vector(31 downto 0);
  signal delay1_q_net_x2: std_logic_vector(29 downto 0);
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;

begin
  delay1_q_net_x2 <= a_in;
  concat_y_net_x16 <= b_in;
  concat_y_net_x17 <= c_in;
  ce_1_sg_x321 <= ce_1;
  clk_1_sg_x321 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  butterfly0_fbbb5db33e: entity work.butterfly0_entity_fbbb5db33e
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x17,
      ce_1 => ce_1_sg_x321,
      clk_1 => clk_1_sg_x321,
      a_b => concat_y_net_x9,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_6b234461e3: entity work.butterfly1_entity_6b234461e3
    port map (
      a => concat_y_net_x16,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x321,
      clk_1 => clk_1_sg_x321,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x10,
      a_b_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x3
    );

  butterfly2_a7e3797288: entity work.butterfly2_entity_a7e3797288
    port map (
      a => concat_y_net_x9,
      b => concat_y_net_x10,
      ce_1 => ce_1_sg_x321,
      clk_1 => clk_1_sg_x321,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_363270c24a: entity work.butterfly3j_entity_363270c24a
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x321,
      clk_1 => clk_1_sg_x321,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_8fd0e42171 is
  port (
    c: in std_logic_vector(29 downto 0); 
    im: out std_logic_vector(14 downto 0); 
    re: out std_logic_vector(14 downto 0)
  );
end c_to_ri_entity_8fd0e42171;

architecture structural of c_to_ri_entity_8fd0e42171 is
  signal delay1_q_net_x0: std_logic_vector(29 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(14 downto 0);
  signal slice_im_y_net: std_logic_vector(14 downto 0);
  signal slice_re_y_net: std_logic_vector(14 downto 0);

begin
  delay1_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_c2430bbd90
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_c2430bbd90
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 14,
      x_width => 30,
      y_width => 15
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 15,
      new_msb => 29,
      x_width => 30,
      y_width => 15
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_656ee70db5 is
  port (
    im: in std_logic_vector(14 downto 0); 
    re: in std_logic_vector(14 downto 0); 
    c: out std_logic_vector(29 downto 0)
  );
end ri_to_c_entity_656ee70db5;

architecture structural of ri_to_c_entity_656ee70db5 is
  signal concat_y_net_x17: std_logic_vector(29 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(14 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(14 downto 0);
  signal force_im_output_port_net: std_logic_vector(14 downto 0);
  signal force_re_output_port_net: std_logic_vector(14 downto 0);

begin
  convert_im_dout_net_x0 <= im;
  convert_re_dout_net_x0 <= re;
  c <= concat_y_net_x17;

  concat: entity work.concat_22467883b2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x17
    );

  force_im: entity work.reinterpret_0d1490be80
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_im_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_0d1490be80
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_re_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy1"

entity cmpy1_entity_6a3cbc160f is
  port (
    a_in: in std_logic_vector(29 downto 0); 
    b: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    a_out: out std_logic_vector(29 downto 0); 
    bw: out std_logic_vector(29 downto 0); 
    sync_out: out std_logic
  );
end cmpy1_entity_6a3cbc160f;

architecture structural of cmpy1_entity_6a3cbc160f is
  signal br_add_bi_s_net: std_logic_vector(15 downto 0);
  signal ce_1_sg_x322: std_logic;
  signal clk_1_sg_x322: std_logic;
  signal concat_y_net_x18: std_logic_vector(29 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(14 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(14 downto 0);
  signal delay1_q_net_x1: std_logic_vector(29 downto 0);
  signal delay1_q_net_x3: std_logic_vector(29 downto 0);
  signal delay2_q_net_x0: std_logic_vector(29 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(21 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(21 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(21 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(21 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(21 downto 0);
  signal sumsum_p_net: std_logic_vector(21 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay2_q_net_x0 <= a_in;
  delay1_q_net_x1 <= b;
  ce_1_sg_x322 <= ce_1;
  clk_1_sg_x322 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x18;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_24b2bc78a0
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_27a8198bd8: entity work.c_to_ri1_entity_235ec30cb4
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_8fd0e42171: entity work.c_to_ri_entity_8fd0e42171
    port map (
      c => delay1_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 21,
      din_width => 22,
      dout_arith => 2,
      dout_bin_pt => 14,
      dout_width => 15,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 21,
      din_width => 22,
      dout_arith => 2,
      dout_bin_pt => 14,
      dout_width => 15,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      d(0) => delay3_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay1: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 30
    )
    port map (
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      d => delay2_q_net_x0,
      en => '1',
      q => delay1_q_net_x3
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 15,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 15,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 15,
      c_output_width => 24,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_9a2572cfdd818f42",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 21,
      p_width => 22,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      core_ce => ce_1_sg_x322,
      core_clk => clk_1_sg_x322,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 15,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 15,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 15,
      c_output_width => 24,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_9a2572cfdd818f42",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 21,
      p_width => 22,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      core_ce => ce_1_sg_x322,
      core_clk => clk_1_sg_x322,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_656ee70db5: entity work.ri_to_c_entity_656ee70db5
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x18
    );

  rr_add_ii: entity work.addsub_c7058621d7
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_977ed7b8a2
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_0f2f4c67a4
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 16,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 16,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 16,
      c_output_width => 26,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_e96fd0f2d7a7d0c5",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 21,
      p_width => 22,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      core_ce => ce_1_sg_x322,
      core_clk => clk_1_sg_x322,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy2"

entity cmpy2_entity_1598a9f876 is
  port (
    b: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(29 downto 0)
  );
end cmpy2_entity_1598a9f876;

architecture structural of cmpy2_entity_1598a9f876 is
  signal br_add_bi_s_net: std_logic_vector(15 downto 0);
  signal ce_1_sg_x323: std_logic;
  signal clk_1_sg_x323: std_logic;
  signal concat_y_net_x19: std_logic_vector(29 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(14 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(14 downto 0);
  signal delay4_q_net_x1: std_logic_vector(29 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(21 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(21 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(21 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(21 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(21 downto 0);
  signal sumsum_p_net: std_logic_vector(21 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay4_q_net_x1 <= b;
  ce_1_sg_x323 <= ce_1;
  clk_1_sg_x323 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x19;

  br_add_bi: entity work.addsub_24b2bc78a0
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_53d329be69: entity work.c_to_ri1_entity_235ec30cb4
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_80e698925f: entity work.c_to_ri_entity_8fd0e42171
    port map (
      c => delay4_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 21,
      din_width => 22,
      dout_arith => 2,
      dout_bin_pt => 14,
      dout_width => 15,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 21,
      din_width => 22,
      dout_arith => 2,
      dout_bin_pt => 14,
      dout_width => 15,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 15,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 15,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 15,
      c_output_width => 24,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_9a2572cfdd818f42",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 21,
      p_width => 22,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      clr => '0',
      core_ce => ce_1_sg_x323,
      core_clk => clk_1_sg_x323,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 15,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 15,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 15,
      c_output_width => 24,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_9a2572cfdd818f42",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 21,
      p_width => 22,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      clr => '0',
      core_ce => ce_1_sg_x323,
      core_clk => clk_1_sg_x323,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_ff759f0360: entity work.ri_to_c_entity_656ee70db5
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_c7058621d7
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_977ed7b8a2
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_0f2f4c67a4
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 16,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 16,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 16,
      c_output_width => 26,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_e96fd0f2d7a7d0c5",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 21,
      p_width => 22,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      clr => '0',
      core_ce => ce_1_sg_x323,
      core_clk => clk_1_sg_x323,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_cddd385717 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_cddd385717;

architecture structural of twiddle_gen1_entity_cddd385717 is
  signal addr_sel_y_net: std_logic_vector(5 downto 0);
  signal ce_1_sg_x325: std_logic;
  signal clk_1_sg_x325: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x21: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x325 <= ce_1;
  clk_1_sg_x325 <= clk_1;
  delay_q_net_x21 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 7,
      x_width => 8,
      y_width => 6
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x21,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom
    generic map (
      c_address_width => 6,
      c_width => 18,
      core_name0 => "bmg_24_vx5_e356d8b9149f54d5",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_ca5064c2af is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_ca5064c2af;

architecture structural of twiddle_gen2_entity_ca5064c2af is
  signal addr_sel_y_net: std_logic_vector(5 downto 0);
  signal ce_1_sg_x326: std_logic;
  signal clk_1_sg_x326: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x22: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x326 <= ce_1;
  clk_1_sg_x326 <= clk_1;
  delay_q_net_x22 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 7,
      x_width => 8,
      y_width => 6
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x326,
      clk => clk_1_sg_x326,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x22,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom
    generic map (
      c_address_width => 6,
      c_width => 18,
      core_name0 => "bmg_24_vx5_c5c136a08dd56dbc",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x326,
      clk => clk_1_sg_x326,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_c3522a34e5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_c3522a34e5;

architecture structural of twiddle_gen3_entity_c3522a34e5 is
  signal addr_sel_y_net: std_logic_vector(5 downto 0);
  signal ce_1_sg_x327: std_logic;
  signal clk_1_sg_x327: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x23: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x327 <= ce_1;
  clk_1_sg_x327 <= clk_1;
  delay_q_net_x23 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 7,
      x_width => 8,
      y_width => 6
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x327,
      clk => clk_1_sg_x327,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x23,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom
    generic map (
      c_address_width => 6,
      c_width => 18,
      core_name0 => "bmg_24_vx5_9d8577c93c4baa0d",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x327,
      clk => clk_1_sg_x327,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4/r4_twiddle"

entity r4_twiddle_entity_889d43e4c4 is
  port (
    a_in: in std_logic_vector(29 downto 0); 
    b: in std_logic_vector(29 downto 0); 
    c: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(29 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(29 downto 0); 
    bw: out std_logic_vector(29 downto 0); 
    cw: out std_logic_vector(29 downto 0); 
    dw: out std_logic_vector(29 downto 0); 
    sync_out: out std_logic
  );
end r4_twiddle_entity_889d43e4c4;

architecture structural of r4_twiddle_entity_889d43e4c4 is
  signal ce_1_sg_x328: std_logic;
  signal clk_1_sg_x328: std_logic;
  signal concat_y_net_x21: std_logic_vector(29 downto 0);
  signal concat_y_net_x22: std_logic_vector(29 downto 0);
  signal concat_y_net_x23: std_logic_vector(29 downto 0);
  signal delay1_q_net_x1: std_logic_vector(29 downto 0);
  signal delay1_q_net_x4: std_logic_vector(29 downto 0);
  signal delay2_q_net_x0: std_logic_vector(29 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay4_q_net_x1: std_logic_vector(29 downto 0);
  signal delay5_q_net_x1: std_logic_vector(29 downto 0);
  signal delay_q_net_x24: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x3: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x4: std_logic_vector(17 downto 0);
  signal mux1_y_net_x8: std_logic_vector(29 downto 0);
  signal mux1_y_net_x9: std_logic_vector(29 downto 0);
  signal slr_q_net_x10: std_logic_vector(29 downto 0);
  signal slr_q_net_x11: std_logic_vector(29 downto 0);

begin
  slr_q_net_x10 <= a_in;
  mux1_y_net_x8 <= b;
  slr_q_net_x11 <= c;
  ce_1_sg_x328 <= ce_1;
  clk_1_sg_x328 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x24 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x22;
  dw <= concat_y_net_x23;
  sync_out <= delay_q_net_x4;

  cmpy1_6a3cbc160f: entity work.cmpy1_entity_6a3cbc160f
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x328,
      clk_1 => clk_1_sg_x328,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_1598a9f876: entity work.cmpy2_entity_1598a9f876
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x328,
      clk_1 => clk_1_sg_x328,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x22
    );

  cmpy3_41cc9b7c43: entity work.cmpy2_entity_1598a9f876
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x328,
      clk_1 => clk_1_sg_x328,
      w => mem_c_data_net_x4,
      bw => concat_y_net_x23
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 30
    )
    port map (
      ce => ce_1_sg_x328,
      clk => clk_1_sg_x328,
      d => mux1_y_net_x8,
      en => '1',
      q => delay1_q_net_x1
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 30
    )
    port map (
      ce => ce_1_sg_x328,
      clk => clk_1_sg_x328,
      d => slr_q_net_x10,
      en => '1',
      q => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x328,
      clk => clk_1_sg_x328,
      d(0) => delay_q_net_x24,
      en => '1',
      q(0) => delay3_q_net_x0
    );

  delay4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 30
    )
    port map (
      ce => ce_1_sg_x328,
      clk => clk_1_sg_x328,
      d => slr_q_net_x11,
      en => '1',
      q => delay4_q_net_x1
    );

  delay5: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 30
    )
    port map (
      ce => ce_1_sg_x328,
      clk => clk_1_sg_x328,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_cddd385717: entity work.twiddle_gen1_entity_cddd385717
    port map (
      ce_1 => ce_1_sg_x328,
      clk_1 => clk_1_sg_x328,
      sync_in => delay_q_net_x24,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_ca5064c2af: entity work.twiddle_gen2_entity_ca5064c2af
    port map (
      ce_1 => ce_1_sg_x328,
      clk_1 => clk_1_sg_x328,
      sync_in => delay_q_net_x24,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_c3522a34e5: entity work.twiddle_gen3_entity_c3522a34e5
    port map (
      ce_1 => ce_1_sg_x328,
      clk_1 => clk_1_sg_x328,
      sync_in => delay_q_net_x24,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_4"

entity r4_dit_stage_4_entity_7c1fdc5031 is
  port (
    a_in: in std_logic_vector(29 downto 0); 
    b_in: in std_logic_vector(29 downto 0); 
    c_in: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(29 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(33 downto 0); 
    b_out: out std_logic_vector(33 downto 0); 
    c_out: out std_logic_vector(33 downto 0); 
    d_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end r4_dit_stage_4_entity_7c1fdc5031;

architecture structural of r4_dit_stage_4_entity_7c1fdc5031 is
  signal ce_1_sg_x329: std_logic;
  signal clk_1_sg_x329: std_logic;
  signal concat_y_net_x23: std_logic_vector(29 downto 0);
  signal concat_y_net_x24: std_logic_vector(29 downto 0);
  signal concat_y_net_x25: std_logic_vector(29 downto 0);
  signal concat_y_net_x26: std_logic_vector(33 downto 0);
  signal concat_y_net_x27: std_logic_vector(33 downto 0);
  signal concat_y_net_x28: std_logic_vector(33 downto 0);
  signal concat_y_net_x29: std_logic_vector(33 downto 0);
  signal concat_y_net_x64: std_logic_vector(29 downto 0);
  signal concat_y_net_x65: std_logic_vector(29 downto 0);
  signal concat_y_net_x66: std_logic_vector(29 downto 0);
  signal concat_y_net_x67: std_logic_vector(29 downto 0);
  signal delay1_q_net_x4: std_logic_vector(29 downto 0);
  signal delay_q_net_x20: std_logic;
  signal delay_q_net_x21: std_logic;
  signal delay_q_net_x22: std_logic;
  signal delay_q_net_x24: std_logic;
  signal mux1_y_net_x8: std_logic_vector(29 downto 0);
  signal mux1_y_net_x9: std_logic_vector(29 downto 0);
  signal slr_q_net_x10: std_logic_vector(29 downto 0);
  signal slr_q_net_x11: std_logic_vector(29 downto 0);

begin
  concat_y_net_x64 <= a_in;
  concat_y_net_x65 <= b_in;
  concat_y_net_x66 <= c_in;
  ce_1_sg_x329 <= ce_1;
  clk_1_sg_x329 <= clk_1;
  concat_y_net_x67 <= d_in;
  delay_q_net_x21 <= sync_in;
  a_out <= concat_y_net_x26;
  b_out <= concat_y_net_x27;
  c_out <= concat_y_net_x28;
  d_out <= concat_y_net_x29;
  sync_out <= delay_q_net_x22;

  quadplex_commutator_3cfacc98aa: entity work.quadplex_commutator_entity_3cfacc98aa
    port map (
      a => concat_y_net_x64,
      b => concat_y_net_x65,
      c => concat_y_net_x66,
      ce_1 => ce_1_sg_x329,
      clk_1 => clk_1_sg_x329,
      d => concat_y_net_x67,
      sync_in => delay_q_net_x21,
      abcd0 => slr_q_net_x10,
      abcd1 => mux1_y_net_x8,
      abcd2 => slr_q_net_x11,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x24
    );

  r4_butterfly_6f65cb49c8: entity work.r4_butterfly_entity_6f65cb49c8
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x23,
      c_in => concat_y_net_x24,
      ce_1 => ce_1_sg_x329,
      clk_1 => clk_1_sg_x329,
      d_in => concat_y_net_x25,
      sync_in => delay_q_net_x20,
      a_out => concat_y_net_x26,
      b_out => concat_y_net_x27,
      c_out => concat_y_net_x28,
      d_out => concat_y_net_x29,
      sync_out => delay_q_net_x22
    );

  r4_twiddle_889d43e4c4: entity work.r4_twiddle_entity_889d43e4c4
    port map (
      a_in => slr_q_net_x10,
      b => mux1_y_net_x8,
      c => slr_q_net_x11,
      ce_1 => ce_1_sg_x329,
      clk_1 => clk_1_sg_x329,
      d => mux1_y_net_x9,
      sync_in => delay_q_net_x24,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x23,
      cw => concat_y_net_x24,
      dw => concat_y_net_x25,
      sync_out => delay_q_net_x20
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_4159425745 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(33 downto 0); 
    out_x0: out std_logic_vector(33 downto 0)
  );
end delay_b_entity_4159425745;

architecture structural of delay_b_entity_4159425745 is
  signal ce_1_sg_x330: std_logic;
  signal clk_1_sg_x330: std_logic;
  signal slr_q_net_x1: std_logic_vector(33 downto 0);
  signal slr_q_net_x2: std_logic_vector(33 downto 0);

begin
  ce_1_sg_x330 <= ce_1;
  clk_1_sg_x330 <= clk_1;
  slr_q_net_x1 <= in_x0;
  out_x0 <= slr_q_net_x2;

  slr: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x330,
      clk => clk_1_sg_x330,
      d => slr_q_net_x1,
      en => '1',
      q => slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_8de64ed25a is
  port (
    aloahi: in std_logic_vector(33 downto 0); 
    blobhi: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(33 downto 0); 
    aloblo: out std_logic_vector(33 downto 0)
  );
end biplex_commutator_01_entity_8de64ed25a;

architecture structural of biplex_commutator_01_entity_8de64ed25a is
  signal ce_1_sg_x332: std_logic;
  signal clk_1_sg_x332: std_logic;
  signal counter_op_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(33 downto 0);
  signal mux_y_net_x0: std_logic_vector(33 downto 0);
  signal slr_q_net_x2: std_logic_vector(33 downto 0);
  signal slr_q_net_x3: std_logic_vector(33 downto 0);
  signal slr_q_net_x4: std_logic_vector(33 downto 0);
  signal slr_q_net_x5: std_logic_vector(33 downto 0);
  signal top_bit_y_net: std_logic;

begin
  slr_q_net_x3 <= aloahi;
  slr_q_net_x4 <= blobhi;
  ce_1_sg_x332 <= ce_1;
  clk_1_sg_x332 <= clk_1;
  delay_q_net_x0 <= sync_in;
  ahibhi <= mux1_y_net_x0;
  aloblo <= slr_q_net_x5;

  counter: entity work.counter_9b03e3d644
    port map (
      ce => ce_1_sg_x332,
      clk => clk_1_sg_x332,
      clr => '0',
      rst(0) => delay_q_net_x0,
      op(0) => counter_op_net
    );

  delay_b_4159425745: entity work.delay_b_entity_4159425745
    port map (
      ce_1 => ce_1_sg_x332,
      clk_1 => clk_1_sg_x332,
      in_x0 => slr_q_net_x4,
      out_x0 => slr_q_net_x2
    );

  delay_lo_fee98141ad: entity work.delay_b_entity_4159425745
    port map (
      ce_1 => ce_1_sg_x332,
      clk_1 => clk_1_sg_x332,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x332,
      clk => clk_1_sg_x332,
      clr => '0',
      d0 => slr_q_net_x3,
      d1 => slr_q_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x332,
      clk => clk_1_sg_x332,
      clr => '0',
      d0 => slr_q_net_x2,
      d1 => slr_q_net_x3,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x0
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 1,
      y_width => 1
    )
    port map (
      x(0) => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_712bc773d3 is
  port (
    aloahi: in std_logic_vector(33 downto 0); 
    blobhi: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(33 downto 0); 
    aloblo: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_23_entity_712bc773d3;

architecture structural of biplex_commutator_23_entity_712bc773d3 is
  signal ce_1_sg_x335: std_logic;
  signal clk_1_sg_x335: std_logic;
  signal counter_op_net: std_logic;
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x2: std_logic_vector(33 downto 0);
  signal mux1_y_net_x3: std_logic_vector(33 downto 0);
  signal mux1_y_net_x4: std_logic_vector(33 downto 0);
  signal mux_y_net_x0: std_logic_vector(33 downto 0);
  signal slr_q_net_x0: std_logic_vector(33 downto 0);
  signal slr_q_net_x2: std_logic_vector(33 downto 0);
  signal top_bit_y_net: std_logic;

begin
  mux1_y_net_x2 <= aloahi;
  mux1_y_net_x3 <= blobhi;
  ce_1_sg_x335 <= ce_1;
  clk_1_sg_x335 <= clk_1;
  delay_q_net_x1 <= sync_in;
  ahibhi <= mux1_y_net_x4;
  aloblo <= slr_q_net_x2;
  sync_out <= delay_q_net_x2;

  counter: entity work.counter_9b03e3d644
    port map (
      ce => ce_1_sg_x335,
      clk => clk_1_sg_x335,
      clr => '0',
      rst(0) => delay_q_net_x1,
      op(0) => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x335,
      clk => clk_1_sg_x335,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_d1600e44fc: entity work.delay_b_entity_4159425745
    port map (
      ce_1 => ce_1_sg_x335,
      clk_1 => clk_1_sg_x335,
      in_x0 => mux1_y_net_x3,
      out_x0 => slr_q_net_x0
    );

  delay_lo_9390245790: entity work.delay_b_entity_4159425745
    port map (
      ce_1 => ce_1_sg_x335,
      clk_1 => clk_1_sg_x335,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x2
    );

  mux: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x335,
      clk => clk_1_sg_x335,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x335,
      clk => clk_1_sg_x335,
      clr => '0',
      d0 => slr_q_net_x0,
      d1 => mux1_y_net_x2,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x4
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 1,
      y_width => 1
    )
    port map (
      x(0) => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_4b980021ed is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(33 downto 0); 
    out_x0: out std_logic_vector(33 downto 0)
  );
end delay_b_entity_4b980021ed;

architecture structural of delay_b_entity_4b980021ed is
  signal ce_1_sg_x336: std_logic;
  signal clk_1_sg_x336: std_logic;
  signal concat_y_net_x29: std_logic_vector(33 downto 0);
  signal slr_q_net_x0: std_logic_vector(33 downto 0);

begin
  ce_1_sg_x336 <= ce_1;
  clk_1_sg_x336 <= clk_1;
  concat_y_net_x29 <= in_x0;
  out_x0 <= slr_q_net_x0;

  slr: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x336,
      clk => clk_1_sg_x336,
      d => concat_y_net_x29,
      en => '1',
      q => slr_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_e9d27c5678 is
  port (
    aloahi: in std_logic_vector(33 downto 0); 
    blobhi: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(33 downto 0); 
    aloblo: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_ac_entity_e9d27c5678;

architecture structural of biplex_commutator_ac_entity_e9d27c5678 is
  signal ce_1_sg_x338: std_logic;
  signal clk_1_sg_x338: std_logic;
  signal concat_y_net_x30: std_logic_vector(33 downto 0);
  signal concat_y_net_x31: std_logic_vector(33 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x23: std_logic;
  signal mux1_y_net_x3: std_logic_vector(33 downto 0);
  signal mux_y_net_x0: std_logic_vector(33 downto 0);
  signal slr_q_net_x0: std_logic_vector(33 downto 0);
  signal slr_q_net_x5: std_logic_vector(33 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x30 <= aloahi;
  concat_y_net_x31 <= blobhi;
  ce_1_sg_x338 <= ce_1;
  clk_1_sg_x338 <= clk_1;
  delay_q_net_x23 <= sync_in;
  ahibhi <= mux1_y_net_x3;
  aloblo <= slr_q_net_x5;
  sync_out <= delay_q_net_x1;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_76ea00975735b561",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x338,
      clk => clk_1_sg_x338,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x23,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x338,
      clk => clk_1_sg_x338,
      d(0) => delay_q_net_x23,
      en => '1',
      q(0) => delay_q_net_x1
    );

  delay_b_4b980021ed: entity work.delay_b_entity_4b980021ed
    port map (
      ce_1 => ce_1_sg_x338,
      clk_1 => clk_1_sg_x338,
      in_x0 => concat_y_net_x31,
      out_x0 => slr_q_net_x0
    );

  delay_lo_fb5eb118a3: entity work.delay_b_entity_4b980021ed
    port map (
      ce_1 => ce_1_sg_x338,
      clk_1 => clk_1_sg_x338,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x338,
      clk => clk_1_sg_x338,
      clr => '0',
      d0 => concat_y_net_x30,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x338,
      clk => clk_1_sg_x338,
      clr => '0',
      d0 => slr_q_net_x0,
      d1 => concat_y_net_x30,
      sel(0) => top_bit_y_net,
      y => mux1_y_net_x3
    );

  top_bit: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 2,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => top_bit_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/quadplex_commutator"

entity quadplex_commutator_entity_43d93367e6 is
  port (
    a: in std_logic_vector(33 downto 0); 
    b: in std_logic_vector(33 downto 0); 
    c: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    abcd0: out std_logic_vector(33 downto 0); 
    abcd1: out std_logic_vector(33 downto 0); 
    abcd2: out std_logic_vector(33 downto 0); 
    abcd3: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end quadplex_commutator_entity_43d93367e6;

architecture structural of quadplex_commutator_entity_43d93367e6 is
  signal ce_1_sg_x342: std_logic;
  signal clk_1_sg_x342: std_logic;
  signal concat_y_net_x34: std_logic_vector(33 downto 0);
  signal concat_y_net_x35: std_logic_vector(33 downto 0);
  signal concat_y_net_x36: std_logic_vector(33 downto 0);
  signal concat_y_net_x37: std_logic_vector(33 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x25: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mux1_y_net_x3: std_logic_vector(33 downto 0);
  signal mux1_y_net_x5: std_logic_vector(33 downto 0);
  signal mux1_y_net_x6: std_logic_vector(33 downto 0);
  signal mux1_y_net_x7: std_logic_vector(33 downto 0);
  signal slr_q_net_x6: std_logic_vector(33 downto 0);
  signal slr_q_net_x7: std_logic_vector(33 downto 0);
  signal slr_q_net_x8: std_logic_vector(33 downto 0);
  signal slr_q_net_x9: std_logic_vector(33 downto 0);

begin
  concat_y_net_x34 <= a;
  concat_y_net_x35 <= b;
  concat_y_net_x36 <= c;
  ce_1_sg_x342 <= ce_1;
  clk_1_sg_x342 <= clk_1;
  concat_y_net_x37 <= d;
  delay_q_net_x25 <= sync_in;
  abcd0 <= slr_q_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= slr_q_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x4;

  biplex_commutator_01_8de64ed25a: entity work.biplex_commutator_01_entity_8de64ed25a
    port map (
      aloahi => slr_q_net_x6,
      blobhi => slr_q_net_x7,
      ce_1 => ce_1_sg_x342,
      clk_1 => clk_1_sg_x342,
      sync_in => delay_q_net_x1,
      ahibhi => mux1_y_net_x6,
      aloblo => slr_q_net_x8
    );

  biplex_commutator_23_712bc773d3: entity work.biplex_commutator_23_entity_712bc773d3
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x342,
      clk_1 => clk_1_sg_x342,
      sync_in => delay_q_net_x3,
      ahibhi => mux1_y_net_x7,
      aloblo => slr_q_net_x9,
      sync_out => delay_q_net_x4
    );

  biplex_commutator_ac_e9d27c5678: entity work.biplex_commutator_ac_entity_e9d27c5678
    port map (
      aloahi => concat_y_net_x34,
      blobhi => concat_y_net_x36,
      ce_1 => ce_1_sg_x342,
      clk_1 => clk_1_sg_x342,
      sync_in => delay_q_net_x25,
      ahibhi => mux1_y_net_x3,
      aloblo => slr_q_net_x6,
      sync_out => delay_q_net_x1
    );

  biplex_commutator_bd_4cdd6e1ce2: entity work.biplex_commutator_ac_entity_e9d27c5678
    port map (
      aloahi => concat_y_net_x35,
      blobhi => concat_y_net_x37,
      ce_1 => ce_1_sg_x342,
      clk_1 => clk_1_sg_x342,
      sync_in => delay_q_net_x25,
      ahibhi => mux1_y_net_x5,
      aloblo => slr_q_net_x7,
      sync_out => delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_fd42a5f7f9 is
  port (
    c: in std_logic_vector(33 downto 0); 
    im: out std_logic_vector(16 downto 0); 
    re: out std_logic_vector(16 downto 0)
  );
end c_to_ri_entity_fd42a5f7f9;

architecture structural of c_to_ri_entity_fd42a5f7f9 is
  signal delay1_q_net_x0: std_logic_vector(33 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(16 downto 0);
  signal slice_im_y_net: std_logic_vector(16 downto 0);
  signal slice_re_y_net: std_logic_vector(16 downto 0);

begin
  delay1_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_ea71bb555c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_ea71bb555c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 16,
      x_width => 34,
      y_width => 17
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 17,
      new_msb => 33,
      x_width => 34,
      y_width => 17
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_d8c8feb82b is
  port (
    im: in std_logic_vector(17 downto 0); 
    re: in std_logic_vector(17 downto 0); 
    c: out std_logic_vector(35 downto 0)
  );
end ri_to_c_entity_d8c8feb82b;

architecture structural of ri_to_c_entity_d8c8feb82b is
  signal concat_y_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net: std_logic_vector(17 downto 0);
  signal force_re_output_port_net: std_logic_vector(17 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(17 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(17 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_b198bd62b0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant0_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly0"

entity butterfly0_entity_609a2f39de is
  port (
    a: in std_logic_vector(33 downto 0); 
    b: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(35 downto 0); 
    a_b_x0: out std_logic_vector(35 downto 0)
  );
end butterfly0_entity_609a2f39de;

architecture structural of butterfly0_entity_609a2f39de is
  signal add_im_s_net: std_logic_vector(17 downto 0);
  signal add_re_s_net: std_logic_vector(17 downto 0);
  signal ce_1_sg_x343: std_logic;
  signal clk_1_sg_x343: std_logic;
  signal concat_y_net_x3: std_logic_vector(33 downto 0);
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal delay1_q_net_x1: std_logic_vector(33 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(16 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(17 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(17 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(17 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(17 downto 0);
  signal shift0_op_net: std_logic_vector(17 downto 0);
  signal shift1_op_net: std_logic_vector(17 downto 0);
  signal shift2_op_net: std_logic_vector(17 downto 0);
  signal shift3_op_net: std_logic_vector(17 downto 0);
  signal sub_im_s_net: std_logic_vector(17 downto 0);
  signal sub_re_s_net: std_logic_vector(17 downto 0);

begin
  delay1_q_net_x1 <= a;
  concat_y_net_x3 <= b;
  ce_1_sg_x343 <= ce_1;
  clk_1_sg_x343 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_ed5d62a19c
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x343,
      clk => clk_1_sg_x343,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_ed5d62a19c
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x343,
      clk => clk_1_sg_x343,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_30cbe5b79f: entity work.c_to_ri_entity_fd42a5f7f9
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_fd42a5f7f9: entity work.c_to_ri_entity_fd42a5f7f9
    port map (
      c => delay1_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_820a347e9e: entity work.ri_to_c_entity_d8c8feb82b
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_d8c8feb82b: entity work.ri_to_c_entity_d8c8feb82b
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x4
    );

  shift0: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_cc9a7f7bbc
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x343,
      clk => clk_1_sg_x343,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_cc9a7f7bbc
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x343,
      clk => clk_1_sg_x343,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly1"

entity butterfly1_entity_d65ea49893 is
  port (
    a: in std_logic_vector(33 downto 0); 
    b: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(35 downto 0); 
    a_b_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly1_entity_d65ea49893;

architecture structural of butterfly1_entity_d65ea49893 is
  signal add_im_s_net: std_logic_vector(17 downto 0);
  signal add_re_s_net: std_logic_vector(17 downto 0);
  signal ce_1_sg_x344: std_logic;
  signal clk_1_sg_x344: std_logic;
  signal concat_y_net_x4: std_logic_vector(33 downto 0);
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(16 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(17 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(17 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(17 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(17 downto 0);
  signal shift0_op_net: std_logic_vector(17 downto 0);
  signal shift1_op_net: std_logic_vector(17 downto 0);
  signal shift2_op_net: std_logic_vector(17 downto 0);
  signal shift3_op_net: std_logic_vector(17 downto 0);
  signal sub_im_s_net: std_logic_vector(17 downto 0);
  signal sub_re_s_net: std_logic_vector(17 downto 0);

begin
  concat_y_net_x4 <= a;
  concat_y_net_x5 <= b;
  ce_1_sg_x344 <= ce_1;
  clk_1_sg_x344 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_ed5d62a19c
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x344,
      clk => clk_1_sg_x344,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_ed5d62a19c
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x344,
      clk => clk_1_sg_x344,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_87d362c9c0: entity work.c_to_ri_entity_fd42a5f7f9
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_2cbccf3249: entity work.c_to_ri_entity_fd42a5f7f9
    port map (
      c => concat_y_net_x4,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x344,
      clk => clk_1_sg_x344,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_20c748df43: entity work.ri_to_c_entity_d8c8feb82b
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_af372d0794: entity work.ri_to_c_entity_d8c8feb82b
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x6
    );

  shift0: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_cc9a7f7bbc
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x344,
      clk => clk_1_sg_x344,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_cc9a7f7bbc
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x344,
      clk => clk_1_sg_x344,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_3e51644811 is
  port (
    c: in std_logic_vector(35 downto 0); 
    im: out std_logic_vector(17 downto 0); 
    re: out std_logic_vector(17 downto 0)
  );
end c_to_ri_entity_3e51644811;

architecture structural of c_to_ri_entity_3e51644811 is
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(17 downto 0);
  signal slice_im_y_net: std_logic_vector(17 downto 0);
  signal slice_re_y_net: std_logic_vector(17 downto 0);

begin
  concat_y_net_x5 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => concat_y_net_x5,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => concat_y_net_x5,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly2"

entity butterfly2_entity_7fc35b906c is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(37 downto 0); 
    a_b_x0: out std_logic_vector(37 downto 0)
  );
end butterfly2_entity_7fc35b906c;

architecture structural of butterfly2_entity_7fc35b906c is
  signal add_im_s_net: std_logic_vector(18 downto 0);
  signal add_re_s_net: std_logic_vector(18 downto 0);
  signal ce_1_sg_x345: std_logic;
  signal clk_1_sg_x345: std_logic;
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x12: std_logic_vector(37 downto 0);
  signal concat_y_net_x16: std_logic_vector(37 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(18 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(18 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(18 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(18 downto 0);
  signal shift0_op_net: std_logic_vector(18 downto 0);
  signal shift1_op_net: std_logic_vector(18 downto 0);
  signal shift2_op_net: std_logic_vector(18 downto 0);
  signal shift3_op_net: std_logic_vector(18 downto 0);
  signal sub_im_s_net: std_logic_vector(18 downto 0);
  signal sub_re_s_net: std_logic_vector(18 downto 0);

begin
  concat_y_net_x6 <= a;
  concat_y_net_x11 <= b;
  ce_1_sg_x345 <= ce_1;
  clk_1_sg_x345 <= clk_1;
  a_b <= concat_y_net_x12;
  a_b_x0 <= concat_y_net_x16;

  add_im: entity work.addsub_f10bd79bfe
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x345,
      clk => clk_1_sg_x345,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_f10bd79bfe
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x345,
      clk => clk_1_sg_x345,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_1501e32921: entity work.c_to_ri_entity_3e51644811
    port map (
      c => concat_y_net_x11,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_3e51644811: entity work.c_to_ri_entity_3e51644811
    port map (
      c => concat_y_net_x6,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 19,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 19,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 19,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 19,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_8dbd94167e: entity work.ri_to_c_entity_c9013b8111
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x16
    );

  ri_to_c_2ba1f65bfa: entity work.ri_to_c_entity_c9013b8111
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x12
    );

  shift0: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_f5776ffb7e
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x345,
      clk => clk_1_sg_x345,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f5776ffb7e
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x345,
      clk => clk_1_sg_x345,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly3j"

entity butterfly3j_entity_a06900ec20 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(37 downto 0); 
    a_b_x0: out std_logic_vector(37 downto 0); 
    sync_out: out std_logic
  );
end butterfly3j_entity_a06900ec20;

architecture structural of butterfly3j_entity_a06900ec20 is
  signal add_im_s_net: std_logic_vector(18 downto 0);
  signal add_re_s_net: std_logic_vector(18 downto 0);
  signal ce_1_sg_x346: std_logic;
  signal clk_1_sg_x346: std_logic;
  signal concat_y_net_x13: std_logic_vector(35 downto 0);
  signal concat_y_net_x14: std_logic_vector(37 downto 0);
  signal concat_y_net_x15: std_logic_vector(37 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x7: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(18 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(18 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(18 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(18 downto 0);
  signal shift0_op_net: std_logic_vector(18 downto 0);
  signal shift1_op_net: std_logic_vector(18 downto 0);
  signal shift2_op_net: std_logic_vector(18 downto 0);
  signal shift3_op_net: std_logic_vector(18 downto 0);
  signal sub_im_s_net: std_logic_vector(18 downto 0);
  signal sub_re_s_net: std_logic_vector(18 downto 0);

begin
  concat_y_net_x7 <= a;
  concat_y_net_x13 <= b;
  ce_1_sg_x346 <= ce_1;
  clk_1_sg_x346 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x14;
  a_b_x0 <= concat_y_net_x15;
  sync_out <= delay_q_net_x7;

  add_im: entity work.addsub_f5776ffb7e
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_f10bd79bfe
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_d5de117f43: entity work.c_to_ri_entity_3e51644811
    port map (
      c => concat_y_net_x13,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_a6e23de7f3: entity work.c_to_ri_entity_3e51644811
    port map (
      c => concat_y_net_x7,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      d(0) => delay_q_net_x3,
      en => '1',
      q(0) => delay_q_net_x7
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 19,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift0_op_net,
      dout => requant0_dout_net_x0
    );

  requant1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 19,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift1_op_net,
      dout => requant1_dout_net_x0
    );

  requant2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 19,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift2_op_net,
      dout => requant2_dout_net_x0
    );

  requant3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 19,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => shift3_op_net,
      dout => requant3_dout_net_x0
    );

  ri_to_c1_02d30c63da: entity work.ri_to_c_entity_c9013b8111
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x15
    );

  ri_to_c_64225f3b39: entity work.ri_to_c_entity_c9013b8111
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x14
    );

  shift0: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_f10bd79bfe
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f5776ffb7e
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_butterfly"

entity r4_butterfly_entity_d4498510b1 is
  port (
    a_in: in std_logic_vector(33 downto 0); 
    b_in: in std_logic_vector(33 downto 0); 
    c_in: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(37 downto 0); 
    b_out: out std_logic_vector(37 downto 0); 
    c_out: out std_logic_vector(37 downto 0); 
    d_out: out std_logic_vector(37 downto 0); 
    sync_out: out std_logic
  );
end r4_butterfly_entity_d4498510b1;

architecture structural of r4_butterfly_entity_d4498510b1 is
  signal ce_1_sg_x347: std_logic;
  signal clk_1_sg_x347: std_logic;
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x13: std_logic_vector(35 downto 0);
  signal concat_y_net_x17: std_logic_vector(33 downto 0);
  signal concat_y_net_x18: std_logic_vector(33 downto 0);
  signal concat_y_net_x19: std_logic_vector(37 downto 0);
  signal concat_y_net_x20: std_logic_vector(37 downto 0);
  signal concat_y_net_x21: std_logic_vector(37 downto 0);
  signal concat_y_net_x22: std_logic_vector(37 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal concat_y_net_x8: std_logic_vector(33 downto 0);
  signal delay1_q_net_x2: std_logic_vector(33 downto 0);
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x8: std_logic;

begin
  delay1_q_net_x2 <= a_in;
  concat_y_net_x17 <= b_in;
  concat_y_net_x8 <= c_in;
  ce_1_sg_x347 <= ce_1;
  clk_1_sg_x347 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x8;

  butterfly0_609a2f39de: entity work.butterfly0_entity_609a2f39de
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x8,
      ce_1 => ce_1_sg_x347,
      clk_1 => clk_1_sg_x347,
      a_b => concat_y_net_x6,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_d65ea49893: entity work.butterfly1_entity_d65ea49893
    port map (
      a => concat_y_net_x17,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x347,
      clk_1 => clk_1_sg_x347,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x11,
      a_b_x0 => concat_y_net_x13,
      sync_out => delay_q_net_x3
    );

  butterfly2_7fc35b906c: entity work.butterfly2_entity_7fc35b906c
    port map (
      a => concat_y_net_x6,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x347,
      clk_1 => clk_1_sg_x347,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_a06900ec20: entity work.butterfly3j_entity_a06900ec20
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x13,
      ce_1 => ce_1_sg_x347,
      clk_1 => clk_1_sg_x347,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x8
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_7a9af2bbc9 is
  port (
    c: in std_logic_vector(33 downto 0); 
    im: out std_logic_vector(16 downto 0); 
    re: out std_logic_vector(16 downto 0)
  );
end c_to_ri_entity_7a9af2bbc9;

architecture structural of c_to_ri_entity_7a9af2bbc9 is
  signal delay1_q_net_x0: std_logic_vector(33 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(16 downto 0);
  signal slice_im_y_net: std_logic_vector(16 downto 0);
  signal slice_re_y_net: std_logic_vector(16 downto 0);

begin
  delay1_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_ea71bb555c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_ea71bb555c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 16,
      x_width => 34,
      y_width => 17
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 17,
      new_msb => 33,
      x_width => 34,
      y_width => 17
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_740b720b9f is
  port (
    im: in std_logic_vector(16 downto 0); 
    re: in std_logic_vector(16 downto 0); 
    c: out std_logic_vector(33 downto 0)
  );
end ri_to_c_entity_740b720b9f;

architecture structural of ri_to_c_entity_740b720b9f is
  signal concat_y_net_x18: std_logic_vector(33 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(16 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(16 downto 0);
  signal force_im_output_port_net: std_logic_vector(16 downto 0);
  signal force_re_output_port_net: std_logic_vector(16 downto 0);

begin
  convert_im_dout_net_x0 <= im;
  convert_re_dout_net_x0 <= re;
  c <= concat_y_net_x18;

  concat: entity work.concat_25b7e1d1f5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x18
    );

  force_im: entity work.reinterpret_573890e1c0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_im_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_573890e1c0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_re_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy1"

entity cmpy1_entity_dd17634c9e is
  port (
    a_in: in std_logic_vector(33 downto 0); 
    b: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    a_out: out std_logic_vector(33 downto 0); 
    bw: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end cmpy1_entity_dd17634c9e;

architecture structural of cmpy1_entity_dd17634c9e is
  signal br_add_bi_s_net: std_logic_vector(17 downto 0);
  signal ce_1_sg_x348: std_logic;
  signal clk_1_sg_x348: std_logic;
  signal concat_y_net_x19: std_logic_vector(33 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(16 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(16 downto 0);
  signal delay1_q_net_x1: std_logic_vector(33 downto 0);
  signal delay1_q_net_x3: std_logic_vector(33 downto 0);
  signal delay2_q_net_x0: std_logic_vector(33 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(23 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(23 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(23 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(23 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(23 downto 0);
  signal sumsum_p_net: std_logic_vector(23 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay2_q_net_x0 <= a_in;
  delay1_q_net_x1 <= b;
  ce_1_sg_x348 <= ce_1;
  clk_1_sg_x348 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x19;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_555b5d0c45
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_f33484619e: entity work.c_to_ri1_entity_235ec30cb4
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_7a9af2bbc9: entity work.c_to_ri_entity_7a9af2bbc9
    port map (
      c => delay1_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 24,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 17,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 24,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 17,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      d(0) => delay3_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay1: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      d => delay2_q_net_x0,
      en => '1',
      q => delay1_q_net_x3
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 17,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 17,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 17,
      c_output_width => 26,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_db7246963acedc92",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 23,
      p_width => 24,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      core_ce => ce_1_sg_x348,
      core_clk => clk_1_sg_x348,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 17,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 17,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 17,
      c_output_width => 26,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_db7246963acedc92",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 23,
      p_width => 24,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      core_ce => ce_1_sg_x348,
      core_clk => clk_1_sg_x348,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_740b720b9f: entity work.ri_to_c_entity_740b720b9f
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_a90e22f5f3
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_0b3c6c31ef
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_50f49c147d
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 18,
      c_output_width => 28,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_34b4d3fe22ca9845",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 23,
      p_width => 24,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      core_ce => ce_1_sg_x348,
      core_clk => clk_1_sg_x348,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy2"

entity cmpy2_entity_e003fed34b is
  port (
    b: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(33 downto 0)
  );
end cmpy2_entity_e003fed34b;

architecture structural of cmpy2_entity_e003fed34b is
  signal br_add_bi_s_net: std_logic_vector(17 downto 0);
  signal ce_1_sg_x349: std_logic;
  signal clk_1_sg_x349: std_logic;
  signal concat_y_net_x10: std_logic_vector(33 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(16 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(16 downto 0);
  signal delay4_q_net_x1: std_logic_vector(33 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(23 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(23 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(23 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(23 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(23 downto 0);
  signal sumsum_p_net: std_logic_vector(23 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay4_q_net_x1 <= b;
  ce_1_sg_x349 <= ce_1;
  clk_1_sg_x349 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x10;

  br_add_bi: entity work.addsub_555b5d0c45
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_0ca1235479: entity work.c_to_ri1_entity_235ec30cb4
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_6a4a1aedd4: entity work.c_to_ri_entity_7a9af2bbc9
    port map (
      c => delay4_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 24,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 17,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 24,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 17,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 17,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 17,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 17,
      c_output_width => 26,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_db7246963acedc92",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 23,
      p_width => 24,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      clr => '0',
      core_ce => ce_1_sg_x349,
      core_clk => clk_1_sg_x349,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 17,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 17,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 17,
      c_output_width => 26,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_db7246963acedc92",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 23,
      p_width => 24,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      clr => '0',
      core_ce => ce_1_sg_x349,
      core_clk => clk_1_sg_x349,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_4b057cd5b7: entity work.ri_to_c_entity_740b720b9f
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x10
    );

  rr_add_ii: entity work.addsub_a90e22f5f3
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_0b3c6c31ef
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_50f49c147d
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 18,
      c_output_width => 28,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_34b4d3fe22ca9845",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 23,
      p_width => 24,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      clr => '0',
      core_ce => ce_1_sg_x349,
      core_clk => clk_1_sg_x349,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_7dcb2f3829 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_7dcb2f3829;

architecture structural of twiddle_gen1_entity_7dcb2f3829 is
  signal addr_sel_y_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x351: std_logic;
  signal clk_1_sg_x351: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x5: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x351 <= ce_1;
  clk_1_sg_x351 <= clk_1;
  delay_q_net_x5 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 8,
      y_width => 8
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x351,
      clk => clk_1_sg_x351,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x5,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 18,
      core_name0 => "bmg_24_vx5_462f2ec6a7a3f012",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x351,
      clk => clk_1_sg_x351,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_25b74a970c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_25b74a970c;

architecture structural of twiddle_gen2_entity_25b74a970c is
  signal addr_sel_y_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x352: std_logic;
  signal clk_1_sg_x352: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x6: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x352 <= ce_1;
  clk_1_sg_x352 <= clk_1;
  delay_q_net_x6 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 8,
      y_width => 8
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x6,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 18,
      core_name0 => "bmg_24_vx5_cee1e5321fc14302",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_2dda2bb482 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_2dda2bb482;

architecture structural of twiddle_gen3_entity_2dda2bb482 is
  signal addr_sel_y_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x353: std_logic;
  signal clk_1_sg_x353: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x7: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x353 <= ce_1;
  clk_1_sg_x353 <= clk_1;
  delay_q_net_x7 <= sync_in;
  w <= mem_c_data_net_x2;

  addr_sel: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 8,
      y_width => 8
    )
    port map (
      x => counter_op_net,
      y => addr_sel_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x7,
      op => counter_op_net
    );

  mem_c: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 18,
      core_name0 => "bmg_24_vx5_2c49e6ef11a51d10",
      latency => 1
    )
    port map (
      addr => addr_sel_y_net,
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5/r4_twiddle"

entity r4_twiddle_entity_bdb69c3a13 is
  port (
    a_in: in std_logic_vector(33 downto 0); 
    b: in std_logic_vector(33 downto 0); 
    c: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(33 downto 0); 
    bw: out std_logic_vector(33 downto 0); 
    cw: out std_logic_vector(33 downto 0); 
    dw: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end r4_twiddle_entity_bdb69c3a13;

architecture structural of r4_twiddle_entity_bdb69c3a13 is
  signal ce_1_sg_x354: std_logic;
  signal clk_1_sg_x354: std_logic;
  signal concat_y_net_x11: std_logic_vector(33 downto 0);
  signal concat_y_net_x21: std_logic_vector(33 downto 0);
  signal concat_y_net_x22: std_logic_vector(33 downto 0);
  signal delay1_q_net_x1: std_logic_vector(33 downto 0);
  signal delay1_q_net_x4: std_logic_vector(33 downto 0);
  signal delay2_q_net_x0: std_logic_vector(33 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay4_q_net_x1: std_logic_vector(33 downto 0);
  signal delay5_q_net_x1: std_logic_vector(33 downto 0);
  signal delay_q_net_x4: std_logic;
  signal delay_q_net_x8: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x3: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x4: std_logic_vector(17 downto 0);
  signal mux1_y_net_x8: std_logic_vector(33 downto 0);
  signal mux1_y_net_x9: std_logic_vector(33 downto 0);
  signal slr_q_net_x10: std_logic_vector(33 downto 0);
  signal slr_q_net_x11: std_logic_vector(33 downto 0);

begin
  slr_q_net_x10 <= a_in;
  mux1_y_net_x8 <= b;
  slr_q_net_x11 <= c;
  ce_1_sg_x354 <= ce_1;
  clk_1_sg_x354 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x8 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x11;
  dw <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  cmpy1_dd17634c9e: entity work.cmpy1_entity_dd17634c9e
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_e003fed34b: entity work.cmpy2_entity_e003fed34b
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x11
    );

  cmpy3_49296bb814: entity work.cmpy2_entity_e003fed34b
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      w => mem_c_data_net_x4,
      bw => concat_y_net_x22
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d => mux1_y_net_x8,
      en => '1',
      q => delay1_q_net_x1
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d => slr_q_net_x10,
      en => '1',
      q => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d(0) => delay_q_net_x8,
      en => '1',
      q(0) => delay3_q_net_x0
    );

  delay4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d => slr_q_net_x11,
      en => '1',
      q => delay4_q_net_x1
    );

  delay5: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_7dcb2f3829: entity work.twiddle_gen1_entity_7dcb2f3829
    port map (
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_25b74a970c: entity work.twiddle_gen2_entity_25b74a970c
    port map (
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_2dda2bb482: entity work.twiddle_gen3_entity_2dda2bb482
    port map (
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft/r4_dit_stage_5"

entity r4_dit_stage_5_entity_9486a46fdf is
  port (
    a_in: in std_logic_vector(33 downto 0); 
    b_in: in std_logic_vector(33 downto 0); 
    c_in: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(37 downto 0); 
    b_out: out std_logic_vector(37 downto 0); 
    c_out: out std_logic_vector(37 downto 0); 
    d_out: out std_logic_vector(37 downto 0); 
    sync_out: out std_logic
  );
end r4_dit_stage_5_entity_9486a46fdf;

architecture structural of r4_dit_stage_5_entity_9486a46fdf is
  signal ce_1_sg_x355: std_logic;
  signal clk_1_sg_x355: std_logic;
  signal concat_y_net_x11: std_logic_vector(33 downto 0);
  signal concat_y_net_x38: std_logic_vector(33 downto 0);
  signal concat_y_net_x39: std_logic_vector(33 downto 0);
  signal concat_y_net_x40: std_logic_vector(33 downto 0);
  signal concat_y_net_x41: std_logic_vector(33 downto 0);
  signal concat_y_net_x42: std_logic_vector(33 downto 0);
  signal concat_y_net_x43: std_logic_vector(33 downto 0);
  signal concat_y_net_x44: std_logic_vector(37 downto 0);
  signal concat_y_net_x45: std_logic_vector(37 downto 0);
  signal concat_y_net_x46: std_logic_vector(37 downto 0);
  signal concat_y_net_x47: std_logic_vector(37 downto 0);
  signal delay1_q_net_x4: std_logic_vector(33 downto 0);
  signal delay_q_net_x10: std_logic;
  signal delay_q_net_x26: std_logic;
  signal delay_q_net_x4: std_logic;
  signal delay_q_net_x8: std_logic;
  signal mux1_y_net_x8: std_logic_vector(33 downto 0);
  signal mux1_y_net_x9: std_logic_vector(33 downto 0);
  signal slr_q_net_x10: std_logic_vector(33 downto 0);
  signal slr_q_net_x11: std_logic_vector(33 downto 0);

begin
  concat_y_net_x40 <= a_in;
  concat_y_net_x41 <= b_in;
  concat_y_net_x42 <= c_in;
  ce_1_sg_x355 <= ce_1;
  clk_1_sg_x355 <= clk_1;
  concat_y_net_x43 <= d_in;
  delay_q_net_x26 <= sync_in;
  a_out <= concat_y_net_x44;
  b_out <= concat_y_net_x45;
  c_out <= concat_y_net_x46;
  d_out <= concat_y_net_x47;
  sync_out <= delay_q_net_x10;

  quadplex_commutator_43d93367e6: entity work.quadplex_commutator_entity_43d93367e6
    port map (
      a => concat_y_net_x40,
      b => concat_y_net_x41,
      c => concat_y_net_x42,
      ce_1 => ce_1_sg_x355,
      clk_1 => clk_1_sg_x355,
      d => concat_y_net_x43,
      sync_in => delay_q_net_x26,
      abcd0 => slr_q_net_x10,
      abcd1 => mux1_y_net_x8,
      abcd2 => slr_q_net_x11,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x8
    );

  r4_butterfly_d4498510b1: entity work.r4_butterfly_entity_d4498510b1
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x38,
      c_in => concat_y_net_x11,
      ce_1 => ce_1_sg_x355,
      clk_1 => clk_1_sg_x355,
      d_in => concat_y_net_x39,
      sync_in => delay_q_net_x4,
      a_out => concat_y_net_x44,
      b_out => concat_y_net_x45,
      c_out => concat_y_net_x46,
      d_out => concat_y_net_x47,
      sync_out => delay_q_net_x10
    );

  r4_twiddle_bdb69c3a13: entity work.r4_twiddle_entity_bdb69c3a13
    port map (
      a_in => slr_q_net_x10,
      b => mux1_y_net_x8,
      c => slr_q_net_x11,
      ce_1 => ce_1_sg_x355,
      clk_1 => clk_1_sg_x355,
      d => mux1_y_net_x9,
      sync_in => delay_q_net_x8,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x38,
      cw => concat_y_net_x11,
      dw => concat_y_net_x39,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_dit_fft"

entity r4_dit_fft_entity_19e496a927 is
  port (
    a_in: in std_logic_vector(17 downto 0); 
    b_in: in std_logic_vector(17 downto 0); 
    c_in: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(17 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(37 downto 0); 
    b_out: out std_logic_vector(37 downto 0); 
    c_out: out std_logic_vector(37 downto 0); 
    d_out: out std_logic_vector(37 downto 0)
  );
end r4_dit_fft_entity_19e496a927;

architecture structural of r4_dit_fft_entity_19e496a927 is
  signal ce_1_sg_x356: std_logic;
  signal clk_1_sg_x356: std_logic;
  signal concat_y_net_x15: std_logic_vector(37 downto 0);
  signal concat_y_net_x16: std_logic_vector(37 downto 0);
  signal concat_y_net_x24: std_logic_vector(21 downto 0);
  signal concat_y_net_x33: std_logic_vector(21 downto 0);
  signal concat_y_net_x34: std_logic_vector(21 downto 0);
  signal concat_y_net_x35: std_logic_vector(21 downto 0);
  signal concat_y_net_x40: std_logic_vector(33 downto 0);
  signal concat_y_net_x41: std_logic_vector(33 downto 0);
  signal concat_y_net_x42: std_logic_vector(33 downto 0);
  signal concat_y_net_x43: std_logic_vector(33 downto 0);
  signal concat_y_net_x44: std_logic_vector(37 downto 0);
  signal concat_y_net_x45: std_logic_vector(37 downto 0);
  signal concat_y_net_x46: std_logic_vector(37 downto 0);
  signal concat_y_net_x47: std_logic_vector(37 downto 0);
  signal concat_y_net_x48: std_logic_vector(25 downto 0);
  signal concat_y_net_x49: std_logic_vector(25 downto 0);
  signal concat_y_net_x50: std_logic_vector(25 downto 0);
  signal concat_y_net_x51: std_logic_vector(25 downto 0);
  signal concat_y_net_x52: std_logic_vector(37 downto 0);
  signal concat_y_net_x53: std_logic_vector(37 downto 0);
  signal concat_y_net_x54: std_logic_vector(37 downto 0);
  signal concat_y_net_x55: std_logic_vector(37 downto 0);
  signal concat_y_net_x64: std_logic_vector(29 downto 0);
  signal concat_y_net_x65: std_logic_vector(29 downto 0);
  signal concat_y_net_x66: std_logic_vector(29 downto 0);
  signal concat_y_net_x67: std_logic_vector(29 downto 0);
  signal delay_q_net_x10: std_logic;
  signal delay_q_net_x13: std_logic;
  signal delay_q_net_x16: std_logic;
  signal delay_q_net_x21: std_logic;
  signal delay_q_net_x26: std_logic;
  signal delay_q_net_x27: std_logic;
  signal delay_q_net_x7: std_logic;
  signal mux1_y_net_x6: std_logic_vector(37 downto 0);
  signal mux1_y_net_x7: std_logic_vector(37 downto 0);
  signal shift1_op_net_x3: std_logic_vector(17 downto 0);
  signal shift2_op_net_x4: std_logic_vector(17 downto 0);
  signal shift3_op_net_x4: std_logic_vector(17 downto 0);
  signal shift_op_net_x3: std_logic_vector(17 downto 0);

begin
  shift_op_net_x3 <= a_in;
  shift1_op_net_x3 <= b_in;
  shift2_op_net_x4 <= c_in;
  ce_1_sg_x356 <= ce_1;
  clk_1_sg_x356 <= clk_1;
  shift3_op_net_x4 <= d_in;
  delay_q_net_x27 <= sync_in;
  a_out <= concat_y_net_x52;
  b_out <= concat_y_net_x53;
  c_out <= concat_y_net_x54;
  d_out <= concat_y_net_x55;

  quadplex_bitrev_ec8fe59fef: entity work.quadplex_bitrev_entity_ec8fe59fef
    port map (
      a_in => concat_y_net_x15,
      b_in => mux1_y_net_x6,
      c_in => concat_y_net_x16,
      ce_1 => ce_1_sg_x356,
      clk_1 => clk_1_sg_x356,
      d_in => mux1_y_net_x7,
      sync_in => delay_q_net_x7,
      a_out => concat_y_net_x52,
      b_out => concat_y_net_x53,
      c_out => concat_y_net_x54,
      d_out => concat_y_net_x55
    );

  quadplex_commutator_921a5ee5e2: entity work.quadplex_commutator_entity_921a5ee5e2
    port map (
      a => concat_y_net_x44,
      b => concat_y_net_x46,
      c => concat_y_net_x45,
      ce_1 => ce_1_sg_x356,
      clk_1 => clk_1_sg_x356,
      d => concat_y_net_x47,
      sync_in => delay_q_net_x10,
      abcd0 => concat_y_net_x15,
      abcd1 => mux1_y_net_x6,
      abcd2 => concat_y_net_x16,
      abcd3 => mux1_y_net_x7,
      sync_out => delay_q_net_x7
    );

  r4_dit_stage_1_6507e08cde: entity work.r4_dit_stage_1_entity_6507e08cde
    port map (
      a_in => shift_op_net_x3,
      b_in => shift1_op_net_x3,
      c_in => shift2_op_net_x4,
      ce_1 => ce_1_sg_x356,
      clk_1 => clk_1_sg_x356,
      d_in => shift3_op_net_x4,
      sync_in => delay_q_net_x27,
      a_out => concat_y_net_x24,
      b_out => concat_y_net_x33,
      c_out => concat_y_net_x34,
      d_out => concat_y_net_x35,
      sync_out => delay_q_net_x16
    );

  r4_dit_stage_2_799bdb5f7a: entity work.r4_dit_stage_2_entity_799bdb5f7a
    port map (
      a_in => concat_y_net_x24,
      b_in => concat_y_net_x33,
      c_in => concat_y_net_x34,
      ce_1 => ce_1_sg_x356,
      clk_1 => clk_1_sg_x356,
      d_in => concat_y_net_x35,
      sync_in => delay_q_net_x16,
      a_out => concat_y_net_x48,
      b_out => concat_y_net_x49,
      c_out => concat_y_net_x50,
      d_out => concat_y_net_x51,
      sync_out => delay_q_net_x13
    );

  r4_dit_stage_3_2c3798b44c: entity work.r4_dit_stage_3_entity_2c3798b44c
    port map (
      a_in => concat_y_net_x48,
      b_in => concat_y_net_x49,
      c_in => concat_y_net_x50,
      ce_1 => ce_1_sg_x356,
      clk_1 => clk_1_sg_x356,
      d_in => concat_y_net_x51,
      sync_in => delay_q_net_x13,
      a_out => concat_y_net_x64,
      b_out => concat_y_net_x65,
      c_out => concat_y_net_x66,
      d_out => concat_y_net_x67,
      sync_out => delay_q_net_x21
    );

  r4_dit_stage_4_7c1fdc5031: entity work.r4_dit_stage_4_entity_7c1fdc5031
    port map (
      a_in => concat_y_net_x64,
      b_in => concat_y_net_x65,
      c_in => concat_y_net_x66,
      ce_1 => ce_1_sg_x356,
      clk_1 => clk_1_sg_x356,
      d_in => concat_y_net_x67,
      sync_in => delay_q_net_x21,
      a_out => concat_y_net_x40,
      b_out => concat_y_net_x41,
      c_out => concat_y_net_x42,
      d_out => concat_y_net_x43,
      sync_out => delay_q_net_x26
    );

  r4_dit_stage_5_9486a46fdf: entity work.r4_dit_stage_5_entity_9486a46fdf
    port map (
      a_in => concat_y_net_x40,
      b_in => concat_y_net_x41,
      c_in => concat_y_net_x42,
      ce_1 => ce_1_sg_x356,
      clk_1 => clk_1_sg_x356,
      d_in => concat_y_net_x43,
      sync_in => delay_q_net_x26,
      a_out => concat_y_net_x44,
      b_out => concat_y_net_x45,
      c_out => concat_y_net_x46,
      d_out => concat_y_net_x47,
      sync_out => delay_q_net_x10
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_power19_1/c_to_ri"

entity c_to_ri_entity_670c41d5a5 is
  port (
    c: in std_logic_vector(37 downto 0); 
    im: out std_logic_vector(18 downto 0); 
    re: out std_logic_vector(18 downto 0)
  );
end c_to_ri_entity_670c41d5a5;

architecture structural of c_to_ri_entity_670c41d5a5 is
  signal delay5_q_net_x0: std_logic_vector(37 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(18 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(18 downto 0);
  signal slice_im_y_net: std_logic_vector(18 downto 0);
  signal slice_re_y_net: std_logic_vector(18 downto 0);

begin
  delay5_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_63700884f5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_63700884f5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_re_y_net,
      output_port => force_re_output_port_net_x0
    );

  slice_im: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 18,
      x_width => 38,
      y_width => 19
    )
    port map (
      x => delay5_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 19,
      new_msb => 37,
      x_width => 38,
      y_width => 19
    )
    port map (
      x => delay5_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/r4_power19_1"

entity r4_power19_1_entity_5cf7d1b86f is
  port (
    c: in std_logic_vector(37 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    power: out std_logic_vector(37 downto 0)
  );
end r4_power19_1_entity_5cf7d1b86f;

architecture structural of r4_power19_1_entity_5cf7d1b86f is
  signal ce_1_sg_x357: std_logic;
  signal clk_1_sg_x357: std_logic;
  signal delay5_q_net_x1: std_logic_vector(37 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(18 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(18 downto 0);
  signal imag_square_p_net: std_logic_vector(37 downto 0);
  signal power_adder_s_net_x0: std_logic_vector(37 downto 0);
  signal real_square_p_net: std_logic_vector(37 downto 0);

begin
  delay5_q_net_x1 <= c;
  ce_1_sg_x357 <= ce_1;
  clk_1_sg_x357 <= clk_1;
  power <= power_adder_s_net_x0;

  c_to_ri_670c41d5a5: entity work.c_to_ri_entity_670c41d5a5
    port map (
      c => delay5_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  imag_square: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 19,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 19,
      c_a_type => 0,
      c_a_width => 19,
      c_b_type => 0,
      c_b_width => 19,
      c_baat => 19,
      c_output_width => 38,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_36b8f4cb731cc5b3",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 32,
      p_width => 38,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x357,
      clk => clk_1_sg_x357,
      clr => '0',
      core_ce => ce_1_sg_x357,
      core_clk => clk_1_sg_x357,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imag_square_p_net
    );

  power_adder: entity work.addsub_96d2a7e25e
    port map (
      a => real_square_p_net,
      b => imag_square_p_net,
      ce => ce_1_sg_x357,
      clk => clk_1_sg_x357,
      clr => '0',
      s => power_adder_s_net_x0
    );

  real_square: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 19,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 19,
      c_a_type => 0,
      c_a_width => 19,
      c_b_type => 0,
      c_b_width => 19,
      c_baat => 19,
      c_output_width => 38,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_36b8f4cb731cc5b3",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 32,
      p_width => 38,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x0,
      ce => ce_1_sg_x357,
      clk => clk_1_sg_x357,
      clr => '0',
      core_ce => ce_1_sg_x357,
      core_clk => clk_1_sg_x357,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => real_square_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/snap_adc/addr"

entity addr_entity_4c69ae3b4e is
  port (
    reg_out: in std_logic_vector(9 downto 0); 
    convert_x0: out std_logic_vector(31 downto 0)
  );
end addr_entity_4c69ae3b4e;

architecture structural of addr_entity_4c69ae3b4e is
  signal convert_dout_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);

begin
  register1_q_net_x0 <= reg_out;
  convert_x0 <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => register1_q_net_x0,
      dout => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/snap_adc/bram"

entity bram_entity_45f389ea7a is
  port (
    addr: in std_logic_vector(9 downto 0); 
    data_in: in std_logic_vector(63 downto 0); 
    we: in std_logic; 
    convert_addr_x0: out std_logic_vector(9 downto 0); 
    convert_din_x0: out std_logic_vector(31 downto 0); 
    convert_we_x0: out std_logic
  );
end bram_entity_45f389ea7a;

architecture structural of bram_entity_45f389ea7a is
  signal convert_addr_dout_net_x0: std_logic_vector(9 downto 0);
  signal convert_din_dout_net_x0: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x0: std_logic;
  signal enable_y_net_x0: std_logic_vector(9 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(63 downto 0);

begin
  enable_y_net_x0 <= addr;
  reinterpret_output_port_net_x0 <= data_in;
  logical1_y_net_x0 <= we;
  convert_addr_x0 <= convert_addr_dout_net_x0;
  convert_din_x0 <= convert_din_dout_net_x0;
  convert_we_x0 <= convert_we_dout_net_x0;

  convert_addr: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => enable_y_net_x0,
      dout => convert_addr_dout_net_x0
    );

  convert_din: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 64,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => reinterpret_output_port_net_x0,
      dout => convert_din_dout_net_x0
    );

  convert_we: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => logical1_y_net_x0,
      dout(0) => convert_we_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/snap_adc/freeze_cntr"

entity freeze_cntr_entity_5872a7adea is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    en: in std_logic; 
    rst: in std_logic; 
    addr: out std_logic_vector(9 downto 0); 
    we: out std_logic
  );
end freeze_cntr_entity_5872a7adea;

architecture structural of freeze_cntr_entity_5872a7adea is
  signal ce_1_sg_x361: std_logic;
  signal clk_1_sg_x361: std_logic;
  signal counter3_op_net: std_logic_vector(10 downto 0);
  signal enable1_y_net: std_logic;
  signal enable_y_net_x1: std_logic_vector(9 downto 0);
  signal inverter1_op_net: std_logic;
  signal inverter_op_net: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical5_y_net: std_logic;
  signal mux1_y_net_x0: std_logic;
  signal register_q_net_x0: std_logic;

begin
  ce_1_sg_x361 <= ce_1;
  clk_1_sg_x361 <= clk_1;
  mux1_y_net_x0 <= en;
  register_q_net_x0 <= rst;
  addr <= enable_y_net_x1;
  we <= logical1_y_net_x1;

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_ed17144209261f47",
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      clr => '0',
      en(0) => logical5_y_net,
      rst(0) => register_q_net_x0,
      op => counter3_op_net
    );

  enable: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 11,
      y_width => 10
    )
    port map (
      x => counter3_op_net,
      y => enable_y_net_x1
    );

  enable1: entity work.xlslice
    generic map (
      new_lsb => 10,
      new_msb => 10,
      x_width => 11,
      y_width => 1
    )
    port map (
      x => counter3_op_net,
      y(0) => enable1_y_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      clr => '0',
      ip(0) => register_q_net_x0,
      op(0) => inverter_op_net
    );

  inverter1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      clr => '0',
      ip(0) => enable1_y_net,
      op(0) => inverter1_op_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => inverter_op_net,
      d1(0) => logical5_y_net,
      y(0) => logical1_y_net_x1
    );

  logical5: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => mux1_y_net_x0,
      d1(0) => inverter1_op_net,
      y(0) => logical5_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/snap_adc"

entity snap_adc_entity_8e9347af79 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(63 downto 0); 
    r4_iadc_spec_snap_adc_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_adc_entity_8e9347af79;

architecture structural of snap_adc_entity_8e9347af79 is
  signal ce_1_sg_x363: std_logic;
  signal clk_1_sg_x363: std_logic;
  signal concat3_y_net_x0: std_logic_vector(63 downto 0);
  signal constant12_op_net_x0: std_logic;
  signal constant1_op_net: std_logic;
  signal constant2_op_net: std_logic;
  signal constant3_op_net_x0: std_logic;
  signal constant_op_net: std_logic;
  signal convert_addr_dout_net_x1: std_logic_vector(9 downto 0);
  signal convert_din_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x1: std_logic;
  signal enable_y_net_x0: std_logic;
  signal enable_y_net_x1: std_logic_vector(9 downto 0);
  signal inverter_op_net: std_logic;
  signal logical1_y_net: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic;
  signal mux2_y_net: std_logic;
  signal r4_iadc_spec_snap_adc_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(63 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x363 <= ce_1;
  clk_1_sg_x363 <= clk_1;
  concat3_y_net_x0 <= din;
  r4_iadc_spec_snap_adc_ctrl_user_data_out_net_x0 <= r4_iadc_spec_snap_adc_ctrl_user_data_out;
  constant3_op_net_x0 <= trig;
  constant12_op_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_4c69ae3b4e: entity work.addr_entity_4c69ae3b4e
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_45f389ea7a: entity work.bram_entity_45f389ea7a
    port map (
      addr => enable_y_net_x1,
      data_in => reinterpret_output_port_net_x0,
      we => logical1_y_net_x1,
      convert_addr_x0 => convert_addr_dout_net_x1,
      convert_din_x0 => convert_din_dout_net_x1,
      convert_we_x0 => convert_we_dout_net_x1
    );

  constant1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  enable: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_adc_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_5872a7adea: entity work.freeze_cntr_entity_5872a7adea
    port map (
      ce_1 => ce_1_sg_x363,
      clk_1 => clk_1_sg_x363,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      ip(0) => logical_y_net_x0,
      op(0) => inverter_op_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => mux2_y_net,
      d1(0) => inverter_op_net,
      y(0) => logical1_y_net
    );

  mux1: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => constant12_op_net_x0,
      d1(0) => constant2_op_net,
      sel(0) => valid_y_net,
      y(0) => mux1_y_net_x0
    );

  mux2: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => constant3_op_net_x0,
      d1(0) => constant1_op_net,
      sel(0) => trig1_y_net,
      y(0) => mux2_y_net
    );

  posedge_3c648bc1d3: entity work.posedge1_entity_540938390c
    port map (
      ce_1 => ce_1_sg_x363,
      clk_1 => clk_1_sg_x363,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      d => enable_y_net_x1,
      en(0) => logical1_y_net_x1,
      rst(0) => logical_y_net_x0,
      q => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      d(0) => constant_op_net,
      en(0) => logical_y_net_x0,
      rst(0) => logical1_y_net,
      q(0) => register_q_net_x0
    );

  reinterpret: entity work.reinterpret_9a13f6a2a0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => concat3_y_net_x0,
      output_port => reinterpret_output_port_net_x0
    );

  trig1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_adc_ctrl_user_data_out_net_x0,
      y(0) => trig1_y_net
    );

  valid: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_adc_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/snap_vacc0/bram"

entity bram_entity_4f094295d2 is
  port (
    addr: in std_logic_vector(9 downto 0); 
    data_in: in std_logic_vector(31 downto 0); 
    we: in std_logic; 
    convert_addr_x0: out std_logic_vector(9 downto 0); 
    convert_din_x0: out std_logic_vector(31 downto 0); 
    convert_we_x0: out std_logic
  );
end bram_entity_4f094295d2;

architecture structural of bram_entity_4f094295d2 is
  signal convert_addr_dout_net_x0: std_logic_vector(9 downto 0);
  signal convert_din_dout_net_x0: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x0: std_logic;
  signal enable_y_net_x0: std_logic_vector(9 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);

begin
  enable_y_net_x0 <= addr;
  reinterpret_output_port_net_x0 <= data_in;
  logical1_y_net_x0 <= we;
  convert_addr_x0 <= convert_addr_dout_net_x0;
  convert_din_x0 <= convert_din_dout_net_x0;
  convert_we_x0 <= convert_we_dout_net_x0;

  convert_addr: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 10,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 10,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => enable_y_net_x0,
      dout => convert_addr_dout_net_x0
    );

  convert_din: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => reinterpret_output_port_net_x0,
      dout => convert_din_dout_net_x0
    );

  convert_we: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => logical1_y_net_x0,
      dout(0) => convert_we_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/snap_vacc0"

entity snap_vacc0_entity_b90e9dba61 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc0_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc0_entity_b90e9dba61;

architecture structural of snap_vacc0_entity_b90e9dba61 is
  signal ce_1_sg_x366: std_logic;
  signal clk_1_sg_x366: std_logic;
  signal constant1_op_net: std_logic;
  signal constant2_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal convert_addr_dout_net_x1: std_logic_vector(9 downto 0);
  signal convert_din_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x1: std_logic;
  signal delay11_q_net_x0: std_logic_vector(31 downto 0);
  signal delay12_q_net_x0: std_logic;
  signal delay29_q_net_x0: std_logic;
  signal enable_y_net_x0: std_logic;
  signal enable_y_net_x1: std_logic_vector(9 downto 0);
  signal inverter_op_net: std_logic;
  signal logical1_y_net: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic;
  signal mux2_y_net: std_logic;
  signal r4_iadc_spec_snap_vacc0_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x366 <= ce_1;
  clk_1_sg_x366 <= clk_1;
  delay11_q_net_x0 <= din;
  r4_iadc_spec_snap_vacc0_ctrl_user_data_out_net_x0 <= r4_iadc_spec_snap_vacc0_ctrl_user_data_out;
  delay29_q_net_x0 <= trig;
  delay12_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_1d99a86059: entity work.addr_entity_4c69ae3b4e
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_4f094295d2: entity work.bram_entity_4f094295d2
    port map (
      addr => enable_y_net_x1,
      data_in => reinterpret_output_port_net_x0,
      we => logical1_y_net_x1,
      convert_addr_x0 => convert_addr_dout_net_x1,
      convert_din_x0 => convert_din_dout_net_x1,
      convert_we_x0 => convert_we_dout_net_x1
    );

  constant1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  enable: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc0_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_6aa783aa53: entity work.freeze_cntr_entity_5872a7adea
    port map (
      ce_1 => ce_1_sg_x366,
      clk_1 => clk_1_sg_x366,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      clr => '0',
      ip(0) => logical_y_net_x0,
      op(0) => inverter_op_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => mux2_y_net,
      d1(0) => inverter_op_net,
      y(0) => logical1_y_net
    );

  mux1: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay12_q_net_x0,
      d1(0) => constant2_op_net,
      sel(0) => valid_y_net,
      y(0) => mux1_y_net_x0
    );

  mux2: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay29_q_net_x0,
      d1(0) => constant1_op_net,
      sel(0) => trig1_y_net,
      y(0) => mux2_y_net
    );

  posedge_a2772c6bbd: entity work.posedge1_entity_540938390c
    port map (
      ce_1 => ce_1_sg_x366,
      clk_1 => clk_1_sg_x366,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d => enable_y_net_x1,
      en(0) => logical1_y_net_x1,
      rst(0) => logical_y_net_x0,
      q => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d(0) => constant_op_net,
      en(0) => logical_y_net_x0,
      rst(0) => logical1_y_net,
      q(0) => register_q_net_x0
    );

  reinterpret: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay11_q_net_x0,
      output_port => reinterpret_output_port_net_x0
    );

  trig1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc0_ctrl_user_data_out_net_x0,
      y(0) => trig1_y_net
    );

  valid: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc0_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/snap_vacc1"

entity snap_vacc1_entity_45c53a911d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc1_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc1_entity_45c53a911d;

architecture structural of snap_vacc1_entity_45c53a911d is
  signal ce_1_sg_x369: std_logic;
  signal clk_1_sg_x369: std_logic;
  signal constant1_op_net: std_logic;
  signal constant2_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal convert_addr_dout_net_x1: std_logic_vector(9 downto 0);
  signal convert_din_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x1: std_logic;
  signal delay13_q_net_x0: std_logic_vector(31 downto 0);
  signal delay29_q_net_x1: std_logic;
  signal delay8_q_net_x0: std_logic;
  signal enable_y_net_x0: std_logic;
  signal enable_y_net_x1: std_logic_vector(9 downto 0);
  signal inverter_op_net: std_logic;
  signal logical1_y_net: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic;
  signal mux2_y_net: std_logic;
  signal r4_iadc_spec_snap_vacc1_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x369 <= ce_1;
  clk_1_sg_x369 <= clk_1;
  delay13_q_net_x0 <= din;
  r4_iadc_spec_snap_vacc1_ctrl_user_data_out_net_x0 <= r4_iadc_spec_snap_vacc1_ctrl_user_data_out;
  delay29_q_net_x1 <= trig;
  delay8_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_99cf063855: entity work.addr_entity_4c69ae3b4e
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_559e4741c1: entity work.bram_entity_4f094295d2
    port map (
      addr => enable_y_net_x1,
      data_in => reinterpret_output_port_net_x0,
      we => logical1_y_net_x1,
      convert_addr_x0 => convert_addr_dout_net_x1,
      convert_din_x0 => convert_din_dout_net_x1,
      convert_we_x0 => convert_we_dout_net_x1
    );

  constant1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  enable: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc1_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_6bd1b3e0a7: entity work.freeze_cntr_entity_5872a7adea
    port map (
      ce_1 => ce_1_sg_x369,
      clk_1 => clk_1_sg_x369,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x369,
      clk => clk_1_sg_x369,
      clr => '0',
      ip(0) => logical_y_net_x0,
      op(0) => inverter_op_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => mux2_y_net,
      d1(0) => inverter_op_net,
      y(0) => logical1_y_net
    );

  mux1: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay8_q_net_x0,
      d1(0) => constant2_op_net,
      sel(0) => valid_y_net,
      y(0) => mux1_y_net_x0
    );

  mux2: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay29_q_net_x1,
      d1(0) => constant1_op_net,
      sel(0) => trig1_y_net,
      y(0) => mux2_y_net
    );

  posedge_a75a143eac: entity work.posedge1_entity_540938390c
    port map (
      ce_1 => ce_1_sg_x369,
      clk_1 => clk_1_sg_x369,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x369,
      clk => clk_1_sg_x369,
      d => enable_y_net_x1,
      en(0) => logical1_y_net_x1,
      rst(0) => logical_y_net_x0,
      q => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x369,
      clk => clk_1_sg_x369,
      d(0) => constant_op_net,
      en(0) => logical_y_net_x0,
      rst(0) => logical1_y_net,
      q(0) => register_q_net_x0
    );

  reinterpret: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay13_q_net_x0,
      output_port => reinterpret_output_port_net_x0
    );

  trig1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc1_ctrl_user_data_out_net_x0,
      y(0) => trig1_y_net
    );

  valid: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc1_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/snap_vacc2"

entity snap_vacc2_entity_a7001db681 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc2_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc2_entity_a7001db681;

architecture structural of snap_vacc2_entity_a7001db681 is
  signal ce_1_sg_x372: std_logic;
  signal clk_1_sg_x372: std_logic;
  signal constant1_op_net: std_logic;
  signal constant2_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal convert_addr_dout_net_x1: std_logic_vector(9 downto 0);
  signal convert_din_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x1: std_logic;
  signal delay35_q_net_x0: std_logic_vector(31 downto 0);
  signal delay36_q_net_x0: std_logic;
  signal delay45_q_net_x0: std_logic;
  signal enable_y_net_x0: std_logic;
  signal enable_y_net_x1: std_logic_vector(9 downto 0);
  signal inverter_op_net: std_logic;
  signal logical1_y_net: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic;
  signal mux2_y_net: std_logic;
  signal r4_iadc_spec_snap_vacc2_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x372 <= ce_1;
  clk_1_sg_x372 <= clk_1;
  delay35_q_net_x0 <= din;
  r4_iadc_spec_snap_vacc2_ctrl_user_data_out_net_x0 <= r4_iadc_spec_snap_vacc2_ctrl_user_data_out;
  delay45_q_net_x0 <= trig;
  delay36_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_ad4608911b: entity work.addr_entity_4c69ae3b4e
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_57c6ed7e7f: entity work.bram_entity_4f094295d2
    port map (
      addr => enable_y_net_x1,
      data_in => reinterpret_output_port_net_x0,
      we => logical1_y_net_x1,
      convert_addr_x0 => convert_addr_dout_net_x1,
      convert_din_x0 => convert_din_dout_net_x1,
      convert_we_x0 => convert_we_dout_net_x1
    );

  constant1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  enable: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc2_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_80d0a58068: entity work.freeze_cntr_entity_5872a7adea
    port map (
      ce_1 => ce_1_sg_x372,
      clk_1 => clk_1_sg_x372,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
      clr => '0',
      ip(0) => logical_y_net_x0,
      op(0) => inverter_op_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => mux2_y_net,
      d1(0) => inverter_op_net,
      y(0) => logical1_y_net
    );

  mux1: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay36_q_net_x0,
      d1(0) => constant2_op_net,
      sel(0) => valid_y_net,
      y(0) => mux1_y_net_x0
    );

  mux2: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay45_q_net_x0,
      d1(0) => constant1_op_net,
      sel(0) => trig1_y_net,
      y(0) => mux2_y_net
    );

  posedge_8be32ddfef: entity work.posedge1_entity_540938390c
    port map (
      ce_1 => ce_1_sg_x372,
      clk_1 => clk_1_sg_x372,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
      d => enable_y_net_x1,
      en(0) => logical1_y_net_x1,
      rst(0) => logical_y_net_x0,
      q => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
      d(0) => constant_op_net,
      en(0) => logical_y_net_x0,
      rst(0) => logical1_y_net,
      q(0) => register_q_net_x0
    );

  reinterpret: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay35_q_net_x0,
      output_port => reinterpret_output_port_net_x0
    );

  trig1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc2_ctrl_user_data_out_net_x0,
      y(0) => trig1_y_net
    );

  valid: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc2_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/snap_vacc3"

entity snap_vacc3_entity_cb224f6dd6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc3_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc3_entity_cb224f6dd6;

architecture structural of snap_vacc3_entity_cb224f6dd6 is
  signal ce_1_sg_x375: std_logic;
  signal clk_1_sg_x375: std_logic;
  signal constant1_op_net: std_logic;
  signal constant2_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal convert_addr_dout_net_x1: std_logic_vector(9 downto 0);
  signal convert_din_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x1: std_logic;
  signal delay37_q_net_x0: std_logic_vector(31 downto 0);
  signal delay45_q_net_x1: std_logic;
  signal delay47_q_net_x0: std_logic;
  signal enable_y_net_x0: std_logic;
  signal enable_y_net_x1: std_logic_vector(9 downto 0);
  signal inverter_op_net: std_logic;
  signal logical1_y_net: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic;
  signal mux2_y_net: std_logic;
  signal r4_iadc_spec_snap_vacc3_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x375 <= ce_1;
  clk_1_sg_x375 <= clk_1;
  delay37_q_net_x0 <= din;
  r4_iadc_spec_snap_vacc3_ctrl_user_data_out_net_x0 <= r4_iadc_spec_snap_vacc3_ctrl_user_data_out;
  delay45_q_net_x1 <= trig;
  delay47_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_a33060b73d: entity work.addr_entity_4c69ae3b4e
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_d8eef9c8a5: entity work.bram_entity_4f094295d2
    port map (
      addr => enable_y_net_x1,
      data_in => reinterpret_output_port_net_x0,
      we => logical1_y_net_x1,
      convert_addr_x0 => convert_addr_dout_net_x1,
      convert_din_x0 => convert_din_dout_net_x1,
      convert_we_x0 => convert_we_dout_net_x1
    );

  constant1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  enable: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc3_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_93079b1842: entity work.freeze_cntr_entity_5872a7adea
    port map (
      ce_1 => ce_1_sg_x375,
      clk_1 => clk_1_sg_x375,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x375,
      clk => clk_1_sg_x375,
      clr => '0',
      ip(0) => logical_y_net_x0,
      op(0) => inverter_op_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => mux2_y_net,
      d1(0) => inverter_op_net,
      y(0) => logical1_y_net
    );

  mux1: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay47_q_net_x0,
      d1(0) => constant2_op_net,
      sel(0) => valid_y_net,
      y(0) => mux1_y_net_x0
    );

  mux2: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay45_q_net_x1,
      d1(0) => constant1_op_net,
      sel(0) => trig1_y_net,
      y(0) => mux2_y_net
    );

  posedge_29f6975c3c: entity work.posedge1_entity_540938390c
    port map (
      ce_1 => ce_1_sg_x375,
      clk_1 => clk_1_sg_x375,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x375,
      clk => clk_1_sg_x375,
      d => enable_y_net_x1,
      en(0) => logical1_y_net_x1,
      rst(0) => logical_y_net_x0,
      q => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x375,
      clk => clk_1_sg_x375,
      d(0) => constant_op_net,
      en(0) => logical_y_net_x0,
      rst(0) => logical1_y_net,
      q(0) => register_q_net_x0
    );

  reinterpret: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay37_q_net_x0,
      output_port => reinterpret_output_port_net_x0
    );

  trig1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc3_ctrl_user_data_out_net_x0,
      y(0) => trig1_y_net
    );

  valid: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => r4_iadc_spec_snap_vacc3_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/vacc0/delay_bram"

entity delay_bram_entity_501f371ea0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(31 downto 0); 
    out1: out std_logic_vector(31 downto 0)
  );
end delay_bram_entity_501f371ea0;

architecture structural of delay_bram_entity_501f371ea0 is
  signal adder0_s_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x376: std_logic;
  signal clk_1_sg_x376: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x376 <= ce_1;
  clk_1_sg_x376 <= clk_1;
  adder0_s_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x0;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 1019,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex5_10_0_1ee993c8ed57b9ce",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 10,
      c_width => 32,
      core_name0 => "bmg_24_vx5_6f3d016421754f60",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
      data_in => adder0_s_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/vacc0/pulse_ext"

entity pulse_ext_entity_630df177f6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end pulse_ext_entity_630df177f6;

architecture structural of pulse_ext_entity_630df177f6 is
  signal ce_1_sg_x378: std_logic;
  signal clk_1_sg_x378: std_logic;
  signal constant5_op_net: std_logic_vector(10 downto 0);
  signal counter3_op_net: std_logic_vector(10 downto 0);
  signal delay24_q_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal relational5_op_net_x0: std_logic;

begin
  ce_1_sg_x378 <= ce_1;
  clk_1_sg_x378 <= clk_1;
  delay24_q_net_x1 <= in_x0;
  out_x0 <= relational5_op_net_x0;

  constant5: entity work.constant_0604807f72
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_ed17144209261f47",
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x378,
      clk => clk_1_sg_x378,
      clr => '0',
      en(0) => relational5_op_net_x0,
      rst(0) => logical_y_net_x0,
      op => counter3_op_net
    );

  posedge_e4a03e9841: entity work.posedge1_entity_540938390c
    port map (
      ce_1 => ce_1_sg_x378,
      clk_1 => clk_1_sg_x378,
      in_x0 => delay24_q_net_x1,
      out_x0 => logical_y_net_x0
    );

  relational5: entity work.relational_b4b277ae0f
    port map (
      a => counter3_op_net,
      b => constant5_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational5_op_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec/vacc0"

entity vacc0_entity_c50ee0843b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(37 downto 0); 
    new_acc: in std_logic; 
    dout: out std_logic_vector(31 downto 0); 
    valid: out std_logic
  );
end vacc0_entity_c50ee0843b;

architecture structural of vacc0_entity_c50ee0843b is
  signal adder0_s_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x379: std_logic;
  signal clk_1_sg_x379: std_logic;
  signal delay24_q_net_x2: std_logic;
  signal delay25_q_net_x0: std_logic_vector(37 downto 0);
  signal mux0_y_net: std_logic_vector(40 downto 0);
  signal relational5_op_net_x1: std_logic;
  signal single_port_ram_data_out_net_x1: std_logic_vector(31 downto 0);
  signal zero_op_net: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x379 <= ce_1;
  clk_1_sg_x379 <= clk_1;
  delay25_q_net_x0 <= din;
  delay24_q_net_x2 <= new_acc;
  dout <= single_port_ram_data_out_net_x1;
  valid <= relational5_op_net_x1;

  adder0: entity work.addsub_4238e1a78a
    port map (
      a => delay25_q_net_x0,
      b => mux0_y_net,
      ce => ce_1_sg_x379,
      clk => clk_1_sg_x379,
      clr => '0',
      s => adder0_s_net_x0
    );

  delay_bram_501f371ea0: entity work.delay_bram_entity_501f371ea0
    port map (
      ce_1 => ce_1_sg_x379,
      clk_1 => clk_1_sg_x379,
      in1 => adder0_s_net_x0,
      out1 => single_port_ram_data_out_net_x1
    );

  mux0: entity work.mux_10eb3a1f2d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => single_port_ram_data_out_net_x1,
      d1 => zero_op_net,
      sel(0) => relational5_op_net_x1,
      y => mux0_y_net
    );

  pulse_ext_630df177f6: entity work.pulse_ext_entity_630df177f6
    port map (
      ce_1 => ce_1_sg_x379,
      clk_1 => clk_1_sg_x379,
      in_x0 => delay24_q_net_x2,
      out_x0 => relational5_op_net_x1
    );

  zero: entity work.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => zero_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_iadc_spec"

entity r4_iadc_spec is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    r4_iadc_spec_acc_len_user_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_adc_user_data_valid: in std_logic; 
    r4_iadc_spec_adc_user_datai0: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_datai1: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_datai2: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_datai3: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_dataq0: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_dataq1: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_dataq2: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_dataq3: in std_logic_vector(7 downto 0); 
    r4_iadc_spec_adc_user_outofrangei0: in std_logic; 
    r4_iadc_spec_adc_user_outofrangei1: in std_logic; 
    r4_iadc_spec_adc_user_outofrangeq0: in std_logic; 
    r4_iadc_spec_adc_user_outofrangeq1: in std_logic; 
    r4_iadc_spec_adc_user_sync0: in std_logic; 
    r4_iadc_spec_adc_user_sync1: in std_logic; 
    r4_iadc_spec_adc_user_sync2: in std_logic; 
    r4_iadc_spec_adc_user_sync3: in std_logic; 
    r4_iadc_spec_cnt_rst_user_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_adc_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_adc_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc0_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc0_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc1_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc1_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc2_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc2_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc3_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc3_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_iadc_spec_acc_cnt_user_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_led0_sync_gateway: out std_logic; 
    r4_iadc_spec_led1_new_acc_gateway: out std_logic; 
    r4_iadc_spec_snap_adc_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_adc_bram_addr: out std_logic_vector(9 downto 0); 
    r4_iadc_spec_snap_adc_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_adc_bram_we: out std_logic; 
    r4_iadc_spec_snap_vacc0_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc0_bram_addr: out std_logic_vector(9 downto 0); 
    r4_iadc_spec_snap_vacc0_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc0_bram_we: out std_logic; 
    r4_iadc_spec_snap_vacc1_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc1_bram_addr: out std_logic_vector(9 downto 0); 
    r4_iadc_spec_snap_vacc1_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc1_bram_we: out std_logic; 
    r4_iadc_spec_snap_vacc2_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc2_bram_addr: out std_logic_vector(9 downto 0); 
    r4_iadc_spec_snap_vacc2_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc2_bram_we: out std_logic; 
    r4_iadc_spec_snap_vacc3_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc3_bram_addr: out std_logic_vector(9 downto 0); 
    r4_iadc_spec_snap_vacc3_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_iadc_spec_snap_vacc3_bram_we: out std_logic; 
    r4_iadc_spec_sync_cnt_user_data_in: out std_logic_vector(31 downto 0)
  );
end r4_iadc_spec;

architecture structural of r4_iadc_spec is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "r4_iadc_spec,sysgen_core_10_1_3_1386,{total_blocks=5911,xilinx_adder_subtractor_block=196,xilinx_arithmetic_relational_operator_block=9,xilinx_binary_shift_operator_block=5,xilinx_bit_slice_extractor_block=399,xilinx_bus_concatenator_block=111,xilinx_bus_multiplexer_block=64,xilinx_constant_block_block=114,xilinx_counter_block=143,xilinx_delay_block=353,xilinx_disregard_subsystem_for_generation_block=5,xilinx_gateway_in_block=44,xilinx_gateway_out_block=29,xilinx_input_scaler_block=80,xilinx_inverter_block=37,xilinx_logical_block_block=30,xilinx_multiplier_block=92,xilinx_register_block=11,xilinx_single_port_random_access_memory_block=77,xilinx_single_port_read_only_memory_block=36,xilinx_system_generator_block=1,xilinx_type_converter_block=184,xilinx_type_reinterpreter_block=503,}";

  signal acc_cntr_op_net: std_logic_vector(31 downto 0);
  signal ce_1_sg_x392: std_logic;
  signal clk_1_sg_x392: std_logic;
  signal concat3_y_net_x0: std_logic_vector(63 downto 0);
  signal concat_y_net_x10: std_logic_vector(17 downto 0);
  signal concat_y_net_x11: std_logic_vector(17 downto 0);
  signal concat_y_net_x12: std_logic_vector(17 downto 0);
  signal concat_y_net_x13: std_logic_vector(17 downto 0);
  signal concat_y_net_x52: std_logic_vector(37 downto 0);
  signal concat_y_net_x53: std_logic_vector(37 downto 0);
  signal concat_y_net_x54: std_logic_vector(37 downto 0);
  signal concat_y_net_x55: std_logic_vector(37 downto 0);
  signal constant12_op_net_x0: std_logic;
  signal constant3_op_net_x0: std_logic;
  signal constant_op_net: std_logic_vector(7 downto 0);
  signal delay10_q_net_x0: std_logic;
  signal delay11_q_net_x0: std_logic_vector(31 downto 0);
  signal delay12_q_net_x0: std_logic;
  signal delay13_q_net_x0: std_logic_vector(31 downto 0);
  signal delay14_q_net: std_logic;
  signal delay15_q_net: std_logic_vector(37 downto 0);
  signal delay16_q_net: std_logic_vector(37 downto 0);
  signal delay17_q_net_x1: std_logic_vector(37 downto 0);
  signal delay18_q_net: std_logic_vector(37 downto 0);
  signal delay19_q_net: std_logic_vector(37 downto 0);
  signal delay1_q_net_x0: std_logic_vector(31 downto 0);
  signal delay20_q_net: std_logic_vector(31 downto 0);
  signal delay21_q_net_x0: std_logic_vector(31 downto 0);
  signal delay23_q_net_x0: std_logic_vector(31 downto 0);
  signal delay24_q_net_x2: std_logic;
  signal delay25_q_net_x0: std_logic_vector(37 downto 0);
  signal delay26_q_net_x2: std_logic;
  signal delay27_q_net_x0: std_logic_vector(37 downto 0);
  signal delay28_q_net: std_logic;
  signal delay29_q_net_x1: std_logic;
  signal delay2_q_net_x2: std_logic_vector(7 downto 0);
  signal delay31_q_net_x1: std_logic;
  signal delay34_q_net: std_logic_vector(37 downto 0);
  signal delay35_q_net_x0: std_logic_vector(31 downto 0);
  signal delay36_q_net_x0: std_logic;
  signal delay37_q_net_x0: std_logic_vector(31 downto 0);
  signal delay38_q_net_x1: std_logic_vector(37 downto 0);
  signal delay39_q_net: std_logic_vector(37 downto 0);
  signal delay3_q_net_x2: std_logic_vector(7 downto 0);
  signal delay40_q_net: std_logic_vector(37 downto 0);
  signal delay41_q_net_x2: std_logic;
  signal delay42_q_net_x0: std_logic_vector(37 downto 0);
  signal delay43_q_net_x2: std_logic;
  signal delay44_q_net_x0: std_logic_vector(37 downto 0);
  signal delay45_q_net_x1: std_logic;
  signal delay46_q_net_x1: std_logic_vector(37 downto 0);
  signal delay47_q_net_x0: std_logic;
  signal delay48_q_net: std_logic_vector(37 downto 0);
  signal delay4_q_net_x2: std_logic_vector(7 downto 0);
  signal delay5_q_net_x1: std_logic_vector(37 downto 0);
  signal delay7_q_net_x15: std_logic;
  signal delay8_q_net_x0: std_logic;
  signal delay9_q_net_x0: std_logic;
  signal delay_q_net_x2: std_logic_vector(7 downto 0);
  signal delay_q_net_x27: std_logic;
  signal logical_y_net_x2: std_logic;
  signal logical_y_net_x3: std_logic;
  signal power_adder_s_net_x0: std_logic_vector(37 downto 0);
  signal power_adder_s_net_x1: std_logic_vector(37 downto 0);
  signal power_adder_s_net_x2: std_logic_vector(37 downto 0);
  signal power_adder_s_net_x3: std_logic_vector(37 downto 0);
  signal r4_iadc_spec_acc_cnt_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_acc_len_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_adc_user_data_valid_net: std_logic;
  signal r4_iadc_spec_adc_user_datai0_net: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_datai1_net: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_datai2_net: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_datai3_net: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_dataq0_net: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_dataq1_net: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_dataq2_net: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_dataq3_net: std_logic_vector(7 downto 0);
  signal r4_iadc_spec_adc_user_outofrangei0_net: std_logic;
  signal r4_iadc_spec_adc_user_outofrangei1_net: std_logic;
  signal r4_iadc_spec_adc_user_outofrangeq0_net: std_logic;
  signal r4_iadc_spec_adc_user_outofrangeq1_net: std_logic;
  signal r4_iadc_spec_adc_user_sync0_net: std_logic;
  signal r4_iadc_spec_adc_user_sync1_net: std_logic;
  signal r4_iadc_spec_adc_user_sync2_net: std_logic;
  signal r4_iadc_spec_adc_user_sync3_net: std_logic;
  signal r4_iadc_spec_cnt_rst_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_led0_sync_gateway_net: std_logic;
  signal r4_iadc_spec_led1_new_acc_gateway_net: std_logic;
  signal r4_iadc_spec_snap_adc_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_adc_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_iadc_spec_snap_adc_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_adc_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_adc_bram_we_net: std_logic;
  signal r4_iadc_spec_snap_adc_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc0_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc0_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_iadc_spec_snap_vacc0_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc0_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc0_bram_we_net: std_logic;
  signal r4_iadc_spec_snap_vacc0_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc1_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc1_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_iadc_spec_snap_vacc1_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc1_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc1_bram_we_net: std_logic;
  signal r4_iadc_spec_snap_vacc1_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc2_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc2_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_iadc_spec_snap_vacc2_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc2_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc2_bram_we_net: std_logic;
  signal r4_iadc_spec_snap_vacc2_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc3_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc3_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_iadc_spec_snap_vacc3_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc3_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_snap_vacc3_bram_we_net: std_logic;
  signal r4_iadc_spec_snap_vacc3_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_iadc_spec_sync_cnt_user_data_in_net: std_logic_vector(31 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret5_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret6_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret7_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x6: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x7: std_logic_vector(7 downto 0);
  signal relational5_op_net_x0: std_logic;
  signal relational5_op_net_x1: std_logic;
  signal relational5_op_net_x2: std_logic;
  signal relational5_op_net_x3: std_logic;
  signal relational5_op_net_x4: std_logic;
  signal relational5_op_net_x5: std_logic;
  signal shift1_op_net_x3: std_logic_vector(17 downto 0);
  signal shift2_op_net_x4: std_logic_vector(17 downto 0);
  signal shift3_op_net_x4: std_logic_vector(17 downto 0);
  signal shift_op_net_x3: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(31 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(31 downto 0);
  signal single_port_ram_data_out_net_x3: std_logic_vector(31 downto 0);
  signal single_port_ram_data_out_net_x4: std_logic_vector(31 downto 0);
  signal slice2_y_net: std_logic;
  signal slice_y_net_x0: std_logic;
  signal sync_cntr_op_net: std_logic_vector(31 downto 0);
  signal sync_gen_op_net: std_logic_vector(26 downto 0);

begin
  ce_1_sg_x392 <= ce_1;
  clk_1_sg_x392 <= clk_1;
  r4_iadc_spec_acc_len_user_data_out_net <= r4_iadc_spec_acc_len_user_data_out;
  r4_iadc_spec_adc_user_data_valid_net <= r4_iadc_spec_adc_user_data_valid;
  r4_iadc_spec_adc_user_datai0_net <= r4_iadc_spec_adc_user_datai0;
  r4_iadc_spec_adc_user_datai1_net <= r4_iadc_spec_adc_user_datai1;
  r4_iadc_spec_adc_user_datai2_net <= r4_iadc_spec_adc_user_datai2;
  r4_iadc_spec_adc_user_datai3_net <= r4_iadc_spec_adc_user_datai3;
  r4_iadc_spec_adc_user_dataq0_net <= r4_iadc_spec_adc_user_dataq0;
  r4_iadc_spec_adc_user_dataq1_net <= r4_iadc_spec_adc_user_dataq1;
  r4_iadc_spec_adc_user_dataq2_net <= r4_iadc_spec_adc_user_dataq2;
  r4_iadc_spec_adc_user_dataq3_net <= r4_iadc_spec_adc_user_dataq3;
  r4_iadc_spec_adc_user_outofrangei0_net <= r4_iadc_spec_adc_user_outofrangei0;
  r4_iadc_spec_adc_user_outofrangei1_net <= r4_iadc_spec_adc_user_outofrangei1;
  r4_iadc_spec_adc_user_outofrangeq0_net <= r4_iadc_spec_adc_user_outofrangeq0;
  r4_iadc_spec_adc_user_outofrangeq1_net <= r4_iadc_spec_adc_user_outofrangeq1;
  r4_iadc_spec_adc_user_sync0_net <= r4_iadc_spec_adc_user_sync0;
  r4_iadc_spec_adc_user_sync1_net <= r4_iadc_spec_adc_user_sync1;
  r4_iadc_spec_adc_user_sync2_net <= r4_iadc_spec_adc_user_sync2;
  r4_iadc_spec_adc_user_sync3_net <= r4_iadc_spec_adc_user_sync3;
  r4_iadc_spec_cnt_rst_user_data_out_net <= r4_iadc_spec_cnt_rst_user_data_out;
  r4_iadc_spec_snap_adc_bram_data_out_net <= r4_iadc_spec_snap_adc_bram_data_out;
  r4_iadc_spec_snap_adc_ctrl_user_data_out_net <= r4_iadc_spec_snap_adc_ctrl_user_data_out;
  r4_iadc_spec_snap_vacc0_bram_data_out_net <= r4_iadc_spec_snap_vacc0_bram_data_out;
  r4_iadc_spec_snap_vacc0_ctrl_user_data_out_net <= r4_iadc_spec_snap_vacc0_ctrl_user_data_out;
  r4_iadc_spec_snap_vacc1_bram_data_out_net <= r4_iadc_spec_snap_vacc1_bram_data_out;
  r4_iadc_spec_snap_vacc1_ctrl_user_data_out_net <= r4_iadc_spec_snap_vacc1_ctrl_user_data_out;
  r4_iadc_spec_snap_vacc2_bram_data_out_net <= r4_iadc_spec_snap_vacc2_bram_data_out;
  r4_iadc_spec_snap_vacc2_ctrl_user_data_out_net <= r4_iadc_spec_snap_vacc2_ctrl_user_data_out;
  r4_iadc_spec_snap_vacc3_bram_data_out_net <= r4_iadc_spec_snap_vacc3_bram_data_out;
  r4_iadc_spec_snap_vacc3_ctrl_user_data_out_net <= r4_iadc_spec_snap_vacc3_ctrl_user_data_out;
  r4_iadc_spec_acc_cnt_user_data_in <= r4_iadc_spec_acc_cnt_user_data_in_net;
  r4_iadc_spec_led0_sync_gateway <= r4_iadc_spec_led0_sync_gateway_net;
  r4_iadc_spec_led1_new_acc_gateway <= r4_iadc_spec_led1_new_acc_gateway_net;
  r4_iadc_spec_snap_adc_addr_user_data_in <= r4_iadc_spec_snap_adc_addr_user_data_in_net;
  r4_iadc_spec_snap_adc_bram_addr <= r4_iadc_spec_snap_adc_bram_addr_net;
  r4_iadc_spec_snap_adc_bram_data_in <= r4_iadc_spec_snap_adc_bram_data_in_net;
  r4_iadc_spec_snap_adc_bram_we <= r4_iadc_spec_snap_adc_bram_we_net;
  r4_iadc_spec_snap_vacc0_addr_user_data_in <= r4_iadc_spec_snap_vacc0_addr_user_data_in_net;
  r4_iadc_spec_snap_vacc0_bram_addr <= r4_iadc_spec_snap_vacc0_bram_addr_net;
  r4_iadc_spec_snap_vacc0_bram_data_in <= r4_iadc_spec_snap_vacc0_bram_data_in_net;
  r4_iadc_spec_snap_vacc0_bram_we <= r4_iadc_spec_snap_vacc0_bram_we_net;
  r4_iadc_spec_snap_vacc1_addr_user_data_in <= r4_iadc_spec_snap_vacc1_addr_user_data_in_net;
  r4_iadc_spec_snap_vacc1_bram_addr <= r4_iadc_spec_snap_vacc1_bram_addr_net;
  r4_iadc_spec_snap_vacc1_bram_data_in <= r4_iadc_spec_snap_vacc1_bram_data_in_net;
  r4_iadc_spec_snap_vacc1_bram_we <= r4_iadc_spec_snap_vacc1_bram_we_net;
  r4_iadc_spec_snap_vacc2_addr_user_data_in <= r4_iadc_spec_snap_vacc2_addr_user_data_in_net;
  r4_iadc_spec_snap_vacc2_bram_addr <= r4_iadc_spec_snap_vacc2_bram_addr_net;
  r4_iadc_spec_snap_vacc2_bram_data_in <= r4_iadc_spec_snap_vacc2_bram_data_in_net;
  r4_iadc_spec_snap_vacc2_bram_we <= r4_iadc_spec_snap_vacc2_bram_we_net;
  r4_iadc_spec_snap_vacc3_addr_user_data_in <= r4_iadc_spec_snap_vacc3_addr_user_data_in_net;
  r4_iadc_spec_snap_vacc3_bram_addr <= r4_iadc_spec_snap_vacc3_bram_addr_net;
  r4_iadc_spec_snap_vacc3_bram_data_in <= r4_iadc_spec_snap_vacc3_bram_data_in_net;
  r4_iadc_spec_snap_vacc3_bram_we <= r4_iadc_spec_snap_vacc3_bram_we_net;
  r4_iadc_spec_sync_cnt_user_data_in <= r4_iadc_spec_sync_cnt_user_data_in_net;

  acc_cnt_d7b3ec02c1: entity work.acc_cnt_entity_d7b3ec02c1
    port map (
      reg_out => delay1_q_net_x0,
      convert_x0 => r4_iadc_spec_acc_cnt_user_data_in_net
    );

  acc_cntr: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_487c95d8131ef26d",
      op_arith => xlUnsigned,
      op_width => 32
    )
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      en(0) => delay28_q_net,
      rst(0) => slice2_y_net,
      op => acc_cntr_op_net
    );

  acc_cntrl_48890c2acd: entity work.acc_cntrl_entity_48890c2acd
    port map (
      acc_len => delay23_q_net_x0,
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      sync => delay10_q_net_x0,
      new_acc => logical_y_net_x2
    );

  adc_2c38a82c66: entity work.adc_entity_2c38a82c66
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      r4_iadc_spec_adc_user_datai0 => r4_iadc_spec_adc_user_datai0_net,
      r4_iadc_spec_adc_user_datai1 => r4_iadc_spec_adc_user_datai1_net,
      r4_iadc_spec_adc_user_datai2 => r4_iadc_spec_adc_user_datai2_net,
      r4_iadc_spec_adc_user_datai3 => r4_iadc_spec_adc_user_datai3_net,
      i0 => reinterpret_output_port_net_x4,
      i1 => reinterpret_output_port_net_x5,
      i2 => reinterpret_output_port_net_x6,
      i3 => reinterpret_output_port_net_x7
    );

  concat3: entity work.concat_15d98836ad
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret_output_port_net,
      in1 => reinterpret1_output_port_net,
      in2 => reinterpret2_output_port_net,
      in3 => reinterpret3_output_port_net,
      in4 => reinterpret4_output_port_net,
      in5 => reinterpret5_output_port_net,
      in6 => reinterpret6_output_port_net,
      in7 => reinterpret7_output_port_net,
      y => concat3_y_net_x0
    );

  constant12: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant12_op_net_x0
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net_x0
    );

  constant_x0: entity work.constant_91ef1678ca
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  delay: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => reinterpret_output_port_net_x4,
      q => delay_q_net_x2
    );

  delay1: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => acc_cntr_op_net,
      q => delay1_q_net_x0
    );

  delay10: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => delay14_q_net,
      q(0) => delay10_q_net_x0
    );

  delay11: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => single_port_ram_data_out_net_x1,
      q => delay11_q_net_x0
    );

  delay12: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => relational5_op_net_x2,
      q(0) => delay12_q_net_x0
    );

  delay13: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => single_port_ram_data_out_net_x2,
      q => delay13_q_net_x0
    );

  delay14: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => logical_y_net_x3,
      q(0) => delay14_q_net
    );

  delay15: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => concat_y_net_x52,
      q => delay15_q_net
    );

  delay16: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => concat_y_net_x53,
      q => delay16_q_net
    );

  delay17: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => delay16_q_net,
      q => delay17_q_net_x1
    );

  delay18: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => power_adder_s_net_x0,
      q => delay18_q_net
    );

  delay19: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => power_adder_s_net_x1,
      q => delay19_q_net
    );

  delay2: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => reinterpret_output_port_net_x5,
      q => delay2_q_net_x2
    );

  delay20: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => r4_iadc_spec_cnt_rst_user_data_out_net,
      q => delay20_q_net
    );

  delay21: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => sync_cntr_op_net,
      q => delay21_q_net_x0
    );

  delay23: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => r4_iadc_spec_acc_len_user_data_out_net,
      q => delay23_q_net_x0
    );

  delay24: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay24_q_net_x2
    );

  delay25: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => delay18_q_net,
      q => delay25_q_net_x0
    );

  delay26: entity work.delay_23d71a76f2
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay26_q_net_x2
    );

  delay27: entity work.delay_29899636e8
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => delay19_q_net,
      q => delay27_q_net_x0
    );

  delay28: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay28_q_net
    );

  delay29: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay29_q_net_x1
    );

  delay3: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => reinterpret_output_port_net_x6,
      q => delay3_q_net_x2
    );

  delay31: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay31_q_net_x1
    );

  delay34: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => concat_y_net_x54,
      q => delay34_q_net
    );

  delay35: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => single_port_ram_data_out_net_x3,
      q => delay35_q_net_x0
    );

  delay36: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => relational5_op_net_x4,
      q(0) => delay36_q_net_x0
    );

  delay37: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => single_port_ram_data_out_net_x4,
      q => delay37_q_net_x0
    );

  delay38: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => delay48_q_net,
      q => delay38_q_net_x1
    );

  delay39: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => power_adder_s_net_x2,
      q => delay39_q_net
    );

  delay4: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => reinterpret_output_port_net_x7,
      q => delay4_q_net_x2
    );

  delay40: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => power_adder_s_net_x3,
      q => delay40_q_net
    );

  delay41: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay41_q_net_x2
    );

  delay42: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => delay39_q_net,
      q => delay42_q_net_x0
    );

  delay43: entity work.delay_23d71a76f2
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay43_q_net_x2
    );

  delay44: entity work.delay_29899636e8
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => delay40_q_net,
      q => delay44_q_net_x0
    );

  delay45: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay45_q_net_x1
    );

  delay46: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => delay34_q_net,
      q => delay46_q_net_x1
    );

  delay47: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => relational5_op_net_x5,
      q(0) => delay47_q_net_x0
    );

  delay48: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => concat_y_net_x55,
      q => delay48_q_net
    );

  delay5: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d => delay15_q_net,
      q => delay5_q_net_x1
    );

  delay7: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => logical_y_net_x3,
      q(0) => delay7_q_net_x15
    );

  delay8: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => relational5_op_net_x3,
      q(0) => delay8_q_net_x0
    );

  delay9: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      d(0) => relational5_op_net_x0,
      q(0) => delay9_q_net_x0
    );

  fir1_f9d6e39c7e: entity work.fir1_entity_f9d6e39c7e
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      in_x0 => delay_q_net_x2,
      sync_in => delay7_q_net_x15,
      out_x0 => concat_y_net_x10
    );

  fir2_68bc0c67f0: entity work.fir2_entity_68bc0c67f0
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      in_x0 => delay2_q_net_x2,
      sync_in => delay7_q_net_x15,
      out_x0 => concat_y_net_x11
    );

  fir3_1efe26be5a: entity work.fir1_entity_f9d6e39c7e
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      in_x0 => delay3_q_net_x2,
      sync_in => delay7_q_net_x15,
      out_x0 => concat_y_net_x12
    );

  fir4_1752d52923: entity work.fir4_entity_1752d52923
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      in_x0 => delay4_q_net_x2,
      sync_in => delay7_q_net_x15,
      out_x0 => concat_y_net_x13,
      sync_out => delay_q_net_x27
    );

  led0_sync_6d0c058729: entity work.led0_sync_entity_6d0c058729
    port map (
      gpio_out => relational5_op_net_x1,
      convert_x0 => r4_iadc_spec_led0_sync_gateway_net
    );

  led1_new_acc_e6fff93f6e: entity work.led0_sync_entity_6d0c058729
    port map (
      gpio_out => delay9_q_net_x0,
      convert_x0 => r4_iadc_spec_led1_new_acc_gateway_net
    );

  posedge_9d093d10ae: entity work.posedge1_entity_540938390c
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      in_x0 => slice_y_net_x0,
      out_x0 => logical_y_net_x3
    );

  pulse_ext1_4194692a29: entity work.pulse_ext1_entity_4194692a29
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      in_x0 => logical_y_net_x3,
      out_x0 => relational5_op_net_x1
    );

  pulse_ext2_dbeea50338: entity work.pulse_ext1_entity_4194692a29
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      in_x0 => delay31_q_net_x1,
      out_x0 => relational5_op_net_x0
    );

  r4_dit_fft_19e496a927: entity work.r4_dit_fft_entity_19e496a927
    port map (
      a_in => shift_op_net_x3,
      b_in => shift1_op_net_x3,
      c_in => shift2_op_net_x4,
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      d_in => shift3_op_net_x4,
      sync_in => delay_q_net_x27,
      a_out => concat_y_net_x52,
      b_out => concat_y_net_x53,
      c_out => concat_y_net_x54,
      d_out => concat_y_net_x55
    );

  r4_power19_1_5cf7d1b86f: entity work.r4_power19_1_entity_5cf7d1b86f
    port map (
      c => delay5_q_net_x1,
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      power => power_adder_s_net_x0
    );

  r4_power19_2_927c493a6b: entity work.r4_power19_1_entity_5cf7d1b86f
    port map (
      c => delay17_q_net_x1,
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      power => power_adder_s_net_x1
    );

  r4_power19_3_19a096b689: entity work.r4_power19_1_entity_5cf7d1b86f
    port map (
      c => delay46_q_net_x1,
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      power => power_adder_s_net_x2
    );

  r4_power19_4_33543e6919: entity work.r4_power19_1_entity_5cf7d1b86f
    port map (
      c => delay38_q_net_x1,
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      power => power_adder_s_net_x3
    );

  reinterpret: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay_q_net_x2,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay2_q_net_x2,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay3_q_net_x2,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay4_q_net_x2,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_f21e7f2ddf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => constant_op_net,
      output_port => reinterpret4_output_port_net
    );

  reinterpret5: entity work.reinterpret_f21e7f2ddf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => constant_op_net,
      output_port => reinterpret5_output_port_net
    );

  reinterpret6: entity work.reinterpret_f21e7f2ddf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => constant_op_net,
      output_port => reinterpret6_output_port_net
    );

  reinterpret7: entity work.reinterpret_f21e7f2ddf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => constant_op_net,
      output_port => reinterpret7_output_port_net
    );

  shift: entity work.shift_407d711ee5
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      ip => concat_y_net_x10,
      op => shift_op_net_x3
    );

  shift1: entity work.shift_407d711ee5
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      ip => concat_y_net_x11,
      op => shift1_op_net_x3
    );

  shift2: entity work.shift_407d711ee5
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      ip => concat_y_net_x12,
      op => shift2_op_net_x4
    );

  shift3: entity work.shift_407d711ee5
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      ip => concat_y_net_x13,
      op => shift3_op_net_x4
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 25,
      new_msb => 25,
      x_width => 27,
      y_width => 1
    )
    port map (
      x => sync_gen_op_net,
      y(0) => slice_y_net_x0
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => delay20_q_net,
      y(0) => slice2_y_net
    );

  snap_adc_8e9347af79: entity work.snap_adc_entity_8e9347af79
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      din => concat3_y_net_x0,
      r4_iadc_spec_snap_adc_ctrl_user_data_out => r4_iadc_spec_snap_adc_ctrl_user_data_out_net,
      trig => constant3_op_net_x0,
      we => constant12_op_net_x0,
      addr => r4_iadc_spec_snap_adc_addr_user_data_in_net,
      bram => r4_iadc_spec_snap_adc_bram_addr_net,
      bram_x0 => r4_iadc_spec_snap_adc_bram_data_in_net,
      bram_x1 => r4_iadc_spec_snap_adc_bram_we_net
    );

  snap_vacc0_b90e9dba61: entity work.snap_vacc0_entity_b90e9dba61
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      din => delay11_q_net_x0,
      r4_iadc_spec_snap_vacc0_ctrl_user_data_out => r4_iadc_spec_snap_vacc0_ctrl_user_data_out_net,
      trig => delay29_q_net_x1,
      we => delay12_q_net_x0,
      addr => r4_iadc_spec_snap_vacc0_addr_user_data_in_net,
      bram => r4_iadc_spec_snap_vacc0_bram_addr_net,
      bram_x0 => r4_iadc_spec_snap_vacc0_bram_data_in_net,
      bram_x1 => r4_iadc_spec_snap_vacc0_bram_we_net
    );

  snap_vacc1_45c53a911d: entity work.snap_vacc1_entity_45c53a911d
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      din => delay13_q_net_x0,
      r4_iadc_spec_snap_vacc1_ctrl_user_data_out => r4_iadc_spec_snap_vacc1_ctrl_user_data_out_net,
      trig => delay29_q_net_x1,
      we => delay8_q_net_x0,
      addr => r4_iadc_spec_snap_vacc1_addr_user_data_in_net,
      bram => r4_iadc_spec_snap_vacc1_bram_addr_net,
      bram_x0 => r4_iadc_spec_snap_vacc1_bram_data_in_net,
      bram_x1 => r4_iadc_spec_snap_vacc1_bram_we_net
    );

  snap_vacc2_a7001db681: entity work.snap_vacc2_entity_a7001db681
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      din => delay35_q_net_x0,
      r4_iadc_spec_snap_vacc2_ctrl_user_data_out => r4_iadc_spec_snap_vacc2_ctrl_user_data_out_net,
      trig => delay45_q_net_x1,
      we => delay36_q_net_x0,
      addr => r4_iadc_spec_snap_vacc2_addr_user_data_in_net,
      bram => r4_iadc_spec_snap_vacc2_bram_addr_net,
      bram_x0 => r4_iadc_spec_snap_vacc2_bram_data_in_net,
      bram_x1 => r4_iadc_spec_snap_vacc2_bram_we_net
    );

  snap_vacc3_cb224f6dd6: entity work.snap_vacc3_entity_cb224f6dd6
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      din => delay37_q_net_x0,
      r4_iadc_spec_snap_vacc3_ctrl_user_data_out => r4_iadc_spec_snap_vacc3_ctrl_user_data_out_net,
      trig => delay45_q_net_x1,
      we => delay47_q_net_x0,
      addr => r4_iadc_spec_snap_vacc3_addr_user_data_in_net,
      bram => r4_iadc_spec_snap_vacc3_bram_addr_net,
      bram_x0 => r4_iadc_spec_snap_vacc3_bram_data_in_net,
      bram_x1 => r4_iadc_spec_snap_vacc3_bram_we_net
    );

  sync_cnt_60c7d45e27: entity work.acc_cnt_entity_d7b3ec02c1
    port map (
      reg_out => delay21_q_net_x0,
      convert_x0 => r4_iadc_spec_sync_cnt_user_data_in_net
    );

  sync_cntr: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_487c95d8131ef26d",
      op_arith => xlUnsigned,
      op_width => 32
    )
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      en(0) => logical_y_net_x3,
      rst(0) => slice2_y_net,
      op => sync_cntr_op_net
    );

  sync_gen: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_f8c7b661c01eeb1d",
      op_arith => xlUnsigned,
      op_width => 27
    )
    port map (
      ce => ce_1_sg_x392,
      clk => clk_1_sg_x392,
      clr => '0',
      en => "1",
      rst => "0",
      op => sync_gen_op_net
    );

  vacc0_c50ee0843b: entity work.vacc0_entity_c50ee0843b
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      din => delay25_q_net_x0,
      new_acc => delay24_q_net_x2,
      dout => single_port_ram_data_out_net_x1,
      valid => relational5_op_net_x2
    );

  vacc1_3dbe9afff0: entity work.vacc0_entity_c50ee0843b
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      din => delay27_q_net_x0,
      new_acc => delay26_q_net_x2,
      dout => single_port_ram_data_out_net_x2,
      valid => relational5_op_net_x3
    );

  vacc2_aba41c46f0: entity work.vacc0_entity_c50ee0843b
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      din => delay42_q_net_x0,
      new_acc => delay41_q_net_x2,
      dout => single_port_ram_data_out_net_x3,
      valid => relational5_op_net_x4
    );

  vacc3_fd01a2d6dc: entity work.vacc0_entity_c50ee0843b
    port map (
      ce_1 => ce_1_sg_x392,
      clk_1 => clk_1_sg_x392,
      din => delay44_q_net_x0,
      new_acc => delay43_q_net_x2,
      dout => single_port_ram_data_out_net_x4,
      valid => relational5_op_net_x5
    );

end structural;
