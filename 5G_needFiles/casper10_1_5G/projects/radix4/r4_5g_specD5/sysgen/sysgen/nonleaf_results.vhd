library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/acc_cnt"

entity acc_cnt_entity_b094c4628c is
  port (
    reg_out: in std_logic_vector(31 downto 0); 
    convert_x0: out std_logic_vector(31 downto 0)
  );
end acc_cnt_entity_b094c4628c;

architecture structural of acc_cnt_entity_b094c4628c is
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

-- Generated from Simulink block "r4_5g_specD5/acc_cntrl/posedge1"

entity posedge1_entity_a7b163b634 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end posedge1_entity_a7b163b634;

architecture structural of posedge1_entity_a7b163b634 is
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

-- Generated from Simulink block "r4_5g_specD5/acc_cntrl"

entity acc_cntrl_entity_67047630d4 is
  port (
    acc_len: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    new_acc: out std_logic
  );
end acc_cntrl_entity_67047630d4;

architecture structural of acc_cntrl_entity_67047630d4 is
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

  posedge1_a7b163b634: entity work.posedge1_entity_a7b163b634
    port map (
      ce_1 => ce_1_sg_x2,
      clk_1 => clk_1_sg_x2,
      in_x0 => register_q_net_x0,
      out_x0 => logical_y_net_x0
    );

  posedge2_234bac094b: entity work.posedge1_entity_a7b163b634
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

-- Generated from Simulink block "r4_5g_specD5/adc_5G_dmux/conv"

entity conv_entity_15155d9586 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(3 downto 0); 
    out1: out std_logic_vector(3 downto 0)
  );
end conv_entity_15155d9586;

architecture structural of conv_entity_15155d9586 is
  signal ce_1_sg_x3: std_logic;
  signal clk_1_sg_x3: std_logic;
  signal concat_y_net: std_logic_vector(3 downto 0);
  signal inverter_op_net: std_logic;
  signal r4_5g_specd5_adc_5g_dmux_user_datai0_net_x0: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(3 downto 0);
  signal slice1_y_net: std_logic_vector(2 downto 0);
  signal slice_y_net: std_logic;

begin
  ce_1_sg_x3 <= ce_1;
  clk_1_sg_x3 <= clk_1;
  r4_5g_specd5_adc_5g_dmux_user_datai0_net_x0 <= in1;
  out1 <= reinterpret_output_port_net_x0;

  concat: entity work.concat_949f038a6d
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

  reinterpret: entity work.reinterpret_520edef059
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => concat_y_net,
      output_port => reinterpret_output_port_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 3,
      new_msb => 3,
      x_width => 4,
      y_width => 1
    )
    port map (
      x => r4_5g_specd5_adc_5g_dmux_user_datai0_net_x0,
      y(0) => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 2,
      x_width => 4,
      y_width => 3
    )
    port map (
      x => r4_5g_specd5_adc_5g_dmux_user_datai0_net_x0,
      y => slice1_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/adc_5G_dmux"

entity adc_5g_dmux_entity_cb544fc405 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_datai0: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai1: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai2: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai3: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai4: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai5: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai6: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai7: in std_logic_vector(3 downto 0); 
    i0: out std_logic_vector(3 downto 0); 
    i1: out std_logic_vector(3 downto 0); 
    i2: out std_logic_vector(3 downto 0); 
    i3: out std_logic_vector(3 downto 0); 
    i4: out std_logic_vector(3 downto 0); 
    i5: out std_logic_vector(3 downto 0); 
    i6: out std_logic_vector(3 downto 0); 
    i7: out std_logic_vector(3 downto 0)
  );
end adc_5g_dmux_entity_cb544fc405;

architecture structural of adc_5g_dmux_entity_cb544fc405 is
  signal ce_1_sg_x11: std_logic;
  signal clk_1_sg_x11: std_logic;
  signal r4_5g_specd5_adc_5g_dmux_user_datai0_net_x1: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai1_net_x1: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai2_net_x1: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai3_net_x1: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai4_net_x1: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai5_net_x1: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai6_net_x1: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai7_net_x1: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x10: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x11: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x12: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x13: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x14: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x15: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x8: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x9: std_logic_vector(3 downto 0);

begin
  ce_1_sg_x11 <= ce_1;
  clk_1_sg_x11 <= clk_1;
  r4_5g_specd5_adc_5g_dmux_user_datai0_net_x1 <= r4_5g_specd5_adc_5g_dmux_user_datai0;
  r4_5g_specd5_adc_5g_dmux_user_datai1_net_x1 <= r4_5g_specd5_adc_5g_dmux_user_datai1;
  r4_5g_specd5_adc_5g_dmux_user_datai2_net_x1 <= r4_5g_specd5_adc_5g_dmux_user_datai2;
  r4_5g_specd5_adc_5g_dmux_user_datai3_net_x1 <= r4_5g_specd5_adc_5g_dmux_user_datai3;
  r4_5g_specd5_adc_5g_dmux_user_datai4_net_x1 <= r4_5g_specd5_adc_5g_dmux_user_datai4;
  r4_5g_specd5_adc_5g_dmux_user_datai5_net_x1 <= r4_5g_specd5_adc_5g_dmux_user_datai5;
  r4_5g_specd5_adc_5g_dmux_user_datai6_net_x1 <= r4_5g_specd5_adc_5g_dmux_user_datai6;
  r4_5g_specd5_adc_5g_dmux_user_datai7_net_x1 <= r4_5g_specd5_adc_5g_dmux_user_datai7;
  i0 <= reinterpret_output_port_net_x8;
  i1 <= reinterpret_output_port_net_x9;
  i2 <= reinterpret_output_port_net_x12;
  i3 <= reinterpret_output_port_net_x13;
  i4 <= reinterpret_output_port_net_x14;
  i5 <= reinterpret_output_port_net_x15;
  i6 <= reinterpret_output_port_net_x10;
  i7 <= reinterpret_output_port_net_x11;

  conv10_0bc2ea3cb0: entity work.conv_entity_15155d9586
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specd5_adc_5g_dmux_user_datai6_net_x1,
      out1 => reinterpret_output_port_net_x10
    );

  conv11_a169b4afc7: entity work.conv_entity_15155d9586
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specd5_adc_5g_dmux_user_datai7_net_x1,
      out1 => reinterpret_output_port_net_x11
    );

  conv1_b3b28033b0: entity work.conv_entity_15155d9586
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specd5_adc_5g_dmux_user_datai1_net_x1,
      out1 => reinterpret_output_port_net_x9
    );

  conv2_df8066d267: entity work.conv_entity_15155d9586
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specd5_adc_5g_dmux_user_datai2_net_x1,
      out1 => reinterpret_output_port_net_x12
    );

  conv3_352e67e496: entity work.conv_entity_15155d9586
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specd5_adc_5g_dmux_user_datai3_net_x1,
      out1 => reinterpret_output_port_net_x13
    );

  conv8_859df8ff79: entity work.conv_entity_15155d9586
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specd5_adc_5g_dmux_user_datai4_net_x1,
      out1 => reinterpret_output_port_net_x14
    );

  conv9_f7e6b6656a: entity work.conv_entity_15155d9586
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specd5_adc_5g_dmux_user_datai5_net_x1,
      out1 => reinterpret_output_port_net_x15
    );

  conv_15155d9586: entity work.conv_entity_15155d9586
    port map (
      ce_1 => ce_1_sg_x11,
      clk_1 => clk_1_sg_x11,
      in1 => r4_5g_specd5_adc_5g_dmux_user_datai0_net_x1,
      out1 => reinterpret_output_port_net_x8
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_quantize/c_to_ri"

entity c_to_ri_entity_98aee0f6b0 is
  port (
    c: in std_logic_vector(25 downto 0); 
    im: out std_logic_vector(12 downto 0); 
    re: out std_logic_vector(12 downto 0)
  );
end c_to_ri_entity_98aee0f6b0;

architecture structural of c_to_ri_entity_98aee0f6b0 is
  signal concat_y_net_x0: std_logic_vector(25 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(12 downto 0);
  signal slice_im_y_net: std_logic_vector(12 downto 0);
  signal slice_re_y_net: std_logic_vector(12 downto 0);

begin
  concat_y_net_x0 <= c;
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
      x => concat_y_net_x0,
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
      x => concat_y_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_quantize/ri_to_c"

entity ri_to_c_entity_a9bc973482 is
  port (
    im: in std_logic_vector(4 downto 0); 
    re: in std_logic_vector(4 downto 0); 
    c: out std_logic_vector(9 downto 0)
  );
end ri_to_c_entity_a9bc973482;

architecture structural of ri_to_c_entity_a9bc973482 is
  signal concat_y_net_x0: std_logic_vector(9 downto 0);
  signal force_im_output_port_net: std_logic_vector(4 downto 0);
  signal force_re_output_port_net: std_logic_vector(4 downto 0);
  signal quantize_im_dout_net_x0: std_logic_vector(4 downto 0);
  signal quantize_re_dout_net_x0: std_logic_vector(4 downto 0);

begin
  quantize_im_dout_net_x0 <= im;
  quantize_re_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_4026b2acaf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_6641bf0fb0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => quantize_im_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_6641bf0fb0
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_quantize"

entity fir_quantize_entity_b762b10f40 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sum_in: in std_logic_vector(25 downto 0); 
    sum_out: out std_logic_vector(9 downto 0)
  );
end fir_quantize_entity_b762b10f40;

architecture structural of fir_quantize_entity_b762b10f40 is
  signal ce_1_sg_x12: std_logic;
  signal clk_1_sg_x12: std_logic;
  signal concat_y_net_x2: std_logic_vector(25 downto 0);
  signal concat_y_net_x3: std_logic_vector(9 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(12 downto 0);
  signal quantize_im_dout_net_x0: std_logic_vector(4 downto 0);
  signal quantize_re_dout_net_x0: std_logic_vector(4 downto 0);

begin
  ce_1_sg_x12 <= ce_1;
  clk_1_sg_x12 <= clk_1;
  concat_y_net_x2 <= sum_in;
  sum_out <= concat_y_net_x3;

  c_to_ri_98aee0f6b0: entity work.c_to_ri_entity_98aee0f6b0
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  quantize_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 11,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 3,
      dout_width => 5,
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
      din_bin_pt => 11,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 3,
      dout_width => 5,
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

  ri_to_c_a9bc973482: entity work.ri_to_c_entity_a9bc973482
    port map (
      im => quantize_im_dout_net_x0,
      re => quantize_re_dout_net_x0,
      c => concat_y_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_1/fir_coef/c_gen"

entity c_gen_entity_bf95befd11 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_bf95befd11;

architecture structural of c_gen_entity_bf95befd11 is
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_1/fir_coef"

entity fir_coef_entity_0af9e81caa is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(3 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_0af9e81caa;

architecture structural of fir_coef_entity_0af9e81caa is
  signal ce_1_sg_x14: std_logic;
  signal clk_1_sg_x14: std_logic;
  signal data_delay_q_net_x0: std_logic_vector(3 downto 0);
  signal delay7_q_net_x1: std_logic;
  signal delay_q_net_x0: std_logic_vector(3 downto 0);
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

  c_gen_bf95befd11: entity work.c_gen_entity_bf95befd11
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
      width => 4
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_1/fir_core/c_to_ri_d"

entity c_to_ri_d_entity_a317bb28ca is
  port (
    c: in std_logic_vector(3 downto 0); 
    im: out std_logic_vector(3 downto 0); 
    re: out std_logic_vector(3 downto 0)
  );
end c_to_ri_d_entity_a317bb28ca;

architecture structural of c_to_ri_d_entity_a317bb28ca is
  signal data_delay_q_net_x1: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(3 downto 0);
  signal slice_im_y_net: std_logic_vector(3 downto 0);
  signal slice_re_y_net: std_logic_vector(3 downto 0);

begin
  data_delay_q_net_x1 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_520edef059
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_520edef059
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
      new_msb => 3,
      x_width => 4,
      y_width => 4
    )
    port map (
      x => data_delay_q_net_x1,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 3,
      x_width => 4,
      y_width => 4
    )
    port map (
      x => data_delay_q_net_x1,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_1/fir_core/mult_add_im"

entity mult_add_im_entity_4d48caf85c is
  port (
    a: in std_logic_vector(3 downto 0); 
    b: in std_logic_vector(8 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    out_x0: out std_logic_vector(12 downto 0)
  );
end mult_add_im_entity_4d48caf85c;

architecture structural of mult_add_im_entity_4d48caf85c is
  signal ce_1_sg_x15: std_logic;
  signal clk_1_sg_x15: std_logic;
  signal force_im_output_port_net_x1: std_logic_vector(3 downto 0);
  signal mem_data_net_x2: std_logic_vector(8 downto 0);
  signal mult_p_net_x0: std_logic_vector(12 downto 0);

begin
  force_im_output_port_net_x1 <= a;
  mem_data_net_x2 <= b;
  ce_1_sg_x15 <= ce_1;
  clk_1_sg_x15 <= clk_1;
  out_x0 <= mult_p_net_x0;

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 3,
      a_width => 4,
      b_arith => xlSigned,
      b_bin_pt => 8,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 4,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 4,
      c_output_width => 13,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_db7cd8a2c586bcee",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 11,
      p_width => 13,
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_1/fir_core/ri_to_c"

entity ri_to_c_entity_1fce6a81e9 is
  port (
    im: in std_logic_vector(12 downto 0); 
    re: in std_logic_vector(12 downto 0); 
    c: out std_logic_vector(25 downto 0)
  );
end ri_to_c_entity_1fce6a81e9;

architecture structural of ri_to_c_entity_1fce6a81e9 is
  signal concat_y_net_x0: std_logic_vector(25 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(12 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(12 downto 0);
  signal force_im_output_port_net: std_logic_vector(12 downto 0);
  signal force_re_output_port_net: std_logic_vector(12 downto 0);

begin
  convert_im_dout_net_x0 <= im;
  convert_re_dout_net_x0 <= re;
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_1/fir_core/tap_delay"

entity tap_delay_entity_cff57329e0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(3 downto 0); 
    out_x0: out std_logic_vector(3 downto 0)
  );
end tap_delay_entity_cff57329e0;

architecture structural of tap_delay_entity_cff57329e0 is
  signal bram_data_out_net_x0: std_logic_vector(3 downto 0);
  signal ce_1_sg_x17: std_logic;
  signal clk_1_sg_x17: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal dout_delay_q_net_x0: std_logic_vector(3 downto 0);

begin
  ce_1_sg_x17 <= ce_1;
  clk_1_sg_x17 <= clk_1;
  dout_delay_q_net_x0 <= in_x0;
  out_x0 <= bram_data_out_net_x0;

  bram: entity work.xlspram
    generic map (
      c_address_width => 10,
      c_width => 4,
      core_name0 => "bmg_24_vx5_9fbc240f5763bb94",
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_1/fir_core"

entity fir_core_entity_b2bda55e40 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coef: in std_logic_vector(8 downto 0); 
    data_in: in std_logic_vector(3 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_core_entity_b2bda55e40;

architecture structural of fir_core_entity_b2bda55e40 is
  signal bram_data_out_net_x1: std_logic_vector(3 downto 0);
  signal ce_1_sg_x18: std_logic;
  signal clk_1_sg_x18: std_logic;
  signal concat_y_net_x1: std_logic_vector(25 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(12 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(12 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(3 downto 0);
  signal dout_delay_q_net_x0: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(3 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal mult_p_net_x0: std_logic_vector(12 downto 0);
  signal mult_p_net_x1: std_logic_vector(12 downto 0);
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

  c_to_ri_d_a317bb28ca: entity work.c_to_ri_d_entity_a317bb28ca
    port map (
      c => data_delay_q_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  convert_im: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 11,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 11,
      dout_width => 13,
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
      din_bin_pt => 11,
      din_width => 13,
      dout_arith => 2,
      dout_bin_pt => 11,
      dout_width => 13,
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
      width => 4
    )
    port map (
      ce => ce_1_sg_x18,
      clk => clk_1_sg_x18,
      d => data_delay_q_net_x2,
      en => '1',
      q => dout_delay_q_net_x0
    );

  mult_add_im_4d48caf85c: entity work.mult_add_im_entity_4d48caf85c
    port map (
      a => force_im_output_port_net_x1,
      b => mem_data_net_x4,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      out_x0 => mult_p_net_x0
    );

  mult_add_re_5e919e6474: entity work.mult_add_im_entity_4d48caf85c
    port map (
      a => force_re_output_port_net_x1,
      b => mem_data_net_x4,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      out_x0 => mult_p_net_x1
    );

  ri_to_c_1fce6a81e9: entity work.ri_to_c_entity_1fce6a81e9
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

  tap_delay_cff57329e0: entity work.tap_delay_entity_cff57329e0
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_1"

entity fir_tap_1_entity_ee823ccef7 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_1_entity_ee823ccef7;

architecture structural of fir_tap_1_entity_ee823ccef7 is
  signal bram_data_out_net_x2: std_logic_vector(3 downto 0);
  signal ce_1_sg_x19: std_logic;
  signal clk_1_sg_x19: std_logic;
  signal concat_y_net_x2: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(3 downto 0);
  signal delay7_q_net_x2: std_logic;
  signal delay_q_net_x1: std_logic_vector(3 downto 0);
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

  fir_coef_0af9e81caa: entity work.fir_coef_entity_0af9e81caa
    port map (
      ce_1 => ce_1_sg_x19,
      clk_1 => clk_1_sg_x19,
      data_in => delay_q_net_x1,
      sync_in => delay7_q_net_x2,
      coef => mem_data_net_x4,
      data_out => data_delay_q_net_x2,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_b2bda55e40: entity work.fir_core_entity_b2bda55e40
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_2/fir_coef/c_gen"

entity c_gen_entity_ef9f0daf96 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_ef9f0daf96;

architecture structural of c_gen_entity_ef9f0daf96 is
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_2/fir_coef"

entity fir_coef_entity_a48abeed74 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_a48abeed74;

architecture structural of fir_coef_entity_a48abeed74 is
  signal bram_data_out_net_x3: std_logic_vector(3 downto 0);
  signal ce_1_sg_x21: std_logic;
  signal clk_1_sg_x21: std_logic;
  signal concat_y_net_x3: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(3 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(25 downto 0);
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

  c_gen_ef9f0daf96: entity work.c_gen_entity_ef9f0daf96
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
      width => 4
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
      width => 26
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_2/fir_core/mult_add_im"

entity mult_add_im_entity_bcb889fa3c is
  port (
    a: in std_logic_vector(3 downto 0); 
    b: in std_logic_vector(8 downto 0); 
    c: in std_logic_vector(12 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    out_x0: out std_logic_vector(13 downto 0)
  );
end mult_add_im_entity_bcb889fa3c;

architecture structural of mult_add_im_entity_bcb889fa3c is
  signal add_s_net_x0: std_logic_vector(13 downto 0);
  signal ce_1_sg_x22: std_logic;
  signal clk_1_sg_x22: std_logic;
  signal delay_q_net: std_logic_vector(12 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(12 downto 0);
  signal mem_data_net_x2: std_logic_vector(8 downto 0);
  signal mult_p_net: std_logic_vector(12 downto 0);

begin
  force_im_output_port_net_x2 <= a;
  mem_data_net_x2 <= b;
  force_im_output_port_net_x3 <= c;
  ce_1_sg_x22 <= ce_1;
  clk_1_sg_x22 <= clk_1;
  out_x0 <= add_s_net_x0;

  add: entity work.addsub_96c9bdbd23
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
      width => 13
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
      a_bin_pt => 3,
      a_width => 4,
      b_arith => xlSigned,
      b_bin_pt => 8,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 4,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 4,
      c_output_width => 13,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_db7cd8a2c586bcee",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 11,
      p_width => 13,
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_2/fir_core"

entity fir_core_entity_041061a131 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coef: in std_logic_vector(8 downto 0); 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_core_entity_041061a131;

architecture structural of fir_core_entity_041061a131 is
  signal add_s_net_x0: std_logic_vector(13 downto 0);
  signal add_s_net_x1: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x1: std_logic_vector(3 downto 0);
  signal ce_1_sg_x25: std_logic;
  signal clk_1_sg_x25: std_logic;
  signal concat_y_net_x1: std_logic_vector(25 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(12 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(12 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(3 downto 0);
  signal dout_delay_q_net_x0: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(12 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(25 downto 0);
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

  c_to_ri_d_146b19fdb1: entity work.c_to_ri_d_entity_a317bb28ca
    port map (
      c => data_delay_q_net_x2,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  c_to_ri_s_48260b3656: entity work.c_to_ri_entity_98aee0f6b0
    port map (
      c => sum_delay_q_net_x2,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  convert_im: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 11,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 11,
      dout_width => 13,
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
      din_bin_pt => 11,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 11,
      dout_width => 13,
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
      width => 4
    )
    port map (
      ce => ce_1_sg_x25,
      clk => clk_1_sg_x25,
      d => data_delay_q_net_x2,
      en => '1',
      q => dout_delay_q_net_x0
    );

  mult_add_im_bcb889fa3c: entity work.mult_add_im_entity_bcb889fa3c
    port map (
      a => force_im_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_im_output_port_net_x3,
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      out_x0 => add_s_net_x0
    );

  mult_add_re_eb07998a80: entity work.mult_add_im_entity_bcb889fa3c
    port map (
      a => force_re_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_re_output_port_net_x3,
      ce_1 => ce_1_sg_x25,
      clk_1 => clk_1_sg_x25,
      out_x0 => add_s_net_x1
    );

  ri_to_c_56500fbb1f: entity work.ri_to_c_entity_1fce6a81e9
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

  tap_delay_67ad385707: entity work.tap_delay_entity_cff57329e0
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_2"

entity fir_tap_2_entity_6afbc69baa is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_2_entity_6afbc69baa;

architecture structural of fir_tap_2_entity_6afbc69baa is
  signal bram_data_out_net_x4: std_logic_vector(3 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(3 downto 0);
  signal ce_1_sg_x26: std_logic;
  signal clk_1_sg_x26: std_logic;
  signal concat_y_net_x4: std_logic_vector(25 downto 0);
  signal concat_y_net_x5: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(3 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(25 downto 0);
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

  fir_coef_a48abeed74: entity work.fir_coef_entity_a48abeed74
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

  fir_core_041061a131: entity work.fir_core_entity_041061a131
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_3/fir_coef/c_gen"

entity c_gen_entity_f5b434272f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_f5b434272f;

architecture structural of c_gen_entity_f5b434272f is
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_3/fir_coef"

entity fir_coef_entity_fde0a7d7ec is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_fde0a7d7ec;

architecture structural of fir_coef_entity_fde0a7d7ec is
  signal bram_data_out_net_x6: std_logic_vector(3 downto 0);
  signal ce_1_sg_x28: std_logic;
  signal clk_1_sg_x28: std_logic;
  signal concat_y_net_x6: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(3 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(25 downto 0);
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

  c_gen_f5b434272f: entity work.c_gen_entity_f5b434272f
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
      width => 4
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
      width => 26
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_3"

entity fir_tap_3_entity_8cdcece030 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_3_entity_8cdcece030;

architecture structural of fir_tap_3_entity_8cdcece030 is
  signal bram_data_out_net_x2: std_logic_vector(3 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(3 downto 0);
  signal ce_1_sg_x33: std_logic;
  signal clk_1_sg_x33: std_logic;
  signal concat_y_net_x2: std_logic_vector(25 downto 0);
  signal concat_y_net_x7: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(3 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(25 downto 0);
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

  fir_coef_fde0a7d7ec: entity work.fir_coef_entity_fde0a7d7ec
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

  fir_core_b52a29c98d: entity work.fir_core_entity_041061a131
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_4/fir_coef/c_gen"

entity c_gen_entity_cc4b8f0ddf is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_cc4b8f0ddf;

architecture structural of c_gen_entity_cc4b8f0ddf is
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_4/fir_coef"

entity fir_coef_entity_a9c667a245 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_a9c667a245;

architecture structural of fir_coef_entity_a9c667a245 is
  signal bram_data_out_net_x3: std_logic_vector(3 downto 0);
  signal ce_1_sg_x35: std_logic;
  signal clk_1_sg_x35: std_logic;
  signal concat_y_net_x3: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(3 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(25 downto 0);
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

  c_gen_cc4b8f0ddf: entity work.c_gen_entity_cc4b8f0ddf
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
      width => 4
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
      width => 26
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_4"

entity fir_tap_4_entity_186d409008 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_4_entity_186d409008;

architecture structural of fir_tap_4_entity_186d409008 is
  signal bram_data_out_net_x4: std_logic_vector(3 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(3 downto 0);
  signal ce_1_sg_x40: std_logic;
  signal clk_1_sg_x40: std_logic;
  signal concat_y_net_x4: std_logic_vector(25 downto 0);
  signal concat_y_net_x5: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(3 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(25 downto 0);
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

  fir_coef_a9c667a245: entity work.fir_coef_entity_a9c667a245
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

  fir_core_81e1ec3467: entity work.fir_core_entity_041061a131
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_5/fir_coef/c_gen"

entity c_gen_entity_3a38054343 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_3a38054343;

architecture structural of c_gen_entity_3a38054343 is
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_5/fir_coef"

entity fir_coef_entity_743c550e81 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_coef_entity_743c550e81;

architecture structural of fir_coef_entity_743c550e81 is
  signal bram_data_out_net_x6: std_logic_vector(3 downto 0);
  signal ce_1_sg_x42: std_logic;
  signal clk_1_sg_x42: std_logic;
  signal concat_y_net_x6: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(3 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(25 downto 0);
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

  c_gen_3a38054343: entity work.c_gen_entity_3a38054343
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
      width => 4
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
      width => 26
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_5"

entity fir_tap_5_entity_29b3d0827f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0); 
    sync_out: out std_logic
  );
end fir_tap_5_entity_29b3d0827f;

architecture structural of fir_tap_5_entity_29b3d0827f is
  signal bram_data_out_net_x2: std_logic_vector(3 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(3 downto 0);
  signal ce_1_sg_x47: std_logic;
  signal clk_1_sg_x47: std_logic;
  signal concat_y_net_x2: std_logic_vector(25 downto 0);
  signal concat_y_net_x7: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(3 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(25 downto 0);
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

  fir_coef_743c550e81: entity work.fir_coef_entity_743c550e81
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

  fir_core_a4d9e3b0b5: entity work.fir_core_entity_041061a131
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_6/fir_coef/c_gen"

entity c_gen_entity_c08b0d88a0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    coef_out: out std_logic_vector(8 downto 0)
  );
end c_gen_entity_c08b0d88a0;

architecture structural of c_gen_entity_c08b0d88a0 is
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_6/fir_coef"

entity fir_coef_entity_ca7af2f237 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    coef: out std_logic_vector(8 downto 0); 
    data_out: out std_logic_vector(3 downto 0); 
    sum_out: out std_logic_vector(25 downto 0)
  );
end fir_coef_entity_ca7af2f237;

architecture structural of fir_coef_entity_ca7af2f237 is
  signal bram_data_out_net_x3: std_logic_vector(3 downto 0);
  signal ce_1_sg_x49: std_logic;
  signal clk_1_sg_x49: std_logic;
  signal concat_y_net_x3: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x0: std_logic_vector(3 downto 0);
  signal mem_data_net_x1: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x0: std_logic_vector(25 downto 0);
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

  c_gen_c08b0d88a0: entity work.c_gen_entity_c08b0d88a0
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
      width => 4
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
      width => 26
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

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_6/fir_core"

entity fir_core_entity_44873ab87f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coef: in std_logic_vector(8 downto 0); 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sum_out: out std_logic_vector(25 downto 0)
  );
end fir_core_entity_44873ab87f;

architecture structural of fir_core_entity_44873ab87f is
  signal add_s_net_x0: std_logic_vector(13 downto 0);
  signal add_s_net_x1: std_logic_vector(13 downto 0);
  signal ce_1_sg_x52: std_logic;
  signal clk_1_sg_x52: std_logic;
  signal concat_y_net_x4: std_logic_vector(25 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(12 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(12 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(12 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(3 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(12 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(25 downto 0);

begin
  ce_1_sg_x52 <= ce_1;
  clk_1_sg_x52 <= clk_1;
  mem_data_net_x4 <= coef;
  data_delay_q_net_x2 <= data_in;
  sum_delay_q_net_x2 <= sum_in;
  sum_out <= concat_y_net_x4;

  c_to_ri_d_eba7d03a2d: entity work.c_to_ri_d_entity_a317bb28ca
    port map (
      c => data_delay_q_net_x2,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  c_to_ri_s_be4476edb3: entity work.c_to_ri_entity_98aee0f6b0
    port map (
      c => sum_delay_q_net_x2,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  convert_im: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 11,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 11,
      dout_width => 13,
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
      din_bin_pt => 11,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 11,
      dout_width => 13,
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

  mult_add_im_80436eedbe: entity work.mult_add_im_entity_bcb889fa3c
    port map (
      a => force_im_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_im_output_port_net_x3,
      ce_1 => ce_1_sg_x52,
      clk_1 => clk_1_sg_x52,
      out_x0 => add_s_net_x0
    );

  mult_add_re_057a251b3e: entity work.mult_add_im_entity_bcb889fa3c
    port map (
      a => force_re_output_port_net_x2,
      b => mem_data_net_x4,
      c => force_re_output_port_net_x3,
      ce_1 => ce_1_sg_x52,
      clk_1 => clk_1_sg_x52,
      out_x0 => add_s_net_x1
    );

  ri_to_c_899bc14fe0: entity work.ri_to_c_entity_1fce6a81e9
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/fir1/fir_tap_6"

entity fir_tap_6_entity_9bff283805 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(3 downto 0); 
    sum_in: in std_logic_vector(25 downto 0); 
    sync_in: in std_logic; 
    sum_out: out std_logic_vector(25 downto 0)
  );
end fir_tap_6_entity_9bff283805;

architecture structural of fir_tap_6_entity_9bff283805 is
  signal bram_data_out_net_x4: std_logic_vector(3 downto 0);
  signal ce_1_sg_x53: std_logic;
  signal clk_1_sg_x53: std_logic;
  signal concat_y_net_x5: std_logic_vector(25 downto 0);
  signal concat_y_net_x6: std_logic_vector(25 downto 0);
  signal data_delay_q_net_x2: std_logic_vector(3 downto 0);
  signal mem_data_net_x4: std_logic_vector(8 downto 0);
  signal sum_delay_q_net_x2: std_logic_vector(25 downto 0);
  signal sync_delay_q_net_x10: std_logic;

begin
  ce_1_sg_x53 <= ce_1;
  clk_1_sg_x53 <= clk_1;
  bram_data_out_net_x4 <= data_in;
  concat_y_net_x5 <= sum_in;
  sync_delay_q_net_x10 <= sync_in;
  sum_out <= concat_y_net_x6;

  fir_coef_ca7af2f237: entity work.fir_coef_entity_ca7af2f237
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

  fir_core_44873ab87f: entity work.fir_core_entity_44873ab87f
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

-- Generated from Simulink block "r4_5g_specD5/fir1"

entity fir1_entity_b061a2406e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(3 downto 0); 
    sync_in: in std_logic; 
    out_x0: out std_logic_vector(9 downto 0)
  );
end fir1_entity_b061a2406e;

architecture structural of fir1_entity_b061a2406e is
  signal bram_data_out_net_x10: std_logic_vector(3 downto 0);
  signal bram_data_out_net_x4: std_logic_vector(3 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(3 downto 0);
  signal bram_data_out_net_x8: std_logic_vector(3 downto 0);
  signal bram_data_out_net_x9: std_logic_vector(3 downto 0);
  signal ce_1_sg_x54: std_logic;
  signal clk_1_sg_x54: std_logic;
  signal concat_y_net_x10: std_logic_vector(9 downto 0);
  signal concat_y_net_x4: std_logic_vector(25 downto 0);
  signal concat_y_net_x5: std_logic_vector(25 downto 0);
  signal concat_y_net_x6: std_logic_vector(25 downto 0);
  signal concat_y_net_x7: std_logic_vector(25 downto 0);
  signal concat_y_net_x8: std_logic_vector(25 downto 0);
  signal concat_y_net_x9: std_logic_vector(25 downto 0);
  signal delay7_q_net_x3: std_logic;
  signal delay_q_net_x2: std_logic_vector(3 downto 0);
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

  fir_quantize_b762b10f40: entity work.fir_quantize_entity_b762b10f40
    port map (
      ce_1 => ce_1_sg_x54,
      clk_1 => clk_1_sg_x54,
      sum_in => concat_y_net_x6,
      sum_out => concat_y_net_x10
    );

  fir_tap_1_ee823ccef7: entity work.fir_tap_1_entity_ee823ccef7
    port map (
      ce_1 => ce_1_sg_x54,
      clk_1 => clk_1_sg_x54,
      data_in => delay_q_net_x2,
      sync_in => delay7_q_net_x3,
      data_out => bram_data_out_net_x4,
      sum_out => concat_y_net_x4,
      sync_out => sync_delay_q_net_x6
    );

  fir_tap_2_6afbc69baa: entity work.fir_tap_2_entity_6afbc69baa
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

  fir_tap_3_8cdcece030: entity work.fir_tap_3_entity_8cdcece030
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

  fir_tap_4_186d409008: entity work.fir_tap_4_entity_186d409008
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

  fir_tap_5_29b3d0827f: entity work.fir_tap_5_entity_29b3d0827f
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

  fir_tap_6_9bff283805: entity work.fir_tap_6_entity_9bff283805
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

-- Generated from Simulink block "r4_5g_specD5/fir_4/fir_quantize"

entity fir_quantize_entity_3e3c098987 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_quantize_entity_3e3c098987;

architecture structural of fir_quantize_entity_3e3c098987 is
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

-- Generated from Simulink block "r4_5g_specD5/fir_4/fir_tap_1/fir_coef"

entity fir_coef_entity_3a20e324e3 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_coef_entity_3a20e324e3;

architecture structural of fir_coef_entity_3a20e324e3 is
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

-- Generated from Simulink block "r4_5g_specD5/fir_4/fir_tap_1"

entity fir_tap_1_entity_ec02ecd219 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_tap_1_entity_ec02ecd219;

architecture structural of fir_tap_1_entity_ec02ecd219 is
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

  fir_coef_3a20e324e3: entity work.fir_coef_entity_3a20e324e3
    port map (
      ce_1 => ce_1_sg_x101,
      clk_1 => clk_1_sg_x101,
      sync_in => delay7_q_net_x9,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_ca4788c83c: entity work.fir_quantize_entity_3e3c098987
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

-- Generated from Simulink block "r4_5g_specD5/fir_4/fir_tap_2/fir_core"

entity fir_core_entity_163ba41dfd is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_core_entity_163ba41dfd;

architecture structural of fir_core_entity_163ba41dfd is
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

-- Generated from Simulink block "r4_5g_specD5/fir_4/fir_tap_2"

entity fir_tap_2_entity_09bcd6958c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_tap_2_entity_09bcd6958c;

architecture structural of fir_tap_2_entity_09bcd6958c is
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

  fir_coef_6e0a8ec5ec: entity work.fir_coef_entity_3a20e324e3
    port map (
      ce_1 => ce_1_sg_x104,
      clk_1 => clk_1_sg_x104,
      sync_in => sync_delay_q_net_x5,
      sync_out => sync_delay_q_net_x1
    );

  fir_core_163ba41dfd: entity work.fir_core_entity_163ba41dfd
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

-- Generated from Simulink block "r4_5g_specD5/fir_4"

entity fir_4_entity_6a0e71b633 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    sync_out: out std_logic
  );
end fir_4_entity_6a0e71b633;

architecture structural of fir_4_entity_6a0e71b633 is
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

  fir_quantize_3e3c098987: entity work.fir_quantize_entity_3e3c098987
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x6,
      sync_out => delay_q_net_x1
    );

  fir_tap_1_ec02ecd219: entity work.fir_tap_1_entity_ec02ecd219
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => delay7_q_net_x10,
      sync_out => sync_delay_q_net_x5
    );

  fir_tap_2_09bcd6958c: entity work.fir_tap_2_entity_09bcd6958c
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x5,
      sync_out => sync_delay_q_net_x8
    );

  fir_tap_3_464a2a0b54: entity work.fir_tap_2_entity_09bcd6958c
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x8,
      sync_out => sync_delay_q_net_x9
    );

  fir_tap_4_62a089b117: entity work.fir_tap_2_entity_09bcd6958c
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x9,
      sync_out => sync_delay_q_net_x10
    );

  fir_tap_5_74a38d9114: entity work.fir_tap_2_entity_09bcd6958c
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      sync_in => sync_delay_q_net_x10,
      sync_out => sync_delay_q_net_x11
    );

  fir_tap_6_af2fdeb013: entity work.fir_tap_2_entity_09bcd6958c
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

-- Generated from Simulink block "r4_5g_specD5/led0_sync"

entity led0_sync_entity_63dd83c044 is
  port (
    gpio_out: in std_logic; 
    convert_x0: out std_logic
  );
end led0_sync_entity_63dd83c044;

architecture structural of led0_sync_entity_63dd83c044 is
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

-- Generated from Simulink block "r4_5g_specD5/pulse_ext1"

entity pulse_ext1_entity_53273fddd4 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end pulse_ext1_entity_53273fddd4;

architecture structural of pulse_ext1_entity_53273fddd4 is
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

  posedge_5092b87e87: entity work.posedge1_entity_a7b163b634
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_3753017bc5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(9 downto 0); 
    out_x0: out std_logic_vector(9 downto 0)
  );
end delay_b_entity_3753017bc5;

architecture structural of delay_b_entity_3753017bc5 is
  signal bram_data_out_net_x1: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x2: std_logic_vector(9 downto 0);
  signal ce_1_sg_x209: std_logic;
  signal clk_1_sg_x209: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x209 <= ce_1;
  clk_1_sg_x209 <= clk_1;
  bram_data_out_net_x1 <= in_x0;
  out_x0 <= bram_data_out_net_x2;

  bram: entity work.xlspram
    generic map (
      c_address_width => 8,
      c_width => 10,
      core_name0 => "bmg_24_vx5_6fb941694e0a834d",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
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
      ce => ce_1_sg_x209,
      clk => clk_1_sg_x209,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_d94d0f5a44 is
  port (
    aloahi: in std_logic_vector(9 downto 0); 
    blobhi: in std_logic_vector(9 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(9 downto 0); 
    aloblo: out std_logic_vector(9 downto 0)
  );
end biplex_commutator_01_entity_d94d0f5a44;

architecture structural of biplex_commutator_01_entity_d94d0f5a44 is
  signal bram_data_out_net_x2: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x4: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(9 downto 0);
  signal ce_1_sg_x211: std_logic;
  signal clk_1_sg_x211: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic_vector(9 downto 0);
  signal top_bit_y_net: std_logic;

begin
  bram_data_out_net_x3 <= aloahi;
  bram_data_out_net_x4 <= blobhi;
  ce_1_sg_x211 <= ce_1;
  clk_1_sg_x211 <= clk_1;
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
      ce => ce_1_sg_x211,
      clk => clk_1_sg_x211,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_3753017bc5: entity work.delay_b_entity_3753017bc5
    port map (
      ce_1 => ce_1_sg_x211,
      clk_1 => clk_1_sg_x211,
      in_x0 => bram_data_out_net_x4,
      out_x0 => bram_data_out_net_x2
    );

  delay_lo_1204181b0a: entity work.delay_b_entity_3753017bc5
    port map (
      ce_1 => ce_1_sg_x211,
      clk_1 => clk_1_sg_x211,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x5
    );

  mux: entity work.mux_bdc1db9d7e
    port map (
      ce => ce_1_sg_x211,
      clk => clk_1_sg_x211,
      clr => '0',
      d0 => bram_data_out_net_x3,
      d1 => bram_data_out_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_bdc1db9d7e
    port map (
      ce => ce_1_sg_x211,
      clk => clk_1_sg_x211,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_b69fa550ff is
  port (
    aloahi: in std_logic_vector(9 downto 0); 
    blobhi: in std_logic_vector(9 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(9 downto 0); 
    aloblo: out std_logic_vector(9 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_23_entity_b69fa550ff;

architecture structural of biplex_commutator_23_entity_b69fa550ff is
  signal bram_data_out_net_x0: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x2: std_logic_vector(9 downto 0);
  signal ce_1_sg_x214: std_logic;
  signal clk_1_sg_x214: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x2: std_logic_vector(9 downto 0);
  signal mux1_y_net_x3: std_logic_vector(9 downto 0);
  signal mux1_y_net_x4: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic_vector(9 downto 0);
  signal top_bit_y_net: std_logic;

begin
  mux1_y_net_x2 <= aloahi;
  mux1_y_net_x3 <= blobhi;
  ce_1_sg_x214 <= ce_1;
  clk_1_sg_x214 <= clk_1;
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
      ce => ce_1_sg_x214,
      clk => clk_1_sg_x214,
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
      ce => ce_1_sg_x214,
      clk => clk_1_sg_x214,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_09b7b06962: entity work.delay_b_entity_3753017bc5
    port map (
      ce_1 => ce_1_sg_x214,
      clk_1 => clk_1_sg_x214,
      in_x0 => mux1_y_net_x3,
      out_x0 => bram_data_out_net_x0
    );

  delay_lo_c8b09e2063: entity work.delay_b_entity_3753017bc5
    port map (
      ce_1 => ce_1_sg_x214,
      clk_1 => clk_1_sg_x214,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x2
    );

  mux: entity work.mux_bdc1db9d7e
    port map (
      ce => ce_1_sg_x214,
      clk => clk_1_sg_x214,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => bram_data_out_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_bdc1db9d7e
    port map (
      ce => ce_1_sg_x214,
      clk => clk_1_sg_x214,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_b883cd2ae1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(9 downto 0); 
    out_x0: out std_logic_vector(9 downto 0)
  );
end delay_b_entity_b883cd2ae1;

architecture structural of delay_b_entity_b883cd2ae1 is
  signal bram_data_out_net_x0: std_logic_vector(9 downto 0);
  signal ce_1_sg_x215: std_logic;
  signal clk_1_sg_x215: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal shift4_op_net_x0: std_logic_vector(9 downto 0);

begin
  ce_1_sg_x215 <= ce_1;
  clk_1_sg_x215 <= clk_1;
  shift4_op_net_x0 <= in_x0;
  out_x0 <= bram_data_out_net_x0;

  bram: entity work.xlspram
    generic map (
      c_address_width => 9,
      c_width => 10,
      core_name0 => "bmg_24_vx5_685a21f0e7f36bff",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x215,
      clk => clk_1_sg_x215,
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
      ce => ce_1_sg_x215,
      clk => clk_1_sg_x215,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_54dd4bc092 is
  port (
    aloahi: in std_logic_vector(9 downto 0); 
    blobhi: in std_logic_vector(9 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(9 downto 0); 
    aloblo: out std_logic_vector(9 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_ac_entity_54dd4bc092;

architecture structural of biplex_commutator_ac_entity_54dd4bc092 is
  signal bram_data_out_net_x0: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(9 downto 0);
  signal ce_1_sg_x217: std_logic;
  signal clk_1_sg_x217: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x3: std_logic;
  signal mux1_y_net_x3: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic_vector(9 downto 0);
  signal shift4_op_net_x1: std_logic_vector(9 downto 0);
  signal shift_op_net_x0: std_logic_vector(9 downto 0);
  signal top_bit_y_net: std_logic;

begin
  shift_op_net_x0 <= aloahi;
  shift4_op_net_x1 <= blobhi;
  ce_1_sg_x217 <= ce_1;
  clk_1_sg_x217 <= clk_1;
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
      ce => ce_1_sg_x217,
      clk => clk_1_sg_x217,
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
      ce => ce_1_sg_x217,
      clk => clk_1_sg_x217,
      d(0) => delay_q_net_x2,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay_b_b883cd2ae1: entity work.delay_b_entity_b883cd2ae1
    port map (
      ce_1 => ce_1_sg_x217,
      clk_1 => clk_1_sg_x217,
      in_x0 => shift4_op_net_x1,
      out_x0 => bram_data_out_net_x0
    );

  delay_lo_2023198553: entity work.delay_b_entity_b883cd2ae1
    port map (
      ce_1 => ce_1_sg_x217,
      clk_1 => clk_1_sg_x217,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x5
    );

  mux: entity work.mux_bdc1db9d7e
    port map (
      ce => ce_1_sg_x217,
      clk => clk_1_sg_x217,
      clr => '0',
      d0 => shift_op_net_x0,
      d1 => bram_data_out_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_bdc1db9d7e
    port map (
      ce => ce_1_sg_x217,
      clk => clk_1_sg_x217,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/quadplex_commutator"

entity quadplex_commutator_entity_d4e6378bb1 is
  port (
    a: in std_logic_vector(9 downto 0); 
    b: in std_logic_vector(9 downto 0); 
    c: in std_logic_vector(9 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(9 downto 0); 
    sync_in: in std_logic; 
    abcd0: out std_logic_vector(9 downto 0); 
    abcd1: out std_logic_vector(9 downto 0); 
    abcd2: out std_logic_vector(9 downto 0); 
    abcd3: out std_logic_vector(9 downto 0); 
    sync_out: out std_logic
  );
end quadplex_commutator_entity_d4e6378bb1;

architecture structural of quadplex_commutator_entity_d4e6378bb1 is
  signal bram_data_out_net_x6: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x8: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x9: std_logic_vector(9 downto 0);
  signal ce_1_sg_x221: std_logic;
  signal clk_1_sg_x221: std_logic;
  signal delay_q_net_x4: std_logic;
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x6: std_logic;
  signal delay_q_net_x7: std_logic;
  signal mux1_y_net_x3: std_logic_vector(9 downto 0);
  signal mux1_y_net_x5: std_logic_vector(9 downto 0);
  signal mux1_y_net_x6: std_logic_vector(9 downto 0);
  signal mux1_y_net_x7: std_logic_vector(9 downto 0);
  signal shift1_op_net_x1: std_logic_vector(9 downto 0);
  signal shift4_op_net_x2: std_logic_vector(9 downto 0);
  signal shift5_op_net_x2: std_logic_vector(9 downto 0);
  signal shift_op_net_x1: std_logic_vector(9 downto 0);

begin
  shift_op_net_x1 <= a;
  shift1_op_net_x1 <= b;
  shift4_op_net_x2 <= c;
  ce_1_sg_x221 <= ce_1;
  clk_1_sg_x221 <= clk_1;
  shift5_op_net_x2 <= d;
  delay_q_net_x6 <= sync_in;
  abcd0 <= bram_data_out_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= bram_data_out_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x7;

  biplex_commutator_01_d94d0f5a44: entity work.biplex_commutator_01_entity_d94d0f5a44
    port map (
      aloahi => bram_data_out_net_x6,
      blobhi => bram_data_out_net_x7,
      ce_1 => ce_1_sg_x221,
      clk_1 => clk_1_sg_x221,
      sync_in => delay_q_net_x4,
      ahibhi => mux1_y_net_x6,
      aloblo => bram_data_out_net_x8
    );

  biplex_commutator_23_b69fa550ff: entity work.biplex_commutator_23_entity_b69fa550ff
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x221,
      clk_1 => clk_1_sg_x221,
      sync_in => delay_q_net_x5,
      ahibhi => mux1_y_net_x7,
      aloblo => bram_data_out_net_x9,
      sync_out => delay_q_net_x7
    );

  biplex_commutator_ac_54dd4bc092: entity work.biplex_commutator_ac_entity_54dd4bc092
    port map (
      aloahi => shift_op_net_x1,
      blobhi => shift4_op_net_x2,
      ce_1 => ce_1_sg_x221,
      clk_1 => clk_1_sg_x221,
      sync_in => delay_q_net_x6,
      ahibhi => mux1_y_net_x3,
      aloblo => bram_data_out_net_x6,
      sync_out => delay_q_net_x4
    );

  biplex_commutator_bd_090119e08c: entity work.biplex_commutator_ac_entity_54dd4bc092
    port map (
      aloahi => shift1_op_net_x1,
      blobhi => shift5_op_net_x2,
      ce_1 => ce_1_sg_x221,
      clk_1 => clk_1_sg_x221,
      sync_in => delay_q_net_x6,
      ahibhi => mux1_y_net_x5,
      aloblo => bram_data_out_net_x7,
      sync_out => delay_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_a0b35914a5 is
  port (
    c: in std_logic_vector(9 downto 0); 
    im: out std_logic_vector(4 downto 0); 
    re: out std_logic_vector(4 downto 0)
  );
end c_to_ri_entity_a0b35914a5;

architecture structural of c_to_ri_entity_a0b35914a5 is
  signal bram_data_out_net_x9: std_logic_vector(9 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(4 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(4 downto 0);
  signal slice_im_y_net: std_logic_vector(4 downto 0);
  signal slice_re_y_net: std_logic_vector(4 downto 0);

begin
  bram_data_out_net_x9 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_69d3b5df7b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_69d3b5df7b
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
      new_msb => 4,
      x_width => 10,
      y_width => 5
    )
    port map (
      x => bram_data_out_net_x9,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 5,
      new_msb => 9,
      x_width => 10,
      y_width => 5
    )
    port map (
      x => bram_data_out_net_x9,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_198280dd40 is
  port (
    im: in std_logic_vector(5 downto 0); 
    re: in std_logic_vector(5 downto 0); 
    c: out std_logic_vector(11 downto 0)
  );
end ri_to_c_entity_198280dd40;

architecture structural of ri_to_c_entity_198280dd40 is
  signal concat_y_net_x0: std_logic_vector(11 downto 0);
  signal force_im_output_port_net: std_logic_vector(5 downto 0);
  signal force_re_output_port_net: std_logic_vector(5 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(5 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(5 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_94752cfe6a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_b5050de978
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_b5050de978
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly0"

entity butterfly0_entity_aff70b2e29 is
  port (
    a: in std_logic_vector(9 downto 0); 
    b: in std_logic_vector(9 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(11 downto 0); 
    a_b_x0: out std_logic_vector(11 downto 0)
  );
end butterfly0_entity_aff70b2e29;

architecture structural of butterfly0_entity_aff70b2e29 is
  signal add_im_s_net: std_logic_vector(5 downto 0);
  signal add_re_s_net: std_logic_vector(5 downto 0);
  signal bram_data_out_net_x11: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x12: std_logic_vector(9 downto 0);
  signal ce_1_sg_x222: std_logic;
  signal clk_1_sg_x222: std_logic;
  signal concat_y_net_x2: std_logic_vector(11 downto 0);
  signal concat_y_net_x3: std_logic_vector(11 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(4 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(4 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(4 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(4 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(5 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(5 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(5 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(5 downto 0);
  signal shift0_op_net: std_logic_vector(5 downto 0);
  signal shift1_op_net: std_logic_vector(5 downto 0);
  signal shift2_op_net: std_logic_vector(5 downto 0);
  signal shift3_op_net: std_logic_vector(5 downto 0);
  signal sub_im_s_net: std_logic_vector(5 downto 0);
  signal sub_re_s_net: std_logic_vector(5 downto 0);

begin
  bram_data_out_net_x11 <= a;
  bram_data_out_net_x12 <= b;
  ce_1_sg_x222 <= ce_1;
  clk_1_sg_x222 <= clk_1;
  a_b <= concat_y_net_x2;
  a_b_x0 <= concat_y_net_x3;

  add_im: entity work.addsub_eb4d860591
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x222,
      clk => clk_1_sg_x222,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_eb4d860591
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x222,
      clk => clk_1_sg_x222,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_e92658dc7b: entity work.c_to_ri_entity_a0b35914a5
    port map (
      c => bram_data_out_net_x12,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_a0b35914a5: entity work.c_to_ri_entity_a0b35914a5
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
      din_width => 6,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 6,
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
      din_width => 6,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 6,
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
      din_width => 6,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 6,
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
      din_width => 6,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 6,
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

  ri_to_c1_517f179b73: entity work.ri_to_c_entity_198280dd40
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x3
    );

  ri_to_c_198280dd40: entity work.ri_to_c_entity_198280dd40
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x2
    );

  shift0: entity work.scale_d36db02c7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_d36db02c7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_d36db02c7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_d36db02c7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_9c7e273d9e
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x222,
      clk => clk_1_sg_x222,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_9c7e273d9e
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x222,
      clk => clk_1_sg_x222,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly1"

entity butterfly1_entity_1f08db8b49 is
  port (
    a: in std_logic_vector(9 downto 0); 
    b: in std_logic_vector(9 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(11 downto 0); 
    a_b_x0: out std_logic_vector(11 downto 0); 
    sync_out: out std_logic
  );
end butterfly1_entity_1f08db8b49;

architecture structural of butterfly1_entity_1f08db8b49 is
  signal add_im_s_net: std_logic_vector(5 downto 0);
  signal add_re_s_net: std_logic_vector(5 downto 0);
  signal ce_1_sg_x223: std_logic;
  signal clk_1_sg_x223: std_logic;
  signal concat_y_net_x2: std_logic_vector(11 downto 0);
  signal concat_y_net_x3: std_logic_vector(11 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x8: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(4 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(4 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(4 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(4 downto 0);
  signal mux1_y_net_x10: std_logic_vector(9 downto 0);
  signal mux1_y_net_x9: std_logic_vector(9 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(5 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(5 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(5 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(5 downto 0);
  signal shift0_op_net: std_logic_vector(5 downto 0);
  signal shift1_op_net: std_logic_vector(5 downto 0);
  signal shift2_op_net: std_logic_vector(5 downto 0);
  signal shift3_op_net: std_logic_vector(5 downto 0);
  signal sub_im_s_net: std_logic_vector(5 downto 0);
  signal sub_re_s_net: std_logic_vector(5 downto 0);

begin
  mux1_y_net_x9 <= a;
  mux1_y_net_x10 <= b;
  ce_1_sg_x223 <= ce_1;
  clk_1_sg_x223 <= clk_1;
  delay_q_net_x8 <= sync_in;
  a_b <= concat_y_net_x2;
  a_b_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_eb4d860591
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x223,
      clk => clk_1_sg_x223,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_eb4d860591
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x223,
      clk => clk_1_sg_x223,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_a221727027: entity work.c_to_ri_entity_a0b35914a5
    port map (
      c => mux1_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_5f8f1f741a: entity work.c_to_ri_entity_a0b35914a5
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
      ce => ce_1_sg_x223,
      clk => clk_1_sg_x223,
      d(0) => delay_q_net_x8,
      en => '1',
      q(0) => delay_q_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 6,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 6,
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
      din_width => 6,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 6,
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
      din_width => 6,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 6,
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
      din_width => 6,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 6,
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

  ri_to_c1_0859976cbe: entity work.ri_to_c_entity_198280dd40
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x3
    );

  ri_to_c_d583bf9bc1: entity work.ri_to_c_entity_198280dd40
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x2
    );

  shift0: entity work.scale_d36db02c7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_d36db02c7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_d36db02c7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_d36db02c7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_9c7e273d9e
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x223,
      clk => clk_1_sg_x223,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_9c7e273d9e
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x223,
      clk => clk_1_sg_x223,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_f5baeb3113 is
  port (
    c: in std_logic_vector(11 downto 0); 
    im: out std_logic_vector(5 downto 0); 
    re: out std_logic_vector(5 downto 0)
  );
end c_to_ri_entity_f5baeb3113;

architecture structural of c_to_ri_entity_f5baeb3113 is
  signal concat_y_net_x3: std_logic_vector(11 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(5 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(5 downto 0);
  signal slice_im_y_net: std_logic_vector(5 downto 0);
  signal slice_re_y_net: std_logic_vector(5 downto 0);

begin
  concat_y_net_x3 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_f88c654950
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_f88c654950
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
      new_msb => 5,
      x_width => 12,
      y_width => 6
    )
    port map (
      x => concat_y_net_x3,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 11,
      x_width => 12,
      y_width => 6
    )
    port map (
      x => concat_y_net_x3,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_0182c718d6 is
  port (
    im: in std_logic_vector(6 downto 0); 
    re: in std_logic_vector(6 downto 0); 
    c: out std_logic_vector(13 downto 0)
  );
end ri_to_c_entity_0182c718d6;

architecture structural of ri_to_c_entity_0182c718d6 is
  signal concat_y_net_x0: std_logic_vector(13 downto 0);
  signal force_im_output_port_net: std_logic_vector(6 downto 0);
  signal force_re_output_port_net: std_logic_vector(6 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(6 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(6 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_2826c43530
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_a24d852164
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_a24d852164
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly2"

entity butterfly2_entity_c160579bda is
  port (
    a: in std_logic_vector(11 downto 0); 
    b: in std_logic_vector(11 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(13 downto 0); 
    a_b_x0: out std_logic_vector(13 downto 0)
  );
end butterfly2_entity_c160579bda;

architecture structural of butterfly2_entity_c160579bda is
  signal add_im_s_net: std_logic_vector(6 downto 0);
  signal add_re_s_net: std_logic_vector(6 downto 0);
  signal ce_1_sg_x224: std_logic;
  signal clk_1_sg_x224: std_logic;
  signal concat_y_net_x6: std_logic_vector(11 downto 0);
  signal concat_y_net_x7: std_logic_vector(11 downto 0);
  signal concat_y_net_x8: std_logic_vector(13 downto 0);
  signal concat_y_net_x9: std_logic_vector(13 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(5 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(5 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(5 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(5 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(6 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(6 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(6 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(6 downto 0);
  signal shift0_op_net: std_logic_vector(6 downto 0);
  signal shift1_op_net: std_logic_vector(6 downto 0);
  signal shift2_op_net: std_logic_vector(6 downto 0);
  signal shift3_op_net: std_logic_vector(6 downto 0);
  signal sub_im_s_net: std_logic_vector(6 downto 0);
  signal sub_re_s_net: std_logic_vector(6 downto 0);

begin
  concat_y_net_x6 <= a;
  concat_y_net_x7 <= b;
  ce_1_sg_x224 <= ce_1;
  clk_1_sg_x224 <= clk_1;
  a_b <= concat_y_net_x8;
  a_b_x0 <= concat_y_net_x9;

  add_im: entity work.addsub_a184f24b37
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x224,
      clk => clk_1_sg_x224,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_a184f24b37
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x224,
      clk => clk_1_sg_x224,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_a25c809079: entity work.c_to_ri_entity_f5baeb3113
    port map (
      c => concat_y_net_x7,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_f5baeb3113: entity work.c_to_ri_entity_f5baeb3113
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
      din_width => 7,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 7,
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
      din_width => 7,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 7,
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
      din_width => 7,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 7,
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
      din_width => 7,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 7,
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

  ri_to_c1_bb2d3bec88: entity work.ri_to_c_entity_0182c718d6
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x9
    );

  ri_to_c_0182c718d6: entity work.ri_to_c_entity_0182c718d6
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x8
    );

  shift0: entity work.scale_ccd10303d7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_ccd10303d7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_ccd10303d7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_ccd10303d7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_7fcae3aac5
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x224,
      clk => clk_1_sg_x224,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_7fcae3aac5
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x224,
      clk => clk_1_sg_x224,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/r4_butterfly/butterfly3j"

entity butterfly3j_entity_271a801ff3 is
  port (
    a: in std_logic_vector(11 downto 0); 
    b: in std_logic_vector(11 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(13 downto 0); 
    a_b_x0: out std_logic_vector(13 downto 0); 
    sync_out: out std_logic
  );
end butterfly3j_entity_271a801ff3;

architecture structural of butterfly3j_entity_271a801ff3 is
  signal add_im_s_net: std_logic_vector(6 downto 0);
  signal add_re_s_net: std_logic_vector(6 downto 0);
  signal ce_1_sg_x225: std_logic;
  signal clk_1_sg_x225: std_logic;
  signal concat_y_net_x6: std_logic_vector(11 downto 0);
  signal concat_y_net_x7: std_logic_vector(11 downto 0);
  signal concat_y_net_x8: std_logic_vector(13 downto 0);
  signal concat_y_net_x9: std_logic_vector(13 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(5 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(5 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(5 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(5 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(6 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(6 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(6 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(6 downto 0);
  signal shift0_op_net: std_logic_vector(6 downto 0);
  signal shift1_op_net: std_logic_vector(6 downto 0);
  signal shift2_op_net: std_logic_vector(6 downto 0);
  signal shift3_op_net: std_logic_vector(6 downto 0);
  signal sub_im_s_net: std_logic_vector(6 downto 0);
  signal sub_re_s_net: std_logic_vector(6 downto 0);

begin
  concat_y_net_x6 <= a;
  concat_y_net_x7 <= b;
  ce_1_sg_x225 <= ce_1;
  clk_1_sg_x225 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x8;
  a_b_x0 <= concat_y_net_x9;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_7fcae3aac5
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_a184f24b37
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_899989a746: entity work.c_to_ri_entity_f5baeb3113
    port map (
      c => concat_y_net_x7,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_ab1207d4c4: entity work.c_to_ri_entity_f5baeb3113
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
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 7,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 7,
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
      din_width => 7,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 7,
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
      din_width => 7,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 7,
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
      din_width => 7,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 7,
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

  ri_to_c1_d542ad0364: entity work.ri_to_c_entity_0182c718d6
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x9
    );

  ri_to_c_02ab7d40e6: entity work.ri_to_c_entity_0182c718d6
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x8
    );

  shift0: entity work.scale_ccd10303d7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_ccd10303d7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_ccd10303d7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_ccd10303d7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_a184f24b37
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_7fcae3aac5
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x225,
      clk => clk_1_sg_x225,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1/r4_butterfly"

entity r4_butterfly_entity_72033f4f93 is
  port (
    a_in: in std_logic_vector(9 downto 0); 
    b_in: in std_logic_vector(9 downto 0); 
    c_in: in std_logic_vector(9 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(9 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(13 downto 0); 
    b_out: out std_logic_vector(13 downto 0); 
    c_out: out std_logic_vector(13 downto 0); 
    d_out: out std_logic_vector(13 downto 0); 
    sync_out: out std_logic
  );
end r4_butterfly_entity_72033f4f93;

architecture structural of r4_butterfly_entity_72033f4f93 is
  signal bram_data_out_net_x13: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x14: std_logic_vector(9 downto 0);
  signal ce_1_sg_x226: std_logic;
  signal clk_1_sg_x226: std_logic;
  signal concat_y_net_x14: std_logic_vector(13 downto 0);
  signal concat_y_net_x15: std_logic_vector(13 downto 0);
  signal concat_y_net_x16: std_logic_vector(13 downto 0);
  signal concat_y_net_x17: std_logic_vector(13 downto 0);
  signal concat_y_net_x6: std_logic_vector(11 downto 0);
  signal concat_y_net_x7: std_logic_vector(11 downto 0);
  signal concat_y_net_x8: std_logic_vector(11 downto 0);
  signal concat_y_net_x9: std_logic_vector(11 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x10: std_logic;
  signal delay_q_net_x9: std_logic;
  signal mux1_y_net_x11: std_logic_vector(9 downto 0);
  signal mux1_y_net_x12: std_logic_vector(9 downto 0);

begin
  bram_data_out_net_x13 <= a_in;
  mux1_y_net_x11 <= b_in;
  bram_data_out_net_x14 <= c_in;
  ce_1_sg_x226 <= ce_1;
  clk_1_sg_x226 <= clk_1;
  mux1_y_net_x12 <= d_in;
  delay_q_net_x9 <= sync_in;
  a_out <= concat_y_net_x14;
  b_out <= concat_y_net_x15;
  c_out <= concat_y_net_x16;
  d_out <= concat_y_net_x17;
  sync_out <= delay_q_net_x10;

  butterfly0_aff70b2e29: entity work.butterfly0_entity_aff70b2e29
    port map (
      a => bram_data_out_net_x13,
      b => bram_data_out_net_x14,
      ce_1 => ce_1_sg_x226,
      clk_1 => clk_1_sg_x226,
      a_b => concat_y_net_x6,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_1f08db8b49: entity work.butterfly1_entity_1f08db8b49
    port map (
      a => mux1_y_net_x11,
      b => mux1_y_net_x12,
      ce_1 => ce_1_sg_x226,
      clk_1 => clk_1_sg_x226,
      sync_in => delay_q_net_x9,
      a_b => concat_y_net_x8,
      a_b_x0 => concat_y_net_x9,
      sync_out => delay_q_net_x1
    );

  butterfly2_c160579bda: entity work.butterfly2_entity_c160579bda
    port map (
      a => concat_y_net_x6,
      b => concat_y_net_x8,
      ce_1 => ce_1_sg_x226,
      clk_1 => clk_1_sg_x226,
      a_b => concat_y_net_x14,
      a_b_x0 => concat_y_net_x15
    );

  butterfly3j_271a801ff3: entity work.butterfly3j_entity_271a801ff3
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x9,
      ce_1 => ce_1_sg_x226,
      clk_1 => clk_1_sg_x226,
      sync_in => delay_q_net_x1,
      a_b => concat_y_net_x16,
      a_b_x0 => concat_y_net_x17,
      sync_out => delay_q_net_x10
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_1"

entity r4_dit_stage_1_entity_280c7c258f is
  port (
    a_in: in std_logic_vector(9 downto 0); 
    b_in: in std_logic_vector(9 downto 0); 
    c_in: in std_logic_vector(9 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(9 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(13 downto 0); 
    b_out: out std_logic_vector(13 downto 0); 
    c_out: out std_logic_vector(13 downto 0); 
    d_out: out std_logic_vector(13 downto 0); 
    sync_out: out std_logic
  );
end r4_dit_stage_1_entity_280c7c258f;

architecture structural of r4_dit_stage_1_entity_280c7c258f is
  signal bram_data_out_net_x13: std_logic_vector(9 downto 0);
  signal bram_data_out_net_x14: std_logic_vector(9 downto 0);
  signal ce_1_sg_x227: std_logic;
  signal clk_1_sg_x227: std_logic;
  signal concat_y_net_x18: std_logic_vector(13 downto 0);
  signal concat_y_net_x19: std_logic_vector(13 downto 0);
  signal concat_y_net_x20: std_logic_vector(13 downto 0);
  signal concat_y_net_x21: std_logic_vector(13 downto 0);
  signal delay_q_net_x11: std_logic;
  signal delay_q_net_x12: std_logic;
  signal delay_q_net_x9: std_logic;
  signal mux1_y_net_x11: std_logic_vector(9 downto 0);
  signal mux1_y_net_x12: std_logic_vector(9 downto 0);
  signal shift1_op_net_x2: std_logic_vector(9 downto 0);
  signal shift4_op_net_x3: std_logic_vector(9 downto 0);
  signal shift5_op_net_x3: std_logic_vector(9 downto 0);
  signal shift_op_net_x2: std_logic_vector(9 downto 0);

begin
  shift_op_net_x2 <= a_in;
  shift1_op_net_x2 <= b_in;
  shift4_op_net_x3 <= c_in;
  ce_1_sg_x227 <= ce_1;
  clk_1_sg_x227 <= clk_1;
  shift5_op_net_x3 <= d_in;
  delay_q_net_x11 <= sync_in;
  a_out <= concat_y_net_x18;
  b_out <= concat_y_net_x19;
  c_out <= concat_y_net_x20;
  d_out <= concat_y_net_x21;
  sync_out <= delay_q_net_x12;

  quadplex_commutator_d4e6378bb1: entity work.quadplex_commutator_entity_d4e6378bb1
    port map (
      a => shift_op_net_x2,
      b => shift1_op_net_x2,
      c => shift4_op_net_x3,
      ce_1 => ce_1_sg_x227,
      clk_1 => clk_1_sg_x227,
      d => shift5_op_net_x3,
      sync_in => delay_q_net_x11,
      abcd0 => bram_data_out_net_x13,
      abcd1 => mux1_y_net_x11,
      abcd2 => bram_data_out_net_x14,
      abcd3 => mux1_y_net_x12,
      sync_out => delay_q_net_x9
    );

  r4_butterfly_72033f4f93: entity work.r4_butterfly_entity_72033f4f93
    port map (
      a_in => bram_data_out_net_x13,
      b_in => mux1_y_net_x11,
      c_in => bram_data_out_net_x14,
      ce_1 => ce_1_sg_x227,
      clk_1 => clk_1_sg_x227,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_2b6a1841aa is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(13 downto 0); 
    out_x0: out std_logic_vector(13 downto 0)
  );
end delay_b_entity_2b6a1841aa;

architecture structural of delay_b_entity_2b6a1841aa is
  signal bram_data_out_net_x1: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x2: std_logic_vector(13 downto 0);
  signal ce_1_sg_x228: std_logic;
  signal clk_1_sg_x228: std_logic;
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(5 downto 0);

begin
  ce_1_sg_x228 <= ce_1;
  clk_1_sg_x228 <= clk_1;
  bram_data_out_net_x1 <= in_x0;
  out_x0 <= bram_data_out_net_x2;

  bram: entity work.xlspram
    generic map (
      c_address_width => 6,
      c_width => 14,
      core_name0 => "bmg_24_vx5_8710d0c563708d0d",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x228,
      clk => clk_1_sg_x228,
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
      ce => ce_1_sg_x228,
      clk => clk_1_sg_x228,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_d9d6a6b3e7 is
  port (
    aloahi: in std_logic_vector(13 downto 0); 
    blobhi: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(13 downto 0); 
    aloblo: out std_logic_vector(13 downto 0)
  );
end biplex_commutator_01_entity_d9d6a6b3e7;

architecture structural of biplex_commutator_01_entity_d9d6a6b3e7 is
  signal bram_data_out_net_x2: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x3: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x4: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(13 downto 0);
  signal ce_1_sg_x230: std_logic;
  signal clk_1_sg_x230: std_logic;
  signal counter_op_net: std_logic_vector(6 downto 0);
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(13 downto 0);
  signal mux_y_net_x0: std_logic_vector(13 downto 0);
  signal top_bit_y_net: std_logic;

begin
  bram_data_out_net_x3 <= aloahi;
  bram_data_out_net_x4 <= blobhi;
  ce_1_sg_x230 <= ce_1;
  clk_1_sg_x230 <= clk_1;
  delay_q_net_x0 <= sync_in;
  ahibhi <= mux1_y_net_x0;
  aloblo <= bram_data_out_net_x5;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_722dc5ef3883365e",
      op_arith => xlUnsigned,
      op_width => 7
    )
    port map (
      ce => ce_1_sg_x230,
      clk => clk_1_sg_x230,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_2b6a1841aa: entity work.delay_b_entity_2b6a1841aa
    port map (
      ce_1 => ce_1_sg_x230,
      clk_1 => clk_1_sg_x230,
      in_x0 => bram_data_out_net_x4,
      out_x0 => bram_data_out_net_x2
    );

  delay_lo_94a6985a9c: entity work.delay_b_entity_2b6a1841aa
    port map (
      ce_1 => ce_1_sg_x230,
      clk_1 => clk_1_sg_x230,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x5
    );

  mux: entity work.mux_8e733acc00
    port map (
      ce => ce_1_sg_x230,
      clk => clk_1_sg_x230,
      clr => '0',
      d0 => bram_data_out_net_x3,
      d1 => bram_data_out_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_8e733acc00
    port map (
      ce => ce_1_sg_x230,
      clk => clk_1_sg_x230,
      clr => '0',
      d0 => bram_data_out_net_x2,
      d1 => bram_data_out_net_x3,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_7fb7fc50cf is
  port (
    aloahi: in std_logic_vector(13 downto 0); 
    blobhi: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(13 downto 0); 
    aloblo: out std_logic_vector(13 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_23_entity_7fb7fc50cf;

architecture structural of biplex_commutator_23_entity_7fb7fc50cf is
  signal bram_data_out_net_x0: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x2: std_logic_vector(13 downto 0);
  signal ce_1_sg_x233: std_logic;
  signal clk_1_sg_x233: std_logic;
  signal counter_op_net: std_logic_vector(6 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x2: std_logic_vector(13 downto 0);
  signal mux1_y_net_x3: std_logic_vector(13 downto 0);
  signal mux1_y_net_x4: std_logic_vector(13 downto 0);
  signal mux_y_net_x0: std_logic_vector(13 downto 0);
  signal top_bit_y_net: std_logic;

begin
  mux1_y_net_x2 <= aloahi;
  mux1_y_net_x3 <= blobhi;
  ce_1_sg_x233 <= ce_1;
  clk_1_sg_x233 <= clk_1;
  delay_q_net_x1 <= sync_in;
  ahibhi <= mux1_y_net_x4;
  aloblo <= bram_data_out_net_x2;
  sync_out <= delay_q_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_722dc5ef3883365e",
      op_arith => xlUnsigned,
      op_width => 7
    )
    port map (
      ce => ce_1_sg_x233,
      clk => clk_1_sg_x233,
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
      ce => ce_1_sg_x233,
      clk => clk_1_sg_x233,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_54492256c4: entity work.delay_b_entity_2b6a1841aa
    port map (
      ce_1 => ce_1_sg_x233,
      clk_1 => clk_1_sg_x233,
      in_x0 => mux1_y_net_x3,
      out_x0 => bram_data_out_net_x0
    );

  delay_lo_2b4d0bed19: entity work.delay_b_entity_2b6a1841aa
    port map (
      ce_1 => ce_1_sg_x233,
      clk_1 => clk_1_sg_x233,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x2
    );

  mux: entity work.mux_8e733acc00
    port map (
      ce => ce_1_sg_x233,
      clk => clk_1_sg_x233,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => bram_data_out_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_8e733acc00
    port map (
      ce => ce_1_sg_x233,
      clk => clk_1_sg_x233,
      clr => '0',
      d0 => bram_data_out_net_x0,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_5498b3c6d7 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(13 downto 0); 
    out_x0: out std_logic_vector(13 downto 0)
  );
end delay_b_entity_5498b3c6d7;

architecture structural of delay_b_entity_5498b3c6d7 is
  signal bram_data_out_net_x0: std_logic_vector(13 downto 0);
  signal ce_1_sg_x234: std_logic;
  signal clk_1_sg_x234: std_logic;
  signal concat_y_net_x21: std_logic_vector(13 downto 0);
  signal constant_op_net: std_logic;
  signal counter_op_net: std_logic_vector(6 downto 0);

begin
  ce_1_sg_x234 <= ce_1;
  clk_1_sg_x234 <= clk_1;
  concat_y_net_x21 <= in_x0;
  out_x0 <= bram_data_out_net_x0;

  bram: entity work.xlspram
    generic map (
      c_address_width => 7,
      c_width => 14,
      core_name0 => "bmg_24_vx5_e8ed5e8ae23b2f64",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x234,
      clk => clk_1_sg_x234,
      data_in => concat_y_net_x21,
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
      ce => ce_1_sg_x234,
      clk => clk_1_sg_x234,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_dfed73a955 is
  port (
    aloahi: in std_logic_vector(13 downto 0); 
    blobhi: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(13 downto 0); 
    aloblo: out std_logic_vector(13 downto 0); 
    sync_out: out std_logic
  );
end biplex_commutator_ac_entity_dfed73a955;

architecture structural of biplex_commutator_ac_entity_dfed73a955 is
  signal bram_data_out_net_x0: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x5: std_logic_vector(13 downto 0);
  signal ce_1_sg_x236: std_logic;
  signal clk_1_sg_x236: std_logic;
  signal concat_y_net_x22: std_logic_vector(13 downto 0);
  signal concat_y_net_x23: std_logic_vector(13 downto 0);
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x13: std_logic;
  signal mux1_y_net_x3: std_logic_vector(13 downto 0);
  signal mux_y_net_x0: std_logic_vector(13 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x22 <= aloahi;
  concat_y_net_x23 <= blobhi;
  ce_1_sg_x236 <= ce_1;
  clk_1_sg_x236 <= clk_1;
  delay_q_net_x13 <= sync_in;
  ahibhi <= mux1_y_net_x3;
  aloblo <= bram_data_out_net_x5;
  sync_out <= delay_q_net_x1;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_01e34ae12479a5e1",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x236,
      clk => clk_1_sg_x236,
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
      ce => ce_1_sg_x236,
      clk => clk_1_sg_x236,
      d(0) => delay_q_net_x13,
      en => '1',
      q(0) => delay_q_net_x1
    );

  delay_b_5498b3c6d7: entity work.delay_b_entity_5498b3c6d7
    port map (
      ce_1 => ce_1_sg_x236,
      clk_1 => clk_1_sg_x236,
      in_x0 => concat_y_net_x23,
      out_x0 => bram_data_out_net_x0
    );

  delay_lo_b2e67a1aa8: entity work.delay_b_entity_5498b3c6d7
    port map (
      ce_1 => ce_1_sg_x236,
      clk_1 => clk_1_sg_x236,
      in_x0 => mux_y_net_x0,
      out_x0 => bram_data_out_net_x5
    );

  mux: entity work.mux_8e733acc00
    port map (
      ce => ce_1_sg_x236,
      clk => clk_1_sg_x236,
      clr => '0',
      d0 => concat_y_net_x22,
      d1 => bram_data_out_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_8e733acc00
    port map (
      ce => ce_1_sg_x236,
      clk => clk_1_sg_x236,
      clr => '0',
      d0 => bram_data_out_net_x0,
      d1 => concat_y_net_x22,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/quadplex_commutator"

entity quadplex_commutator_entity_f55e98f9e3 is
  port (
    a: in std_logic_vector(13 downto 0); 
    b: in std_logic_vector(13 downto 0); 
    c: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(13 downto 0); 
    sync_in: in std_logic; 
    abcd0: out std_logic_vector(13 downto 0); 
    abcd1: out std_logic_vector(13 downto 0); 
    abcd2: out std_logic_vector(13 downto 0); 
    abcd3: out std_logic_vector(13 downto 0); 
    sync_out: out std_logic
  );
end quadplex_commutator_entity_f55e98f9e3;

architecture structural of quadplex_commutator_entity_f55e98f9e3 is
  signal bram_data_out_net_x6: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x7: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x8: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x9: std_logic_vector(13 downto 0);
  signal ce_1_sg_x240: std_logic;
  signal clk_1_sg_x240: std_logic;
  signal concat_y_net_x26: std_logic_vector(13 downto 0);
  signal concat_y_net_x27: std_logic_vector(13 downto 0);
  signal concat_y_net_x28: std_logic_vector(13 downto 0);
  signal concat_y_net_x29: std_logic_vector(13 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x15: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mux1_y_net_x3: std_logic_vector(13 downto 0);
  signal mux1_y_net_x5: std_logic_vector(13 downto 0);
  signal mux1_y_net_x6: std_logic_vector(13 downto 0);
  signal mux1_y_net_x7: std_logic_vector(13 downto 0);

begin
  concat_y_net_x26 <= a;
  concat_y_net_x27 <= b;
  concat_y_net_x28 <= c;
  ce_1_sg_x240 <= ce_1;
  clk_1_sg_x240 <= clk_1;
  concat_y_net_x29 <= d;
  delay_q_net_x15 <= sync_in;
  abcd0 <= bram_data_out_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= bram_data_out_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x4;

  biplex_commutator_01_d9d6a6b3e7: entity work.biplex_commutator_01_entity_d9d6a6b3e7
    port map (
      aloahi => bram_data_out_net_x6,
      blobhi => bram_data_out_net_x7,
      ce_1 => ce_1_sg_x240,
      clk_1 => clk_1_sg_x240,
      sync_in => delay_q_net_x1,
      ahibhi => mux1_y_net_x6,
      aloblo => bram_data_out_net_x8
    );

  biplex_commutator_23_7fb7fc50cf: entity work.biplex_commutator_23_entity_7fb7fc50cf
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x240,
      clk_1 => clk_1_sg_x240,
      sync_in => delay_q_net_x3,
      ahibhi => mux1_y_net_x7,
      aloblo => bram_data_out_net_x9,
      sync_out => delay_q_net_x4
    );

  biplex_commutator_ac_dfed73a955: entity work.biplex_commutator_ac_entity_dfed73a955
    port map (
      aloahi => concat_y_net_x26,
      blobhi => concat_y_net_x28,
      ce_1 => ce_1_sg_x240,
      clk_1 => clk_1_sg_x240,
      sync_in => delay_q_net_x15,
      ahibhi => mux1_y_net_x3,
      aloblo => bram_data_out_net_x6,
      sync_out => delay_q_net_x1
    );

  biplex_commutator_bd_5d581d9879: entity work.biplex_commutator_ac_entity_dfed73a955
    port map (
      aloahi => concat_y_net_x27,
      blobhi => concat_y_net_x29,
      ce_1 => ce_1_sg_x240,
      clk_1 => clk_1_sg_x240,
      sync_in => delay_q_net_x15,
      ahibhi => mux1_y_net_x5,
      aloblo => bram_data_out_net_x7,
      sync_out => delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_a951dc1c31 is
  port (
    c: in std_logic_vector(13 downto 0); 
    im: out std_logic_vector(6 downto 0); 
    re: out std_logic_vector(6 downto 0)
  );
end c_to_ri_entity_a951dc1c31;

architecture structural of c_to_ri_entity_a951dc1c31 is
  signal delay1_q_net_x0: std_logic_vector(13 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(6 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(6 downto 0);
  signal slice_im_y_net: std_logic_vector(6 downto 0);
  signal slice_re_y_net: std_logic_vector(6 downto 0);

begin
  delay1_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_438cdd9555
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_438cdd9555
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
      new_msb => 6,
      x_width => 14,
      y_width => 7
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 7,
      new_msb => 13,
      x_width => 14,
      y_width => 7
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_0af4711b5a is
  port (
    im: in std_logic_vector(7 downto 0); 
    re: in std_logic_vector(7 downto 0); 
    c: out std_logic_vector(15 downto 0)
  );
end ri_to_c_entity_0af4711b5a;

architecture structural of ri_to_c_entity_0af4711b5a is
  signal concat_y_net_x0: std_logic_vector(15 downto 0);
  signal force_im_output_port_net: std_logic_vector(7 downto 0);
  signal force_re_output_port_net: std_logic_vector(7 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(7 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(7 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_8e53793314
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x0
    );

  force_im: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_d51df7ac30
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly0"

entity butterfly0_entity_72dac021db is
  port (
    a: in std_logic_vector(13 downto 0); 
    b: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(15 downto 0); 
    a_b_x0: out std_logic_vector(15 downto 0)
  );
end butterfly0_entity_72dac021db;

architecture structural of butterfly0_entity_72dac021db is
  signal add_im_s_net: std_logic_vector(7 downto 0);
  signal add_re_s_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x241: std_logic;
  signal clk_1_sg_x241: std_logic;
  signal concat_y_net_x3: std_logic_vector(13 downto 0);
  signal concat_y_net_x4: std_logic_vector(15 downto 0);
  signal concat_y_net_x5: std_logic_vector(15 downto 0);
  signal delay1_q_net_x1: std_logic_vector(13 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(6 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(6 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(6 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(6 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(7 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(7 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(7 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(7 downto 0);
  signal shift0_op_net: std_logic_vector(7 downto 0);
  signal shift1_op_net: std_logic_vector(7 downto 0);
  signal shift2_op_net: std_logic_vector(7 downto 0);
  signal shift3_op_net: std_logic_vector(7 downto 0);
  signal sub_im_s_net: std_logic_vector(7 downto 0);
  signal sub_re_s_net: std_logic_vector(7 downto 0);

begin
  delay1_q_net_x1 <= a;
  concat_y_net_x3 <= b;
  ce_1_sg_x241 <= ce_1;
  clk_1_sg_x241 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_45089cbef1
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x241,
      clk => clk_1_sg_x241,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_45089cbef1
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x241,
      clk => clk_1_sg_x241,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_3fdadbfbdc: entity work.c_to_ri_entity_a951dc1c31
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_a951dc1c31: entity work.c_to_ri_entity_a951dc1c31
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
      din_width => 8,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 8,
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
      din_width => 8,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 8,
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
      din_width => 8,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 8,
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
      din_width => 8,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 8,
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

  ri_to_c1_afc2b24b47: entity work.ri_to_c_entity_0af4711b5a
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_0af4711b5a: entity work.ri_to_c_entity_0af4711b5a
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x4
    );

  shift0: entity work.scale_883ceb17ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_883ceb17ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_883ceb17ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_883ceb17ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_8540835a91
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x241,
      clk => clk_1_sg_x241,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_8540835a91
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x241,
      clk => clk_1_sg_x241,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly1"

entity butterfly1_entity_0677f389ed is
  port (
    a: in std_logic_vector(13 downto 0); 
    b: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(15 downto 0); 
    a_b_x0: out std_logic_vector(15 downto 0); 
    sync_out: out std_logic
  );
end butterfly1_entity_0677f389ed;

architecture structural of butterfly1_entity_0677f389ed is
  signal add_im_s_net: std_logic_vector(7 downto 0);
  signal add_re_s_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x242: std_logic;
  signal clk_1_sg_x242: std_logic;
  signal concat_y_net_x4: std_logic_vector(13 downto 0);
  signal concat_y_net_x5: std_logic_vector(13 downto 0);
  signal concat_y_net_x6: std_logic_vector(15 downto 0);
  signal concat_y_net_x7: std_logic_vector(15 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(6 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(6 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(6 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(6 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(7 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(7 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(7 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(7 downto 0);
  signal shift0_op_net: std_logic_vector(7 downto 0);
  signal shift1_op_net: std_logic_vector(7 downto 0);
  signal shift2_op_net: std_logic_vector(7 downto 0);
  signal shift3_op_net: std_logic_vector(7 downto 0);
  signal sub_im_s_net: std_logic_vector(7 downto 0);
  signal sub_re_s_net: std_logic_vector(7 downto 0);

begin
  concat_y_net_x4 <= a;
  concat_y_net_x5 <= b;
  ce_1_sg_x242 <= ce_1;
  clk_1_sg_x242 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_45089cbef1
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x242,
      clk => clk_1_sg_x242,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_45089cbef1
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x242,
      clk => clk_1_sg_x242,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_36af136e46: entity work.c_to_ri_entity_a951dc1c31
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_ff5f1083a4: entity work.c_to_ri_entity_a951dc1c31
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
      ce => ce_1_sg_x242,
      clk => clk_1_sg_x242,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 8,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 8,
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
      din_width => 8,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 8,
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
      din_width => 8,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 8,
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
      din_width => 8,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 8,
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

  ri_to_c1_138c3b9a59: entity work.ri_to_c_entity_0af4711b5a
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_e424a00f9f: entity work.ri_to_c_entity_0af4711b5a
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x6
    );

  shift0: entity work.scale_883ceb17ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_883ceb17ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_883ceb17ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_883ceb17ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_8540835a91
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x242,
      clk => clk_1_sg_x242,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_8540835a91
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x242,
      clk => clk_1_sg_x242,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_30752a13a2 is
  port (
    c: in std_logic_vector(15 downto 0); 
    im: out std_logic_vector(7 downto 0); 
    re: out std_logic_vector(7 downto 0)
  );
end c_to_ri_entity_30752a13a2;

architecture structural of c_to_ri_entity_30752a13a2 is
  signal concat_y_net_x5: std_logic_vector(15 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal slice_im_y_net: std_logic_vector(7 downto 0);
  signal slice_re_y_net: std_logic_vector(7 downto 0);

begin
  concat_y_net_x5 <= c;
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
      x_width => 16,
      y_width => 8
    )
    port map (
      x => concat_y_net_x5,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 15,
      x_width => 16,
      y_width => 8
    )
    port map (
      x => concat_y_net_x5,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_8fd349198e is
  port (
    im: in std_logic_vector(8 downto 0); 
    re: in std_logic_vector(8 downto 0); 
    c: out std_logic_vector(17 downto 0)
  );
end ri_to_c_entity_8fd349198e;

architecture structural of ri_to_c_entity_8fd349198e is
  signal concat_y_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net: std_logic_vector(8 downto 0);
  signal force_re_output_port_net: std_logic_vector(8 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(8 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(8 downto 0);

begin
  requant1_dout_net_x0 <= im;
  requant0_dout_net_x0 <= re;
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
      input_port => requant1_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_de38ef9df5
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly2"

entity butterfly2_entity_b8a2a5841b is
  port (
    a: in std_logic_vector(15 downto 0); 
    b: in std_logic_vector(15 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(17 downto 0); 
    a_b_x0: out std_logic_vector(17 downto 0)
  );
end butterfly2_entity_b8a2a5841b;

architecture structural of butterfly2_entity_b8a2a5841b is
  signal add_im_s_net: std_logic_vector(8 downto 0);
  signal add_re_s_net: std_logic_vector(8 downto 0);
  signal ce_1_sg_x243: std_logic;
  signal clk_1_sg_x243: std_logic;
  signal concat_y_net_x10: std_logic_vector(15 downto 0);
  signal concat_y_net_x11: std_logic_vector(17 downto 0);
  signal concat_y_net_x12: std_logic_vector(17 downto 0);
  signal concat_y_net_x9: std_logic_vector(15 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(7 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(8 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(8 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(8 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(8 downto 0);
  signal shift0_op_net: std_logic_vector(8 downto 0);
  signal shift1_op_net: std_logic_vector(8 downto 0);
  signal shift2_op_net: std_logic_vector(8 downto 0);
  signal shift3_op_net: std_logic_vector(8 downto 0);
  signal sub_im_s_net: std_logic_vector(8 downto 0);
  signal sub_re_s_net: std_logic_vector(8 downto 0);

begin
  concat_y_net_x9 <= a;
  concat_y_net_x10 <= b;
  ce_1_sg_x243 <= ce_1;
  clk_1_sg_x243 <= clk_1;
  a_b <= concat_y_net_x11;
  a_b_x0 <= concat_y_net_x12;

  add_im: entity work.addsub_9da8efbf9f
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x243,
      clk => clk_1_sg_x243,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_9da8efbf9f
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x243,
      clk => clk_1_sg_x243,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_b18c85aef5: entity work.c_to_ri_entity_30752a13a2
    port map (
      c => concat_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_30752a13a2: entity work.c_to_ri_entity_30752a13a2
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
      din_width => 9,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 9,
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
      din_width => 9,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 9,
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
      din_width => 9,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 9,
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
      din_width => 9,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 9,
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

  ri_to_c1_15ceac5d91: entity work.ri_to_c_entity_8fd349198e
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x12
    );

  ri_to_c_8fd349198e: entity work.ri_to_c_entity_8fd349198e
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x11
    );

  shift0: entity work.scale_09d9c75679
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_09d9c75679
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_09d9c75679
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_09d9c75679
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_13f365b626
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x243,
      clk => clk_1_sg_x243,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_13f365b626
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x243,
      clk => clk_1_sg_x243,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_butterfly/butterfly3j"

entity butterfly3j_entity_099a68bb38 is
  port (
    a: in std_logic_vector(15 downto 0); 
    b: in std_logic_vector(15 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    a_b: out std_logic_vector(17 downto 0); 
    a_b_x0: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end butterfly3j_entity_099a68bb38;

architecture structural of butterfly3j_entity_099a68bb38 is
  signal add_im_s_net: std_logic_vector(8 downto 0);
  signal add_re_s_net: std_logic_vector(8 downto 0);
  signal ce_1_sg_x244: std_logic;
  signal clk_1_sg_x244: std_logic;
  signal concat_y_net_x10: std_logic_vector(17 downto 0);
  signal concat_y_net_x11: std_logic_vector(17 downto 0);
  signal concat_y_net_x7: std_logic_vector(15 downto 0);
  signal concat_y_net_x9: std_logic_vector(15 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(7 downto 0);
  signal requant0_dout_net_x0: std_logic_vector(8 downto 0);
  signal requant1_dout_net_x0: std_logic_vector(8 downto 0);
  signal requant2_dout_net_x0: std_logic_vector(8 downto 0);
  signal requant3_dout_net_x0: std_logic_vector(8 downto 0);
  signal shift0_op_net: std_logic_vector(8 downto 0);
  signal shift1_op_net: std_logic_vector(8 downto 0);
  signal shift2_op_net: std_logic_vector(8 downto 0);
  signal shift3_op_net: std_logic_vector(8 downto 0);
  signal sub_im_s_net: std_logic_vector(8 downto 0);
  signal sub_re_s_net: std_logic_vector(8 downto 0);

begin
  concat_y_net_x7 <= a;
  concat_y_net_x9 <= b;
  ce_1_sg_x244 <= ce_1;
  clk_1_sg_x244 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x10;
  a_b_x0 <= concat_y_net_x11;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_13f365b626
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x244,
      clk => clk_1_sg_x244,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_9da8efbf9f
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x244,
      clk => clk_1_sg_x244,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_1b0e023318: entity work.c_to_ri_entity_30752a13a2
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_f7128d69a4: entity work.c_to_ri_entity_30752a13a2
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
      ce => ce_1_sg_x244,
      clk => clk_1_sg_x244,
      d(0) => delay_q_net_x3,
      en => '1',
      q(0) => delay_q_net_x0
    );

  requant0: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 9,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 9,
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
      din_width => 9,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 9,
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
      din_width => 9,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 9,
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
      din_width => 9,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 9,
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

  ri_to_c1_bf4d23b9ae: entity work.ri_to_c_entity_8fd349198e
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x11
    );

  ri_to_c_2c43346597: entity work.ri_to_c_entity_8fd349198e
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x10
    );

  shift0: entity work.scale_09d9c75679
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_re_s_net,
      op => shift0_op_net
    );

  shift1: entity work.scale_09d9c75679
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => add_im_s_net,
      op => shift1_op_net
    );

  shift2: entity work.scale_09d9c75679
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_re_s_net,
      op => shift2_op_net
    );

  shift3: entity work.scale_09d9c75679
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => sub_im_s_net,
      op => shift3_op_net
    );

  sub_im: entity work.addsub_9da8efbf9f
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x244,
      clk => clk_1_sg_x244,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_13f365b626
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x244,
      clk => clk_1_sg_x244,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_butterfly"

entity r4_butterfly_entity_56fdac0b6d is
  port (
    a_in: in std_logic_vector(13 downto 0); 
    b_in: in std_logic_vector(13 downto 0); 
    c_in: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(13 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(17 downto 0); 
    b_out: out std_logic_vector(17 downto 0); 
    c_out: out std_logic_vector(17 downto 0); 
    d_out: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end r4_butterfly_entity_56fdac0b6d;

architecture structural of r4_butterfly_entity_56fdac0b6d is
  signal ce_1_sg_x245: std_logic;
  signal clk_1_sg_x245: std_logic;
  signal concat_y_net_x10: std_logic_vector(15 downto 0);
  signal concat_y_net_x11: std_logic_vector(15 downto 0);
  signal concat_y_net_x16: std_logic_vector(13 downto 0);
  signal concat_y_net_x17: std_logic_vector(13 downto 0);
  signal concat_y_net_x18: std_logic_vector(13 downto 0);
  signal concat_y_net_x19: std_logic_vector(17 downto 0);
  signal concat_y_net_x20: std_logic_vector(17 downto 0);
  signal concat_y_net_x21: std_logic_vector(17 downto 0);
  signal concat_y_net_x22: std_logic_vector(17 downto 0);
  signal concat_y_net_x7: std_logic_vector(15 downto 0);
  signal concat_y_net_x9: std_logic_vector(15 downto 0);
  signal delay1_q_net_x2: std_logic_vector(13 downto 0);
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;

begin
  delay1_q_net_x2 <= a_in;
  concat_y_net_x16 <= b_in;
  concat_y_net_x17 <= c_in;
  ce_1_sg_x245 <= ce_1;
  clk_1_sg_x245 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  butterfly0_72dac021db: entity work.butterfly0_entity_72dac021db
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x17,
      ce_1 => ce_1_sg_x245,
      clk_1 => clk_1_sg_x245,
      a_b => concat_y_net_x9,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_0677f389ed: entity work.butterfly1_entity_0677f389ed
    port map (
      a => concat_y_net_x16,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x245,
      clk_1 => clk_1_sg_x245,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x10,
      a_b_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x3
    );

  butterfly2_b8a2a5841b: entity work.butterfly2_entity_b8a2a5841b
    port map (
      a => concat_y_net_x9,
      b => concat_y_net_x10,
      ce_1 => ce_1_sg_x245,
      clk_1 => clk_1_sg_x245,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_099a68bb38: entity work.butterfly3j_entity_099a68bb38
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x245,
      clk_1 => clk_1_sg_x245,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_4b0a5ce28e is
  port (
    c: in std_logic_vector(13 downto 0); 
    im: out std_logic_vector(6 downto 0); 
    re: out std_logic_vector(6 downto 0)
  );
end c_to_ri_entity_4b0a5ce28e;

architecture structural of c_to_ri_entity_4b0a5ce28e is
  signal delay1_q_net_x0: std_logic_vector(13 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(6 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(6 downto 0);
  signal slice_im_y_net: std_logic_vector(6 downto 0);
  signal slice_re_y_net: std_logic_vector(6 downto 0);

begin
  delay1_q_net_x0 <= c;
  im <= force_im_output_port_net_x0;
  re <= force_re_output_port_net_x0;

  force_im: entity work.reinterpret_438cdd9555
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_im_y_net,
      output_port => force_im_output_port_net_x0
    );

  force_re: entity work.reinterpret_438cdd9555
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
      new_msb => 6,
      x_width => 14,
      y_width => 7
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_im_y_net
    );

  slice_re: entity work.xlslice
    generic map (
      new_lsb => 7,
      new_msb => 13,
      x_width => 14,
      y_width => 7
    )
    port map (
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1/c_to_ri1"

entity c_to_ri1_entity_5470105349 is
  port (
    c: in std_logic_vector(17 downto 0); 
    im: out std_logic_vector(8 downto 0); 
    re: out std_logic_vector(8 downto 0)
  );
end c_to_ri1_entity_5470105349;

architecture structural of c_to_ri1_entity_5470105349 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_2e4578f875 is
  port (
    im: in std_logic_vector(6 downto 0); 
    re: in std_logic_vector(6 downto 0); 
    c: out std_logic_vector(13 downto 0)
  );
end ri_to_c_entity_2e4578f875;

architecture structural of ri_to_c_entity_2e4578f875 is
  signal concat_y_net_x17: std_logic_vector(13 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(6 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(6 downto 0);
  signal force_im_output_port_net: std_logic_vector(6 downto 0);
  signal force_re_output_port_net: std_logic_vector(6 downto 0);

begin
  convert_im_dout_net_x0 <= im;
  convert_re_dout_net_x0 <= re;
  c <= concat_y_net_x17;

  concat: entity work.concat_2826c43530
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x17
    );

  force_im: entity work.reinterpret_a24d852164
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_im_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_a24d852164
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy1"

entity cmpy1_entity_75b32ca762 is
  port (
    a_in: in std_logic_vector(13 downto 0); 
    b: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    a_out: out std_logic_vector(13 downto 0); 
    bw: out std_logic_vector(13 downto 0); 
    sync_out: out std_logic
  );
end cmpy1_entity_75b32ca762;

architecture structural of cmpy1_entity_75b32ca762 is
  signal br_add_bi_s_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x246: std_logic;
  signal clk_1_sg_x246: std_logic;
  signal concat_y_net_x18: std_logic_vector(13 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(6 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(6 downto 0);
  signal delay1_q_net_x1: std_logic_vector(13 downto 0);
  signal delay1_q_net_x3: std_logic_vector(13 downto 0);
  signal delay2_q_net_x0: std_logic_vector(13 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(6 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(6 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(13 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(13 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(13 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(13 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(13 downto 0);
  signal sumsum_p_net: std_logic_vector(13 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay2_q_net_x0 <= a_in;
  delay1_q_net_x1 <= b;
  ce_1_sg_x246 <= ce_1;
  clk_1_sg_x246 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x18;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_68fd003b58
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_5470105349: entity work.c_to_ri1_entity_5470105349
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_4b0a5ce28e: entity work.c_to_ri_entity_4b0a5ce28e
    port map (
      c => delay1_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 13,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 6,
      dout_width => 7,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 13,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 6,
      dout_width => 7,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
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
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      d(0) => delay3_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay1: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 14
    )
    port map (
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      d => delay2_q_net_x0,
      en => '1',
      q => delay1_q_net_x3
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 6,
      a_width => 7,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 7,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 7,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_1900b0ff8c195f36",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 13,
      p_width => 14,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      clr => '0',
      core_ce => ce_1_sg_x246,
      core_clk => clk_1_sg_x246,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 6,
      a_width => 7,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 7,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 7,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_1900b0ff8c195f36",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 13,
      p_width => 14,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      clr => '0',
      core_ce => ce_1_sg_x246,
      core_clk => clk_1_sg_x246,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_2e4578f875: entity work.ri_to_c_entity_2e4578f875
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x18
    );

  rr_add_ii: entity work.addsub_544c0104be
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_beefa26759
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_f8eb1451fa
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 6,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 8,
      c_output_width => 18,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_8241330e8139a185",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 13,
      p_width => 14,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      clr => '0',
      core_ce => ce_1_sg_x246,
      core_clk => clk_1_sg_x246,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x246,
      clk => clk_1_sg_x246,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/cmpy2"

entity cmpy2_entity_931a85117b is
  port (
    b: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(13 downto 0)
  );
end cmpy2_entity_931a85117b;

architecture structural of cmpy2_entity_931a85117b is
  signal br_add_bi_s_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x247: std_logic;
  signal clk_1_sg_x247: std_logic;
  signal concat_y_net_x19: std_logic_vector(13 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(6 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(6 downto 0);
  signal delay4_q_net_x1: std_logic_vector(13 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(6 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(6 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(13 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(13 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(13 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(13 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(13 downto 0);
  signal sumsum_p_net: std_logic_vector(13 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay4_q_net_x1 <= b;
  ce_1_sg_x247 <= ce_1;
  clk_1_sg_x247 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x19;

  br_add_bi: entity work.addsub_68fd003b58
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_5fa85197e9: entity work.c_to_ri1_entity_5470105349
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_89c2838195: entity work.c_to_ri_entity_4b0a5ce28e
    port map (
      c => delay4_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 13,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 6,
      dout_width => 7,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 13,
      din_width => 14,
      dout_arith => 2,
      dout_bin_pt => 6,
      dout_width => 7,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 6,
      a_width => 7,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 7,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 7,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_1900b0ff8c195f36",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 13,
      p_width => 14,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      core_ce => ce_1_sg_x247,
      core_clk => clk_1_sg_x247,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 6,
      a_width => 7,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 7,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 7,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_1900b0ff8c195f36",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 13,
      p_width => 14,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      core_ce => ce_1_sg_x247,
      core_clk => clk_1_sg_x247,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_e6b2abe9c8: entity work.ri_to_c_entity_2e4578f875
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_544c0104be
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_beefa26759
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_f8eb1451fa
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 6,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 8,
      c_output_width => 18,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_8241330e8139a185",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 13,
      p_width => 14,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      core_ce => ce_1_sg_x247,
      core_clk => clk_1_sg_x247,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x247,
      clk => clk_1_sg_x247,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_d4edc5d5b8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_d4edc5d5b8;

architecture structural of twiddle_gen1_entity_d4edc5d5b8 is
  signal addr_sel_y_net: std_logic_vector(1 downto 0);
  signal ce_1_sg_x249: std_logic;
  signal clk_1_sg_x249: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x5: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x249 <= ce_1;
  clk_1_sg_x249 <= clk_1;
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
      ce => ce_1_sg_x249,
      clk => clk_1_sg_x249,
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
      ce => ce_1_sg_x249,
      clk => clk_1_sg_x249,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_781a24cbd1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_781a24cbd1;

architecture structural of twiddle_gen2_entity_781a24cbd1 is
  signal addr_sel_y_net: std_logic_vector(1 downto 0);
  signal ce_1_sg_x250: std_logic;
  signal clk_1_sg_x250: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x6: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x250 <= ce_1;
  clk_1_sg_x250 <= clk_1;
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
      ce => ce_1_sg_x250,
      clk => clk_1_sg_x250,
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
      ce => ce_1_sg_x250,
      clk => clk_1_sg_x250,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_b330f53aa7 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_b330f53aa7;

architecture structural of twiddle_gen3_entity_b330f53aa7 is
  signal addr_sel_y_net: std_logic_vector(1 downto 0);
  signal ce_1_sg_x251: std_logic;
  signal clk_1_sg_x251: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x7: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x251 <= ce_1;
  clk_1_sg_x251 <= clk_1;
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
      ce => ce_1_sg_x251,
      clk => clk_1_sg_x251,
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
      ce => ce_1_sg_x251,
      clk => clk_1_sg_x251,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2/r4_twiddle"

entity r4_twiddle_entity_0394c5cafe is
  port (
    a_in: in std_logic_vector(13 downto 0); 
    b: in std_logic_vector(13 downto 0); 
    c: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(13 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(13 downto 0); 
    bw: out std_logic_vector(13 downto 0); 
    cw: out std_logic_vector(13 downto 0); 
    dw: out std_logic_vector(13 downto 0); 
    sync_out: out std_logic
  );
end r4_twiddle_entity_0394c5cafe;

architecture structural of r4_twiddle_entity_0394c5cafe is
  signal bram_data_out_net_x10: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x11: std_logic_vector(13 downto 0);
  signal ce_1_sg_x252: std_logic;
  signal clk_1_sg_x252: std_logic;
  signal concat_y_net_x21: std_logic_vector(13 downto 0);
  signal concat_y_net_x22: std_logic_vector(13 downto 0);
  signal concat_y_net_x23: std_logic_vector(13 downto 0);
  signal delay1_q_net_x1: std_logic_vector(13 downto 0);
  signal delay1_q_net_x4: std_logic_vector(13 downto 0);
  signal delay2_q_net_x0: std_logic_vector(13 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay4_q_net_x1: std_logic_vector(13 downto 0);
  signal delay5_q_net_x1: std_logic_vector(13 downto 0);
  signal delay_q_net_x4: std_logic;
  signal delay_q_net_x8: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x3: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x4: std_logic_vector(17 downto 0);
  signal mux1_y_net_x8: std_logic_vector(13 downto 0);
  signal mux1_y_net_x9: std_logic_vector(13 downto 0);

begin
  bram_data_out_net_x10 <= a_in;
  mux1_y_net_x8 <= b;
  bram_data_out_net_x11 <= c;
  ce_1_sg_x252 <= ce_1;
  clk_1_sg_x252 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x8 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x22;
  dw <= concat_y_net_x23;
  sync_out <= delay_q_net_x4;

  cmpy1_75b32ca762: entity work.cmpy1_entity_75b32ca762
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x252,
      clk_1 => clk_1_sg_x252,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_931a85117b: entity work.cmpy2_entity_931a85117b
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x252,
      clk_1 => clk_1_sg_x252,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x22
    );

  cmpy3_89f40ed840: entity work.cmpy2_entity_931a85117b
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x252,
      clk_1 => clk_1_sg_x252,
      w => mem_c_data_net_x4,
      bw => concat_y_net_x23
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 14
    )
    port map (
      ce => ce_1_sg_x252,
      clk => clk_1_sg_x252,
      d => mux1_y_net_x8,
      en => '1',
      q => delay1_q_net_x1
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 14
    )
    port map (
      ce => ce_1_sg_x252,
      clk => clk_1_sg_x252,
      d => bram_data_out_net_x10,
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
      ce => ce_1_sg_x252,
      clk => clk_1_sg_x252,
      d(0) => delay_q_net_x8,
      en => '1',
      q(0) => delay3_q_net_x0
    );

  delay4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 14
    )
    port map (
      ce => ce_1_sg_x252,
      clk => clk_1_sg_x252,
      d => bram_data_out_net_x11,
      en => '1',
      q => delay4_q_net_x1
    );

  delay5: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 14
    )
    port map (
      ce => ce_1_sg_x252,
      clk => clk_1_sg_x252,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_d4edc5d5b8: entity work.twiddle_gen1_entity_d4edc5d5b8
    port map (
      ce_1 => ce_1_sg_x252,
      clk_1 => clk_1_sg_x252,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_781a24cbd1: entity work.twiddle_gen2_entity_781a24cbd1
    port map (
      ce_1 => ce_1_sg_x252,
      clk_1 => clk_1_sg_x252,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_b330f53aa7: entity work.twiddle_gen3_entity_b330f53aa7
    port map (
      ce_1 => ce_1_sg_x252,
      clk_1 => clk_1_sg_x252,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_2"

entity r4_dit_stage_2_entity_324a1afc8b is
  port (
    a_in: in std_logic_vector(13 downto 0); 
    b_in: in std_logic_vector(13 downto 0); 
    c_in: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(13 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(17 downto 0); 
    b_out: out std_logic_vector(17 downto 0); 
    c_out: out std_logic_vector(17 downto 0); 
    d_out: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end r4_dit_stage_2_entity_324a1afc8b;

architecture structural of r4_dit_stage_2_entity_324a1afc8b is
  signal bram_data_out_net_x10: std_logic_vector(13 downto 0);
  signal bram_data_out_net_x11: std_logic_vector(13 downto 0);
  signal ce_1_sg_x253: std_logic;
  signal clk_1_sg_x253: std_logic;
  signal concat_y_net_x23: std_logic_vector(13 downto 0);
  signal concat_y_net_x30: std_logic_vector(13 downto 0);
  signal concat_y_net_x31: std_logic_vector(13 downto 0);
  signal concat_y_net_x32: std_logic_vector(13 downto 0);
  signal concat_y_net_x33: std_logic_vector(13 downto 0);
  signal concat_y_net_x34: std_logic_vector(13 downto 0);
  signal concat_y_net_x35: std_logic_vector(13 downto 0);
  signal concat_y_net_x36: std_logic_vector(17 downto 0);
  signal concat_y_net_x37: std_logic_vector(17 downto 0);
  signal concat_y_net_x38: std_logic_vector(17 downto 0);
  signal concat_y_net_x39: std_logic_vector(17 downto 0);
  signal delay1_q_net_x4: std_logic_vector(13 downto 0);
  signal delay_q_net_x16: std_logic;
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x6: std_logic;
  signal delay_q_net_x8: std_logic;
  signal mux1_y_net_x8: std_logic_vector(13 downto 0);
  signal mux1_y_net_x9: std_logic_vector(13 downto 0);

begin
  concat_y_net_x32 <= a_in;
  concat_y_net_x33 <= b_in;
  concat_y_net_x34 <= c_in;
  ce_1_sg_x253 <= ce_1;
  clk_1_sg_x253 <= clk_1;
  concat_y_net_x35 <= d_in;
  delay_q_net_x16 <= sync_in;
  a_out <= concat_y_net_x36;
  b_out <= concat_y_net_x37;
  c_out <= concat_y_net_x38;
  d_out <= concat_y_net_x39;
  sync_out <= delay_q_net_x6;

  quadplex_commutator_f55e98f9e3: entity work.quadplex_commutator_entity_f55e98f9e3
    port map (
      a => concat_y_net_x32,
      b => concat_y_net_x33,
      c => concat_y_net_x34,
      ce_1 => ce_1_sg_x253,
      clk_1 => clk_1_sg_x253,
      d => concat_y_net_x35,
      sync_in => delay_q_net_x16,
      abcd0 => bram_data_out_net_x10,
      abcd1 => mux1_y_net_x8,
      abcd2 => bram_data_out_net_x11,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x8
    );

  r4_butterfly_56fdac0b6d: entity work.r4_butterfly_entity_56fdac0b6d
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x30,
      c_in => concat_y_net_x31,
      ce_1 => ce_1_sg_x253,
      clk_1 => clk_1_sg_x253,
      d_in => concat_y_net_x23,
      sync_in => delay_q_net_x5,
      a_out => concat_y_net_x36,
      b_out => concat_y_net_x37,
      c_out => concat_y_net_x38,
      d_out => concat_y_net_x39,
      sync_out => delay_q_net_x6
    );

  r4_twiddle_0394c5cafe: entity work.r4_twiddle_entity_0394c5cafe
    port map (
      a_in => bram_data_out_net_x10,
      b => mux1_y_net_x8,
      c => bram_data_out_net_x11,
      ce_1 => ce_1_sg_x253,
      clk_1 => clk_1_sg_x253,
      d => mux1_y_net_x9,
      sync_in => delay_q_net_x8,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x30,
      cw => concat_y_net_x31,
      dw => concat_y_net_x23,
      sync_out => delay_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_14ddfa4fc3 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(17 downto 0); 
    out_x0: out std_logic_vector(17 downto 0)
  );
end delay_b_entity_14ddfa4fc3;

architecture structural of delay_b_entity_14ddfa4fc3 is
  signal ce_1_sg_x254: std_logic;
  signal clk_1_sg_x254: std_logic;
  signal slr_q_net_x1: std_logic_vector(17 downto 0);
  signal slr_q_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x254 <= ce_1;
  clk_1_sg_x254 <= clk_1;
  slr_q_net_x1 <= in_x0;
  out_x0 <= slr_q_net_x2;

  slr: entity work.xldelay
    generic map (
      latency => 16,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x254,
      clk => clk_1_sg_x254,
      d => slr_q_net_x1,
      en => '1',
      q => slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_fff6943893 is
  port (
    aloahi: in std_logic_vector(17 downto 0); 
    blobhi: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(17 downto 0); 
    aloblo: out std_logic_vector(17 downto 0)
  );
end biplex_commutator_01_entity_fff6943893;

architecture structural of biplex_commutator_01_entity_fff6943893 is
  signal ce_1_sg_x256: std_logic;
  signal clk_1_sg_x256: std_logic;
  signal counter_op_net: std_logic_vector(4 downto 0);
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(17 downto 0);
  signal mux_y_net_x0: std_logic_vector(17 downto 0);
  signal slr_q_net_x2: std_logic_vector(17 downto 0);
  signal slr_q_net_x3: std_logic_vector(17 downto 0);
  signal slr_q_net_x4: std_logic_vector(17 downto 0);
  signal slr_q_net_x5: std_logic_vector(17 downto 0);
  signal top_bit_y_net: std_logic;

begin
  slr_q_net_x3 <= aloahi;
  slr_q_net_x4 <= blobhi;
  ce_1_sg_x256 <= ce_1;
  clk_1_sg_x256 <= clk_1;
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
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_14ddfa4fc3: entity work.delay_b_entity_14ddfa4fc3
    port map (
      ce_1 => ce_1_sg_x256,
      clk_1 => clk_1_sg_x256,
      in_x0 => slr_q_net_x4,
      out_x0 => slr_q_net_x2
    );

  delay_lo_5c8c5ef6e8: entity work.delay_b_entity_14ddfa4fc3
    port map (
      ce_1 => ce_1_sg_x256,
      clk_1 => clk_1_sg_x256,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
      clr => '0',
      d0 => slr_q_net_x3,
      d1 => slr_q_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x256,
      clk => clk_1_sg_x256,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_9bd429b2f4 is
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
end biplex_commutator_23_entity_9bd429b2f4;

architecture structural of biplex_commutator_23_entity_9bd429b2f4 is
  signal ce_1_sg_x259: std_logic;
  signal clk_1_sg_x259: std_logic;
  signal counter_op_net: std_logic_vector(4 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x2: std_logic_vector(17 downto 0);
  signal mux1_y_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x4: std_logic_vector(17 downto 0);
  signal mux_y_net_x0: std_logic_vector(17 downto 0);
  signal slr_q_net_x0: std_logic_vector(17 downto 0);
  signal slr_q_net_x2: std_logic_vector(17 downto 0);
  signal top_bit_y_net: std_logic;

begin
  mux1_y_net_x2 <= aloahi;
  mux1_y_net_x3 <= blobhi;
  ce_1_sg_x259 <= ce_1;
  clk_1_sg_x259 <= clk_1;
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
      ce => ce_1_sg_x259,
      clk => clk_1_sg_x259,
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
      ce => ce_1_sg_x259,
      clk => clk_1_sg_x259,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_2b927a5efa: entity work.delay_b_entity_14ddfa4fc3
    port map (
      ce_1 => ce_1_sg_x259,
      clk_1 => clk_1_sg_x259,
      in_x0 => mux1_y_net_x3,
      out_x0 => slr_q_net_x0
    );

  delay_lo_995e01ad6f: entity work.delay_b_entity_14ddfa4fc3
    port map (
      ce_1 => ce_1_sg_x259,
      clk_1 => clk_1_sg_x259,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x2
    );

  mux: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x259,
      clk => clk_1_sg_x259,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x259,
      clk => clk_1_sg_x259,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_dfb07df534 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(17 downto 0); 
    out_x0: out std_logic_vector(17 downto 0)
  );
end delay_b_entity_dfb07df534;

architecture structural of delay_b_entity_dfb07df534 is
  signal ce_1_sg_x260: std_logic;
  signal clk_1_sg_x260: std_logic;
  signal concat_y_net_x39: std_logic_vector(17 downto 0);
  signal slr_q_net_x0: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x260 <= ce_1;
  clk_1_sg_x260 <= clk_1;
  concat_y_net_x39 <= in_x0;
  out_x0 <= slr_q_net_x0;

  slr: entity work.xldelay
    generic map (
      latency => 32,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x260,
      clk => clk_1_sg_x260,
      d => concat_y_net_x39,
      en => '1',
      q => slr_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_943774afc8 is
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
end biplex_commutator_ac_entity_943774afc8;

architecture structural of biplex_commutator_ac_entity_943774afc8 is
  signal ce_1_sg_x262: std_logic;
  signal clk_1_sg_x262: std_logic;
  signal concat_y_net_x40: std_logic_vector(17 downto 0);
  signal concat_y_net_x41: std_logic_vector(17 downto 0);
  signal counter_op_net: std_logic_vector(5 downto 0);
  signal delay_q_net_x7: std_logic;
  signal delay_q_net_x8: std_logic;
  signal mux1_y_net_x3: std_logic_vector(17 downto 0);
  signal mux_y_net_x0: std_logic_vector(17 downto 0);
  signal slr_q_net_x0: std_logic_vector(17 downto 0);
  signal slr_q_net_x5: std_logic_vector(17 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x40 <= aloahi;
  concat_y_net_x41 <= blobhi;
  ce_1_sg_x262 <= ce_1;
  clk_1_sg_x262 <= clk_1;
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
      ce => ce_1_sg_x262,
      clk => clk_1_sg_x262,
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
      ce => ce_1_sg_x262,
      clk => clk_1_sg_x262,
      d(0) => delay_q_net_x7,
      en => '1',
      q(0) => delay_q_net_x8
    );

  delay_b_dfb07df534: entity work.delay_b_entity_dfb07df534
    port map (
      ce_1 => ce_1_sg_x262,
      clk_1 => clk_1_sg_x262,
      in_x0 => concat_y_net_x41,
      out_x0 => slr_q_net_x0
    );

  delay_lo_caf9db79db: entity work.delay_b_entity_dfb07df534
    port map (
      ce_1 => ce_1_sg_x262,
      clk_1 => clk_1_sg_x262,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x262,
      clk => clk_1_sg_x262,
      clr => '0',
      d0 => concat_y_net_x40,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_181e58d842
    port map (
      ce => ce_1_sg_x262,
      clk => clk_1_sg_x262,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/quadplex_commutator"

entity quadplex_commutator_entity_f4af46e68b is
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
end quadplex_commutator_entity_f4af46e68b;

architecture structural of quadplex_commutator_entity_f4af46e68b is
  signal ce_1_sg_x266: std_logic;
  signal clk_1_sg_x266: std_logic;
  signal concat_y_net_x44: std_logic_vector(17 downto 0);
  signal concat_y_net_x45: std_logic_vector(17 downto 0);
  signal concat_y_net_x46: std_logic_vector(17 downto 0);
  signal concat_y_net_x47: std_logic_vector(17 downto 0);
  signal delay_q_net_x10: std_logic;
  signal delay_q_net_x11: std_logic;
  signal delay_q_net_x12: std_logic;
  signal delay_q_net_x9: std_logic;
  signal mux1_y_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x5: std_logic_vector(17 downto 0);
  signal mux1_y_net_x6: std_logic_vector(17 downto 0);
  signal mux1_y_net_x7: std_logic_vector(17 downto 0);
  signal slr_q_net_x6: std_logic_vector(17 downto 0);
  signal slr_q_net_x7: std_logic_vector(17 downto 0);
  signal slr_q_net_x8: std_logic_vector(17 downto 0);
  signal slr_q_net_x9: std_logic_vector(17 downto 0);

begin
  concat_y_net_x44 <= a;
  concat_y_net_x45 <= b;
  concat_y_net_x46 <= c;
  ce_1_sg_x266 <= ce_1;
  clk_1_sg_x266 <= clk_1;
  concat_y_net_x47 <= d;
  delay_q_net_x11 <= sync_in;
  abcd0 <= slr_q_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= slr_q_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x12;

  biplex_commutator_01_fff6943893: entity work.biplex_commutator_01_entity_fff6943893
    port map (
      aloahi => slr_q_net_x6,
      blobhi => slr_q_net_x7,
      ce_1 => ce_1_sg_x266,
      clk_1 => clk_1_sg_x266,
      sync_in => delay_q_net_x9,
      ahibhi => mux1_y_net_x6,
      aloblo => slr_q_net_x8
    );

  biplex_commutator_23_9bd429b2f4: entity work.biplex_commutator_23_entity_9bd429b2f4
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x266,
      clk_1 => clk_1_sg_x266,
      sync_in => delay_q_net_x10,
      ahibhi => mux1_y_net_x7,
      aloblo => slr_q_net_x9,
      sync_out => delay_q_net_x12
    );

  biplex_commutator_ac_943774afc8: entity work.biplex_commutator_ac_entity_943774afc8
    port map (
      aloahi => concat_y_net_x44,
      blobhi => concat_y_net_x46,
      ce_1 => ce_1_sg_x266,
      clk_1 => clk_1_sg_x266,
      sync_in => delay_q_net_x11,
      ahibhi => mux1_y_net_x3,
      aloblo => slr_q_net_x6,
      sync_out => delay_q_net_x9
    );

  biplex_commutator_bd_7a6e1aeb34: entity work.biplex_commutator_ac_entity_943774afc8
    port map (
      aloahi => concat_y_net_x45,
      blobhi => concat_y_net_x47,
      ce_1 => ce_1_sg_x266,
      clk_1 => clk_1_sg_x266,
      sync_in => delay_q_net_x11,
      ahibhi => mux1_y_net_x5,
      aloblo => slr_q_net_x7,
      sync_out => delay_q_net_x10
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_5d74bd6338 is
  port (
    c: in std_logic_vector(17 downto 0); 
    im: out std_logic_vector(8 downto 0); 
    re: out std_logic_vector(8 downto 0)
  );
end c_to_ri_entity_5d74bd6338;

architecture structural of c_to_ri_entity_5d74bd6338 is
  signal delay1_q_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(8 downto 0);
  signal slice_im_y_net: std_logic_vector(8 downto 0);
  signal slice_re_y_net: std_logic_vector(8 downto 0);

begin
  delay1_q_net_x0 <= c;
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
      x => delay1_q_net_x0,
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
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_ec7bef57b0 is
  port (
    im: in std_logic_vector(9 downto 0); 
    re: in std_logic_vector(9 downto 0); 
    c: out std_logic_vector(19 downto 0)
  );
end ri_to_c_entity_ec7bef57b0;

architecture structural of ri_to_c_entity_ec7bef57b0 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly0"

entity butterfly0_entity_6af82f5f7a is
  port (
    a: in std_logic_vector(17 downto 0); 
    b: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(19 downto 0); 
    a_b_x0: out std_logic_vector(19 downto 0)
  );
end butterfly0_entity_6af82f5f7a;

architecture structural of butterfly0_entity_6af82f5f7a is
  signal add_im_s_net: std_logic_vector(9 downto 0);
  signal add_re_s_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x267: std_logic;
  signal clk_1_sg_x267: std_logic;
  signal concat_y_net_x3: std_logic_vector(17 downto 0);
  signal concat_y_net_x4: std_logic_vector(19 downto 0);
  signal concat_y_net_x5: std_logic_vector(19 downto 0);
  signal delay1_q_net_x1: std_logic_vector(17 downto 0);
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
  delay1_q_net_x1 <= a;
  concat_y_net_x3 <= b;
  ce_1_sg_x267 <= ce_1;
  clk_1_sg_x267 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_793ae25d23
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x267,
      clk => clk_1_sg_x267,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_793ae25d23
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x267,
      clk => clk_1_sg_x267,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_2b11f2257b: entity work.c_to_ri_entity_5d74bd6338
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_5d74bd6338: entity work.c_to_ri_entity_5d74bd6338
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

  ri_to_c1_0ac993c5b1: entity work.ri_to_c_entity_ec7bef57b0
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_ec7bef57b0: entity work.ri_to_c_entity_ec7bef57b0
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x4
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
      ce => ce_1_sg_x267,
      clk => clk_1_sg_x267,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_3700bc31ba
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly1"

entity butterfly1_entity_64372e40fa is
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
end butterfly1_entity_64372e40fa;

architecture structural of butterfly1_entity_64372e40fa is
  signal add_im_s_net: std_logic_vector(9 downto 0);
  signal add_re_s_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x268: std_logic;
  signal clk_1_sg_x268: std_logic;
  signal concat_y_net_x4: std_logic_vector(17 downto 0);
  signal concat_y_net_x5: std_logic_vector(17 downto 0);
  signal concat_y_net_x6: std_logic_vector(19 downto 0);
  signal concat_y_net_x7: std_logic_vector(19 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
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
  concat_y_net_x4 <= a;
  concat_y_net_x5 <= b;
  ce_1_sg_x268 <= ce_1;
  clk_1_sg_x268 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_793ae25d23
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x268,
      clk => clk_1_sg_x268,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_793ae25d23
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x268,
      clk => clk_1_sg_x268,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_047bd3b4e2: entity work.c_to_ri_entity_5d74bd6338
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_b35f1a6a28: entity work.c_to_ri_entity_5d74bd6338
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
      ce => ce_1_sg_x268,
      clk => clk_1_sg_x268,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
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

  ri_to_c1_e6c991f618: entity work.ri_to_c_entity_ec7bef57b0
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_d2e75e972b: entity work.ri_to_c_entity_ec7bef57b0
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x6
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
      ce => ce_1_sg_x268,
      clk => clk_1_sg_x268,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_3700bc31ba
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x268,
      clk => clk_1_sg_x268,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_c71c9ba5a3 is
  port (
    c: in std_logic_vector(19 downto 0); 
    im: out std_logic_vector(9 downto 0); 
    re: out std_logic_vector(9 downto 0)
  );
end c_to_ri_entity_c71c9ba5a3;

architecture structural of c_to_ri_entity_c71c9ba5a3 is
  signal concat_y_net_x5: std_logic_vector(19 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(9 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(9 downto 0);
  signal slice_im_y_net: std_logic_vector(9 downto 0);
  signal slice_re_y_net: std_logic_vector(9 downto 0);

begin
  concat_y_net_x5 <= c;
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
      x => concat_y_net_x5,
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
      x => concat_y_net_x5,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_63f3687651 is
  port (
    im: in std_logic_vector(10 downto 0); 
    re: in std_logic_vector(10 downto 0); 
    c: out std_logic_vector(21 downto 0)
  );
end ri_to_c_entity_63f3687651;

architecture structural of ri_to_c_entity_63f3687651 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly2"

entity butterfly2_entity_c19c587f13 is
  port (
    a: in std_logic_vector(19 downto 0); 
    b: in std_logic_vector(19 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(21 downto 0); 
    a_b_x0: out std_logic_vector(21 downto 0)
  );
end butterfly2_entity_c19c587f13;

architecture structural of butterfly2_entity_c19c587f13 is
  signal add_im_s_net: std_logic_vector(10 downto 0);
  signal add_re_s_net: std_logic_vector(10 downto 0);
  signal ce_1_sg_x269: std_logic;
  signal clk_1_sg_x269: std_logic;
  signal concat_y_net_x10: std_logic_vector(19 downto 0);
  signal concat_y_net_x11: std_logic_vector(21 downto 0);
  signal concat_y_net_x12: std_logic_vector(21 downto 0);
  signal concat_y_net_x9: std_logic_vector(19 downto 0);
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
  concat_y_net_x9 <= a;
  concat_y_net_x10 <= b;
  ce_1_sg_x269 <= ce_1;
  clk_1_sg_x269 <= clk_1;
  a_b <= concat_y_net_x11;
  a_b_x0 <= concat_y_net_x12;

  add_im: entity work.addsub_74b65e93f7
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x269,
      clk => clk_1_sg_x269,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_74b65e93f7
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x269,
      clk => clk_1_sg_x269,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_6920d1d3f2: entity work.c_to_ri_entity_c71c9ba5a3
    port map (
      c => concat_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_c71c9ba5a3: entity work.c_to_ri_entity_c71c9ba5a3
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

  ri_to_c1_427e0491ef: entity work.ri_to_c_entity_63f3687651
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x12
    );

  ri_to_c_63f3687651: entity work.ri_to_c_entity_63f3687651
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x11
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
      ce => ce_1_sg_x269,
      clk => clk_1_sg_x269,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_89c5949a28
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x269,
      clk => clk_1_sg_x269,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_butterfly/butterfly3j"

entity butterfly3j_entity_9ef24f7440 is
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
end butterfly3j_entity_9ef24f7440;

architecture structural of butterfly3j_entity_9ef24f7440 is
  signal add_im_s_net: std_logic_vector(10 downto 0);
  signal add_re_s_net: std_logic_vector(10 downto 0);
  signal ce_1_sg_x270: std_logic;
  signal clk_1_sg_x270: std_logic;
  signal concat_y_net_x10: std_logic_vector(21 downto 0);
  signal concat_y_net_x11: std_logic_vector(21 downto 0);
  signal concat_y_net_x7: std_logic_vector(19 downto 0);
  signal concat_y_net_x9: std_logic_vector(19 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
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
  concat_y_net_x7 <= a;
  concat_y_net_x9 <= b;
  ce_1_sg_x270 <= ce_1;
  clk_1_sg_x270 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x10;
  a_b_x0 <= concat_y_net_x11;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_89c5949a28
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_74b65e93f7
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_423a50c59e: entity work.c_to_ri_entity_c71c9ba5a3
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_abb79a6d55: entity work.c_to_ri_entity_c71c9ba5a3
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
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      d(0) => delay_q_net_x3,
      en => '1',
      q(0) => delay_q_net_x0
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

  ri_to_c1_9fc9f05dba: entity work.ri_to_c_entity_63f3687651
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x11
    );

  ri_to_c_b485e86cc0: entity work.ri_to_c_entity_63f3687651
    port map (
      im => requant1_dout_net_x0,
      re => requant0_dout_net_x0,
      c => concat_y_net_x10
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
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_89c5949a28
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x270,
      clk => clk_1_sg_x270,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_butterfly"

entity r4_butterfly_entity_c8cc4a8113 is
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
end r4_butterfly_entity_c8cc4a8113;

architecture structural of r4_butterfly_entity_c8cc4a8113 is
  signal ce_1_sg_x271: std_logic;
  signal clk_1_sg_x271: std_logic;
  signal concat_y_net_x10: std_logic_vector(19 downto 0);
  signal concat_y_net_x11: std_logic_vector(19 downto 0);
  signal concat_y_net_x16: std_logic_vector(17 downto 0);
  signal concat_y_net_x17: std_logic_vector(17 downto 0);
  signal concat_y_net_x18: std_logic_vector(17 downto 0);
  signal concat_y_net_x19: std_logic_vector(21 downto 0);
  signal concat_y_net_x20: std_logic_vector(21 downto 0);
  signal concat_y_net_x21: std_logic_vector(21 downto 0);
  signal concat_y_net_x22: std_logic_vector(21 downto 0);
  signal concat_y_net_x7: std_logic_vector(19 downto 0);
  signal concat_y_net_x9: std_logic_vector(19 downto 0);
  signal delay1_q_net_x2: std_logic_vector(17 downto 0);
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;

begin
  delay1_q_net_x2 <= a_in;
  concat_y_net_x16 <= b_in;
  concat_y_net_x17 <= c_in;
  ce_1_sg_x271 <= ce_1;
  clk_1_sg_x271 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  butterfly0_6af82f5f7a: entity work.butterfly0_entity_6af82f5f7a
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x17,
      ce_1 => ce_1_sg_x271,
      clk_1 => clk_1_sg_x271,
      a_b => concat_y_net_x9,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_64372e40fa: entity work.butterfly1_entity_64372e40fa
    port map (
      a => concat_y_net_x16,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x271,
      clk_1 => clk_1_sg_x271,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x10,
      a_b_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x3
    );

  butterfly2_c19c587f13: entity work.butterfly2_entity_c19c587f13
    port map (
      a => concat_y_net_x9,
      b => concat_y_net_x10,
      ce_1 => ce_1_sg_x271,
      clk_1 => clk_1_sg_x271,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_9ef24f7440: entity work.butterfly3j_entity_9ef24f7440
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x271,
      clk_1 => clk_1_sg_x271,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_ae7a64a88c is
  port (
    c: in std_logic_vector(17 downto 0); 
    im: out std_logic_vector(8 downto 0); 
    re: out std_logic_vector(8 downto 0)
  );
end c_to_ri_entity_ae7a64a88c;

architecture structural of c_to_ri_entity_ae7a64a88c is
  signal delay1_q_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(8 downto 0);
  signal slice_im_y_net: std_logic_vector(8 downto 0);
  signal slice_re_y_net: std_logic_vector(8 downto 0);

begin
  delay1_q_net_x0 <= c;
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
      x => delay1_q_net_x0,
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
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_ea87272015 is
  port (
    im: in std_logic_vector(8 downto 0); 
    re: in std_logic_vector(8 downto 0); 
    c: out std_logic_vector(17 downto 0)
  );
end ri_to_c_entity_ea87272015;

architecture structural of ri_to_c_entity_ea87272015 is
  signal concat_y_net_x17: std_logic_vector(17 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(8 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(8 downto 0);
  signal force_im_output_port_net: std_logic_vector(8 downto 0);
  signal force_re_output_port_net: std_logic_vector(8 downto 0);

begin
  convert_im_dout_net_x0 <= im;
  convert_re_dout_net_x0 <= re;
  c <= concat_y_net_x17;

  concat: entity work.concat_f2f6490a28
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x17
    );

  force_im: entity work.reinterpret_de38ef9df5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_im_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_de38ef9df5
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy1"

entity cmpy1_entity_d225e9005b is
  port (
    a_in: in std_logic_vector(17 downto 0); 
    b: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    a_out: out std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end cmpy1_entity_d225e9005b;

architecture structural of cmpy1_entity_d225e9005b is
  signal br_add_bi_s_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x272: std_logic;
  signal clk_1_sg_x272: std_logic;
  signal concat_y_net_x18: std_logic_vector(17 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(8 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(8 downto 0);
  signal delay1_q_net_x1: std_logic_vector(17 downto 0);
  signal delay1_q_net_x3: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic_vector(17 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(15 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(15 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(15 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(15 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(15 downto 0);
  signal sumsum_p_net: std_logic_vector(15 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay2_q_net_x0 <= a_in;
  delay1_q_net_x1 <= b;
  ce_1_sg_x272 <= ce_1;
  clk_1_sg_x272 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x18;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_9c69b3eb3e
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_3c5195024d: entity work.c_to_ri1_entity_5470105349
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_ae7a64a88c: entity work.c_to_ri_entity_ae7a64a88c
    port map (
      c => delay1_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 8,
      dout_width => 9,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 8,
      dout_width => 9,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
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
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      d(0) => delay3_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay1: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      d => delay2_q_net_x0,
      en => '1',
      q => delay1_q_net_x3
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 8,
      a_width => 9,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 9,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 9,
      c_output_width => 18,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_541e977e441ad0e7",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 15,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      clr => '0',
      core_ce => ce_1_sg_x272,
      core_clk => clk_1_sg_x272,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 8,
      a_width => 9,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 9,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 9,
      c_output_width => 18,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_541e977e441ad0e7",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 15,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      clr => '0',
      core_ce => ce_1_sg_x272,
      core_clk => clk_1_sg_x272,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_ea87272015: entity work.ri_to_c_entity_ea87272015
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x18
    );

  rr_add_ii: entity work.addsub_4d1a74115a
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_d014357f6e
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_6c5172b36d
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 8,
      a_width => 10,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 10,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 10,
      c_output_width => 20,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_0222debb9055fdfb",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 15,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      clr => '0',
      core_ce => ce_1_sg_x272,
      core_clk => clk_1_sg_x272,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x272,
      clk => clk_1_sg_x272,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/cmpy2"

entity cmpy2_entity_dcc5229fd2 is
  port (
    b: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(17 downto 0)
  );
end cmpy2_entity_dcc5229fd2;

architecture structural of cmpy2_entity_dcc5229fd2 is
  signal br_add_bi_s_net: std_logic_vector(9 downto 0);
  signal ce_1_sg_x273: std_logic;
  signal clk_1_sg_x273: std_logic;
  signal concat_y_net_x19: std_logic_vector(17 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(8 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(8 downto 0);
  signal delay4_q_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(8 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(8 downto 0);
  signal imim_p_net: std_logic_vector(15 downto 0);
  signal mem_c_data_net_x1: std_logic_vector(17 downto 0);
  signal rere_p_net: std_logic_vector(15 downto 0);
  signal rr_add_ii_s_net: std_logic_vector(15 downto 0);
  signal rr_sub_ii_s_net: std_logic_vector(15 downto 0);
  signal ss_sub_rrii_s_net: std_logic_vector(15 downto 0);
  signal sumsum_p_net: std_logic_vector(15 downto 0);
  signal wr_add_wi_s_net: std_logic_vector(9 downto 0);

begin
  delay4_q_net_x1 <= b;
  ce_1_sg_x273 <= ce_1;
  clk_1_sg_x273 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x19;

  br_add_bi: entity work.addsub_9c69b3eb3e
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_55158ee653: entity work.c_to_ri1_entity_5470105349
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_2d6b1d13a8: entity work.c_to_ri_entity_ae7a64a88c
    port map (
      c => delay4_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert_im: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 8,
      dout_width => 9,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      din => ss_sub_rrii_s_net,
      dout => convert_im_dout_net_x0
    );

  convert_re: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 15,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 8,
      dout_width => 9,
      latency => 3,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  imim: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 8,
      a_width => 9,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 9,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 9,
      c_output_width => 18,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_541e977e441ad0e7",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 15,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      core_ce => ce_1_sg_x273,
      core_clk => clk_1_sg_x273,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imim_p_net
    );

  rere: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 8,
      a_width => 9,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 9,
      c_a_type => 0,
      c_a_width => 9,
      c_b_type => 0,
      c_b_width => 9,
      c_baat => 9,
      c_output_width => 18,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_541e977e441ad0e7",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 15,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      core_ce => ce_1_sg_x273,
      core_clk => clk_1_sg_x273,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_84882a1d2f: entity work.ri_to_c_entity_ea87272015
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_4d1a74115a
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_d014357f6e
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_6c5172b36d
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      s => ss_sub_rrii_s_net
    );

  sumsum: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 8,
      a_width => 10,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 10,
      c_a_type => 0,
      c_a_width => 10,
      c_b_type => 0,
      c_b_width => 10,
      c_baat => 10,
      c_output_width => 20,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_0222debb9055fdfb",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 15,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => br_add_bi_s_net,
      b => wr_add_wi_s_net,
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      core_ce => ce_1_sg_x273,
      core_clk => clk_1_sg_x273,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x273,
      clk => clk_1_sg_x273,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_ad96421b04 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_ad96421b04;

architecture structural of twiddle_gen1_entity_ad96421b04 is
  signal addr_sel_y_net: std_logic_vector(3 downto 0);
  signal ce_1_sg_x275: std_logic;
  signal clk_1_sg_x275: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x13: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x275 <= ce_1;
  clk_1_sg_x275 <= clk_1;
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
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
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
      ce => ce_1_sg_x275,
      clk => clk_1_sg_x275,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_43d8e43601 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_43d8e43601;

architecture structural of twiddle_gen2_entity_43d8e43601 is
  signal addr_sel_y_net: std_logic_vector(3 downto 0);
  signal ce_1_sg_x276: std_logic;
  signal clk_1_sg_x276: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x14: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x276 <= ce_1;
  clk_1_sg_x276 <= clk_1;
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
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
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
      ce => ce_1_sg_x276,
      clk => clk_1_sg_x276,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_6929dde8bc is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_6929dde8bc;

architecture structural of twiddle_gen3_entity_6929dde8bc is
  signal addr_sel_y_net: std_logic_vector(3 downto 0);
  signal ce_1_sg_x277: std_logic;
  signal clk_1_sg_x277: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x15: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x277 <= ce_1;
  clk_1_sg_x277 <= clk_1;
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
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
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
      ce => ce_1_sg_x277,
      clk => clk_1_sg_x277,
      en => "1",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3/r4_twiddle"

entity r4_twiddle_entity_a52b75ddc3 is
  port (
    a_in: in std_logic_vector(17 downto 0); 
    b: in std_logic_vector(17 downto 0); 
    c: in std_logic_vector(17 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d: in std_logic_vector(17 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(17 downto 0); 
    cw: out std_logic_vector(17 downto 0); 
    dw: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end r4_twiddle_entity_a52b75ddc3;

architecture structural of r4_twiddle_entity_a52b75ddc3 is
  signal ce_1_sg_x278: std_logic;
  signal clk_1_sg_x278: std_logic;
  signal concat_y_net_x21: std_logic_vector(17 downto 0);
  signal concat_y_net_x22: std_logic_vector(17 downto 0);
  signal concat_y_net_x23: std_logic_vector(17 downto 0);
  signal delay1_q_net_x1: std_logic_vector(17 downto 0);
  signal delay1_q_net_x4: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic_vector(17 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay4_q_net_x1: std_logic_vector(17 downto 0);
  signal delay5_q_net_x1: std_logic_vector(17 downto 0);
  signal delay_q_net_x16: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x3: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x4: std_logic_vector(17 downto 0);
  signal mux1_y_net_x8: std_logic_vector(17 downto 0);
  signal mux1_y_net_x9: std_logic_vector(17 downto 0);
  signal slr_q_net_x10: std_logic_vector(17 downto 0);
  signal slr_q_net_x11: std_logic_vector(17 downto 0);

begin
  slr_q_net_x10 <= a_in;
  mux1_y_net_x8 <= b;
  slr_q_net_x11 <= c;
  ce_1_sg_x278 <= ce_1;
  clk_1_sg_x278 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x16 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x22;
  dw <= concat_y_net_x23;
  sync_out <= delay_q_net_x4;

  cmpy1_d225e9005b: entity work.cmpy1_entity_d225e9005b
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x278,
      clk_1 => clk_1_sg_x278,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_dcc5229fd2: entity work.cmpy2_entity_dcc5229fd2
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x278,
      clk_1 => clk_1_sg_x278,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x22
    );

  cmpy3_285a8bbcd2: entity work.cmpy2_entity_dcc5229fd2
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x278,
      clk_1 => clk_1_sg_x278,
      w => mem_c_data_net_x4,
      bw => concat_y_net_x23
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x278,
      clk => clk_1_sg_x278,
      d => mux1_y_net_x8,
      en => '1',
      q => delay1_q_net_x1
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x278,
      clk => clk_1_sg_x278,
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
      ce => ce_1_sg_x278,
      clk => clk_1_sg_x278,
      d(0) => delay_q_net_x16,
      en => '1',
      q(0) => delay3_q_net_x0
    );

  delay4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x278,
      clk => clk_1_sg_x278,
      d => slr_q_net_x11,
      en => '1',
      q => delay4_q_net_x1
    );

  delay5: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x278,
      clk => clk_1_sg_x278,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_ad96421b04: entity work.twiddle_gen1_entity_ad96421b04
    port map (
      ce_1 => ce_1_sg_x278,
      clk_1 => clk_1_sg_x278,
      sync_in => delay_q_net_x16,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_43d8e43601: entity work.twiddle_gen2_entity_43d8e43601
    port map (
      ce_1 => ce_1_sg_x278,
      clk_1 => clk_1_sg_x278,
      sync_in => delay_q_net_x16,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_6929dde8bc: entity work.twiddle_gen3_entity_6929dde8bc
    port map (
      ce_1 => ce_1_sg_x278,
      clk_1 => clk_1_sg_x278,
      sync_in => delay_q_net_x16,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_3"

entity r4_dit_stage_3_entity_6d40561b5a is
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
end r4_dit_stage_3_entity_6d40561b5a;

architecture structural of r4_dit_stage_3_entity_6d40561b5a is
  signal ce_1_sg_x279: std_logic;
  signal clk_1_sg_x279: std_logic;
  signal concat_y_net_x23: std_logic_vector(17 downto 0);
  signal concat_y_net_x24: std_logic_vector(17 downto 0);
  signal concat_y_net_x25: std_logic_vector(17 downto 0);
  signal concat_y_net_x48: std_logic_vector(17 downto 0);
  signal concat_y_net_x49: std_logic_vector(17 downto 0);
  signal concat_y_net_x50: std_logic_vector(17 downto 0);
  signal concat_y_net_x51: std_logic_vector(17 downto 0);
  signal concat_y_net_x52: std_logic_vector(21 downto 0);
  signal concat_y_net_x53: std_logic_vector(21 downto 0);
  signal concat_y_net_x54: std_logic_vector(21 downto 0);
  signal concat_y_net_x55: std_logic_vector(21 downto 0);
  signal delay1_q_net_x4: std_logic_vector(17 downto 0);
  signal delay_q_net_x12: std_logic;
  signal delay_q_net_x13: std_logic;
  signal delay_q_net_x14: std_logic;
  signal delay_q_net_x16: std_logic;
  signal mux1_y_net_x8: std_logic_vector(17 downto 0);
  signal mux1_y_net_x9: std_logic_vector(17 downto 0);
  signal slr_q_net_x10: std_logic_vector(17 downto 0);
  signal slr_q_net_x11: std_logic_vector(17 downto 0);

begin
  concat_y_net_x48 <= a_in;
  concat_y_net_x49 <= b_in;
  concat_y_net_x50 <= c_in;
  ce_1_sg_x279 <= ce_1;
  clk_1_sg_x279 <= clk_1;
  concat_y_net_x51 <= d_in;
  delay_q_net_x13 <= sync_in;
  a_out <= concat_y_net_x52;
  b_out <= concat_y_net_x53;
  c_out <= concat_y_net_x54;
  d_out <= concat_y_net_x55;
  sync_out <= delay_q_net_x14;

  quadplex_commutator_f4af46e68b: entity work.quadplex_commutator_entity_f4af46e68b
    port map (
      a => concat_y_net_x48,
      b => concat_y_net_x49,
      c => concat_y_net_x50,
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      d => concat_y_net_x51,
      sync_in => delay_q_net_x13,
      abcd0 => slr_q_net_x10,
      abcd1 => mux1_y_net_x8,
      abcd2 => slr_q_net_x11,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x16
    );

  r4_butterfly_c8cc4a8113: entity work.r4_butterfly_entity_c8cc4a8113
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x23,
      c_in => concat_y_net_x24,
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
      d_in => concat_y_net_x25,
      sync_in => delay_q_net_x12,
      a_out => concat_y_net_x52,
      b_out => concat_y_net_x53,
      c_out => concat_y_net_x54,
      d_out => concat_y_net_x55,
      sync_out => delay_q_net_x14
    );

  r4_twiddle_a52b75ddc3: entity work.r4_twiddle_entity_a52b75ddc3
    port map (
      a_in => slr_q_net_x10,
      b => mux1_y_net_x8,
      c => slr_q_net_x11,
      ce_1 => ce_1_sg_x279,
      clk_1 => clk_1_sg_x279,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_84884a866a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(21 downto 0); 
    out_x0: out std_logic_vector(21 downto 0)
  );
end delay_b_entity_84884a866a;

architecture structural of delay_b_entity_84884a866a is
  signal ce_1_sg_x280: std_logic;
  signal clk_1_sg_x280: std_logic;
  signal slr_q_net_x1: std_logic_vector(21 downto 0);
  signal slr_q_net_x2: std_logic_vector(21 downto 0);

begin
  ce_1_sg_x280 <= ce_1;
  clk_1_sg_x280 <= clk_1;
  slr_q_net_x1 <= in_x0;
  out_x0 <= slr_q_net_x2;

  slr: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 22
    )
    port map (
      ce => ce_1_sg_x280,
      clk => clk_1_sg_x280,
      d => slr_q_net_x1,
      en => '1',
      q => slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_c3364d7166 is
  port (
    aloahi: in std_logic_vector(21 downto 0); 
    blobhi: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(21 downto 0); 
    aloblo: out std_logic_vector(21 downto 0)
  );
end biplex_commutator_01_entity_c3364d7166;

architecture structural of biplex_commutator_01_entity_c3364d7166 is
  signal ce_1_sg_x282: std_logic;
  signal clk_1_sg_x282: std_logic;
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_q_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(21 downto 0);
  signal mux_y_net_x0: std_logic_vector(21 downto 0);
  signal slr_q_net_x2: std_logic_vector(21 downto 0);
  signal slr_q_net_x3: std_logic_vector(21 downto 0);
  signal slr_q_net_x4: std_logic_vector(21 downto 0);
  signal slr_q_net_x5: std_logic_vector(21 downto 0);
  signal top_bit_y_net: std_logic;

begin
  slr_q_net_x3 <= aloahi;
  slr_q_net_x4 <= blobhi;
  ce_1_sg_x282 <= ce_1;
  clk_1_sg_x282 <= clk_1;
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
      ce => ce_1_sg_x282,
      clk => clk_1_sg_x282,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_b_84884a866a: entity work.delay_b_entity_84884a866a
    port map (
      ce_1 => ce_1_sg_x282,
      clk_1 => clk_1_sg_x282,
      in_x0 => slr_q_net_x4,
      out_x0 => slr_q_net_x2
    );

  delay_lo_6e67ffd62f: entity work.delay_b_entity_84884a866a
    port map (
      ce_1 => ce_1_sg_x282,
      clk_1 => clk_1_sg_x282,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x282,
      clk => clk_1_sg_x282,
      clr => '0',
      d0 => slr_q_net_x3,
      d1 => slr_q_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x282,
      clk => clk_1_sg_x282,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_2fdd1636f3 is
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
end biplex_commutator_23_entity_2fdd1636f3;

architecture structural of biplex_commutator_23_entity_2fdd1636f3 is
  signal ce_1_sg_x285: std_logic;
  signal clk_1_sg_x285: std_logic;
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x2: std_logic_vector(21 downto 0);
  signal mux1_y_net_x3: std_logic_vector(21 downto 0);
  signal mux1_y_net_x4: std_logic_vector(21 downto 0);
  signal mux_y_net_x0: std_logic_vector(21 downto 0);
  signal slr_q_net_x0: std_logic_vector(21 downto 0);
  signal slr_q_net_x2: std_logic_vector(21 downto 0);
  signal top_bit_y_net: std_logic;

begin
  mux1_y_net_x2 <= aloahi;
  mux1_y_net_x3 <= blobhi;
  ce_1_sg_x285 <= ce_1;
  clk_1_sg_x285 <= clk_1;
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
      ce => ce_1_sg_x285,
      clk => clk_1_sg_x285,
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
      ce => ce_1_sg_x285,
      clk => clk_1_sg_x285,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_6232ce0519: entity work.delay_b_entity_84884a866a
    port map (
      ce_1 => ce_1_sg_x285,
      clk_1 => clk_1_sg_x285,
      in_x0 => mux1_y_net_x3,
      out_x0 => slr_q_net_x0
    );

  delay_lo_6f78e52568: entity work.delay_b_entity_84884a866a
    port map (
      ce_1 => ce_1_sg_x285,
      clk_1 => clk_1_sg_x285,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x2
    );

  mux: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x285,
      clk => clk_1_sg_x285,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x285,
      clk => clk_1_sg_x285,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_b4c9d9259e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(21 downto 0); 
    out_x0: out std_logic_vector(21 downto 0)
  );
end delay_b_entity_b4c9d9259e;

architecture structural of delay_b_entity_b4c9d9259e is
  signal ce_1_sg_x286: std_logic;
  signal clk_1_sg_x286: std_logic;
  signal concat_y_net_x55: std_logic_vector(21 downto 0);
  signal slr_q_net_x0: std_logic_vector(21 downto 0);

begin
  ce_1_sg_x286 <= ce_1;
  clk_1_sg_x286 <= clk_1;
  concat_y_net_x55 <= in_x0;
  out_x0 <= slr_q_net_x0;

  slr: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 22
    )
    port map (
      ce => ce_1_sg_x286,
      clk => clk_1_sg_x286,
      d => concat_y_net_x55,
      en => '1',
      q => slr_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_c2228c1162 is
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
end biplex_commutator_ac_entity_c2228c1162;

architecture structural of biplex_commutator_ac_entity_c2228c1162 is
  signal ce_1_sg_x288: std_logic;
  signal clk_1_sg_x288: std_logic;
  signal concat_y_net_x56: std_logic_vector(21 downto 0);
  signal concat_y_net_x57: std_logic_vector(21 downto 0);
  signal counter_op_net: std_logic_vector(3 downto 0);
  signal delay_q_net_x15: std_logic;
  signal delay_q_net_x16: std_logic;
  signal mux1_y_net_x3: std_logic_vector(21 downto 0);
  signal mux_y_net_x0: std_logic_vector(21 downto 0);
  signal slr_q_net_x0: std_logic_vector(21 downto 0);
  signal slr_q_net_x5: std_logic_vector(21 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x56 <= aloahi;
  concat_y_net_x57 <= blobhi;
  ce_1_sg_x288 <= ce_1;
  clk_1_sg_x288 <= clk_1;
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
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
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
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      d(0) => delay_q_net_x15,
      en => '1',
      q(0) => delay_q_net_x16
    );

  delay_b_b4c9d9259e: entity work.delay_b_entity_b4c9d9259e
    port map (
      ce_1 => ce_1_sg_x288,
      clk_1 => clk_1_sg_x288,
      in_x0 => concat_y_net_x57,
      out_x0 => slr_q_net_x0
    );

  delay_lo_93f1101583: entity work.delay_b_entity_b4c9d9259e
    port map (
      ce_1 => ce_1_sg_x288,
      clk_1 => clk_1_sg_x288,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
      clr => '0',
      d0 => concat_y_net_x56,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_c83be1b493
    port map (
      ce => ce_1_sg_x288,
      clk => clk_1_sg_x288,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/quadplex_commutator"

entity quadplex_commutator_entity_9eff080c9f is
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
end quadplex_commutator_entity_9eff080c9f;

architecture structural of quadplex_commutator_entity_9eff080c9f is
  signal ce_1_sg_x292: std_logic;
  signal clk_1_sg_x292: std_logic;
  signal concat_y_net_x60: std_logic_vector(21 downto 0);
  signal concat_y_net_x61: std_logic_vector(21 downto 0);
  signal concat_y_net_x62: std_logic_vector(21 downto 0);
  signal concat_y_net_x63: std_logic_vector(21 downto 0);
  signal delay_q_net_x17: std_logic;
  signal delay_q_net_x18: std_logic;
  signal delay_q_net_x19: std_logic;
  signal delay_q_net_x20: std_logic;
  signal mux1_y_net_x3: std_logic_vector(21 downto 0);
  signal mux1_y_net_x5: std_logic_vector(21 downto 0);
  signal mux1_y_net_x6: std_logic_vector(21 downto 0);
  signal mux1_y_net_x7: std_logic_vector(21 downto 0);
  signal slr_q_net_x6: std_logic_vector(21 downto 0);
  signal slr_q_net_x7: std_logic_vector(21 downto 0);
  signal slr_q_net_x8: std_logic_vector(21 downto 0);
  signal slr_q_net_x9: std_logic_vector(21 downto 0);

begin
  concat_y_net_x60 <= a;
  concat_y_net_x61 <= b;
  concat_y_net_x62 <= c;
  ce_1_sg_x292 <= ce_1;
  clk_1_sg_x292 <= clk_1;
  concat_y_net_x63 <= d;
  delay_q_net_x19 <= sync_in;
  abcd0 <= slr_q_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= slr_q_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x20;

  biplex_commutator_01_c3364d7166: entity work.biplex_commutator_01_entity_c3364d7166
    port map (
      aloahi => slr_q_net_x6,
      blobhi => slr_q_net_x7,
      ce_1 => ce_1_sg_x292,
      clk_1 => clk_1_sg_x292,
      sync_in => delay_q_net_x17,
      ahibhi => mux1_y_net_x6,
      aloblo => slr_q_net_x8
    );

  biplex_commutator_23_2fdd1636f3: entity work.biplex_commutator_23_entity_2fdd1636f3
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x292,
      clk_1 => clk_1_sg_x292,
      sync_in => delay_q_net_x18,
      ahibhi => mux1_y_net_x7,
      aloblo => slr_q_net_x9,
      sync_out => delay_q_net_x20
    );

  biplex_commutator_ac_c2228c1162: entity work.biplex_commutator_ac_entity_c2228c1162
    port map (
      aloahi => concat_y_net_x60,
      blobhi => concat_y_net_x62,
      ce_1 => ce_1_sg_x292,
      clk_1 => clk_1_sg_x292,
      sync_in => delay_q_net_x19,
      ahibhi => mux1_y_net_x3,
      aloblo => slr_q_net_x6,
      sync_out => delay_q_net_x17
    );

  biplex_commutator_bd_77d4b1a514: entity work.biplex_commutator_ac_entity_c2228c1162
    port map (
      aloahi => concat_y_net_x61,
      blobhi => concat_y_net_x63,
      ce_1 => ce_1_sg_x292,
      clk_1 => clk_1_sg_x292,
      sync_in => delay_q_net_x19,
      ahibhi => mux1_y_net_x5,
      aloblo => slr_q_net_x7,
      sync_out => delay_q_net_x18
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_9d09d1fddc is
  port (
    c: in std_logic_vector(21 downto 0); 
    im: out std_logic_vector(10 downto 0); 
    re: out std_logic_vector(10 downto 0)
  );
end c_to_ri_entity_9d09d1fddc;

architecture structural of c_to_ri_entity_9d09d1fddc is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_f68b008a78 is
  port (
    im: in std_logic_vector(11 downto 0); 
    re: in std_logic_vector(11 downto 0); 
    c: out std_logic_vector(23 downto 0)
  );
end ri_to_c_entity_f68b008a78;

architecture structural of ri_to_c_entity_f68b008a78 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly0"

entity butterfly0_entity_4679b2c42e is
  port (
    a: in std_logic_vector(21 downto 0); 
    b: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(23 downto 0); 
    a_b_x0: out std_logic_vector(23 downto 0)
  );
end butterfly0_entity_4679b2c42e;

architecture structural of butterfly0_entity_4679b2c42e is
  signal add_im_s_net: std_logic_vector(11 downto 0);
  signal add_re_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x293: std_logic;
  signal clk_1_sg_x293: std_logic;
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
  ce_1_sg_x293 <= ce_1;
  clk_1_sg_x293 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_470ffe01d4
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x293,
      clk => clk_1_sg_x293,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_470ffe01d4
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x293,
      clk => clk_1_sg_x293,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_ee64847385: entity work.c_to_ri_entity_9d09d1fddc
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_9d09d1fddc: entity work.c_to_ri_entity_9d09d1fddc
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

  ri_to_c1_ffebd8e651: entity work.ri_to_c_entity_f68b008a78
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_f68b008a78: entity work.ri_to_c_entity_f68b008a78
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
      ce => ce_1_sg_x293,
      clk => clk_1_sg_x293,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_388a97573b
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly1"

entity butterfly1_entity_011a8b0075 is
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
end butterfly1_entity_011a8b0075;

architecture structural of butterfly1_entity_011a8b0075 is
  signal add_im_s_net: std_logic_vector(11 downto 0);
  signal add_re_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x294: std_logic;
  signal clk_1_sg_x294: std_logic;
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
  ce_1_sg_x294 <= ce_1;
  clk_1_sg_x294 <= clk_1;
  delay_q_net_x1 <= sync_in;
  a_b <= concat_y_net_x6;
  a_b_x0 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  add_im: entity work.addsub_470ffe01d4
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_470ffe01d4
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_6dcea8396f: entity work.c_to_ri_entity_9d09d1fddc
    port map (
      c => concat_y_net_x5,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_b13675c55b: entity work.c_to_ri_entity_9d09d1fddc
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
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
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

  ri_to_c1_43a742be84: entity work.ri_to_c_entity_f68b008a78
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x7
    );

  ri_to_c_6fafdb5434: entity work.ri_to_c_entity_f68b008a78
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
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_388a97573b
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x294,
      clk => clk_1_sg_x294,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_a1756e98d3 is
  port (
    c: in std_logic_vector(23 downto 0); 
    im: out std_logic_vector(11 downto 0); 
    re: out std_logic_vector(11 downto 0)
  );
end c_to_ri_entity_a1756e98d3;

architecture structural of c_to_ri_entity_a1756e98d3 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_daa531ef30 is
  port (
    im: in std_logic_vector(12 downto 0); 
    re: in std_logic_vector(12 downto 0); 
    c: out std_logic_vector(25 downto 0)
  );
end ri_to_c_entity_daa531ef30;

architecture structural of ri_to_c_entity_daa531ef30 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly2"

entity butterfly2_entity_a719dc5ac2 is
  port (
    a: in std_logic_vector(23 downto 0); 
    b: in std_logic_vector(23 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(25 downto 0); 
    a_b_x0: out std_logic_vector(25 downto 0)
  );
end butterfly2_entity_a719dc5ac2;

architecture structural of butterfly2_entity_a719dc5ac2 is
  signal add_im_s_net: std_logic_vector(12 downto 0);
  signal add_re_s_net: std_logic_vector(12 downto 0);
  signal ce_1_sg_x295: std_logic;
  signal clk_1_sg_x295: std_logic;
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
  ce_1_sg_x295 <= ce_1;
  clk_1_sg_x295 <= clk_1;
  a_b <= concat_y_net_x11;
  a_b_x0 <= concat_y_net_x12;

  add_im: entity work.addsub_ed74d532a0
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_ed74d532a0
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_c17a27fb57: entity work.c_to_ri_entity_a1756e98d3
    port map (
      c => concat_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_a1756e98d3: entity work.c_to_ri_entity_a1756e98d3
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

  ri_to_c1_b67d26a8fe: entity work.ri_to_c_entity_daa531ef30
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x12
    );

  ri_to_c_daa531ef30: entity work.ri_to_c_entity_daa531ef30
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
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f11535f968
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x295,
      clk => clk_1_sg_x295,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_butterfly/butterfly3j"

entity butterfly3j_entity_8b0dcaa1a8 is
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
end butterfly3j_entity_8b0dcaa1a8;

architecture structural of butterfly3j_entity_8b0dcaa1a8 is
  signal add_im_s_net: std_logic_vector(12 downto 0);
  signal add_re_s_net: std_logic_vector(12 downto 0);
  signal ce_1_sg_x296: std_logic;
  signal clk_1_sg_x296: std_logic;
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
  ce_1_sg_x296 <= ce_1;
  clk_1_sg_x296 <= clk_1;
  delay_q_net_x3 <= sync_in;
  a_b <= concat_y_net_x10;
  a_b_x0 <= concat_y_net_x11;
  sync_out <= delay_q_net_x0;

  add_im: entity work.addsub_f11535f968
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_ed74d532a0
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_7772ce551c: entity work.c_to_ri_entity_a1756e98d3
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_68a599b59f: entity work.c_to_ri_entity_a1756e98d3
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
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
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

  ri_to_c1_887e71ff60: entity work.ri_to_c_entity_daa531ef30
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x11
    );

  ri_to_c_cefd0f7360: entity work.ri_to_c_entity_daa531ef30
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
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f11535f968
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x296,
      clk => clk_1_sg_x296,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_butterfly"

entity r4_butterfly_entity_952b014598 is
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
end r4_butterfly_entity_952b014598;

architecture structural of r4_butterfly_entity_952b014598 is
  signal ce_1_sg_x297: std_logic;
  signal clk_1_sg_x297: std_logic;
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
  ce_1_sg_x297 <= ce_1;
  clk_1_sg_x297 <= clk_1;
  concat_y_net_x18 <= d_in;
  delay_q_net_x2 <= sync_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;
  sync_out <= delay_q_net_x4;

  butterfly0_4679b2c42e: entity work.butterfly0_entity_4679b2c42e
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x17,
      ce_1 => ce_1_sg_x297,
      clk_1 => clk_1_sg_x297,
      a_b => concat_y_net_x9,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_011a8b0075: entity work.butterfly1_entity_011a8b0075
    port map (
      a => concat_y_net_x16,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x297,
      clk_1 => clk_1_sg_x297,
      sync_in => delay_q_net_x2,
      a_b => concat_y_net_x10,
      a_b_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x3
    );

  butterfly2_a719dc5ac2: entity work.butterfly2_entity_a719dc5ac2
    port map (
      a => concat_y_net_x9,
      b => concat_y_net_x10,
      ce_1 => ce_1_sg_x297,
      clk_1 => clk_1_sg_x297,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_8b0dcaa1a8: entity work.butterfly3j_entity_8b0dcaa1a8
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x297,
      clk_1 => clk_1_sg_x297,
      sync_in => delay_q_net_x3,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22,
      sync_out => delay_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_aa5451072f is
  port (
    c: in std_logic_vector(21 downto 0); 
    im: out std_logic_vector(10 downto 0); 
    re: out std_logic_vector(10 downto 0)
  );
end c_to_ri_entity_aa5451072f;

architecture structural of c_to_ri_entity_aa5451072f is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_e18ea9efe4 is
  port (
    im: in std_logic_vector(10 downto 0); 
    re: in std_logic_vector(10 downto 0); 
    c: out std_logic_vector(21 downto 0)
  );
end ri_to_c_entity_e18ea9efe4;

architecture structural of ri_to_c_entity_e18ea9efe4 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy1"

entity cmpy1_entity_c4a650cdc4 is
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
end cmpy1_entity_c4a650cdc4;

architecture structural of cmpy1_entity_c4a650cdc4 is
  signal br_add_bi_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x298: std_logic;
  signal clk_1_sg_x298: std_logic;
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
  ce_1_sg_x298 <= ce_1;
  clk_1_sg_x298 <= clk_1;
  delay3_q_net_x0 <= sync_in;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x18;
  sync_out <= delay_q_net_x3;

  br_add_bi: entity work.addsub_d661929060
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_8f5f1ac6a0: entity work.c_to_ri1_entity_5470105349
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_aa5451072f: entity work.c_to_ri_entity_aa5451072f
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
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
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
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
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
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
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
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
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
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
      clr => '0',
      core_ce => ce_1_sg_x298,
      core_clk => clk_1_sg_x298,
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
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
      clr => '0',
      core_ce => ce_1_sg_x298,
      core_clk => clk_1_sg_x298,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_e18ea9efe4: entity work.ri_to_c_entity_e18ea9efe4
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x18
    );

  rr_add_ii: entity work.addsub_c8df442ec4
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_6dd6aca36b
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_21a1218bfe
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
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
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
      clr => '0',
      core_ce => ce_1_sg_x298,
      core_clk => clk_1_sg_x298,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x298,
      clk => clk_1_sg_x298,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/cmpy2"

entity cmpy2_entity_a03450ad39 is
  port (
    b: in std_logic_vector(21 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(21 downto 0)
  );
end cmpy2_entity_a03450ad39;

architecture structural of cmpy2_entity_a03450ad39 is
  signal br_add_bi_s_net: std_logic_vector(11 downto 0);
  signal ce_1_sg_x299: std_logic;
  signal clk_1_sg_x299: std_logic;
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
  ce_1_sg_x299 <= ce_1;
  clk_1_sg_x299 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x19;

  br_add_bi: entity work.addsub_d661929060
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_7397628ca3: entity work.c_to_ri1_entity_5470105349
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_4fca9525c6: entity work.c_to_ri_entity_aa5451072f
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
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
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
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
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
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
      clr => '0',
      core_ce => ce_1_sg_x299,
      core_clk => clk_1_sg_x299,
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
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
      clr => '0',
      core_ce => ce_1_sg_x299,
      core_clk => clk_1_sg_x299,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_ada6b1cece: entity work.ri_to_c_entity_e18ea9efe4
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_c8df442ec4
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_6dd6aca36b
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_21a1218bfe
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
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
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
      clr => '0',
      core_ce => ce_1_sg_x299,
      core_clk => clk_1_sg_x299,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x299,
      clk => clk_1_sg_x299,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_0b2791cb0c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_0b2791cb0c;

architecture structural of twiddle_gen1_entity_0b2791cb0c is
  signal addr_sel_y_net: std_logic_vector(5 downto 0);
  signal ce_1_sg_x301: std_logic;
  signal clk_1_sg_x301: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x21: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x301 <= ce_1;
  clk_1_sg_x301 <= clk_1;
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
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
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
      ce => ce_1_sg_x301,
      clk => clk_1_sg_x301,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_584fce07b3 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_584fce07b3;

architecture structural of twiddle_gen2_entity_584fce07b3 is
  signal addr_sel_y_net: std_logic_vector(5 downto 0);
  signal ce_1_sg_x302: std_logic;
  signal clk_1_sg_x302: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x22: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x302 <= ce_1;
  clk_1_sg_x302 <= clk_1;
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
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
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
      ce => ce_1_sg_x302,
      clk => clk_1_sg_x302,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_92ffe16428 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_92ffe16428;

architecture structural of twiddle_gen3_entity_92ffe16428 is
  signal addr_sel_y_net: std_logic_vector(5 downto 0);
  signal ce_1_sg_x303: std_logic;
  signal clk_1_sg_x303: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x23: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x303 <= ce_1;
  clk_1_sg_x303 <= clk_1;
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
      ce => ce_1_sg_x303,
      clk => clk_1_sg_x303,
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
      ce => ce_1_sg_x303,
      clk => clk_1_sg_x303,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4/r4_twiddle"

entity r4_twiddle_entity_258d262d07 is
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
end r4_twiddle_entity_258d262d07;

architecture structural of r4_twiddle_entity_258d262d07 is
  signal ce_1_sg_x304: std_logic;
  signal clk_1_sg_x304: std_logic;
  signal concat_y_net_x21: std_logic_vector(21 downto 0);
  signal concat_y_net_x22: std_logic_vector(21 downto 0);
  signal concat_y_net_x23: std_logic_vector(21 downto 0);
  signal delay1_q_net_x1: std_logic_vector(21 downto 0);
  signal delay1_q_net_x4: std_logic_vector(21 downto 0);
  signal delay2_q_net_x0: std_logic_vector(21 downto 0);
  signal delay3_q_net_x0: std_logic;
  signal delay4_q_net_x1: std_logic_vector(21 downto 0);
  signal delay5_q_net_x1: std_logic_vector(21 downto 0);
  signal delay_q_net_x24: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x3: std_logic_vector(17 downto 0);
  signal mem_c_data_net_x4: std_logic_vector(17 downto 0);
  signal mux1_y_net_x8: std_logic_vector(21 downto 0);
  signal mux1_y_net_x9: std_logic_vector(21 downto 0);
  signal slr_q_net_x10: std_logic_vector(21 downto 0);
  signal slr_q_net_x11: std_logic_vector(21 downto 0);

begin
  slr_q_net_x10 <= a_in;
  mux1_y_net_x8 <= b;
  slr_q_net_x11 <= c;
  ce_1_sg_x304 <= ce_1;
  clk_1_sg_x304 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x24 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x22;
  dw <= concat_y_net_x23;
  sync_out <= delay_q_net_x4;

  cmpy1_c4a650cdc4: entity work.cmpy1_entity_c4a650cdc4
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x304,
      clk_1 => clk_1_sg_x304,
      sync_in => delay3_q_net_x0,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21,
      sync_out => delay_q_net_x4
    );

  cmpy2_a03450ad39: entity work.cmpy2_entity_a03450ad39
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x304,
      clk_1 => clk_1_sg_x304,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x22
    );

  cmpy3_f59912bbdc: entity work.cmpy2_entity_a03450ad39
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x304,
      clk_1 => clk_1_sg_x304,
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
      ce => ce_1_sg_x304,
      clk => clk_1_sg_x304,
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
      ce => ce_1_sg_x304,
      clk => clk_1_sg_x304,
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
      ce => ce_1_sg_x304,
      clk => clk_1_sg_x304,
      d(0) => delay_q_net_x24,
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
      ce => ce_1_sg_x304,
      clk => clk_1_sg_x304,
      d => slr_q_net_x11,
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
      ce => ce_1_sg_x304,
      clk => clk_1_sg_x304,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_0b2791cb0c: entity work.twiddle_gen1_entity_0b2791cb0c
    port map (
      ce_1 => ce_1_sg_x304,
      clk_1 => clk_1_sg_x304,
      sync_in => delay_q_net_x24,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_584fce07b3: entity work.twiddle_gen2_entity_584fce07b3
    port map (
      ce_1 => ce_1_sg_x304,
      clk_1 => clk_1_sg_x304,
      sync_in => delay_q_net_x24,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_92ffe16428: entity work.twiddle_gen3_entity_92ffe16428
    port map (
      ce_1 => ce_1_sg_x304,
      clk_1 => clk_1_sg_x304,
      sync_in => delay_q_net_x24,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_4"

entity r4_dit_stage_4_entity_47f643cfd4 is
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
end r4_dit_stage_4_entity_47f643cfd4;

architecture structural of r4_dit_stage_4_entity_47f643cfd4 is
  signal ce_1_sg_x305: std_logic;
  signal clk_1_sg_x305: std_logic;
  signal concat_y_net_x23: std_logic_vector(21 downto 0);
  signal concat_y_net_x24: std_logic_vector(21 downto 0);
  signal concat_y_net_x25: std_logic_vector(21 downto 0);
  signal concat_y_net_x26: std_logic_vector(25 downto 0);
  signal concat_y_net_x27: std_logic_vector(25 downto 0);
  signal concat_y_net_x28: std_logic_vector(25 downto 0);
  signal concat_y_net_x29: std_logic_vector(25 downto 0);
  signal concat_y_net_x64: std_logic_vector(21 downto 0);
  signal concat_y_net_x65: std_logic_vector(21 downto 0);
  signal concat_y_net_x66: std_logic_vector(21 downto 0);
  signal concat_y_net_x67: std_logic_vector(21 downto 0);
  signal delay1_q_net_x4: std_logic_vector(21 downto 0);
  signal delay_q_net_x20: std_logic;
  signal delay_q_net_x21: std_logic;
  signal delay_q_net_x22: std_logic;
  signal delay_q_net_x24: std_logic;
  signal mux1_y_net_x8: std_logic_vector(21 downto 0);
  signal mux1_y_net_x9: std_logic_vector(21 downto 0);
  signal slr_q_net_x10: std_logic_vector(21 downto 0);
  signal slr_q_net_x11: std_logic_vector(21 downto 0);

begin
  concat_y_net_x64 <= a_in;
  concat_y_net_x65 <= b_in;
  concat_y_net_x66 <= c_in;
  ce_1_sg_x305 <= ce_1;
  clk_1_sg_x305 <= clk_1;
  concat_y_net_x67 <= d_in;
  delay_q_net_x21 <= sync_in;
  a_out <= concat_y_net_x26;
  b_out <= concat_y_net_x27;
  c_out <= concat_y_net_x28;
  d_out <= concat_y_net_x29;
  sync_out <= delay_q_net_x22;

  quadplex_commutator_9eff080c9f: entity work.quadplex_commutator_entity_9eff080c9f
    port map (
      a => concat_y_net_x64,
      b => concat_y_net_x65,
      c => concat_y_net_x66,
      ce_1 => ce_1_sg_x305,
      clk_1 => clk_1_sg_x305,
      d => concat_y_net_x67,
      sync_in => delay_q_net_x21,
      abcd0 => slr_q_net_x10,
      abcd1 => mux1_y_net_x8,
      abcd2 => slr_q_net_x11,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x24
    );

  r4_butterfly_952b014598: entity work.r4_butterfly_entity_952b014598
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x23,
      c_in => concat_y_net_x24,
      ce_1 => ce_1_sg_x305,
      clk_1 => clk_1_sg_x305,
      d_in => concat_y_net_x25,
      sync_in => delay_q_net_x20,
      a_out => concat_y_net_x26,
      b_out => concat_y_net_x27,
      c_out => concat_y_net_x28,
      d_out => concat_y_net_x29,
      sync_out => delay_q_net_x22
    );

  r4_twiddle_258d262d07: entity work.r4_twiddle_entity_258d262d07
    port map (
      a_in => slr_q_net_x10,
      b => mux1_y_net_x8,
      c => slr_q_net_x11,
      ce_1 => ce_1_sg_x305,
      clk_1 => clk_1_sg_x305,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_01/delay_b"

entity delay_b_entity_4f06581ffe is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(25 downto 0); 
    out_x0: out std_logic_vector(25 downto 0)
  );
end delay_b_entity_4f06581ffe;

architecture structural of delay_b_entity_4f06581ffe is
  signal ce_1_sg_x306: std_logic;
  signal clk_1_sg_x306: std_logic;
  signal slr_q_net_x1: std_logic_vector(25 downto 0);
  signal slr_q_net_x2: std_logic_vector(25 downto 0);

begin
  ce_1_sg_x306 <= ce_1;
  clk_1_sg_x306 <= clk_1;
  slr_q_net_x1 <= in_x0;
  out_x0 <= slr_q_net_x2;

  slr: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x306,
      clk => clk_1_sg_x306,
      d => slr_q_net_x1,
      en => '1',
      q => slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_01"

entity biplex_commutator_01_entity_9d89f64305 is
  port (
    aloahi: in std_logic_vector(25 downto 0); 
    blobhi: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    ahibhi: out std_logic_vector(25 downto 0); 
    aloblo: out std_logic_vector(25 downto 0)
  );
end biplex_commutator_01_entity_9d89f64305;

architecture structural of biplex_commutator_01_entity_9d89f64305 is
  signal ce_1_sg_x308: std_logic;
  signal clk_1_sg_x308: std_logic;
  signal counter_op_net: std_logic;
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
  ce_1_sg_x308 <= ce_1;
  clk_1_sg_x308 <= clk_1;
  delay_q_net_x0 <= sync_in;
  ahibhi <= mux1_y_net_x0;
  aloblo <= slr_q_net_x5;

  counter: entity work.counter_9b03e3d644
    port map (
      ce => ce_1_sg_x308,
      clk => clk_1_sg_x308,
      clr => '0',
      rst(0) => delay_q_net_x0,
      op(0) => counter_op_net
    );

  delay_b_4f06581ffe: entity work.delay_b_entity_4f06581ffe
    port map (
      ce_1 => ce_1_sg_x308,
      clk_1 => clk_1_sg_x308,
      in_x0 => slr_q_net_x4,
      out_x0 => slr_q_net_x2
    );

  delay_lo_518007da04: entity work.delay_b_entity_4f06581ffe
    port map (
      ce_1 => ce_1_sg_x308,
      clk_1 => clk_1_sg_x308,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x308,
      clk => clk_1_sg_x308,
      clr => '0',
      d0 => slr_q_net_x3,
      d1 => slr_q_net_x2,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x308,
      clk => clk_1_sg_x308,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_23"

entity biplex_commutator_23_entity_dd2d5f9f2d is
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
end biplex_commutator_23_entity_dd2d5f9f2d;

architecture structural of biplex_commutator_23_entity_dd2d5f9f2d is
  signal ce_1_sg_x311: std_logic;
  signal clk_1_sg_x311: std_logic;
  signal counter_op_net: std_logic;
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
  ce_1_sg_x311 <= ce_1;
  clk_1_sg_x311 <= clk_1;
  delay_q_net_x1 <= sync_in;
  ahibhi <= mux1_y_net_x4;
  aloblo <= slr_q_net_x2;
  sync_out <= delay_q_net_x2;

  counter: entity work.counter_9b03e3d644
    port map (
      ce => ce_1_sg_x311,
      clk => clk_1_sg_x311,
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
      ce => ce_1_sg_x311,
      clk => clk_1_sg_x311,
      d(0) => delay_q_net_x1,
      en => '1',
      q(0) => delay_q_net_x2
    );

  delay_b_79ad0bb913: entity work.delay_b_entity_4f06581ffe
    port map (
      ce_1 => ce_1_sg_x311,
      clk_1 => clk_1_sg_x311,
      in_x0 => mux1_y_net_x3,
      out_x0 => slr_q_net_x0
    );

  delay_lo_687f66a76d: entity work.delay_b_entity_4f06581ffe
    port map (
      ce_1 => ce_1_sg_x311,
      clk_1 => clk_1_sg_x311,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x2
    );

  mux: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x311,
      clk => clk_1_sg_x311,
      clr => '0',
      d0 => mux1_y_net_x2,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x311,
      clk => clk_1_sg_x311,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_ac/delay_b"

entity delay_b_entity_166f3522d2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(25 downto 0); 
    out_x0: out std_logic_vector(25 downto 0)
  );
end delay_b_entity_166f3522d2;

architecture structural of delay_b_entity_166f3522d2 is
  signal ce_1_sg_x312: std_logic;
  signal clk_1_sg_x312: std_logic;
  signal concat_y_net_x29: std_logic_vector(25 downto 0);
  signal slr_q_net_x0: std_logic_vector(25 downto 0);

begin
  ce_1_sg_x312 <= ce_1;
  clk_1_sg_x312 <= clk_1;
  concat_y_net_x29 <= in_x0;
  out_x0 <= slr_q_net_x0;

  slr: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x312,
      clk => clk_1_sg_x312,
      d => concat_y_net_x29,
      en => '1',
      q => slr_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator/biplex_commutator_ac"

entity biplex_commutator_ac_entity_81df6b4fb1 is
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
end biplex_commutator_ac_entity_81df6b4fb1;

architecture structural of biplex_commutator_ac_entity_81df6b4fb1 is
  signal ce_1_sg_x314: std_logic;
  signal clk_1_sg_x314: std_logic;
  signal concat_y_net_x30: std_logic_vector(25 downto 0);
  signal concat_y_net_x31: std_logic_vector(25 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x23: std_logic;
  signal mux1_y_net_x3: std_logic_vector(25 downto 0);
  signal mux_y_net_x0: std_logic_vector(25 downto 0);
  signal slr_q_net_x0: std_logic_vector(25 downto 0);
  signal slr_q_net_x5: std_logic_vector(25 downto 0);
  signal top_bit_y_net: std_logic;

begin
  concat_y_net_x30 <= aloahi;
  concat_y_net_x31 <= blobhi;
  ce_1_sg_x314 <= ce_1;
  clk_1_sg_x314 <= clk_1;
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
      ce => ce_1_sg_x314,
      clk => clk_1_sg_x314,
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
      ce => ce_1_sg_x314,
      clk => clk_1_sg_x314,
      d(0) => delay_q_net_x23,
      en => '1',
      q(0) => delay_q_net_x1
    );

  delay_b_166f3522d2: entity work.delay_b_entity_166f3522d2
    port map (
      ce_1 => ce_1_sg_x314,
      clk_1 => clk_1_sg_x314,
      in_x0 => concat_y_net_x31,
      out_x0 => slr_q_net_x0
    );

  delay_lo_485c5c058c: entity work.delay_b_entity_166f3522d2
    port map (
      ce_1 => ce_1_sg_x314,
      clk_1 => clk_1_sg_x314,
      in_x0 => mux_y_net_x0,
      out_x0 => slr_q_net_x5
    );

  mux: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x314,
      clk => clk_1_sg_x314,
      clr => '0',
      d0 => concat_y_net_x30,
      d1 => slr_q_net_x0,
      sel(0) => top_bit_y_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_0eccfc7565
    port map (
      ce => ce_1_sg_x314,
      clk => clk_1_sg_x314,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/quadplex_commutator"

entity quadplex_commutator_entity_82f07f5658 is
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
end quadplex_commutator_entity_82f07f5658;

architecture structural of quadplex_commutator_entity_82f07f5658 is
  signal ce_1_sg_x318: std_logic;
  signal clk_1_sg_x318: std_logic;
  signal concat_y_net_x34: std_logic_vector(25 downto 0);
  signal concat_y_net_x35: std_logic_vector(25 downto 0);
  signal concat_y_net_x36: std_logic_vector(25 downto 0);
  signal concat_y_net_x37: std_logic_vector(25 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_q_net_x25: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mux1_y_net_x3: std_logic_vector(25 downto 0);
  signal mux1_y_net_x5: std_logic_vector(25 downto 0);
  signal mux1_y_net_x6: std_logic_vector(25 downto 0);
  signal mux1_y_net_x7: std_logic_vector(25 downto 0);
  signal slr_q_net_x6: std_logic_vector(25 downto 0);
  signal slr_q_net_x7: std_logic_vector(25 downto 0);
  signal slr_q_net_x8: std_logic_vector(25 downto 0);
  signal slr_q_net_x9: std_logic_vector(25 downto 0);

begin
  concat_y_net_x34 <= a;
  concat_y_net_x35 <= b;
  concat_y_net_x36 <= c;
  ce_1_sg_x318 <= ce_1;
  clk_1_sg_x318 <= clk_1;
  concat_y_net_x37 <= d;
  delay_q_net_x25 <= sync_in;
  abcd0 <= slr_q_net_x8;
  abcd1 <= mux1_y_net_x6;
  abcd2 <= slr_q_net_x9;
  abcd3 <= mux1_y_net_x7;
  sync_out <= delay_q_net_x4;

  biplex_commutator_01_9d89f64305: entity work.biplex_commutator_01_entity_9d89f64305
    port map (
      aloahi => slr_q_net_x6,
      blobhi => slr_q_net_x7,
      ce_1 => ce_1_sg_x318,
      clk_1 => clk_1_sg_x318,
      sync_in => delay_q_net_x1,
      ahibhi => mux1_y_net_x6,
      aloblo => slr_q_net_x8
    );

  biplex_commutator_23_dd2d5f9f2d: entity work.biplex_commutator_23_entity_dd2d5f9f2d
    port map (
      aloahi => mux1_y_net_x3,
      blobhi => mux1_y_net_x5,
      ce_1 => ce_1_sg_x318,
      clk_1 => clk_1_sg_x318,
      sync_in => delay_q_net_x3,
      ahibhi => mux1_y_net_x7,
      aloblo => slr_q_net_x9,
      sync_out => delay_q_net_x4
    );

  biplex_commutator_ac_81df6b4fb1: entity work.biplex_commutator_ac_entity_81df6b4fb1
    port map (
      aloahi => concat_y_net_x34,
      blobhi => concat_y_net_x36,
      ce_1 => ce_1_sg_x318,
      clk_1 => clk_1_sg_x318,
      sync_in => delay_q_net_x25,
      ahibhi => mux1_y_net_x3,
      aloblo => slr_q_net_x6,
      sync_out => delay_q_net_x1
    );

  biplex_commutator_bd_28b8a6d874: entity work.biplex_commutator_ac_entity_81df6b4fb1
    port map (
      aloahi => concat_y_net_x35,
      blobhi => concat_y_net_x37,
      ce_1 => ce_1_sg_x318,
      clk_1 => clk_1_sg_x318,
      sync_in => delay_q_net_x25,
      ahibhi => mux1_y_net_x5,
      aloblo => slr_q_net_x7,
      sync_out => delay_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly0/c_to_ri"

entity c_to_ri_entity_e60c6e23f7 is
  port (
    c: in std_logic_vector(25 downto 0); 
    im: out std_logic_vector(12 downto 0); 
    re: out std_logic_vector(12 downto 0)
  );
end c_to_ri_entity_e60c6e23f7;

architecture structural of c_to_ri_entity_e60c6e23f7 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly0/ri_to_c"

entity ri_to_c_entity_25be8ec1e0 is
  port (
    im: in std_logic_vector(13 downto 0); 
    re: in std_logic_vector(13 downto 0); 
    c: out std_logic_vector(27 downto 0)
  );
end ri_to_c_entity_25be8ec1e0;

architecture structural of ri_to_c_entity_25be8ec1e0 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly0"

entity butterfly0_entity_d9dedc65d0 is
  port (
    a: in std_logic_vector(25 downto 0); 
    b: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(27 downto 0); 
    a_b_x0: out std_logic_vector(27 downto 0)
  );
end butterfly0_entity_d9dedc65d0;

architecture structural of butterfly0_entity_d9dedc65d0 is
  signal add_im_s_net: std_logic_vector(13 downto 0);
  signal add_re_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x319: std_logic;
  signal clk_1_sg_x319: std_logic;
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
  ce_1_sg_x319 <= ce_1;
  clk_1_sg_x319 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  add_im: entity work.addsub_4a1b074932
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x319,
      clk => clk_1_sg_x319,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_4a1b074932
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x319,
      clk => clk_1_sg_x319,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_5b817e7570: entity work.c_to_ri_entity_e60c6e23f7
    port map (
      c => concat_y_net_x3,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_e60c6e23f7: entity work.c_to_ri_entity_e60c6e23f7
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

  ri_to_c1_2dedfd150b: entity work.ri_to_c_entity_25be8ec1e0
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_25be8ec1e0: entity work.ri_to_c_entity_25be8ec1e0
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
      ce => ce_1_sg_x319,
      clk => clk_1_sg_x319,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f3687289ea
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly2/c_to_ri"

entity c_to_ri_entity_89efdf8d69 is
  port (
    c: in std_logic_vector(27 downto 0); 
    im: out std_logic_vector(13 downto 0); 
    re: out std_logic_vector(13 downto 0)
  );
end c_to_ri_entity_89efdf8d69;

architecture structural of c_to_ri_entity_89efdf8d69 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly2/ri_to_c"

entity ri_to_c_entity_c1c70e83c4 is
  port (
    im: in std_logic_vector(14 downto 0); 
    re: in std_logic_vector(14 downto 0); 
    c: out std_logic_vector(29 downto 0)
  );
end ri_to_c_entity_c1c70e83c4;

architecture structural of ri_to_c_entity_c1c70e83c4 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly2"

entity butterfly2_entity_d9ed76fd30 is
  port (
    a: in std_logic_vector(27 downto 0); 
    b: in std_logic_vector(27 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(29 downto 0); 
    a_b_x0: out std_logic_vector(29 downto 0)
  );
end butterfly2_entity_d9ed76fd30;

architecture structural of butterfly2_entity_d9ed76fd30 is
  signal add_im_s_net: std_logic_vector(14 downto 0);
  signal add_re_s_net: std_logic_vector(14 downto 0);
  signal ce_1_sg_x321: std_logic;
  signal clk_1_sg_x321: std_logic;
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
  ce_1_sg_x321 <= ce_1;
  clk_1_sg_x321 <= clk_1;
  a_b <= concat_y_net_x11;
  a_b_x0 <= concat_y_net_x12;

  add_im: entity work.addsub_79dc8835bc
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_79dc8835bc
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_1451bef815: entity work.c_to_ri_entity_89efdf8d69
    port map (
      c => concat_y_net_x10,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_89efdf8d69: entity work.c_to_ri_entity_89efdf8d69
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

  ri_to_c1_43e0577cd1: entity work.ri_to_c_entity_c1c70e83c4
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x12
    );

  ri_to_c_c1c70e83c4: entity work.ri_to_c_entity_c1c70e83c4
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
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f4e99698eb
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x321,
      clk => clk_1_sg_x321,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_butterfly/butterfly3j"

entity butterfly3j_entity_a84819e721 is
  port (
    a: in std_logic_vector(27 downto 0); 
    b: in std_logic_vector(27 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(29 downto 0); 
    a_b_x0: out std_logic_vector(29 downto 0)
  );
end butterfly3j_entity_a84819e721;

architecture structural of butterfly3j_entity_a84819e721 is
  signal add_im_s_net: std_logic_vector(14 downto 0);
  signal add_re_s_net: std_logic_vector(14 downto 0);
  signal ce_1_sg_x322: std_logic;
  signal clk_1_sg_x322: std_logic;
  signal concat_y_net_x10: std_logic_vector(29 downto 0);
  signal concat_y_net_x11: std_logic_vector(29 downto 0);
  signal concat_y_net_x7: std_logic_vector(27 downto 0);
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
  concat_y_net_x7 <= a;
  concat_y_net_x9 <= b;
  ce_1_sg_x322 <= ce_1;
  clk_1_sg_x322 <= clk_1;
  a_b <= concat_y_net_x10;
  a_b_x0 <= concat_y_net_x11;

  add_im: entity work.addsub_f4e99698eb
    port map (
      a => force_im_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      s => add_im_s_net
    );

  add_re: entity work.addsub_79dc8835bc
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      s => add_re_s_net
    );

  c_to_ri1_250e3b9a53: entity work.c_to_ri_entity_89efdf8d69
    port map (
      c => concat_y_net_x9,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_0628e1608b: entity work.c_to_ri_entity_89efdf8d69
    port map (
      c => concat_y_net_x7,
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

  ri_to_c1_19ccd1098d: entity work.ri_to_c_entity_c1c70e83c4
    port map (
      im => requant3_dout_net_x0,
      re => requant2_dout_net_x0,
      c => concat_y_net_x11
    );

  ri_to_c_1dea3f253f: entity work.ri_to_c_entity_c1c70e83c4
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
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      s => sub_im_s_net
    );

  sub_re: entity work.addsub_f4e99698eb
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x322,
      clk => clk_1_sg_x322,
      clr => '0',
      s => sub_re_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_butterfly"

entity r4_butterfly_entity_e2f6f41a01 is
  port (
    a_in: in std_logic_vector(25 downto 0); 
    b_in: in std_logic_vector(25 downto 0); 
    c_in: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(25 downto 0); 
    a_out: out std_logic_vector(29 downto 0); 
    b_out: out std_logic_vector(29 downto 0); 
    c_out: out std_logic_vector(29 downto 0); 
    d_out: out std_logic_vector(29 downto 0)
  );
end r4_butterfly_entity_e2f6f41a01;

architecture structural of r4_butterfly_entity_e2f6f41a01 is
  signal ce_1_sg_x323: std_logic;
  signal clk_1_sg_x323: std_logic;
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

begin
  delay1_q_net_x2 <= a_in;
  concat_y_net_x16 <= b_in;
  concat_y_net_x17 <= c_in;
  ce_1_sg_x323 <= ce_1;
  clk_1_sg_x323 <= clk_1;
  concat_y_net_x18 <= d_in;
  a_out <= concat_y_net_x19;
  b_out <= concat_y_net_x20;
  c_out <= concat_y_net_x21;
  d_out <= concat_y_net_x22;

  butterfly0_d9dedc65d0: entity work.butterfly0_entity_d9dedc65d0
    port map (
      a => delay1_q_net_x2,
      b => concat_y_net_x17,
      ce_1 => ce_1_sg_x323,
      clk_1 => clk_1_sg_x323,
      a_b => concat_y_net_x9,
      a_b_x0 => concat_y_net_x7
    );

  butterfly1_d8f10a857b: entity work.butterfly0_entity_d9dedc65d0
    port map (
      a => concat_y_net_x16,
      b => concat_y_net_x18,
      ce_1 => ce_1_sg_x323,
      clk_1 => clk_1_sg_x323,
      a_b => concat_y_net_x10,
      a_b_x0 => concat_y_net_x11
    );

  butterfly2_d9ed76fd30: entity work.butterfly2_entity_d9ed76fd30
    port map (
      a => concat_y_net_x9,
      b => concat_y_net_x10,
      ce_1 => ce_1_sg_x323,
      clk_1 => clk_1_sg_x323,
      a_b => concat_y_net_x19,
      a_b_x0 => concat_y_net_x20
    );

  butterfly3j_a84819e721: entity work.butterfly3j_entity_a84819e721
    port map (
      a => concat_y_net_x7,
      b => concat_y_net_x11,
      ce_1 => ce_1_sg_x323,
      clk_1 => clk_1_sg_x323,
      a_b => concat_y_net_x21,
      a_b_x0 => concat_y_net_x22
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy1/c_to_ri"

entity c_to_ri_entity_791c94a238 is
  port (
    c: in std_logic_vector(25 downto 0); 
    im: out std_logic_vector(12 downto 0); 
    re: out std_logic_vector(12 downto 0)
  );
end c_to_ri_entity_791c94a238;

architecture structural of c_to_ri_entity_791c94a238 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy1/ri_to_c"

entity ri_to_c_entity_730f613117 is
  port (
    im: in std_logic_vector(12 downto 0); 
    re: in std_logic_vector(12 downto 0); 
    c: out std_logic_vector(25 downto 0)
  );
end ri_to_c_entity_730f613117;

architecture structural of ri_to_c_entity_730f613117 is
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy1"

entity cmpy1_entity_fbda3b4720 is
  port (
    a_in: in std_logic_vector(25 downto 0); 
    b: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    a_out: out std_logic_vector(25 downto 0); 
    bw: out std_logic_vector(25 downto 0)
  );
end cmpy1_entity_fbda3b4720;

architecture structural of cmpy1_entity_fbda3b4720 is
  signal br_add_bi_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x324: std_logic;
  signal clk_1_sg_x324: std_logic;
  signal concat_y_net_x18: std_logic_vector(25 downto 0);
  signal convert_im_dout_net_x0: std_logic_vector(12 downto 0);
  signal convert_re_dout_net_x0: std_logic_vector(12 downto 0);
  signal delay1_q_net_x1: std_logic_vector(25 downto 0);
  signal delay1_q_net_x3: std_logic_vector(25 downto 0);
  signal delay2_q_net_x0: std_logic_vector(25 downto 0);
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
  ce_1_sg_x324 <= ce_1;
  clk_1_sg_x324 <= clk_1;
  mem_c_data_net_x1 <= w;
  a_out <= delay1_q_net_x3;
  bw <= concat_y_net_x18;

  br_add_bi: entity work.addsub_c0d1d84d6b
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_e4c3bc5d82: entity work.c_to_ri1_entity_5470105349
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_791c94a238: entity work.c_to_ri_entity_791c94a238
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
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
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
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
      clr => '0',
      din => rr_sub_ii_s_net,
      dout => convert_re_dout_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
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
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
      clr => '0',
      core_ce => ce_1_sg_x324,
      core_clk => clk_1_sg_x324,
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
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
      clr => '0',
      core_ce => ce_1_sg_x324,
      core_clk => clk_1_sg_x324,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_730f613117: entity work.ri_to_c_entity_730f613117
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x18
    );

  rr_add_ii: entity work.addsub_a9cdc93774
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_370c0f2c47
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_5777994232
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
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
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
      clr => '0',
      core_ce => ce_1_sg_x324,
      core_clk => clk_1_sg_x324,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x324,
      clk => clk_1_sg_x324,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/cmpy2"

entity cmpy2_entity_e126ee77de is
  port (
    b: in std_logic_vector(25 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    w: in std_logic_vector(17 downto 0); 
    bw: out std_logic_vector(25 downto 0)
  );
end cmpy2_entity_e126ee77de;

architecture structural of cmpy2_entity_e126ee77de is
  signal br_add_bi_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x325: std_logic;
  signal clk_1_sg_x325: std_logic;
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
  ce_1_sg_x325 <= ce_1;
  clk_1_sg_x325 <= clk_1;
  mem_c_data_net_x1 <= w;
  bw <= concat_y_net_x19;

  br_add_bi: entity work.addsub_c0d1d84d6b
    port map (
      a => force_re_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
      clr => '0',
      s => br_add_bi_s_net
    );

  c_to_ri1_b5ba819181: entity work.c_to_ri1_entity_5470105349
    port map (
      c => mem_c_data_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_6749e5d179: entity work.c_to_ri_entity_791c94a238
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
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
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
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
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
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
      clr => '0',
      core_ce => ce_1_sg_x325,
      core_clk => clk_1_sg_x325,
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
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
      clr => '0',
      core_ce => ce_1_sg_x325,
      core_clk => clk_1_sg_x325,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => rere_p_net
    );

  ri_to_c_4943180a4d: entity work.ri_to_c_entity_730f613117
    port map (
      im => convert_im_dout_net_x0,
      re => convert_re_dout_net_x0,
      c => concat_y_net_x19
    );

  rr_add_ii: entity work.addsub_a9cdc93774
    port map (
      a => imim_p_net,
      b => rere_p_net,
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
      clr => '0',
      s => rr_add_ii_s_net
    );

  rr_sub_ii: entity work.addsub_370c0f2c47
    port map (
      a => rere_p_net,
      b => imim_p_net,
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
      clr => '0',
      s => rr_sub_ii_s_net
    );

  ss_sub_rrii: entity work.addsub_5777994232
    port map (
      a => sumsum_p_net,
      b => rr_add_ii_s_net,
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
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
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
      clr => '0',
      core_ce => ce_1_sg_x325,
      core_clk => clk_1_sg_x325,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => sumsum_p_net
    );

  wr_add_wi: entity work.addsub_bd2bd198b1
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x325,
      clk => clk_1_sg_x325,
      clr => '0',
      s => wr_add_wi_s_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/twiddle_gen1"

entity twiddle_gen1_entity_3c24058275 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen1_entity_3c24058275;

architecture structural of twiddle_gen1_entity_3c24058275 is
  signal addr_sel_y_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x327: std_logic;
  signal clk_1_sg_x327: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x5: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x327 <= ce_1;
  clk_1_sg_x327 <= clk_1;
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
      ce => ce_1_sg_x327,
      clk => clk_1_sg_x327,
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

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/twiddle_gen2"

entity twiddle_gen2_entity_875d51f938 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen2_entity_875d51f938;

architecture structural of twiddle_gen2_entity_875d51f938 is
  signal addr_sel_y_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x328: std_logic;
  signal clk_1_sg_x328: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x6: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x328 <= ce_1;
  clk_1_sg_x328 <= clk_1;
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
      ce => ce_1_sg_x328,
      clk => clk_1_sg_x328,
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
      ce => ce_1_sg_x328,
      clk => clk_1_sg_x328,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_twiddle/twiddle_gen3"

entity twiddle_gen3_entity_9616316372 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync_in: in std_logic; 
    w: out std_logic_vector(17 downto 0)
  );
end twiddle_gen3_entity_9616316372;

architecture structural of twiddle_gen3_entity_9616316372 is
  signal addr_sel_y_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x329: std_logic;
  signal clk_1_sg_x329: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x7: std_logic;
  signal mem_c_data_net_x2: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x329 <= ce_1;
  clk_1_sg_x329 <= clk_1;
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
      ce => ce_1_sg_x329,
      clk => clk_1_sg_x329,
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
      ce => ce_1_sg_x329,
      clk => clk_1_sg_x329,
      en => "1",
      rst => "0",
      data => mem_c_data_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5/r4_twiddle"

entity r4_twiddle_entity_32f585031f is
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
    dw: out std_logic_vector(25 downto 0)
  );
end r4_twiddle_entity_32f585031f;

architecture structural of r4_twiddle_entity_32f585031f is
  signal ce_1_sg_x330: std_logic;
  signal clk_1_sg_x330: std_logic;
  signal concat_y_net_x21: std_logic_vector(25 downto 0);
  signal concat_y_net_x22: std_logic_vector(25 downto 0);
  signal concat_y_net_x23: std_logic_vector(25 downto 0);
  signal delay1_q_net_x1: std_logic_vector(25 downto 0);
  signal delay1_q_net_x4: std_logic_vector(25 downto 0);
  signal delay2_q_net_x0: std_logic_vector(25 downto 0);
  signal delay4_q_net_x1: std_logic_vector(25 downto 0);
  signal delay5_q_net_x1: std_logic_vector(25 downto 0);
  signal delay_q_net_x8: std_logic;
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
  ce_1_sg_x330 <= ce_1;
  clk_1_sg_x330 <= clk_1;
  mux1_y_net_x9 <= d;
  delay_q_net_x8 <= sync_in;
  a_out <= delay1_q_net_x4;
  bw <= concat_y_net_x21;
  cw <= concat_y_net_x22;
  dw <= concat_y_net_x23;

  cmpy1_fbda3b4720: entity work.cmpy1_entity_fbda3b4720
    port map (
      a_in => delay2_q_net_x0,
      b => delay1_q_net_x1,
      ce_1 => ce_1_sg_x330,
      clk_1 => clk_1_sg_x330,
      w => mem_c_data_net_x2,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x21
    );

  cmpy2_e126ee77de: entity work.cmpy2_entity_e126ee77de
    port map (
      b => delay4_q_net_x1,
      ce_1 => ce_1_sg_x330,
      clk_1 => clk_1_sg_x330,
      w => mem_c_data_net_x3,
      bw => concat_y_net_x22
    );

  cmpy3_a67d3b67f2: entity work.cmpy2_entity_e126ee77de
    port map (
      b => delay5_q_net_x1,
      ce_1 => ce_1_sg_x330,
      clk_1 => clk_1_sg_x330,
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
      ce => ce_1_sg_x330,
      clk => clk_1_sg_x330,
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
      ce => ce_1_sg_x330,
      clk => clk_1_sg_x330,
      d => slr_q_net_x10,
      en => '1',
      q => delay2_q_net_x0
    );

  delay4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x330,
      clk => clk_1_sg_x330,
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
      ce => ce_1_sg_x330,
      clk => clk_1_sg_x330,
      d => mux1_y_net_x9,
      en => '1',
      q => delay5_q_net_x1
    );

  twiddle_gen1_3c24058275: entity work.twiddle_gen1_entity_3c24058275
    port map (
      ce_1 => ce_1_sg_x330,
      clk_1 => clk_1_sg_x330,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x2
    );

  twiddle_gen2_875d51f938: entity work.twiddle_gen2_entity_875d51f938
    port map (
      ce_1 => ce_1_sg_x330,
      clk_1 => clk_1_sg_x330,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x3
    );

  twiddle_gen3_9616316372: entity work.twiddle_gen3_entity_9616316372
    port map (
      ce_1 => ce_1_sg_x330,
      clk_1 => clk_1_sg_x330,
      sync_in => delay_q_net_x8,
      w => mem_c_data_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft/r4_dit_stage_5"

entity r4_dit_stage_5_entity_996be35e6c is
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
    d_out: out std_logic_vector(29 downto 0)
  );
end r4_dit_stage_5_entity_996be35e6c;

architecture structural of r4_dit_stage_5_entity_996be35e6c is
  signal ce_1_sg_x331: std_logic;
  signal clk_1_sg_x331: std_logic;
  signal concat_y_net_x23: std_logic_vector(25 downto 0);
  signal concat_y_net_x38: std_logic_vector(25 downto 0);
  signal concat_y_net_x39: std_logic_vector(25 downto 0);
  signal concat_y_net_x40: std_logic_vector(25 downto 0);
  signal concat_y_net_x41: std_logic_vector(25 downto 0);
  signal concat_y_net_x42: std_logic_vector(25 downto 0);
  signal concat_y_net_x43: std_logic_vector(25 downto 0);
  signal concat_y_net_x44: std_logic_vector(29 downto 0);
  signal concat_y_net_x45: std_logic_vector(29 downto 0);
  signal concat_y_net_x46: std_logic_vector(29 downto 0);
  signal concat_y_net_x47: std_logic_vector(29 downto 0);
  signal delay1_q_net_x4: std_logic_vector(25 downto 0);
  signal delay_q_net_x26: std_logic;
  signal delay_q_net_x8: std_logic;
  signal mux1_y_net_x8: std_logic_vector(25 downto 0);
  signal mux1_y_net_x9: std_logic_vector(25 downto 0);
  signal slr_q_net_x10: std_logic_vector(25 downto 0);
  signal slr_q_net_x11: std_logic_vector(25 downto 0);

begin
  concat_y_net_x40 <= a_in;
  concat_y_net_x41 <= b_in;
  concat_y_net_x42 <= c_in;
  ce_1_sg_x331 <= ce_1;
  clk_1_sg_x331 <= clk_1;
  concat_y_net_x43 <= d_in;
  delay_q_net_x26 <= sync_in;
  a_out <= concat_y_net_x44;
  b_out <= concat_y_net_x45;
  c_out <= concat_y_net_x46;
  d_out <= concat_y_net_x47;

  quadplex_commutator_82f07f5658: entity work.quadplex_commutator_entity_82f07f5658
    port map (
      a => concat_y_net_x40,
      b => concat_y_net_x41,
      c => concat_y_net_x42,
      ce_1 => ce_1_sg_x331,
      clk_1 => clk_1_sg_x331,
      d => concat_y_net_x43,
      sync_in => delay_q_net_x26,
      abcd0 => slr_q_net_x10,
      abcd1 => mux1_y_net_x8,
      abcd2 => slr_q_net_x11,
      abcd3 => mux1_y_net_x9,
      sync_out => delay_q_net_x8
    );

  r4_butterfly_e2f6f41a01: entity work.r4_butterfly_entity_e2f6f41a01
    port map (
      a_in => delay1_q_net_x4,
      b_in => concat_y_net_x38,
      c_in => concat_y_net_x39,
      ce_1 => ce_1_sg_x331,
      clk_1 => clk_1_sg_x331,
      d_in => concat_y_net_x23,
      a_out => concat_y_net_x44,
      b_out => concat_y_net_x45,
      c_out => concat_y_net_x46,
      d_out => concat_y_net_x47
    );

  r4_twiddle_32f585031f: entity work.r4_twiddle_entity_32f585031f
    port map (
      a_in => slr_q_net_x10,
      b => mux1_y_net_x8,
      c => slr_q_net_x11,
      ce_1 => ce_1_sg_x331,
      clk_1 => clk_1_sg_x331,
      d => mux1_y_net_x9,
      sync_in => delay_q_net_x8,
      a_out => delay1_q_net_x4,
      bw => concat_y_net_x38,
      cw => concat_y_net_x39,
      dw => concat_y_net_x23
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_dit_fft"

entity r4_dit_fft_entity_f719008c45 is
  port (
    a_in: in std_logic_vector(9 downto 0); 
    b_in: in std_logic_vector(9 downto 0); 
    c_in: in std_logic_vector(9 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    d_in: in std_logic_vector(9 downto 0); 
    sync_in: in std_logic; 
    a_out: out std_logic_vector(29 downto 0); 
    b_out: out std_logic_vector(29 downto 0); 
    c_out: out std_logic_vector(29 downto 0); 
    d_out: out std_logic_vector(29 downto 0)
  );
end r4_dit_fft_entity_f719008c45;

architecture structural of r4_dit_fft_entity_f719008c45 is
  signal ce_1_sg_x332: std_logic;
  signal clk_1_sg_x332: std_logic;
  signal concat_y_net_x32: std_logic_vector(13 downto 0);
  signal concat_y_net_x33: std_logic_vector(13 downto 0);
  signal concat_y_net_x34: std_logic_vector(13 downto 0);
  signal concat_y_net_x35: std_logic_vector(13 downto 0);
  signal concat_y_net_x40: std_logic_vector(25 downto 0);
  signal concat_y_net_x41: std_logic_vector(25 downto 0);
  signal concat_y_net_x42: std_logic_vector(25 downto 0);
  signal concat_y_net_x43: std_logic_vector(25 downto 0);
  signal concat_y_net_x48: std_logic_vector(17 downto 0);
  signal concat_y_net_x49: std_logic_vector(17 downto 0);
  signal concat_y_net_x50: std_logic_vector(17 downto 0);
  signal concat_y_net_x51: std_logic_vector(17 downto 0);
  signal concat_y_net_x52: std_logic_vector(29 downto 0);
  signal concat_y_net_x53: std_logic_vector(29 downto 0);
  signal concat_y_net_x54: std_logic_vector(29 downto 0);
  signal concat_y_net_x55: std_logic_vector(29 downto 0);
  signal concat_y_net_x64: std_logic_vector(21 downto 0);
  signal concat_y_net_x65: std_logic_vector(21 downto 0);
  signal concat_y_net_x66: std_logic_vector(21 downto 0);
  signal concat_y_net_x67: std_logic_vector(21 downto 0);
  signal delay_q_net_x13: std_logic;
  signal delay_q_net_x16: std_logic;
  signal delay_q_net_x21: std_logic;
  signal delay_q_net_x26: std_logic;
  signal delay_q_net_x27: std_logic;
  signal shift1_op_net_x3: std_logic_vector(9 downto 0);
  signal shift4_op_net_x4: std_logic_vector(9 downto 0);
  signal shift5_op_net_x4: std_logic_vector(9 downto 0);
  signal shift_op_net_x3: std_logic_vector(9 downto 0);

begin
  shift_op_net_x3 <= a_in;
  shift1_op_net_x3 <= b_in;
  shift4_op_net_x4 <= c_in;
  ce_1_sg_x332 <= ce_1;
  clk_1_sg_x332 <= clk_1;
  shift5_op_net_x4 <= d_in;
  delay_q_net_x27 <= sync_in;
  a_out <= concat_y_net_x52;
  b_out <= concat_y_net_x54;
  c_out <= concat_y_net_x53;
  d_out <= concat_y_net_x55;

  r4_dit_stage_1_280c7c258f: entity work.r4_dit_stage_1_entity_280c7c258f
    port map (
      a_in => shift_op_net_x3,
      b_in => shift1_op_net_x3,
      c_in => shift4_op_net_x4,
      ce_1 => ce_1_sg_x332,
      clk_1 => clk_1_sg_x332,
      d_in => shift5_op_net_x4,
      sync_in => delay_q_net_x27,
      a_out => concat_y_net_x32,
      b_out => concat_y_net_x33,
      c_out => concat_y_net_x34,
      d_out => concat_y_net_x35,
      sync_out => delay_q_net_x16
    );

  r4_dit_stage_2_324a1afc8b: entity work.r4_dit_stage_2_entity_324a1afc8b
    port map (
      a_in => concat_y_net_x32,
      b_in => concat_y_net_x33,
      c_in => concat_y_net_x34,
      ce_1 => ce_1_sg_x332,
      clk_1 => clk_1_sg_x332,
      d_in => concat_y_net_x35,
      sync_in => delay_q_net_x16,
      a_out => concat_y_net_x48,
      b_out => concat_y_net_x49,
      c_out => concat_y_net_x50,
      d_out => concat_y_net_x51,
      sync_out => delay_q_net_x13
    );

  r4_dit_stage_3_6d40561b5a: entity work.r4_dit_stage_3_entity_6d40561b5a
    port map (
      a_in => concat_y_net_x48,
      b_in => concat_y_net_x49,
      c_in => concat_y_net_x50,
      ce_1 => ce_1_sg_x332,
      clk_1 => clk_1_sg_x332,
      d_in => concat_y_net_x51,
      sync_in => delay_q_net_x13,
      a_out => concat_y_net_x64,
      b_out => concat_y_net_x65,
      c_out => concat_y_net_x66,
      d_out => concat_y_net_x67,
      sync_out => delay_q_net_x21
    );

  r4_dit_stage_4_47f643cfd4: entity work.r4_dit_stage_4_entity_47f643cfd4
    port map (
      a_in => concat_y_net_x64,
      b_in => concat_y_net_x65,
      c_in => concat_y_net_x66,
      ce_1 => ce_1_sg_x332,
      clk_1 => clk_1_sg_x332,
      d_in => concat_y_net_x67,
      sync_in => delay_q_net_x21,
      a_out => concat_y_net_x40,
      b_out => concat_y_net_x41,
      c_out => concat_y_net_x42,
      d_out => concat_y_net_x43,
      sync_out => delay_q_net_x26
    );

  r4_dit_stage_5_996be35e6c: entity work.r4_dit_stage_5_entity_996be35e6c
    port map (
      a_in => concat_y_net_x40,
      b_in => concat_y_net_x41,
      c_in => concat_y_net_x42,
      ce_1 => ce_1_sg_x332,
      clk_1 => clk_1_sg_x332,
      d_in => concat_y_net_x43,
      sync_in => delay_q_net_x26,
      a_out => concat_y_net_x52,
      b_out => concat_y_net_x53,
      c_out => concat_y_net_x54,
      d_out => concat_y_net_x55
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_power15_1/c_to_ri"

entity c_to_ri_entity_018c749daa is
  port (
    c: in std_logic_vector(29 downto 0); 
    im: out std_logic_vector(14 downto 0); 
    re: out std_logic_vector(14 downto 0)
  );
end c_to_ri_entity_018c749daa;

architecture structural of c_to_ri_entity_018c749daa is
  signal delay5_q_net_x0: std_logic_vector(29 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(14 downto 0);
  signal slice_im_y_net: std_logic_vector(14 downto 0);
  signal slice_re_y_net: std_logic_vector(14 downto 0);

begin
  delay5_q_net_x0 <= c;
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
      x => delay5_q_net_x0,
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
      x => delay5_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/r4_power15_1"

entity r4_power15_1_entity_08daeed395 is
  port (
    c: in std_logic_vector(29 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    power: out std_logic_vector(29 downto 0)
  );
end r4_power15_1_entity_08daeed395;

architecture structural of r4_power15_1_entity_08daeed395 is
  signal ce_1_sg_x333: std_logic;
  signal clk_1_sg_x333: std_logic;
  signal delay5_q_net_x1: std_logic_vector(29 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(14 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(14 downto 0);
  signal imag_square_p_net: std_logic_vector(29 downto 0);
  signal power_adder_s_net_x0: std_logic_vector(29 downto 0);
  signal real_square_p_net: std_logic_vector(29 downto 0);

begin
  delay5_q_net_x1 <= c;
  ce_1_sg_x333 <= ce_1;
  clk_1_sg_x333 <= clk_1;
  power <= power_adder_s_net_x0;

  c_to_ri_018c749daa: entity work.c_to_ri_entity_018c749daa
    port map (
      c => delay5_q_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  imag_square: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 12,
      a_width => 15,
      b_arith => xlSigned,
      b_bin_pt => 12,
      b_width => 15,
      c_a_type => 0,
      c_a_width => 15,
      c_b_type => 0,
      c_b_width => 15,
      c_baat => 15,
      c_output_width => 30,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_1d18c2bc7f1da736",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 24,
      p_width => 30,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x0,
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      core_ce => ce_1_sg_x333,
      core_clk => clk_1_sg_x333,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => imag_square_p_net
    );

  power_adder: entity work.addsub_b088568adf
    port map (
      a => real_square_p_net,
      b => imag_square_p_net,
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      s => power_adder_s_net_x0
    );

  real_square: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 12,
      a_width => 15,
      b_arith => xlSigned,
      b_bin_pt => 12,
      b_width => 15,
      c_a_type => 0,
      c_a_width => 15,
      c_b_type => 0,
      c_b_width => 15,
      c_baat => 15,
      c_output_width => 30,
      c_type => 0,
      core_name0 => "multiplier_virtex5_10_1_1d18c2bc7f1da736",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 24,
      p_width => 30,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x0,
      ce => ce_1_sg_x333,
      clk => clk_1_sg_x333,
      clr => '0',
      core_ce => ce_1_sg_x333,
      core_clk => clk_1_sg_x333,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => real_square_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/snap_adc/addr"

entity addr_entity_0d667c409d is
  port (
    reg_out: in std_logic_vector(9 downto 0); 
    convert_x0: out std_logic_vector(31 downto 0)
  );
end addr_entity_0d667c409d;

architecture structural of addr_entity_0d667c409d is
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

-- Generated from Simulink block "r4_5g_specD5/snap_adc/bram"

entity bram_entity_58889dfc6b is
  port (
    addr: in std_logic_vector(9 downto 0); 
    data_in: in std_logic_vector(31 downto 0); 
    we: in std_logic; 
    convert_addr_x0: out std_logic_vector(9 downto 0); 
    convert_din_x0: out std_logic_vector(31 downto 0); 
    convert_we_x0: out std_logic
  );
end bram_entity_58889dfc6b;

architecture structural of bram_entity_58889dfc6b is
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

-- Generated from Simulink block "r4_5g_specD5/snap_adc/freeze_cntr"

entity freeze_cntr_entity_21031db3e7 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    en: in std_logic; 
    rst: in std_logic; 
    addr: out std_logic_vector(9 downto 0); 
    we: out std_logic
  );
end freeze_cntr_entity_21031db3e7;

architecture structural of freeze_cntr_entity_21031db3e7 is
  signal ce_1_sg_x337: std_logic;
  signal clk_1_sg_x337: std_logic;
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
  ce_1_sg_x337 <= ce_1;
  clk_1_sg_x337 <= clk_1;
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
      ce => ce_1_sg_x337,
      clk => clk_1_sg_x337,
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
      ce => ce_1_sg_x337,
      clk => clk_1_sg_x337,
      clr => '0',
      ip(0) => register_q_net_x0,
      op(0) => inverter_op_net
    );

  inverter1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x337,
      clk => clk_1_sg_x337,
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

-- Generated from Simulink block "r4_5g_specD5/snap_adc"

entity snap_adc_entity_99300148c0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_adc_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_adc_entity_99300148c0;

architecture structural of snap_adc_entity_99300148c0 is
  signal ce_1_sg_x339: std_logic;
  signal clk_1_sg_x339: std_logic;
  signal concat3_y_net_x0: std_logic_vector(31 downto 0);
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
  signal r4_5g_specd5_snap_adc_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x339 <= ce_1;
  clk_1_sg_x339 <= clk_1;
  concat3_y_net_x0 <= din;
  r4_5g_specd5_snap_adc_ctrl_user_data_out_net_x0 <= r4_5g_specd5_snap_adc_ctrl_user_data_out;
  constant3_op_net_x0 <= trig;
  constant12_op_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_0d667c409d: entity work.addr_entity_0d667c409d
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_58889dfc6b: entity work.bram_entity_58889dfc6b
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
      x => r4_5g_specd5_snap_adc_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_21031db3e7: entity work.freeze_cntr_entity_21031db3e7
    port map (
      ce_1 => ce_1_sg_x339,
      clk_1 => clk_1_sg_x339,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x339,
      clk => clk_1_sg_x339,
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

  posedge_9c08045e50: entity work.posedge1_entity_a7b163b634
    port map (
      ce_1 => ce_1_sg_x339,
      clk_1 => clk_1_sg_x339,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x339,
      clk => clk_1_sg_x339,
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
      ce => ce_1_sg_x339,
      clk => clk_1_sg_x339,
      d(0) => constant_op_net,
      en(0) => logical_y_net_x0,
      rst(0) => logical1_y_net,
      q(0) => register_q_net_x0
    );

  reinterpret: entity work.reinterpret_c5d4d59b73
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
      x => r4_5g_specd5_snap_adc_ctrl_user_data_out_net_x0,
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
      x => r4_5g_specd5_snap_adc_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/snap_vacc0"

entity snap_vacc0_entity_1bd38304d0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc0_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc0_entity_1bd38304d0;

architecture structural of snap_vacc0_entity_1bd38304d0 is
  signal ce_1_sg_x342: std_logic;
  signal clk_1_sg_x342: std_logic;
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
  signal r4_5g_specd5_snap_vacc0_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x342 <= ce_1;
  clk_1_sg_x342 <= clk_1;
  delay11_q_net_x0 <= din;
  r4_5g_specd5_snap_vacc0_ctrl_user_data_out_net_x0 <= r4_5g_specd5_snap_vacc0_ctrl_user_data_out;
  delay29_q_net_x0 <= trig;
  delay12_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_2c0000b249: entity work.addr_entity_0d667c409d
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_d71a65e7c5: entity work.bram_entity_58889dfc6b
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
      x => r4_5g_specd5_snap_vacc0_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_dafa6a18e0: entity work.freeze_cntr_entity_21031db3e7
    port map (
      ce_1 => ce_1_sg_x342,
      clk_1 => clk_1_sg_x342,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x342,
      clk => clk_1_sg_x342,
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

  posedge_7726464c13: entity work.posedge1_entity_a7b163b634
    port map (
      ce_1 => ce_1_sg_x342,
      clk_1 => clk_1_sg_x342,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x342,
      clk => clk_1_sg_x342,
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
      ce => ce_1_sg_x342,
      clk => clk_1_sg_x342,
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
      x => r4_5g_specd5_snap_vacc0_ctrl_user_data_out_net_x0,
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
      x => r4_5g_specd5_snap_vacc0_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/snap_vacc1"

entity snap_vacc1_entity_10ea8504ad is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc1_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc1_entity_10ea8504ad;

architecture structural of snap_vacc1_entity_10ea8504ad is
  signal ce_1_sg_x345: std_logic;
  signal clk_1_sg_x345: std_logic;
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
  signal r4_5g_specd5_snap_vacc1_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x345 <= ce_1;
  clk_1_sg_x345 <= clk_1;
  delay13_q_net_x0 <= din;
  r4_5g_specd5_snap_vacc1_ctrl_user_data_out_net_x0 <= r4_5g_specd5_snap_vacc1_ctrl_user_data_out;
  delay29_q_net_x1 <= trig;
  delay8_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_9e020f03a1: entity work.addr_entity_0d667c409d
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_8670a6f6f8: entity work.bram_entity_58889dfc6b
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
      x => r4_5g_specd5_snap_vacc1_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_60e398aa3c: entity work.freeze_cntr_entity_21031db3e7
    port map (
      ce_1 => ce_1_sg_x345,
      clk_1 => clk_1_sg_x345,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x345,
      clk => clk_1_sg_x345,
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

  posedge_9bf7dc8b9e: entity work.posedge1_entity_a7b163b634
    port map (
      ce_1 => ce_1_sg_x345,
      clk_1 => clk_1_sg_x345,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x345,
      clk => clk_1_sg_x345,
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
      ce => ce_1_sg_x345,
      clk => clk_1_sg_x345,
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
      x => r4_5g_specd5_snap_vacc1_ctrl_user_data_out_net_x0,
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
      x => r4_5g_specd5_snap_vacc1_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/snap_vacc2"

entity snap_vacc2_entity_26e85db58a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc2_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc2_entity_26e85db58a;

architecture structural of snap_vacc2_entity_26e85db58a is
  signal ce_1_sg_x348: std_logic;
  signal clk_1_sg_x348: std_logic;
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
  signal r4_5g_specd5_snap_vacc2_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x348 <= ce_1;
  clk_1_sg_x348 <= clk_1;
  delay35_q_net_x0 <= din;
  r4_5g_specd5_snap_vacc2_ctrl_user_data_out_net_x0 <= r4_5g_specd5_snap_vacc2_ctrl_user_data_out;
  delay45_q_net_x0 <= trig;
  delay36_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_ae02096a88: entity work.addr_entity_0d667c409d
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_5b58db4954: entity work.bram_entity_58889dfc6b
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
      x => r4_5g_specd5_snap_vacc2_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_abdbda6bbd: entity work.freeze_cntr_entity_21031db3e7
    port map (
      ce_1 => ce_1_sg_x348,
      clk_1 => clk_1_sg_x348,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
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

  posedge_c9c37d327c: entity work.posedge1_entity_a7b163b634
    port map (
      ce_1 => ce_1_sg_x348,
      clk_1 => clk_1_sg_x348,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
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
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
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
      x => r4_5g_specd5_snap_vacc2_ctrl_user_data_out_net_x0,
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
      x => r4_5g_specd5_snap_vacc2_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/snap_vacc3"

entity snap_vacc3_entity_d368eba1a5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc3_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    bram: out std_logic_vector(9 downto 0); 
    bram_x0: out std_logic_vector(31 downto 0); 
    bram_x1: out std_logic
  );
end snap_vacc3_entity_d368eba1a5;

architecture structural of snap_vacc3_entity_d368eba1a5 is
  signal ce_1_sg_x351: std_logic;
  signal clk_1_sg_x351: std_logic;
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
  signal r4_5g_specd5_snap_vacc3_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal register1_q_net_x0: std_logic_vector(9 downto 0);
  signal register_q_net_x0: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal trig1_y_net: std_logic;
  signal valid_y_net: std_logic;

begin
  ce_1_sg_x351 <= ce_1;
  clk_1_sg_x351 <= clk_1;
  delay37_q_net_x0 <= din;
  r4_5g_specd5_snap_vacc3_ctrl_user_data_out_net_x0 <= r4_5g_specd5_snap_vacc3_ctrl_user_data_out;
  delay45_q_net_x1 <= trig;
  delay47_q_net_x0 <= we;
  addr <= convert_dout_net_x1;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;

  addr_1e9acc4cfc: entity work.addr_entity_0d667c409d
    port map (
      reg_out => register1_q_net_x0,
      convert_x0 => convert_dout_net_x1
    );

  bram_307936fe72: entity work.bram_entity_58889dfc6b
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
      x => r4_5g_specd5_snap_vacc3_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net_x0
    );

  freeze_cntr_008ccc43fd: entity work.freeze_cntr_entity_21031db3e7
    port map (
      ce_1 => ce_1_sg_x351,
      clk_1 => clk_1_sg_x351,
      en => mux1_y_net_x0,
      rst => register_q_net_x0,
      addr => enable_y_net_x1,
      we => logical1_y_net_x1
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x351,
      clk => clk_1_sg_x351,
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

  posedge_e5193203c3: entity work.posedge1_entity_a7b163b634
    port map (
      ce_1 => ce_1_sg_x351,
      clk_1 => clk_1_sg_x351,
      in_x0 => enable_y_net_x0,
      out_x0 => logical_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 10,
      init_value => b"0000000000"
    )
    port map (
      ce => ce_1_sg_x351,
      clk => clk_1_sg_x351,
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
      ce => ce_1_sg_x351,
      clk => clk_1_sg_x351,
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
      x => r4_5g_specd5_snap_vacc3_ctrl_user_data_out_net_x0,
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
      x => r4_5g_specd5_snap_vacc3_ctrl_user_data_out_net_x0,
      y(0) => valid_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "r4_5g_specD5/vacc0/delay_bram"

entity delay_bram_entity_bb7690a1f7 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(31 downto 0); 
    out1: out std_logic_vector(31 downto 0)
  );
end delay_bram_entity_bb7690a1f7;

architecture structural of delay_bram_entity_bb7690a1f7 is
  signal adder0_s_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x352: std_logic;
  signal clk_1_sg_x352: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x352 <= ce_1;
  clk_1_sg_x352 <= clk_1;
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
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
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
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
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

-- Generated from Simulink block "r4_5g_specD5/vacc0/pulse_ext"

entity pulse_ext_entity_1b0df989e5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end pulse_ext_entity_1b0df989e5;

architecture structural of pulse_ext_entity_1b0df989e5 is
  signal ce_1_sg_x354: std_logic;
  signal clk_1_sg_x354: std_logic;
  signal constant5_op_net: std_logic_vector(10 downto 0);
  signal counter3_op_net: std_logic_vector(10 downto 0);
  signal delay24_q_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal relational5_op_net_x0: std_logic;

begin
  ce_1_sg_x354 <= ce_1;
  clk_1_sg_x354 <= clk_1;
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
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      en(0) => relational5_op_net_x0,
      rst(0) => logical_y_net_x0,
      op => counter3_op_net
    );

  posedge_7d7f501f17: entity work.posedge1_entity_a7b163b634
    port map (
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
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

-- Generated from Simulink block "r4_5g_specD5/vacc0"

entity vacc0_entity_f654429430 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(29 downto 0); 
    new_acc: in std_logic; 
    dout: out std_logic_vector(31 downto 0); 
    valid: out std_logic
  );
end vacc0_entity_f654429430;

architecture structural of vacc0_entity_f654429430 is
  signal adder0_s_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x355: std_logic;
  signal clk_1_sg_x355: std_logic;
  signal delay24_q_net_x2: std_logic;
  signal delay25_q_net_x0: std_logic_vector(29 downto 0);
  signal mux0_y_net: std_logic_vector(40 downto 0);
  signal relational5_op_net_x1: std_logic;
  signal single_port_ram_data_out_net_x1: std_logic_vector(31 downto 0);
  signal zero_op_net: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x355 <= ce_1;
  clk_1_sg_x355 <= clk_1;
  delay25_q_net_x0 <= din;
  delay24_q_net_x2 <= new_acc;
  dout <= single_port_ram_data_out_net_x1;
  valid <= relational5_op_net_x1;

  adder0: entity work.addsub_df91aa4f5b
    port map (
      a => delay25_q_net_x0,
      b => mux0_y_net,
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      clr => '0',
      s => adder0_s_net_x0
    );

  delay_bram_bb7690a1f7: entity work.delay_bram_entity_bb7690a1f7
    port map (
      ce_1 => ce_1_sg_x355,
      clk_1 => clk_1_sg_x355,
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

  pulse_ext_1b0df989e5: entity work.pulse_ext_entity_1b0df989e5
    port map (
      ce_1 => ce_1_sg_x355,
      clk_1 => clk_1_sg_x355,
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

-- Generated from Simulink block "r4_5g_specD5"

entity r4_5g_specd5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    r4_5g_specd5_acc_len_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_data_valid: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_datai0: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai1: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai2: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai3: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai4: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai5: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai6: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai7: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq0: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq1: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq2: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq3: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq4: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq5: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq6: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq7: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_outofrange0: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_outofrange1: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_sync0: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_sync1: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_sync2: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_sync3: in std_logic; 
    r4_5g_specd5_cnt_rst_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_adc_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_adc_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc0_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc0_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc1_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc1_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc2_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc2_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc3_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc3_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_acc_cnt_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_led0_sync_gateway: out std_logic; 
    r4_5g_specd5_led1_new_acc_gateway: out std_logic; 
    r4_5g_specd5_snap_adc_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_adc_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specd5_snap_adc_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_adc_bram_we: out std_logic; 
    r4_5g_specd5_snap_vacc0_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc0_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specd5_snap_vacc0_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc0_bram_we: out std_logic; 
    r4_5g_specd5_snap_vacc1_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc1_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specd5_snap_vacc1_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc1_bram_we: out std_logic; 
    r4_5g_specd5_snap_vacc2_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc2_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specd5_snap_vacc2_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc2_bram_we: out std_logic; 
    r4_5g_specd5_snap_vacc3_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc3_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specd5_snap_vacc3_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc3_bram_we: out std_logic; 
    r4_5g_specd5_sync_cnt_user_data_in: out std_logic_vector(31 downto 0)
  );
end r4_5g_specd5;

architecture structural of r4_5g_specd5 is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "r4_5g_specD5,sysgen_core_10_1_3_1386,{total_blocks=18511,xilinx_adder_subtractor_block=760,xilinx_arithmetic_relational_operator_block=7,xilinx_binary_shift_operator_block=17,xilinx_bit_slice_extractor_block=1219,xilinx_bus_concatenator_block=337,xilinx_bus_multiplexer_block=174,xilinx_constant_block_block=223,xilinx_counter_block=387,xilinx_delay_block=1207,xilinx_disregard_subsystem_for_generation_block=5,xilinx_gateway_in_block=50,xilinx_gateway_out_block=29,xilinx_input_scaler_block=320,xilinx_inverter_block=45,xilinx_logical_block_block=30,xilinx_multiplier_block=344,xilinx_register_block=11,xilinx_single_port_random_access_memory_block=153,xilinx_single_port_read_only_memory_block=144,xilinx_system_generator_block=1,xilinx_type_converter_block=664,xilinx_type_reinterpreter_block=1605,}";

  signal acc_cntr_op_net: std_logic_vector(31 downto 0);
  signal ce_1_sg_x368: std_logic;
  signal clk_1_sg_x368: std_logic;
  signal concat3_y_net_x0: std_logic_vector(31 downto 0);
  signal concat_y_net_x10: std_logic_vector(9 downto 0);
  signal concat_y_net_x11: std_logic_vector(9 downto 0);
  signal concat_y_net_x12: std_logic_vector(9 downto 0);
  signal concat_y_net_x13: std_logic_vector(9 downto 0);
  signal concat_y_net_x52: std_logic_vector(29 downto 0);
  signal concat_y_net_x53: std_logic_vector(29 downto 0);
  signal concat_y_net_x54: std_logic_vector(29 downto 0);
  signal concat_y_net_x55: std_logic_vector(29 downto 0);
  signal constant12_op_net_x0: std_logic;
  signal constant3_op_net_x0: std_logic;
  signal delay10_q_net_x0: std_logic;
  signal delay11_q_net_x0: std_logic_vector(31 downto 0);
  signal delay12_q_net_x0: std_logic;
  signal delay13_q_net_x0: std_logic_vector(31 downto 0);
  signal delay14_q_net: std_logic;
  signal delay15_q_net: std_logic_vector(29 downto 0);
  signal delay16_q_net: std_logic_vector(29 downto 0);
  signal delay17_q_net_x1: std_logic_vector(29 downto 0);
  signal delay18_q_net: std_logic_vector(29 downto 0);
  signal delay19_q_net: std_logic_vector(29 downto 0);
  signal delay1_q_net_x0: std_logic_vector(31 downto 0);
  signal delay20_q_net: std_logic_vector(31 downto 0);
  signal delay21_q_net_x0: std_logic_vector(31 downto 0);
  signal delay22_q_net_x2: std_logic_vector(3 downto 0);
  signal delay23_q_net_x0: std_logic_vector(31 downto 0);
  signal delay24_q_net_x2: std_logic;
  signal delay25_q_net_x0: std_logic_vector(29 downto 0);
  signal delay26_q_net_x2: std_logic;
  signal delay27_q_net_x0: std_logic_vector(29 downto 0);
  signal delay28_q_net: std_logic;
  signal delay29_q_net_x1: std_logic;
  signal delay2_q_net_x2: std_logic_vector(3 downto 0);
  signal delay30_q_net_x2: std_logic_vector(3 downto 0);
  signal delay31_q_net_x1: std_logic;
  signal delay32_q_net: std_logic_vector(3 downto 0);
  signal delay33_q_net: std_logic_vector(3 downto 0);
  signal delay34_q_net: std_logic_vector(29 downto 0);
  signal delay35_q_net_x0: std_logic_vector(31 downto 0);
  signal delay36_q_net_x0: std_logic;
  signal delay37_q_net_x0: std_logic_vector(31 downto 0);
  signal delay38_q_net_x1: std_logic_vector(29 downto 0);
  signal delay39_q_net: std_logic_vector(29 downto 0);
  signal delay3_q_net: std_logic_vector(3 downto 0);
  signal delay40_q_net: std_logic_vector(29 downto 0);
  signal delay41_q_net_x2: std_logic;
  signal delay42_q_net_x0: std_logic_vector(29 downto 0);
  signal delay43_q_net_x2: std_logic;
  signal delay44_q_net_x0: std_logic_vector(29 downto 0);
  signal delay45_q_net_x1: std_logic;
  signal delay46_q_net_x1: std_logic_vector(29 downto 0);
  signal delay47_q_net_x0: std_logic;
  signal delay48_q_net: std_logic_vector(29 downto 0);
  signal delay4_q_net: std_logic_vector(3 downto 0);
  signal delay5_q_net_x1: std_logic_vector(29 downto 0);
  signal delay7_q_net_x18: std_logic;
  signal delay8_q_net_x0: std_logic;
  signal delay9_q_net_x0: std_logic;
  signal delay_q_net_x2: std_logic_vector(3 downto 0);
  signal delay_q_net_x27: std_logic;
  signal logical_y_net_x2: std_logic;
  signal logical_y_net_x3: std_logic;
  signal power_adder_s_net_x0: std_logic_vector(29 downto 0);
  signal power_adder_s_net_x1: std_logic_vector(29 downto 0);
  signal power_adder_s_net_x2: std_logic_vector(29 downto 0);
  signal power_adder_s_net_x3: std_logic_vector(29 downto 0);
  signal r4_5g_specd5_acc_cnt_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_acc_len_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_data_valid_net: std_logic;
  signal r4_5g_specd5_adc_5g_dmux_user_datai0_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai1_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai2_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai3_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai4_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai5_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai6_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_datai7_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_dataq0_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_dataq1_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_dataq2_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_dataq3_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_dataq4_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_dataq5_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_dataq6_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_dataq7_net: std_logic_vector(3 downto 0);
  signal r4_5g_specd5_adc_5g_dmux_user_outofrange0_net: std_logic;
  signal r4_5g_specd5_adc_5g_dmux_user_outofrange1_net: std_logic;
  signal r4_5g_specd5_adc_5g_dmux_user_sync0_net: std_logic;
  signal r4_5g_specd5_adc_5g_dmux_user_sync1_net: std_logic;
  signal r4_5g_specd5_adc_5g_dmux_user_sync2_net: std_logic;
  signal r4_5g_specd5_adc_5g_dmux_user_sync3_net: std_logic;
  signal r4_5g_specd5_cnt_rst_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_led0_sync_gateway_net: std_logic;
  signal r4_5g_specd5_led1_new_acc_gateway_net: std_logic;
  signal r4_5g_specd5_snap_adc_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_adc_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_5g_specd5_snap_adc_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_adc_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_adc_bram_we_net: std_logic;
  signal r4_5g_specd5_snap_adc_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc0_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc0_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_5g_specd5_snap_vacc0_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc0_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc0_bram_we_net: std_logic;
  signal r4_5g_specd5_snap_vacc0_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc1_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc1_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_5g_specd5_snap_vacc1_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc1_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc1_bram_we_net: std_logic;
  signal r4_5g_specd5_snap_vacc1_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc2_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc2_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_5g_specd5_snap_vacc2_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc2_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc2_bram_we_net: std_logic;
  signal r4_5g_specd5_snap_vacc2_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc3_addr_user_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc3_bram_addr_net: std_logic_vector(9 downto 0);
  signal r4_5g_specd5_snap_vacc3_bram_data_in_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc3_bram_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_snap_vacc3_bram_we_net: std_logic;
  signal r4_5g_specd5_snap_vacc3_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal r4_5g_specd5_sync_cnt_user_data_in_net: std_logic_vector(31 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret5_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret6_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret7_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x10: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x11: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x12: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x13: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x14: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x15: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x8: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net_x9: std_logic_vector(3 downto 0);
  signal relational5_op_net_x0: std_logic;
  signal relational5_op_net_x1: std_logic;
  signal relational5_op_net_x2: std_logic;
  signal relational5_op_net_x3: std_logic;
  signal relational5_op_net_x4: std_logic;
  signal relational5_op_net_x5: std_logic;
  signal shift1_op_net_x3: std_logic_vector(9 downto 0);
  signal shift4_op_net_x4: std_logic_vector(9 downto 0);
  signal shift5_op_net_x4: std_logic_vector(9 downto 0);
  signal shift_op_net_x3: std_logic_vector(9 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(31 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(31 downto 0);
  signal single_port_ram_data_out_net_x3: std_logic_vector(31 downto 0);
  signal single_port_ram_data_out_net_x4: std_logic_vector(31 downto 0);
  signal slice2_y_net: std_logic;
  signal slice_y_net_x0: std_logic;
  signal sync_cntr_op_net: std_logic_vector(31 downto 0);
  signal sync_gen_op_net: std_logic_vector(26 downto 0);

begin
  ce_1_sg_x368 <= ce_1;
  clk_1_sg_x368 <= clk_1;
  r4_5g_specd5_acc_len_user_data_out_net <= r4_5g_specd5_acc_len_user_data_out;
  r4_5g_specd5_adc_5g_dmux_user_data_valid_net <= r4_5g_specd5_adc_5g_dmux_user_data_valid;
  r4_5g_specd5_adc_5g_dmux_user_datai0_net <= r4_5g_specd5_adc_5g_dmux_user_datai0;
  r4_5g_specd5_adc_5g_dmux_user_datai1_net <= r4_5g_specd5_adc_5g_dmux_user_datai1;
  r4_5g_specd5_adc_5g_dmux_user_datai2_net <= r4_5g_specd5_adc_5g_dmux_user_datai2;
  r4_5g_specd5_adc_5g_dmux_user_datai3_net <= r4_5g_specd5_adc_5g_dmux_user_datai3;
  r4_5g_specd5_adc_5g_dmux_user_datai4_net <= r4_5g_specd5_adc_5g_dmux_user_datai4;
  r4_5g_specd5_adc_5g_dmux_user_datai5_net <= r4_5g_specd5_adc_5g_dmux_user_datai5;
  r4_5g_specd5_adc_5g_dmux_user_datai6_net <= r4_5g_specd5_adc_5g_dmux_user_datai6;
  r4_5g_specd5_adc_5g_dmux_user_datai7_net <= r4_5g_specd5_adc_5g_dmux_user_datai7;
  r4_5g_specd5_adc_5g_dmux_user_dataq0_net <= r4_5g_specd5_adc_5g_dmux_user_dataq0;
  r4_5g_specd5_adc_5g_dmux_user_dataq1_net <= r4_5g_specd5_adc_5g_dmux_user_dataq1;
  r4_5g_specd5_adc_5g_dmux_user_dataq2_net <= r4_5g_specd5_adc_5g_dmux_user_dataq2;
  r4_5g_specd5_adc_5g_dmux_user_dataq3_net <= r4_5g_specd5_adc_5g_dmux_user_dataq3;
  r4_5g_specd5_adc_5g_dmux_user_dataq4_net <= r4_5g_specd5_adc_5g_dmux_user_dataq4;
  r4_5g_specd5_adc_5g_dmux_user_dataq5_net <= r4_5g_specd5_adc_5g_dmux_user_dataq5;
  r4_5g_specd5_adc_5g_dmux_user_dataq6_net <= r4_5g_specd5_adc_5g_dmux_user_dataq6;
  r4_5g_specd5_adc_5g_dmux_user_dataq7_net <= r4_5g_specd5_adc_5g_dmux_user_dataq7;
  r4_5g_specd5_adc_5g_dmux_user_outofrange0_net <= r4_5g_specd5_adc_5g_dmux_user_outofrange0;
  r4_5g_specd5_adc_5g_dmux_user_outofrange1_net <= r4_5g_specd5_adc_5g_dmux_user_outofrange1;
  r4_5g_specd5_adc_5g_dmux_user_sync0_net <= r4_5g_specd5_adc_5g_dmux_user_sync0;
  r4_5g_specd5_adc_5g_dmux_user_sync1_net <= r4_5g_specd5_adc_5g_dmux_user_sync1;
  r4_5g_specd5_adc_5g_dmux_user_sync2_net <= r4_5g_specd5_adc_5g_dmux_user_sync2;
  r4_5g_specd5_adc_5g_dmux_user_sync3_net <= r4_5g_specd5_adc_5g_dmux_user_sync3;
  r4_5g_specd5_cnt_rst_user_data_out_net <= r4_5g_specd5_cnt_rst_user_data_out;
  r4_5g_specd5_snap_adc_bram_data_out_net <= r4_5g_specd5_snap_adc_bram_data_out;
  r4_5g_specd5_snap_adc_ctrl_user_data_out_net <= r4_5g_specd5_snap_adc_ctrl_user_data_out;
  r4_5g_specd5_snap_vacc0_bram_data_out_net <= r4_5g_specd5_snap_vacc0_bram_data_out;
  r4_5g_specd5_snap_vacc0_ctrl_user_data_out_net <= r4_5g_specd5_snap_vacc0_ctrl_user_data_out;
  r4_5g_specd5_snap_vacc1_bram_data_out_net <= r4_5g_specd5_snap_vacc1_bram_data_out;
  r4_5g_specd5_snap_vacc1_ctrl_user_data_out_net <= r4_5g_specd5_snap_vacc1_ctrl_user_data_out;
  r4_5g_specd5_snap_vacc2_bram_data_out_net <= r4_5g_specd5_snap_vacc2_bram_data_out;
  r4_5g_specd5_snap_vacc2_ctrl_user_data_out_net <= r4_5g_specd5_snap_vacc2_ctrl_user_data_out;
  r4_5g_specd5_snap_vacc3_bram_data_out_net <= r4_5g_specd5_snap_vacc3_bram_data_out;
  r4_5g_specd5_snap_vacc3_ctrl_user_data_out_net <= r4_5g_specd5_snap_vacc3_ctrl_user_data_out;
  r4_5g_specd5_acc_cnt_user_data_in <= r4_5g_specd5_acc_cnt_user_data_in_net;
  r4_5g_specd5_led0_sync_gateway <= r4_5g_specd5_led0_sync_gateway_net;
  r4_5g_specd5_led1_new_acc_gateway <= r4_5g_specd5_led1_new_acc_gateway_net;
  r4_5g_specd5_snap_adc_addr_user_data_in <= r4_5g_specd5_snap_adc_addr_user_data_in_net;
  r4_5g_specd5_snap_adc_bram_addr <= r4_5g_specd5_snap_adc_bram_addr_net;
  r4_5g_specd5_snap_adc_bram_data_in <= r4_5g_specd5_snap_adc_bram_data_in_net;
  r4_5g_specd5_snap_adc_bram_we <= r4_5g_specd5_snap_adc_bram_we_net;
  r4_5g_specd5_snap_vacc0_addr_user_data_in <= r4_5g_specd5_snap_vacc0_addr_user_data_in_net;
  r4_5g_specd5_snap_vacc0_bram_addr <= r4_5g_specd5_snap_vacc0_bram_addr_net;
  r4_5g_specd5_snap_vacc0_bram_data_in <= r4_5g_specd5_snap_vacc0_bram_data_in_net;
  r4_5g_specd5_snap_vacc0_bram_we <= r4_5g_specd5_snap_vacc0_bram_we_net;
  r4_5g_specd5_snap_vacc1_addr_user_data_in <= r4_5g_specd5_snap_vacc1_addr_user_data_in_net;
  r4_5g_specd5_snap_vacc1_bram_addr <= r4_5g_specd5_snap_vacc1_bram_addr_net;
  r4_5g_specd5_snap_vacc1_bram_data_in <= r4_5g_specd5_snap_vacc1_bram_data_in_net;
  r4_5g_specd5_snap_vacc1_bram_we <= r4_5g_specd5_snap_vacc1_bram_we_net;
  r4_5g_specd5_snap_vacc2_addr_user_data_in <= r4_5g_specd5_snap_vacc2_addr_user_data_in_net;
  r4_5g_specd5_snap_vacc2_bram_addr <= r4_5g_specd5_snap_vacc2_bram_addr_net;
  r4_5g_specd5_snap_vacc2_bram_data_in <= r4_5g_specd5_snap_vacc2_bram_data_in_net;
  r4_5g_specd5_snap_vacc2_bram_we <= r4_5g_specd5_snap_vacc2_bram_we_net;
  r4_5g_specd5_snap_vacc3_addr_user_data_in <= r4_5g_specd5_snap_vacc3_addr_user_data_in_net;
  r4_5g_specd5_snap_vacc3_bram_addr <= r4_5g_specd5_snap_vacc3_bram_addr_net;
  r4_5g_specd5_snap_vacc3_bram_data_in <= r4_5g_specd5_snap_vacc3_bram_data_in_net;
  r4_5g_specd5_snap_vacc3_bram_we <= r4_5g_specd5_snap_vacc3_bram_we_net;
  r4_5g_specd5_sync_cnt_user_data_in <= r4_5g_specd5_sync_cnt_user_data_in_net;

  acc_cnt_b094c4628c: entity work.acc_cnt_entity_b094c4628c
    port map (
      reg_out => delay1_q_net_x0,
      convert_x0 => r4_5g_specd5_acc_cnt_user_data_in_net
    );

  acc_cntr: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_487c95d8131ef26d",
      op_arith => xlUnsigned,
      op_width => 32
    )
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      en(0) => delay28_q_net,
      rst(0) => slice2_y_net,
      op => acc_cntr_op_net
    );

  acc_cntrl_67047630d4: entity work.acc_cntrl_entity_67047630d4
    port map (
      acc_len => delay23_q_net_x0,
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      sync => delay10_q_net_x0,
      new_acc => logical_y_net_x2
    );

  adc_5g_dmux_cb544fc405: entity work.adc_5g_dmux_entity_cb544fc405
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      r4_5g_specd5_adc_5g_dmux_user_datai0 => r4_5g_specd5_adc_5g_dmux_user_datai0_net,
      r4_5g_specd5_adc_5g_dmux_user_datai1 => r4_5g_specd5_adc_5g_dmux_user_datai1_net,
      r4_5g_specd5_adc_5g_dmux_user_datai2 => r4_5g_specd5_adc_5g_dmux_user_datai2_net,
      r4_5g_specd5_adc_5g_dmux_user_datai3 => r4_5g_specd5_adc_5g_dmux_user_datai3_net,
      r4_5g_specd5_adc_5g_dmux_user_datai4 => r4_5g_specd5_adc_5g_dmux_user_datai4_net,
      r4_5g_specd5_adc_5g_dmux_user_datai5 => r4_5g_specd5_adc_5g_dmux_user_datai5_net,
      r4_5g_specd5_adc_5g_dmux_user_datai6 => r4_5g_specd5_adc_5g_dmux_user_datai6_net,
      r4_5g_specd5_adc_5g_dmux_user_datai7 => r4_5g_specd5_adc_5g_dmux_user_datai7_net,
      i0 => reinterpret_output_port_net_x8,
      i1 => reinterpret_output_port_net_x9,
      i2 => reinterpret_output_port_net_x12,
      i3 => reinterpret_output_port_net_x13,
      i4 => reinterpret_output_port_net_x14,
      i5 => reinterpret_output_port_net_x15,
      i6 => reinterpret_output_port_net_x10,
      i7 => reinterpret_output_port_net_x11
    );

  concat3: entity work.concat_6f001c0c54
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

  delay: entity work.delay_4f82bd00e5
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => reinterpret_output_port_net_x8,
      q => delay_q_net_x2
    );

  delay1: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => acc_cntr_op_net,
      q => delay1_q_net_x0
    );

  delay10: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => delay14_q_net,
      q(0) => delay10_q_net_x0
    );

  delay11: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => single_port_ram_data_out_net_x1,
      q => delay11_q_net_x0
    );

  delay12: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => relational5_op_net_x2,
      q(0) => delay12_q_net_x0
    );

  delay13: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => single_port_ram_data_out_net_x2,
      q => delay13_q_net_x0
    );

  delay14: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => logical_y_net_x3,
      q(0) => delay14_q_net
    );

  delay15: entity work.delay_6a4d004582
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => concat_y_net_x52,
      q => delay15_q_net
    );

  delay16: entity work.delay_6a4d004582
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => concat_y_net_x54,
      q => delay16_q_net
    );

  delay17: entity work.delay_f73e91d273
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => delay16_q_net,
      q => delay17_q_net_x1
    );

  delay18: entity work.delay_f73e91d273
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => power_adder_s_net_x0,
      q => delay18_q_net
    );

  delay19: entity work.delay_f73e91d273
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => power_adder_s_net_x1,
      q => delay19_q_net
    );

  delay2: entity work.delay_4f82bd00e5
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => reinterpret_output_port_net_x9,
      q => delay2_q_net_x2
    );

  delay20: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => r4_5g_specd5_cnt_rst_user_data_out_net,
      q => delay20_q_net
    );

  delay21: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => sync_cntr_op_net,
      q => delay21_q_net_x0
    );

  delay22: entity work.delay_4f82bd00e5
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => reinterpret_output_port_net_x14,
      q => delay22_q_net_x2
    );

  delay23: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => r4_5g_specd5_acc_len_user_data_out_net,
      q => delay23_q_net_x0
    );

  delay24: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay24_q_net_x2
    );

  delay25: entity work.delay_6a4d004582
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => delay18_q_net,
      q => delay25_q_net_x0
    );

  delay26: entity work.delay_23d71a76f2
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay26_q_net_x2
    );

  delay27: entity work.delay_5e53a8130e
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => delay19_q_net,
      q => delay27_q_net_x0
    );

  delay28: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay28_q_net
    );

  delay29: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay29_q_net_x1
    );

  delay3: entity work.delay_4f82bd00e5
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => reinterpret_output_port_net_x12,
      q => delay3_q_net
    );

  delay30: entity work.delay_4f82bd00e5
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => reinterpret_output_port_net_x15,
      q => delay30_q_net_x2
    );

  delay31: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay31_q_net_x1
    );

  delay32: entity work.delay_4f82bd00e5
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => reinterpret_output_port_net_x10,
      q => delay32_q_net
    );

  delay33: entity work.delay_4f82bd00e5
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => reinterpret_output_port_net_x11,
      q => delay33_q_net
    );

  delay34: entity work.delay_6a4d004582
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => concat_y_net_x53,
      q => delay34_q_net
    );

  delay35: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => single_port_ram_data_out_net_x3,
      q => delay35_q_net_x0
    );

  delay36: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => relational5_op_net_x4,
      q(0) => delay36_q_net_x0
    );

  delay37: entity work.delay_3f5b23b538
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => single_port_ram_data_out_net_x4,
      q => delay37_q_net_x0
    );

  delay38: entity work.delay_f73e91d273
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => delay48_q_net,
      q => delay38_q_net_x1
    );

  delay39: entity work.delay_f73e91d273
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => power_adder_s_net_x2,
      q => delay39_q_net
    );

  delay4: entity work.delay_4f82bd00e5
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => reinterpret_output_port_net_x13,
      q => delay4_q_net
    );

  delay40: entity work.delay_f73e91d273
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => power_adder_s_net_x3,
      q => delay40_q_net
    );

  delay41: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay41_q_net_x2
    );

  delay42: entity work.delay_6a4d004582
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => delay39_q_net,
      q => delay42_q_net_x0
    );

  delay43: entity work.delay_23d71a76f2
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay43_q_net_x2
    );

  delay44: entity work.delay_5e53a8130e
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => delay40_q_net,
      q => delay44_q_net_x0
    );

  delay45: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => logical_y_net_x2,
      q(0) => delay45_q_net_x1
    );

  delay46: entity work.delay_f73e91d273
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => delay34_q_net,
      q => delay46_q_net_x1
    );

  delay47: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => relational5_op_net_x5,
      q(0) => delay47_q_net_x0
    );

  delay48: entity work.delay_6a4d004582
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => concat_y_net_x55,
      q => delay48_q_net
    );

  delay5: entity work.delay_f73e91d273
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d => delay15_q_net,
      q => delay5_q_net_x1
    );

  delay7: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => logical_y_net_x3,
      q(0) => delay7_q_net_x18
    );

  delay8: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => relational5_op_net_x3,
      q(0) => delay8_q_net_x0
    );

  delay9: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      d(0) => relational5_op_net_x0,
      q(0) => delay9_q_net_x0
    );

  fir1_b061a2406e: entity work.fir1_entity_b061a2406e
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      in_x0 => delay_q_net_x2,
      sync_in => delay7_q_net_x18,
      out_x0 => concat_y_net_x10
    );

  fir_2_d9bca7026d: entity work.fir1_entity_b061a2406e
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      in_x0 => delay2_q_net_x2,
      sync_in => delay7_q_net_x18,
      out_x0 => concat_y_net_x11
    );

  fir_4_6a0e71b633: entity work.fir_4_entity_6a0e71b633
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      sync_in => delay7_q_net_x18,
      sync_out => delay_q_net_x27
    );

  fir_5_a92b00fed6: entity work.fir1_entity_b061a2406e
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      in_x0 => delay22_q_net_x2,
      sync_in => delay7_q_net_x18,
      out_x0 => concat_y_net_x12
    );

  fir_6_4cccc3f3ed: entity work.fir1_entity_b061a2406e
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      in_x0 => delay30_q_net_x2,
      sync_in => delay7_q_net_x18,
      out_x0 => concat_y_net_x13
    );

  led0_sync_63dd83c044: entity work.led0_sync_entity_63dd83c044
    port map (
      gpio_out => relational5_op_net_x1,
      convert_x0 => r4_5g_specd5_led0_sync_gateway_net
    );

  led1_new_acc_83037edc4e: entity work.led0_sync_entity_63dd83c044
    port map (
      gpio_out => delay9_q_net_x0,
      convert_x0 => r4_5g_specd5_led1_new_acc_gateway_net
    );

  posedge_9ebe2ce144: entity work.posedge1_entity_a7b163b634
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      in_x0 => slice_y_net_x0,
      out_x0 => logical_y_net_x3
    );

  pulse_ext1_53273fddd4: entity work.pulse_ext1_entity_53273fddd4
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      in_x0 => logical_y_net_x3,
      out_x0 => relational5_op_net_x1
    );

  pulse_ext2_2bbdd5fd0e: entity work.pulse_ext1_entity_53273fddd4
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      in_x0 => delay31_q_net_x1,
      out_x0 => relational5_op_net_x0
    );

  r4_dit_fft_f719008c45: entity work.r4_dit_fft_entity_f719008c45
    port map (
      a_in => shift_op_net_x3,
      b_in => shift1_op_net_x3,
      c_in => shift4_op_net_x4,
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      d_in => shift5_op_net_x4,
      sync_in => delay_q_net_x27,
      a_out => concat_y_net_x52,
      b_out => concat_y_net_x54,
      c_out => concat_y_net_x53,
      d_out => concat_y_net_x55
    );

  r4_power15_1_08daeed395: entity work.r4_power15_1_entity_08daeed395
    port map (
      c => delay5_q_net_x1,
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      power => power_adder_s_net_x0
    );

  r4_power15_2_12d45ad09a: entity work.r4_power15_1_entity_08daeed395
    port map (
      c => delay17_q_net_x1,
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      power => power_adder_s_net_x1
    );

  r4_power15_3_e0b61967bc: entity work.r4_power15_1_entity_08daeed395
    port map (
      c => delay46_q_net_x1,
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      power => power_adder_s_net_x2
    );

  r4_power15_4_c373dac359: entity work.r4_power15_1_entity_08daeed395
    port map (
      c => delay38_q_net_x1,
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      power => power_adder_s_net_x3
    );

  reinterpret: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay_q_net_x2,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay2_q_net_x2,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay3_q_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay4_q_net,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay22_q_net_x2,
      output_port => reinterpret4_output_port_net
    );

  reinterpret5: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay30_q_net_x2,
      output_port => reinterpret5_output_port_net
    );

  reinterpret6: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay32_q_net,
      output_port => reinterpret6_output_port_net
    );

  reinterpret7: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => delay33_q_net,
      output_port => reinterpret7_output_port_net
    );

  shift: entity work.shift_7ed19d199d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      ip => concat_y_net_x10,
      op => shift_op_net_x3
    );

  shift1: entity work.shift_7ed19d199d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      ip => concat_y_net_x11,
      op => shift1_op_net_x3
    );

  shift4: entity work.shift_7ed19d199d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      ip => concat_y_net_x12,
      op => shift4_op_net_x4
    );

  shift5: entity work.shift_7ed19d199d
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
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

  snap_adc_99300148c0: entity work.snap_adc_entity_99300148c0
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      din => concat3_y_net_x0,
      r4_5g_specd5_snap_adc_ctrl_user_data_out => r4_5g_specd5_snap_adc_ctrl_user_data_out_net,
      trig => constant3_op_net_x0,
      we => constant12_op_net_x0,
      addr => r4_5g_specd5_snap_adc_addr_user_data_in_net,
      bram => r4_5g_specd5_snap_adc_bram_addr_net,
      bram_x0 => r4_5g_specd5_snap_adc_bram_data_in_net,
      bram_x1 => r4_5g_specd5_snap_adc_bram_we_net
    );

  snap_vacc0_1bd38304d0: entity work.snap_vacc0_entity_1bd38304d0
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      din => delay11_q_net_x0,
      r4_5g_specd5_snap_vacc0_ctrl_user_data_out => r4_5g_specd5_snap_vacc0_ctrl_user_data_out_net,
      trig => delay29_q_net_x1,
      we => delay12_q_net_x0,
      addr => r4_5g_specd5_snap_vacc0_addr_user_data_in_net,
      bram => r4_5g_specd5_snap_vacc0_bram_addr_net,
      bram_x0 => r4_5g_specd5_snap_vacc0_bram_data_in_net,
      bram_x1 => r4_5g_specd5_snap_vacc0_bram_we_net
    );

  snap_vacc1_10ea8504ad: entity work.snap_vacc1_entity_10ea8504ad
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      din => delay13_q_net_x0,
      r4_5g_specd5_snap_vacc1_ctrl_user_data_out => r4_5g_specd5_snap_vacc1_ctrl_user_data_out_net,
      trig => delay29_q_net_x1,
      we => delay8_q_net_x0,
      addr => r4_5g_specd5_snap_vacc1_addr_user_data_in_net,
      bram => r4_5g_specd5_snap_vacc1_bram_addr_net,
      bram_x0 => r4_5g_specd5_snap_vacc1_bram_data_in_net,
      bram_x1 => r4_5g_specd5_snap_vacc1_bram_we_net
    );

  snap_vacc2_26e85db58a: entity work.snap_vacc2_entity_26e85db58a
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      din => delay35_q_net_x0,
      r4_5g_specd5_snap_vacc2_ctrl_user_data_out => r4_5g_specd5_snap_vacc2_ctrl_user_data_out_net,
      trig => delay45_q_net_x1,
      we => delay36_q_net_x0,
      addr => r4_5g_specd5_snap_vacc2_addr_user_data_in_net,
      bram => r4_5g_specd5_snap_vacc2_bram_addr_net,
      bram_x0 => r4_5g_specd5_snap_vacc2_bram_data_in_net,
      bram_x1 => r4_5g_specd5_snap_vacc2_bram_we_net
    );

  snap_vacc3_d368eba1a5: entity work.snap_vacc3_entity_d368eba1a5
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      din => delay37_q_net_x0,
      r4_5g_specd5_snap_vacc3_ctrl_user_data_out => r4_5g_specd5_snap_vacc3_ctrl_user_data_out_net,
      trig => delay45_q_net_x1,
      we => delay47_q_net_x0,
      addr => r4_5g_specd5_snap_vacc3_addr_user_data_in_net,
      bram => r4_5g_specd5_snap_vacc3_bram_addr_net,
      bram_x0 => r4_5g_specd5_snap_vacc3_bram_data_in_net,
      bram_x1 => r4_5g_specd5_snap_vacc3_bram_we_net
    );

  sync_cnt_60970c4eb5: entity work.acc_cnt_entity_b094c4628c
    port map (
      reg_out => delay21_q_net_x0,
      convert_x0 => r4_5g_specd5_sync_cnt_user_data_in_net
    );

  sync_cntr: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_10_0_487c95d8131ef26d",
      op_arith => xlUnsigned,
      op_width => 32
    )
    port map (
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
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
      ce => ce_1_sg_x368,
      clk => clk_1_sg_x368,
      clr => '0',
      en => "1",
      rst => "0",
      op => sync_gen_op_net
    );

  vacc0_f654429430: entity work.vacc0_entity_f654429430
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      din => delay25_q_net_x0,
      new_acc => delay24_q_net_x2,
      dout => single_port_ram_data_out_net_x1,
      valid => relational5_op_net_x2
    );

  vacc1_eecb265a08: entity work.vacc0_entity_f654429430
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      din => delay27_q_net_x0,
      new_acc => delay26_q_net_x2,
      dout => single_port_ram_data_out_net_x2,
      valid => relational5_op_net_x3
    );

  vacc2_382018753d: entity work.vacc0_entity_f654429430
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      din => delay42_q_net_x0,
      new_acc => delay41_q_net_x2,
      dout => single_port_ram_data_out_net_x3,
      valid => relational5_op_net_x4
    );

  vacc3_d6600d8df0: entity work.vacc0_entity_f654429430
    port map (
      ce_1 => ce_1_sg_x368,
      clk_1 => clk_1_sg_x368,
      din => delay44_q_net_x0,
      new_acc => delay43_q_net_x2,
      dout => single_port_ram_data_out_net_x4,
      valid => relational5_op_net_x5
    );

end structural;
