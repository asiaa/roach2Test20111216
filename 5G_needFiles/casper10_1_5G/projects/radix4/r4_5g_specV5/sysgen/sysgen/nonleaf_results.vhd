library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/acc_cnt"

entity acc_cnt_entity_b52af162d4 is
  port (
    reg_out: in std_logic_vector(31 downto 0); 
    convert_x0: out std_logic_vector(31 downto 0)
  );
end acc_cnt_entity_b52af162d4;

architecture structural of acc_cnt_entity_b52af162d4 is
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

-- Generated from Simulink block "r4_5g_specV5/acc_cntrl/posedge1"

entity posedge1_entity_d70b7fecd6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end posedge1_entity_d70b7fecd6;

architecture structural of posedge1_entity_d70b7fecd6 is
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

-- Generated from Simulink block "r4_5g_specV5/acc_cntrl"

entity acc_cntrl_entity_1d98c79a3b is
  port (
    acc_len: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    new_acc: out std_logic
  );
end acc_cntrl_entity_1d98c79a3b;

architecture structural of acc_cntrl_entity_1d98c79a3b is
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

  posedge1_d70b7fecd6: entity work.posedge1_entity_d70b7fecd6
    port map (
      ce_1 => ce_1_sg_x2,
      clk_1 => clk_1_sg_x2,
      in_x0 => register_q_net_x0,
      out_x0 => logical_y_net_x0
    );

  posedge2_bcbe32b157: entity work.posedge1_entity_d70b7fecd6
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

-- Generated from Simulink block "r4_5g_specV5/adc_5g/conv"

entity conv_entity_47444a6b7b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(7 downto 0); 
    out1: out std_logic_vector(7 downto 0)
  );
end conv_entity_47444a6b7b;

architecture structural of conv_entity_47444a6b7b is
  signal ce_1_sg_x3: std_logic;
  signal clk_1_sg_x3: std_logic;
  signal concat_y_net: std_logic_vector(7 downto 0);
  signal inverter_op_net: std_logic;
  signal r4_5g_specv5_adc_5g_user_datai0_net_x0: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(7 downto 0);
  signal slice1_y_net: std_logic_vector(6 downto 0);
  signal slice_y_net: std_logic;

begin
  ce_1_sg_x3 <= ce_1;
  clk_1_sg_x3 <= clk_1;
  r4_5g_specv5_adc_5g_user_datai0_net_x0 <= in1;
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
      x => r4_5g_specv5_adc_5g_user_datai0_net_x0,
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
      x => r4_5g_specv5_adc_5g_user_datai0_net_x0,
      y => slice1_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/adc_5g"

entity adc_5g_entity_8d8c5a29fa is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    r4_5g_specv5_adc_5g_user_datai0: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_datai1: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_datai2: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_datai3: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_dataq0: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_dataq1: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_dataq2: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_dataq3: in std_logic_vector(7 downto 0); 
    i0: out std_logic_vector(7 downto 0); 
    i1: out std_logic_vector(7 downto 0); 
    i2: out std_logic_vector(7 downto 0); 
    i3: out std_logic_vector(7 downto 0); 
    q0: out std_logic_vector(7 downto 0); 
    q1: out std_logic_vector(7 downto 0); 
    q2: out std_logic_vector(7 downto 0); 
    q3: out std_logic_vector(7 downto 0)
  );
end adc_5g_entity_8d8c5a29fa;

architecture structural of adc_5g_entity_8d8c5a29fa is
  signal ce_1_sg_x11: std_logic;
  signal clk_1_sg_x11: std_logic;
  signal r4_5g_specv5_adc_5g_user_datai0_net_x1: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_datai1_net_x1: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_datai2_net_x1: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_datai3_net_x1: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_dataq0_net_x1: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_dataq1_net_x1: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_dataq2_net_x1: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_dataq3_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x10: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x11: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x12: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x13: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x14: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x15: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x8: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x9: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x11 <= ce_1;
  clk_1_sg_x11 <= clk_1;
  r4_5g_specv5_adc_5g_user_datai0_net_x1 <= r4_5g_specv5_adc_5g_user_datai0;
  r4_5g_specv5_adc_5g_user_datai1_net_x1 <= r4_5g_specv5_adc_5g_user_datai1;
  r4_5g_specv5_adc_5g_user_datai2_net_x1 <= r4_5g_specv5_adc_5g_user_datai2;
  r4_5g_specv5_adc_5g_user_datai3_net_x1 <= r4_5g_specv5_adc_5g_user_datai3;
  r4_5g_specv5_adc_5g_user_dataq0_net_x1 <= r4_5g_specv5_adc_5g_user_dataq0;
  r4_5g_specv5_adc_5g_user_dataq1_net_x1 <= r4_5g_specv5_adc_5g_user_dataq1;
  r4_5g_specv5_adc_5g_user_dataq2_net_x1 <= r4_5g_specv5_adc_5g_user_dataq2;
  r4_5g_specv5_adc_5g_user_dataq3_net_x1 <= r4_5g_specv5_adc_5g_user_dataq3;
  i0 <= reinterpret_output_port_net_x8;
  i1 <= reinterpret_output_port_net_x9;
  i2 <= reinterpret_output_port_net_x10;
  i3 <= reinterpret_output_port_net_x11;
  q0 <= reinterpret_output_port_net_x12;
  q1 <= reinterpret_output_port_net_x13;
  q2 <= reinterpret_output_port_net_x14;
  q3 <= reinterpret_output_port_net_x15;

  conv1_a0b710ef7f: entity work.conv_entity_47444a6b7b
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specv5_adc_5g_user_datai1_net_x1,
      out1 => reinterpret_output_port_net_x9
    );

  conv2_9f25c0945b: entity work.conv_entity_47444a6b7b
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specv5_adc_5g_user_datai2_net_x1,
      out1 => reinterpret_output_port_net_x10
    );

  conv3_7c23520bfd: entity work.conv_entity_47444a6b7b
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specv5_adc_5g_user_datai3_net_x1,
      out1 => reinterpret_output_port_net_x11
    );

  conv4_3b9b597490: entity work.conv_entity_47444a6b7b
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specv5_adc_5g_user_dataq0_net_x1,
      out1 => reinterpret_output_port_net_x12
    );

  conv5_1cd260b861: entity work.conv_entity_47444a6b7b
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specv5_adc_5g_user_dataq1_net_x1,
      out1 => reinterpret_output_port_net_x13
    );

  conv6_5eaab60e08: entity work.conv_entity_47444a6b7b
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specv5_adc_5g_user_dataq2_net_x1,
      out1 => reinterpret_output_port_net_x14
    );

  conv7_11cbdf83aa: entity work.conv_entity_47444a6b7b
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specv5_adc_5g_user_dataq3_net_x1,
      out1 => reinterpret_output_port_net_x15
    );

  conv_47444a6b7b: entity work.conv_entity_47444a6b7b
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specv5_adc_5g_user_datai0_net_x1,
      out1 => reinterpret_output_port_net_x8
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_quantize/c_to_ri"

entity c_to_ri_entity_fe9d761bb1 is
  port (
    c: in std_logic_vector(33 downto 0); 
    im: out std_logic_vector(16 downto 0); 
    re: out std_logic_vector(16 downto 0)
  );
end c_to_ri_entity_fe9d761bb1;

architecture structural of c_to_ri_entity_fe9d761bb1 is
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

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_quantize/ri_to_c"

entity ri_to_c_entity_e0bf40ff62 is
  port (
    im: in std_logic_vector(8 downto 0); 
    re: in std_logic_vector(8 downto 0); 
    c: out std_logic_vector(17 downto 0)
  );
end ri_to_c_entity_e0bf40ff62;

architecture structural of ri_to_c_entity_e0bf40ff62 is
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

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_quantize"

entity fir_quantize_entity_159d90c3b8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sum_in: in std_logic_vector(33 downto 0); 
    sum_out: out std_logic_vector(17 downto 0)
  );
end fir_quantize_entity_159d90c3b8;

architecture structural of fir_quantize_entity_159d90c3b8 is
  signal ce_1_sg_x12: std_logic;
  signal clk_1_sg_x12: std_logic;
  signal concat_y_net_x2: std_logic_vector(33 downto 0);
  signal concat_y_net_x3: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(16 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(16 downto 0);
  signal quantize_im_dout_net_x0: std_logic_vector(8 downto 0);
  signal quantize_re_dout_net_x0: std_logic_vector(8 downto 0);

begin
  ce_1_sg_x12 <= ce_1;
  clk_1_sg_x12 <= clk_1;
  concat_y_net_x2 <= sum_in;
  sum_out <= concat_y_net_x3;

  c_to_ri_fe9d761bb1: entity work.c_to_ri_entity_fe9d761bb1
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
      ce => ce_1_sg_x12,
      clk => clk_1_sg_x12,
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
      ce => ce_1_sg_x12,
      clk => clk_1_sg_x12,
      clr => '0',
      din => force_re_output_port_net_x0,
      dout => quantize_re_dout_net_x0
    );

  ri_to_c_e0bf40ff62: entity work.ri_to_c_entity_e0bf40ff62
    port map (
      im => quantize_im_dout_net_x0,
      re => quantize_re_dout_net_x0,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_1/fir_coef/c_gen"

entity c_gen_entity_a4fea711a5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_a4fea711a5;

architecture structural of c_gen_entity_a4fea711a5 is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x13: std_logic;
  signal clk_1_sg_x13: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay7_q_net_x0: std_logic;
  signal mem_data_net_x0: std_logic_vector(8 downto 0);

begin
  ce_1_sg_x13 <= ce_1;
  clk_1_sg_x13 <= clk_1;
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
      ce => ce_1_sg_x13,
      clk => clk_1_sg_x13,
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
      ce => ce_1_sg_x13,
      clk => clk_1_sg_x13,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_1/fir_coef"

entity fir_coef_entity_8b710ddd57 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_8b710ddd57;

architecture structural of fir_coef_entity_8b710ddd57 is
  signal ce_1_sg_x14: std_logic;
  signal clk_1_sg_x14: std_logic;
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal delay7_q_net_x1: std_logic;
  signal delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x0: std_logic;

begin
  ce_1_sg_x14 <= ce_1;
  clk_1_sg_x14 <= clk_1;
  delay_q_net_x0 <= data_in;
  delay7_q_net_x1 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_a4fea711a5: entity work.c_gen_entity_a4fea711a5
    port map (
      ce_1 => ce_1_sg_x14,
      clk_1 => clk_1_sg_x14,
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
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
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
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      d(0) => delay7_q_net_x1,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_1/fir_core/c_to_ri_d"

entity c_to_ri_d_entity_f9c71271a8 is
  port (
    c: in std_logic_vector(7 downto 0); 
    im: out std_logic_vector(7 downto 0); 
    re: out std_logic_vector(7 downto 0)
  );
end c_to_ri_d_entity_f9c71271a8;

architecture structural of c_to_ri_d_entity_f9c71271a8 is
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

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_1/fir_core/mult_add_im"

entity mult_add_im_entity_27fd95e9cc is
  port (
    a: in std_logic_vector(7 downto 0); 
    b: in std_logic_vector(8 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    out_x0: out std_logic_vector(16 downto 0)
  );
end mult_add_im_entity_27fd95e9cc;

architecture structural of mult_add_im_entity_27fd95e9cc is
  signal ce_1_sg_x15: std_logic;
  signal clk_1_sg_x15: std_logic;
  signal force_im_output_port_net_x1: std_logic_vector(7 downto 0);
  signal mem_data_net_x2: std_logic_vector(8 downto 0);
  signal mult_p_net_x0: std_logic_vector(16 downto 0);

begin
  force_im_output_port_net_x1 <= a;
  mem_data_net_x2 <= b;
  ce_1_sg_x15 <= ce_1;
  clk_1_sg_x15 <= clk_1;
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
      ce => ce_1_sg_x15,
      clk => clk_1_sg_x15,
      clr => '0',
      core_ce => ce_1_sg_x15,
      core_clk => clk_1_sg_x15,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_1/fir_core/ri_to_c"

entity ri_to_c_entity_007b667efe is
  port (
    im: in std_logic_vector(16 downto 0); 
    re: in std_logic_vector(16 downto 0); 
    c: out std_logic_vector(33 downto 0)
  );
end ri_to_c_entity_007b667efe;

architecture structural of ri_to_c_entity_007b667efe is
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

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_1/fir_core/tap_delay"

entity tap_delay_entity_8b0b4ca2e5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(7 downto 0); 
    out_x0: out std_logic_vector(7 downto 0)
  );
end tap_delay_entity_8b0b4ca2e5;

architecture structural of tap_delay_entity_8b0b4ca2e5 is
  signal bram_data_out_net_x0: std_logic_vector(7 downto 0);
  signal ce_1_sg_x17: std_logic;
  signal clk_1_sg_x17: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal dout_delay_q_net_x0: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x17 <= ce_1;
  clk_1_sg_x17 <= clk_1;
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
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
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
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_1/fir_core"

entity fir_core_entity_9dfb5ea5d5 is
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
end fir_core_entity_9dfb5ea5d5;

architecture structural of fir_core_entity_9dfb5ea5d5 is
  signal bram_data_out_net_x1: std_logic_vector(7 downto 0);
  signal ce_1_sg_x18: std_logic;
  signal clk_1_sg_x18: std_logic;
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
  ce_1_sg_x18 <= ce_1;
  clk_1_sg_x18 <= clk_1;
  mem_data_net_x4 <= coef;
  data_delay_q_net_x2 <= data_in;
  sync_delay_q_net_x1 <= sync_in;
  data_out <= bram_data_out_net_x1;
  sum_out <= concat_y_net_x1;
  sync_out <= sync_delay_q_net_x2;

  c_to_ri_d_f9c71271a8: entity work.c_to_ri_d_entity_f9c71271a8
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
      ce => ce_1_sg_x18,
      clk => clk_1_sg_x18,
      d => data_delay_q_net_x2,
      en => '1',
      q => dout_delay_q_net_x0
    );

  mult_add_im_27fd95e9cc: entity work.mult_add_im_entity_27fd95e9cc
    port map (
      a => force_im_output_port_net_x1,
      b => mem_data_net_x4,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      out_x0 => mult_p_net_x0
    );

  mult_add_re_1a49ae095c: entity work.mult_add_im_entity_27fd95e9cc
    port map (
      a => force_re_output_port_net_x1,
      b => mem_data_net_x4,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      out_x0 => mult_p_net_x1
    );

  ri_to_c_007b667efe: entity work.ri_to_c_entity_007b667efe
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
      ce => ce_1_sg_x18,
      clk => clk_1_sg_x18,
      d(0) => sync_delay_q_net_x1,
      en => '1',
      q(0) => sync_delay_q_net_x2
    );

  tap_delay_8b0b4ca2e5: entity work.tap_delay_entity_8b0b4ca2e5
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      in_x0 => dout_delay_q_net_x0,
      out_x0 => bram_data_out_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_1"

entity fir_tap_1_entity_b409832013 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(7 downto 0); 
    sum_out: out std_logic_vector(33 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_1_entity_b409832013;

architecture structural of fir_tap_1_entity_b409832013 is
  signal bram_data_out_net_x2: std_logic_vector(7 downto 0);
  signal ce_1_sg_x19: std_logic;
  signal clk_1_sg_x19: std_logic;
  signal concat_y_net_x2: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal delay7_q_net_x2: std_logic;
  signal delay_q_net_x1: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  ce_1_sg_x19 <= ce_1;
  clk_1_sg_x19 <= clk_1;
  delay_q_net_x1 <= data_in;
  delay7_q_net_x2 <= sync_in;
  data_out <= bram_data_out_net_x2;
  sum_out <= concat_y_net_x2;
  sync_out <= sync_delay_q_net_x3;

  fir_coef_8b710ddd57: entity work.fir_coef_entity_8b710ddd57
    port map (
      ce_1 => ce_1_sg_x19,
      clk_1 => clk_1_sg_x19,
      data_in => delay_q_net_x1,
      sync_in => delay7_q_net_x2,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_9dfb5ea5d5: entity work.fir_core_entity_9dfb5ea5d5
    port map (
      ce_1 => ce_1_sg_x19,
      clk_1 => clk_1_sg_x19,
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

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_2/fir_coef/c_gen"

entity c_gen_entity_148c3edefd is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_148c3edefd;

architecture structural of c_gen_entity_148c3edefd is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x20: std_logic;
  signal clk_1_sg_x20: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mem_data_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x4: std_logic;

begin
  ce_1_sg_x20 <= ce_1;
  clk_1_sg_x20 <= clk_1;
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
      ce => ce_1_sg_x20,
      clk => clk_1_sg_x20,
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
      ce => ce_1_sg_x20,
      clk => clk_1_sg_x20,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_2/fir_coef"

entity fir_coef_entity_8033da333b is
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
end fir_coef_entity_8033da333b;

architecture structural of fir_coef_entity_8033da333b is
  signal bram_data_out_net_x3: std_logic_vector(7 downto 0);
  signal ce_1_sg_x21: std_logic;
  signal clk_1_sg_x21: std_logic;
  signal concat_y_net_x3: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x5: std_logic;

begin
  ce_1_sg_x21 <= ce_1;
  clk_1_sg_x21 <= clk_1;
  bram_data_out_net_x3 <= data_in;
  concat_y_net_x3 <= sum_in;
  sync_delay_q_net_x5 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_148c3edefd: entity work.c_gen_entity_148c3edefd
    port map (
      ce_1 => ce_1_sg_x21,
      clk_1 => clk_1_sg_x21,
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
      ce => ce_1_sg_x21,
      clk => clk_1_sg_x21,
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
      ce => ce_1_sg_x21,
      clk => clk_1_sg_x21,
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
      ce => ce_1_sg_x21,
      clk => clk_1_sg_x21,
      d(0) => sync_delay_q_net_x5,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_2/fir_core/mult_add_im"

entity mult_add_im_entity_5625f0db12 is
  port (
    a: in std_logic_vector(7 downto 0); 
    b: in std_logic_vector(8 downto 0); 
    c: in std_logic_vector(16 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    out_x0: out std_logic_vector(17 downto 0)
  );
end mult_add_im_entity_5625f0db12;

architecture structural of mult_add_im_entity_5625f0db12 is
  signal add_s_net_x0: std_logic_vector(17 downto 0);
  signal ce_1_sg_x22: std_logic;
  signal clk_1_sg_x22: std_logic;
  signal delay_q_net: std_logic_vector(16 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(16 downto 0);
  signal mem_data_net_x2: std_logic_vector(8 downto 0);
  signal mult_p_net: std_logic_vector(16 downto 0);

begin
  force_im_output_port_net_x2 <= a;
  mem_data_net_x2 <= b;
  force_im_output_port_net_x3 <= c;
  ce_1_sg_x22 <= ce_1;
  clk_1_sg_x22 <= clk_1;
  out_x0 <= add_s_net_x0;

  add: entity work.addsub_bfd97cd167
    port map (
      a => mult_p_net,
      b => delay_q_net,
      ce => ce_1_sg_x22,
      clk => clk_1_sg_x22,
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
      ce => ce_1_sg_x22,
      clk => clk_1_sg_x22,
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
      ce => ce_1_sg_x22,
      clk => clk_1_sg_x22,
      clr => '0',
      core_ce => ce_1_sg_x22,
      core_clk => clk_1_sg_x22,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_2/fir_core"

entity fir_core_entity_3b628b72bc is
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
end fir_core_entity_3b628b72bc;

architecture structural of fir_core_entity_3b628b72bc is
  signal add_s_net_x0: std_logic_vector(17 downto 0);
  signal add_s_net_x1: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x1: std_logic_vector(7 downto 0);
  signal ce_1_sg_x25: std_logic;
  signal clk_1_sg_x25: std_logic;
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
  ce_1_sg_x25 <= ce_1;
  clk_1_sg_x25 <= clk_1;
  mem_data_net_x4 <= coef;
  data_delay_q_net_x2 <= data_in;
  sum_delay_q_net_x2 <= sum_in;
  sync_delay_q_net_x1 <= sync_in;
  data_out <= bram_data_out_net_x1;
  sum_out <= concat_y_net_x1;
  sync_out <= sync_delay_q_net_x2;

  c_to_ri_d_53a93a8a6e: entity work.c_to_ri_d_entity_f9c71271a8
    port map (
      c => data_delay_q_net_x2,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  c_to_ri_s_0b69c9b0e2: entity work.c_to_ri_entity_fe9d761bb1
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
      ce => ce_1_sg_x25,
      clk => clk_1_sg_x25,
      d => data_delay_q_net_x2,
      en => '1',
      q => dout_delay_q_net_x0
    );

  mult_add_im_5625f0db12: entity work.mult_add_im_entity_5625f0db12
    port map (
      a => force_im_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_im_output_port_net_x3,
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      out_x0 => add_s_net_x0
    );

  mult_add_re_eea8d71dee: entity work.mult_add_im_entity_5625f0db12
    port map (
      a => force_re_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_re_output_port_net_x3,
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      out_x0 => add_s_net_x1
    );

  ri_to_c_59e827f4c1: entity work.ri_to_c_entity_007b667efe
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
      ce => ce_1_sg_x25,
      clk => clk_1_sg_x25,
      d(0) => sync_delay_q_net_x1,
      en => '1',
      q(0) => sync_delay_q_net_x2
    );

  tap_delay_9ce863f294: entity work.tap_delay_entity_8b0b4ca2e5
    port map (
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      in_x0 => dout_delay_q_net_x0,
      out_x0 => bram_data_out_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_2"

entity fir_tap_2_entity_de2966bf5b is
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
end fir_tap_2_entity_de2966bf5b;

architecture structural of fir_tap_2_entity_de2966bf5b is
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(7 downto 0);
  signal ce_1_sg_x26: std_logic;
  signal clk_1_sg_x26: std_logic;
  signal concat_y_net_x4: std_logic_vector(33 downto 0);
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x6: std_logic;
  signal sync_delay_q_net_x7: std_logic;

begin
  ce_1_sg_x26 <= ce_1;
  clk_1_sg_x26 <= clk_1;
  bram_data_out_net_x4 <= data_in;
  concat_y_net_x4 <= sum_in;
  sync_delay_q_net_x6 <= sync_in;
  data_out <= bram_data_out_net_x5;
  sum_out <= concat_y_net_x5;
  sync_out <= sync_delay_q_net_x7;

  fir_coef_8033da333b: entity work.fir_coef_entity_8033da333b
    port map (
      ce_1 => ce_1_sg_x26,
      clk_1 => clk_1_sg_x26,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x4,
      sync_in => sync_delay_q_net_x6,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_3b628b72bc: entity work.fir_core_entity_3b628b72bc
    port map (
      ce_1 => ce_1_sg_x26,
      clk_1 => clk_1_sg_x26,
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

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_3/fir_coef/c_gen"

entity c_gen_entity_6b8ad9a4f8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_6b8ad9a4f8;

architecture structural of c_gen_entity_6b8ad9a4f8 is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x27: std_logic;
  signal clk_1_sg_x27: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mem_data_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x8: std_logic;

begin
  ce_1_sg_x27 <= ce_1;
  clk_1_sg_x27 <= clk_1;
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
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
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
      ce => ce_1_sg_x27,
      clk => clk_1_sg_x27,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_3/fir_coef"

entity fir_coef_entity_5e5fcf201a is
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
end fir_coef_entity_5e5fcf201a;

architecture structural of fir_coef_entity_5e5fcf201a is
  signal bram_data_out_net_x6: std_logic_vector(7 downto 0);
  signal ce_1_sg_x28: std_logic;
  signal clk_1_sg_x28: std_logic;
  signal concat_y_net_x6: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x9: std_logic;

begin
  ce_1_sg_x28 <= ce_1;
  clk_1_sg_x28 <= clk_1;
  bram_data_out_net_x6 <= data_in;
  concat_y_net_x6 <= sum_in;
  sync_delay_q_net_x9 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_6b8ad9a4f8: entity work.c_gen_entity_6b8ad9a4f8
    port map (
      ce_1 => ce_1_sg_x28,
      clk_1 => clk_1_sg_x28,
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
      ce => ce_1_sg_x28,
      clk => clk_1_sg_x28,
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
      ce => ce_1_sg_x28,
      clk => clk_1_sg_x28,
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
      ce => ce_1_sg_x28,
      clk => clk_1_sg_x28,
      d(0) => sync_delay_q_net_x9,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_3"

entity fir_tap_3_entity_1db532ecda is
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
end fir_tap_3_entity_1db532ecda;

architecture structural of fir_tap_3_entity_1db532ecda is
  signal bram_data_out_net_x2: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(7 downto 0);
  signal ce_1_sg_x33: std_logic;
  signal clk_1_sg_x33: std_logic;
  signal concat_y_net_x2: std_logic_vector(33 downto 0);
  signal concat_y_net_x7: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x10: std_logic;
  signal sync_delay_q_net_x11: std_logic;

begin
  ce_1_sg_x33 <= ce_1;
  clk_1_sg_x33 <= clk_1;
  bram_data_out_net_x7 <= data_in;
  concat_y_net_x7 <= sum_in;
  sync_delay_q_net_x10 <= sync_in;
  data_out <= bram_data_out_net_x2;
  sum_out <= concat_y_net_x2;
  sync_out <= sync_delay_q_net_x11;

  fir_coef_5e5fcf201a: entity work.fir_coef_entity_5e5fcf201a
    port map (
      ce_1 => ce_1_sg_x33,
      clk_1 => clk_1_sg_x33,
      data_in => bram_data_out_net_x7,
      sum_in => concat_y_net_x7,
      sync_in => sync_delay_q_net_x10,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_57f2bc8a56: entity work.fir_core_entity_3b628b72bc
    port map (
      ce_1 => ce_1_sg_x33,
      clk_1 => clk_1_sg_x33,
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

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_4/fir_coef/c_gen"

entity c_gen_entity_bfed56ba73 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_bfed56ba73;

architecture structural of c_gen_entity_bfed56ba73 is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x34: std_logic;
  signal clk_1_sg_x34: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mem_data_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x12: std_logic;

begin
  ce_1_sg_x34 <= ce_1;
  clk_1_sg_x34 <= clk_1;
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
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
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
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_4/fir_coef"

entity fir_coef_entity_cd9df4bc76 is
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
end fir_coef_entity_cd9df4bc76;

architecture structural of fir_coef_entity_cd9df4bc76 is
  signal bram_data_out_net_x3: std_logic_vector(7 downto 0);
  signal ce_1_sg_x35: std_logic;
  signal clk_1_sg_x35: std_logic;
  signal concat_y_net_x3: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x13: std_logic;

begin
  ce_1_sg_x35 <= ce_1;
  clk_1_sg_x35 <= clk_1;
  bram_data_out_net_x3 <= data_in;
  concat_y_net_x3 <= sum_in;
  sync_delay_q_net_x13 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_bfed56ba73: entity work.c_gen_entity_bfed56ba73
    port map (
      ce_1 => ce_1_sg_x35,
      clk_1 => clk_1_sg_x35,
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
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
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
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
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
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      d(0) => sync_delay_q_net_x13,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_4"

entity fir_tap_4_entity_7c430193f8 is
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
end fir_tap_4_entity_7c430193f8;

architecture structural of fir_tap_4_entity_7c430193f8 is
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(7 downto 0);
  signal ce_1_sg_x40: std_logic;
  signal clk_1_sg_x40: std_logic;
  signal concat_y_net_x4: std_logic_vector(33 downto 0);
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x14: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  ce_1_sg_x40 <= ce_1;
  clk_1_sg_x40 <= clk_1;
  bram_data_out_net_x4 <= data_in;
  concat_y_net_x4 <= sum_in;
  sync_delay_q_net_x14 <= sync_in;
  data_out <= bram_data_out_net_x5;
  sum_out <= concat_y_net_x5;
  sync_out <= sync_delay_q_net_x3;

  fir_coef_cd9df4bc76: entity work.fir_coef_entity_cd9df4bc76
    port map (
      ce_1 => ce_1_sg_x40,
      clk_1 => clk_1_sg_x40,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x4,
      sync_in => sync_delay_q_net_x14,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_e6a7632a34: entity work.fir_core_entity_3b628b72bc
    port map (
      ce_1 => ce_1_sg_x40,
      clk_1 => clk_1_sg_x40,
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

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_5/fir_coef/c_gen"

entity c_gen_entity_33087564cb is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_33087564cb;

architecture structural of c_gen_entity_33087564cb is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x41: std_logic;
  signal clk_1_sg_x41: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mem_data_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x4: std_logic;

begin
  ce_1_sg_x41 <= ce_1;
  clk_1_sg_x41 <= clk_1;
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
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
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
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_5/fir_coef"

entity fir_coef_entity_74e36d4821 is
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
end fir_coef_entity_74e36d4821;

architecture structural of fir_coef_entity_74e36d4821 is
  signal bram_data_out_net_x6: std_logic_vector(7 downto 0);
  signal ce_1_sg_x42: std_logic;
  signal clk_1_sg_x42: std_logic;
  signal concat_y_net_x6: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x5: std_logic;

begin
  ce_1_sg_x42 <= ce_1;
  clk_1_sg_x42 <= clk_1;
  bram_data_out_net_x6 <= data_in;
  concat_y_net_x6 <= sum_in;
  sync_delay_q_net_x5 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;
  sync_out <= sync_delay_q_net_x0;

  c_gen_33087564cb: entity work.c_gen_entity_33087564cb
    port map (
      ce_1 => ce_1_sg_x42,
      clk_1 => clk_1_sg_x42,
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
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
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
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
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
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
      d(0) => sync_delay_q_net_x5,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_5"

entity fir_tap_5_entity_32d697476e is
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
end fir_tap_5_entity_32d697476e;

architecture structural of fir_tap_5_entity_32d697476e is
  signal bram_data_out_net_x2: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(7 downto 0);
  signal ce_1_sg_x47: std_logic;
  signal clk_1_sg_x47: std_logic;
  signal concat_y_net_x2: std_logic_vector(33 downto 0);
  signal concat_y_net_x7: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x6: std_logic;
  signal sync_delay_q_net_x7: std_logic;

begin
  ce_1_sg_x47 <= ce_1;
  clk_1_sg_x47 <= clk_1;
  bram_data_out_net_x7 <= data_in;
  concat_y_net_x7 <= sum_in;
  sync_delay_q_net_x6 <= sync_in;
  data_out <= bram_data_out_net_x2;
  sum_out <= concat_y_net_x2;
  sync_out <= sync_delay_q_net_x7;

  fir_coef_74e36d4821: entity work.fir_coef_entity_74e36d4821
    port map (
      ce_1 => ce_1_sg_x47,
      clk_1 => clk_1_sg_x47,
      data_in => bram_data_out_net_x7,
      sum_in => concat_y_net_x7,
      sync_in => sync_delay_q_net_x6,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_64a4b01cfe: entity work.fir_core_entity_3b628b72bc
    port map (
      ce_1 => ce_1_sg_x47,
      clk_1 => clk_1_sg_x47,
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

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_6/fir_coef/c_gen"

entity c_gen_entity_6a3e648c8e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_6a3e648c8e;

architecture structural of c_gen_entity_6a3e648c8e is
  signal addr_sel_y_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x48: std_logic;
  signal clk_1_sg_x48: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mem_data_net_x0: std_logic_vector(8 downto 0);
  signal sync_delay_q_net_x8: std_logic;

begin
  ce_1_sg_x48 <= ce_1;
  clk_1_sg_x48 <= clk_1;
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
      ce => ce_1_sg_x48,
      clk => clk_1_sg_x48,
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
      ce => ce_1_sg_x48,
      clk => clk_1_sg_x48,
      en => "1",
      rst => "0",
      data => mem_data_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_6/fir_coef"

entity fir_coef_entity_6398eb6f71 is
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
end fir_coef_entity_6398eb6f71;

architecture structural of fir_coef_entity_6398eb6f71 is
  signal bram_data_out_net_x3: std_logic_vector(7 downto 0);
  signal ce_1_sg_x49: std_logic;
  signal clk_1_sg_x49: std_logic;
  signal concat_y_net_x3: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(7 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x9: std_logic;

begin
  ce_1_sg_x49 <= ce_1;
  clk_1_sg_x49 <= clk_1;
  bram_data_out_net_x3 <= data_in;
  concat_y_net_x3 <= sum_in;
  sync_delay_q_net_x9 <= sync_in;
  coef <= mem_data_net_x1;
  data_out <= data_delay_q_net_x0;
  sum_out <= sum_delay_q_net_x0;

  c_gen_6a3e648c8e: entity work.c_gen_entity_6a3e648c8e
    port map (
      ce_1 => ce_1_sg_x49,
      clk_1 => clk_1_sg_x49,
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
      ce => ce_1_sg_x49,
      clk => clk_1_sg_x49,
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
      ce => ce_1_sg_x49,
      clk => clk_1_sg_x49,
      d => concat_y_net_x3,
      en => '1',
      q => sum_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_6/fir_core"

entity fir_core_entity_eb17f90b1c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coef: in std_logic_vector(8 downto 0); 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sum_out: out std_logic_vector(33 downto 0)
  );
end fir_core_entity_eb17f90b1c;

architecture structural of fir_core_entity_eb17f90b1c is
  signal add_s_net_x0: std_logic_vector(17 downto 0);
  signal add_s_net_x1: std_logic_vector(17 downto 0);
  signal ce_1_sg_x52: std_logic;
  signal clk_1_sg_x52: std_logic;
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
  ce_1_sg_x52 <= ce_1;
  clk_1_sg_x52 <= clk_1;
  mem_data_net_x4 <= coef;
  data_delay_q_net_x2 <= data_in;
  sum_delay_q_net_x2 <= sum_in;
  sum_out <= concat_y_net_x4;

  c_to_ri_d_cdb310ecd6: entity work.c_to_ri_d_entity_f9c71271a8
    port map (
      c => data_delay_q_net_x2,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  c_to_ri_s_22c3200508: entity work.c_to_ri_entity_fe9d761bb1
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

  mult_add_im_7c0a9a8853: entity work.mult_add_im_entity_5625f0db12
    port map (
      a => force_im_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_im_output_port_net_x3,
      ce_1 => ce_1_sg_x52,
      clk_1 => clk_1_sg_x52,
      out_x0 => add_s_net_x0
    );

  mult_add_re_796b7a7782: entity work.mult_add_im_entity_5625f0db12
    port map (
      a => force_re_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_re_output_port_net_x3,
      ce_1 => ce_1_sg_x52,
      clk_1 => clk_1_sg_x52,
      out_x0 => add_s_net_x1
    );

  ri_to_c_5e718f628d: entity work.ri_to_c_entity_007b667efe
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1/fir_tap_6"

entity fir_tap_6_entity_8984997cb1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    sum_in: in std_logic_vector(33 downto 0); 
    sync_in: in std_logic; 
    sum_out: out std_logic_vector(33 downto 0)
  );
end fir_tap_6_entity_8984997cb1;

architecture structural of fir_tap_6_entity_8984997cb1 is
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal ce_1_sg_x53: std_logic;
  signal clk_1_sg_x53: std_logic;
  signal concat_y_net_x5: std_logic_vector(33 downto 0);
  signal concat_y_net_x6: std_logic_vector(33 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(7 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(33 downto 0);
  signal sync_delay_q_net_x10: std_logic;

begin
  ce_1_sg_x53 <= ce_1;
  clk_1_sg_x53 <= clk_1;
  bram_data_out_net_x4 <= data_in;
  concat_y_net_x5 <= sum_in;
  sync_delay_q_net_x10 <= sync_in;
  sum_out <= concat_y_net_x6;

  fir_coef_6398eb6f71: entity work.fir_coef_entity_6398eb6f71
    port map (
      ce_1 => ce_1_sg_x53,
      clk_1 => clk_1_sg_x53,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x5,
      sync_in => sync_delay_q_net_x10,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sum_out => sum_delay_q_net_x2
    );

  fir_core_eb17f90b1c: entity work.fir_core_entity_eb17f90b1c
    port map (
      ce_1 => ce_1_sg_x53,
      clk_1 => clk_1_sg_x53,
      coef => mem_data_net_x4,
      data_in => data_delay_q_net_x2,
      sum_in => sum_delay_q_net_x2,
      sum_out => concat_y_net_x6
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_1"

entity fir_1_entity_d77345f031 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(7 downto 0); 
    sync_in: in std_logic; 
    out_x0: out std_logic_vector(17 downto 0)
  );
end fir_1_entity_d77345f031;

architecture structural of fir_1_entity_d77345f031 is
  signal bram_data_out_net_x10: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x4: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x8: std_logic_vector(7 downto 0);
  signal bram_data_out_net_x9: std_logic_vector(7 downto 0);
  signal ce_1_sg_x54: std_logic;
  signal clk_1_sg_x54: std_logic;
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
  ce_1_sg_x54 <= ce_1;
  clk_1_sg_x54 <= clk_1;
  delay_q_net_x2 <= in_x0;
  delay7_q_net_x3 <= sync_in;
  out_x0 <= concat_y_net_x10;

  fir_quantize_159d90c3b8: entity work.fir_quantize_entity_159d90c3b8
    port map (
      ce_1 => ce_1_sg_x54,
      clk_1 => clk_1_sg_x54,
      sum_in => concat_y_net_x6,
      sum_out => concat_y_net_x10
    );

  fir_tap_1_b409832013: entity work.fir_tap_1_entity_b409832013
    port map (
      ce_1 => ce_1_sg_x54,
      clk_1 => clk_1_sg_x54,
      data_in => delay_q_net_x2,
      sync_in => delay7_q_net_x3,
      data_out => bram_data_out_net_x4,
      sum_out => concat_y_net_x4,
      sync_out => sync_delay_q_net_x6
    );

  fir_tap_2_de2966bf5b: entity work.fir_tap_2_entity_de2966bf5b
    port map (
      ce_1 => ce_1_sg_x54,
      clk_1 => clk_1_sg_x54,
      data_in => bram_data_out_net_x4,
      sum_in => concat_y_net_x4,
      sync_in => sync_delay_q_net_x6,
      data_out => bram_data_out_net_x7,
      sum_out => concat_y_net_x7,
      sync_out => sync_delay_q_net_x10
    );

  fir_tap_3_1db532ecda: entity work.fir_tap_3_entity_1db532ecda
    port map (
      ce_1 => ce_1_sg_x54,
      clk_1 => clk_1_sg_x54,
      data_in => bram_data_out_net_x7,
      sum_in => concat_y_net_x7,
      sync_in => sync_delay_q_net_x10,
      data_out => bram_data_out_net_x8,
      sum_out => concat_y_net_x8,
      sync_out => sync_delay_q_net_x14
    );

  fir_tap_4_7c430193f8: entity work.fir_tap_4_entity_7c430193f8
    port map (
      ce_1 => ce_1_sg_x54,
      clk_1 => clk_1_sg_x54,
      data_in => bram_data_out_net_x8,
      sum_in => concat_y_net_x8,
      sync_in => sync_delay_q_net_x14,
      data_out => bram_data_out_net_x9,
      sum_out => concat_y_net_x9,
      sync_out => sync_delay_q_net_x7
    );

  fir_tap_5_32d697476e: entity work.fir_tap_5_entity_32d697476e
    port map (
      ce_1 => ce_1_sg_x54,
      clk_1 => clk_1_sg_x54,
      data_in => bram_data_out_net_x9,
      sum_in => concat_y_net_x9,
      sync_in => sync_delay_q_net_x7,
      data_out => bram_data_out_net_x10,
      sum_out => concat_y_net_x5,
      sync_out => sync_delay_q_net_x11
    );

  fir_tap_6_8984997cb1: entity work.fir_tap_6_entity_8984997cb1
    port map (
      ce_1 => ce_1_sg_x54,
      clk_1 => clk_1_sg_x54,
      data_in => bram_data_out_net_x10,
      sum_in => concat_y_net_x5,
      sync_in => sync_delay_q_net_x11,
      sum_out => concat_y_net_x6
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_4/fir_quantize"

entity fir_quantize_entity_0872b1c19f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_quantize_entity_0872b1c19f;

architecture structural of fir_quantize_entity_0872b1c19f is
  signal ce_1_sg_x98: std_logic;
  signal clk_1_sg_x98: std_logic;
  signal delay_q_net_x0: std_logic;
  signal sync_delay_q_net_x0: std_logic;

begin
  ce_1_sg_x98 <= ce_1;
  clk_1_sg_x98 <= clk_1;
  sync_delay_q_net_x0 <= sync_in;
  sync_out <= delay_q_net_x0;

  delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x98,
      clk => clk_1_sg_x98,
      d(0) => sync_delay_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_4/fir_tap_1/fir_coef"

entity fir_coef_entity_fa8d0a6424 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_coef_entity_fa8d0a6424;

architecture structural of fir_coef_entity_fa8d0a6424 is
  signal ce_1_sg_x99: std_logic;
  signal clk_1_sg_x99: std_logic;
  signal delay7_q_net_x8: std_logic;
  signal sync_delay_q_net_x0: std_logic;

begin
  ce_1_sg_x99 <= ce_1;
  clk_1_sg_x99 <= clk_1;
  delay7_q_net_x8 <= sync_in;
  sync_out <= sync_delay_q_net_x0;

  sync_delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x99,
      clk => clk_1_sg_x99,
      d(0) => delay7_q_net_x8,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_4/fir_tap_1"

entity fir_tap_1_entity_b54d787092 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_tap_1_entity_b54d787092;

architecture structural of fir_tap_1_entity_b54d787092 is
  signal ce_1_sg_x101: std_logic;
  signal clk_1_sg_x101: std_logic;
  signal delay7_q_net_x9: std_logic;
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x3: std_logic;

begin
  ce_1_sg_x101 <= ce_1;
  clk_1_sg_x101 <= clk_1;
  delay7_q_net_x9 <= sync_in;
  sync_out <= sync_delay_q_net_x3;

  fir_coef_fa8d0a6424: entity work.fir_coef_entity_fa8d0a6424
    port map (
      ce_1 => ce_1_sg_x101,
      clk_1 => clk_1_sg_x101,
      sync_in => delay7_q_net_x9,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_6cc879cea3: entity work.fir_quantize_entity_0872b1c19f
    port map (
      ce_1 => ce_1_sg_x101,
      clk_1 => clk_1_sg_x101,
      sync_in => sync_delay_q_net_x1,
      sync_out => sync_delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_4/fir_tap_2/fir_core"

entity fir_core_entity_eb3608837d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_core_entity_eb3608837d;

architecture structural of fir_core_entity_eb3608837d is
  signal ce_1_sg_x103: std_logic;
  signal clk_1_sg_x103: std_logic;
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x2: std_logic;

begin
  ce_1_sg_x103 <= ce_1;
  clk_1_sg_x103 <= clk_1;
  sync_delay_q_net_x1 <= sync_in;
  sync_out <= sync_delay_q_net_x2;

  sync_delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      d(0) => sync_delay_q_net_x1,
      en => '1',
      q(0) => sync_delay_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_4/fir_tap_2"

entity fir_tap_2_entity_001db5d752 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_tap_2_entity_001db5d752;

architecture structural of fir_tap_2_entity_001db5d752 is
  signal ce_1_sg_x104: std_logic;
  signal clk_1_sg_x104: std_logic;
  signal sync_delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x5: std_logic;
  signal sync_delay_q_net_x6: std_logic;

begin
  ce_1_sg_x104 <= ce_1;
  clk_1_sg_x104 <= clk_1;
  sync_delay_q_net_x5 <= sync_in;
  sync_out <= sync_delay_q_net_x6;

  fir_coef_cb402f0fd9: entity work.fir_coef_entity_fa8d0a6424
    port map (
      ce_1 => ce_1_sg_x104,
      clk_1 => clk_1_sg_x104,
      sync_in => sync_delay_q_net_x5,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_eb3608837d: entity work.fir_core_entity_eb3608837d
    port map (
      ce_1 => ce_1_sg_x104,
      clk_1 => clk_1_sg_x104,
      sync_in => sync_delay_q_net_x1,
      sync_out => sync_delay_q_net_x6
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/fir_4"

entity fir_4_entity_9067c135e4 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_4_entity_9067c135e4;

architecture structural of fir_4_entity_9067c135e4 is
  signal ce_1_sg_x117: std_logic;
  signal clk_1_sg_x117: std_logic;
  signal delay7_q_net_x10: std_logic;
  signal delay_q_net_x1: std_logic;
  signal sync_delay_q_net_x10: std_logic;
  signal sync_delay_q_net_x11: std_logic;
  signal sync_delay_q_net_x5: std_logic;
  signal sync_delay_q_net_x6: std_logic;
  signal sync_delay_q_net_x8: std_logic;
  signal sync_delay_q_net_x9: std_logic;

begin
  ce_1_sg_x117 <= ce_1;
  clk_1_sg_x117 <= clk_1;
  delay7_q_net_x10 <= sync_in;
  sync_out <= delay_q_net_x1;

  fir_quantize_0872b1c19f: entity work.fir_quantize_entity_0872b1c19f
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x6,
      sync_out => delay_q_net_x1
    );

  fir_tap_1_b54d787092: entity work.fir_tap_1_entity_b54d787092
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => delay7_q_net_x10,
      sync_out => sync_delay_q_net_x5
    );

  fir_tap_2_001db5d752: entity work.fir_tap_2_entity_001db5d752
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x5,
      sync_out => sync_delay_q_net_x8
    );

  fir_tap_3_fde9457b54: entity work.fir_tap_2_entity_001db5d752
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x8,
      sync_out => sync_delay_q_net_x9
    );

  fir_tap_4_6165b30b68: entity work.fir_tap_2_entity_001db5d752
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x9,
      sync_out => sync_delay_q_net_x10
    );

  fir_tap_5_0285c5000f: entity work.fir_tap_2_entity_001db5d752
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x10,
      sync_out => sync_delay_q_net_x11
    );

  fir_tap_6_5154ca09df: entity work.fir_tap_2_entity_001db5d752
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x11,
      sync_out => sync_delay_q_net_x6
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/led0_sync"

entity led0_sync_entity_f85f7d5b7c is
  port (
    gpio_out: in std_logic; 
    convert_x0: out std_logic
  );
end led0_sync_entity_f85f7d5b7c;

architecture structural of led0_sync_entity_f85f7d5b7c is
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

-- Generated from Simulink block "r4_5g_specV5/pulse_ext1"

entity pulse_ext1_entity_4051a15797 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end pulse_ext1_entity_4051a15797;

architecture structural of pulse_ext1_entity_4051a15797 is
  signal ce_1_sg_x206: std_logic;
  signal clk_1_sg_x206: std_logic;
  signal constant5_op_net: std_logic_vector(24 downto 0);
  signal counter3_op_net: std_logic_vector(24 downto 0);
  signal logical_y_net_x2: std_logic;
  signal logical_y_net_x3: std_logic;
  signal relational5_op_net_x1: std_logic;

begin
  ce_1_sg_x206 <= ce_1;
  clk_1_sg_x206 <= clk_1;
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
      ce => ce_1_sg_x206,
      clk => clk_1_sg_x206,
      clr => '0',
      en(0) => relational5_op_net_x1,
      rst(0) => logical_y_net_x2,
      op => counter3_op_net
    );

  posedge_aed9b95747: entity work.posedge1_entity_d70b7fecd6
    port map (
      ce_1 => ce_1_sg_x206,
      clk_1 => clk_1_sg_x206,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_bitrev/biplex_bitrev0/bit_reverse"

entity bit_reverse_entity_7a73fb4074 is
  port (
    in_x0: in std_logic_vector(7 downto 0); 
    out_x0: out std_logic_vector(7 downto 0)
  );
end bit_reverse_entity_7a73fb4074;

architecture structural of bit_reverse_entity_7a73fb4074 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_bitrev/biplex_bitrev0/c_to_ri"

entity c_to_ri_entity_77af6c8b3b is
  port (
    c: in std_logic_vector(37 downto 0); 
    im: out std_logic_vector(18 downto 0); 
    re: out std_logic_vector(18 downto 0)
  );
end c_to_ri_entity_77af6c8b3b;

architecture structural of c_to_ri_entity_77af6c8b3b is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_bitrev/biplex_bitrev0/ri_to_c"

entity ri_to_c_entity_b3a6a3c041 is
  port (
    im: in std_logic_vector(18 downto 0); 
    re: in std_logic_vector(18 downto 0); 
    c: out std_logic_vector(37 downto 0)
  );
end ri_to_c_entity_b3a6a3c041;

architecture structural of ri_to_c_entity_b3a6a3c041 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_bitrev/biplex_bitrev0"

entity biplex_bitrev0_entity_30ef78a279 is
  port (
    a_in: in std_logic_vector(37 downto 0); 
    b_in: in std_logic_vector(37 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(37 downto 0); 
    b_out: out std_logic_vector(37 downto 0)
  );
end biplex_bitrev0_entity_30ef78a279;

architecture structural of biplex_bitrev0_entity_30ef78a279 is
  signal ce_1_sg_x209: std_logic;
  signal clk_1_sg_x209: std_logic;
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
  ce_1_sg_x209 <= ce_1;
  clk_1_sg_x209 <= clk_1;
  delay_q_net_x0 <= sync_in;
  a_out <= concat_y_net_x4;
  b_out <= concat_y_net_x5;

  bit_reverse_7a73fb4074: entity work.bit_reverse_entity_7a73fb4074
    port map (
      in_x0 => counter_op_net_x0,
      out_x0 => concat_y_net_x0
    );

  c_to_ri1_cdafe29a1b: entity work.c_to_ri_entity_77af6c8b3b
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_77af6c8b3b: entity work.c_to_ri_entity_77af6c8b3b
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
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net_x0
    );

  counter1: entity work.counter_2943023fcf
    port map (
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
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
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
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
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
      d => concat_y_net_x3,
      en => '1',
      q => delay2_q_net_x0
    );

  mux: entity work.mux_7f6b7da686
    port map (
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
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
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
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
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
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
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
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
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
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
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
      clr => '0',
      op(0) => relational_op_net
    );

  ri_to_c1_a52cb52ab5: entity work.ri_to_c_entity_b3a6a3c041
    port map (
      im => ram_b_im_data_out_net_x0,
      re => ram_b_re_data_out_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_b3a6a3c041: entity work.ri_to_c_entity_b3a6a3c041
    port map (
      im => ram_a_im_data_out_net_x0,
      re => ram_a_re_data_out_net_x0,
      c => concat_y_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_bitrev"

entity quadplex_bitrev_entity_660273096d is
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
end quadplex_bitrev_entity_660273096d;

architecture structural of quadplex_bitrev_entity_660273096d is
  signal ce_1_sg_x211: std_logic;
  signal clk_1_sg_x211: std_logic;
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
  ce_1_sg_x211 <= ce_1;
  clk_1_sg_x211 <= clk_1;
  mux1_y_net_x3 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x11;
  b_out <= concat_y_net_x12;
  c_out <= concat_y_net_x13;
  d_out <= concat_y_net_x14;

  biplex_bitrev0_30ef78a279: entity work.biplex_bitrev0_entity_30ef78a279
    port map (
      a_in => concat_y_net_x9,
      b_in => mux1_y_net_x2,
      ce_1 => ce_1_sg_x211,
      clk_1 => clk_1_sg_x211,
      sync_in => delay_q_net_x2,
      a_out => concat_y_net_x11,
      b_out => concat_y_net_x12
    );

  biplex_bitrev1_268cc4f4b1: entity work.biplex_bitrev0_entity_30ef78a279
    port map (
      a_in => concat_y_net_x10,
      b_in => mux1_y_net_x3,
      ce_1 => ce_1_sg_x211,
      clk_1 => clk_1_sg_x211,
      sync_in => delay_q_net_x2,
      a_out => concat_y_net_x13,
      b_out => concat_y_net_x14
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_commutator/biplex_commutator_01/delay_b/delay_im"

entity delay_im_entity_5e0a651975 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(18 downto 0); 
    out_x0: out std_logic_vector(18 downto 0)
  );
end delay_im_entity_5e0a651975;

architecture structural of delay_im_entity_5e0a651975 is
  signal bram_data_out_net_x0: std_logic_vector(18 downto 0);
  signal ce_1_sg_x212: std_logic;
  signal clk_1_sg_x212: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(18 downto 0);

begin
  ce_1_sg_x212 <= ce_1;
  clk_1_sg_x212 <= clk_1;
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
      ce => ce_1_sg_x212,
      clk => clk_1_sg_x212,
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
      ce => ce_1_sg_x212,
      clk => clk_1_sg_x212,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_47aee85e44 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(37 downto 0); 
    out_x0: out std_logic_vector(37 downto 0)
  );
end delay_b_entity_47aee85e44;

architecture structural of delay_b_entity_47aee85e44 is
  signal bram_data_out_net_x2: std_logic_vector(18 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(18 downto 0);
  signal ce_1_sg_x214: std_logic;
  signal clk_1_sg_x214: std_logic;
  signal concat_y_net_x2: std_logic_vector(37 downto 0);
  signal concat_y_net_x3: std_logic_vector(37 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(18 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(18 downto 0);

begin
  ce_1_sg_x214 <= ce_1;
  clk_1_sg_x214 <= clk_1;
  concat_y_net_x2 <= in_x0;
  out_x0 <= concat_y_net_x3;

  c_to_ri_e4859baa03: entity work.c_to_ri_entity_77af6c8b3b
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  delay_im_5e0a651975: entity work.delay_im_entity_5e0a651975
    port map (
      ce_1 => ce_1_sg_x214,
      clk_1 => clk_1_sg_x214,
      in_x0 => force_im_output_port_net_x1,
      out_x0 => bram_data_out_net_x2
    );

  delay_re_ce48dacb4d: entity work.delay_im_entity_5e0a651975
    port map (
      ce_1 => ce_1_sg_x214,
      clk_1 => clk_1_sg_x214,
      in_x0 => force_re_output_port_net_x1,
      out_x0 => bram_data_out_net_x3
    );

  ri_to_c_bed8318d26: entity work.ri_to_c_entity_b3a6a3c041
    port map (
      im => bram_data_out_net_x2,
      re => bram_data_out_net_x3,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_6a76e43a40 is
  port (
    aloahi: in std_logic_vector(37 downto 0); 
    blobhi: in std_logic_vector(37 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(37 downto 0); 
    aloblo: out std_logic_vector(37 downto 0)
  );
end biplex_commutator_01_entity_6a76e43a40;

architecture structural of biplex_commutator_01_entity_6a76e43a40 is
  signal ce_1_sg_x218: std_logic;
  signal clk_1_sg_x218: std_logic;
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
  ce_1_sg_x218 <= ce_1;
  clk_1_sg_x218 <= clk_1;
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
      ce => ce_1_sg_x218,
      clk => clk_1_sg_x218,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_47aee85e44: entity work.delay_b_entity_47aee85e44
    port map (
      ce_1 => ce_1_sg_x218,
      clk_1 => clk_1_sg_x218,
      in_x0 => concat_y_net_x4,
      out_x0 => concat_y_net_x3
    );

  delay_lo_f5010121d5: entity work.delay_b_entity_47aee85e44
    port map (
      ce_1 => ce_1_sg_x218,
      clk_1 => clk_1_sg_x218,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x12
    );

  mux: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x218,
      clk => clk_1_sg_x218,
      clr => '0',
      d0 => concat_y_net_x0,
      d1 => concat_y_net_x3,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x218,
      clk => clk_1_sg_x218,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_50a787a430 is
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
end biplex_commutator_23_entity_50a787a430;

architecture structural of biplex_commutator_23_entity_50a787a430 is
  signal ce_1_sg_x225: std_logic;
  signal clk_1_sg_x225: std_logic;
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
  ce_1_sg_x225 <= ce_1;
  clk_1_sg_x225 <= clk_1;
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
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
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
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      d(0) => delay_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay_b_7e3bcc561d: entity work.delay_b_entity_47aee85e44
    port map (
      ce_1 => ce_1_sg_x225,
      clk_1 => clk_1_sg_x225,
      in_x0 => mux1_y_net_x2,
      out_x0 => concat_y_net_x1
    );

  delay_lo_bb75bbbe28: entity work.delay_b_entity_47aee85e44
    port map (
      ce_1 => ce_1_sg_x225,
      clk_1 => clk_1_sg_x225,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x13
    );

  mux: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      clr => '0',
      d0 => mux1_y_net_x0,
      d1 => concat_y_net_x1,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_commutator/biplex_commutator_ac/delay_b/delay_im"

entity delay_im_entity_1878a3b82b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(18 downto 0); 
    out_x0: out std_logic_vector(18 downto 0)
  );
end delay_im_entity_1878a3b82b;

architecture structural of delay_im_entity_1878a3b82b is
  signal bram_data_out_net_x0: std_logic_vector(18 downto 0);
  signal ce_1_sg_x226: std_logic;
  signal clk_1_sg_x226: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(18 downto 0);

begin
  ce_1_sg_x226 <= ce_1;
  clk_1_sg_x226 <= clk_1;
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
      ce => ce_1_sg_x226,
      clk => clk_1_sg_x226,
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
      ce => ce_1_sg_x226,
      clk => clk_1_sg_x226,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_54d4e68371 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(37 downto 0); 
    out_x0: out std_logic_vector(37 downto 0)
  );
end delay_b_entity_54d4e68371;

architecture structural of delay_b_entity_54d4e68371 is
  signal bram_data_out_net_x2: std_logic_vector(18 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(18 downto 0);
  signal ce_1_sg_x228: std_logic;
  signal clk_1_sg_x228: std_logic;
  signal concat_y_net_x2: std_logic_vector(37 downto 0);
  signal concat_y_net_x3: std_logic_vector(37 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(18 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(18 downto 0);

begin
  ce_1_sg_x228 <= ce_1;
  clk_1_sg_x228 <= clk_1;
  concat_y_net_x2 <= in_x0;
  out_x0 <= concat_y_net_x3;

  c_to_ri_3703676f4a: entity work.c_to_ri_entity_77af6c8b3b
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  delay_im_1878a3b82b: entity work.delay_im_entity_1878a3b82b
    port map (
      ce_1 => ce_1_sg_x228,
      clk_1 => clk_1_sg_x228,
      in_x0 => force_im_output_port_net_x1,
      out_x0 => bram_data_out_net_x2
    );

  delay_re_ce0daf323e: entity work.delay_im_entity_1878a3b82b
    port map (
      ce_1 => ce_1_sg_x228,
      clk_1 => clk_1_sg_x228,
      in_x0 => force_re_output_port_net_x1,
      out_x0 => bram_data_out_net_x3
    );

  ri_to_c_62586d10a1: entity work.ri_to_c_entity_b3a6a3c041
    port map (
      im => bram_data_out_net_x2,
      re => bram_data_out_net_x3,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_2c3cadb7c6 is
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
end biplex_commutator_ac_entity_2c3cadb7c6;

architecture structural of biplex_commutator_ac_entity_2c3cadb7c6 is
  signal ce_1_sg_x232: std_logic;
  signal clk_1_sg_x232: std_logic;
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
  ce_1_sg_x232 <= ce_1;
  clk_1_sg_x232 <= clk_1;
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
      ce => ce_1_sg_x232,
      clk => clk_1_sg_x232,
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
      ce => ce_1_sg_x232,
      clk => clk_1_sg_x232,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_54d4e68371: entity work.delay_b_entity_54d4e68371
    port map (
      ce_1 => ce_1_sg_x232,
      clk_1 => clk_1_sg_x232,
      in_x0 => concat_y_net_x5,
      out_x0 => concat_y_net_x3
    );

  delay_lo_ccbbb5b7e6: entity work.delay_b_entity_54d4e68371
    port map (
      ce_1 => ce_1_sg_x232,
      clk_1 => clk_1_sg_x232,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x6
    );

  mux: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x232,
      clk => clk_1_sg_x232,
      clr => '0',
      d0 => concat_y_net_x0,
      d1 => concat_y_net_x3,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_79b7e15c26
    port map (
      ce => ce_1_sg_x232,
      clk => clk_1_sg_x232,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/quadplex_commutator"

entity quadplex_commutator_entity_24b23ba26e is
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
end quadplex_commutator_entity_24b23ba26e;

architecture structural of quadplex_commutator_entity_24b23ba26e is
  signal ce_1_sg_x240: std_logic;
  signal clk_1_sg_x240: std_logic;
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
  ce_1_sg_x240 <= ce_1;
  clk_1_sg_x240 <= clk_1;
  concat_y_net_x11 <= d;
  delay_q_net_x6 <= sync_in;
  abcd0 <= concat_y_net_x15;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= concat_y_net_x16;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x7;

  biplex_commutator_01_6a76e43a40: entity work.biplex_commutator_01_entity_6a76e43a40
    port map (
      aloahi => concat_y_net_x6,
      blobhi => concat_y_net_x7,
      ce_1 => ce_1_sg_x240,
      clk_1 => clk_1_sg_x240,
      sync_in => delay_q_net_x2,
      ahibhi => mux1_y_net_x6,
      aloblo => concat_y_net_x15
    );

  biplex_commutator_23_50a787a430: entity work.biplex_commutator_23_entity_50a787a430
    port map (
      aloahi => mux1_y_net_x1,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x240,
      clk_1 => clk_1_sg_x240,
      sync_in => delay_q_net_x4,
      ahibhi => mux1_y_net_x7,
      aloblo => concat_y_net_x16,
      sync_out => delay_q_net_x7
    );

  biplex_commutator_ac_2c3cadb7c6: entity work.biplex_commutator_ac_entity_2c3cadb7c6
    port map (
      aloahi => concat_y_net_x9,
      blobhi => concat_y_net_x14,
      ce_1 => ce_1_sg_x240,
      clk_1 => clk_1_sg_x240,
      sync_in => delay_q_net_x6,
      ahibhi => mux1_y_net_x1,
      aloblo => concat_y_net_x6,
      sync_out => delay_q_net_x2
    );

  biplex_commutator_bd_c91f287100: entity work.biplex_commutator_ac_entity_2c3cadb7c6
    port map (
      aloahi => concat_y_net_x10,
      blobhi => concat_y_net_x11,
      ce_1 => ce_1_sg_x240,
      clk_1 => clk_1_sg_x240,
      sync_in => delay_q_net_x6,
      ahibhi => mux1_y_net_x5,
      aloblo => concat_y_net_x7,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_54fc59f010 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(17 downto 0); 
    out_x0: out std_logic_vector(17 downto 0)
  );
end delay_b_entity_54fc59f010;

architecture structural of delay_b_entity_54fc59f010 is
  signal bram_data_out_net_x1: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x2: std_logic_vector(17 downto 0);
  signal ce_1_sg_x241: std_logic;
  signal clk_1_sg_x241: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x241 <= ce_1;
  clk_1_sg_x241 <= clk_1;
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
      ce => ce_1_sg_x241,
      clk => clk_1_sg_x241,
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
      ce => ce_1_sg_x241,
      clk => clk_1_sg_x241,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_62d41deb8e is
  port (
    aloahi: in std_logic_vector(17 downto 0); 
    blobhi: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(17 downto 0); 
    aloblo: out std_logic_vector(17 downto 0)
  );
end biplex_commutator_01_entity_62d41deb8e;

architecture structural of biplex_commutator_01_entity_62d41deb8e is
  signal bram_data_out_net_x2: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x4: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(17 downto 0);
  signal ce_1_sg_x243: std_logic;
  signal clk_1_sg_x243: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(17 downto 0);
  signal mux_y_net_x0: std_logic_vector(17 downto 0);
  signal top_bit_y_net: std_logic;

begin
  bram_data_out_net_x3 <= aloahi;
  bram_data_out_net_x4 <= blobhi;
  ce_1_sg_x243 <= ce_1;
  clk_1_sg_x243 <= clk_1;
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
      ce => ce_1_sg_x243,
      clk => clk_1_sg_x243,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_54fc59f010: entity work.delay_b_entity_54fc59f010
    port map (
      ce_1 => ce_1_sg_x243,
      clk_1 => clk_1_sg_x243,
      in_x0 => bram_data_out_net_x4,
      out_x0 => bram_data_out_net_x2
    );

  delay_lo_26c550428d: entity work.delay_b_entity_54fc59f010
    port map (
      ce_1 => ce_1_sg_x243,
      clk_1 => clk_1_sg_x243,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x5
    );

  mux: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x243,
      clk => clk_1_sg_x243,
      clr => '0',
      d0 => bram_data_out_net_x3,
      d1 => bram_data_out_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x243,
      clk => clk_1_sg_x243,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_f2ff46cb20 is
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
end biplex_commutator_23_entity_f2ff46cb20;

architecture structural of biplex_commutator_23_entity_f2ff46cb20 is
  signal bram_data_out_net_x0: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x2: std_logic_vector(17 downto 0);
  signal ce_1_sg_x246: std_logic;
  signal clk_1_sg_x246: std_logic;
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
  ce_1_sg_x246 <= ce_1;
  clk_1_sg_x246 <= clk_1;
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
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
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
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_e76cf0c343: entity work.delay_b_entity_54fc59f010
    port map (
      ce_1 => ce_1_sg_x246,
      clk_1 => clk_1_sg_x246,
      in_x0 => mux1_y_net_x3,
      out_x0 => bram_data_out_net_x0
    );

  delay_lo_6d81c4800a: entity work.delay_b_entity_54fc59f010
    port map (
      ce_1 => ce_1_sg_x246,
      clk_1 => clk_1_sg_x246,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x2
    );

  mux: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => bram_data_out_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_fc95f0b354 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(17 downto 0); 
    out_x0: out std_logic_vector(17 downto 0)
  );
end delay_b_entity_fc95f0b354;

architecture structural of delay_b_entity_fc95f0b354 is
  signal bram_data_out_net_x0: std_logic_vector(17 downto 0);
  signal ce_1_sg_x247: std_logic;
  signal clk_1_sg_x247: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal shift4_op_net_x0: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x247 <= ce_1;
  clk_1_sg_x247 <= clk_1;
  shift4_op_net_x0 <= in_x0;
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
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      data_in => shift4_op_net_x0,
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
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_2ca5bf992f is
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
end biplex_commutator_ac_entity_2ca5bf992f;

architecture structural of biplex_commutator_ac_entity_2ca5bf992f is
  signal bram_data_out_net_x0: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(17 downto 0);
  signal ce_1_sg_x249: std_logic;
  signal clk_1_sg_x249: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x3: std_logic;
  signal mux1_y_net_x3: std_logic_vector(17 downto 0);
  signal mux_y_net_x0: std_logic_vector(17 downto 0);
  signal shift4_op_net_x1: std_logic_vector(17 downto 0);
  signal shift_op_net_x0: std_logic_vector(17 downto 0);
  signal top_bit_y_net: std_logic;

begin
  shift_op_net_x0 <= aloahi;
  shift4_op_net_x1 <= blobhi;
  ce_1_sg_x249 <= ce_1;
  clk_1_sg_x249 <= clk_1;
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
      ce => ce_1_sg_x249,
      clk => clk_1_sg_x249,
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
      ce => ce_1_sg_x249,
      clk => clk_1_sg_x249,
      d(0) => delay_q_net_x2,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay_b_fc95f0b354: entity work.delay_b_entity_fc95f0b354
    port map (
      ce_1 => ce_1_sg_x249,
      clk_1 => clk_1_sg_x249,
      in_x0 => shift4_op_net_x1,
      out_x0 => bram_data_out_net_x0
    );

  delay_lo_77987b84e8: entity work.delay_b_entity_fc95f0b354
    port map (
      ce_1 => ce_1_sg_x249,
      clk_1 => clk_1_sg_x249,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x5
    );

  mux: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x249,
      clk => clk_1_sg_x249,
      clr => '0',
      d0 => shift_op_net_x0,
      d1 => bram_data_out_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x249,
      clk => clk_1_sg_x249,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator"

entity quadplex_commutator_entity_262766872e is
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
end quadplex_commutator_entity_262766872e;

architecture structural of quadplex_commutator_entity_262766872e is
  signal bram_data_out_net_x6: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x8: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x9: std_logic_vector(17 downto 0);
  signal ce_1_sg_x253: std_logic;
  signal clk_1_sg_x253: std_logic;
  signal delay_q_net_x4: std_logic;
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x6: std_logic;
  signal delay_q_net_x7: std_logic;
  signal mux1_y_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x5: std_logic_vector(17 downto 0);
  signal mux1_y_net_x6: std_logic_vector(17 downto 0);
  signal mux1_y_net_x7: std_logic_vector(17 downto 0);
  signal shift1_op_net_x1: std_logic_vector(17 downto 0);
  signal shift4_op_net_x2: std_logic_vector(17 downto 0);
  signal shift5_op_net_x2: std_logic_vector(17 downto 0);
  signal shift_op_net_x1: std_logic_vector(17 downto 0);

begin
  shift_op_net_x1 <= a;
  shift1_op_net_x1 <= b;
  shift4_op_net_x2 <= c;
  ce_1_sg_x253 <= ce_1;
  clk_1_sg_x253 <= clk_1;
  shift5_op_net_x2 <= d;
  delay_q_net_x6 <= sync_in;
  abcd0 <= bram_data_out_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= bram_data_out_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x7;

  biplex_commutator_01_62d41deb8e: entity work.biplex_commutator_01_entity_62d41deb8e
    port map (
      aloahi => bram_data_out_net_x6,
      blobhi => bram_data_out_net_x7,
      ce_1 => ce_1_sg_x253,
      clk_1 => clk_1_sg_x253,
      sync_in => delay_q_net_x4,
      ahibhi => mux1_y_net_x6,
      aloblo => bram_data_out_net_x8
    );

  biplex_commutator_23_f2ff46cb20: entity work.biplex_commutator_23_entity_f2ff46cb20
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x253,
      clk_1 => clk_1_sg_x253,
      sync_in => delay_q_net_x5,
      ahibhi => mux1_y_net_x7,
      aloblo => bram_data_out_net_x9,
      sync_out => delay_q_net_x7
    );

  biplex_commutator_ac_2ca5bf992f: entity work.biplex_commutator_ac_entity_2ca5bf992f
    port map (
      aloahi => shift_op_net_x1,
      blobhi => shift4_op_net_x2,
      ce_1 => ce_1_sg_x253,
      clk_1 => clk_1_sg_x253,
      sync_in => delay_q_net_x6,
      ahibhi => mux1_y_net_x3,
      aloblo => bram_data_out_net_x6,
      sync_out => delay_q_net_x4
    );

  biplex_commutator_bd_3eb9bf3106: entity work.biplex_commutator_ac_entity_2ca5bf992f
    port map (
      aloahi => shift1_op_net_x1,
      blobhi => shift5_op_net_x2,
      ce_1 => ce_1_sg_x253,
      clk_1 => clk_1_sg_x253,
      sync_in => delay_q_net_x6,
      ahibhi => mux1_y_net_x5,
      aloblo => bram_data_out_net_x7,
      sync_out => delay_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_cb1e791740 is
  port (
    c: in std_logic_vector(17 downto 0); 
    im: out std_logic_vector(8 downto 0); 
    re: out std_logic_vector(8 downto 0)
  );
end c_to_ri_entity_cb1e791740;

architecture structural of c_to_ri_entity_cb1e791740 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_18e0c52f45 is
  port (
    im: in std_logic_vector(9 downto 0); 
    re: in std_logic_vector(9 downto 0); 
    c: out std_logic_vector(19 downto 0)
  );
end ri_to_c_entity_18e0c52f45;

architecture structural of ri_to_c_entity_18e0c52f45 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly0"

entity butterfly0_entity_6f5feb3631 is
  port (
    a: in std_logic_vector(17 downto 0); 
    b: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(19 downto 0); 
    a_b_x0: out std_logic_vector(19 downto 0)
  );
end butterfly0_entity_6f5feb3631;

architecture structural of butterfly0_entity_6f5feb3631 is
  signal add_im_s_net: std_logic_vector(9 downto 0);
  signal add_re_s_net: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x11: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x12: std_logic_vector(17 downto 0);
  signal ce_1_sg_x254: std_logic;
  signal clk_1_sg_x254: std_logic;
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
  ce_1_sg_x254 <= ce_1;
  clk_1_sg_x254 <= clk_1;
  a_b <= concat_y_net_x2;
  a_b_x0 <= concat_y_net_x3;

  add_im: entity work.addsub_793ae25d23
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x254,
      clk => clk_1_sg_x254,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_793ae25d23
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x254,
      clk => clk_1_sg_x254,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_f07a23f884: entity work.c_to_ri_entity_cb1e791740
    port map (
      c => bram_data_out_net_x12,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_cb1e791740: entity work.c_to_ri_entity_cb1e791740
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

  ri_to_c1_57e1a75f03: entity work.ri_to_c_entity_18e0c52f45
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x3
    );

  ri_to_c_18e0c52f45: entity work.ri_to_c_entity_18e0c52f45
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
      ce => ce_1_sg_x254,
      clk => clk_1_sg_x254,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_3700bc31ba
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x254,
      clk => clk_1_sg_x254,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly1"

entity butterfly1_entity_7fd0666490 is
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
end butterfly1_entity_7fd0666490;

architecture structural of butterfly1_entity_7fd0666490 is
  signal add_im_s_net: std_logic_vector(9 downto 0);
  signal add_re_s_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x255: std_logic;
  signal clk_1_sg_x255: std_logic;
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
  ce_1_sg_x255 <= ce_1;
  clk_1_sg_x255 <= clk_1;
  delay_q_net_x8 <= sync_in;
  a_b <= concat_y_net_x2;
  a_b_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_793ae25d23
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x255,
      clk => clk_1_sg_x255,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_793ae25d23
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x255,
      clk => clk_1_sg_x255,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_4599a85df0: entity work.c_to_ri_entity_cb1e791740
    port map (
      c => mux1_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_1cf93c6c0b: entity work.c_to_ri_entity_cb1e791740
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
      ce => ce_1_sg_x255,
      clk => clk_1_sg_x255,
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

  ri_to_c1_c69716f085: entity work.ri_to_c_entity_18e0c52f45
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x3
    );

  ri_to_c_b25d0ed627: entity work.ri_to_c_entity_18e0c52f45
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
      ce => ce_1_sg_x255,
      clk => clk_1_sg_x255,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_3700bc31ba
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x255,
      clk => clk_1_sg_x255,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_b676585c3d is
  port (
    c: in std_logic_vector(19 downto 0); 
    im: out std_logic_vector(9 downto 0); 
    re: out std_logic_vector(9 downto 0)
  );
end c_to_ri_entity_b676585c3d;

architecture structural of c_to_ri_entity_b676585c3d is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_1aa6ecbd54 is
  port (
    im: in std_logic_vector(10 downto 0); 
    re: in std_logic_vector(10 downto 0); 
    c: out std_logic_vector(21 downto 0)
  );
end ri_to_c_entity_1aa6ecbd54;

architecture structural of ri_to_c_entity_1aa6ecbd54 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly2"

entity butterfly2_entity_3774d12e04 is
  port (
    a: in std_logic_vector(19 downto 0); 
    b: in std_logic_vector(19 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(21 downto 0); 
    a_b_x0: out std_logic_vector(21 downto 0)
  );
end butterfly2_entity_3774d12e04;

architecture structural of butterfly2_entity_3774d12e04 is
  signal add_im_s_net: std_logic_vector(10 downto 0);
  signal add_re_s_net: std_logic_vector(10 downto 0);
  signal ce_1_sg_x256: std_logic;
  signal clk_1_sg_x256: std_logic;
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
  ce_1_sg_x256 <= ce_1;
  clk_1_sg_x256 <= clk_1;
  a_b <= concat_y_net_x8;
  a_b_x0 <= concat_y_net_x9;

  add_im: entity work.addsub_74b65e93f7
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_74b65e93f7
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_58aaad2094: entity work.c_to_ri_entity_b676585c3d
    port map (
      c => concat_y_net_x7,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_b676585c3d: entity work.c_to_ri_entity_b676585c3d
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

  ri_to_c1_eecb7aeb5f: entity work.ri_to_c_entity_1aa6ecbd54
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x9
    );

  ri_to_c_1aa6ecbd54: entity work.ri_to_c_entity_1aa6ecbd54
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
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_89c5949a28
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly3j"

entity butterfly3j_entity_857f216018 is
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
end butterfly3j_entity_857f216018;

architecture structural of butterfly3j_entity_857f216018 is
  signal add_im_s_net: std_logic_vector(10 downto 0);
  signal add_re_s_net: std_logic_vector(10 downto 0);
  signal ce_1_sg_x257: std_logic;
  signal clk_1_sg_x257: std_logic;
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
  ce_1_sg_x257 <= ce_1;
  clk_1_sg_x257 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x8;
  a_b_x0 <= concat_y_net_x9;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_89c5949a28
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x257,
      clk => clk_1_sg_x257,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_74b65e93f7
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x257,
      clk => clk_1_sg_x257,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_69e708c3e7: entity work.c_to_ri_entity_b676585c3d
    port map (
      c => concat_y_net_x7,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_db16e284a9: entity work.c_to_ri_entity_b676585c3d
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
      ce => ce_1_sg_x257,
      clk => clk_1_sg_x257,
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

  ri_to_c1_fe8298d8b0: entity work.ri_to_c_entity_1aa6ecbd54
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x9
    );

  ri_to_c_99000b22b8: entity work.ri_to_c_entity_1aa6ecbd54
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
      ce => ce_1_sg_x257,
      clk => clk_1_sg_x257,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_89c5949a28
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x257,
      clk => clk_1_sg_x257,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1/r4_butterfly"

entity r4_butterfly_entity_bb1510c086 is
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
end r4_butterfly_entity_bb1510c086;

architecture structural of r4_butterfly_entity_bb1510c086 is
  signal bram_data_out_net_x13: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x14: std_logic_vector(17 downto 0);
  signal ce_1_sg_x258: std_logic;
  signal clk_1_sg_x258: std_logic;
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
  ce_1_sg_x258 <= ce_1;
  clk_1_sg_x258 <= clk_1;
  mux1_y_net_x12 <= d_in;
  delay_q_net_x9 <= sync_in;
  a_out <= concat_y_net_x14;
  b_out <= concat_y_net_x15;
  c_out <= concat_y_net_x16;
  d_out <= concat_y_net_x17;
  sync_out <= delay_q_net_x10;

  butterfly0_6f5feb3631: entity work.butterfly0_entity_6f5feb3631
    port map (
      a => bram_data_out_net_x13,
      b => bram_data_out_net_x14,
      ce_1 => ce_1_sg_x258,
      clk_1 => clk_1_sg_x258,
      a_b => concat_y_net_x6,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_7fd0666490: entity work.butterfly1_entity_7fd0666490
    port map (
      a => mux1_y_net_x11,
      b => mux1_y_net_x12,
      ce_1 => ce_1_sg_x258,
      clk_1 => clk_1_sg_x258,
      sync_in => delay_q_net_x9,
      a_b => concat_y_net_x8,
      a_b_x0 => concat_y_net_x9,
      sync_out => delay_q_net_x1
    );

  butterfly2_3774d12e04: entity work.butterfly2_entity_3774d12e04
    port map (
      a => concat_y_net_x6,
      b => concat_y_net_x8,
      ce_1 => ce_1_sg_x258,
      clk_1 => clk_1_sg_x258,
      a_b => concat_y_net_x14,
      a_b_x0 => concat_y_net_x15
    );

  butterfly3j_857f216018: entity work.butterfly3j_entity_857f216018
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x9,
      ce_1 => ce_1_sg_x258,
      clk_1 => clk_1_sg_x258,
      sync_in => delay_q_net_x1,
      a_b => concat_y_net_x16,
      a_b_x0 => concat_y_net_x17,
      sync_out => delay_q_net_x10
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_1"

entity r4_dit_stage_1_entity_36070de08f is
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
end r4_dit_stage_1_entity_36070de08f;

architecture structural of r4_dit_stage_1_entity_36070de08f is
  signal bram_data_out_net_x13: std_logic_vector(17 downto 0);
  signal bram_data_out_net_x14: std_logic_vector(17 downto 0);
  signal ce_1_sg_x259: std_logic;
  signal clk_1_sg_x259: std_logic;
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
  signal shift4_op_net_x3: std_logic_vector(17 downto 0);
  signal shift5_op_net_x3: std_logic_vector(17 downto 0);
  signal shift_op_net_x2: std_logic_vector(17 downto 0);

begin
  shift_op_net_x2 <= a_in;
  shift1_op_net_x2 <= b_in;
  shift4_op_net_x3 <= c_in;
  ce_1_sg_x259 <= ce_1;
  clk_1_sg_x259 <= clk_1;
  shift5_op_net_x3 <= d_in;
  delay_q_net_x11 <= sync_in;
  a_out <= concat_y_net_x18;
  b_out <= concat_y_net_x19;
  c_out <= concat_y_net_x20;
  d_out <= concat_y_net_x21;
  sync_out <= delay_q_net_x12;

  quadplex_commutator_262766872e: entity work.quadplex_commutator_entity_262766872e
    port map (
      a => shift_op_net_x2,
      b => shift1_op_net_x2,
      c => shift4_op_net_x3,
      ce_1 => ce_1_sg_x259,
      clk_1 => clk_1_sg_x259,
      d => shift5_op_net_x3,
      sync_in => delay_q_net_x11,
      abcd0 => bram_data_out_net_x13,
      abcd1 => mux1_y_net_x11,
      abcd2 => bram_data_out_net_x14,
      abcd3 => mux1_y_net_x12,
      sync_out => delay_q_net_x9
    );

  r4_butterfly_bb1510c086: entity work.r4_butterfly_entity_bb1510c086
    port map (
      a_in => bram_data_out_net_x13,
      b_in => mux1_y_net_x11,
      c_in => bram_data_out_net_x14,
      ce_1 => ce_1_sg_x259,
      clk_1 => clk_1_sg_x259,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_01/delay_b/c_to_ri"

entity c_to_ri_entity_e4c3654c70 is
  port (
    c: in std_logic_vector(21 downto 0); 
    im: out std_logic_vector(10 downto 0); 
    re: out std_logic_vector(10 downto 0)
  );
end c_to_ri_entity_e4c3654c70;

architecture structural of c_to_ri_entity_e4c3654c70 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_01/delay_b/delay_im"

entity delay_im_entity_cc3d63fda2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(10 downto 0); 
    out_x0: out std_logic_vector(10 downto 0)
  );
end delay_im_entity_cc3d63fda2;

architecture structural of delay_im_entity_cc3d63fda2 is
  signal bram_data_out_net_x0: std_logic_vector(10 downto 0);
  signal ce_1_sg_x260: std_logic;
  signal clk_1_sg_x260: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(5 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(10 downto 0);

begin
  ce_1_sg_x260 <= ce_1;
  clk_1_sg_x260 <= clk_1;
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
      ce => ce_1_sg_x260,
      clk => clk_1_sg_x260,
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
      ce => ce_1_sg_x260,
      clk => clk_1_sg_x260,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_7978f90115 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(21 downto 0); 
    out_x0: out std_logic_vector(21 downto 0)
  );
end delay_b_entity_7978f90115;

architecture structural of delay_b_entity_7978f90115 is
  signal bram_data_out_net_x2: std_logic_vector(10 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(10 downto 0);
  signal ce_1_sg_x262: std_logic;
  signal clk_1_sg_x262: std_logic;
  signal concat_y_net_x2: std_logic_vector(21 downto 0);
  signal concat_y_net_x3: std_logic_vector(21 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(10 downto 0);

begin
  ce_1_sg_x262 <= ce_1;
  clk_1_sg_x262 <= clk_1;
  concat_y_net_x2 <= in_x0;
  out_x0 <= concat_y_net_x3;

  c_to_ri_e4c3654c70: entity work.c_to_ri_entity_e4c3654c70
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  delay_im_cc3d63fda2: entity work.delay_im_entity_cc3d63fda2
    port map (
      ce_1 => ce_1_sg_x262,
      clk_1 => clk_1_sg_x262,
      in_x0 => force_im_output_port_net_x1,
      out_x0 => bram_data_out_net_x2
    );

  delay_re_20df67da12: entity work.delay_im_entity_cc3d63fda2
    port map (
      ce_1 => ce_1_sg_x262,
      clk_1 => clk_1_sg_x262,
      in_x0 => force_re_output_port_net_x1,
      out_x0 => bram_data_out_net_x3
    );

  ri_to_c_8b76e8fc8f: entity work.ri_to_c_entity_1aa6ecbd54
    port map (
      im => bram_data_out_net_x2,
      re => bram_data_out_net_x3,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_ded833414d is
  port (
    aloahi: in std_logic_vector(21 downto 0); 
    blobhi: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(21 downto 0); 
    aloblo: out std_logic_vector(21 downto 0)
  );
end biplex_commutator_01_entity_ded833414d;

architecture structural of biplex_commutator_01_entity_ded833414d is
  signal ce_1_sg_x266: std_logic;
  signal clk_1_sg_x266: std_logic;
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
  ce_1_sg_x266 <= ce_1;
  clk_1_sg_x266 <= clk_1;
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
      ce => ce_1_sg_x266,
      clk => clk_1_sg_x266,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_7978f90115: entity work.delay_b_entity_7978f90115
    port map (
      ce_1 => ce_1_sg_x266,
      clk_1 => clk_1_sg_x266,
      in_x0 => concat_y_net_x4,
      out_x0 => concat_y_net_x3
    );

  delay_lo_ef3b233400: entity work.delay_b_entity_7978f90115
    port map (
      ce_1 => ce_1_sg_x266,
      clk_1 => clk_1_sg_x266,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x5
    );

  mux: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x266,
      clk => clk_1_sg_x266,
      clr => '0',
      d0 => concat_y_net_x0,
      d1 => concat_y_net_x3,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x266,
      clk => clk_1_sg_x266,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_4c7f6cebf7 is
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
end biplex_commutator_23_entity_4c7f6cebf7;

architecture structural of biplex_commutator_23_entity_4c7f6cebf7 is
  signal ce_1_sg_x273: std_logic;
  signal clk_1_sg_x273: std_logic;
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
  ce_1_sg_x273 <= ce_1;
  clk_1_sg_x273 <= clk_1;
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
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
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
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_86e968c869: entity work.delay_b_entity_7978f90115
    port map (
      ce_1 => ce_1_sg_x273,
      clk_1 => clk_1_sg_x273,
      in_x0 => mux1_y_net_x3,
      out_x0 => concat_y_net_x1
    );

  delay_lo_afbb456070: entity work.delay_b_entity_7978f90115
    port map (
      ce_1 => ce_1_sg_x273,
      clk_1 => clk_1_sg_x273,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x3
    );

  mux: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => concat_y_net_x1,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_ac/delay_b/delay_im"

entity delay_im_entity_4893737a70 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(10 downto 0); 
    out_x0: out std_logic_vector(10 downto 0)
  );
end delay_im_entity_4893737a70;

architecture structural of delay_im_entity_4893737a70 is
  signal bram_data_out_net_x0: std_logic_vector(10 downto 0);
  signal ce_1_sg_x274: std_logic;
  signal clk_1_sg_x274: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(6 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(10 downto 0);

begin
  ce_1_sg_x274 <= ce_1;
  clk_1_sg_x274 <= clk_1;
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
      ce => ce_1_sg_x274,
      clk => clk_1_sg_x274,
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
      ce => ce_1_sg_x274,
      clk => clk_1_sg_x274,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_aa403b4208 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(21 downto 0); 
    out_x0: out std_logic_vector(21 downto 0)
  );
end delay_b_entity_aa403b4208;

architecture structural of delay_b_entity_aa403b4208 is
  signal bram_data_out_net_x2: std_logic_vector(10 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(10 downto 0);
  signal ce_1_sg_x276: std_logic;
  signal clk_1_sg_x276: std_logic;
  signal concat_y_net_x1: std_logic_vector(21 downto 0);
  signal concat_y_net_x22: std_logic_vector(21 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(10 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(10 downto 0);

begin
  ce_1_sg_x276 <= ce_1;
  clk_1_sg_x276 <= clk_1;
  concat_y_net_x22 <= in_x0;
  out_x0 <= concat_y_net_x1;

  c_to_ri_aa78964c2c: entity work.c_to_ri_entity_e4c3654c70
    port map (
      c => concat_y_net_x22,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  delay_im_4893737a70: entity work.delay_im_entity_4893737a70
    port map (
      ce_1 => ce_1_sg_x276,
      clk_1 => clk_1_sg_x276,
      in_x0 => force_im_output_port_net_x1,
      out_x0 => bram_data_out_net_x2
    );

  delay_re_748b4c7127: entity work.delay_im_entity_4893737a70
    port map (
      ce_1 => ce_1_sg_x276,
      clk_1 => clk_1_sg_x276,
      in_x0 => force_re_output_port_net_x1,
      out_x0 => bram_data_out_net_x3
    );

  ri_to_c_ce1027d767: entity work.ri_to_c_entity_1aa6ecbd54
    port map (
      im => bram_data_out_net_x2,
      re => bram_data_out_net_x3,
      c => concat_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_6da9d0762c is
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
end biplex_commutator_ac_entity_6da9d0762c;

architecture structural of biplex_commutator_ac_entity_6da9d0762c is
  signal ce_1_sg_x280: std_logic;
  signal clk_1_sg_x280: std_logic;
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
  ce_1_sg_x280 <= ce_1;
  clk_1_sg_x280 <= clk_1;
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
      ce => ce_1_sg_x280,
      clk => clk_1_sg_x280,
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
      ce => ce_1_sg_x280,
      clk => clk_1_sg_x280,
      d(0) => delay_q_net_x13,
      en => '1',
      q(0) => delay_q_net_x1
    );

  delay_b_aa403b4208: entity work.delay_b_entity_aa403b4208
    port map (
      ce_1 => ce_1_sg_x280,
      clk_1 => clk_1_sg_x280,
      in_x0 => concat_y_net_x23,
      out_x0 => concat_y_net_x1
    );

  delay_lo_ee502bd1f9: entity work.delay_b_entity_aa403b4208
    port map (
      ce_1 => ce_1_sg_x280,
      clk_1 => clk_1_sg_x280,
      in_x0 => mux_y_net_x1,
      out_x0 => concat_y_net_x3
    );

  mux: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x280,
      clk => clk_1_sg_x280,
      clr => '0',
      d0 => concat_y_net_x19,
      d1 => concat_y_net_x1,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x1
    );

  mux1: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x280,
      clk => clk_1_sg_x280,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator"

entity quadplex_commutator_entity_faeb218c71 is
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
end quadplex_commutator_entity_faeb218c71;

architecture structural of quadplex_commutator_entity_faeb218c71 is
  signal ce_1_sg_x288: std_logic;
  signal clk_1_sg_x288: std_logic;
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
  ce_1_sg_x288 <= ce_1;
  clk_1_sg_x288 <= clk_1;
  concat_y_net_x27 <= d;
  delay_q_net_x15 <= sync_in;
  abcd0 <= concat_y_net_x28;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= concat_y_net_x6;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x4;

  biplex_commutator_01_ded833414d: entity work.biplex_commutator_01_entity_ded833414d
    port map (
      aloahi => concat_y_net_x4,
      blobhi => concat_y_net_x7,
      ce_1 => ce_1_sg_x288,
      clk_1 => clk_1_sg_x288,
      sync_in => delay_q_net_x1,
      ahibhi => mux1_y_net_x6,
      aloblo => concat_y_net_x28
    );

  biplex_commutator_23_4c7f6cebf7: entity work.biplex_commutator_23_entity_4c7f6cebf7
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x288,
      clk_1 => clk_1_sg_x288,
      sync_in => delay_q_net_x3,
      ahibhi => mux1_y_net_x7,
      aloblo => concat_y_net_x6,
      sync_out => delay_q_net_x4
    );

  biplex_commutator_ac_6da9d0762c: entity work.biplex_commutator_ac_entity_6da9d0762c
    port map (
      aloahi => concat_y_net_x21,
      blobhi => concat_y_net_x26,
      ce_1 => ce_1_sg_x288,
      clk_1 => clk_1_sg_x288,
      sync_in => delay_q_net_x15,
      ahibhi => mux1_y_net_x3,
      aloblo => concat_y_net_x4,
      sync_out => delay_q_net_x1
    );

  biplex_commutator_bd_d268060baa: entity work.biplex_commutator_ac_entity_6da9d0762c
    port map (
      aloahi => concat_y_net_x25,
      blobhi => concat_y_net_x27,
      ce_1 => ce_1_sg_x288,
      clk_1 => clk_1_sg_x288,
      sync_in => delay_q_net_x15,
      ahibhi => mux1_y_net_x5,
      aloblo => concat_y_net_x7,
      sync_out => delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_106d69554f is
  port (
    im: in std_logic_vector(11 downto 0); 
    re: in std_logic_vector(11 downto 0); 
    c: out std_logic_vector(23 downto 0)
  );
end ri_to_c_entity_106d69554f;

architecture structural of ri_to_c_entity_106d69554f is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly0"

entity butterfly0_entity_e4ab8e7fb8 is
  port (
    a: in std_logic_vector(21 downto 0); 
    b: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(23 downto 0); 
    a_b_x0: out std_logic_vector(23 downto 0)
  );
end butterfly0_entity_e4ab8e7fb8;

architecture structural of butterfly0_entity_e4ab8e7fb8 is
  signal add_im_s_net: std_logic_vector(11 downto 0);
  signal add_re_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x289: std_logic;
  signal clk_1_sg_x289: std_logic;
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
  ce_1_sg_x289 <= ce_1;
  clk_1_sg_x289 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_470ffe01d4
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x289,
      clk => clk_1_sg_x289,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_470ffe01d4
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x289,
      clk => clk_1_sg_x289,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_7a8c2eaa44: entity work.c_to_ri_entity_e4c3654c70
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_69e1c48265: entity work.c_to_ri_entity_e4c3654c70
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

  ri_to_c1_4f34da4f28: entity work.ri_to_c_entity_106d69554f
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_106d69554f: entity work.ri_to_c_entity_106d69554f
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
      ce => ce_1_sg_x289,
      clk => clk_1_sg_x289,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_388a97573b
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x289,
      clk => clk_1_sg_x289,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly1"

entity butterfly1_entity_10e40369d0 is
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
end butterfly1_entity_10e40369d0;

architecture structural of butterfly1_entity_10e40369d0 is
  signal add_im_s_net: std_logic_vector(11 downto 0);
  signal add_re_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x290: std_logic;
  signal clk_1_sg_x290: std_logic;
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
  ce_1_sg_x290 <= ce_1;
  clk_1_sg_x290 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_470ffe01d4
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x290,
      clk => clk_1_sg_x290,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_470ffe01d4
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x290,
      clk => clk_1_sg_x290,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_9ac75e5e5c: entity work.c_to_ri_entity_e4c3654c70
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_1896a26c45: entity work.c_to_ri_entity_e4c3654c70
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
      ce => ce_1_sg_x290,
      clk => clk_1_sg_x290,
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

  ri_to_c1_64518560c6: entity work.ri_to_c_entity_106d69554f
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_d125536ae8: entity work.ri_to_c_entity_106d69554f
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
      ce => ce_1_sg_x290,
      clk => clk_1_sg_x290,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_388a97573b
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x290,
      clk => clk_1_sg_x290,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_8c773e837f is
  port (
    c: in std_logic_vector(23 downto 0); 
    im: out std_logic_vector(11 downto 0); 
    re: out std_logic_vector(11 downto 0)
  );
end c_to_ri_entity_8c773e837f;

architecture structural of c_to_ri_entity_8c773e837f is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_b2ea3e0c09 is
  port (
    im: in std_logic_vector(12 downto 0); 
    re: in std_logic_vector(12 downto 0); 
    c: out std_logic_vector(25 downto 0)
  );
end ri_to_c_entity_b2ea3e0c09;

architecture structural of ri_to_c_entity_b2ea3e0c09 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly2"

entity butterfly2_entity_3729a34a52 is
  port (
    a: in std_logic_vector(23 downto 0); 
    b: in std_logic_vector(23 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(25 downto 0); 
    a_b_x0: out std_logic_vector(25 downto 0)
  );
end butterfly2_entity_3729a34a52;

architecture structural of butterfly2_entity_3729a34a52 is
  signal add_im_s_net: std_logic_vector(12 downto 0);
  signal add_re_s_net: std_logic_vector(12 downto 0);
  signal ce_1_sg_x291: std_logic;
  signal clk_1_sg_x291: std_logic;
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
  ce_1_sg_x291 <= ce_1;
  clk_1_sg_x291 <= clk_1;
  a_b <= concat_y_net_x11;
  a_b_x0 <= concat_y_net_x12;

  add_im: entity work.addsub_ed74d532a0
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x291,
      clk => clk_1_sg_x291,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_ed74d532a0
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x291,
      clk => clk_1_sg_x291,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_f07ffd8787: entity work.c_to_ri_entity_8c773e837f
    port map (
      c => concat_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_8c773e837f: entity work.c_to_ri_entity_8c773e837f
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

  ri_to_c1_b9dea031b0: entity work.ri_to_c_entity_b2ea3e0c09
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x12
    );

  ri_to_c_b2ea3e0c09: entity work.ri_to_c_entity_b2ea3e0c09
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
      ce => ce_1_sg_x291,
      clk => clk_1_sg_x291,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f11535f968
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly3j"

entity butterfly3j_entity_a66adcb4d9 is
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
end butterfly3j_entity_a66adcb4d9;

architecture structural of butterfly3j_entity_a66adcb4d9 is
  signal add_im_s_net: std_logic_vector(12 downto 0);
  signal add_re_s_net: std_logic_vector(12 downto 0);
  signal ce_1_sg_x292: std_logic;
  signal clk_1_sg_x292: std_logic;
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
  ce_1_sg_x292 <= ce_1;
  clk_1_sg_x292 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x10;
  a_b_x0 <= concat_y_net_x11;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_f11535f968
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_ed74d532a0
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_b5d99b141c: entity work.c_to_ri_entity_8c773e837f
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_d6dc3c38a6: entity work.c_to_ri_entity_8c773e837f
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
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
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

  ri_to_c1_9aa47d2124: entity work.ri_to_c_entity_b2ea3e0c09
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x11
    );

  ri_to_c_d5b9a70513: entity work.ri_to_c_entity_b2ea3e0c09
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
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f11535f968
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x292,
      clk => clk_1_sg_x292,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_butterfly"

entity r4_butterfly_entity_d98f53dda4 is
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
end r4_butterfly_entity_d98f53dda4;

architecture structural of r4_butterfly_entity_d98f53dda4 is
  signal ce_1_sg_x293: std_logic;
  signal clk_1_sg_x293: std_logic;
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
  ce_1_sg_x293 <= ce_1;
  clk_1_sg_x293 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  butterfly0_e4ab8e7fb8: entity work.butterfly0_entity_e4ab8e7fb8
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x17,
      ce_1 => ce_1_sg_x293,
      clk_1 => clk_1_sg_x293,
      a_b => concat_y_net_x9,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_10e40369d0: entity work.butterfly1_entity_10e40369d0
    port map (
      a => concat_y_net_x16,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x293,
      clk_1 => clk_1_sg_x293,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x10,
      a_b_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x3
    );

  butterfly2_3729a34a52: entity work.butterfly2_entity_3729a34a52
    port map (
      a => concat_y_net_x9,
      b => concat_y_net_x10,
      ce_1 => ce_1_sg_x293,
      clk_1 => clk_1_sg_x293,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_a66adcb4d9: entity work.butterfly3j_entity_a66adcb4d9
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x293,
      clk_1 => clk_1_sg_x293,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_f83de36a99 is
  port (
    c: in std_logic_vector(21 downto 0); 
    im: out std_logic_vector(10 downto 0); 
    re: out std_logic_vector(10 downto 0)
  );
end c_to_ri_entity_f83de36a99;

architecture structural of c_to_ri_entity_f83de36a99 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1/c_to_ri1"

entity c_to_ri1_entity_7fe674c156 is
  port (
    c: in std_logic_vector(17 downto 0); 
    im: out std_logic_vector(8 downto 0); 
    re: out std_logic_vector(8 downto 0)
  );
end c_to_ri1_entity_7fe674c156;

architecture structural of c_to_ri1_entity_7fe674c156 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_bf9c2f4755 is
  port (
    im: in std_logic_vector(10 downto 0); 
    re: in std_logic_vector(10 downto 0); 
    c: out std_logic_vector(21 downto 0)
  );
end ri_to_c_entity_bf9c2f4755;

architecture structural of ri_to_c_entity_bf9c2f4755 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1"

entity cmpy1_entity_c4e84ca371 is
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
end cmpy1_entity_c4e84ca371;

architecture structural of cmpy1_entity_c4e84ca371 is
  signal br_add_bi_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x294: std_logic;
  signal clk_1_sg_x294: std_logic;
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
  ce_1_sg_x294 <= ce_1;
  clk_1_sg_x294 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x18;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_d661929060
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_7fe674c156: entity work.c_to_ri1_entity_7fe674c156
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_f83de36a99: entity work.c_to_ri_entity_f83de36a99
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
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
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
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
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
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
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
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
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
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      core_ce => ce_1_sg_x294,
      core_clk => clk_1_sg_x294,
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
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      core_ce => ce_1_sg_x294,
      core_clk => clk_1_sg_x294,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_bf9c2f4755: entity work.ri_to_c_entity_bf9c2f4755
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x18
    );

  rr_add_ii: entity work.addsub_c8df442ec4
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_6dd6aca36b
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_21a1218bfe
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
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
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      core_ce => ce_1_sg_x294,
      core_clk => clk_1_sg_x294,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy2"

entity cmpy2_entity_ec95a7d9de is
  port (
    b: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(21 downto 0)
  );
end cmpy2_entity_ec95a7d9de;

architecture structural of cmpy2_entity_ec95a7d9de is
  signal br_add_bi_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x295: std_logic;
  signal clk_1_sg_x295: std_logic;
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
  ce_1_sg_x295 <= ce_1;
  clk_1_sg_x295 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x19;

  br_add_bi: entity work.addsub_d661929060
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_8d6de131f1: entity work.c_to_ri1_entity_7fe674c156
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_210c5f6eb8: entity work.c_to_ri_entity_f83de36a99
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
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
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
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
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
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      core_ce => ce_1_sg_x295,
      core_clk => clk_1_sg_x295,
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
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      core_ce => ce_1_sg_x295,
      core_clk => clk_1_sg_x295,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_c859a6b798: entity work.ri_to_c_entity_bf9c2f4755
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_c8df442ec4
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_6dd6aca36b
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_21a1218bfe
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
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
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      core_ce => ce_1_sg_x295,
      core_clk => clk_1_sg_x295,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_4cc7338556 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_4cc7338556;

architecture structural of twiddle_gen1_entity_4cc7338556 is
  signal addr_sel_y_net: std_logic_vector(1 downto 0);
  signal ce_1_sg_x297: std_logic;
  signal clk_1_sg_x297: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x5: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x297 <= ce_1;
  clk_1_sg_x297 <= clk_1;
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
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
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
      ce => ce_1_sg_x297,
      clk => clk_1_sg_x297,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_6e2acf61e4 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_6e2acf61e4;

architecture structural of twiddle_gen2_entity_6e2acf61e4 is
  signal addr_sel_y_net: std_logic_vector(1 downto 0);
  signal ce_1_sg_x298: std_logic;
  signal clk_1_sg_x298: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x6: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x298 <= ce_1;
  clk_1_sg_x298 <= clk_1;
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
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
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
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_7dbf20bc5c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_7dbf20bc5c;

architecture structural of twiddle_gen3_entity_7dbf20bc5c is
  signal addr_sel_y_net: std_logic_vector(1 downto 0);
  signal ce_1_sg_x299: std_logic;
  signal clk_1_sg_x299: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x7: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x299 <= ce_1;
  clk_1_sg_x299 <= clk_1;
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
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
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
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2/r4_twiddle"

entity r4_twiddle_entity_509aef3b56 is
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
end r4_twiddle_entity_509aef3b56;

architecture structural of r4_twiddle_entity_509aef3b56 is
  signal ce_1_sg_x300: std_logic;
  signal clk_1_sg_x300: std_logic;
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
  ce_1_sg_x300 <= ce_1;
  clk_1_sg_x300 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x8 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x22;
  dw <= concat_y_net_x23;
  sync_out <= delay_q_net_x4;

  cmpy1_c4e84ca371: entity work.cmpy1_entity_c4e84ca371
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x300,
      clk_1 => clk_1_sg_x300,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_ec95a7d9de: entity work.cmpy2_entity_ec95a7d9de
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x300,
      clk_1 => clk_1_sg_x300,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x22
    );

  cmpy3_c59e6f184c: entity work.cmpy2_entity_ec95a7d9de
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x300,
      clk_1 => clk_1_sg_x300,
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
      ce => ce_1_sg_x300,
      clk => clk_1_sg_x300,
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
      ce => ce_1_sg_x300,
      clk => clk_1_sg_x300,
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
      ce => ce_1_sg_x300,
      clk => clk_1_sg_x300,
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
      ce => ce_1_sg_x300,
      clk => clk_1_sg_x300,
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
      ce => ce_1_sg_x300,
      clk => clk_1_sg_x300,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_4cc7338556: entity work.twiddle_gen1_entity_4cc7338556
    port map (
      ce_1 => ce_1_sg_x300,
      clk_1 => clk_1_sg_x300,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_6e2acf61e4: entity work.twiddle_gen2_entity_6e2acf61e4
    port map (
      ce_1 => ce_1_sg_x300,
      clk_1 => clk_1_sg_x300,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_7dbf20bc5c: entity work.twiddle_gen3_entity_7dbf20bc5c
    port map (
      ce_1 => ce_1_sg_x300,
      clk_1 => clk_1_sg_x300,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_2"

entity r4_dit_stage_2_entity_1a9931e6f1 is
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
end r4_dit_stage_2_entity_1a9931e6f1;

architecture structural of r4_dit_stage_2_entity_1a9931e6f1 is
  signal ce_1_sg_x301: std_logic;
  signal clk_1_sg_x301: std_logic;
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
  ce_1_sg_x301 <= ce_1;
  clk_1_sg_x301 <= clk_1;
  concat_y_net_x35 <= d_in;
  delay_q_net_x16 <= sync_in;
  a_out <= concat_y_net_x36;
  b_out <= concat_y_net_x37;
  c_out <= concat_y_net_x38;
  d_out <= concat_y_net_x39;
  sync_out <= delay_q_net_x6;

  quadplex_commutator_faeb218c71: entity work.quadplex_commutator_entity_faeb218c71
    port map (
      a => concat_y_net_x24,
      b => concat_y_net_x33,
      c => concat_y_net_x34,
      ce_1 => ce_1_sg_x301,
      clk_1 => clk_1_sg_x301,
      d => concat_y_net_x35,
      sync_in => delay_q_net_x16,
      abcd0 => concat_y_net_x29,
      abcd1 => mux1_y_net_x8,
      abcd2 => concat_y_net_x7,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x8
    );

  r4_butterfly_d98f53dda4: entity work.r4_butterfly_entity_d98f53dda4
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x23,
      c_in => concat_y_net_x31,
      ce_1 => ce_1_sg_x301,
      clk_1 => clk_1_sg_x301,
      d_in => concat_y_net_x32,
      sync_in => delay_q_net_x5,
      a_out => concat_y_net_x36,
      b_out => concat_y_net_x37,
      c_out => concat_y_net_x38,
      d_out => concat_y_net_x39,
      sync_out => delay_q_net_x6
    );

  r4_twiddle_509aef3b56: entity work.r4_twiddle_entity_509aef3b56
    port map (
      a_in => concat_y_net_x29,
      b => mux1_y_net_x8,
      c => concat_y_net_x7,
      ce_1 => ce_1_sg_x301,
      clk_1 => clk_1_sg_x301,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_29100ef262 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(25 downto 0); 
    out_x0: out std_logic_vector(25 downto 0)
  );
end delay_b_entity_29100ef262;

architecture structural of delay_b_entity_29100ef262 is
  signal ce_1_sg_x302: std_logic;
  signal clk_1_sg_x302: std_logic;
  signal slr_q_net_x1: std_logic_vector(25 downto 0);
  signal slr_q_net_x2: std_logic_vector(25 downto 0);

begin
  ce_1_sg_x302 <= ce_1;
  clk_1_sg_x302 <= clk_1;
  slr_q_net_x1 <= in_x0;
  out_x0 <= slr_q_net_x2;

  slr: entity work.xldelay
    generic map (
      latency => 16,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      d => slr_q_net_x1,
      en => '1',
      q => slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_04980bcfcc is
  port (
    aloahi: in std_logic_vector(25 downto 0); 
    blobhi: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(25 downto 0); 
    aloblo: out std_logic_vector(25 downto 0)
  );
end biplex_commutator_01_entity_04980bcfcc;

architecture structural of biplex_commutator_01_entity_04980bcfcc is
  signal ce_1_sg_x304: std_logic;
  signal clk_1_sg_x304: std_logic;
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
  ce_1_sg_x304 <= ce_1;
  clk_1_sg_x304 <= clk_1;
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
      ce => ce_1_sg_x304,
      clk => clk_1_sg_x304,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_29100ef262: entity work.delay_b_entity_29100ef262
    port map (
      ce_1 => ce_1_sg_x304,
      clk_1 => clk_1_sg_x304,
      in_x0 => slr_q_net_x4,
      out_x0 => slr_q_net_x2
    );

  delay_lo_2caa73f32b: entity work.delay_b_entity_29100ef262
    port map (
      ce_1 => ce_1_sg_x304,
      clk_1 => clk_1_sg_x304,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x304,
      clk => clk_1_sg_x304,
      clr => '0',
      d0 => slr_q_net_x3,
      d1 => slr_q_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x304,
      clk => clk_1_sg_x304,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_e42bb62919 is
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
end biplex_commutator_23_entity_e42bb62919;

architecture structural of biplex_commutator_23_entity_e42bb62919 is
  signal ce_1_sg_x307: std_logic;
  signal clk_1_sg_x307: std_logic;
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
  ce_1_sg_x307 <= ce_1;
  clk_1_sg_x307 <= clk_1;
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
      ce => ce_1_sg_x307,
      clk => clk_1_sg_x307,
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
      ce => ce_1_sg_x307,
      clk => clk_1_sg_x307,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_607ae1128b: entity work.delay_b_entity_29100ef262
    port map (
      ce_1 => ce_1_sg_x307,
      clk_1 => clk_1_sg_x307,
      in_x0 => mux1_y_net_x3,
      out_x0 => slr_q_net_x0
    );

  delay_lo_81399f1f9a: entity work.delay_b_entity_29100ef262
    port map (
      ce_1 => ce_1_sg_x307,
      clk_1 => clk_1_sg_x307,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x2
    );

  mux: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x307,
      clk => clk_1_sg_x307,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x307,
      clk => clk_1_sg_x307,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_d2b33b9d3c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(25 downto 0); 
    out_x0: out std_logic_vector(25 downto 0)
  );
end delay_b_entity_d2b33b9d3c;

architecture structural of delay_b_entity_d2b33b9d3c is
  signal ce_1_sg_x308: std_logic;
  signal clk_1_sg_x308: std_logic;
  signal concat_y_net_x39: std_logic_vector(25 downto 0);
  signal slr_q_net_x0: std_logic_vector(25 downto 0);

begin
  ce_1_sg_x308 <= ce_1;
  clk_1_sg_x308 <= clk_1;
  concat_y_net_x39 <= in_x0;
  out_x0 <= slr_q_net_x0;

  slr: entity work.xldelay
    generic map (
      latency => 32,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x308,
      clk => clk_1_sg_x308,
      d => concat_y_net_x39,
      en => '1',
      q => slr_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_a42560e7f0 is
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
end biplex_commutator_ac_entity_a42560e7f0;

architecture structural of biplex_commutator_ac_entity_a42560e7f0 is
  signal ce_1_sg_x310: std_logic;
  signal clk_1_sg_x310: std_logic;
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
  ce_1_sg_x310 <= ce_1;
  clk_1_sg_x310 <= clk_1;
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
      ce => ce_1_sg_x310,
      clk => clk_1_sg_x310,
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
      ce => ce_1_sg_x310,
      clk => clk_1_sg_x310,
      d(0) => delay_q_net_x7,
      en => '1',
      q(0) => delay_q_net_x8
    );

  delay_b_d2b33b9d3c: entity work.delay_b_entity_d2b33b9d3c
    port map (
      ce_1 => ce_1_sg_x310,
      clk_1 => clk_1_sg_x310,
      in_x0 => concat_y_net_x41,
      out_x0 => slr_q_net_x0
    );

  delay_lo_370e9a7b18: entity work.delay_b_entity_d2b33b9d3c
    port map (
      ce_1 => ce_1_sg_x310,
      clk_1 => clk_1_sg_x310,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x310,
      clk => clk_1_sg_x310,
      clr => '0',
      d0 => concat_y_net_x40,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x310,
      clk => clk_1_sg_x310,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator"

entity quadplex_commutator_entity_5766cb42d0 is
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
end quadplex_commutator_entity_5766cb42d0;

architecture structural of quadplex_commutator_entity_5766cb42d0 is
  signal ce_1_sg_x314: std_logic;
  signal clk_1_sg_x314: std_logic;
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
  ce_1_sg_x314 <= ce_1;
  clk_1_sg_x314 <= clk_1;
  concat_y_net_x47 <= d;
  delay_q_net_x11 <= sync_in;
  abcd0 <= slr_q_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= slr_q_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x12;

  biplex_commutator_01_04980bcfcc: entity work.biplex_commutator_01_entity_04980bcfcc
    port map (
      aloahi => slr_q_net_x6,
      blobhi => slr_q_net_x7,
      ce_1 => ce_1_sg_x314,
      clk_1 => clk_1_sg_x314,
      sync_in => delay_q_net_x9,
      ahibhi => mux1_y_net_x6,
      aloblo => slr_q_net_x8
    );

  biplex_commutator_23_e42bb62919: entity work.biplex_commutator_23_entity_e42bb62919
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x314,
      clk_1 => clk_1_sg_x314,
      sync_in => delay_q_net_x10,
      ahibhi => mux1_y_net_x7,
      aloblo => slr_q_net_x9,
      sync_out => delay_q_net_x12
    );

  biplex_commutator_ac_a42560e7f0: entity work.biplex_commutator_ac_entity_a42560e7f0
    port map (
      aloahi => concat_y_net_x44,
      blobhi => concat_y_net_x46,
      ce_1 => ce_1_sg_x314,
      clk_1 => clk_1_sg_x314,
      sync_in => delay_q_net_x11,
      ahibhi => mux1_y_net_x3,
      aloblo => slr_q_net_x6,
      sync_out => delay_q_net_x9
    );

  biplex_commutator_bd_3158fb47e8: entity work.biplex_commutator_ac_entity_a42560e7f0
    port map (
      aloahi => concat_y_net_x45,
      blobhi => concat_y_net_x47,
      ce_1 => ce_1_sg_x314,
      clk_1 => clk_1_sg_x314,
      sync_in => delay_q_net_x11,
      ahibhi => mux1_y_net_x5,
      aloblo => slr_q_net_x7,
      sync_out => delay_q_net_x10
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_4bcfaa67a7 is
  port (
    c: in std_logic_vector(25 downto 0); 
    im: out std_logic_vector(12 downto 0); 
    re: out std_logic_vector(12 downto 0)
  );
end c_to_ri_entity_4bcfaa67a7;

architecture structural of c_to_ri_entity_4bcfaa67a7 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_cd5a03d1c5 is
  port (
    im: in std_logic_vector(13 downto 0); 
    re: in std_logic_vector(13 downto 0); 
    c: out std_logic_vector(27 downto 0)
  );
end ri_to_c_entity_cd5a03d1c5;

architecture structural of ri_to_c_entity_cd5a03d1c5 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly0"

entity butterfly0_entity_7236742b6e is
  port (
    a: in std_logic_vector(25 downto 0); 
    b: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(27 downto 0); 
    a_b_x0: out std_logic_vector(27 downto 0)
  );
end butterfly0_entity_7236742b6e;

architecture structural of butterfly0_entity_7236742b6e is
  signal add_im_s_net: std_logic_vector(13 downto 0);
  signal add_re_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x315: std_logic;
  signal clk_1_sg_x315: std_logic;
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
  ce_1_sg_x315 <= ce_1;
  clk_1_sg_x315 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_4a1b074932
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x315,
      clk => clk_1_sg_x315,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_4a1b074932
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x315,
      clk => clk_1_sg_x315,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_4e0f40d876: entity work.c_to_ri_entity_4bcfaa67a7
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_4bcfaa67a7: entity work.c_to_ri_entity_4bcfaa67a7
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

  ri_to_c1_b5dcdf3c4a: entity work.ri_to_c_entity_cd5a03d1c5
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_cd5a03d1c5: entity work.ri_to_c_entity_cd5a03d1c5
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
      ce => ce_1_sg_x315,
      clk => clk_1_sg_x315,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f3687289ea
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x315,
      clk => clk_1_sg_x315,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly1"

entity butterfly1_entity_a874a48525 is
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
end butterfly1_entity_a874a48525;

architecture structural of butterfly1_entity_a874a48525 is
  signal add_im_s_net: std_logic_vector(13 downto 0);
  signal add_re_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x316: std_logic;
  signal clk_1_sg_x316: std_logic;
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
  ce_1_sg_x316 <= ce_1;
  clk_1_sg_x316 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_4a1b074932
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_4a1b074932
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_6ba71ef04a: entity work.c_to_ri_entity_4bcfaa67a7
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_74a02c949d: entity work.c_to_ri_entity_4bcfaa67a7
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
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
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

  ri_to_c1_af04f0d72d: entity work.ri_to_c_entity_cd5a03d1c5
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_8a85c9636d: entity work.ri_to_c_entity_cd5a03d1c5
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
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f3687289ea
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x316,
      clk => clk_1_sg_x316,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_3b76d00990 is
  port (
    c: in std_logic_vector(27 downto 0); 
    im: out std_logic_vector(13 downto 0); 
    re: out std_logic_vector(13 downto 0)
  );
end c_to_ri_entity_3b76d00990;

architecture structural of c_to_ri_entity_3b76d00990 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_0ba748958a is
  port (
    im: in std_logic_vector(14 downto 0); 
    re: in std_logic_vector(14 downto 0); 
    c: out std_logic_vector(29 downto 0)
  );
end ri_to_c_entity_0ba748958a;

architecture structural of ri_to_c_entity_0ba748958a is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly2"

entity butterfly2_entity_558f6ef896 is
  port (
    a: in std_logic_vector(27 downto 0); 
    b: in std_logic_vector(27 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(29 downto 0); 
    a_b_x0: out std_logic_vector(29 downto 0)
  );
end butterfly2_entity_558f6ef896;

architecture structural of butterfly2_entity_558f6ef896 is
  signal add_im_s_net: std_logic_vector(14 downto 0);
  signal add_re_s_net: std_logic_vector(14 downto 0);
  signal ce_1_sg_x317: std_logic;
  signal clk_1_sg_x317: std_logic;
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
  ce_1_sg_x317 <= ce_1;
  clk_1_sg_x317 <= clk_1;
  a_b <= concat_y_net_x11;
  a_b_x0 <= concat_y_net_x12;

  add_im: entity work.addsub_79dc8835bc
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_79dc8835bc
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_b517611461: entity work.c_to_ri_entity_3b76d00990
    port map (
      c => concat_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_3b76d00990: entity work.c_to_ri_entity_3b76d00990
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

  ri_to_c1_296b7ada4c: entity work.ri_to_c_entity_0ba748958a
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x12
    );

  ri_to_c_0ba748958a: entity work.ri_to_c_entity_0ba748958a
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
      ce => ce_1_sg_x317,
      clk => clk_1_sg_x317,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f4e99698eb
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly3j"

entity butterfly3j_entity_ace26e8d1a is
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
end butterfly3j_entity_ace26e8d1a;

architecture structural of butterfly3j_entity_ace26e8d1a is
  signal add_im_s_net: std_logic_vector(14 downto 0);
  signal add_re_s_net: std_logic_vector(14 downto 0);
  signal ce_1_sg_x318: std_logic;
  signal clk_1_sg_x318: std_logic;
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
  ce_1_sg_x318 <= ce_1;
  clk_1_sg_x318 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x10;
  a_b_x0 <= concat_y_net_x11;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_f4e99698eb
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_79dc8835bc
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_17f2915afa: entity work.c_to_ri_entity_3b76d00990
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_f6f4dc6241: entity work.c_to_ri_entity_3b76d00990
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
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
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

  ri_to_c1_4075506640: entity work.ri_to_c_entity_0ba748958a
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x11
    );

  ri_to_c_c22bcb0efd: entity work.ri_to_c_entity_0ba748958a
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
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f4e99698eb
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x318,
      clk => clk_1_sg_x318,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_butterfly"

entity r4_butterfly_entity_da33117be2 is
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
end r4_butterfly_entity_da33117be2;

architecture structural of r4_butterfly_entity_da33117be2 is
  signal ce_1_sg_x319: std_logic;
  signal clk_1_sg_x319: std_logic;
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
  ce_1_sg_x319 <= ce_1;
  clk_1_sg_x319 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  butterfly0_7236742b6e: entity work.butterfly0_entity_7236742b6e
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x17,
      ce_1 => ce_1_sg_x319,
      clk_1 => clk_1_sg_x319,
      a_b => concat_y_net_x9,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_a874a48525: entity work.butterfly1_entity_a874a48525
    port map (
      a => concat_y_net_x16,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x319,
      clk_1 => clk_1_sg_x319,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x10,
      a_b_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x3
    );

  butterfly2_558f6ef896: entity work.butterfly2_entity_558f6ef896
    port map (
      a => concat_y_net_x9,
      b => concat_y_net_x10,
      ce_1 => ce_1_sg_x319,
      clk_1 => clk_1_sg_x319,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_ace26e8d1a: entity work.butterfly3j_entity_ace26e8d1a
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x319,
      clk_1 => clk_1_sg_x319,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_a14e3a0825 is
  port (
    c: in std_logic_vector(25 downto 0); 
    im: out std_logic_vector(12 downto 0); 
    re: out std_logic_vector(12 downto 0)
  );
end c_to_ri_entity_a14e3a0825;

architecture structural of c_to_ri_entity_a14e3a0825 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_ac37194b4a is
  port (
    im: in std_logic_vector(12 downto 0); 
    re: in std_logic_vector(12 downto 0); 
    c: out std_logic_vector(25 downto 0)
  );
end ri_to_c_entity_ac37194b4a;

architecture structural of ri_to_c_entity_ac37194b4a is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy1"

entity cmpy1_entity_807c125e96 is
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
end cmpy1_entity_807c125e96;

architecture structural of cmpy1_entity_807c125e96 is
  signal br_add_bi_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x320: std_logic;
  signal clk_1_sg_x320: std_logic;
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
  ce_1_sg_x320 <= ce_1;
  clk_1_sg_x320 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x18;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_c0d1d84d6b
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_8bd9b60f8e: entity work.c_to_ri1_entity_7fe674c156
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_a14e3a0825: entity work.c_to_ri_entity_a14e3a0825
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
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
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
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
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
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
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
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
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
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      core_ce => ce_1_sg_x320,
      core_clk => clk_1_sg_x320,
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
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      core_ce => ce_1_sg_x320,
      core_clk => clk_1_sg_x320,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_ac37194b4a: entity work.ri_to_c_entity_ac37194b4a
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x18
    );

  rr_add_ii: entity work.addsub_a9cdc93774
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_370c0f2c47
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_5777994232
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
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
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      core_ce => ce_1_sg_x320,
      core_clk => clk_1_sg_x320,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x320,
      clk => clk_1_sg_x320,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy2"

entity cmpy2_entity_d3cec8edee is
  port (
    b: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(25 downto 0)
  );
end cmpy2_entity_d3cec8edee;

architecture structural of cmpy2_entity_d3cec8edee is
  signal br_add_bi_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x321: std_logic;
  signal clk_1_sg_x321: std_logic;
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
  ce_1_sg_x321 <= ce_1;
  clk_1_sg_x321 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x19;

  br_add_bi: entity work.addsub_c0d1d84d6b
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_e55107a511: entity work.c_to_ri1_entity_7fe674c156
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_dfc977c563: entity work.c_to_ri_entity_a14e3a0825
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
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
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
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
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
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      core_ce => ce_1_sg_x321,
      core_clk => clk_1_sg_x321,
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
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      core_ce => ce_1_sg_x321,
      core_clk => clk_1_sg_x321,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_4a2aa3e5f4: entity work.ri_to_c_entity_ac37194b4a
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_a9cdc93774
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_370c0f2c47
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_5777994232
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
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
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      core_ce => ce_1_sg_x321,
      core_clk => clk_1_sg_x321,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_d8b97c5223 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_d8b97c5223;

architecture structural of twiddle_gen1_entity_d8b97c5223 is
  signal addr_sel_y_net: std_logic_vector(3 downto 0);
  signal ce_1_sg_x323: std_logic;
  signal clk_1_sg_x323: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x13: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x323 <= ce_1;
  clk_1_sg_x323 <= clk_1;
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
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
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
      ce => ce_1_sg_x323,
      clk => clk_1_sg_x323,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_aab55de34e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_aab55de34e;

architecture structural of twiddle_gen2_entity_aab55de34e is
  signal addr_sel_y_net: std_logic_vector(3 downto 0);
  signal ce_1_sg_x324: std_logic;
  signal clk_1_sg_x324: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x14: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x324 <= ce_1;
  clk_1_sg_x324 <= clk_1;
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
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
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
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_3562354dc2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_3562354dc2;

architecture structural of twiddle_gen3_entity_3562354dc2 is
  signal addr_sel_y_net: std_logic_vector(3 downto 0);
  signal ce_1_sg_x325: std_logic;
  signal clk_1_sg_x325: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x15: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x325 <= ce_1;
  clk_1_sg_x325 <= clk_1;
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
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
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
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3/r4_twiddle"

entity r4_twiddle_entity_3751d89af1 is
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
end r4_twiddle_entity_3751d89af1;

architecture structural of r4_twiddle_entity_3751d89af1 is
  signal ce_1_sg_x326: std_logic;
  signal clk_1_sg_x326: std_logic;
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
  ce_1_sg_x326 <= ce_1;
  clk_1_sg_x326 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x16 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x22;
  dw <= concat_y_net_x23;
  sync_out <= delay_q_net_x4;

  cmpy1_807c125e96: entity work.cmpy1_entity_807c125e96
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x326,
      clk_1 => clk_1_sg_x326,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_d3cec8edee: entity work.cmpy2_entity_d3cec8edee
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x326,
      clk_1 => clk_1_sg_x326,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x22
    );

  cmpy3_937c7924be: entity work.cmpy2_entity_d3cec8edee
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x326,
      clk_1 => clk_1_sg_x326,
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
      ce => ce_1_sg_x326,
      clk => clk_1_sg_x326,
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
      ce => ce_1_sg_x326,
      clk => clk_1_sg_x326,
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
      ce => ce_1_sg_x326,
      clk => clk_1_sg_x326,
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
      ce => ce_1_sg_x326,
      clk => clk_1_sg_x326,
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
      ce => ce_1_sg_x326,
      clk => clk_1_sg_x326,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_d8b97c5223: entity work.twiddle_gen1_entity_d8b97c5223
    port map (
      ce_1 => ce_1_sg_x326,
      clk_1 => clk_1_sg_x326,
      sync_in => delay_q_net_x16,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_aab55de34e: entity work.twiddle_gen2_entity_aab55de34e
    port map (
      ce_1 => ce_1_sg_x326,
      clk_1 => clk_1_sg_x326,
      sync_in => delay_q_net_x16,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_3562354dc2: entity work.twiddle_gen3_entity_3562354dc2
    port map (
      ce_1 => ce_1_sg_x326,
      clk_1 => clk_1_sg_x326,
      sync_in => delay_q_net_x16,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_3"

entity r4_dit_stage_3_entity_2e339e97dd is
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
end r4_dit_stage_3_entity_2e339e97dd;

architecture structural of r4_dit_stage_3_entity_2e339e97dd is
  signal ce_1_sg_x327: std_logic;
  signal clk_1_sg_x327: std_logic;
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
  ce_1_sg_x327 <= ce_1;
  clk_1_sg_x327 <= clk_1;
  concat_y_net_x51 <= d_in;
  delay_q_net_x13 <= sync_in;
  a_out <= concat_y_net_x52;
  b_out <= concat_y_net_x53;
  c_out <= concat_y_net_x54;
  d_out <= concat_y_net_x55;
  sync_out <= delay_q_net_x14;

  quadplex_commutator_5766cb42d0: entity work.quadplex_commutator_entity_5766cb42d0
    port map (
      a => concat_y_net_x48,
      b => concat_y_net_x49,
      c => concat_y_net_x50,
      ce_1 => ce_1_sg_x327,
      clk_1 => clk_1_sg_x327,
      d => concat_y_net_x51,
      sync_in => delay_q_net_x13,
      abcd0 => slr_q_net_x10,
      abcd1 => mux1_y_net_x8,
      abcd2 => slr_q_net_x11,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x16
    );

  r4_butterfly_da33117be2: entity work.r4_butterfly_entity_da33117be2
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x23,
      c_in => concat_y_net_x24,
      ce_1 => ce_1_sg_x327,
      clk_1 => clk_1_sg_x327,
      d_in => concat_y_net_x25,
      sync_in => delay_q_net_x12,
      a_out => concat_y_net_x52,
      b_out => concat_y_net_x53,
      c_out => concat_y_net_x54,
      d_out => concat_y_net_x55,
      sync_out => delay_q_net_x14
    );

  r4_twiddle_3751d89af1: entity work.r4_twiddle_entity_3751d89af1
    port map (
      a_in => slr_q_net_x10,
      b => mux1_y_net_x8,
      c => slr_q_net_x11,
      ce_1 => ce_1_sg_x327,
      clk_1 => clk_1_sg_x327,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_8bec184937 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(29 downto 0); 
    out_x0: out std_logic_vector(29 downto 0)
  );
end delay_b_entity_8bec184937;

architecture structural of delay_b_entity_8bec184937 is
  signal ce_1_sg_x328: std_logic;
  signal clk_1_sg_x328: std_logic;
  signal slr_q_net_x1: std_logic_vector(29 downto 0);
  signal slr_q_net_x2: std_logic_vector(29 downto 0);

begin
  ce_1_sg_x328 <= ce_1;
  clk_1_sg_x328 <= clk_1;
  slr_q_net_x1 <= in_x0;
  out_x0 <= slr_q_net_x2;

  slr: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 30
    )
    port map (
      ce => ce_1_sg_x328,
      clk => clk_1_sg_x328,
      d => slr_q_net_x1,
      en => '1',
      q => slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_eaac85949c is
  port (
    aloahi: in std_logic_vector(29 downto 0); 
    blobhi: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(29 downto 0); 
    aloblo: out std_logic_vector(29 downto 0)
  );
end biplex_commutator_01_entity_eaac85949c;

architecture structural of biplex_commutator_01_entity_eaac85949c is
  signal ce_1_sg_x330: std_logic;
  signal clk_1_sg_x330: std_logic;
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
  ce_1_sg_x330 <= ce_1;
  clk_1_sg_x330 <= clk_1;
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
      ce => ce_1_sg_x330,
      clk => clk_1_sg_x330,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_8bec184937: entity work.delay_b_entity_8bec184937
    port map (
      ce_1 => ce_1_sg_x330,
      clk_1 => clk_1_sg_x330,
      in_x0 => slr_q_net_x4,
      out_x0 => slr_q_net_x2
    );

  delay_lo_54c5874a47: entity work.delay_b_entity_8bec184937
    port map (
      ce_1 => ce_1_sg_x330,
      clk_1 => clk_1_sg_x330,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x330,
      clk => clk_1_sg_x330,
      clr => '0',
      d0 => slr_q_net_x3,
      d1 => slr_q_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x330,
      clk => clk_1_sg_x330,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_fff0f794e5 is
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
end biplex_commutator_23_entity_fff0f794e5;

architecture structural of biplex_commutator_23_entity_fff0f794e5 is
  signal ce_1_sg_x333: std_logic;
  signal clk_1_sg_x333: std_logic;
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
  ce_1_sg_x333 <= ce_1;
  clk_1_sg_x333 <= clk_1;
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
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
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
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_85a05e2346: entity work.delay_b_entity_8bec184937
    port map (
      ce_1 => ce_1_sg_x333,
      clk_1 => clk_1_sg_x333,
      in_x0 => mux1_y_net_x3,
      out_x0 => slr_q_net_x0
    );

  delay_lo_4bf2fad737: entity work.delay_b_entity_8bec184937
    port map (
      ce_1 => ce_1_sg_x333,
      clk_1 => clk_1_sg_x333,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x2
    );

  mux: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_9f9ce9fb0d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(29 downto 0); 
    out_x0: out std_logic_vector(29 downto 0)
  );
end delay_b_entity_9f9ce9fb0d;

architecture structural of delay_b_entity_9f9ce9fb0d is
  signal ce_1_sg_x334: std_logic;
  signal clk_1_sg_x334: std_logic;
  signal concat_y_net_x55: std_logic_vector(29 downto 0);
  signal slr_q_net_x0: std_logic_vector(29 downto 0);

begin
  ce_1_sg_x334 <= ce_1;
  clk_1_sg_x334 <= clk_1;
  concat_y_net_x55 <= in_x0;
  out_x0 <= slr_q_net_x0;

  slr: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 30
    )
    port map (
      ce => ce_1_sg_x334,
      clk => clk_1_sg_x334,
      d => concat_y_net_x55,
      en => '1',
      q => slr_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_be619e3591 is
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
end biplex_commutator_ac_entity_be619e3591;

architecture structural of biplex_commutator_ac_entity_be619e3591 is
  signal ce_1_sg_x336: std_logic;
  signal clk_1_sg_x336: std_logic;
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
  ce_1_sg_x336 <= ce_1;
  clk_1_sg_x336 <= clk_1;
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
      ce => ce_1_sg_x336,
      clk => clk_1_sg_x336,
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
      ce => ce_1_sg_x336,
      clk => clk_1_sg_x336,
      d(0) => delay_q_net_x15,
      en => '1',
      q(0) => delay_q_net_x16
    );

  delay_b_9f9ce9fb0d: entity work.delay_b_entity_9f9ce9fb0d
    port map (
      ce_1 => ce_1_sg_x336,
      clk_1 => clk_1_sg_x336,
      in_x0 => concat_y_net_x57,
      out_x0 => slr_q_net_x0
    );

  delay_lo_a4075e5827: entity work.delay_b_entity_9f9ce9fb0d
    port map (
      ce_1 => ce_1_sg_x336,
      clk_1 => clk_1_sg_x336,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x336,
      clk => clk_1_sg_x336,
      clr => '0',
      d0 => concat_y_net_x56,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_458eaa1690
    port map (
      ce => ce_1_sg_x336,
      clk => clk_1_sg_x336,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator"

entity quadplex_commutator_entity_e1467df2f4 is
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
end quadplex_commutator_entity_e1467df2f4;

architecture structural of quadplex_commutator_entity_e1467df2f4 is
  signal ce_1_sg_x340: std_logic;
  signal clk_1_sg_x340: std_logic;
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
  ce_1_sg_x340 <= ce_1;
  clk_1_sg_x340 <= clk_1;
  concat_y_net_x63 <= d;
  delay_q_net_x19 <= sync_in;
  abcd0 <= slr_q_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= slr_q_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x20;

  biplex_commutator_01_eaac85949c: entity work.biplex_commutator_01_entity_eaac85949c
    port map (
      aloahi => slr_q_net_x6,
      blobhi => slr_q_net_x7,
      ce_1 => ce_1_sg_x340,
      clk_1 => clk_1_sg_x340,
      sync_in => delay_q_net_x17,
      ahibhi => mux1_y_net_x6,
      aloblo => slr_q_net_x8
    );

  biplex_commutator_23_fff0f794e5: entity work.biplex_commutator_23_entity_fff0f794e5
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x340,
      clk_1 => clk_1_sg_x340,
      sync_in => delay_q_net_x18,
      ahibhi => mux1_y_net_x7,
      aloblo => slr_q_net_x9,
      sync_out => delay_q_net_x20
    );

  biplex_commutator_ac_be619e3591: entity work.biplex_commutator_ac_entity_be619e3591
    port map (
      aloahi => concat_y_net_x60,
      blobhi => concat_y_net_x62,
      ce_1 => ce_1_sg_x340,
      clk_1 => clk_1_sg_x340,
      sync_in => delay_q_net_x19,
      ahibhi => mux1_y_net_x3,
      aloblo => slr_q_net_x6,
      sync_out => delay_q_net_x17
    );

  biplex_commutator_bd_2cc0407482: entity work.biplex_commutator_ac_entity_be619e3591
    port map (
      aloahi => concat_y_net_x61,
      blobhi => concat_y_net_x63,
      ce_1 => ce_1_sg_x340,
      clk_1 => clk_1_sg_x340,
      sync_in => delay_q_net_x19,
      ahibhi => mux1_y_net_x5,
      aloblo => slr_q_net_x7,
      sync_out => delay_q_net_x18
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_57e270bed1 is
  port (
    c: in std_logic_vector(29 downto 0); 
    im: out std_logic_vector(14 downto 0); 
    re: out std_logic_vector(14 downto 0)
  );
end c_to_ri_entity_57e270bed1;

architecture structural of c_to_ri_entity_57e270bed1 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_25be5da4bb is
  port (
    im: in std_logic_vector(15 downto 0); 
    re: in std_logic_vector(15 downto 0); 
    c: out std_logic_vector(31 downto 0)
  );
end ri_to_c_entity_25be5da4bb;

architecture structural of ri_to_c_entity_25be5da4bb is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly0"

entity butterfly0_entity_bb3478fb88 is
  port (
    a: in std_logic_vector(29 downto 0); 
    b: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(31 downto 0); 
    a_b_x0: out std_logic_vector(31 downto 0)
  );
end butterfly0_entity_bb3478fb88;

architecture structural of butterfly0_entity_bb3478fb88 is
  signal add_im_s_net: std_logic_vector(15 downto 0);
  signal add_re_s_net: std_logic_vector(15 downto 0);
  signal ce_1_sg_x341: std_logic;
  signal clk_1_sg_x341: std_logic;
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
  ce_1_sg_x341 <= ce_1;
  clk_1_sg_x341 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_e8bb7c4e8b
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x341,
      clk => clk_1_sg_x341,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_e8bb7c4e8b
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x341,
      clk => clk_1_sg_x341,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_37a4356664: entity work.c_to_ri_entity_57e270bed1
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_57e270bed1: entity work.c_to_ri_entity_57e270bed1
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

  ri_to_c1_dba0bce083: entity work.ri_to_c_entity_25be5da4bb
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_25be5da4bb: entity work.ri_to_c_entity_25be5da4bb
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
      ce => ce_1_sg_x341,
      clk => clk_1_sg_x341,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_81ed09e952
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x341,
      clk => clk_1_sg_x341,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly1"

entity butterfly1_entity_48108caaa1 is
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
end butterfly1_entity_48108caaa1;

architecture structural of butterfly1_entity_48108caaa1 is
  signal add_im_s_net: std_logic_vector(15 downto 0);
  signal add_re_s_net: std_logic_vector(15 downto 0);
  signal ce_1_sg_x342: std_logic;
  signal clk_1_sg_x342: std_logic;
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
  ce_1_sg_x342 <= ce_1;
  clk_1_sg_x342 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_e8bb7c4e8b
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x342,
      clk => clk_1_sg_x342,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_e8bb7c4e8b
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x342,
      clk => clk_1_sg_x342,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_a8bbef38a6: entity work.c_to_ri_entity_57e270bed1
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_750757208e: entity work.c_to_ri_entity_57e270bed1
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
      ce => ce_1_sg_x342,
      clk => clk_1_sg_x342,
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

  ri_to_c1_fedf1fc5a2: entity work.ri_to_c_entity_25be5da4bb
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_a014d8fb1f: entity work.ri_to_c_entity_25be5da4bb
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
      ce => ce_1_sg_x342,
      clk => clk_1_sg_x342,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_81ed09e952
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x342,
      clk => clk_1_sg_x342,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_9e5ab6b1ae is
  port (
    c: in std_logic_vector(31 downto 0); 
    im: out std_logic_vector(15 downto 0); 
    re: out std_logic_vector(15 downto 0)
  );
end c_to_ri_entity_9e5ab6b1ae;

architecture structural of c_to_ri_entity_9e5ab6b1ae is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_e063d0f593 is
  port (
    im: in std_logic_vector(16 downto 0); 
    re: in std_logic_vector(16 downto 0); 
    c: out std_logic_vector(33 downto 0)
  );
end ri_to_c_entity_e063d0f593;

architecture structural of ri_to_c_entity_e063d0f593 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly2"

entity butterfly2_entity_03175731b5 is
  port (
    a: in std_logic_vector(31 downto 0); 
    b: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(33 downto 0); 
    a_b_x0: out std_logic_vector(33 downto 0)
  );
end butterfly2_entity_03175731b5;

architecture structural of butterfly2_entity_03175731b5 is
  signal add_im_s_net: std_logic_vector(16 downto 0);
  signal add_re_s_net: std_logic_vector(16 downto 0);
  signal ce_1_sg_x343: std_logic;
  signal clk_1_sg_x343: std_logic;
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
  ce_1_sg_x343 <= ce_1;
  clk_1_sg_x343 <= clk_1;
  a_b <= concat_y_net_x11;
  a_b_x0 <= concat_y_net_x12;

  add_im: entity work.addsub_14b004d38d
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x343,
      clk => clk_1_sg_x343,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_14b004d38d
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x343,
      clk => clk_1_sg_x343,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_b49805bb0c: entity work.c_to_ri_entity_9e5ab6b1ae
    port map (
      c => concat_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_9e5ab6b1ae: entity work.c_to_ri_entity_9e5ab6b1ae
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

  ri_to_c1_41aab30747: entity work.ri_to_c_entity_e063d0f593
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x12
    );

  ri_to_c_e063d0f593: entity work.ri_to_c_entity_e063d0f593
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
      ce => ce_1_sg_x343,
      clk => clk_1_sg_x343,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_5d0bd43700
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly3j"

entity butterfly3j_entity_bc72a40e93 is
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
end butterfly3j_entity_bc72a40e93;

architecture structural of butterfly3j_entity_bc72a40e93 is
  signal add_im_s_net: std_logic_vector(16 downto 0);
  signal add_re_s_net: std_logic_vector(16 downto 0);
  signal ce_1_sg_x344: std_logic;
  signal clk_1_sg_x344: std_logic;
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
  ce_1_sg_x344 <= ce_1;
  clk_1_sg_x344 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x10;
  a_b_x0 <= concat_y_net_x11;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_5d0bd43700
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x344,
      clk => clk_1_sg_x344,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_14b004d38d
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x344,
      clk => clk_1_sg_x344,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_fd29c655b0: entity work.c_to_ri_entity_9e5ab6b1ae
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_aa8291571b: entity work.c_to_ri_entity_9e5ab6b1ae
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
      ce => ce_1_sg_x344,
      clk => clk_1_sg_x344,
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

  ri_to_c1_6fcaeb9478: entity work.ri_to_c_entity_e063d0f593
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x11
    );

  ri_to_c_0488806938: entity work.ri_to_c_entity_e063d0f593
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
      ce => ce_1_sg_x344,
      clk => clk_1_sg_x344,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_5d0bd43700
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x344,
      clk => clk_1_sg_x344,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_butterfly"

entity r4_butterfly_entity_0ab8bacc2c is
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
end r4_butterfly_entity_0ab8bacc2c;

architecture structural of r4_butterfly_entity_0ab8bacc2c is
  signal ce_1_sg_x345: std_logic;
  signal clk_1_sg_x345: std_logic;
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
  ce_1_sg_x345 <= ce_1;
  clk_1_sg_x345 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  butterfly0_bb3478fb88: entity work.butterfly0_entity_bb3478fb88
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x17,
      ce_1 => ce_1_sg_x345,
      clk_1 => clk_1_sg_x345,
      a_b => concat_y_net_x9,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_48108caaa1: entity work.butterfly1_entity_48108caaa1
    port map (
      a => concat_y_net_x16,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x345,
      clk_1 => clk_1_sg_x345,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x10,
      a_b_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x3
    );

  butterfly2_03175731b5: entity work.butterfly2_entity_03175731b5
    port map (
      a => concat_y_net_x9,
      b => concat_y_net_x10,
      ce_1 => ce_1_sg_x345,
      clk_1 => clk_1_sg_x345,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_bc72a40e93: entity work.butterfly3j_entity_bc72a40e93
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x345,
      clk_1 => clk_1_sg_x345,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_b773420e76 is
  port (
    c: in std_logic_vector(29 downto 0); 
    im: out std_logic_vector(14 downto 0); 
    re: out std_logic_vector(14 downto 0)
  );
end c_to_ri_entity_b773420e76;

architecture structural of c_to_ri_entity_b773420e76 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_37144ab30f is
  port (
    im: in std_logic_vector(14 downto 0); 
    re: in std_logic_vector(14 downto 0); 
    c: out std_logic_vector(29 downto 0)
  );
end ri_to_c_entity_37144ab30f;

architecture structural of ri_to_c_entity_37144ab30f is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy1"

entity cmpy1_entity_f1024babbe is
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
end cmpy1_entity_f1024babbe;

architecture structural of cmpy1_entity_f1024babbe is
  signal br_add_bi_s_net: std_logic_vector(15 downto 0);
  signal ce_1_sg_x346: std_logic;
  signal clk_1_sg_x346: std_logic;
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
  ce_1_sg_x346 <= ce_1;
  clk_1_sg_x346 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x18;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_24b2bc78a0
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_84c76a8133: entity work.c_to_ri1_entity_7fe674c156
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_b773420e76: entity work.c_to_ri_entity_b773420e76
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
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
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
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
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
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
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
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
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
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      core_ce => ce_1_sg_x346,
      core_clk => clk_1_sg_x346,
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
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      core_ce => ce_1_sg_x346,
      core_clk => clk_1_sg_x346,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_37144ab30f: entity work.ri_to_c_entity_37144ab30f
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x18
    );

  rr_add_ii: entity work.addsub_c7058621d7
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_977ed7b8a2
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_0f2f4c67a4
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
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
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      core_ce => ce_1_sg_x346,
      core_clk => clk_1_sg_x346,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x346,
      clk => clk_1_sg_x346,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy2"

entity cmpy2_entity_0fb3561415 is
  port (
    b: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(29 downto 0)
  );
end cmpy2_entity_0fb3561415;

architecture structural of cmpy2_entity_0fb3561415 is
  signal br_add_bi_s_net: std_logic_vector(15 downto 0);
  signal ce_1_sg_x347: std_logic;
  signal clk_1_sg_x347: std_logic;
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
  ce_1_sg_x347 <= ce_1;
  clk_1_sg_x347 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x19;

  br_add_bi: entity work.addsub_24b2bc78a0
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_20a6e15328: entity work.c_to_ri1_entity_7fe674c156
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_8dd3bf6675: entity work.c_to_ri_entity_b773420e76
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
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
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
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
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
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
      clr => '0',
      core_ce => ce_1_sg_x347,
      core_clk => clk_1_sg_x347,
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
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
      clr => '0',
      core_ce => ce_1_sg_x347,
      core_clk => clk_1_sg_x347,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_60f6727aff: entity work.ri_to_c_entity_37144ab30f
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_c7058621d7
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_977ed7b8a2
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_0f2f4c67a4
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
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
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
      clr => '0',
      core_ce => ce_1_sg_x347,
      core_clk => clk_1_sg_x347,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_3a83a45804 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_3a83a45804;

architecture structural of twiddle_gen1_entity_3a83a45804 is
  signal addr_sel_y_net: std_logic_vector(5 downto 0);
  signal ce_1_sg_x349: std_logic;
  signal clk_1_sg_x349: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x21: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x349 <= ce_1;
  clk_1_sg_x349 <= clk_1;
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
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
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
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_25e549652a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_25e549652a;

architecture structural of twiddle_gen2_entity_25e549652a is
  signal addr_sel_y_net: std_logic_vector(5 downto 0);
  signal ce_1_sg_x350: std_logic;
  signal clk_1_sg_x350: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x22: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x350 <= ce_1;
  clk_1_sg_x350 <= clk_1;
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
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
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
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_af5898bf4e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_af5898bf4e;

architecture structural of twiddle_gen3_entity_af5898bf4e is
  signal addr_sel_y_net: std_logic_vector(5 downto 0);
  signal ce_1_sg_x351: std_logic;
  signal clk_1_sg_x351: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x23: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x351 <= ce_1;
  clk_1_sg_x351 <= clk_1;
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
      ce => ce_1_sg_x351,
      clk => clk_1_sg_x351,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4/r4_twiddle"

entity r4_twiddle_entity_f1f6e73f6c is
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
end r4_twiddle_entity_f1f6e73f6c;

architecture structural of r4_twiddle_entity_f1f6e73f6c is
  signal ce_1_sg_x352: std_logic;
  signal clk_1_sg_x352: std_logic;
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
  ce_1_sg_x352 <= ce_1;
  clk_1_sg_x352 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x24 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x22;
  dw <= concat_y_net_x23;
  sync_out <= delay_q_net_x4;

  cmpy1_f1024babbe: entity work.cmpy1_entity_f1024babbe
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x352,
      clk_1 => clk_1_sg_x352,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_0fb3561415: entity work.cmpy2_entity_0fb3561415
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x352,
      clk_1 => clk_1_sg_x352,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x22
    );

  cmpy3_a245edc9f1: entity work.cmpy2_entity_0fb3561415
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x352,
      clk_1 => clk_1_sg_x352,
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
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
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
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
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
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
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
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
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
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_3a83a45804: entity work.twiddle_gen1_entity_3a83a45804
    port map (
      ce_1 => ce_1_sg_x352,
      clk_1 => clk_1_sg_x352,
      sync_in => delay_q_net_x24,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_25e549652a: entity work.twiddle_gen2_entity_25e549652a
    port map (
      ce_1 => ce_1_sg_x352,
      clk_1 => clk_1_sg_x352,
      sync_in => delay_q_net_x24,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_af5898bf4e: entity work.twiddle_gen3_entity_af5898bf4e
    port map (
      ce_1 => ce_1_sg_x352,
      clk_1 => clk_1_sg_x352,
      sync_in => delay_q_net_x24,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_4"

entity r4_dit_stage_4_entity_fc2110268b is
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
end r4_dit_stage_4_entity_fc2110268b;

architecture structural of r4_dit_stage_4_entity_fc2110268b is
  signal ce_1_sg_x353: std_logic;
  signal clk_1_sg_x353: std_logic;
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
  ce_1_sg_x353 <= ce_1;
  clk_1_sg_x353 <= clk_1;
  concat_y_net_x67 <= d_in;
  delay_q_net_x21 <= sync_in;
  a_out <= concat_y_net_x26;
  b_out <= concat_y_net_x27;
  c_out <= concat_y_net_x28;
  d_out <= concat_y_net_x29;
  sync_out <= delay_q_net_x22;

  quadplex_commutator_e1467df2f4: entity work.quadplex_commutator_entity_e1467df2f4
    port map (
      a => concat_y_net_x64,
      b => concat_y_net_x65,
      c => concat_y_net_x66,
      ce_1 => ce_1_sg_x353,
      clk_1 => clk_1_sg_x353,
      d => concat_y_net_x67,
      sync_in => delay_q_net_x21,
      abcd0 => slr_q_net_x10,
      abcd1 => mux1_y_net_x8,
      abcd2 => slr_q_net_x11,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x24
    );

  r4_butterfly_0ab8bacc2c: entity work.r4_butterfly_entity_0ab8bacc2c
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x23,
      c_in => concat_y_net_x24,
      ce_1 => ce_1_sg_x353,
      clk_1 => clk_1_sg_x353,
      d_in => concat_y_net_x25,
      sync_in => delay_q_net_x20,
      a_out => concat_y_net_x26,
      b_out => concat_y_net_x27,
      c_out => concat_y_net_x28,
      d_out => concat_y_net_x29,
      sync_out => delay_q_net_x22
    );

  r4_twiddle_f1f6e73f6c: entity work.r4_twiddle_entity_f1f6e73f6c
    port map (
      a_in => slr_q_net_x10,
      b => mux1_y_net_x8,
      c => slr_q_net_x11,
      ce_1 => ce_1_sg_x353,
      clk_1 => clk_1_sg_x353,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_333926c402 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(33 downto 0); 
    out_x0: out std_logic_vector(33 downto 0)
  );
end delay_b_entity_333926c402;

architecture structural of delay_b_entity_333926c402 is
  signal ce_1_sg_x354: std_logic;
  signal clk_1_sg_x354: std_logic;
  signal slr_q_net_x1: std_logic_vector(33 downto 0);
  signal slr_q_net_x2: std_logic_vector(33 downto 0);

begin
  ce_1_sg_x354 <= ce_1;
  clk_1_sg_x354 <= clk_1;
  slr_q_net_x1 <= in_x0;
  out_x0 <= slr_q_net_x2;

  slr: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d => slr_q_net_x1,
      en => '1',
      q => slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_aa2e066db0 is
  port (
    aloahi: in std_logic_vector(33 downto 0); 
    blobhi: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(33 downto 0); 
    aloblo: out std_logic_vector(33 downto 0)
  );
end biplex_commutator_01_entity_aa2e066db0;

architecture structural of biplex_commutator_01_entity_aa2e066db0 is
  signal ce_1_sg_x356: std_logic;
  signal clk_1_sg_x356: std_logic;
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
  ce_1_sg_x356 <= ce_1;
  clk_1_sg_x356 <= clk_1;
  delay_q_net_x0 <= sync_in;
  ahibhi <= mux1_y_net_x0;
  aloblo <= slr_q_net_x5;

  counter: entity work.counter_9b03e3d644
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
      clr => '0',
      rst(0) => delay_q_net_x0,
      op(0) => counter_op_net
    );

  delay_b_333926c402: entity work.delay_b_entity_333926c402
    port map (
      ce_1 => ce_1_sg_x356,
      clk_1 => clk_1_sg_x356,
      in_x0 => slr_q_net_x4,
      out_x0 => slr_q_net_x2
    );

  delay_lo_167ab02da7: entity work.delay_b_entity_333926c402
    port map (
      ce_1 => ce_1_sg_x356,
      clk_1 => clk_1_sg_x356,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
      clr => '0',
      d0 => slr_q_net_x3,
      d1 => slr_q_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_4f62580056 is
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
end biplex_commutator_23_entity_4f62580056;

architecture structural of biplex_commutator_23_entity_4f62580056 is
  signal ce_1_sg_x359: std_logic;
  signal clk_1_sg_x359: std_logic;
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
  ce_1_sg_x359 <= ce_1;
  clk_1_sg_x359 <= clk_1;
  delay_q_net_x1 <= sync_in;
  ahibhi <= mux1_y_net_x4;
  aloblo <= slr_q_net_x2;
  sync_out <= delay_q_net_x2;

  counter: entity work.counter_9b03e3d644
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
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
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_ff8f0a7ac7: entity work.delay_b_entity_333926c402
    port map (
      ce_1 => ce_1_sg_x359,
      clk_1 => clk_1_sg_x359,
      in_x0 => mux1_y_net_x3,
      out_x0 => slr_q_net_x0
    );

  delay_lo_9987c068de: entity work.delay_b_entity_333926c402
    port map (
      ce_1 => ce_1_sg_x359,
      clk_1 => clk_1_sg_x359,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x2
    );

  mux: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_38482719d8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(33 downto 0); 
    out_x0: out std_logic_vector(33 downto 0)
  );
end delay_b_entity_38482719d8;

architecture structural of delay_b_entity_38482719d8 is
  signal ce_1_sg_x360: std_logic;
  signal clk_1_sg_x360: std_logic;
  signal concat_y_net_x29: std_logic_vector(33 downto 0);
  signal slr_q_net_x0: std_logic_vector(33 downto 0);

begin
  ce_1_sg_x360 <= ce_1;
  clk_1_sg_x360 <= clk_1;
  concat_y_net_x29 <= in_x0;
  out_x0 <= slr_q_net_x0;

  slr: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 34
    )
    port map (
      ce => ce_1_sg_x360,
      clk => clk_1_sg_x360,
      d => concat_y_net_x29,
      en => '1',
      q => slr_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_378fd9341a is
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
end biplex_commutator_ac_entity_378fd9341a;

architecture structural of biplex_commutator_ac_entity_378fd9341a is
  signal ce_1_sg_x362: std_logic;
  signal clk_1_sg_x362: std_logic;
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
  ce_1_sg_x362 <= ce_1;
  clk_1_sg_x362 <= clk_1;
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
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
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
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      d(0) => delay_q_net_x23,
      en => '1',
      q(0) => delay_q_net_x1
    );

  delay_b_38482719d8: entity work.delay_b_entity_38482719d8
    port map (
      ce_1 => ce_1_sg_x362,
      clk_1 => clk_1_sg_x362,
      in_x0 => concat_y_net_x31,
      out_x0 => slr_q_net_x0
    );

  delay_lo_7c6666e9e7: entity work.delay_b_entity_38482719d8
    port map (
      ce_1 => ce_1_sg_x362,
      clk_1 => clk_1_sg_x362,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      d0 => concat_y_net_x30,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_22ce705a06
    port map (
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator"

entity quadplex_commutator_entity_d78550bc5d is
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
end quadplex_commutator_entity_d78550bc5d;

architecture structural of quadplex_commutator_entity_d78550bc5d is
  signal ce_1_sg_x366: std_logic;
  signal clk_1_sg_x366: std_logic;
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
  ce_1_sg_x366 <= ce_1;
  clk_1_sg_x366 <= clk_1;
  concat_y_net_x37 <= d;
  delay_q_net_x25 <= sync_in;
  abcd0 <= slr_q_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= slr_q_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x4;

  biplex_commutator_01_aa2e066db0: entity work.biplex_commutator_01_entity_aa2e066db0
    port map (
      aloahi => slr_q_net_x6,
      blobhi => slr_q_net_x7,
      ce_1 => ce_1_sg_x366,
      clk_1 => clk_1_sg_x366,
      sync_in => delay_q_net_x1,
      ahibhi => mux1_y_net_x6,
      aloblo => slr_q_net_x8
    );

  biplex_commutator_23_4f62580056: entity work.biplex_commutator_23_entity_4f62580056
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x366,
      clk_1 => clk_1_sg_x366,
      sync_in => delay_q_net_x3,
      ahibhi => mux1_y_net_x7,
      aloblo => slr_q_net_x9,
      sync_out => delay_q_net_x4
    );

  biplex_commutator_ac_378fd9341a: entity work.biplex_commutator_ac_entity_378fd9341a
    port map (
      aloahi => concat_y_net_x34,
      blobhi => concat_y_net_x36,
      ce_1 => ce_1_sg_x366,
      clk_1 => clk_1_sg_x366,
      sync_in => delay_q_net_x25,
      ahibhi => mux1_y_net_x3,
      aloblo => slr_q_net_x6,
      sync_out => delay_q_net_x1
    );

  biplex_commutator_bd_e182027a9d: entity work.biplex_commutator_ac_entity_378fd9341a
    port map (
      aloahi => concat_y_net_x35,
      blobhi => concat_y_net_x37,
      ce_1 => ce_1_sg_x366,
      clk_1 => clk_1_sg_x366,
      sync_in => delay_q_net_x25,
      ahibhi => mux1_y_net_x5,
      aloblo => slr_q_net_x7,
      sync_out => delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_1bbe6e78b8 is
  port (
    c: in std_logic_vector(33 downto 0); 
    im: out std_logic_vector(16 downto 0); 
    re: out std_logic_vector(16 downto 0)
  );
end c_to_ri_entity_1bbe6e78b8;

architecture structural of c_to_ri_entity_1bbe6e78b8 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_cedf3c063c is
  port (
    im: in std_logic_vector(17 downto 0); 
    re: in std_logic_vector(17 downto 0); 
    c: out std_logic_vector(35 downto 0)
  );
end ri_to_c_entity_cedf3c063c;

architecture structural of ri_to_c_entity_cedf3c063c is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly0"

entity butterfly0_entity_933d7106fd is
  port (
    a: in std_logic_vector(33 downto 0); 
    b: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(35 downto 0); 
    a_b_x0: out std_logic_vector(35 downto 0)
  );
end butterfly0_entity_933d7106fd;

architecture structural of butterfly0_entity_933d7106fd is
  signal add_im_s_net: std_logic_vector(17 downto 0);
  signal add_re_s_net: std_logic_vector(17 downto 0);
  signal ce_1_sg_x367: std_logic;
  signal clk_1_sg_x367: std_logic;
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
  ce_1_sg_x367 <= ce_1;
  clk_1_sg_x367 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_ed5d62a19c
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x367,
      clk => clk_1_sg_x367,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_ed5d62a19c
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x367,
      clk => clk_1_sg_x367,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_d78a36069f: entity work.c_to_ri_entity_1bbe6e78b8
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_1bbe6e78b8: entity work.c_to_ri_entity_1bbe6e78b8
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

  ri_to_c1_3dbf498c82: entity work.ri_to_c_entity_cedf3c063c
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_cedf3c063c: entity work.ri_to_c_entity_cedf3c063c
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
      ce => ce_1_sg_x367,
      clk => clk_1_sg_x367,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_cc9a7f7bbc
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x367,
      clk => clk_1_sg_x367,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly1"

entity butterfly1_entity_0243493c71 is
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
end butterfly1_entity_0243493c71;

architecture structural of butterfly1_entity_0243493c71 is
  signal add_im_s_net: std_logic_vector(17 downto 0);
  signal add_re_s_net: std_logic_vector(17 downto 0);
  signal ce_1_sg_x368: std_logic;
  signal clk_1_sg_x368: std_logic;
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
  ce_1_sg_x368 <= ce_1;
  clk_1_sg_x368 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_ed5d62a19c
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_ed5d62a19c
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_e7f292dae8: entity work.c_to_ri_entity_1bbe6e78b8
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_ccffbf7b86: entity work.c_to_ri_entity_1bbe6e78b8
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
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
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

  ri_to_c1_c4fe9966ce: entity work.ri_to_c_entity_cedf3c063c
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_989f7eec0e: entity work.ri_to_c_entity_cedf3c063c
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
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_cc9a7f7bbc
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_c19f9d131d is
  port (
    c: in std_logic_vector(35 downto 0); 
    im: out std_logic_vector(17 downto 0); 
    re: out std_logic_vector(17 downto 0)
  );
end c_to_ri_entity_c19f9d131d;

architecture structural of c_to_ri_entity_c19f9d131d is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly2"

entity butterfly2_entity_0ba5dcbedc is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(37 downto 0); 
    a_b_x0: out std_logic_vector(37 downto 0)
  );
end butterfly2_entity_0ba5dcbedc;

architecture structural of butterfly2_entity_0ba5dcbedc is
  signal add_im_s_net: std_logic_vector(18 downto 0);
  signal add_re_s_net: std_logic_vector(18 downto 0);
  signal ce_1_sg_x369: std_logic;
  signal clk_1_sg_x369: std_logic;
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
  ce_1_sg_x369 <= ce_1;
  clk_1_sg_x369 <= clk_1;
  a_b <= concat_y_net_x12;
  a_b_x0 <= concat_y_net_x16;

  add_im: entity work.addsub_f10bd79bfe
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x369,
      clk => clk_1_sg_x369,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_f10bd79bfe
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x369,
      clk => clk_1_sg_x369,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_a5818fc9cb: entity work.c_to_ri_entity_c19f9d131d
    port map (
      c => concat_y_net_x11,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_c19f9d131d: entity work.c_to_ri_entity_c19f9d131d
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

  ri_to_c1_9866e25a0b: entity work.ri_to_c_entity_b3a6a3c041
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x16
    );

  ri_to_c_cfd2a6ed55: entity work.ri_to_c_entity_b3a6a3c041
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
      ce => ce_1_sg_x369,
      clk => clk_1_sg_x369,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f5776ffb7e
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x369,
      clk => clk_1_sg_x369,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly3j"

entity butterfly3j_entity_2af76feb3d is
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
end butterfly3j_entity_2af76feb3d;

architecture structural of butterfly3j_entity_2af76feb3d is
  signal add_im_s_net: std_logic_vector(18 downto 0);
  signal add_re_s_net: std_logic_vector(18 downto 0);
  signal ce_1_sg_x370: std_logic;
  signal clk_1_sg_x370: std_logic;
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
  ce_1_sg_x370 <= ce_1;
  clk_1_sg_x370 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x14;
  a_b_x0 <= concat_y_net_x15;
  sync_out <= delay_q_net_x7;

  add_im: entity work.addsub_f5776ffb7e
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x370,
      clk => clk_1_sg_x370,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_f10bd79bfe
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x370,
      clk => clk_1_sg_x370,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_0b5a2d4f21: entity work.c_to_ri_entity_c19f9d131d
    port map (
      c => concat_y_net_x13,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_4d75e6fc64: entity work.c_to_ri_entity_c19f9d131d
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
      ce => ce_1_sg_x370,
      clk => clk_1_sg_x370,
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

  ri_to_c1_9294dd1b38: entity work.ri_to_c_entity_b3a6a3c041
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x15
    );

  ri_to_c_b69f8abefb: entity work.ri_to_c_entity_b3a6a3c041
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
      ce => ce_1_sg_x370,
      clk => clk_1_sg_x370,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f5776ffb7e
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x370,
      clk => clk_1_sg_x370,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_butterfly"

entity r4_butterfly_entity_26888c8657 is
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
end r4_butterfly_entity_26888c8657;

architecture structural of r4_butterfly_entity_26888c8657 is
  signal ce_1_sg_x371: std_logic;
  signal clk_1_sg_x371: std_logic;
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
  ce_1_sg_x371 <= ce_1;
  clk_1_sg_x371 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x8;

  butterfly0_933d7106fd: entity work.butterfly0_entity_933d7106fd
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x8,
      ce_1 => ce_1_sg_x371,
      clk_1 => clk_1_sg_x371,
      a_b => concat_y_net_x6,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_0243493c71: entity work.butterfly1_entity_0243493c71
    port map (
      a => concat_y_net_x17,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x371,
      clk_1 => clk_1_sg_x371,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x11,
      a_b_x0 => concat_y_net_x13,
      sync_out => delay_q_net_x3
    );

  butterfly2_0ba5dcbedc: entity work.butterfly2_entity_0ba5dcbedc
    port map (
      a => concat_y_net_x6,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x371,
      clk_1 => clk_1_sg_x371,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_2af76feb3d: entity work.butterfly3j_entity_2af76feb3d
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x13,
      ce_1 => ce_1_sg_x371,
      clk_1 => clk_1_sg_x371,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x8
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_d18766a8ff is
  port (
    c: in std_logic_vector(33 downto 0); 
    im: out std_logic_vector(16 downto 0); 
    re: out std_logic_vector(16 downto 0)
  );
end c_to_ri_entity_d18766a8ff;

architecture structural of c_to_ri_entity_d18766a8ff is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_8c65311040 is
  port (
    im: in std_logic_vector(16 downto 0); 
    re: in std_logic_vector(16 downto 0); 
    c: out std_logic_vector(33 downto 0)
  );
end ri_to_c_entity_8c65311040;

architecture structural of ri_to_c_entity_8c65311040 is
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy1"

entity cmpy1_entity_26dbc807fe is
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
end cmpy1_entity_26dbc807fe;

architecture structural of cmpy1_entity_26dbc807fe is
  signal br_add_bi_s_net: std_logic_vector(17 downto 0);
  signal ce_1_sg_x372: std_logic;
  signal clk_1_sg_x372: std_logic;
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
  ce_1_sg_x372 <= ce_1;
  clk_1_sg_x372 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x19;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_555b5d0c45
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_a54cb4e736: entity work.c_to_ri1_entity_7fe674c156
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_d18766a8ff: entity work.c_to_ri_entity_d18766a8ff
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
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
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
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
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
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
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
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
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
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
      clr => '0',
      core_ce => ce_1_sg_x372,
      core_clk => clk_1_sg_x372,
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
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
      clr => '0',
      core_ce => ce_1_sg_x372,
      core_clk => clk_1_sg_x372,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_8c65311040: entity work.ri_to_c_entity_8c65311040
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_a90e22f5f3
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_0b3c6c31ef
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_50f49c147d
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
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
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
      clr => '0',
      core_ce => ce_1_sg_x372,
      core_clk => clk_1_sg_x372,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x372,
      clk => clk_1_sg_x372,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy2"

entity cmpy2_entity_723418a7ae is
  port (
    b: in std_logic_vector(33 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(33 downto 0)
  );
end cmpy2_entity_723418a7ae;

architecture structural of cmpy2_entity_723418a7ae is
  signal br_add_bi_s_net: std_logic_vector(17 downto 0);
  signal ce_1_sg_x373: std_logic;
  signal clk_1_sg_x373: std_logic;
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
  ce_1_sg_x373 <= ce_1;
  clk_1_sg_x373 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x10;

  br_add_bi: entity work.addsub_555b5d0c45
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_cfda1952bd: entity work.c_to_ri1_entity_7fe674c156
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_30ee1941cb: entity work.c_to_ri_entity_d18766a8ff
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
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
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
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
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
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
      clr => '0',
      core_ce => ce_1_sg_x373,
      core_clk => clk_1_sg_x373,
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
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
      clr => '0',
      core_ce => ce_1_sg_x373,
      core_clk => clk_1_sg_x373,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_bfe54de313: entity work.ri_to_c_entity_8c65311040
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x10
    );

  rr_add_ii: entity work.addsub_a90e22f5f3
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_0b3c6c31ef
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_50f49c147d
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
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
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
      clr => '0',
      core_ce => ce_1_sg_x373,
      core_clk => clk_1_sg_x373,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_2f4e4017fc is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_2f4e4017fc;

architecture structural of twiddle_gen1_entity_2f4e4017fc is
  signal addr_sel_y_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x375: std_logic;
  signal clk_1_sg_x375: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x5: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x375 <= ce_1;
  clk_1_sg_x375 <= clk_1;
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
      ce => ce_1_sg_x375,
      clk => clk_1_sg_x375,
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
      ce => ce_1_sg_x375,
      clk => clk_1_sg_x375,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_bd86017793 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_bd86017793;

architecture structural of twiddle_gen2_entity_bd86017793 is
  signal addr_sel_y_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x376: std_logic;
  signal clk_1_sg_x376: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x6: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x376 <= ce_1;
  clk_1_sg_x376 <= clk_1;
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
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
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
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_ff724eec4e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_ff724eec4e;

architecture structural of twiddle_gen3_entity_ff724eec4e is
  signal addr_sel_y_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x377: std_logic;
  signal clk_1_sg_x377: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x7: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x377 <= ce_1;
  clk_1_sg_x377 <= clk_1;
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
      ce => ce_1_sg_x377,
      clk => clk_1_sg_x377,
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
      ce => ce_1_sg_x377,
      clk => clk_1_sg_x377,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5/r4_twiddle"

entity r4_twiddle_entity_a297e404cd is
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
end r4_twiddle_entity_a297e404cd;

architecture structural of r4_twiddle_entity_a297e404cd is
  signal ce_1_sg_x378: std_logic;
  signal clk_1_sg_x378: std_logic;
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
  ce_1_sg_x378 <= ce_1;
  clk_1_sg_x378 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x8 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x11;
  dw <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  cmpy1_26dbc807fe: entity work.cmpy1_entity_26dbc807fe
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x378,
      clk_1 => clk_1_sg_x378,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_723418a7ae: entity work.cmpy2_entity_723418a7ae
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x378,
      clk_1 => clk_1_sg_x378,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x11
    );

  cmpy3_050c2401b1: entity work.cmpy2_entity_723418a7ae
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x378,
      clk_1 => clk_1_sg_x378,
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
      ce => ce_1_sg_x378,
      clk => clk_1_sg_x378,
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
      ce => ce_1_sg_x378,
      clk => clk_1_sg_x378,
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
      ce => ce_1_sg_x378,
      clk => clk_1_sg_x378,
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
      ce => ce_1_sg_x378,
      clk => clk_1_sg_x378,
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
      ce => ce_1_sg_x378,
      clk => clk_1_sg_x378,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_2f4e4017fc: entity work.twiddle_gen1_entity_2f4e4017fc
    port map (
      ce_1 => ce_1_sg_x378,
      clk_1 => clk_1_sg_x378,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_bd86017793: entity work.twiddle_gen2_entity_bd86017793
    port map (
      ce_1 => ce_1_sg_x378,
      clk_1 => clk_1_sg_x378,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_ff724eec4e: entity work.twiddle_gen3_entity_ff724eec4e
    port map (
      ce_1 => ce_1_sg_x378,
      clk_1 => clk_1_sg_x378,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft/r4_dit_stage_5"

entity r4_dit_stage_5_entity_cf41b9127c is
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
end r4_dit_stage_5_entity_cf41b9127c;

architecture structural of r4_dit_stage_5_entity_cf41b9127c is
  signal ce_1_sg_x379: std_logic;
  signal clk_1_sg_x379: std_logic;
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
  ce_1_sg_x379 <= ce_1;
  clk_1_sg_x379 <= clk_1;
  concat_y_net_x43 <= d_in;
  delay_q_net_x26 <= sync_in;
  a_out <= concat_y_net_x44;
  b_out <= concat_y_net_x45;
  c_out <= concat_y_net_x46;
  d_out <= concat_y_net_x47;
  sync_out <= delay_q_net_x10;

  quadplex_commutator_d78550bc5d: entity work.quadplex_commutator_entity_d78550bc5d
    port map (
      a => concat_y_net_x40,
      b => concat_y_net_x41,
      c => concat_y_net_x42,
      ce_1 => ce_1_sg_x379,
      clk_1 => clk_1_sg_x379,
      d => concat_y_net_x43,
      sync_in => delay_q_net_x26,
      abcd0 => slr_q_net_x10,
      abcd1 => mux1_y_net_x8,
      abcd2 => slr_q_net_x11,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x8
    );

  r4_butterfly_26888c8657: entity work.r4_butterfly_entity_26888c8657
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x38,
      c_in => concat_y_net_x11,
      ce_1 => ce_1_sg_x379,
      clk_1 => clk_1_sg_x379,
      d_in => concat_y_net_x39,
      sync_in => delay_q_net_x4,
      a_out => concat_y_net_x44,
      b_out => concat_y_net_x45,
      c_out => concat_y_net_x46,
      d_out => concat_y_net_x47,
      sync_out => delay_q_net_x10
    );

  r4_twiddle_a297e404cd: entity work.r4_twiddle_entity_a297e404cd
    port map (
      a_in => slr_q_net_x10,
      b => mux1_y_net_x8,
      c => slr_q_net_x11,
      ce_1 => ce_1_sg_x379,
      clk_1 => clk_1_sg_x379,
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

-- Generated from Simulink block "r4_5g_specV5/r4_dit_fft"

entity r4_dit_fft_entity_bb20d3c530 is
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
end r4_dit_fft_entity_bb20d3c530;

architecture structural of r4_dit_fft_entity_bb20d3c530 is
  signal ce_1_sg_x380: std_logic;
  signal clk_1_sg_x380: std_logic;
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
  signal shift4_op_net_x4: std_logic_vector(17 downto 0);
  signal shift5_op_net_x4: std_logic_vector(17 downto 0);
  signal shift_op_net_x3: std_logic_vector(17 downto 0);

begin
  shift_op_net_x3 <= a_in;
  shift1_op_net_x3 <= b_in;
  shift4_op_net_x4 <= c_in;
  ce_1_sg_x380 <= ce_1;
  clk_1_sg_x380 <= clk_1;
  shift5_op_net_x4 <= d_in;
  delay_q_net_x27 <= sync_in;
  a_out <= concat_y_net_x52;
  b_out <= concat_y_net_x53;
  c_out <= concat_y_net_x54;
  d_out <= concat_y_net_x55;

  quadplex_bitrev_660273096d: entity work.quadplex_bitrev_entity_660273096d
    port map (
      a_in => concat_y_net_x15,
      b_in => mux1_y_net_x6,
      c_in => concat_y_net_x16,
      ce_1 => ce_1_sg_x380,
      clk_1 => clk_1_sg_x380,
      d_in => mux1_y_net_x7,
      sync_in => delay_q_net_x7,
      a_out => concat_y_net_x52,
      b_out => concat_y_net_x53,
      c_out => concat_y_net_x54,
      d_out => concat_y_net_x55
    );

  quadplex_commutator_24b23ba26e: entity work.quadplex_commutator_entity_24b23ba26e
    port map (
      a => concat_y_net_x44,
      b => concat_y_net_x46,
      c => concat_y_net_x45,
      ce_1 => ce_1_sg_x380,
      clk_1 => clk_1_sg_x380,
      d => concat_y_net_x47,
      sync_in => delay_q_net_x10,
      abcd0 => concat_y_net_x15,
      abcd1 => mux1_y_net_x6,
      abcd2 => concat_y_net_x16,
      abcd3 => mux1_y_net_x7,
      sync_out => delay_q_net_x7
    );

  r4_dit_stage_1_36070de08f: entity work.r4_dit_stage_1_entity_36070de08f
    port map (
      a_in => shift_op_net_x3,
      b_in => shift1_op_net_x3,
      c_in => shift4_op_net_x4,
      ce_1 => ce_1_sg_x380,
      clk_1 => clk_1_sg_x380,
      d_in => shift5_op_net_x4,
      sync_in => delay_q_net_x27,
      a_out => concat_y_net_x24,
      b_out => concat_y_net_x33,
      c_out => concat_y_net_x34,
      d_out => concat_y_net_x35,
      sync_out => delay_q_net_x16
    );

  r4_dit_stage_2_1a9931e6f1: entity work.r4_dit_stage_2_entity_1a9931e6f1
    port map (
      a_in => concat_y_net_x24,
      b_in => concat_y_net_x33,
      c_in => concat_y_net_x34,
      ce_1 => ce_1_sg_x380,
      clk_1 => clk_1_sg_x380,
      d_in => concat_y_net_x35,
      sync_in => delay_q_net_x16,
      a_out => concat_y_net_x48,
      b_out => concat_y_net_x49,
      c_out => concat_y_net_x50,
      d_out => concat_y_net_x51,
      sync_out => delay_q_net_x13
    );

  r4_dit_stage_3_2e339e97dd: entity work.r4_dit_stage_3_entity_2e339e97dd
    port map (
      a_in => concat_y_net_x48,
      b_in => concat_y_net_x49,
      c_in => concat_y_net_x50,
      ce_1 => ce_1_sg_x380,
      clk_1 => clk_1_sg_x380,
      d_in => concat_y_net_x51,
      sync_in => delay_q_net_x13,
      a_out => concat_y_net_x64,
      b_out => concat_y_net_x65,
      c_out => concat_y_net_x66,
      d_out => concat_y_net_x67,
      sync_out => delay_q_net_x21
    );

  r4_dit_stage_4_fc2110268b: entity work.r4_dit_stage_4_entity_fc2110268b
    port map (
      a_in => concat_y_net_x64,
      b_in => concat_y_net_x65,
      c_in => concat_y_net_x66,
      ce_1 => ce_1_sg_x380,
      clk_1 => clk_1_sg_x380,
      d_in => concat_y_net_x67,
      sync_in => delay_q_net_x21,
      a_out => concat_y_net_x40,
      b_out => concat_y_net_x41,
      c_out => concat_y_net_x42,
      d_out => concat_y_net_x43,
      sync_out => delay_q_net_x26
    );

  r4_dit_stage_5_cf41b9127c: entity work.r4_dit_stage_5_entity_cf41b9127c
    port map (
      a_in => concat_y_net_x40,
      b_in => concat_y_net_x41,
      c_in => concat_y_net_x42,
      ce_1 => ce_1_sg_x380,
      clk_1 => clk_1_sg_x380,
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

-- Generated from Simulink block "r4_5g_specV5/r4_power19_1/c_to_ri"

entity c_to_ri_entity_e2ce2ec87a is
  port (
    c: in std_logic_vector(37 downto 0); 
    im: out std_logic_vector(18 downto 0); 
    re: out std_logic_vector(18 downto 0)
  );
end c_to_ri_entity_e2ce2ec87a;

architecture structural of c_to_ri_entity_e2ce2ec87a is
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

-- Generated from Simulink block "r4_5g_specV5/r4_power19_1"

entity r4_power19_1_entity_4d56d1ab0b is
  port (
    c: in std_logic_vector(37 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    power: out std_logic_vector(37 downto 0)
  );
end r4_power19_1_entity_4d56d1ab0b;

architecture structural of r4_power19_1_entity_4d56d1ab0b is
  signal ce_1_sg_x381: std_logic;
  signal clk_1_sg_x381: std_logic;
  signal delay5_q_net_x1: std_logic_vector(37 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(18 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(18 downto 0);
  signal imag_square_p_net: std_logic_vector(37 downto 0);
  signal power_adder_s_net_x0: std_logic_vector(37 downto 0);
  signal real_square_p_net: std_logic_vector(37 downto 0);

begin
  delay5_q_net_x1 <= c;
  ce_1_sg_x381 <= ce_1;
  clk_1_sg_x381 <= clk_1;
  power <= power_adder_s_net_x0;

  c_to_ri_e2ce2ec87a: entity work.c_to_ri_entity_e2ce2ec87a
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
      ce => ce_1_sg_x381,
      clk => clk_1_sg_x381,
      clr => '0',
      core_ce => ce_1_sg_x381,
      core_clk => clk_1_sg_x381,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imag_square_p_net
    );

  power_adder: entity work.addsub_96d2a7e25e
    port map (
      a => real_square_p_net,
      b => imag_square_p_net,
      ce => ce_1_sg_x381,
      clk => clk_1_sg_x381,
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
      ce => ce_1_sg_x381,
      clk => clk_1_sg_x381,
      clr => '0',
      core_ce => ce_1_sg_x381,
      core_clk => clk_1_sg_x381,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => real_square_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/snap_adc/addr"

entity addr_entity_1e1f5ffa13 is
  port (
    reg_out: in std_logic_vector(12 downto 0); 
    convert_x0: out std_logic_vector(31 downto 0)
  );
end addr_entity_1e1f5ffa13;

architecture structural of addr_entity_1e1f5ffa13 is
  signal convert_dout_net_x0: std_logic_vector(31 downto 0);
  signal delay8_q_net_x0: std_logic_vector(12 downto 0);

begin
  delay8_q_net_x0 <= reg_out;
  convert_x0 <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 13,
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
      din => delay8_q_net_x0,
      dout => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/snap_adc/bram_lsb"

entity bram_lsb_entity_fbf1ca35c2 is
  port (
    addr: in std_logic_vector(12 downto 0); 
    data_in: in std_logic_vector(31 downto 0); 
    we: in std_logic; 
    convert_addr_x0: out std_logic_vector(12 downto 0); 
    convert_din_x0: out std_logic_vector(31 downto 0); 
    convert_we_x0: out std_logic
  );
end bram_lsb_entity_fbf1ca35c2;

architecture structural of bram_lsb_entity_fbf1ca35c2 is
  signal convert_addr_dout_net_x0: std_logic_vector(12 downto 0);
  signal convert_din_dout_net_x0: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x0: std_logic;
  signal delay5_q_net_x0: std_logic_vector(12 downto 0);
  signal delay6_q_net_x0: std_logic_vector(31 downto 0);
  signal delay7_q_net_x0: std_logic;

begin
  delay5_q_net_x0 <= addr;
  delay6_q_net_x0 <= data_in;
  delay7_q_net_x0 <= we;
  convert_addr_x0 <= convert_addr_dout_net_x0;
  convert_din_x0 <= convert_din_dout_net_x0;
  convert_we_x0 <= convert_we_dout_net_x0;

  convert_addr: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 13,
      dout_arith => 1,
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
      din => delay5_q_net_x0,
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
      din => delay6_q_net_x0,
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
      din(0) => delay7_q_net_x0,
      dout(0) => convert_we_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/snap_adc/freeze_cntr"

entity freeze_cntr_entity_c486df284c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    en: in std_logic; 
    rst: in std_logic; 
    addr: out std_logic_vector(12 downto 0); 
    we: out std_logic
  );
end freeze_cntr_entity_c486df284c;

architecture structural of freeze_cntr_entity_c486df284c is
  signal ce_1_sg_x385: std_logic;
  signal clk_1_sg_x385: std_logic;
  signal counter3_op_net: std_logic_vector(13 downto 0);
  signal enable1_y_net: std_logic;
  signal enable_y_net_x0: std_logic_vector(12 downto 0);
  signal inverter1_op_net: std_logic;
  signal inverter_op_net: std_logic;
  signal logical1_y_net_x0: std_logic;
  signal logical5_y_net: std_logic;
  signal mux1_y_net_x0: std_logic;
  signal register_q_net_x0: std_logic;

begin
  ce_1_sg_x385 <= ce_1;
  clk_1_sg_x385 <= clk_1;
  mux1_y_net_x0 <= en;
  register_q_net_x0 <= rst;
  addr <= enable_y_net_x0;
  we <= logical1_y_net_x0;

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_6ddb97ef480a3f10",
      op_arith => xlUnsigned,
      op_width => 14
    )
    port map (
      ce => ce_1_sg_x385,
      clk => clk_1_sg_x385,
      clr => '0',
      en(0) => logical5_y_net,
      rst(0) => register_q_net_x0,
      op => counter3_op_net
    );

  enable: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 12,
      x_width => 14,
      y_width => 13
    )
    port map (
      x => counter3_op_net,
      y => enable_y_net_x0
    );

  enable1: entity work.xlslice
    generic map (
      new_lsb => 13,
      new_msb => 13,
      x_width => 14,
      y_width => 1
    )
    port map (
      x => counter3_op_net,
      y(0) => enable1_y_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x385,
      clk => clk_1_sg_x385,
      clr => '0',
      ip(0) => register_q_net_x0,
      op(0) => inverter_op_net
    );

  inverter1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x385,
      clk => clk_1_sg_x385,
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
      y(0) => logical1_y_net_x0
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

-- Generated from Simulink block "r4_5g_specV5/snap_adc"

entity snap_adc_entity_4bfcd7107d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(63 downto 0); 
    r4_5g_specv5_snap_adc_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram_lsb: out std_logic_vector(12 downto 0); 
    bram_lsb_x0: out std_logic_vector(31 downto 0); 
    bram_lsb_x1: out std_logic; 
    bram_msb: out std_logic_vector(12 downto 0); 
    bram_msb_x0: out std_logic_vector(31 downto 0); 
    bram_msb_x1: out std_logic
  );
end snap_adc_entity_4bfcd7107d;

architecture structural of snap_adc_entity_4bfcd7107d is
  signal ce_1_sg_x387: std_logic;
  signal clk_1_sg_x387: std_logic;
  signal concat3_y_net_x0: std_logic_vector(63 downto 0);
  signal constant12_op_net_x0: std_logic;
  signal constant1_op_net: std_logic;
  signal constant2_op_net: std_logic;
  signal constant3_op_net_x0: std_logic;
  signal constant_op_net: std_logic;
  signal convert_addr_dout_net_x2: std_logic_vector(12 downto 0);
  signal convert_addr_dout_net_x3: std_logic_vector(12 downto 0);
  signal convert_din_dout_net_x2: std_logic_vector(31 downto 0);
  signal convert_din_dout_net_x3: std_logic_vector(31 downto 0);
  signal convert_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x2: std_logic;
  signal convert_we_dout_net_x3: std_logic;
  signal delay1_q_net: std_logic_vector(31 downto 0);
  signal delay2_q_net_x0: std_logic_vector(31 downto 0);
  signal delay3_q_net_x0: std_logic_vector(12 downto 0);
  signal delay4_q_net_x0: std_logic;
  signal delay5_q_net_x0: std_logic_vector(12 downto 0);
  signal delay6_q_net_x0: std_logic_vector(31 downto 0);
  signal delay7_q_net_x0: std_logic;
  signal delay8_q_net_x0: std_logic_vector(12 downto 0);
  signal en1_y_net: std_logic_vector(31 downto 0);
  signal en2_y_net: std_logic_vector(31 downto 0);
  signal enable_y_net_x0: std_logic;
  signal enable_y_net_x1: std_logic_vector(12 downto 0);
  signal inverter_op_net: std_logic;
  signal logical1_y_net: std_logic;
  signal logical1_y_net_x0: std_logic;
  signal logical_y_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic;
  signal mux2_y_net: std_logic;
  signal r4_5g_specv5_snap_adc_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net: std_logic_vector(12 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret3_output_port_net: std_logic_vector(63 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x387 <= ce_1;
  clk_1_sg_x387 <= clk_1;
  concat3_y_net_x0 <= din;
  r4_5g_specv5_snap_adc_ctrl_user_data_out_net_x0 <= r4_5g_specv5_snap_adc_ctrl_user_data_out;
  constant3_op_net_x0 <= trig;
  constant12_op_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram_lsb <= convert_addr_dout_net_x2;
  bram_lsb_x0 <= convert_din_dout_net_x2;
  bram_lsb_x1 <= convert_we_dout_net_x2;
  bram_msb <= convert_addr_dout_net_x3;
  bram_msb_x0 <= convert_din_dout_net_x3;
  bram_msb_x1 <= convert_we_dout_net_x3;

  addr_1e1f5ffa13: entity work.addr_entity_1e1f5ffa13
    port map (
      reg_out => delay8_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_lsb_fbf1ca35c2: entity work.bram_lsb_entity_fbf1ca35c2
    port map (
      addr => delay5_q_net_x0,
      data_in => delay6_q_net_x0,
      we => delay7_q_net_x0,
      convert_addr_x0 => convert_addr_dout_net_x2,
      convert_din_x0 => convert_din_dout_net_x2,
      convert_we_x0 => convert_we_dout_net_x2
    );

  bram_msb_31d3def2d8: entity work.bram_lsb_entity_fbf1ca35c2
    port map (
      addr => delay3_q_net_x0,
      data_in => delay2_q_net_x0,
      we => delay4_q_net_x0,
      convert_addr_x0 => convert_addr_dout_net_x3,
      convert_din_x0 => convert_din_dout_net_x3,
      convert_we_x0 => convert_we_dout_net_x3
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

  delay1: entity work.delay_d6fa0633b9
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
      clr => '0',
      d => r4_5g_specv5_snap_adc_ctrl_user_data_out_net_x0,
      q => delay1_q_net
    );

  delay2: entity work.delay_d6fa0633b9
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
      clr => '0',
      d => en1_y_net,
      q => delay2_q_net_x0
    );

  delay3: entity work.delay_bab6621619
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
      clr => '0',
      d => enable_y_net_x1,
      q => delay3_q_net_x0
    );

  delay4: entity work.delay_c53de546ea
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
      clr => '0',
      d(0) => logical1_y_net_x0,
      q(0) => delay4_q_net_x0
    );

  delay5: entity work.delay_bab6621619
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
      clr => '0',
      d => enable_y_net_x1,
      q => delay5_q_net_x0
    );

  delay6: entity work.delay_d6fa0633b9
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
      clr => '0',
      d => en2_y_net,
      q => delay6_q_net_x0
    );

  delay7: entity work.delay_c53de546ea
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
      clr => '0',
      d(0) => logical1_y_net_x0,
      q(0) => delay7_q_net_x0
    );

  delay8: entity work.delay_bab6621619
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
      clr => '0',
      d => register1_q_net,
      q => delay8_q_net_x0
    );

  en1: entity work.xlslice
    generic map (
      new_lsb => 32,
      new_msb => 63,
      x_width => 64,
      y_width => 32
    )
    port map (
      x => reinterpret3_output_port_net,
      y => en1_y_net
    );

  en2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 31,
      x_width => 64,
      y_width => 32
    )
    port map (
      x => reinterpret3_output_port_net,
      y => en2_y_net
    );

  enable: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => delay1_q_net,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_c486df284c: entity work.freeze_cntr_entity_c486df284c
    port map (
      ce_1 => ce_1_sg_x387,
      clk_1 => clk_1_sg_x387,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x0
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
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

  posedge_5a898ad524: entity work.posedge1_entity_d70b7fecd6
    port map (
      ce_1 => ce_1_sg_x387,
      clk_1 => clk_1_sg_x387,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 13,
      init_value => b"0000000000000"
    )
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
      d => enable_y_net_x1,
      en(0) => logical1_y_net_x0,
      rst(0) => logical_y_net_x0,
      q => register1_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x387,
      clk => clk_1_sg_x387,
      d(0) => constant_op_net,
      en(0) => logical_y_net_x0,
      rst(0) => logical1_y_net,
      q(0) => register_q_net_x0
    );

  reinterpret3: entity work.reinterpret_9a13f6a2a0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => concat3_y_net_x0,
      output_port => reinterpret3_output_port_net
    );

  trig1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => delay1_q_net,
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
      x => delay1_q_net,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/snap_vacc0/addr"

entity addr_entity_32c83c5028 is
  port (
    reg_out: in std_logic_vector(9 downto 0); 
    convert_x0: out std_logic_vector(31 downto 0)
  );
end addr_entity_32c83c5028;

architecture structural of addr_entity_32c83c5028 is
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

-- Generated from Simulink block "r4_5g_specV5/snap_vacc0/bram"

entity bram_entity_ef33986178 is
  port (
    addr: in std_logic_vector(9 downto 0); 
    data_in: in std_logic_vector(31 downto 0); 
    we: in std_logic; 
    convert_addr_x0: out std_logic_vector(9 downto 0); 
    convert_din_x0: out std_logic_vector(31 downto 0); 
    convert_we_x0: out std_logic
  );
end bram_entity_ef33986178;

architecture structural of bram_entity_ef33986178 is
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

-- Generated from Simulink block "r4_5g_specV5/snap_vacc0/freeze_cntr"

entity freeze_cntr_entity_b4db19b16d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    en: in std_logic; 
    rst: in std_logic; 
    addr: out std_logic_vector(9 downto 0); 
    we: out std_logic
  );
end freeze_cntr_entity_b4db19b16d;

architecture structural of freeze_cntr_entity_b4db19b16d is
  signal ce_1_sg_x388: std_logic;
  signal clk_1_sg_x388: std_logic;
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
  ce_1_sg_x388 <= ce_1;
  clk_1_sg_x388 <= clk_1;
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
      ce => ce_1_sg_x388,
      clk => clk_1_sg_x388,
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
      ce => ce_1_sg_x388,
      clk => clk_1_sg_x388,
      clr => '0',
      ip(0) => register_q_net_x0,
      op(0) => inverter_op_net
    );

  inverter1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x388,
      clk => clk_1_sg_x388,
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

-- Generated from Simulink block "r4_5g_specV5/snap_vacc0"

entity snap_vacc0_entity_f1b6ff57cb is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc0_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc0_entity_f1b6ff57cb;

architecture structural of snap_vacc0_entity_f1b6ff57cb is
  signal ce_1_sg_x390: std_logic;
  signal clk_1_sg_x390: std_logic;
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
  signal r4_5g_specv5_snap_vacc0_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x390 <= ce_1;
  clk_1_sg_x390 <= clk_1;
  delay11_q_net_x0 <= din;
  r4_5g_specv5_snap_vacc0_ctrl_user_data_out_net_x0 <= r4_5g_specv5_snap_vacc0_ctrl_user_data_out;
  delay29_q_net_x0 <= trig;
  delay12_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_32c83c5028: entity work.addr_entity_32c83c5028
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_ef33986178: entity work.bram_entity_ef33986178
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
      x => r4_5g_specv5_snap_vacc0_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_b4db19b16d: entity work.freeze_cntr_entity_b4db19b16d
    port map (
      ce_1 => ce_1_sg_x390,
      clk_1 => clk_1_sg_x390,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x390,
      clk => clk_1_sg_x390,
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

  posedge_6278cb7e49: entity work.posedge1_entity_d70b7fecd6
    port map (
      ce_1 => ce_1_sg_x390,
      clk_1 => clk_1_sg_x390,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x390,
      clk => clk_1_sg_x390,
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
      ce => ce_1_sg_x390,
      clk => clk_1_sg_x390,
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
      x => r4_5g_specv5_snap_vacc0_ctrl_user_data_out_net_x0,
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
      x => r4_5g_specv5_snap_vacc0_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/snap_vacc1"

entity snap_vacc1_entity_a816baf518 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc1_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc1_entity_a816baf518;

architecture structural of snap_vacc1_entity_a816baf518 is
  signal ce_1_sg_x393: std_logic;
  signal clk_1_sg_x393: std_logic;
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
  signal r4_5g_specv5_snap_vacc1_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x393 <= ce_1;
  clk_1_sg_x393 <= clk_1;
  delay13_q_net_x0 <= din;
  r4_5g_specv5_snap_vacc1_ctrl_user_data_out_net_x0 <= r4_5g_specv5_snap_vacc1_ctrl_user_data_out;
  delay29_q_net_x1 <= trig;
  delay8_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_e8866bc21f: entity work.addr_entity_32c83c5028
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_3aff363242: entity work.bram_entity_ef33986178
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
      x => r4_5g_specv5_snap_vacc1_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_898a6de690: entity work.freeze_cntr_entity_b4db19b16d
    port map (
      ce_1 => ce_1_sg_x393,
      clk_1 => clk_1_sg_x393,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x393,
      clk => clk_1_sg_x393,
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

  posedge_e03025439e: entity work.posedge1_entity_d70b7fecd6
    port map (
      ce_1 => ce_1_sg_x393,
      clk_1 => clk_1_sg_x393,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x393,
      clk => clk_1_sg_x393,
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
      ce => ce_1_sg_x393,
      clk => clk_1_sg_x393,
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
      x => r4_5g_specv5_snap_vacc1_ctrl_user_data_out_net_x0,
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
      x => r4_5g_specv5_snap_vacc1_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/snap_vacc2"

entity snap_vacc2_entity_c2f47281df is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc2_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc2_entity_c2f47281df;

architecture structural of snap_vacc2_entity_c2f47281df is
  signal ce_1_sg_x396: std_logic;
  signal clk_1_sg_x396: std_logic;
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
  signal r4_5g_specv5_snap_vacc2_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x396 <= ce_1;
  clk_1_sg_x396 <= clk_1;
  delay35_q_net_x0 <= din;
  r4_5g_specv5_snap_vacc2_ctrl_user_data_out_net_x0 <= r4_5g_specv5_snap_vacc2_ctrl_user_data_out;
  delay45_q_net_x0 <= trig;
  delay36_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_85723a3996: entity work.addr_entity_32c83c5028
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_a9b4102a30: entity work.bram_entity_ef33986178
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
      x => r4_5g_specv5_snap_vacc2_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_9d0d7ae667: entity work.freeze_cntr_entity_b4db19b16d
    port map (
      ce_1 => ce_1_sg_x396,
      clk_1 => clk_1_sg_x396,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x396,
      clk => clk_1_sg_x396,
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

  posedge_96dfb6bd44: entity work.posedge1_entity_d70b7fecd6
    port map (
      ce_1 => ce_1_sg_x396,
      clk_1 => clk_1_sg_x396,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x396,
      clk => clk_1_sg_x396,
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
      ce => ce_1_sg_x396,
      clk => clk_1_sg_x396,
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
      x => r4_5g_specv5_snap_vacc2_ctrl_user_data_out_net_x0,
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
      x => r4_5g_specv5_snap_vacc2_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/snap_vacc3"

entity snap_vacc3_entity_74596c5e24 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc3_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc3_entity_74596c5e24;

architecture structural of snap_vacc3_entity_74596c5e24 is
  signal ce_1_sg_x399: std_logic;
  signal clk_1_sg_x399: std_logic;
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
  signal r4_5g_specv5_snap_vacc3_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x399 <= ce_1;
  clk_1_sg_x399 <= clk_1;
  delay37_q_net_x0 <= din;
  r4_5g_specv5_snap_vacc3_ctrl_user_data_out_net_x0 <= r4_5g_specv5_snap_vacc3_ctrl_user_data_out;
  delay45_q_net_x1 <= trig;
  delay47_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_4982c0a208: entity work.addr_entity_32c83c5028
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_47dd84318e: entity work.bram_entity_ef33986178
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
      x => r4_5g_specv5_snap_vacc3_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_9669e27cf6: entity work.freeze_cntr_entity_b4db19b16d
    port map (
      ce_1 => ce_1_sg_x399,
      clk_1 => clk_1_sg_x399,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x399,
      clk => clk_1_sg_x399,
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

  posedge_7c65ed018f: entity work.posedge1_entity_d70b7fecd6
    port map (
      ce_1 => ce_1_sg_x399,
      clk_1 => clk_1_sg_x399,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x399,
      clk => clk_1_sg_x399,
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
      ce => ce_1_sg_x399,
      clk => clk_1_sg_x399,
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
      x => r4_5g_specv5_snap_vacc3_ctrl_user_data_out_net_x0,
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
      x => r4_5g_specv5_snap_vacc3_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specV5/vacc0/delay_bram"

entity delay_bram_entity_a2954a84b5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(31 downto 0); 
    out1: out std_logic_vector(31 downto 0)
  );
end delay_bram_entity_a2954a84b5;

architecture structural of delay_bram_entity_a2954a84b5 is
  signal adder0_s_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x400: std_logic;
  signal clk_1_sg_x400: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x400 <= ce_1;
  clk_1_sg_x400 <= clk_1;
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
      ce => ce_1_sg_x400,
      clk => clk_1_sg_x400,
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
      ce => ce_1_sg_x400,
      clk => clk_1_sg_x400,
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

-- Generated from Simulink block "r4_5g_specV5/vacc0/pulse_ext"

entity pulse_ext_entity_0ff64cdd38 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end pulse_ext_entity_0ff64cdd38;

architecture structural of pulse_ext_entity_0ff64cdd38 is
  signal ce_1_sg_x402: std_logic;
  signal clk_1_sg_x402: std_logic;
  signal constant5_op_net: std_logic_vector(10 downto 0);
  signal counter3_op_net: std_logic_vector(10 downto 0);
  signal delay24_q_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal relational5_op_net_x0: std_logic;

begin
  ce_1_sg_x402 <= ce_1;
  clk_1_sg_x402 <= clk_1;
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
      ce => ce_1_sg_x402,
      clk => clk_1_sg_x402,
      clr => '0',
      en(0) => relational5_op_net_x0,
      rst(0) => logical_y_net_x0,
      op => counter3_op_net
    );

  posedge_6aceed40b5: entity work.posedge1_entity_d70b7fecd6
    port map (
      ce_1 => ce_1_sg_x402,
      clk_1 => clk_1_sg_x402,
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

-- Generated from Simulink block "r4_5g_specV5/vacc0"

entity vacc0_entity_ff1ce515bb is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(37 downto 0); 
    new_acc: in std_logic; 
    dout: out std_logic_vector(31 downto 0); 
    valid: out std_logic
  );
end vacc0_entity_ff1ce515bb;

architecture structural of vacc0_entity_ff1ce515bb is
  signal adder0_s_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x403: std_logic;
  signal clk_1_sg_x403: std_logic;
  signal delay24_q_net_x2: std_logic;
  signal delay25_q_net_x0: std_logic_vector(37 downto 0);
  signal mux0_y_net: std_logic_vector(40 downto 0);
  signal relational5_op_net_x1: std_logic;
  signal single_port_ram_data_out_net_x1: std_logic_vector(31 downto 0);
  signal zero_op_net: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x403 <= ce_1;
  clk_1_sg_x403 <= clk_1;
  delay25_q_net_x0 <= din;
  delay24_q_net_x2 <= new_acc;
  dout <= single_port_ram_data_out_net_x1;
  valid <= relational5_op_net_x1;

  adder0: entity work.addsub_4238e1a78a
    port map (
      a => delay25_q_net_x0,
      b => mux0_y_net,
      ce => ce_1_sg_x403,
      clk => clk_1_sg_x403,
      clr => '0',
      s => adder0_s_net_x0
    );

  delay_bram_a2954a84b5: entity work.delay_bram_entity_a2954a84b5
    port map (
      ce_1 => ce_1_sg_x403,
      clk_1 => clk_1_sg_x403,
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

  pulse_ext_0ff64cdd38: entity work.pulse_ext_entity_0ff64cdd38
    port map (
      ce_1 => ce_1_sg_x403,
      clk_1 => clk_1_sg_x403,
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

-- Generated from Simulink block "r4_5g_specV5"

entity r4_5g_specv5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    r4_5g_specv5_acc_len_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_adc_5g_user_data_valid: in std_logic; 
    r4_5g_specv5_adc_5g_user_datai0: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_datai1: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_datai2: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_datai3: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_dataq0: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_dataq1: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_dataq2: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_dataq3: in std_logic_vector(7 downto 0); 
    r4_5g_specv5_adc_5g_user_outofrange0: in std_logic; 
    r4_5g_specv5_adc_5g_user_outofrange1: in std_logic; 
    r4_5g_specv5_adc_5g_user_sync0: in std_logic; 
    r4_5g_specv5_adc_5g_user_sync1: in std_logic; 
    r4_5g_specv5_adc_5g_user_sync2: in std_logic; 
    r4_5g_specv5_adc_5g_user_sync3: in std_logic; 
    r4_5g_specv5_cnt_rst_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_adc_bram_lsb_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_adc_bram_msb_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_adc_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc0_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc0_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc1_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc1_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc2_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc2_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc3_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc3_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specv5_acc_cnt_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_led0_sync_gateway: out std_logic; 
    r4_5g_specv5_led1_new_acc_gateway: out std_logic; 
    r4_5g_specv5_snap_adc_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_adc_bram_lsb_addr: out std_logic_vector(12 downto 0); 
    r4_5g_specv5_snap_adc_bram_lsb_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_adc_bram_lsb_we: out std_logic; 
    r4_5g_specv5_snap_adc_bram_msb_addr: out std_logic_vector(12 downto 0); 
    r4_5g_specv5_snap_adc_bram_msb_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_adc_bram_msb_we: out std_logic; 
    r4_5g_specv5_snap_vacc0_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc0_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specv5_snap_vacc0_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc0_bram_we: out std_logic; 
    r4_5g_specv5_snap_vacc1_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc1_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specv5_snap_vacc1_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc1_bram_we: out std_logic; 
    r4_5g_specv5_snap_vacc2_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc2_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specv5_snap_vacc2_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc2_bram_we: out std_logic; 
    r4_5g_specv5_snap_vacc3_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc3_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specv5_snap_vacc3_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specv5_snap_vacc3_bram_we: out std_logic; 
    r4_5g_specv5_sync_cnt_user_data_in: out std_logic_vector(31 downto 0)
  );
end r4_5g_specv5;

architecture structural of r4_5g_specv5 is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "r4_5g_specV5,sysgen_core_10_1_3_1386,{total_blocks=10968,xilinx_adder_subtractor_block=384,xilinx_arithmetic_relational_operator_block=11,xilinx_binary_shift_operator_block=9,xilinx_bit_slice_extractor_block=749,xilinx_bus_concatenator_block=213,xilinx_bus_multiplexer_block=114,xilinx_constant_block_block=195,xilinx_counter_block=267,xilinx_delay_block=659,xilinx_disregard_subsystem_for_generation_block=6,xilinx_gateway_in_block=46,xilinx_gateway_out_block=33,xilinx_input_scaler_block=160,xilinx_inverter_block=37,xilinx_logical_block_block=30,xilinx_multiplier_block=176,xilinx_register_block=11,xilinx_single_port_random_access_memory_block=146,xilinx_single_port_read_only_memory_block=72,xilinx_system_generator_block=1,xilinx_type_converter_block=347,xilinx_type_reinterpreter_block=977,}";

  signal acc_cntr_op_net: std_logic_vector(31 downto 0);
  signal ce_1_sg_x416: std_logic;
  signal clk_1_sg_x416: std_logic;
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
  signal delay22_q_net_x2: std_logic_vector(7 downto 0);
  signal delay23_q_net_x0: std_logic_vector(31 downto 0);
  signal delay24_q_net_x2: std_logic;
  signal delay25_q_net_x0: std_logic_vector(37 downto 0);
  signal delay26_q_net_x2: std_logic;
  signal delay27_q_net_x0: std_logic_vector(37 downto 0);
  signal delay28_q_net: std_logic;
  signal delay29_q_net_x1: std_logic;
  signal delay2_q_net_x2: std_logic_vector(7 downto 0);
  signal delay30_q_net_x2: std_logic_vector(7 downto 0);
  signal delay31_q_net_x1: std_logic;
  signal delay32_q_net: std_logic_vector(7 downto 0);
  signal delay33_q_net: std_logic_vector(7 downto 0);
  signal delay34_q_net: std_logic_vector(37 downto 0);
  signal delay35_q_net_x0: std_logic_vector(31 downto 0);
  signal delay36_q_net_x0: std_logic;
  signal delay37_q_net_x0: std_logic_vector(31 downto 0);
  signal delay38_q_net_x1: std_logic_vector(37 downto 0);
  signal delay39_q_net: std_logic_vector(37 downto 0);
  signal delay3_q_net: std_logic_vector(7 downto 0);
  signal delay40_q_net: std_logic_vector(37 downto 0);
  signal delay41_q_net_x2: std_logic;
  signal delay42_q_net_x0: std_logic_vector(37 downto 0);
  signal delay43_q_net_x2: std_logic;
  signal delay44_q_net_x0: std_logic_vector(37 downto 0);
  signal delay45_q_net_x1: std_logic;
  signal delay46_q_net_x1: std_logic_vector(37 downto 0);
  signal delay47_q_net_x0: std_logic;
  signal delay48_q_net: std_logic_vector(37 downto 0);
  signal delay4_q_net: std_logic_vector(7 downto 0);
  signal delay5_q_net_x1: std_logic_vector(37 downto 0);
  signal delay7_q_net_x18: std_logic;
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
  signal r4_5g_specv5_acc_cnt_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_acc_len_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_adc_5g_user_data_valid_net: std_logic;
  signal r4_5g_specv5_adc_5g_user_datai0_net: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_datai1_net: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_datai2_net: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_datai3_net: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_dataq0_net: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_dataq1_net: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_dataq2_net: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_dataq3_net: std_logic_vector(7 downto 0);
  signal r4_5g_specv5_adc_5g_user_outofrange0_net: std_logic;
  signal r4_5g_specv5_adc_5g_user_outofrange1_net: std_logic;
  signal r4_5g_specv5_adc_5g_user_sync0_net: std_logic;
  signal r4_5g_specv5_adc_5g_user_sync1_net: std_logic;
  signal r4_5g_specv5_adc_5g_user_sync2_net: std_logic;
  signal r4_5g_specv5_adc_5g_user_sync3_net: std_logic;
  signal r4_5g_specv5_cnt_rst_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_led0_sync_gateway_net: std_logic;
  signal r4_5g_specv5_led1_new_acc_gateway_net: std_logic;
  signal r4_5g_specv5_snap_adc_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_adc_bram_lsb_addr_net: std_logic_vector(12 downto 0);
  signal r4_5g_specv5_snap_adc_bram_lsb_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_adc_bram_lsb_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_adc_bram_lsb_we_net: std_logic;
  signal r4_5g_specv5_snap_adc_bram_msb_addr_net: std_logic_vector(12 downto 0);
  signal r4_5g_specv5_snap_adc_bram_msb_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_adc_bram_msb_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_adc_bram_msb_we_net: std_logic;
  signal r4_5g_specv5_snap_adc_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc0_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc0_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_5g_specv5_snap_vacc0_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc0_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc0_bram_we_net: std_logic;
  signal r4_5g_specv5_snap_vacc0_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc1_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc1_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_5g_specv5_snap_vacc1_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc1_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc1_bram_we_net: std_logic;
  signal r4_5g_specv5_snap_vacc1_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc2_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc2_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_5g_specv5_snap_vacc2_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc2_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc2_bram_we_net: std_logic;
  signal r4_5g_specv5_snap_vacc2_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc3_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc3_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_5g_specv5_snap_vacc3_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc3_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_snap_vacc3_bram_we_net: std_logic;
  signal r4_5g_specv5_snap_vacc3_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specv5_sync_cnt_user_data_in_net: std_logic_vector(31 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret5_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret6_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret7_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x10: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x11: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x12: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x13: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x14: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x15: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x8: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x9: std_logic_vector(7 downto 0);
  signal relational5_op_net_x0: std_logic;
  signal relational5_op_net_x1: std_logic;
  signal relational5_op_net_x2: std_logic;
  signal relational5_op_net_x3: std_logic;
  signal relational5_op_net_x4: std_logic;
  signal relational5_op_net_x5: std_logic;
  signal shift1_op_net_x3: std_logic_vector(17 downto 0);
  signal shift4_op_net_x4: std_logic_vector(17 downto 0);
  signal shift5_op_net_x4: std_logic_vector(17 downto 0);
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
  ce_1_sg_x416 <= ce_1;
  clk_1_sg_x416 <= clk_1;
  r4_5g_specv5_acc_len_user_data_out_net <= r4_5g_specv5_acc_len_user_data_out;
  r4_5g_specv5_adc_5g_user_data_valid_net <= r4_5g_specv5_adc_5g_user_data_valid;
  r4_5g_specv5_adc_5g_user_datai0_net <= r4_5g_specv5_adc_5g_user_datai0;
  r4_5g_specv5_adc_5g_user_datai1_net <= r4_5g_specv5_adc_5g_user_datai1;
  r4_5g_specv5_adc_5g_user_datai2_net <= r4_5g_specv5_adc_5g_user_datai2;
  r4_5g_specv5_adc_5g_user_datai3_net <= r4_5g_specv5_adc_5g_user_datai3;
  r4_5g_specv5_adc_5g_user_dataq0_net <= r4_5g_specv5_adc_5g_user_dataq0;
  r4_5g_specv5_adc_5g_user_dataq1_net <= r4_5g_specv5_adc_5g_user_dataq1;
  r4_5g_specv5_adc_5g_user_dataq2_net <= r4_5g_specv5_adc_5g_user_dataq2;
  r4_5g_specv5_adc_5g_user_dataq3_net <= r4_5g_specv5_adc_5g_user_dataq3;
  r4_5g_specv5_adc_5g_user_outofrange0_net <= r4_5g_specv5_adc_5g_user_outofrange0;
  r4_5g_specv5_adc_5g_user_outofrange1_net <= r4_5g_specv5_adc_5g_user_outofrange1;
  r4_5g_specv5_adc_5g_user_sync0_net <= r4_5g_specv5_adc_5g_user_sync0;
  r4_5g_specv5_adc_5g_user_sync1_net <= r4_5g_specv5_adc_5g_user_sync1;
  r4_5g_specv5_adc_5g_user_sync2_net <= r4_5g_specv5_adc_5g_user_sync2;
  r4_5g_specv5_adc_5g_user_sync3_net <= r4_5g_specv5_adc_5g_user_sync3;
  r4_5g_specv5_cnt_rst_user_data_out_net <= r4_5g_specv5_cnt_rst_user_data_out;
  r4_5g_specv5_snap_adc_bram_lsb_data_out_net <= r4_5g_specv5_snap_adc_bram_lsb_data_out;
  r4_5g_specv5_snap_adc_bram_msb_data_out_net <= r4_5g_specv5_snap_adc_bram_msb_data_out;
  r4_5g_specv5_snap_adc_ctrl_user_data_out_net <= r4_5g_specv5_snap_adc_ctrl_user_data_out;
  r4_5g_specv5_snap_vacc0_bram_data_out_net <= r4_5g_specv5_snap_vacc0_bram_data_out;
  r4_5g_specv5_snap_vacc0_ctrl_user_data_out_net <= r4_5g_specv5_snap_vacc0_ctrl_user_data_out;
  r4_5g_specv5_snap_vacc1_bram_data_out_net <= r4_5g_specv5_snap_vacc1_bram_data_out;
  r4_5g_specv5_snap_vacc1_ctrl_user_data_out_net <= r4_5g_specv5_snap_vacc1_ctrl_user_data_out;
  r4_5g_specv5_snap_vacc2_bram_data_out_net <= r4_5g_specv5_snap_vacc2_bram_data_out;
  r4_5g_specv5_snap_vacc2_ctrl_user_data_out_net <= r4_5g_specv5_snap_vacc2_ctrl_user_data_out;
  r4_5g_specv5_snap_vacc3_bram_data_out_net <= r4_5g_specv5_snap_vacc3_bram_data_out;
  r4_5g_specv5_snap_vacc3_ctrl_user_data_out_net <= r4_5g_specv5_snap_vacc3_ctrl_user_data_out;
  r4_5g_specv5_acc_cnt_user_data_in <= r4_5g_specv5_acc_cnt_user_data_in_net;
  r4_5g_specv5_led0_sync_gateway <= r4_5g_specv5_led0_sync_gateway_net;
  r4_5g_specv5_led1_new_acc_gateway <= r4_5g_specv5_led1_new_acc_gateway_net;
  r4_5g_specv5_snap_adc_addr_user_data_in <= r4_5g_specv5_snap_adc_addr_user_data_in_net;
  r4_5g_specv5_snap_adc_bram_lsb_addr <= r4_5g_specv5_snap_adc_bram_lsb_addr_net;
  r4_5g_specv5_snap_adc_bram_lsb_data_in <= r4_5g_specv5_snap_adc_bram_lsb_data_in_net;
  r4_5g_specv5_snap_adc_bram_lsb_we <= r4_5g_specv5_snap_adc_bram_lsb_we_net;
  r4_5g_specv5_snap_adc_bram_msb_addr <= r4_5g_specv5_snap_adc_bram_msb_addr_net;
  r4_5g_specv5_snap_adc_bram_msb_data_in <= r4_5g_specv5_snap_adc_bram_msb_data_in_net;
  r4_5g_specv5_snap_adc_bram_msb_we <= r4_5g_specv5_snap_adc_bram_msb_we_net;
  r4_5g_specv5_snap_vacc0_addr_user_data_in <= r4_5g_specv5_snap_vacc0_addr_user_data_in_net;
  r4_5g_specv5_snap_vacc0_bram_addr <= r4_5g_specv5_snap_vacc0_bram_addr_net;
  r4_5g_specv5_snap_vacc0_bram_data_in <= r4_5g_specv5_snap_vacc0_bram_data_in_net;
  r4_5g_specv5_snap_vacc0_bram_we <= r4_5g_specv5_snap_vacc0_bram_we_net;
  r4_5g_specv5_snap_vacc1_addr_user_data_in <= r4_5g_specv5_snap_vacc1_addr_user_data_in_net;
  r4_5g_specv5_snap_vacc1_bram_addr <= r4_5g_specv5_snap_vacc1_bram_addr_net;
  r4_5g_specv5_snap_vacc1_bram_data_in <= r4_5g_specv5_snap_vacc1_bram_data_in_net;
  r4_5g_specv5_snap_vacc1_bram_we <= r4_5g_specv5_snap_vacc1_bram_we_net;
  r4_5g_specv5_snap_vacc2_addr_user_data_in <= r4_5g_specv5_snap_vacc2_addr_user_data_in_net;
  r4_5g_specv5_snap_vacc2_bram_addr <= r4_5g_specv5_snap_vacc2_bram_addr_net;
  r4_5g_specv5_snap_vacc2_bram_data_in <= r4_5g_specv5_snap_vacc2_bram_data_in_net;
  r4_5g_specv5_snap_vacc2_bram_we <= r4_5g_specv5_snap_vacc2_bram_we_net;
  r4_5g_specv5_snap_vacc3_addr_user_data_in <= r4_5g_specv5_snap_vacc3_addr_user_data_in_net;
  r4_5g_specv5_snap_vacc3_bram_addr <= r4_5g_specv5_snap_vacc3_bram_addr_net;
  r4_5g_specv5_snap_vacc3_bram_data_in <= r4_5g_specv5_snap_vacc3_bram_data_in_net;
  r4_5g_specv5_snap_vacc3_bram_we <= r4_5g_specv5_snap_vacc3_bram_we_net;
  r4_5g_specv5_sync_cnt_user_data_in <= r4_5g_specv5_sync_cnt_user_data_in_net;

  acc_cnt_b52af162d4: entity work.acc_cnt_entity_b52af162d4
    port map (
      reg_out => delay1_q_net_x0,
      convert_x0 => r4_5g_specv5_acc_cnt_user_data_in_net
    );

  acc_cntr: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_487c95d8131ef26d",
      op_arith => xlUnsigned,
      op_width => 32
    )
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      en(0) => delay28_q_net,
      rst(0) => slice2_y_net,
      op => acc_cntr_op_net
    );

  acc_cntrl_1d98c79a3b: entity work.acc_cntrl_entity_1d98c79a3b
    port map (
      acc_len => delay23_q_net_x0,
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      sync => delay10_q_net_x0,
      new_acc => logical_y_net_x2
    );

  adc_5g_8d8c5a29fa: entity work.adc_5g_entity_8d8c5a29fa
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      r4_5g_specv5_adc_5g_user_datai0 => r4_5g_specv5_adc_5g_user_datai0_net,
      r4_5g_specv5_adc_5g_user_datai1 => r4_5g_specv5_adc_5g_user_datai1_net,
      r4_5g_specv5_adc_5g_user_datai2 => r4_5g_specv5_adc_5g_user_datai2_net,
      r4_5g_specv5_adc_5g_user_datai3 => r4_5g_specv5_adc_5g_user_datai3_net,
      r4_5g_specv5_adc_5g_user_dataq0 => r4_5g_specv5_adc_5g_user_dataq0_net,
      r4_5g_specv5_adc_5g_user_dataq1 => r4_5g_specv5_adc_5g_user_dataq1_net,
      r4_5g_specv5_adc_5g_user_dataq2 => r4_5g_specv5_adc_5g_user_dataq2_net,
      r4_5g_specv5_adc_5g_user_dataq3 => r4_5g_specv5_adc_5g_user_dataq3_net,
      i0 => reinterpret_output_port_net_x8,
      i1 => reinterpret_output_port_net_x9,
      i2 => reinterpret_output_port_net_x10,
      i3 => reinterpret_output_port_net_x11,
      q0 => reinterpret_output_port_net_x12,
      q1 => reinterpret_output_port_net_x13,
      q2 => reinterpret_output_port_net_x14,
      q3 => reinterpret_output_port_net_x15
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

  delay: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => reinterpret_output_port_net_x8,
      q => delay_q_net_x2
    );

  delay1: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => acc_cntr_op_net,
      q => delay1_q_net_x0
    );

  delay10: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => delay14_q_net,
      q(0) => delay10_q_net_x0
    );

  delay11: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => single_port_ram_data_out_net_x1,
      q => delay11_q_net_x0
    );

  delay12: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => relational5_op_net_x2,
      q(0) => delay12_q_net_x0
    );

  delay13: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => single_port_ram_data_out_net_x2,
      q => delay13_q_net_x0
    );

  delay14: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => logical_y_net_x3,
      q(0) => delay14_q_net
    );

  delay15: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => concat_y_net_x52,
      q => delay15_q_net
    );

  delay16: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => concat_y_net_x53,
      q => delay16_q_net
    );

  delay17: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => delay16_q_net,
      q => delay17_q_net_x1
    );

  delay18: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => power_adder_s_net_x0,
      q => delay18_q_net
    );

  delay19: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => power_adder_s_net_x1,
      q => delay19_q_net
    );

  delay2: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => reinterpret_output_port_net_x9,
      q => delay2_q_net_x2
    );

  delay20: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => r4_5g_specv5_cnt_rst_user_data_out_net,
      q => delay20_q_net
    );

  delay21: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => sync_cntr_op_net,
      q => delay21_q_net_x0
    );

  delay22: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => reinterpret_output_port_net_x12,
      q => delay22_q_net_x2
    );

  delay23: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => r4_5g_specv5_acc_len_user_data_out_net,
      q => delay23_q_net_x0
    );

  delay24: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay24_q_net_x2
    );

  delay25: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => delay18_q_net,
      q => delay25_q_net_x0
    );

  delay26: entity work.delay_23d71a76f2
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay26_q_net_x2
    );

  delay27: entity work.delay_29899636e8
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => delay19_q_net,
      q => delay27_q_net_x0
    );

  delay28: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay28_q_net
    );

  delay29: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay29_q_net_x1
    );

  delay3: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => reinterpret_output_port_net_x10,
      q => delay3_q_net
    );

  delay30: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => reinterpret_output_port_net_x13,
      q => delay30_q_net_x2
    );

  delay31: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay31_q_net_x1
    );

  delay32: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => reinterpret_output_port_net_x14,
      q => delay32_q_net
    );

  delay33: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => reinterpret_output_port_net_x15,
      q => delay33_q_net
    );

  delay34: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => concat_y_net_x54,
      q => delay34_q_net
    );

  delay35: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => single_port_ram_data_out_net_x3,
      q => delay35_q_net_x0
    );

  delay36: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => relational5_op_net_x4,
      q(0) => delay36_q_net_x0
    );

  delay37: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => single_port_ram_data_out_net_x4,
      q => delay37_q_net_x0
    );

  delay38: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => delay48_q_net,
      q => delay38_q_net_x1
    );

  delay39: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => power_adder_s_net_x2,
      q => delay39_q_net
    );

  delay4: entity work.delay_23f848c85b
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => reinterpret_output_port_net_x11,
      q => delay4_q_net
    );

  delay40: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => power_adder_s_net_x3,
      q => delay40_q_net
    );

  delay41: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay41_q_net_x2
    );

  delay42: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => delay39_q_net,
      q => delay42_q_net_x0
    );

  delay43: entity work.delay_23d71a76f2
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay43_q_net_x2
    );

  delay44: entity work.delay_29899636e8
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => delay40_q_net,
      q => delay44_q_net_x0
    );

  delay45: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay45_q_net_x1
    );

  delay46: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => delay34_q_net,
      q => delay46_q_net_x1
    );

  delay47: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => relational5_op_net_x5,
      q(0) => delay47_q_net_x0
    );

  delay48: entity work.delay_b40a532a7c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => concat_y_net_x55,
      q => delay48_q_net
    );

  delay5: entity work.delay_d64b27fc5c
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d => delay15_q_net,
      q => delay5_q_net_x1
    );

  delay7: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => logical_y_net_x3,
      q(0) => delay7_q_net_x18
    );

  delay8: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => relational5_op_net_x3,
      q(0) => delay8_q_net_x0
    );

  delay9: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      d(0) => relational5_op_net_x0,
      q(0) => delay9_q_net_x0
    );

  fir_1_d77345f031: entity work.fir_1_entity_d77345f031
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      in_x0 => delay_q_net_x2,
      sync_in => delay7_q_net_x18,
      out_x0 => concat_y_net_x10
    );

  fir_2_505f1fa065: entity work.fir_1_entity_d77345f031
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      in_x0 => delay2_q_net_x2,
      sync_in => delay7_q_net_x18,
      out_x0 => concat_y_net_x11
    );

  fir_4_9067c135e4: entity work.fir_4_entity_9067c135e4
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      sync_in => delay7_q_net_x18,
      sync_out => delay_q_net_x27
    );

  fir_5_319448d4dd: entity work.fir_1_entity_d77345f031
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      in_x0 => delay22_q_net_x2,
      sync_in => delay7_q_net_x18,
      out_x0 => concat_y_net_x12
    );

  fir_6_e2e7505615: entity work.fir_1_entity_d77345f031
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      in_x0 => delay30_q_net_x2,
      sync_in => delay7_q_net_x18,
      out_x0 => concat_y_net_x13
    );

  led0_sync_f85f7d5b7c: entity work.led0_sync_entity_f85f7d5b7c
    port map (
      gpio_out => relational5_op_net_x1,
      convert_x0 => r4_5g_specv5_led0_sync_gateway_net
    );

  led1_new_acc_3d073be33e: entity work.led0_sync_entity_f85f7d5b7c
    port map (
      gpio_out => delay9_q_net_x0,
      convert_x0 => r4_5g_specv5_led1_new_acc_gateway_net
    );

  posedge_8be8a69257: entity work.posedge1_entity_d70b7fecd6
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      in_x0 => slice_y_net_x0,
      out_x0 => logical_y_net_x3
    );

  pulse_ext1_4051a15797: entity work.pulse_ext1_entity_4051a15797
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      in_x0 => logical_y_net_x3,
      out_x0 => relational5_op_net_x1
    );

  pulse_ext2_dbf0e456b3: entity work.pulse_ext1_entity_4051a15797
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      in_x0 => delay31_q_net_x1,
      out_x0 => relational5_op_net_x0
    );

  r4_dit_fft_bb20d3c530: entity work.r4_dit_fft_entity_bb20d3c530
    port map (
      a_in => shift_op_net_x3,
      b_in => shift1_op_net_x3,
      c_in => shift4_op_net_x4,
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      d_in => shift5_op_net_x4,
      sync_in => delay_q_net_x27,
      a_out => concat_y_net_x52,
      b_out => concat_y_net_x53,
      c_out => concat_y_net_x54,
      d_out => concat_y_net_x55
    );

  r4_power19_1_4d56d1ab0b: entity work.r4_power19_1_entity_4d56d1ab0b
    port map (
      c => delay5_q_net_x1,
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      power => power_adder_s_net_x0
    );

  r4_power19_2_8cd3f03928: entity work.r4_power19_1_entity_4d56d1ab0b
    port map (
      c => delay17_q_net_x1,
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      power => power_adder_s_net_x1
    );

  r4_power19_3_abbddd9be9: entity work.r4_power19_1_entity_4d56d1ab0b
    port map (
      c => delay46_q_net_x1,
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      power => power_adder_s_net_x2
    );

  r4_power19_4_0bb314159a: entity work.r4_power19_1_entity_4d56d1ab0b
    port map (
      c => delay38_q_net_x1,
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
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
      input_port => delay3_q_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay4_q_net,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay22_q_net_x2,
      output_port => reinterpret4_output_port_net
    );

  reinterpret5: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay30_q_net_x2,
      output_port => reinterpret5_output_port_net
    );

  reinterpret6: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay32_q_net,
      output_port => reinterpret6_output_port_net
    );

  reinterpret7: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay33_q_net,
      output_port => reinterpret7_output_port_net
    );

  shift: entity work.shift_407d711ee5
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      ip => concat_y_net_x10,
      op => shift_op_net_x3
    );

  shift1: entity work.shift_407d711ee5
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      ip => concat_y_net_x11,
      op => shift1_op_net_x3
    );

  shift4: entity work.shift_407d711ee5
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      ip => concat_y_net_x12,
      op => shift4_op_net_x4
    );

  shift5: entity work.shift_407d711ee5
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      ip => concat_y_net_x13,
      op => shift5_op_net_x4
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

  snap_adc_4bfcd7107d: entity work.snap_adc_entity_4bfcd7107d
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      din => concat3_y_net_x0,
      r4_5g_specv5_snap_adc_ctrl_user_data_out => r4_5g_specv5_snap_adc_ctrl_user_data_out_net,
      trig => constant3_op_net_x0,
      we => constant12_op_net_x0,
      addr => r4_5g_specv5_snap_adc_addr_user_data_in_net,
      bram_lsb => r4_5g_specv5_snap_adc_bram_lsb_addr_net,
      bram_lsb_x0 => r4_5g_specv5_snap_adc_bram_lsb_data_in_net,
      bram_lsb_x1 => r4_5g_specv5_snap_adc_bram_lsb_we_net,
      bram_msb => r4_5g_specv5_snap_adc_bram_msb_addr_net,
      bram_msb_x0 => r4_5g_specv5_snap_adc_bram_msb_data_in_net,
      bram_msb_x1 => r4_5g_specv5_snap_adc_bram_msb_we_net
    );

  snap_vacc0_f1b6ff57cb: entity work.snap_vacc0_entity_f1b6ff57cb
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      din => delay11_q_net_x0,
      r4_5g_specv5_snap_vacc0_ctrl_user_data_out => r4_5g_specv5_snap_vacc0_ctrl_user_data_out_net,
      trig => delay29_q_net_x1,
      we => delay12_q_net_x0,
      addr => r4_5g_specv5_snap_vacc0_addr_user_data_in_net,
      bram => r4_5g_specv5_snap_vacc0_bram_addr_net,
      bram_x0 => r4_5g_specv5_snap_vacc0_bram_data_in_net,
      bram_x1 => r4_5g_specv5_snap_vacc0_bram_we_net
    );

  snap_vacc1_a816baf518: entity work.snap_vacc1_entity_a816baf518
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      din => delay13_q_net_x0,
      r4_5g_specv5_snap_vacc1_ctrl_user_data_out => r4_5g_specv5_snap_vacc1_ctrl_user_data_out_net,
      trig => delay29_q_net_x1,
      we => delay8_q_net_x0,
      addr => r4_5g_specv5_snap_vacc1_addr_user_data_in_net,
      bram => r4_5g_specv5_snap_vacc1_bram_addr_net,
      bram_x0 => r4_5g_specv5_snap_vacc1_bram_data_in_net,
      bram_x1 => r4_5g_specv5_snap_vacc1_bram_we_net
    );

  snap_vacc2_c2f47281df: entity work.snap_vacc2_entity_c2f47281df
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      din => delay35_q_net_x0,
      r4_5g_specv5_snap_vacc2_ctrl_user_data_out => r4_5g_specv5_snap_vacc2_ctrl_user_data_out_net,
      trig => delay45_q_net_x1,
      we => delay36_q_net_x0,
      addr => r4_5g_specv5_snap_vacc2_addr_user_data_in_net,
      bram => r4_5g_specv5_snap_vacc2_bram_addr_net,
      bram_x0 => r4_5g_specv5_snap_vacc2_bram_data_in_net,
      bram_x1 => r4_5g_specv5_snap_vacc2_bram_we_net
    );

  snap_vacc3_74596c5e24: entity work.snap_vacc3_entity_74596c5e24
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      din => delay37_q_net_x0,
      r4_5g_specv5_snap_vacc3_ctrl_user_data_out => r4_5g_specv5_snap_vacc3_ctrl_user_data_out_net,
      trig => delay45_q_net_x1,
      we => delay47_q_net_x0,
      addr => r4_5g_specv5_snap_vacc3_addr_user_data_in_net,
      bram => r4_5g_specv5_snap_vacc3_bram_addr_net,
      bram_x0 => r4_5g_specv5_snap_vacc3_bram_data_in_net,
      bram_x1 => r4_5g_specv5_snap_vacc3_bram_we_net
    );

  sync_cnt_1a96c3e534: entity work.acc_cnt_entity_b52af162d4
    port map (
      reg_out => delay21_q_net_x0,
      convert_x0 => r4_5g_specv5_sync_cnt_user_data_in_net
    );

  sync_cntr: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_487c95d8131ef26d",
      op_arith => xlUnsigned,
      op_width => 32
    )
    port map (
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
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
      ce => ce_1_sg_x416,
      clk => clk_1_sg_x416,
      clr => '0',
      en => "1",
      rst => "0",
      op => sync_gen_op_net
    );

  vacc0_ff1ce515bb: entity work.vacc0_entity_ff1ce515bb
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      din => delay25_q_net_x0,
      new_acc => delay24_q_net_x2,
      dout => single_port_ram_data_out_net_x1,
      valid => relational5_op_net_x2
    );

  vacc1_cb7b32fb54: entity work.vacc0_entity_ff1ce515bb
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      din => delay27_q_net_x0,
      new_acc => delay26_q_net_x2,
      dout => single_port_ram_data_out_net_x2,
      valid => relational5_op_net_x3
    );

  vacc2_e508517ffc: entity work.vacc0_entity_ff1ce515bb
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      din => delay42_q_net_x0,
      new_acc => delay41_q_net_x2,
      dout => single_port_ram_data_out_net_x3,
      valid => relational5_op_net_x4
    );

  vacc3_acfd8cbee2: entity work.vacc0_entity_ff1ce515bb
    port map (
      ce_1 => ce_1_sg_x416,
      clk_1 => clk_1_sg_x416,
      din => delay44_q_net_x0,
      new_acc => delay43_q_net_x2,
      dout => single_port_ram_data_out_net_x4,
      valid => relational5_op_net_x5
    );

end structural;
