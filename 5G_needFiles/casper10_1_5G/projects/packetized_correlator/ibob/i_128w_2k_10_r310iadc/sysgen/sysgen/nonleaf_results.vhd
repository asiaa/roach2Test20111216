library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/Feng_ctl"

entity feng_ctl_entity_6a48d5210c is
  port (
    addr_in: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(31 downto 0); 
    valid_in: in std_logic; 
    data_out: out std_logic_vector(31 downto 0)
  );
end feng_ctl_entity_6a48d5210c;

architecture structural of feng_ctl_entity_6a48d5210c is
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal constant_op_net: std_logic_vector(31 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal register1_q_net: std_logic_vector(31 downto 0);
  signal register3_q_net: std_logic;
  signal register_q_net_x0: std_logic_vector(31 downto 0);
  signal relational_op_net: std_logic;
  signal slice22_y_net: std_logic_vector(31 downto 0);
  signal slice30_y_net_x0: std_logic_vector(31 downto 0);
  signal slice31_y_net_x0: std_logic_vector(31 downto 0);

begin
  slice31_y_net_x0 <= addr_in;
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  slice30_y_net_x0 <= data_in;
  delay2_q_net_x0 <= valid_in;
  data_out <= register_q_net_x0;

  constant_x0: entity work.constant_be92234dd0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => register3_q_net,
      y(0) => logical_y_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 32,
      init_value => b"00000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d => slice30_y_net_x0,
      en => "1",
      rst => "0",
      q => register1_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d(0) => delay2_q_net_x0,
      en => "1",
      rst => "0",
      q(0) => register3_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 32,
      init_value => b"00000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d => register1_q_net,
      en(0) => logical_y_net,
      rst => "0",
      q => register_q_net_x0
    );

  relational: entity work.relational_770e12e4ab
    port map (
      a => slice22_y_net,
      b => constant_op_net,
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      op(0) => relational_op_net
    );

  slice22: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 31,
      x_width => 32,
      y_width => 32
    )
    port map (
      x => slice31_y_net_x0,
      y => slice22_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/XAUI0"

entity xaui0_entity_73db2e8bdf is
  port (
    rx_get: in std_logic; 
    rx_reset: in std_logic; 
    tx_data: in std_logic_vector(63 downto 0); 
    tx_outofband: in std_logic_vector(7 downto 0); 
    tx_valid: in std_logic; 
    convert_rx_get_x0: out std_logic; 
    convert_rx_reset_x0: out std_logic; 
    convert_tx_data_x0: out std_logic_vector(63 downto 0); 
    convert_tx_outofband_x0: out std_logic_vector(7 downto 0); 
    convert_tx_valid_x0: out std_logic
  );
end xaui0_entity_73db2e8bdf;

architecture structural of xaui0_entity_73db2e8bdf is
  signal concat2_y_net_x0: std_logic_vector(7 downto 0);
  signal constant4_op_net_x0: std_logic;
  signal constant5_op_net_x0: std_logic;
  signal convert_rx_get_dout_net_x0: std_logic;
  signal convert_rx_reset_dout_net_x0: std_logic;
  signal convert_tx_data_dout_net_x0: std_logic_vector(63 downto 0);
  signal convert_tx_outofband_dout_net_x0: std_logic_vector(7 downto 0);
  signal convert_tx_valid_dout_net_x0: std_logic;
  signal logical1_y_net_x0: std_logic;
  signal mux1_y_net_x0: std_logic_vector(63 downto 0);

begin
  constant4_op_net_x0 <= rx_get;
  constant5_op_net_x0 <= rx_reset;
  mux1_y_net_x0 <= tx_data;
  concat2_y_net_x0 <= tx_outofband;
  logical1_y_net_x0 <= tx_valid;
  convert_rx_get_x0 <= convert_rx_get_dout_net_x0;
  convert_rx_reset_x0 <= convert_rx_reset_dout_net_x0;
  convert_tx_data_x0 <= convert_tx_data_dout_net_x0;
  convert_tx_outofband_x0 <= convert_tx_outofband_dout_net_x0;
  convert_tx_valid_x0 <= convert_tx_valid_dout_net_x0;

  convert_rx_get: entity work.xlconvert
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
      din(0) => constant4_op_net_x0,
      dout(0) => convert_rx_get_dout_net_x0
    );

  convert_rx_reset: entity work.xlconvert
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
      din(0) => constant5_op_net_x0,
      dout(0) => convert_rx_reset_dout_net_x0
    );

  convert_tx_data: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 64,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 64,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => mux1_y_net_x0,
      dout => convert_tx_data_dout_net_x0
    );

  convert_tx_outofband: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 8,
      dout_arith => 1,
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
      din => concat2_y_net_x0,
      dout => convert_tx_outofband_dout_net_x0
    );

  convert_tx_valid: entity work.xlconvert
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
      din(0) => logical1_y_net_x0,
      dout(0) => convert_tx_valid_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/adc0/conv"

entity conv_entity_d89aa5f94d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(7 downto 0); 
    out1: out std_logic_vector(7 downto 0)
  );
end conv_entity_d89aa5f94d;

architecture structural of conv_entity_d89aa5f94d is
  signal ce_1_sg_x1: std_logic;
  signal clk_1_sg_x1: std_logic;
  signal concat_y_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_datai0_net_x0: std_logic_vector(7 downto 0);
  signal inverter_op_net: std_logic;
  signal reinterpret_output_port_net_x0: std_logic_vector(7 downto 0);
  signal slice1_y_net: std_logic_vector(6 downto 0);
  signal slice_y_net: std_logic;

begin
  ce_1_sg_x1 <= ce_1;
  clk_1_sg_x1 <= clk_1;
  i_128w_2k_10_r310iadc_adc0_user_datai0_net_x0 <= in1;
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
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
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
      x => i_128w_2k_10_r310iadc_adc0_user_datai0_net_x0,
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
      x => i_128w_2k_10_r310iadc_adc0_user_datai0_net_x0,
      y => slice1_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/adc0"

entity adc0_entity_6b78fa1b53 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_datai0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_datai2: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_dataq0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_dataq2: in std_logic_vector(7 downto 0); 
    i0: out std_logic_vector(7 downto 0); 
    i2: out std_logic_vector(7 downto 0); 
    q0: out std_logic_vector(7 downto 0); 
    q2: out std_logic_vector(7 downto 0)
  );
end adc0_entity_6b78fa1b53;

architecture structural of adc0_entity_6b78fa1b53 is
  signal ce_1_sg_x5: std_logic;
  signal clk_1_sg_x5: std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_datai0_net_x1: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_datai2_net_x1: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_dataq0_net_x1: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_dataq2_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x6: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x7: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x5 <= ce_1;
  clk_1_sg_x5 <= clk_1;
  i_128w_2k_10_r310iadc_adc0_user_datai0_net_x1 <= i_128w_2k_10_r310iadc_adc0_user_datai0;
  i_128w_2k_10_r310iadc_adc0_user_datai2_net_x1 <= i_128w_2k_10_r310iadc_adc0_user_datai2;
  i_128w_2k_10_r310iadc_adc0_user_dataq0_net_x1 <= i_128w_2k_10_r310iadc_adc0_user_dataq0;
  i_128w_2k_10_r310iadc_adc0_user_dataq2_net_x1 <= i_128w_2k_10_r310iadc_adc0_user_dataq2;
  i0 <= reinterpret_output_port_net_x4;
  i2 <= reinterpret_output_port_net_x5;
  q0 <= reinterpret_output_port_net_x6;
  q2 <= reinterpret_output_port_net_x7;

  conv2_459d26ee49: entity work.conv_entity_d89aa5f94d
    port map (
      ce_1 => ce_1_sg_x5,
      clk_1 => clk_1_sg_x5,
      in1 => i_128w_2k_10_r310iadc_adc0_user_datai2_net_x1,
      out1 => reinterpret_output_port_net_x5
    );

  conv4_1872b81cf3: entity work.conv_entity_d89aa5f94d
    port map (
      ce_1 => ce_1_sg_x5,
      clk_1 => clk_1_sg_x5,
      in1 => i_128w_2k_10_r310iadc_adc0_user_dataq0_net_x1,
      out1 => reinterpret_output_port_net_x6
    );

  conv6_c26718c92a: entity work.conv_entity_d89aa5f94d
    port map (
      ce_1 => ce_1_sg_x5,
      clk_1 => clk_1_sg_x5,
      in1 => i_128w_2k_10_r310iadc_adc0_user_dataq2_net_x1,
      out1 => reinterpret_output_port_net_x7
    );

  conv_d89aa5f94d: entity work.conv_entity_d89aa5f94d
    port map (
      ce_1 => ce_1_sg_x5,
      clk_1 => clk_1_sg_x5,
      in1 => i_128w_2k_10_r310iadc_adc0_user_datai0_net_x1,
      out1 => reinterpret_output_port_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/adc1"

entity adc1_entity_a86e20684c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_datai0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_datai2: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_dataq0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_dataq2: in std_logic_vector(7 downto 0); 
    i0: out std_logic_vector(7 downto 0); 
    i2: out std_logic_vector(7 downto 0); 
    q0: out std_logic_vector(7 downto 0); 
    q2: out std_logic_vector(7 downto 0)
  );
end adc1_entity_a86e20684c;

architecture structural of adc1_entity_a86e20684c is
  signal ce_1_sg_x10: std_logic;
  signal clk_1_sg_x10: std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_datai0_net_x1: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_datai2_net_x1: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_dataq0_net_x1: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_dataq2_net_x1: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x6: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x7: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x10 <= ce_1;
  clk_1_sg_x10 <= clk_1;
  i_128w_2k_10_r310iadc_adc1_user_datai0_net_x1 <= i_128w_2k_10_r310iadc_adc1_user_datai0;
  i_128w_2k_10_r310iadc_adc1_user_datai2_net_x1 <= i_128w_2k_10_r310iadc_adc1_user_datai2;
  i_128w_2k_10_r310iadc_adc1_user_dataq0_net_x1 <= i_128w_2k_10_r310iadc_adc1_user_dataq0;
  i_128w_2k_10_r310iadc_adc1_user_dataq2_net_x1 <= i_128w_2k_10_r310iadc_adc1_user_dataq2;
  i0 <= reinterpret_output_port_net_x4;
  i2 <= reinterpret_output_port_net_x5;
  q0 <= reinterpret_output_port_net_x6;
  q2 <= reinterpret_output_port_net_x7;

  conv2_5a02232b79: entity work.conv_entity_d89aa5f94d
    port map (
      ce_1 => ce_1_sg_x10,
      clk_1 => clk_1_sg_x10,
      in1 => i_128w_2k_10_r310iadc_adc1_user_datai2_net_x1,
      out1 => reinterpret_output_port_net_x5
    );

  conv4_311adbe892: entity work.conv_entity_d89aa5f94d
    port map (
      ce_1 => ce_1_sg_x10,
      clk_1 => clk_1_sg_x10,
      in1 => i_128w_2k_10_r310iadc_adc1_user_dataq0_net_x1,
      out1 => reinterpret_output_port_net_x6
    );

  conv6_de927ece5d: entity work.conv_entity_d89aa5f94d
    port map (
      ce_1 => ce_1_sg_x10,
      clk_1 => clk_1_sg_x10,
      in1 => i_128w_2k_10_r310iadc_adc1_user_dataq2_net_x1,
      out1 => reinterpret_output_port_net_x7
    );

  conv_8584cc01e2: entity work.conv_entity_d89aa5f94d
    port map (
      ce_1 => ce_1_sg_x10,
      clk_1 => clk_1_sg_x10,
      in1 => i_128w_2k_10_r310iadc_adc1_user_datai0_net_x1,
      out1 => reinterpret_output_port_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/adc_clip_detect0"

entity adc_clip_detect0_entity_6dd73d58f8 is
  port (
    adc_in: in std_logic_vector(7 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    clip: out std_logic
  );
end adc_clip_detect0_entity_6dd73d58f8;

architecture structural of adc_clip_detect0_entity_6dd73d58f8 is
  signal ce_1_sg_x11: std_logic;
  signal clk_1_sg_x11: std_logic;
  signal constant_op_net: std_logic_vector(16 downto 0);
  signal mult_p_net: std_logic_vector(15 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(7 downto 0);
  signal relational_op_net_x0: std_logic;

begin
  reinterpret_output_port_net_x5 <= adc_in;
  ce_1_sg_x11 <= ce_1;
  clk_1_sg_x11 <= clk_1;
  clip <= relational_op_net_x0;

  constant_x0: entity work.constant_75c298d4bc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_9f8f470cd40e41c7",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => reinterpret_output_port_net_x5,
      b => reinterpret_output_port_net_x5,
      ce => ce_1_sg_x11,
      clk => clk_1_sg_x11,
      clr => '0',
      core_ce => ce_1_sg_x11,
      core_clk => clk_1_sg_x11,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net
    );

  relational: entity work.relational_93c11c0f86
    port map (
      a => mult_p_net,
      b => constant_op_net,
      ce => ce_1_sg_x11,
      clk => clk_1_sg_x11,
      clr => '0',
      op(0) => relational_op_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/ant_base_offset_ctrl"

entity ant_base_offset_ctrl_entity_10120a026d is
  port (
    addr_in: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(31 downto 0); 
    valid_in: in std_logic; 
    data_out: out std_logic_vector(31 downto 0)
  );
end ant_base_offset_ctrl_entity_10120a026d;

architecture structural of ant_base_offset_ctrl_entity_10120a026d is
  signal ce_1_sg_x19: std_logic;
  signal clk_1_sg_x19: std_logic;
  signal constant_op_net: std_logic_vector(31 downto 0);
  signal delay2_q_net_x1: std_logic;
  signal logical_y_net: std_logic;
  signal register1_q_net: std_logic_vector(31 downto 0);
  signal register3_q_net: std_logic;
  signal register_q_net_x0: std_logic_vector(31 downto 0);
  signal relational_op_net: std_logic;
  signal slice22_y_net: std_logic_vector(31 downto 0);
  signal slice30_y_net_x1: std_logic_vector(31 downto 0);
  signal slice31_y_net_x1: std_logic_vector(31 downto 0);

begin
  slice31_y_net_x1 <= addr_in;
  ce_1_sg_x19 <= ce_1;
  clk_1_sg_x19 <= clk_1;
  slice30_y_net_x1 <= data_in;
  delay2_q_net_x1 <= valid_in;
  data_out <= register_q_net_x0;

  constant_x0: entity work.constant_49a4ecb7de
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => register3_q_net,
      y(0) => logical_y_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 32,
      init_value => b"00000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x19,
      clk => clk_1_sg_x19,
      d => slice30_y_net_x1,
      en => "1",
      rst => "0",
      q => register1_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x19,
      clk => clk_1_sg_x19,
      d(0) => delay2_q_net_x1,
      en => "1",
      rst => "0",
      q(0) => register3_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 32,
      init_value => b"00000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x19,
      clk => clk_1_sg_x19,
      d => register1_q_net,
      en(0) => logical_y_net,
      rst => "0",
      q => register_q_net_x0
    );

  relational: entity work.relational_770e12e4ab
    port map (
      a => slice22_y_net,
      b => constant_op_net,
      ce => ce_1_sg_x19,
      clk => clk_1_sg_x19,
      clr => '0',
      op(0) => relational_op_net
    );

  slice22: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 31,
      x_width => 32,
      y_width => 32
    )
    port map (
      x => slice31_y_net_x1,
      y => slice22_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/c_to_ri"

entity c_to_ri_entity_2485354a01 is
  port (
    c: in std_logic_vector(35 downto 0); 
    im: out std_logic_vector(17 downto 0); 
    re: out std_logic_vector(17 downto 0)
  );
end c_to_ri_entity_2485354a01;

architecture structural of c_to_ri_entity_2485354a01 is
  signal concat_y_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(17 downto 0);
  signal slice_im_y_net: std_logic_vector(17 downto 0);
  signal slice_re_y_net: std_logic_vector(17 downto 0);

begin
  concat_y_net_x0 <= c;
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
      x => concat_y_net_x0,
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
      x => concat_y_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/calc_adc_sum_sq0"

entity calc_adc_sum_sq0_entity_5605c0c0f9 is
  port (
    accum_rst: in std_logic; 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol_in: in std_logic_vector(7 downto 0); 
    sum_sq: out std_logic_vector(31 downto 0)
  );
end calc_adc_sum_sq0_entity_5605c0c0f9;

architecture structural of calc_adc_sum_sq0_entity_5605c0c0f9 is
  signal accumulator_q_net: std_logic_vector(31 downto 0);
  signal ce_1_sg_x20: std_logic;
  signal clk_1_sg_x20: std_logic;
  signal edge_op_y_net_x0: std_logic;
  signal mult_p_net: std_logic_vector(15 downto 0);
  signal register_q_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net_x6: std_logic_vector(7 downto 0);

begin
  edge_op_y_net_x0 <= accum_rst;
  ce_1_sg_x20 <= ce_1;
  clk_1_sg_x20 <= clk_1;
  reinterpret_output_port_net_x6 <= pol_in;
  sum_sq <= register_q_net_x0;

  accumulator: entity work.accum_558edb08eb
    port map (
      b => mult_p_net,
      ce => ce_1_sg_x20,
      clk => clk_1_sg_x20,
      clr => '0',
      rst(0) => edge_op_y_net_x0,
      q => accumulator_q_net
    );

  mult: entity work.mult_98e3c7048f
    port map (
      a => reinterpret_output_port_net_x6,
      b => reinterpret_output_port_net_x6,
      ce => ce_1_sg_x20,
      clk => clk_1_sg_x20,
      clr => '0',
      p => mult_p_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 32,
      init_value => b"00000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x20,
      clk => clk_1_sg_x20,
      d => accumulator_q_net,
      en(0) => edge_op_y_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/dbuf_ct_sram_fft_2x/addrMaker_real"

entity addrmaker_real_entity_865eab7ef4 is
  port (
    counter: in std_logic_vector(17 downto 0); 
    readaddr: out std_logic_vector(17 downto 0)
  );
end addrmaker_real_entity_865eab7ef4;

architecture structural of addrmaker_real_entity_865eab7ef4 is
  signal concat_y_net_x0: std_logic_vector(17 downto 0);
  signal slice1_y_net_x0: std_logic_vector(9 downto 0);
  signal slice1_y_net_x1: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(7 downto 0);

begin
  slice1_y_net_x1 <= counter;
  readaddr <= concat_y_net_x0;

  concat: entity work.concat_b27e09722b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => slice_y_net,
      in1 => slice1_y_net_x0,
      y => concat_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 18,
      y_width => 8
    )
    port map (
      x => slice1_y_net_x1,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 17,
      x_width => 18,
      y_width => 10
    )
    port map (
      x => slice1_y_net_x1,
      y => slice1_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/dbuf_ct_sram_fft_2x/sram"

entity sram_entity_96bf684593 is
  port (
    address: in std_logic_vector(17 downto 0); 
    be: in std_logic_vector(3 downto 0); 
    data_in: in std_logic_vector(31 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out: in std_logic_vector(35 downto 0); 
    we: in std_logic; 
    convert_address_x0: out std_logic_vector(18 downto 0); 
    convert_be_x0: out std_logic_vector(3 downto 0); 
    convert_we_x0: out std_logic; 
    data_out: out std_logic_vector(35 downto 0); 
    reinterpret_x0: out std_logic_vector(35 downto 0)
  );
end sram_entity_96bf684593;

architecture structural of sram_entity_96bf684593 is
  signal constant_op_net_x0: std_logic_vector(3 downto 0);
  signal convert_address_dout_net_x0: std_logic_vector(18 downto 0);
  signal convert_be_dout_net_x0: std_logic_vector(3 downto 0);
  signal convert_data_in_dout_net: std_logic_vector(35 downto 0);
  signal convert_we_dout_net_x0: std_logic;
  signal force_data_out_output_port_net_x0: std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out_net_x0: std_logic_vector(35 downto 0);
  signal inverter_op_net_x0: std_logic;
  signal mux1_y_net_x1: std_logic_vector(17 downto 0);
  signal mux1_y_net_x2: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(35 downto 0);
  signal simulation_multiplexer_dout_net: std_logic_vector(35 downto 0);

begin
  mux1_y_net_x1 <= address;
  constant_op_net_x0 <= be;
  mux1_y_net_x2 <= data_in;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out_net_x0 <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out;
  inverter_op_net_x0 <= we;
  convert_address_x0 <= convert_address_dout_net_x0;
  convert_be_x0 <= convert_be_dout_net_x0;
  convert_we_x0 <= convert_we_dout_net_x0;
  data_out <= force_data_out_output_port_net_x0;
  reinterpret_x0 <= reinterpret_output_port_net_x0;

  convert_address: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
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
      din => mux1_y_net_x1,
      dout => convert_address_dout_net_x0
    );

  convert_be: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 4,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 4,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => constant_op_net_x0,
      dout => convert_be_dout_net_x0
    );

  convert_data_in: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 36,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => mux1_y_net_x2,
      dout => convert_data_in_dout_net
    );

  convert_we: entity work.xlconvert
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
      din(0) => inverter_op_net_x0,
      dout(0) => convert_we_dout_net_x0
    );

  force_data_out: entity work.reinterpret_86b044698f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => simulation_multiplexer_dout_net,
      output_port => force_data_out_output_port_net_x0
    );

  reinterpret: entity work.reinterpret_86b044698f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_data_in_dout_net,
      output_port => reinterpret_output_port_net_x0
    );

  simulation_multiplexer: entity work.xlpassthrough
    generic map (
      din_width => 36,
      dout_width => 36
    )
    port map (
      din => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out_net_x0,
      dout => simulation_multiplexer_dout_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/dbuf_ct_sram_fft_2x/sram1"

entity sram1_entity_2ed5a81e0d is
  port (
    address: in std_logic_vector(17 downto 0); 
    be: in std_logic_vector(3 downto 0); 
    data_in: in std_logic_vector(31 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out: in std_logic_vector(35 downto 0); 
    we: in std_logic; 
    convert_address_x0: out std_logic_vector(18 downto 0); 
    convert_be_x0: out std_logic_vector(3 downto 0); 
    convert_we_x0: out std_logic; 
    data_out: out std_logic_vector(35 downto 0); 
    reinterpret_x0: out std_logic_vector(35 downto 0)
  );
end sram1_entity_2ed5a81e0d;

architecture structural of sram1_entity_2ed5a81e0d is
  signal constant1_op_net_x0: std_logic_vector(3 downto 0);
  signal convert_address_dout_net_x0: std_logic_vector(18 downto 0);
  signal convert_be_dout_net_x0: std_logic_vector(3 downto 0);
  signal convert_data_in_dout_net: std_logic_vector(35 downto 0);
  signal convert_we_dout_net_x0: std_logic;
  signal force_data_out_output_port_net_x0: std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out_net_x0: std_logic_vector(35 downto 0);
  signal mux1_y_net_x3: std_logic_vector(31 downto 0);
  signal mux2_y_net_x0: std_logic_vector(17 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(35 downto 0);
  signal simulation_multiplexer_dout_net: std_logic_vector(35 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  mux2_y_net_x0 <= address;
  constant1_op_net_x0 <= be;
  mux1_y_net_x3 <= data_in;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out_net_x0 <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out;
  slice_y_net_x0 <= we;
  convert_address_x0 <= convert_address_dout_net_x0;
  convert_be_x0 <= convert_be_dout_net_x0;
  convert_we_x0 <= convert_we_dout_net_x0;
  data_out <= force_data_out_output_port_net_x0;
  reinterpret_x0 <= reinterpret_output_port_net_x0;

  convert_address: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 18,
      dout_arith => 1,
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
      din => mux2_y_net_x0,
      dout => convert_address_dout_net_x0
    );

  convert_be: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 4,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 4,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => constant1_op_net_x0,
      dout => convert_be_dout_net_x0
    );

  convert_data_in: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 36,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => mux1_y_net_x3,
      dout => convert_data_in_dout_net
    );

  convert_we: entity work.xlconvert
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
      din(0) => slice_y_net_x0,
      dout(0) => convert_we_dout_net_x0
    );

  force_data_out: entity work.reinterpret_86b044698f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => simulation_multiplexer_dout_net,
      output_port => force_data_out_output_port_net_x0
    );

  reinterpret: entity work.reinterpret_86b044698f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_data_in_dout_net,
      output_port => reinterpret_output_port_net_x0
    );

  simulation_multiplexer: entity work.xlpassthrough
    generic map (
      din_width => 36,
      dout_width => 36
    )
    port map (
      din => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out_net_x0,
      dout => simulation_multiplexer_dout_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/dbuf_ct_sram_fft_2x/sync_delay1"

entity sync_delay1_entity_19a5e8437d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay1_entity_19a5e8437d;

architecture structural of sync_delay1_entity_19a5e8437d is
  signal ce_1_sg_x28: std_logic;
  signal clk_1_sg_x28: std_logic;
  signal constant1_op_net: std_logic_vector(18 downto 0);
  signal constant2_op_net: std_logic_vector(18 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(18 downto 0);
  signal counter_op_net: std_logic_vector(18 downto 0);
  signal delay4_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x0: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x28 <= ce_1;
  clk_1_sg_x28 <= clk_1;
  delay4_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x0;

  constant1: entity work.constant_b366689086
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_d32cd47ecf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_4709ea49b5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_8b4ef4e135e1e3f1",
      op_arith => xlUnsigned,
      op_width => 19
    )
    port map (
      ce => ce_1_sg_x28,
      clk => clk_1_sg_x28,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay4_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay4_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay4_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x0
    );

  relational: entity work.relational_0f2716ddb5
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_502d6cf7c0
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/dbuf_ct_sram_fft_2x"

entity dbuf_ct_sram_fft_2x_entity_1e967dd41a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out: in std_logic_vector(35 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out: in std_logic_vector(35 downto 0); 
    sync_in: in std_logic; 
    out_x0: out std_logic_vector(31 downto 0); 
    sram: out std_logic_vector(35 downto 0); 
    sram1: out std_logic_vector(35 downto 0); 
    sram1_x0: out std_logic_vector(18 downto 0); 
    sram1_x1: out std_logic_vector(3 downto 0); 
    sram1_x2: out std_logic; 
    sram_x0: out std_logic_vector(18 downto 0); 
    sram_x1: out std_logic_vector(3 downto 0); 
    sram_x2: out std_logic; 
    sync_out: out std_logic
  );
end dbuf_ct_sram_fft_2x_entity_1e967dd41a;

architecture structural of dbuf_ct_sram_fft_2x_entity_1e967dd41a is
  signal ce_1_sg_x29: std_logic;
  signal clk_1_sg_x29: std_logic;
  signal concat_y_net_x0: std_logic_vector(17 downto 0);
  signal constant1_op_net_x0: std_logic_vector(3 downto 0);
  signal constant_op_net_x0: std_logic_vector(3 downto 0);
  signal convert_address_dout_net_x2: std_logic_vector(18 downto 0);
  signal convert_address_dout_net_x3: std_logic_vector(18 downto 0);
  signal convert_be_dout_net_x2: std_logic_vector(3 downto 0);
  signal convert_be_dout_net_x3: std_logic_vector(3 downto 0);
  signal convert_we_dout_net_x2: std_logic;
  signal convert_we_dout_net_x3: std_logic;
  signal counter_op_net: std_logic_vector(18 downto 0);
  signal delay4_q_net_x1: std_logic;
  signal delay_q_net: std_logic;
  signal force_data_out_output_port_net_x0: std_logic_vector(35 downto 0);
  signal force_data_out_output_port_net_x1: std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out_net_x1: std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out_net_x1: std_logic_vector(35 downto 0);
  signal inverter_op_net_x0: std_logic;
  signal mux1_y_net_x1: std_logic_vector(17 downto 0);
  signal mux1_y_net_x4: std_logic_vector(31 downto 0);
  signal mux2_y_net_x0: std_logic_vector(17 downto 0);
  signal mux_y_net: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic;
  signal reinterpret_output_port_net_x2: std_logic_vector(35 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(35 downto 0);
  signal slice1_y_net_x1: std_logic_vector(17 downto 0);
  signal slice2_y_net_x0: std_logic_vector(31 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x29 <= ce_1;
  clk_1_sg_x29 <= clk_1;
  mux1_y_net_x4 <= din;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out_net_x1 <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out_net_x1 <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out;
  delay4_q_net_x1 <= sync_in;
  out_x0 <= slice2_y_net_x0;
  sram <= reinterpret_output_port_net_x2;
  sram1 <= reinterpret_output_port_net_x3;
  sram1_x0 <= convert_address_dout_net_x3;
  sram1_x1 <= convert_be_dout_net_x3;
  sram1_x2 <= convert_we_dout_net_x3;
  sram_x0 <= convert_address_dout_net_x2;
  sram_x1 <= convert_be_dout_net_x2;
  sram_x2 <= convert_we_dout_net_x2;
  sync_out <= mux_y_net_x1;

  addrmaker_real_865eab7ef4: entity work.addrmaker_real_entity_865eab7ef4
    port map (
      counter => slice1_y_net_x1,
      readaddr => concat_y_net_x0
    );

  constant1: entity work.constant_06590e4008
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net_x0
    );

  constant_x0: entity work.constant_06590e4008
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net_x0
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_2ccd4f2322b1fa6a",
      op_arith => xlUnsigned,
      op_width => 19
    )
    port map (
      ce => ce_1_sg_x29,
      clk => clk_1_sg_x29,
      clr => '0',
      en => "1",
      rst(0) => delay4_q_net_x1,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x29,
      clk => clk_1_sg_x29,
      d(0) => inverter_op_net_x0,
      en => '1',
      q(0) => delay_q_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x29,
      clk => clk_1_sg_x29,
      clr => '0',
      ip(0) => slice_y_net_x0,
      op(0) => inverter_op_net_x0
    );

  mux: entity work.mux_b75bc1e5be
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => force_data_out_output_port_net_x0,
      d1 => force_data_out_output_port_net_x1,
      sel(0) => delay_q_net,
      y => mux_y_net
    );

  mux1: entity work.mux_42c705c90b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => slice1_y_net_x1,
      d1 => concat_y_net_x0,
      sel(0) => slice_y_net_x0,
      y => mux1_y_net_x1
    );

  mux2: entity work.mux_42c705c90b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => slice1_y_net_x1,
      d1 => concat_y_net_x0,
      sel(0) => inverter_op_net_x0,
      y => mux2_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 18,
      x_width => 19,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 19,
      y_width => 18
    )
    port map (
      x => counter_op_net,
      y => slice1_y_net_x1
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 31,
      x_width => 36,
      y_width => 32
    )
    port map (
      x => mux_y_net,
      y => slice2_y_net_x0
    );

  sram1_2ed5a81e0d: entity work.sram1_entity_2ed5a81e0d
    port map (
      address => mux2_y_net_x0,
      be => constant1_op_net_x0,
      data_in => mux1_y_net_x4,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out_net_x1,
      we => slice_y_net_x0,
      convert_address_x0 => convert_address_dout_net_x3,
      convert_be_x0 => convert_be_dout_net_x3,
      convert_we_x0 => convert_we_dout_net_x3,
      data_out => force_data_out_output_port_net_x1,
      reinterpret_x0 => reinterpret_output_port_net_x3
    );

  sram_96bf684593: entity work.sram_entity_96bf684593
    port map (
      address => mux1_y_net_x1,
      be => constant_op_net_x0,
      data_in => mux1_y_net_x4,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out_net_x1,
      we => inverter_op_net_x0,
      convert_address_x0 => convert_address_dout_net_x2,
      convert_be_x0 => convert_be_dout_net_x2,
      convert_we_x0 => convert_we_dout_net_x2,
      data_out => force_data_out_output_port_net_x0,
      reinterpret_x0 => reinterpret_output_port_net_x2
    );

  sync_delay1_19a5e8437d: entity work.sync_delay1_entity_19a5e8437d
    port map (
      ce_1 => ce_1_sg_x29,
      clk_1 => clk_1_sg_x29,
      in_x0 => delay4_q_net_x1,
      out_x0 => mux_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/edge_detect"

entity edge_detect_entity_8e9c1e46e6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end edge_detect_entity_8e9c1e46e6;

architecture structural of edge_detect_entity_8e9c1e46e6 is
  signal ce_1_sg_x30: std_logic;
  signal clk_1_sg_x30: std_logic;
  signal delay_q_net: std_logic;
  signal edge_op_y_net_x8: std_logic;
  signal inverter_op_net: std_logic;
  signal slice16_y_net_x0: std_logic;

begin
  ce_1_sg_x30 <= ce_1;
  clk_1_sg_x30 <= clk_1;
  slice16_y_net_x0 <= in_x0;
  out_x0 <= edge_op_y_net_x8;

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x30,
      clk => clk_1_sg_x30,
      d(0) => slice16_y_net_x0,
      en => '1',
      q(0) => delay_q_net
    );

  edge_op: entity work.logical_dfe2dded7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => inverter_op_net,
      d1(0) => delay_q_net,
      y(0) => edge_op_y_net_x8
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x30,
      clk => clk_1_sg_x30,
      clr => '0',
      ip(0) => slice16_y_net_x0,
      op(0) => inverter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/eq0/round1"

entity round1_entity_9ec09abb5e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(35 downto 0); 
    scale: in std_logic_vector(17 downto 0); 
    clip: out std_logic; 
    dout: out std_logic_vector(7 downto 0)
  );
end round1_entity_9ec09abb5e;

architecture structural of round1_entity_9ec09abb5e is
  signal ce_1_sg_x31: std_logic;
  signal clk_1_sg_x31: std_logic;
  signal concat1_y_net: std_logic_vector(1 downto 0);
  signal concat2_y_net: std_logic_vector(1 downto 0);
  signal concat_y_net_x0: std_logic_vector(7 downto 0);
  signal constant1_op_net: std_logic_vector(26 downto 0);
  signal constant2_op_net: std_logic_vector(3 downto 0);
  signal constant3_op_net: std_logic_vector(3 downto 0);
  signal constant4_op_net: std_logic_vector(26 downto 0);
  signal constant5_op_net: std_logic_vector(26 downto 0);
  signal constant6_op_net: std_logic_vector(3 downto 0);
  signal constant7_op_net: std_logic_vector(3 downto 0);
  signal constant_op_net: std_logic_vector(26 downto 0);
  signal convert2_dout_net: std_logic_vector(3 downto 0);
  signal convert3_dout_net: std_logic_vector(3 downto 0);
  signal delay11_q_net_x0: std_logic_vector(35 downto 0);
  signal dual_port_ram_douta_net_x0: std_logic_vector(17 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal mult1_p_net: std_logic_vector(35 downto 0);
  signal mult_p_net: std_logic_vector(35 downto 0);
  signal mux1_y_net: std_logic_vector(3 downto 0);
  signal mux_y_net: std_logic_vector(3 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(3 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);
  signal relational1_op_net: std_logic;
  signal relational2_op_net: std_logic;
  signal relational3_op_net: std_logic;
  signal relational_op_net: std_logic;
  signal slice4_y_net: std_logic_vector(17 downto 0);
  signal slice5_y_net: std_logic_vector(17 downto 0);

begin
  ce_1_sg_x31 <= ce_1;
  clk_1_sg_x31 <= clk_1;
  delay11_q_net_x0 <= din;
  dual_port_ram_douta_net_x0 <= scale;
  clip <= logical1_y_net_x0;
  dout <= concat_y_net_x0;

  concat: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret2_output_port_net,
      in1 => reinterpret3_output_port_net,
      y => concat_y_net_x0
    );

  concat1: entity work.concat_32afb77cd2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => relational1_op_net,
      in1(0) => relational_op_net,
      y => concat1_y_net
    );

  concat2: entity work.concat_32afb77cd2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => relational3_op_net,
      in1(0) => relational2_op_net,
      y => concat2_y_net
    );

  constant1: entity work.constant_3d1b04c74c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_a3d619979c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_a629aefb53
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net
    );

  constant4: entity work.constant_3ee5f91fcf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant4_op_net
    );

  constant5: entity work.constant_3d1b04c74c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  constant6: entity work.constant_a3d619979c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant6_op_net
    );

  constant7: entity work.constant_a629aefb53
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant7_op_net
    );

  constant_x0: entity work.constant_3ee5f91fcf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 36,
      dout_arith => 2,
      dout_bin_pt => 3,
      dout_width => 4,
      latency => 2,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      clr => '0',
      din => mult_p_net,
      dout => convert2_dout_net
    );

  convert3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 36,
      dout_arith => 2,
      dout_bin_pt => 3,
      dout_width => 4,
      latency => 2,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      clr => '0',
      din => mult1_p_net,
      dout => convert3_dout_net
    );

  logical1: entity work.logical_127a315f20
    port map (
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => relational1_op_net,
      d2(0) => relational3_op_net,
      d3(0) => relational2_op_net,
      y(0) => logical1_y_net_x0
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 1,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_423ddb9f1e4b69b4",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 17,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => reinterpret_output_port_net,
      b => dual_port_ram_douta_net_x0,
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      clr => '0',
      core_ce => ce_1_sg_x31,
      core_clk => clk_1_sg_x31,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 1,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_423ddb9f1e4b69b4",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 17,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => reinterpret1_output_port_net,
      b => dual_port_ram_douta_net_x0,
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      clr => '0',
      core_ce => ce_1_sg_x31,
      core_clk => clk_1_sg_x31,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net
    );

  mux: entity work.mux_9723c3381b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert2_dout_net,
      d1 => constant2_op_net,
      d2 => constant3_op_net,
      sel => concat1_y_net,
      y => mux_y_net
    );

  mux1: entity work.mux_9723c3381b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert3_dout_net,
      d1 => constant6_op_net,
      d2 => constant7_op_net,
      sel => concat2_y_net,
      y => mux1_y_net
    );

  reinterpret: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice4_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_9a0fa0f632
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice5_y_net,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => mux_y_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_df53fd8fe7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => mux1_y_net,
      output_port => reinterpret3_output_port_net
    );

  relational: entity work.relational_9dd1c0d7bf
    port map (
      a => mult_p_net,
      b => constant_op_net,
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_069cc8477e
    port map (
      a => mult_p_net,
      b => constant1_op_net,
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      clr => '0',
      op(0) => relational1_op_net
    );

  relational2: entity work.relational_9dd1c0d7bf
    port map (
      a => mult1_p_net,
      b => constant4_op_net,
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      clr => '0',
      op(0) => relational2_op_net
    );

  relational3: entity work.relational_069cc8477e
    port map (
      a => mult1_p_net,
      b => constant5_op_net,
      ce => ce_1_sg_x31,
      clk => clk_1_sg_x31,
      clr => '0',
      op(0) => relational3_op_net
    );

  slice4: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 35,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay11_q_net_x0,
      y => slice4_y_net
    );

  slice5: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 36,
      y_width => 18
    )
    port map (
      x => delay11_q_net_x0,
      y => slice5_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/eq0"

entity eq0_entity_91bbc3edb5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(17 downto 0); 
    coeff_addr: in std_logic_vector(5 downto 0); 
    coeff_we: in std_logic; 
    in_x0: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    clip: out std_logic; 
    dout: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic
  );
end eq0_entity_91bbc3edb5;

architecture structural of eq0_entity_91bbc3edb5 is
  signal ce_1_sg_x32: std_logic;
  signal clk_1_sg_x32: std_logic;
  signal concat_y_net_x1: std_logic_vector(35 downto 0);
  signal concat_y_net_x2: std_logic_vector(7 downto 0);
  signal constant4_op_net: std_logic_vector(17 downto 0);
  signal constant5_op_net: std_logic;
  signal counter2_op_net: std_logic_vector(10 downto 0);
  signal delay11_q_net_x0: std_logic_vector(35 downto 0);
  signal delay4_q_net_x2: std_logic;
  signal delay8_q_net_x0: std_logic;
  signal dual_port_ram_douta_net_x0: std_logic_vector(17 downto 0);
  signal logical1_y_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal register1_q_net_x0: std_logic_vector(17 downto 0);
  signal register2_q_net_x0: std_logic_vector(5 downto 0);
  signal slice_y_net: std_logic_vector(5 downto 0);

begin
  ce_1_sg_x32 <= ce_1;
  clk_1_sg_x32 <= clk_1;
  register1_q_net_x0 <= coeff;
  register2_q_net_x0 <= coeff_addr;
  logical_y_net_x0 <= coeff_we;
  concat_y_net_x1 <= in_x0;
  delay8_q_net_x0 <= sync;
  clip <= logical1_y_net_x1;
  dout <= concat_y_net_x2;
  sync_out <= delay4_q_net_x2;

  constant4: entity work.constant_95b0f967bc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant4_op_net
    );

  constant5: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant5_op_net
    );

  counter2: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_d0a204b7c881b521",
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x32,
      clk => clk_1_sg_x32,
      clr => '0',
      en => "1",
      rst(0) => delay8_q_net_x0,
      op => counter2_op_net
    );

  delay11: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x32,
      clk => clk_1_sg_x32,
      d => concat_y_net_x1,
      en => '1',
      q => delay11_q_net_x0
    );

  delay4: entity work.xldelay
    generic map (
      latency => 5,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x32,
      clk => clk_1_sg_x32,
      d(0) => delay8_q_net_x0,
      en => '1',
      q(0) => delay4_q_net_x2
    );

  dual_port_ram: entity work.xldpram
    generic map (
      c_address_width_a => 6,
      c_address_width_b => 6,
      c_width_a => 18,
      c_width_b => 18,
      core_name0 => "dual_port_block_memory_virtex2p_6_1_645b5e379b337a9f",
      latency => 1
    )
    port map (
      a_ce => ce_1_sg_x32,
      a_clk => clk_1_sg_x32,
      addra => slice_y_net,
      addrb => register2_q_net_x0,
      b_ce => ce_1_sg_x32,
      b_clk => clk_1_sg_x32,
      dina => constant4_op_net,
      dinb => register1_q_net_x0,
      ena => "1",
      enb => "1",
      rsta => "0",
      rstb => "0",
      wea(0) => constant5_op_net,
      web(0) => logical_y_net_x0,
      douta => dual_port_ram_douta_net_x0
    );

  round1_9ec09abb5e: entity work.round1_entity_9ec09abb5e
    port map (
      ce_1 => ce_1_sg_x32,
      clk_1 => clk_1_sg_x32,
      din => delay11_q_net_x0,
      scale => dual_port_ram_douta_net_x0,
      clip => logical1_y_net_x1,
      dout => concat_y_net_x2
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 5,
      new_msb => 10,
      x_width => 11,
      y_width => 6
    )
    port map (
      x => counter2_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/eq1"

entity eq1_entity_9996d1cf51 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(17 downto 0); 
    coeff_addr: in std_logic_vector(5 downto 0); 
    coeff_we: in std_logic; 
    in_x0: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    clip: out std_logic; 
    dout: out std_logic_vector(7 downto 0)
  );
end eq1_entity_9996d1cf51;

architecture structural of eq1_entity_9996d1cf51 is
  signal ce_1_sg_x34: std_logic;
  signal clk_1_sg_x34: std_logic;
  signal concat_y_net_x1: std_logic_vector(35 downto 0);
  signal concat_y_net_x2: std_logic_vector(7 downto 0);
  signal constant4_op_net: std_logic_vector(17 downto 0);
  signal constant5_op_net: std_logic;
  signal counter2_op_net: std_logic_vector(10 downto 0);
  signal delay11_q_net_x0: std_logic_vector(35 downto 0);
  signal delay8_q_net_x1: std_logic;
  signal dual_port_ram_douta_net_x0: std_logic_vector(17 downto 0);
  signal logical1_y_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal register1_q_net_x0: std_logic_vector(17 downto 0);
  signal register2_q_net_x0: std_logic_vector(5 downto 0);
  signal slice_y_net: std_logic_vector(5 downto 0);

begin
  ce_1_sg_x34 <= ce_1;
  clk_1_sg_x34 <= clk_1;
  register1_q_net_x0 <= coeff;
  register2_q_net_x0 <= coeff_addr;
  logical_y_net_x0 <= coeff_we;
  concat_y_net_x1 <= in_x0;
  delay8_q_net_x1 <= sync;
  clip <= logical1_y_net_x1;
  dout <= concat_y_net_x2;

  constant4: entity work.constant_95b0f967bc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant4_op_net
    );

  constant5: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant5_op_net
    );

  counter2: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_d0a204b7c881b521",
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      clr => '0',
      en => "1",
      rst(0) => delay8_q_net_x1,
      op => counter2_op_net
    );

  delay11: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x34,
      clk => clk_1_sg_x34,
      d => concat_y_net_x1,
      en => '1',
      q => delay11_q_net_x0
    );

  dual_port_ram: entity work.xldpram
    generic map (
      c_address_width_a => 6,
      c_address_width_b => 6,
      c_width_a => 18,
      c_width_b => 18,
      core_name0 => "dual_port_block_memory_virtex2p_6_1_645b5e379b337a9f",
      latency => 1
    )
    port map (
      a_ce => ce_1_sg_x34,
      a_clk => clk_1_sg_x34,
      addra => slice_y_net,
      addrb => register2_q_net_x0,
      b_ce => ce_1_sg_x34,
      b_clk => clk_1_sg_x34,
      dina => constant4_op_net,
      dinb => register1_q_net_x0,
      ena => "1",
      enb => "1",
      rsta => "0",
      rstb => "0",
      wea(0) => constant5_op_net,
      web(0) => logical_y_net_x0,
      douta => dual_port_ram_douta_net_x0
    );

  round1_623fd7c0b2: entity work.round1_entity_9ec09abb5e
    port map (
      ce_1 => ce_1_sg_x34,
      clk_1 => clk_1_sg_x34,
      din => delay11_q_net_x0,
      scale => dual_port_ram_douta_net_x0,
      clip => logical1_y_net_x1,
      dout => concat_y_net_x2
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 5,
      new_msb => 10,
      x_width => 11,
      y_width => 6
    )
    port map (
      x => counter2_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/eq_coeff0"

entity eq_coeff0_entity_ffee26f807 is
  port (
    addr_in: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(17 downto 0); 
    valid_in: in std_logic; 
    addr_out: out std_logic_vector(5 downto 0); 
    data_out: out std_logic_vector(17 downto 0); 
    valid_out: out std_logic
  );
end eq_coeff0_entity_ffee26f807;

architecture structural of eq_coeff0_entity_ffee26f807 is
  signal ce_1_sg_x39: std_logic;
  signal clk_1_sg_x39: std_logic;
  signal constant_op_net: std_logic_vector(25 downto 0);
  signal delay2_q_net_x2: std_logic;
  signal logical_y_net_x1: std_logic;
  signal register1_q_net_x1: std_logic_vector(17 downto 0);
  signal register2_q_net_x1: std_logic_vector(5 downto 0);
  signal register3_q_net: std_logic;
  signal relational_op_net: std_logic;
  signal slice22_y_net_x0: std_logic_vector(25 downto 0);
  signal slice22_y_net_x1: std_logic_vector(17 downto 0);
  signal slice31_y_net_x2: std_logic_vector(31 downto 0);
  signal slice9_y_net: std_logic_vector(5 downto 0);

begin
  slice31_y_net_x2 <= addr_in;
  ce_1_sg_x39 <= ce_1;
  clk_1_sg_x39 <= clk_1;
  slice22_y_net_x1 <= data_in;
  delay2_q_net_x2 <= valid_in;
  addr_out <= register2_q_net_x1;
  data_out <= register1_q_net_x1;
  valid_out <= logical_y_net_x1;

  constant_x0: entity work.constant_02482c963a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => register3_q_net,
      y(0) => logical_y_net_x1
    );

  register1: entity work.xlregister
    generic map (
      d_width => 18,
      init_value => b"000000000000000000"
    )
    port map (
      ce => ce_1_sg_x39,
      clk => clk_1_sg_x39,
      d => slice22_y_net_x1,
      en => "1",
      rst => "0",
      q => register1_q_net_x1
    );

  register2: entity work.xlregister
    generic map (
      d_width => 6,
      init_value => b"000000"
    )
    port map (
      ce => ce_1_sg_x39,
      clk => clk_1_sg_x39,
      d => slice9_y_net,
      en => "1",
      rst => "0",
      q => register2_q_net_x1
    );

  register3: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x39,
      clk => clk_1_sg_x39,
      d(0) => delay2_q_net_x2,
      en => "1",
      rst => "0",
      q(0) => register3_q_net
    );

  relational: entity work.relational_0c4cc9dc89
    port map (
      a => slice22_y_net_x0,
      b => constant_op_net,
      ce => ce_1_sg_x39,
      clk => clk_1_sg_x39,
      clr => '0',
      op(0) => relational_op_net
    );

  slice22: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 31,
      x_width => 32,
      y_width => 26
    )
    port map (
      x => slice31_y_net_x2,
      y => slice22_y_net_x0
    );

  slice9: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 5,
      x_width => 32,
      y_width => 6
    )
    port map (
      x => slice31_y_net_x2,
      y => slice9_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/eq_coeff1"

entity eq_coeff1_entity_3a84f6aa4b is
  port (
    addr_in: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(17 downto 0); 
    valid_in: in std_logic; 
    addr_out: out std_logic_vector(5 downto 0); 
    data_out: out std_logic_vector(17 downto 0); 
    valid_out: out std_logic
  );
end eq_coeff1_entity_3a84f6aa4b;

architecture structural of eq_coeff1_entity_3a84f6aa4b is
  signal ce_1_sg_x40: std_logic;
  signal clk_1_sg_x40: std_logic;
  signal constant_op_net: std_logic_vector(25 downto 0);
  signal delay2_q_net_x3: std_logic;
  signal logical_y_net_x1: std_logic;
  signal register1_q_net_x1: std_logic_vector(17 downto 0);
  signal register2_q_net_x1: std_logic_vector(5 downto 0);
  signal register3_q_net: std_logic;
  signal relational_op_net: std_logic;
  signal slice1_y_net_x0: std_logic_vector(17 downto 0);
  signal slice22_y_net: std_logic_vector(25 downto 0);
  signal slice31_y_net_x3: std_logic_vector(31 downto 0);
  signal slice9_y_net: std_logic_vector(5 downto 0);

begin
  slice31_y_net_x3 <= addr_in;
  ce_1_sg_x40 <= ce_1;
  clk_1_sg_x40 <= clk_1;
  slice1_y_net_x0 <= data_in;
  delay2_q_net_x3 <= valid_in;
  addr_out <= register2_q_net_x1;
  data_out <= register1_q_net_x1;
  valid_out <= logical_y_net_x1;

  constant_x0: entity work.constant_e3183ab609
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => register3_q_net,
      y(0) => logical_y_net_x1
    );

  register1: entity work.xlregister
    generic map (
      d_width => 18,
      init_value => b"000000000000000000"
    )
    port map (
      ce => ce_1_sg_x40,
      clk => clk_1_sg_x40,
      d => slice1_y_net_x0,
      en => "1",
      rst => "0",
      q => register1_q_net_x1
    );

  register2: entity work.xlregister
    generic map (
      d_width => 6,
      init_value => b"000000"
    )
    port map (
      ce => ce_1_sg_x40,
      clk => clk_1_sg_x40,
      d => slice9_y_net,
      en => "1",
      rst => "0",
      q => register2_q_net_x1
    );

  register3: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x40,
      clk => clk_1_sg_x40,
      d(0) => delay2_q_net_x3,
      en => "1",
      rst => "0",
      q(0) => register3_q_net
    );

  relational: entity work.relational_0c4cc9dc89
    port map (
      a => slice22_y_net,
      b => constant_op_net,
      ce => ce_1_sg_x40,
      clk => clk_1_sg_x40,
      clr => '0',
      op(0) => relational_op_net
    );

  slice22: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 31,
      x_width => 32,
      y_width => 26
    )
    port map (
      x => slice31_y_net_x3,
      y => slice22_y_net
    );

  slice9: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 5,
      x_width => 32,
      y_width => 6
    )
    port map (
      x => slice31_y_net_x3,
      y => slice9_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/eq_coeff2"

entity eq_coeff2_entity_6d9d4ed2cd is
  port (
    addr_in: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(17 downto 0); 
    valid_in: in std_logic; 
    addr_out: out std_logic_vector(5 downto 0); 
    data_out: out std_logic_vector(17 downto 0); 
    valid_out: out std_logic
  );
end eq_coeff2_entity_6d9d4ed2cd;

architecture structural of eq_coeff2_entity_6d9d4ed2cd is
  signal ce_1_sg_x41: std_logic;
  signal clk_1_sg_x41: std_logic;
  signal constant_op_net: std_logic_vector(25 downto 0);
  signal delay2_q_net_x4: std_logic;
  signal logical_y_net_x1: std_logic;
  signal register1_q_net_x1: std_logic_vector(17 downto 0);
  signal register2_q_net_x1: std_logic_vector(5 downto 0);
  signal register3_q_net: std_logic;
  signal relational_op_net: std_logic;
  signal slice22_y_net: std_logic_vector(25 downto 0);
  signal slice2_y_net_x0: std_logic_vector(17 downto 0);
  signal slice31_y_net_x4: std_logic_vector(31 downto 0);
  signal slice9_y_net: std_logic_vector(5 downto 0);

begin
  slice31_y_net_x4 <= addr_in;
  ce_1_sg_x41 <= ce_1;
  clk_1_sg_x41 <= clk_1;
  slice2_y_net_x0 <= data_in;
  delay2_q_net_x4 <= valid_in;
  addr_out <= register2_q_net_x1;
  data_out <= register1_q_net_x1;
  valid_out <= logical_y_net_x1;

  constant_x0: entity work.constant_7cfb67ea50
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => register3_q_net,
      y(0) => logical_y_net_x1
    );

  register1: entity work.xlregister
    generic map (
      d_width => 18,
      init_value => b"000000000000000000"
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      d => slice2_y_net_x0,
      en => "1",
      rst => "0",
      q => register1_q_net_x1
    );

  register2: entity work.xlregister
    generic map (
      d_width => 6,
      init_value => b"000000"
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      d => slice9_y_net,
      en => "1",
      rst => "0",
      q => register2_q_net_x1
    );

  register3: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      d(0) => delay2_q_net_x4,
      en => "1",
      rst => "0",
      q(0) => register3_q_net
    );

  relational: entity work.relational_0c4cc9dc89
    port map (
      a => slice22_y_net,
      b => constant_op_net,
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      clr => '0',
      op(0) => relational_op_net
    );

  slice22: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 31,
      x_width => 32,
      y_width => 26
    )
    port map (
      x => slice31_y_net_x4,
      y => slice22_y_net
    );

  slice9: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 5,
      x_width => 32,
      y_width => 6
    )
    port map (
      x => slice31_y_net_x4,
      y => slice9_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/eq_coeff3"

entity eq_coeff3_entity_34fd4ccc34 is
  port (
    addr_in: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(17 downto 0); 
    valid_in: in std_logic; 
    addr_out: out std_logic_vector(5 downto 0); 
    data_out: out std_logic_vector(17 downto 0); 
    valid_out: out std_logic
  );
end eq_coeff3_entity_34fd4ccc34;

architecture structural of eq_coeff3_entity_34fd4ccc34 is
  signal ce_1_sg_x42: std_logic;
  signal clk_1_sg_x42: std_logic;
  signal constant_op_net: std_logic_vector(25 downto 0);
  signal delay2_q_net_x5: std_logic;
  signal logical_y_net_x1: std_logic;
  signal register1_q_net_x1: std_logic_vector(17 downto 0);
  signal register2_q_net_x1: std_logic_vector(5 downto 0);
  signal register3_q_net: std_logic;
  signal relational_op_net: std_logic;
  signal slice22_y_net: std_logic_vector(25 downto 0);
  signal slice31_y_net_x5: std_logic_vector(31 downto 0);
  signal slice3_y_net_x0: std_logic_vector(17 downto 0);
  signal slice9_y_net: std_logic_vector(5 downto 0);

begin
  slice31_y_net_x5 <= addr_in;
  ce_1_sg_x42 <= ce_1;
  clk_1_sg_x42 <= clk_1;
  slice3_y_net_x0 <= data_in;
  delay2_q_net_x5 <= valid_in;
  addr_out <= register2_q_net_x1;
  data_out <= register1_q_net_x1;
  valid_out <= logical_y_net_x1;

  constant_x0: entity work.constant_4a9dc516dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => register3_q_net,
      y(0) => logical_y_net_x1
    );

  register1: entity work.xlregister
    generic map (
      d_width => 18,
      init_value => b"000000000000000000"
    )
    port map (
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
      d => slice3_y_net_x0,
      en => "1",
      rst => "0",
      q => register1_q_net_x1
    );

  register2: entity work.xlregister
    generic map (
      d_width => 6,
      init_value => b"000000"
    )
    port map (
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
      d => slice9_y_net,
      en => "1",
      rst => "0",
      q => register2_q_net_x1
    );

  register3: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
      d(0) => delay2_q_net_x5,
      en => "1",
      rst => "0",
      q(0) => register3_q_net
    );

  relational: entity work.relational_0c4cc9dc89
    port map (
      a => slice22_y_net,
      b => constant_op_net,
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
      clr => '0',
      op(0) => relational_op_net
    );

  slice22: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 31,
      x_width => 32,
      y_width => 26
    )
    port map (
      x => slice31_y_net_x5,
      y => slice22_y_net
    );

  slice9: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 5,
      x_width => 32,
      y_width => 6
    )
    port map (
      x => slice31_y_net_x5,
      y => slice9_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/bi_real_unscr_2x/complex_addsub/ri_to_c"

entity ri_to_c_entity_7019693a09 is
  port (
    im: in std_logic_vector(17 downto 0); 
    re: in std_logic_vector(17 downto 0); 
    c: out std_logic_vector(35 downto 0)
  );
end ri_to_c_entity_7019693a09;

architecture structural of ri_to_c_entity_7019693a09 is
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net: std_logic_vector(17 downto 0);
  signal force_re_output_port_net: std_logic_vector(17 downto 0);

begin
  convert2_dout_net_x0 <= im;
  convert_dout_net_x0 <= re;
  c <= concat_y_net_x2;

  concat: entity work.concat_b198bd62b0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x2
    );

  force_im: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert2_dout_net_x0,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_dout_net_x0,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/bi_real_unscr_2x/complex_addsub"

entity complex_addsub_entity_18ec2b7e61 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    a_b: out std_logic_vector(35 downto 0); 
    a_b_x0: out std_logic_vector(35 downto 0)
  );
end complex_addsub_entity_18ec2b7e61;

architecture structural of complex_addsub_entity_18ec2b7e61 is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub_s_net: std_logic_vector(18 downto 0);
  signal bram0_data_out_net_x1: std_logic_vector(35 downto 0);
  signal ce_1_sg_x43: std_logic;
  signal clk_1_sg_x43: std_logic;
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert3_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal shift1_op_net: std_logic_vector(18 downto 0);
  signal shift2_op_net: std_logic_vector(18 downto 0);
  signal shift3_op_net: std_logic_vector(18 downto 0);
  signal shift_op_net: std_logic_vector(18 downto 0);

begin
  bram0_data_out_net_x1 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x43 <= ce_1;
  clk_1_sg_x43 <= clk_1;
  a_b <= concat_y_net_x4;
  a_b_x0 <= concat_y_net_x5;

  addsub: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x0,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_3b890bd063
    port map (
      a => force_re_output_port_net_x1,
      b => force_re_output_port_net_x0,
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_c7ad41276b
    port map (
      a => force_im_output_port_net_x0,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      s => addsub3_s_net
    );

  c_to_ri1_20280cf308: entity work.c_to_ri_entity_2485354a01
    port map (
      c => mux_y_net_x1,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_a0901cfe15: entity work.c_to_ri_entity_2485354a01
    port map (
      c => bram0_data_out_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 2,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      din => shift_op_net,
      dout => convert_dout_net_x0
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 2,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      din => shift1_op_net,
      dout => convert1_dout_net_x0
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 2,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      din => shift2_op_net,
      dout => convert2_dout_net_x0
    );

  convert3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 2,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      din => shift3_op_net,
      dout => convert3_dout_net_x0
    );

  ri_to_c1_046c847860: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert1_dout_net_x0,
      re => convert3_dout_net_x0,
      c => concat_y_net_x5
    );

  ri_to_c_7019693a09: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert2_dout_net_x0,
      re => convert_dout_net_x0,
      c => concat_y_net_x4
    );

  shift: entity work.shift_cc70f4526a
    port map (
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      ip => addsub_s_net,
      op => shift_op_net
    );

  shift1: entity work.shift_cc70f4526a
    port map (
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      ip => addsub1_s_net,
      op => shift1_op_net
    );

  shift2: entity work.shift_cc70f4526a
    port map (
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      ip => addsub2_s_net,
      op => shift2_op_net
    );

  shift3: entity work.shift_cc70f4526a
    port map (
      ce => ce_1_sg_x43,
      clk => clk_1_sg_x43,
      clr => '0',
      ip => addsub3_s_net,
      op => shift3_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/bi_real_unscr_2x/reorder/sync_delay_en"

entity sync_delay_en_entity_e73e676488 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    en: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_en_entity_e73e676488;

architecture structural of sync_delay_en_entity_e73e676488 is
  signal ce_1_sg_x44: std_logic;
  signal clk_1_sg_x44: std_logic;
  signal constant1_op_net: std_logic_vector(10 downto 0);
  signal constant2_op_net: std_logic_vector(10 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net_x0: std_logic_vector(10 downto 0);
  signal constant_op_net_x1: std_logic;
  signal counter_op_net: std_logic_vector(10 downto 0);
  signal logical1_y_net: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x0: std_logic;
  signal pre_sync_delay_q_net_x0: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x44 <= ce_1;
  clk_1_sg_x44 <= clk_1;
  constant_op_net_x1 <= en;
  pre_sync_delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x0;

  constant1: entity work.constant_a3923dd146
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_0604807f72
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_118598964d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net_x0
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_391d8b1c1f812d67",
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x44,
      clk => clk_1_sg_x44,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical1_y_net,
      load(0) => pre_sync_delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => pre_sync_delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net,
      d1(0) => constant_op_net_x1,
      y(0) => logical1_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => pre_sync_delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x0
    );

  relational: entity work.relational_2147430058
    port map (
      a => constant_op_net_x0,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_b4b277ae0f
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/bi_real_unscr_2x/reorder"

entity reorder_entity_685328f00d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    en: in std_logic; 
    sync: in std_logic; 
    dout0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end reorder_entity_685328f00d;

architecture structural of reorder_entity_685328f00d is
  signal bram0_data_out_net_x2: std_logic_vector(35 downto 0);
  signal ce_1_sg_x45: std_logic;
  signal clk_1_sg_x45: std_logic;
  signal concat_y_net_x0: std_logic_vector(35 downto 0);
  signal constant_op_net_x2: std_logic;
  signal counter_op_net: std_logic_vector(10 downto 0);
  signal delay_d0_q_net: std_logic_vector(9 downto 0);
  signal delay_din0_q_net: std_logic_vector(35 downto 0);
  signal delay_map1_q_net: std_logic_vector(9 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_sel_q_net: std_logic;
  signal delay_we_q_net: std_logic;
  signal map1_data_net: std_logic_vector(9 downto 0);
  signal mux_y_net: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic;
  signal post_sync_delay_q_net_x0: std_logic;
  signal pre_sync_delay_q_net_x0: std_logic;
  signal slice1_y_net: std_logic;
  signal slice2_y_net: std_logic_vector(9 downto 0);

begin
  ce_1_sg_x45 <= ce_1;
  clk_1_sg_x45 <= clk_1;
  concat_y_net_x0 <= din0;
  constant_op_net_x2 <= en;
  delay_q_net_x0 <= sync;
  dout0 <= bram0_data_out_net_x2;
  sync_out <= post_sync_delay_q_net_x0;

  bram0: entity work.xlspram
    generic map (
      c_address_width => 10,
      c_width => 36,
      core_name0 => "single_port_block_memory_virtex2p_6_1_9cf8efebee3199f6",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      data_in => delay_din0_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram0_data_out_net_x2
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 2047,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_d0a204b7c881b521",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      clr => '0',
      en(0) => constant_op_net_x2,
      rst(0) => delay_q_net_x0,
      op => counter_op_net
    );

  delay_d0: entity work.delay_0f6b6badfe
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => slice2_y_net,
      q => delay_d0_q_net
    );

  delay_din0: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      d => concat_y_net_x0,
      en => '1',
      q => delay_din0_q_net
    );

  delay_map1: entity work.delay_0f6b6badfe
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => map1_data_net,
      q => delay_map1_q_net
    );

  delay_sel: entity work.delay_21355083c1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => slice1_y_net,
      q(0) => delay_sel_q_net
    );

  delay_we: entity work.delay_0341f7be44
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => constant_op_net_x2,
      q(0) => delay_we_q_net
    );

  map1: entity work.xlsprom_dist
    generic map (
      addr_width => 10,
      c_address_width => 10,
      c_width => 10,
      core_name0 => "distributed_memory_virtex2p_7_1_47fa87c2abb2be3c",
      latency => 0
    )
    port map (
      addr => slice2_y_net,
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      en => "1",
      data => map1_data_net
    );

  mux: entity work.mux_bdc1db9d7e
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      clr => '0',
      d0 => delay_d0_q_net,
      d1 => delay_map1_q_net,
      sel(0) => delay_sel_q_net,
      y => mux_y_net
    );

  post_sync_delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      d(0) => mux_y_net_x0,
      en => '1',
      q(0) => post_sync_delay_q_net_x0
    );

  pre_sync_delay: entity work.delay_0341f7be44
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => delay_q_net_x0,
      q(0) => pre_sync_delay_q_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 10,
      new_msb => 10,
      x_width => 11,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 11,
      y_width => 10
    )
    port map (
      x => counter_op_net,
      y => slice2_y_net
    );

  sync_delay_en_e73e676488: entity work.sync_delay_en_entity_e73e676488
    port map (
      ce_1 => ce_1_sg_x45,
      clk_1 => clk_1_sg_x45,
      en => constant_op_net_x2,
      in_x0 => pre_sync_delay_q_net_x0,
      out_x0 => mux_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/bi_real_unscr_2x/reorder1"

entity reorder1_entity_4ceec62f48 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(35 downto 0); 
    en: in std_logic; 
    sync: in std_logic; 
    dout0: out std_logic_vector(35 downto 0)
  );
end reorder1_entity_4ceec62f48;

architecture structural of reorder1_entity_4ceec62f48 is
  signal bram0_data_out_net_x0: std_logic_vector(35 downto 0);
  signal ce_1_sg_x46: std_logic;
  signal clk_1_sg_x46: std_logic;
  signal concat_y_net_x0: std_logic_vector(35 downto 0);
  signal constant_op_net_x3: std_logic;
  signal counter_op_net: std_logic_vector(10 downto 0);
  signal delay_d0_q_net: std_logic_vector(9 downto 0);
  signal delay_din0_q_net: std_logic_vector(35 downto 0);
  signal delay_map1_q_net: std_logic_vector(9 downto 0);
  signal delay_q_net_x1: std_logic;
  signal delay_sel_q_net: std_logic;
  signal delay_we_q_net: std_logic;
  signal map1_data_net: std_logic_vector(9 downto 0);
  signal mux_y_net: std_logic_vector(9 downto 0);
  signal slice1_y_net: std_logic;
  signal slice2_y_net: std_logic_vector(9 downto 0);

begin
  ce_1_sg_x46 <= ce_1;
  clk_1_sg_x46 <= clk_1;
  concat_y_net_x0 <= din0;
  constant_op_net_x3 <= en;
  delay_q_net_x1 <= sync;
  dout0 <= bram0_data_out_net_x0;

  bram0: entity work.xlspram
    generic map (
      c_address_width => 10,
      c_width => 36,
      core_name0 => "single_port_block_memory_virtex2p_6_1_9cf8efebee3199f6",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x46,
      clk => clk_1_sg_x46,
      data_in => delay_din0_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram0_data_out_net_x0
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 2047,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_d0a204b7c881b521",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x46,
      clk => clk_1_sg_x46,
      clr => '0',
      en(0) => constant_op_net_x3,
      rst(0) => delay_q_net_x1,
      op => counter_op_net
    );

  delay_d0: entity work.delay_0f6b6badfe
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => slice2_y_net,
      q => delay_d0_q_net
    );

  delay_din0: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x46,
      clk => clk_1_sg_x46,
      d => concat_y_net_x0,
      en => '1',
      q => delay_din0_q_net
    );

  delay_map1: entity work.delay_0f6b6badfe
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => map1_data_net,
      q => delay_map1_q_net
    );

  delay_sel: entity work.delay_21355083c1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => slice1_y_net,
      q(0) => delay_sel_q_net
    );

  delay_we: entity work.delay_0341f7be44
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => constant_op_net_x3,
      q(0) => delay_we_q_net
    );

  map1: entity work.xlsprom_dist
    generic map (
      addr_width => 10,
      c_address_width => 10,
      c_width => 10,
      core_name0 => "distributed_memory_virtex2p_7_1_4be7d839ed9b4fda",
      latency => 0
    )
    port map (
      addr => slice2_y_net,
      ce => ce_1_sg_x46,
      clk => clk_1_sg_x46,
      en => "1",
      data => map1_data_net
    );

  mux: entity work.mux_bdc1db9d7e
    port map (
      ce => ce_1_sg_x46,
      clk => clk_1_sg_x46,
      clr => '0',
      d0 => delay_d0_q_net,
      d1 => delay_map1_q_net,
      sel(0) => delay_sel_q_net,
      y => mux_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 10,
      new_msb => 10,
      x_width => 11,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 11,
      y_width => 10
    )
    port map (
      x => counter_op_net,
      y => slice2_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/bi_real_unscr_2x"

entity bi_real_unscr_2x_entity_09890717ae is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    even: in std_logic_vector(35 downto 0); 
    odd: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    pol12_out: out std_logic_vector(35 downto 0); 
    pol34_out: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end bi_real_unscr_2x_entity_09890717ae;

architecture structural of bi_real_unscr_2x_entity_09890717ae is
  signal bram0_data_out_net_x0: std_logic_vector(35 downto 0);
  signal bram0_data_out_net_x2: std_logic_vector(35 downto 0);
  signal ce_1_sg_x47: std_logic;
  signal clk_1_sg_x47: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal concat_y_net_x8: std_logic_vector(35 downto 0);
  signal constant1_op_net: std_logic_vector(9 downto 0);
  signal constant_op_net_x3: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay8_q_net_x4: std_logic;
  signal delay_q_net: std_logic_vector(35 downto 0);
  signal delay_q_net_x2: std_logic;
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal post_sync_delay_q_net_x0: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x47 <= ce_1;
  clk_1_sg_x47 <= clk_1;
  concat_y_net_x2 <= even;
  concat_y_net_x6 <= odd;
  delay_q_net_x2 <= sync;
  pol12_out <= concat_y_net_x7;
  pol34_out <= concat_y_net_x8;
  sync_out <= delay8_q_net_x4;

  complex_addsub_18ec2b7e61: entity work.complex_addsub_entity_18ec2b7e61
    port map (
      a => bram0_data_out_net_x2,
      b => mux_y_net_x1,
      ce_1 => ce_1_sg_x47,
      clk_1 => clk_1_sg_x47,
      a_b => concat_y_net_x7,
      a_b_x0 => concat_y_net_x8
    );

  constant1: entity work.constant_498bc68c14
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net_x3
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_0260fba4aec82188",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      clr => '0',
      en => "1",
      rst(0) => post_sync_delay_q_net_x0,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      d => bram0_data_out_net_x0,
      en => '1',
      q => delay_q_net
    );

  delay8: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      d(0) => post_sync_delay_q_net_x0,
      en => '1',
      q(0) => delay8_q_net_x4
    );

  mux: entity work.mux_b75bc1e5be
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => delay_q_net,
      d1 => bram0_data_out_net_x2,
      sel(0) => relational_op_net,
      y => mux_y_net_x1
    );

  relational: entity work.relational_0ffd72e037
    port map (
      a => constant1_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  reorder1_4ceec62f48: entity work.reorder1_entity_4ceec62f48
    port map (
      ce_1 => ce_1_sg_x47,
      clk_1 => clk_1_sg_x47,
      din0 => concat_y_net_x6,
      en => constant_op_net_x3,
      sync => delay_q_net_x2,
      dout0 => bram0_data_out_net_x0
    );

  reorder_685328f00d: entity work.reorder_entity_685328f00d
    port map (
      ce_1 => ce_1_sg_x47,
      clk_1 => clk_1_sg_x47,
      din0 => concat_y_net_x2,
      en => constant_op_net_x3,
      sync => delay_q_net_x2,
      dout0 => bram0_data_out_net_x2,
      sync_out => post_sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_1/butterfly_direct/convert_of1"

entity convert_of1_entity_0aa7df2edc is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(19 downto 0); 
    dout: out std_logic_vector(17 downto 0)
  );
end convert_of1_entity_0aa7df2edc;

architecture structural of convert_of1_entity_0aa7df2edc is
  signal ce_1_sg_x48: std_logic;
  signal clk_1_sg_x48: std_logic;
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal mux_y_net_x0: std_logic_vector(19 downto 0);

begin
  ce_1_sg_x48 <= ce_1;
  clk_1_sg_x48 <= clk_1;
  mux_y_net_x0 <= din;
  dout <= convert_dout_net_x0;

  convert: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 18,
      din_width => 20,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x48,
      clk => clk_1_sg_x48,
      clr => '0',
      din => mux_y_net_x0,
      dout => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_1/butterfly_direct/twiddle"

entity twiddle_entity_e81496dc87 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(17 downto 0); 
    bw_re: out std_logic_vector(17 downto 0)
  );
end twiddle_entity_e81496dc87;

architecture structural of twiddle_entity_e81496dc87 is
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(35 downto 0);

begin
  single_port_ram_data_out_net_x1 <= a;
  mux_y_net_x1 <= b;
  a_im <= force_im_output_port_net_x2;
  a_re <= force_re_output_port_net_x2;
  bw_im <= force_im_output_port_net_x3;
  bw_re <= force_re_output_port_net_x3;

  c_to_ri1_2c5dd4a7c6: entity work.c_to_ri_entity_2485354a01
    port map (
      c => mux_y_net_x1,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri_ccf89a5b78: entity work.c_to_ri_entity_2485354a01
    port map (
      c => single_port_ram_data_out_net_x1,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_1/butterfly_direct"

entity butterfly_direct_entity_6398d31179 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_6398d31179;

architecture structural of butterfly_direct_entity_6398d31179 is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub_s_net: std_logic_vector(18 downto 0);
  signal ce_1_sg_x52: std_logic;
  signal clk_1_sg_x52: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay3_q_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(19 downto 0);
  signal mux2_y_net_x0: std_logic_vector(19 downto 0);
  signal mux3_y_net_x0: std_logic_vector(19 downto 0);
  signal mux_y_net_x0: std_logic_vector(19 downto 0);
  signal mux_y_net_x2: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic;
  signal scale1_op_net: std_logic_vector(18 downto 0);
  signal scale2_op_net: std_logic_vector(18 downto 0);
  signal scale3_op_net: std_logic_vector(18 downto 0);
  signal scale_op_net: std_logic_vector(18 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  single_port_ram_data_out_net_x2 <= a;
  mux_y_net_x2 <= b;
  ce_1_sg_x52 <= ce_1;
  clk_1_sg_x52 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x3 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  addsub: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => force_re_output_port_net_x3,
      ce => ce_1_sg_x52,
      clk => clk_1_sg_x52,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_im_output_port_net_x2,
      b => force_im_output_port_net_x3,
      ce => ce_1_sg_x52,
      clk => clk_1_sg_x52,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_3b890bd063
    port map (
      a => force_re_output_port_net_x2,
      b => force_re_output_port_net_x3,
      ce => ce_1_sg_x52,
      clk => clk_1_sg_x52,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x2,
      b => force_im_output_port_net_x3,
      ce => ce_1_sg_x52,
      clk => clk_1_sg_x52,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_0aa7df2edc: entity work.convert_of1_entity_0aa7df2edc
    port map (
      ce_1 => ce_1_sg_x52,
      clk_1 => clk_1_sg_x52,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_31b9d63b94: entity work.convert_of1_entity_0aa7df2edc
    port map (
      ce_1 => ce_1_sg_x52,
      clk_1 => clk_1_sg_x52,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_622ff77fff: entity work.convert_of1_entity_0aa7df2edc
    port map (
      ce_1 => ce_1_sg_x52,
      clk_1 => clk_1_sg_x52,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_98bbfb4232: entity work.convert_of1_entity_0aa7df2edc
    port map (
      ce_1 => ce_1_sg_x52,
      clk_1 => clk_1_sg_x52,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x52,
      clk => clk_1_sg_x52,
      d(0) => mux_y_net_x3,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x52,
      clk => clk_1_sg_x52,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_610aab71b1
    port map (
      ce => ce_1_sg_x52,
      clk => clk_1_sg_x52,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_610aab71b1
    port map (
      ce => ce_1_sg_x52,
      clk => clk_1_sg_x52,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_610aab71b1
    port map (
      ce => ce_1_sg_x52,
      clk => clk_1_sg_x52,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_610aab71b1
    port map (
      ce => ce_1_sg_x52,
      clk => clk_1_sg_x52,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_691fa28579: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x3
    );

  ri_to_c_b75b89c65b: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x2
    );

  scale: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_e81496dc87: entity work.twiddle_entity_e81496dc87
    port map (
      a => single_port_ram_data_out_net_x2,
      b => mux_y_net_x2,
      a_im => force_im_output_port_net_x2,
      a_re => force_re_output_port_net_x2,
      bw_im => force_im_output_port_net_x3,
      bw_re => force_re_output_port_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_1/delay_b"

entity delay_b_entity_c38d56070c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_c38d56070c;

architecture structural of delay_b_entity_c38d56070c is
  signal ce_1_sg_x53: std_logic;
  signal clk_1_sg_x53: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x3: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x53 <= ce_1;
  clk_1_sg_x53 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x3;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 1021,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 10,
      c_width => 36,
      core_name0 => "single_port_block_memory_virtex2p_6_1_7c11f4ba4337f78b",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      data_in => mux1_y_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_1/sync_delay"

entity sync_delay_entity_099ddb3c2a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_099ddb3c2a;

architecture structural of sync_delay_entity_099ddb3c2a is
  signal ce_1_sg_x55: std_logic;
  signal clk_1_sg_x55: std_logic;
  signal constant1_op_net: std_logic_vector(10 downto 0);
  signal constant2_op_net: std_logic_vector(10 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(10 downto 0);
  signal counter_op_net: std_logic_vector(10 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x4: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x55 <= ce_1;
  clk_1_sg_x55 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x4;

  constant1: entity work.constant_a3923dd146
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_0604807f72
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_118598964d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_391d8b1c1f812d67",
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x55,
      clk => clk_1_sg_x55,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x4
    );

  relational: entity work.relational_2147430058
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_b4b277ae0f
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_1"

entity fft_stage_1_entity_d92d817b13 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_1_entity_d92d817b13;

architecture structural of fft_stage_1_entity_d92d817b13 is
  signal ce_1_sg_x56: std_logic;
  signal clk_1_sg_x56: std_logic;
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(10 downto 0);
  signal delay1_q_net_x0: std_logic;
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x2: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x3: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x0: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x56 <= ce_1;
  clk_1_sg_x56 <= clk_1;
  concat_y_net_x4 <= in1;
  concat_y_net_x5 <= in2;
  slice21_y_net_x0 <= shift;
  delay1_q_net_x0 <= sync;
  out1 <= concat_y_net_x6;
  out2 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  butterfly_direct_6398d31179: entity work.butterfly_direct_entity_6398d31179
    port map (
      a => single_port_ram_data_out_net_x3,
      b => mux_y_net_x2,
      ce_1 => ce_1_sg_x56,
      clk_1 => clk_1_sg_x56,
      shift => slice_y_net_x0,
      sync => mux_y_net_x4,
      a_bw => concat_y_net_x6,
      a_bw_x0 => concat_y_net_x7,
      sync_out => delay_q_net_x2
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_78a3dd824f4df0df",
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x56,
      clk => clk_1_sg_x56,
      clr => '0',
      en => "1",
      rst(0) => delay1_q_net_x0,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x56,
      clk => clk_1_sg_x56,
      d(0) => delay1_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_c38d56070c: entity work.delay_b_entity_c38d56070c
    port map (
      ce_1 => ce_1_sg_x56,
      clk_1 => clk_1_sg_x56,
      in1 => mux1_y_net_x0,
      out1 => single_port_ram_data_out_net_x3
    );

  delay_f_066f4cfb20: entity work.delay_b_entity_c38d56070c
    port map (
      ce_1 => ce_1_sg_x56,
      clk_1 => clk_1_sg_x56,
      in1 => concat_y_net_x5,
      out1 => single_port_ram_data_out_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x56,
      clk => clk_1_sg_x56,
      clr => '0',
      d0 => single_port_ram_data_out_net_x0,
      d1 => concat_y_net_x4,
      sel(0) => slice1_y_net,
      y => mux_y_net_x2
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x56,
      clk => clk_1_sg_x56,
      clr => '0',
      d0 => concat_y_net_x4,
      d1 => single_port_ram_data_out_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x0,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 10,
      new_msb => 10,
      x_width => 11,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_099ddb3c2a: entity work.sync_delay_entity_099ddb3c2a
    port map (
      ce_1 => ce_1_sg_x56,
      clk_1 => clk_1_sg_x56,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_10/butterfly_direct/convert_of1"

entity convert_of1_entity_059cbdd908 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    dout: out std_logic_vector(17 downto 0)
  );
end convert_of1_entity_059cbdd908;

architecture structural of convert_of1_entity_059cbdd908 is
  signal ce_1_sg_x57: std_logic;
  signal clk_1_sg_x57: std_logic;
  signal convert_dout_net_x0: std_logic_vector(17 downto 0);
  signal mux_y_net_x0: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x57 <= ce_1;
  clk_1_sg_x57 <= clk_1;
  mux_y_net_x0 <= din;
  dout <= convert_dout_net_x0;

  convert: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 19,
      din_width => 24,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x57,
      clk => clk_1_sg_x57,
      clr => '0',
      din => mux_y_net_x0,
      dout => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_10/butterfly_direct/twiddle/coeff_gen"

entity coeff_gen_entity_1234626ab4 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_1234626ab4;

architecture structural of coeff_gen_entity_1234626ab4 is
  signal ce_1_sg_x61: std_logic;
  signal clk_1_sg_x61: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(8 downto 0);

begin
  ce_1_sg_x61 <= ce_1;
  clk_1_sg_x61 <= clk_1;
  mux_y_net_x0 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x61,
      clk => clk_1_sg_x61,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x0,
      op => counter_op_net
    );

  ri_to_c_dc7c7a13f1: entity work.ri_to_c_entity_7019693a09
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_189ab7d9865256c9",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x61,
      clk => clk_1_sg_x61,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 9,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_a255629948a6346d",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x61,
      clk => clk_1_sg_x61,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 9,
      x_width => 10,
      y_width => 9
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_10/butterfly_direct/twiddle/convert_of"

entity convert_of_entity_80190dc550 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(35 downto 0); 
    dout: out std_logic_vector(20 downto 0)
  );
end convert_of_entity_80190dc550;

architecture structural of convert_of_entity_80190dc550 is
  signal ce_1_sg_x62: std_logic;
  signal clk_1_sg_x62: std_logic;
  signal convert_dout_net_x0: std_logic_vector(20 downto 0);
  signal mult_p_net_x0: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x62 <= ce_1;
  clk_1_sg_x62 <= clk_1;
  mult_p_net_x0 <= din;
  dout <= convert_dout_net_x0;

  convert: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 33,
      din_width => 36,
      dout_arith => 2,
      dout_bin_pt => 18,
      dout_width => 21,
      latency => 1,
      overflow => xlWrap,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x62,
      clk => clk_1_sg_x62,
      clr => '0',
      din => mult_p_net_x0,
      dout => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_10/butterfly_direct/twiddle"

entity twiddle_entity_a16ec0ee01 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_entity_a16ec0ee01;

architecture structural of twiddle_entity_a16ec0ee01 is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x65: std_logic;
  signal clk_1_sg_x65: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net: std_logic_vector(17 downto 0);
  signal convert2_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(20 downto 0);
  signal convert_dout_net_x1: std_logic_vector(20 downto 0);
  signal convert_dout_net_x2: std_logic_vector(20 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay5_q_net: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_slr_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net_x0: std_logic_vector(35 downto 0);
  signal mult2_p_net_x0: std_logic_vector(35 downto 0);
  signal mult_p_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;

begin
  delay_slr_q_net_x0 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x65 <= ce_1;
  clk_1_sg_x65 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= addsub4_s_net_x0;
  bw_re <= addsub_s_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_6e32911fe1
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x1,
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      clr => '0',
      s => addsub_s_net_x0
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x1,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      clr => '0',
      s => addsub3_s_net
    );

  addsub4: entity work.addsub_f6ef4de287
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x2,
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      clr => '0',
      s => addsub4_s_net_x0
    );

  c_to_ri1_d95cac197e: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_2a01042af6: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_8f6d3df426: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_1234626ab4: entity work.coeff_gen_entity_1234626ab4
    port map (
      ce_1 => ce_1_sg_x65,
      clk_1 => clk_1_sg_x65,
      rst => mux_y_net_x2,
      w => concat_y_net_x2
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub1_s_net,
      dout => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub2_s_net,
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub3_s_net,
      dout => convert2_dout_net
    );

  convert_of1_e79037da73: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x65,
      clk_1 => clk_1_sg_x65,
      din => mult1_p_net_x0,
      dout => convert_dout_net_x1
    );

  convert_of2_ede9cbdac9: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x65,
      clk_1 => clk_1_sg_x65,
      din => mult2_p_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of_80190dc550: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x65,
      clk_1 => clk_1_sg_x65,
      din => mult_p_net_x0,
      dout => convert_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      d => delay_slr_q_net_x0,
      en => '1',
      q => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      d => mux_y_net_x1,
      en => '1',
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      d => force_re_output_port_net_x2,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      d => force_im_output_port_net_x2,
      en => '1',
      q => delay4_q_net
    );

  delay5: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      d => force_re_output_port_net_x1,
      en => '1',
      q => delay5_q_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 17,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => convert_dout_net,
      b => delay5_q_net,
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      clr => '0',
      core_ce => ce_1_sg_x65,
      core_clk => clk_1_sg_x65,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay4_q_net,
      b => convert1_dout_net,
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      clr => '0',
      core_ce => ce_1_sg_x65,
      core_clk => clk_1_sg_x65,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  mult2: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay3_q_net,
      b => convert2_dout_net,
      ce => ce_1_sg_x65,
      clk => clk_1_sg_x65,
      clr => '0',
      core_ce => ce_1_sg_x65,
      core_clk => clk_1_sg_x65,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_10/butterfly_direct"

entity butterfly_direct_entity_fa5bb8f023 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_fa5bb8f023;

architecture structural of butterfly_direct_entity_fa5bb8f023 is
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net: std_logic_vector(22 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x66: std_logic;
  signal clk_1_sg_x66: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal delay_slr_q_net_x1: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal scale_op_net: std_logic_vector(22 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  delay_slr_q_net_x1 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x66 <= ce_1;
  clk_1_sg_x66 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  addsub: entity work.addsub_b167d676fa
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x66,
      clk => clk_1_sg_x66,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_b167d676fa
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x66,
      clk => clk_1_sg_x66,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_0816bd8680
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x66,
      clk => clk_1_sg_x66,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_0816bd8680
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x66,
      clk => clk_1_sg_x66,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_059cbdd908: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x66,
      clk_1 => clk_1_sg_x66,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_341b5db952: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x66,
      clk_1 => clk_1_sg_x66,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_266bc45586: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x66,
      clk_1 => clk_1_sg_x66,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_c813e0b301: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x66,
      clk_1 => clk_1_sg_x66,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x66,
      clk => clk_1_sg_x66,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x66,
      clk => clk_1_sg_x66,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x66,
      clk => clk_1_sg_x66,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x66,
      clk => clk_1_sg_x66,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x66,
      clk => clk_1_sg_x66,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x66,
      clk => clk_1_sg_x66,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_98ebcfcf88: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x3
    );

  ri_to_c_b8cb7594ba: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x2
    );

  scale: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_a16ec0ee01: entity work.twiddle_entity_a16ec0ee01
    port map (
      a => delay_slr_q_net_x1,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x66,
      clk_1 => clk_1_sg_x66,
      sync => mux_y_net_x4,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => addsub4_s_net_x0,
      bw_re => addsub_s_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_10/delay_b"

entity delay_b_entity_d653569e73 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_d653569e73;

architecture structural of delay_b_entity_d653569e73 is
  signal ce_1_sg_x67: std_logic;
  signal clk_1_sg_x67: std_logic;
  signal delay_slr_q_net_x2: std_logic_vector(35 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x67 <= ce_1;
  clk_1_sg_x67 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= delay_slr_q_net_x2;

  delay_slr: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x67,
      clk => clk_1_sg_x67,
      d => mux1_y_net_x0,
      en => '1',
      q => delay_slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_10/sync_delay"

entity sync_delay_entity_92b1806c68 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_92b1806c68;

architecture structural of sync_delay_entity_92b1806c68 is
  signal ce_1_sg_x69: std_logic;
  signal clk_1_sg_x69: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant2_op_net: std_logic_vector(1 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(1 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x69 <= ce_1;
  clk_1_sg_x69 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_e8ddc079e9
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_a7e2bb9e12
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_9673efc18b69cc19",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x69,
      clk => clk_1_sg_x69,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_5f1eb17108
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_f9928864ea
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_10"

entity fft_stage_10_entity_c05fdecae6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_10_entity_c05fdecae6;

architecture structural of fft_stage_10_entity_c05fdecae6 is
  signal ce_1_sg_x70: std_logic;
  signal clk_1_sg_x70: std_logic;
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_slr_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_slr_q_net_x2: std_logic_vector(35 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x1: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x70 <= ce_1;
  clk_1_sg_x70 <= clk_1;
  concat_y_net_x4 <= in1;
  concat_y_net_x5 <= in2;
  slice21_y_net_x1 <= shift;
  delay_q_net_x2 <= sync;
  out1 <= concat_y_net_x6;
  out2 <= concat_y_net_x7;
  sync_out <= delay_q_net_x3;

  butterfly_direct_fa5bb8f023: entity work.butterfly_direct_entity_fa5bb8f023
    port map (
      a => delay_slr_q_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x70,
      clk_1 => clk_1_sg_x70,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x6,
      a_bw_x0 => concat_y_net_x7,
      sync_out => delay_q_net_x3
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_d7f3c31b59e52df2",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x70,
      clk => clk_1_sg_x70,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x2,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x70,
      clk => clk_1_sg_x70,
      d(0) => delay_q_net_x2,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_d653569e73: entity work.delay_b_entity_d653569e73
    port map (
      ce_1 => ce_1_sg_x70,
      clk_1 => clk_1_sg_x70,
      in1 => mux1_y_net_x0,
      out1 => delay_slr_q_net_x2
    );

  delay_f_0939d6c48a: entity work.delay_b_entity_d653569e73
    port map (
      ce_1 => ce_1_sg_x70,
      clk_1 => clk_1_sg_x70,
      in1 => concat_y_net_x5,
      out1 => delay_slr_q_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x70,
      clk => clk_1_sg_x70,
      clr => '0',
      d0 => delay_slr_q_net_x0,
      d1 => concat_y_net_x4,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x70,
      clk => clk_1_sg_x70,
      clr => '0',
      d0 => concat_y_net_x4,
      d1 => delay_slr_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 9,
      new_msb => 9,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x1,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 2,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_92b1806c68: entity work.sync_delay_entity_92b1806c68
    port map (
      ce_1 => ce_1_sg_x70,
      clk_1 => clk_1_sg_x70,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_11/butterfly_direct/twiddle/coeff_gen"

entity coeff_gen_entity_d143ad835d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_d143ad835d;

architecture structural of coeff_gen_entity_d143ad835d is
  signal ce_1_sg_x75: std_logic;
  signal clk_1_sg_x75: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(9 downto 0);

begin
  ce_1_sg_x75 <= ce_1;
  clk_1_sg_x75 <= clk_1;
  mux_y_net_x0 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x75,
      clk => clk_1_sg_x75,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x0,
      op => counter_op_net
    );

  ri_to_c_aeec1a843b: entity work.ri_to_c_entity_7019693a09
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 10,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_64284d314c575990",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x75,
      clk => clk_1_sg_x75,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 10,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x75,
      clk => clk_1_sg_x75,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 10,
      y_width => 10
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_11/butterfly_direct/twiddle"

entity twiddle_entity_3d71ca07e2 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_entity_3d71ca07e2;

architecture structural of twiddle_entity_3d71ca07e2 is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x79: std_logic;
  signal clk_1_sg_x79: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net: std_logic_vector(17 downto 0);
  signal convert2_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(20 downto 0);
  signal convert_dout_net_x1: std_logic_vector(20 downto 0);
  signal convert_dout_net_x2: std_logic_vector(20 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay5_q_net: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_slr_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net_x0: std_logic_vector(35 downto 0);
  signal mult2_p_net_x0: std_logic_vector(35 downto 0);
  signal mult_p_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;

begin
  delay_slr_q_net_x0 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x79 <= ce_1;
  clk_1_sg_x79 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= addsub4_s_net_x0;
  bw_re <= addsub_s_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_6e32911fe1
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x1,
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      clr => '0',
      s => addsub_s_net_x0
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x1,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      clr => '0',
      s => addsub3_s_net
    );

  addsub4: entity work.addsub_f6ef4de287
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x2,
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      clr => '0',
      s => addsub4_s_net_x0
    );

  c_to_ri1_317b9d6954: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_9b76bded8e: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_e6272b3bf6: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_d143ad835d: entity work.coeff_gen_entity_d143ad835d
    port map (
      ce_1 => ce_1_sg_x79,
      clk_1 => clk_1_sg_x79,
      rst => mux_y_net_x2,
      w => concat_y_net_x2
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub1_s_net,
      dout => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub2_s_net,
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub3_s_net,
      dout => convert2_dout_net
    );

  convert_of1_28dbef5690: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x79,
      clk_1 => clk_1_sg_x79,
      din => mult1_p_net_x0,
      dout => convert_dout_net_x1
    );

  convert_of2_618c2474dc: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x79,
      clk_1 => clk_1_sg_x79,
      din => mult2_p_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of_0edcdd6447: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x79,
      clk_1 => clk_1_sg_x79,
      din => mult_p_net_x0,
      dout => convert_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      d => delay_slr_q_net_x0,
      en => '1',
      q => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      d => mux_y_net_x1,
      en => '1',
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      d => force_re_output_port_net_x2,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      d => force_im_output_port_net_x2,
      en => '1',
      q => delay4_q_net
    );

  delay5: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      d => force_re_output_port_net_x1,
      en => '1',
      q => delay5_q_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 17,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => convert_dout_net,
      b => delay5_q_net,
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      clr => '0',
      core_ce => ce_1_sg_x79,
      core_clk => clk_1_sg_x79,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay4_q_net,
      b => convert1_dout_net,
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      clr => '0',
      core_ce => ce_1_sg_x79,
      core_clk => clk_1_sg_x79,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  mult2: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay3_q_net,
      b => convert2_dout_net,
      ce => ce_1_sg_x79,
      clk => clk_1_sg_x79,
      clr => '0',
      core_ce => ce_1_sg_x79,
      core_clk => clk_1_sg_x79,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_11/butterfly_direct"

entity butterfly_direct_entity_ca6fe97910 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_ca6fe97910;

architecture structural of butterfly_direct_entity_ca6fe97910 is
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net: std_logic_vector(22 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x80: std_logic;
  signal clk_1_sg_x80: std_logic;
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal concat_y_net_x8: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_slr_q_net_x1: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal scale_op_net: std_logic_vector(22 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  delay_slr_q_net_x1 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x80 <= ce_1;
  clk_1_sg_x80 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x4;
  a_bw_x0 <= concat_y_net_x8;
  sync_out <= delay_q_net_x3;

  addsub: entity work.addsub_b167d676fa
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_b167d676fa
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_0816bd8680
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_0816bd8680
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_74c034e0b1: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x80,
      clk_1 => clk_1_sg_x80,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_0c08f6a943: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x80,
      clk_1 => clk_1_sg_x80,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_b4c4146641: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x80,
      clk_1 => clk_1_sg_x80,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_d7fbb29971: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x80,
      clk_1 => clk_1_sg_x80,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x80,
      clk => clk_1_sg_x80,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_4148378f11: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x8
    );

  ri_to_c_0be1028765: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x4
    );

  scale: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_3d71ca07e2: entity work.twiddle_entity_3d71ca07e2
    port map (
      a => delay_slr_q_net_x1,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x80,
      clk_1 => clk_1_sg_x80,
      sync => mux_y_net_x4,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => addsub4_s_net_x0,
      bw_re => addsub_s_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_11/delay_b"

entity delay_b_entity_fb25b3f622 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_fb25b3f622;

architecture structural of delay_b_entity_fb25b3f622 is
  signal ce_1_sg_x81: std_logic;
  signal clk_1_sg_x81: std_logic;
  signal delay_slr_q_net_x2: std_logic_vector(35 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x81 <= ce_1;
  clk_1_sg_x81 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= delay_slr_q_net_x2;

  delay_slr: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x81,
      clk => clk_1_sg_x81,
      d => mux1_y_net_x0,
      en => '1',
      q => delay_slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_11/sync_delay"

entity sync_delay_entity_833c6eac62 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_833c6eac62;

architecture structural of sync_delay_entity_833c6eac62 is
  signal ce_1_sg_x83: std_logic;
  signal clk_1_sg_x83: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant2_op_net: std_logic_vector(1 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(1 downto 0);
  signal counter_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x83 <= ce_1;
  clk_1_sg_x83 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_a7e2bb9e12
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_a7e2bb9e12
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_9673efc18b69cc19",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x83,
      clk => clk_1_sg_x83,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_5f1eb17108
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_f9928864ea
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_11"

entity fft_stage_11_entity_6b726dccdb is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_11_entity_6b726dccdb;

architecture structural of fft_stage_11_entity_6b726dccdb is
  signal ce_1_sg_x84: std_logic;
  signal clk_1_sg_x84: std_logic;
  signal concat_y_net_x10: std_logic_vector(35 downto 0);
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x12: std_logic_vector(35 downto 0);
  signal concat_y_net_x13: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x6: std_logic;
  signal delay_slr_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_slr_q_net_x2: std_logic_vector(35 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x2: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x84 <= ce_1;
  clk_1_sg_x84 <= clk_1;
  concat_y_net_x10 <= in1;
  concat_y_net_x11 <= in2;
  slice21_y_net_x2 <= shift;
  delay_q_net_x5 <= sync;
  out1 <= concat_y_net_x12;
  out2 <= concat_y_net_x13;
  sync_out <= delay_q_net_x6;

  butterfly_direct_ca6fe97910: entity work.butterfly_direct_entity_ca6fe97910
    port map (
      a => delay_slr_q_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x84,
      clk_1 => clk_1_sg_x84,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x12,
      a_bw_x0 => concat_y_net_x13,
      sync_out => delay_q_net_x6
    );

  counter: entity work.counter_9b03e3d644
    port map (
      ce => ce_1_sg_x84,
      clk => clk_1_sg_x84,
      clr => '0',
      rst(0) => delay_q_net_x5,
      op(0) => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x84,
      clk => clk_1_sg_x84,
      d(0) => delay_q_net_x5,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_fb25b3f622: entity work.delay_b_entity_fb25b3f622
    port map (
      ce_1 => ce_1_sg_x84,
      clk_1 => clk_1_sg_x84,
      in1 => mux1_y_net_x0,
      out1 => delay_slr_q_net_x2
    );

  delay_f_44fecf706b: entity work.delay_b_entity_fb25b3f622
    port map (
      ce_1 => ce_1_sg_x84,
      clk_1 => clk_1_sg_x84,
      in1 => concat_y_net_x11,
      out1 => delay_slr_q_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x84,
      clk => clk_1_sg_x84,
      clr => '0',
      d0 => delay_slr_q_net_x0,
      d1 => concat_y_net_x10,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x84,
      clk => clk_1_sg_x84,
      clr => '0',
      d0 => concat_y_net_x10,
      d1 => delay_slr_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 10,
      new_msb => 10,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x2,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 1,
      y_width => 1
    )
    port map (
      x(0) => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_833c6eac62: entity work.sync_delay_entity_833c6eac62
    port map (
      ce_1 => ce_1_sg_x84,
      clk_1 => clk_1_sg_x84,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_2/butterfly_direct/twiddle"

entity twiddle_entity_444bbba757 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(17 downto 0); 
    bw_re: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end twiddle_entity_444bbba757;

architecture structural of twiddle_entity_444bbba757 is
  signal ce_1_sg_x89: std_logic;
  signal clk_1_sg_x89: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay1_q_net: std_logic;
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(17 downto 0);
  signal mux_y_net_x2: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic;
  signal mux_y_net_x4: std_logic_vector(17 downto 0);
  signal negate1_op_net: std_logic_vector(17 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;

begin
  single_port_ram_data_out_net_x0 <= a;
  mux_y_net_x2 <= b;
  ce_1_sg_x89 <= ce_1;
  clk_1_sg_x89 <= clk_1;
  mux_y_net_x3 <= sync;
  a_im <= force_im_output_port_net_x2;
  a_re <= force_re_output_port_net_x2;
  bw_im <= mux1_y_net_x0;
  bw_re <= mux_y_net_x4;
  sync_out <= delay2_q_net_x0;

  c_to_ri1_fe3d233945: entity work.c_to_ri_entity_2485354a01
    port map (
      c => mux_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri_84673a3056: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_0260fba4aec82188",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x89,
      clk => clk_1_sg_x89,
      clr => '0',
      en => "1",
      rst(0) => delay1_q_net,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x89,
      clk => clk_1_sg_x89,
      d => single_port_ram_data_out_net_x0,
      en => '1',
      q => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x89,
      clk => clk_1_sg_x89,
      d(0) => mux_y_net_x3,
      en => '1',
      q(0) => delay1_q_net
    );

  delay2: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x89,
      clk => clk_1_sg_x89,
      d(0) => delay1_q_net,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x89,
      clk => clk_1_sg_x89,
      d => force_re_output_port_net_x1,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x89,
      clk => clk_1_sg_x89,
      d => force_im_output_port_net_x1,
      en => '1',
      q => delay4_q_net
    );

  mux: entity work.mux_74a3397f06
    port map (
      ce => ce_1_sg_x89,
      clk => clk_1_sg_x89,
      clr => '0',
      d0 => delay3_q_net,
      d1 => delay4_q_net,
      sel(0) => slice1_y_net,
      y => mux_y_net_x4
    );

  mux1: entity work.mux_74a3397f06
    port map (
      ce => ce_1_sg_x89,
      clk => clk_1_sg_x89,
      clr => '0',
      d0 => delay4_q_net,
      d1 => negate1_op_net,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  negate1: entity work.negate_5f0430c69b
    port map (
      ce => ce_1_sg_x89,
      clk => clk_1_sg_x89,
      clr => '0',
      ip => force_re_output_port_net_x1,
      op => negate1_op_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 9,
      new_msb => 9,
      x_width => 10,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_2/butterfly_direct"

entity butterfly_direct_entity_cb9f95a9cb is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_cb9f95a9cb;

architecture structural of butterfly_direct_entity_cb9f95a9cb is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub_s_net: std_logic_vector(18 downto 0);
  signal ce_1_sg_x90: std_logic;
  signal clk_1_sg_x90: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(19 downto 0);
  signal mux1_y_net_x1: std_logic_vector(17 downto 0);
  signal mux2_y_net_x0: std_logic_vector(19 downto 0);
  signal mux3_y_net_x0: std_logic_vector(19 downto 0);
  signal mux_y_net_x0: std_logic_vector(19 downto 0);
  signal mux_y_net_x4: std_logic_vector(17 downto 0);
  signal mux_y_net_x5: std_logic_vector(35 downto 0);
  signal mux_y_net_x6: std_logic;
  signal scale1_op_net: std_logic_vector(18 downto 0);
  signal scale2_op_net: std_logic_vector(18 downto 0);
  signal scale3_op_net: std_logic_vector(18 downto 0);
  signal scale_op_net: std_logic_vector(18 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(35 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  single_port_ram_data_out_net_x1 <= a;
  mux_y_net_x5 <= b;
  ce_1_sg_x90 <= ce_1;
  clk_1_sg_x90 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x6 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  addsub: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => mux_y_net_x4,
      ce => ce_1_sg_x90,
      clk => clk_1_sg_x90,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_im_output_port_net_x2,
      b => mux1_y_net_x1,
      ce => ce_1_sg_x90,
      clk => clk_1_sg_x90,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_3b890bd063
    port map (
      a => force_re_output_port_net_x2,
      b => mux_y_net_x4,
      ce => ce_1_sg_x90,
      clk => clk_1_sg_x90,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x2,
      b => mux1_y_net_x1,
      ce => ce_1_sg_x90,
      clk => clk_1_sg_x90,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_7c434675cc: entity work.convert_of1_entity_0aa7df2edc
    port map (
      ce_1 => ce_1_sg_x90,
      clk_1 => clk_1_sg_x90,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_c14853ba1a: entity work.convert_of1_entity_0aa7df2edc
    port map (
      ce_1 => ce_1_sg_x90,
      clk_1 => clk_1_sg_x90,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_e748b57ca7: entity work.convert_of1_entity_0aa7df2edc
    port map (
      ce_1 => ce_1_sg_x90,
      clk_1 => clk_1_sg_x90,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_3e0317de47: entity work.convert_of1_entity_0aa7df2edc
    port map (
      ce_1 => ce_1_sg_x90,
      clk_1 => clk_1_sg_x90,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x90,
      clk => clk_1_sg_x90,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x90,
      clk => clk_1_sg_x90,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_610aab71b1
    port map (
      ce => ce_1_sg_x90,
      clk => clk_1_sg_x90,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_610aab71b1
    port map (
      ce => ce_1_sg_x90,
      clk => clk_1_sg_x90,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_610aab71b1
    port map (
      ce => ce_1_sg_x90,
      clk => clk_1_sg_x90,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_610aab71b1
    port map (
      ce => ce_1_sg_x90,
      clk => clk_1_sg_x90,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_e52315252e: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x3
    );

  ri_to_c_8f343378a8: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x2
    );

  scale: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_9f61027ba4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_444bbba757: entity work.twiddle_entity_444bbba757
    port map (
      a => single_port_ram_data_out_net_x1,
      b => mux_y_net_x5,
      ce_1 => ce_1_sg_x90,
      clk_1 => clk_1_sg_x90,
      sync => mux_y_net_x6,
      a_im => force_im_output_port_net_x2,
      a_re => force_re_output_port_net_x2,
      bw_im => mux1_y_net_x1,
      bw_re => mux_y_net_x4,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_2/delay_b"

entity delay_b_entity_7749657680 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_7749657680;

architecture structural of delay_b_entity_7749657680 is
  signal ce_1_sg_x91: std_logic;
  signal clk_1_sg_x91: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x91 <= ce_1;
  clk_1_sg_x91 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x2;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 509,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_7211a68acc7f4ff7",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x91,
      clk => clk_1_sg_x91,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 9,
      c_width => 36,
      core_name0 => "single_port_block_memory_virtex2p_6_1_8d0734a7cdba160c",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x91,
      clk => clk_1_sg_x91,
      data_in => mux1_y_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_2/sync_delay"

entity sync_delay_entity_fb1e034149 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_fb1e034149;

architecture structural of sync_delay_entity_fb1e034149 is
  signal ce_1_sg_x93: std_logic;
  signal clk_1_sg_x93: std_logic;
  signal constant1_op_net: std_logic_vector(9 downto 0);
  signal constant2_op_net: std_logic_vector(9 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(9 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x7: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x93 <= ce_1;
  clk_1_sg_x93 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x7;

  constant1: entity work.constant_498bc68c14
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_fbc2f0cce1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_f1ac4bddff
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_a071675f8d8d72bb",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x93,
      clk => clk_1_sg_x93,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x7
    );

  relational: entity work.relational_0ffd72e037
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_f6702ea2f7
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_2"

entity fft_stage_2_entity_4f180e53e6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_2_entity_4f180e53e6;

architecture structural of fft_stage_2_entity_4f180e53e6 is
  signal ce_1_sg_x94: std_logic;
  signal clk_1_sg_x94: std_logic;
  signal concat_y_net_x10: std_logic_vector(35 downto 0);
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic_vector(35 downto 0);
  signal mux_y_net_x7: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x3: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x94 <= ce_1;
  clk_1_sg_x94 <= clk_1;
  concat_y_net_x7 <= in1;
  concat_y_net_x9 <= in2;
  slice21_y_net_x3 <= shift;
  delay_q_net_x3 <= sync;
  out1 <= concat_y_net_x10;
  out2 <= concat_y_net_x11;
  sync_out <= delay_q_net_x4;

  butterfly_direct_cb9f95a9cb: entity work.butterfly_direct_entity_cb9f95a9cb
    port map (
      a => single_port_ram_data_out_net_x2,
      b => mux_y_net_x5,
      ce_1 => ce_1_sg_x94,
      clk_1 => clk_1_sg_x94,
      shift => slice_y_net_x0,
      sync => mux_y_net_x7,
      a_bw => concat_y_net_x10,
      a_bw_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x4
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x94,
      clk => clk_1_sg_x94,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x3,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x94,
      clk => clk_1_sg_x94,
      d(0) => delay_q_net_x3,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_7749657680: entity work.delay_b_entity_7749657680
    port map (
      ce_1 => ce_1_sg_x94,
      clk_1 => clk_1_sg_x94,
      in1 => mux1_y_net_x0,
      out1 => single_port_ram_data_out_net_x2
    );

  delay_f_d8b2003679: entity work.delay_b_entity_7749657680
    port map (
      ce_1 => ce_1_sg_x94,
      clk_1 => clk_1_sg_x94,
      in1 => concat_y_net_x9,
      out1 => single_port_ram_data_out_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x94,
      clk => clk_1_sg_x94,
      clr => '0',
      d0 => single_port_ram_data_out_net_x0,
      d1 => concat_y_net_x7,
      sel(0) => slice1_y_net,
      y => mux_y_net_x5
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x94,
      clk => clk_1_sg_x94,
      clr => '0',
      d0 => concat_y_net_x7,
      d1 => single_port_ram_data_out_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x3,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 9,
      new_msb => 9,
      x_width => 10,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_fb1e034149: entity work.sync_delay_entity_fb1e034149
    port map (
      ce_1 => ce_1_sg_x94,
      clk_1 => clk_1_sg_x94,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x7
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_3/butterfly_direct/twiddle/coeff_gen"

entity coeff_gen_entity_e26d6c53fd is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_e26d6c53fd;

architecture structural of coeff_gen_entity_e26d6c53fd is
  signal ce_1_sg_x99: std_logic;
  signal clk_1_sg_x99: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(1 downto 0);

begin
  ce_1_sg_x99 <= ce_1;
  clk_1_sg_x99 <= clk_1;
  mux_y_net_x0 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x99,
      clk => clk_1_sg_x99,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x0,
      op => counter_op_net
    );

  ri_to_c_ce4c7deeb3: entity work.ri_to_c_entity_7019693a09
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom_dist
    generic map (
      addr_width => 2,
      c_address_width => 4,
      c_width => 18,
      core_name0 => "distributed_memory_virtex2p_7_1_24095e62b7dd5149",
      latency => 2
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x99,
      clk => clk_1_sg_x99,
      en => "1",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom_dist
    generic map (
      addr_width => 2,
      c_address_width => 4,
      c_width => 18,
      core_name0 => "distributed_memory_virtex2p_7_1_ff1763ab93720ffc",
      latency => 2
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x99,
      clk => clk_1_sg_x99,
      en => "1",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 9,
      x_width => 10,
      y_width => 2
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_3/butterfly_direct/twiddle"

entity twiddle_entity_3a0e8a7a27 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_entity_3a0e8a7a27;

architecture structural of twiddle_entity_3a0e8a7a27 is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x103: std_logic;
  signal clk_1_sg_x103: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net: std_logic_vector(17 downto 0);
  signal convert2_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(20 downto 0);
  signal convert_dout_net_x1: std_logic_vector(20 downto 0);
  signal convert_dout_net_x2: std_logic_vector(20 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay5_q_net: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net_x0: std_logic_vector(35 downto 0);
  signal mult2_p_net_x0: std_logic_vector(35 downto 0);
  signal mult_p_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);

begin
  single_port_ram_data_out_net_x0 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x103 <= ce_1;
  clk_1_sg_x103 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= addsub4_s_net_x0;
  bw_re <= addsub_s_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_6e32911fe1
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x1,
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      clr => '0',
      s => addsub_s_net_x0
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x1,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      clr => '0',
      s => addsub3_s_net
    );

  addsub4: entity work.addsub_f6ef4de287
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x2,
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      clr => '0',
      s => addsub4_s_net_x0
    );

  c_to_ri1_678fbdfaf9: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_426836d135: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_b59d1d1e00: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_e26d6c53fd: entity work.coeff_gen_entity_e26d6c53fd
    port map (
      ce_1 => ce_1_sg_x103,
      clk_1 => clk_1_sg_x103,
      rst => mux_y_net_x2,
      w => concat_y_net_x2
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub1_s_net,
      dout => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub2_s_net,
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub3_s_net,
      dout => convert2_dout_net
    );

  convert_of1_bba4688fae: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x103,
      clk_1 => clk_1_sg_x103,
      din => mult1_p_net_x0,
      dout => convert_dout_net_x1
    );

  convert_of2_5a633ea86e: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x103,
      clk_1 => clk_1_sg_x103,
      din => mult2_p_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of_8ecbe20da7: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x103,
      clk_1 => clk_1_sg_x103,
      din => mult_p_net_x0,
      dout => convert_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      d => single_port_ram_data_out_net_x0,
      en => '1',
      q => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      d => mux_y_net_x1,
      en => '1',
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      d => force_re_output_port_net_x2,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      d => force_im_output_port_net_x2,
      en => '1',
      q => delay4_q_net
    );

  delay5: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      d => force_re_output_port_net_x1,
      en => '1',
      q => delay5_q_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 17,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => convert_dout_net,
      b => delay5_q_net,
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      clr => '0',
      core_ce => ce_1_sg_x103,
      core_clk => clk_1_sg_x103,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay4_q_net,
      b => convert1_dout_net,
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      clr => '0',
      core_ce => ce_1_sg_x103,
      core_clk => clk_1_sg_x103,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  mult2: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay3_q_net,
      b => convert2_dout_net,
      ce => ce_1_sg_x103,
      clk => clk_1_sg_x103,
      clr => '0',
      core_ce => ce_1_sg_x103,
      core_clk => clk_1_sg_x103,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_3/butterfly_direct"

entity butterfly_direct_entity_6448610740 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_6448610740;

architecture structural of butterfly_direct_entity_6448610740 is
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net: std_logic_vector(22 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x104: std_logic;
  signal clk_1_sg_x104: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal scale_op_net: std_logic_vector(22 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(35 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  single_port_ram_data_out_net_x1 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x104 <= ce_1;
  clk_1_sg_x104 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  addsub: entity work.addsub_b167d676fa
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x104,
      clk => clk_1_sg_x104,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_b167d676fa
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x104,
      clk => clk_1_sg_x104,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_0816bd8680
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x104,
      clk => clk_1_sg_x104,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_0816bd8680
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x104,
      clk => clk_1_sg_x104,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_120c82269b: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x104,
      clk_1 => clk_1_sg_x104,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_02493d1f00: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x104,
      clk_1 => clk_1_sg_x104,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_aec6c56671: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x104,
      clk_1 => clk_1_sg_x104,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_c267f9472f: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x104,
      clk_1 => clk_1_sg_x104,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x104,
      clk => clk_1_sg_x104,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x104,
      clk => clk_1_sg_x104,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x104,
      clk => clk_1_sg_x104,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x104,
      clk => clk_1_sg_x104,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x104,
      clk => clk_1_sg_x104,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x104,
      clk => clk_1_sg_x104,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_e6f8a4ac4d: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x3
    );

  ri_to_c_9dd03b7062: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x2
    );

  scale: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_3a0e8a7a27: entity work.twiddle_entity_3a0e8a7a27
    port map (
      a => single_port_ram_data_out_net_x1,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x104,
      clk_1 => clk_1_sg_x104,
      sync => mux_y_net_x4,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => addsub4_s_net_x0,
      bw_re => addsub_s_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_3/delay_b"

entity delay_b_entity_4954c80b85 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_4954c80b85;

architecture structural of delay_b_entity_4954c80b85 is
  signal ce_1_sg_x105: std_logic;
  signal clk_1_sg_x105: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x105 <= ce_1;
  clk_1_sg_x105 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x2;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 253,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_f458cc5f96972819",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x105,
      clk => clk_1_sg_x105,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 8,
      c_width => 36,
      core_name0 => "single_port_block_memory_virtex2p_6_1_a0f8113050ab47e7",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x105,
      clk => clk_1_sg_x105,
      data_in => mux1_y_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_3/sync_delay"

entity sync_delay_entity_c42a107fb2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_c42a107fb2;

architecture structural of sync_delay_entity_c42a107fb2 is
  signal ce_1_sg_x107: std_logic;
  signal clk_1_sg_x107: std_logic;
  signal constant1_op_net: std_logic_vector(8 downto 0);
  signal constant2_op_net: std_logic_vector(8 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(8 downto 0);
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x107 <= ce_1;
  clk_1_sg_x107 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_fd85eb7067
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_4a391b9a0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_b4ec9de7d1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_715f1205a46a625c",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x107,
      clk => clk_1_sg_x107,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_6c3ee657fa
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_78eac2928d
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_3"

entity fft_stage_3_entity_bf18bfd94a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_3_entity_bf18bfd94a;

architecture structural of fft_stage_3_entity_bf18bfd94a is
  signal ce_1_sg_x108: std_logic;
  signal clk_1_sg_x108: std_logic;
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x13: std_logic_vector(35 downto 0);
  signal concat_y_net_x14: std_logic_vector(35 downto 0);
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x6: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x4: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x108 <= ce_1;
  clk_1_sg_x108 <= clk_1;
  concat_y_net_x11 <= in1;
  concat_y_net_x13 <= in2;
  slice21_y_net_x4 <= shift;
  delay_q_net_x5 <= sync;
  out1 <= concat_y_net_x4;
  out2 <= concat_y_net_x14;
  sync_out <= delay_q_net_x6;

  butterfly_direct_6448610740: entity work.butterfly_direct_entity_6448610740
    port map (
      a => single_port_ram_data_out_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x108,
      clk_1 => clk_1_sg_x108,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x4,
      a_bw_x0 => concat_y_net_x14,
      sync_out => delay_q_net_x6
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7211a68acc7f4ff7",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x108,
      clk => clk_1_sg_x108,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x5,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x108,
      clk => clk_1_sg_x108,
      d(0) => delay_q_net_x5,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_4954c80b85: entity work.delay_b_entity_4954c80b85
    port map (
      ce_1 => ce_1_sg_x108,
      clk_1 => clk_1_sg_x108,
      in1 => mux1_y_net_x0,
      out1 => single_port_ram_data_out_net_x2
    );

  delay_f_b4600b859a: entity work.delay_b_entity_4954c80b85
    port map (
      ce_1 => ce_1_sg_x108,
      clk_1 => clk_1_sg_x108,
      in1 => concat_y_net_x13,
      out1 => single_port_ram_data_out_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x108,
      clk => clk_1_sg_x108,
      clr => '0',
      d0 => single_port_ram_data_out_net_x0,
      d1 => concat_y_net_x11,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x108,
      clk => clk_1_sg_x108,
      clr => '0',
      d0 => concat_y_net_x11,
      d1 => single_port_ram_data_out_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x4,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 8,
      x_width => 9,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_c42a107fb2: entity work.sync_delay_entity_c42a107fb2
    port map (
      ce_1 => ce_1_sg_x108,
      clk_1 => clk_1_sg_x108,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_4/butterfly_direct/twiddle/coeff_gen"

entity coeff_gen_entity_6c6d6f9ac5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_6c6d6f9ac5;

architecture structural of coeff_gen_entity_6c6d6f9ac5 is
  signal ce_1_sg_x113: std_logic;
  signal clk_1_sg_x113: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(2 downto 0);

begin
  ce_1_sg_x113 <= ce_1;
  clk_1_sg_x113 <= clk_1;
  mux_y_net_x0 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x113,
      clk => clk_1_sg_x113,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x0,
      op => counter_op_net
    );

  ri_to_c_4341f466ed: entity work.ri_to_c_entity_7019693a09
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 3,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_05a95f2267c44dc1",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x113,
      clk => clk_1_sg_x113,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 3,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_d8668151357aa642",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x113,
      clk => clk_1_sg_x113,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 7,
      new_msb => 9,
      x_width => 10,
      y_width => 3
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_4/butterfly_direct/twiddle"

entity twiddle_entity_49b86cc08f is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_entity_49b86cc08f;

architecture structural of twiddle_entity_49b86cc08f is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x117: std_logic;
  signal clk_1_sg_x117: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net: std_logic_vector(17 downto 0);
  signal convert2_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(20 downto 0);
  signal convert_dout_net_x1: std_logic_vector(20 downto 0);
  signal convert_dout_net_x2: std_logic_vector(20 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay5_q_net: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net_x0: std_logic_vector(35 downto 0);
  signal mult2_p_net_x0: std_logic_vector(35 downto 0);
  signal mult_p_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);

begin
  single_port_ram_data_out_net_x0 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x117 <= ce_1;
  clk_1_sg_x117 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= addsub4_s_net_x0;
  bw_re <= addsub_s_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_6e32911fe1
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x1,
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      clr => '0',
      s => addsub_s_net_x0
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x1,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      clr => '0',
      s => addsub3_s_net
    );

  addsub4: entity work.addsub_f6ef4de287
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x2,
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      clr => '0',
      s => addsub4_s_net_x0
    );

  c_to_ri1_7e02a1cb75: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_8cc61794c1: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_29434336bd: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_6c6d6f9ac5: entity work.coeff_gen_entity_6c6d6f9ac5
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      rst => mux_y_net_x2,
      w => concat_y_net_x2
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub1_s_net,
      dout => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub2_s_net,
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub3_s_net,
      dout => convert2_dout_net
    );

  convert_of1_636af61155: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      din => mult1_p_net_x0,
      dout => convert_dout_net_x1
    );

  convert_of2_fd8b1ccee4: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      din => mult2_p_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of_83bcf799e2: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x117,
      clk_1 => clk_1_sg_x117,
      din => mult_p_net_x0,
      dout => convert_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      d => single_port_ram_data_out_net_x0,
      en => '1',
      q => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      d => mux_y_net_x1,
      en => '1',
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      d => force_re_output_port_net_x2,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      d => force_im_output_port_net_x2,
      en => '1',
      q => delay4_q_net
    );

  delay5: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      d => force_re_output_port_net_x1,
      en => '1',
      q => delay5_q_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 17,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => convert_dout_net,
      b => delay5_q_net,
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      clr => '0',
      core_ce => ce_1_sg_x117,
      core_clk => clk_1_sg_x117,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay4_q_net,
      b => convert1_dout_net,
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      clr => '0',
      core_ce => ce_1_sg_x117,
      core_clk => clk_1_sg_x117,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  mult2: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay3_q_net,
      b => convert2_dout_net,
      ce => ce_1_sg_x117,
      clk => clk_1_sg_x117,
      clr => '0',
      core_ce => ce_1_sg_x117,
      core_clk => clk_1_sg_x117,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_4/butterfly_direct"

entity butterfly_direct_entity_c0713d15de is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_c0713d15de;

architecture structural of butterfly_direct_entity_c0713d15de is
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net: std_logic_vector(22 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x118: std_logic;
  signal clk_1_sg_x118: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal scale_op_net: std_logic_vector(22 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(35 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  single_port_ram_data_out_net_x1 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x118 <= ce_1;
  clk_1_sg_x118 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  addsub: entity work.addsub_b167d676fa
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x118,
      clk => clk_1_sg_x118,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_b167d676fa
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x118,
      clk => clk_1_sg_x118,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_0816bd8680
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x118,
      clk => clk_1_sg_x118,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_0816bd8680
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x118,
      clk => clk_1_sg_x118,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_06280f0c92: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x118,
      clk_1 => clk_1_sg_x118,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_faea34dd66: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x118,
      clk_1 => clk_1_sg_x118,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_cfd6c530bd: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x118,
      clk_1 => clk_1_sg_x118,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_973ff057e2: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x118,
      clk_1 => clk_1_sg_x118,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x118,
      clk => clk_1_sg_x118,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x118,
      clk => clk_1_sg_x118,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x118,
      clk => clk_1_sg_x118,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x118,
      clk => clk_1_sg_x118,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x118,
      clk => clk_1_sg_x118,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x118,
      clk => clk_1_sg_x118,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_8c50301c4e: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x3
    );

  ri_to_c_e3c84816f8: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x2
    );

  scale: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_49b86cc08f: entity work.twiddle_entity_49b86cc08f
    port map (
      a => single_port_ram_data_out_net_x1,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x118,
      clk_1 => clk_1_sg_x118,
      sync => mux_y_net_x4,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => addsub4_s_net_x0,
      bw_re => addsub_s_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_4/delay_b"

entity delay_b_entity_c43e2ddf0a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_c43e2ddf0a;

architecture structural of delay_b_entity_c43e2ddf0a is
  signal ce_1_sg_x119: std_logic;
  signal clk_1_sg_x119: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(6 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x119 <= ce_1;
  clk_1_sg_x119 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x2;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 125,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_045f95c1d8e99a77",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 7
    )
    port map (
      ce => ce_1_sg_x119,
      clk => clk_1_sg_x119,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 7,
      c_width => 36,
      core_name0 => "single_port_block_memory_virtex2p_6_1_76f23c1003bb9b77",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x119,
      clk => clk_1_sg_x119,
      data_in => mux1_y_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_4/sync_delay"

entity sync_delay_entity_36ece37c7c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_36ece37c7c;

architecture structural of sync_delay_entity_36ece37c7c is
  signal ce_1_sg_x121: std_logic;
  signal clk_1_sg_x121: std_logic;
  signal constant1_op_net: std_logic_vector(7 downto 0);
  signal constant2_op_net: std_logic_vector(7 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(7 downto 0);
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x121 <= ce_1;
  clk_1_sg_x121 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_91ef1678ca
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_e8aae5d3bb
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_b437b02512
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_2d20805488fc03df",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x121,
      clk => clk_1_sg_x121,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_54048c8b02
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_16235eb2bf
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_4"

entity fft_stage_4_entity_636be03632 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_4_entity_636be03632;

architecture structural of fft_stage_4_entity_636be03632 is
  signal ce_1_sg_x122: std_logic;
  signal clk_1_sg_x122: std_logic;
  signal concat_y_net_x16: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(7 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x7: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x5: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x122 <= ce_1;
  clk_1_sg_x122 <= clk_1;
  concat_y_net_x5 <= in1;
  concat_y_net_x16 <= in2;
  slice21_y_net_x5 <= shift;
  delay_q_net_x7 <= sync;
  out1 <= concat_y_net_x6;
  out2 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  butterfly_direct_c0713d15de: entity work.butterfly_direct_entity_c0713d15de
    port map (
      a => single_port_ram_data_out_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x122,
      clk_1 => clk_1_sg_x122,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x6,
      a_bw_x0 => concat_y_net_x7,
      sync_out => delay_q_net_x2
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_f458cc5f96972819",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x122,
      clk => clk_1_sg_x122,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x7,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x122,
      clk => clk_1_sg_x122,
      d(0) => delay_q_net_x7,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_c43e2ddf0a: entity work.delay_b_entity_c43e2ddf0a
    port map (
      ce_1 => ce_1_sg_x122,
      clk_1 => clk_1_sg_x122,
      in1 => mux1_y_net_x0,
      out1 => single_port_ram_data_out_net_x2
    );

  delay_f_d3c3b5b6d3: entity work.delay_b_entity_c43e2ddf0a
    port map (
      ce_1 => ce_1_sg_x122,
      clk_1 => clk_1_sg_x122,
      in1 => concat_y_net_x16,
      out1 => single_port_ram_data_out_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x122,
      clk => clk_1_sg_x122,
      clr => '0',
      d0 => single_port_ram_data_out_net_x0,
      d1 => concat_y_net_x5,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x122,
      clk => clk_1_sg_x122,
      clr => '0',
      d0 => concat_y_net_x5,
      d1 => single_port_ram_data_out_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 3,
      new_msb => 3,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x5,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 7,
      new_msb => 7,
      x_width => 8,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_36ece37c7c: entity work.sync_delay_entity_36ece37c7c
    port map (
      ce_1 => ce_1_sg_x122,
      clk_1 => clk_1_sg_x122,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_5/butterfly_direct/twiddle/coeff_gen"

entity coeff_gen_entity_2a092a5352 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_2a092a5352;

architecture structural of coeff_gen_entity_2a092a5352 is
  signal ce_1_sg_x127: std_logic;
  signal clk_1_sg_x127: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(3 downto 0);

begin
  ce_1_sg_x127 <= ce_1;
  clk_1_sg_x127 <= clk_1;
  mux_y_net_x0 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x127,
      clk => clk_1_sg_x127,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x0,
      op => counter_op_net
    );

  ri_to_c_ff66143309: entity work.ri_to_c_entity_7019693a09
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 4,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_3f3ce445ea788123",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x127,
      clk => clk_1_sg_x127,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 4,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_23fb8628204eb2c1",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x127,
      clk => clk_1_sg_x127,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 9,
      x_width => 10,
      y_width => 4
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_5/butterfly_direct/twiddle"

entity twiddle_entity_188df1471a is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_entity_188df1471a;

architecture structural of twiddle_entity_188df1471a is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x131: std_logic;
  signal clk_1_sg_x131: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net: std_logic_vector(17 downto 0);
  signal convert2_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(20 downto 0);
  signal convert_dout_net_x1: std_logic_vector(20 downto 0);
  signal convert_dout_net_x2: std_logic_vector(20 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay5_q_net: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net_x0: std_logic_vector(35 downto 0);
  signal mult2_p_net_x0: std_logic_vector(35 downto 0);
  signal mult_p_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);

begin
  single_port_ram_data_out_net_x0 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x131 <= ce_1;
  clk_1_sg_x131 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= addsub4_s_net_x0;
  bw_re <= addsub_s_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_6e32911fe1
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x1,
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      clr => '0',
      s => addsub_s_net_x0
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x1,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      clr => '0',
      s => addsub3_s_net
    );

  addsub4: entity work.addsub_f6ef4de287
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x2,
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      clr => '0',
      s => addsub4_s_net_x0
    );

  c_to_ri1_1f05fcf5e2: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_8f787a9591: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_d8597c93a5: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_2a092a5352: entity work.coeff_gen_entity_2a092a5352
    port map (
      ce_1 => ce_1_sg_x131,
      clk_1 => clk_1_sg_x131,
      rst => mux_y_net_x2,
      w => concat_y_net_x2
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub1_s_net,
      dout => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub2_s_net,
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub3_s_net,
      dout => convert2_dout_net
    );

  convert_of1_b0a11f6f35: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x131,
      clk_1 => clk_1_sg_x131,
      din => mult1_p_net_x0,
      dout => convert_dout_net_x1
    );

  convert_of2_9a578b1dc6: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x131,
      clk_1 => clk_1_sg_x131,
      din => mult2_p_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of_99de391e81: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x131,
      clk_1 => clk_1_sg_x131,
      din => mult_p_net_x0,
      dout => convert_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      d => single_port_ram_data_out_net_x0,
      en => '1',
      q => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      d => mux_y_net_x1,
      en => '1',
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      d => force_re_output_port_net_x2,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      d => force_im_output_port_net_x2,
      en => '1',
      q => delay4_q_net
    );

  delay5: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      d => force_re_output_port_net_x1,
      en => '1',
      q => delay5_q_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 17,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => convert_dout_net,
      b => delay5_q_net,
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      clr => '0',
      core_ce => ce_1_sg_x131,
      core_clk => clk_1_sg_x131,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay4_q_net,
      b => convert1_dout_net,
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      clr => '0',
      core_ce => ce_1_sg_x131,
      core_clk => clk_1_sg_x131,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  mult2: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay3_q_net,
      b => convert2_dout_net,
      ce => ce_1_sg_x131,
      clk => clk_1_sg_x131,
      clr => '0',
      core_ce => ce_1_sg_x131,
      core_clk => clk_1_sg_x131,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_5/butterfly_direct"

entity butterfly_direct_entity_1a3d93e790 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_1a3d93e790;

architecture structural of butterfly_direct_entity_1a3d93e790 is
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net: std_logic_vector(22 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x132: std_logic;
  signal clk_1_sg_x132: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal scale_op_net: std_logic_vector(22 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(35 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  single_port_ram_data_out_net_x1 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x132 <= ce_1;
  clk_1_sg_x132 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  addsub: entity work.addsub_b167d676fa
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x132,
      clk => clk_1_sg_x132,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_b167d676fa
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x132,
      clk => clk_1_sg_x132,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_0816bd8680
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x132,
      clk => clk_1_sg_x132,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_0816bd8680
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x132,
      clk => clk_1_sg_x132,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_3592222576: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x132,
      clk_1 => clk_1_sg_x132,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_254a3ee58c: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x132,
      clk_1 => clk_1_sg_x132,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_231d01a908: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x132,
      clk_1 => clk_1_sg_x132,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_658f8cf862: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x132,
      clk_1 => clk_1_sg_x132,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x132,
      clk => clk_1_sg_x132,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x132,
      clk => clk_1_sg_x132,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x132,
      clk => clk_1_sg_x132,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x132,
      clk => clk_1_sg_x132,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x132,
      clk => clk_1_sg_x132,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x132,
      clk => clk_1_sg_x132,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_7f6bd50721: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x3
    );

  ri_to_c_01225f63e8: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x2
    );

  scale: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_188df1471a: entity work.twiddle_entity_188df1471a
    port map (
      a => single_port_ram_data_out_net_x1,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x132,
      clk_1 => clk_1_sg_x132,
      sync => mux_y_net_x4,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => addsub4_s_net_x0,
      bw_re => addsub_s_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_5/delay_b"

entity delay_b_entity_ee04a0ccc8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_ee04a0ccc8;

architecture structural of delay_b_entity_ee04a0ccc8 is
  signal ce_1_sg_x133: std_logic;
  signal clk_1_sg_x133: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(5 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x133 <= ce_1;
  clk_1_sg_x133 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x2;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 61,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_52d6d6d99674748f",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 6
    )
    port map (
      ce => ce_1_sg_x133,
      clk => clk_1_sg_x133,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 6,
      c_width => 36,
      core_name0 => "single_port_block_memory_virtex2p_6_1_e603086fb92aeb5e",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x133,
      clk => clk_1_sg_x133,
      data_in => mux1_y_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_5/sync_delay"

entity sync_delay_entity_312fd52df6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_312fd52df6;

architecture structural of sync_delay_entity_312fd52df6 is
  signal ce_1_sg_x135: std_logic;
  signal clk_1_sg_x135: std_logic;
  signal constant1_op_net: std_logic_vector(6 downto 0);
  signal constant2_op_net: std_logic_vector(6 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(6 downto 0);
  signal counter_op_net: std_logic_vector(6 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x135 <= ce_1;
  clk_1_sg_x135 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_7244cd602b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_7b07120b87
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_180df391de
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7cce54a04f39ecd8",
      op_arith => xlUnsigned,
      op_width => 7
    )
    port map (
      ce => ce_1_sg_x135,
      clk => clk_1_sg_x135,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_9a3978c602
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_23065a6aa3
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_5"

entity fft_stage_5_entity_fe11e402bc is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_5_entity_fe11e402bc;

architecture structural of fft_stage_5_entity_fe11e402bc is
  signal ce_1_sg_x136: std_logic;
  signal clk_1_sg_x136: std_logic;
  signal concat_y_net_x10: std_logic_vector(35 downto 0);
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(6 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x6: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x136 <= ce_1;
  clk_1_sg_x136 <= clk_1;
  concat_y_net_x7 <= in1;
  concat_y_net_x9 <= in2;
  slice21_y_net_x6 <= shift;
  delay_q_net_x3 <= sync;
  out1 <= concat_y_net_x10;
  out2 <= concat_y_net_x11;
  sync_out <= delay_q_net_x4;

  butterfly_direct_1a3d93e790: entity work.butterfly_direct_entity_1a3d93e790
    port map (
      a => single_port_ram_data_out_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x136,
      clk_1 => clk_1_sg_x136,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x10,
      a_bw_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x4
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_045f95c1d8e99a77",
      op_arith => xlUnsigned,
      op_width => 7
    )
    port map (
      ce => ce_1_sg_x136,
      clk => clk_1_sg_x136,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x3,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x136,
      clk => clk_1_sg_x136,
      d(0) => delay_q_net_x3,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_ee04a0ccc8: entity work.delay_b_entity_ee04a0ccc8
    port map (
      ce_1 => ce_1_sg_x136,
      clk_1 => clk_1_sg_x136,
      in1 => mux1_y_net_x0,
      out1 => single_port_ram_data_out_net_x2
    );

  delay_f_e76eb6d812: entity work.delay_b_entity_ee04a0ccc8
    port map (
      ce_1 => ce_1_sg_x136,
      clk_1 => clk_1_sg_x136,
      in1 => concat_y_net_x9,
      out1 => single_port_ram_data_out_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x136,
      clk => clk_1_sg_x136,
      clr => '0',
      d0 => single_port_ram_data_out_net_x0,
      d1 => concat_y_net_x7,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x136,
      clk => clk_1_sg_x136,
      clr => '0',
      d0 => concat_y_net_x7,
      d1 => single_port_ram_data_out_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 4,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x6,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 6,
      x_width => 7,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_312fd52df6: entity work.sync_delay_entity_312fd52df6
    port map (
      ce_1 => ce_1_sg_x136,
      clk_1 => clk_1_sg_x136,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_6/butterfly_direct/twiddle/coeff_gen"

entity coeff_gen_entity_bfe45ec504 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_bfe45ec504;

architecture structural of coeff_gen_entity_bfe45ec504 is
  signal ce_1_sg_x141: std_logic;
  signal clk_1_sg_x141: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(4 downto 0);

begin
  ce_1_sg_x141 <= ce_1;
  clk_1_sg_x141 <= clk_1;
  mux_y_net_x0 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x141,
      clk => clk_1_sg_x141,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x0,
      op => counter_op_net
    );

  ri_to_c_19b649edd8: entity work.ri_to_c_entity_7019693a09
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 5,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_5d43f95b93fd9344",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x141,
      clk => clk_1_sg_x141,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 5,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_b70993b7b8d8be43",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x141,
      clk => clk_1_sg_x141,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 5,
      new_msb => 9,
      x_width => 10,
      y_width => 5
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_6/butterfly_direct/twiddle"

entity twiddle_entity_114c6663ca is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_entity_114c6663ca;

architecture structural of twiddle_entity_114c6663ca is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x145: std_logic;
  signal clk_1_sg_x145: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net: std_logic_vector(17 downto 0);
  signal convert2_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(20 downto 0);
  signal convert_dout_net_x1: std_logic_vector(20 downto 0);
  signal convert_dout_net_x2: std_logic_vector(20 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay5_q_net: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net_x0: std_logic_vector(35 downto 0);
  signal mult2_p_net_x0: std_logic_vector(35 downto 0);
  signal mult_p_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);

begin
  single_port_ram_data_out_net_x0 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x145 <= ce_1;
  clk_1_sg_x145 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= addsub4_s_net_x0;
  bw_re <= addsub_s_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_6e32911fe1
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x1,
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      clr => '0',
      s => addsub_s_net_x0
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x1,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      clr => '0',
      s => addsub3_s_net
    );

  addsub4: entity work.addsub_f6ef4de287
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x2,
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      clr => '0',
      s => addsub4_s_net_x0
    );

  c_to_ri1_8619534a85: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_dcb59f6dae: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_bdd4325746: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_bfe45ec504: entity work.coeff_gen_entity_bfe45ec504
    port map (
      ce_1 => ce_1_sg_x145,
      clk_1 => clk_1_sg_x145,
      rst => mux_y_net_x2,
      w => concat_y_net_x2
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub1_s_net,
      dout => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub2_s_net,
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub3_s_net,
      dout => convert2_dout_net
    );

  convert_of1_01ed60a50c: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x145,
      clk_1 => clk_1_sg_x145,
      din => mult1_p_net_x0,
      dout => convert_dout_net_x1
    );

  convert_of2_7b7e2e9a99: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x145,
      clk_1 => clk_1_sg_x145,
      din => mult2_p_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of_e6e6feb656: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x145,
      clk_1 => clk_1_sg_x145,
      din => mult_p_net_x0,
      dout => convert_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      d => single_port_ram_data_out_net_x0,
      en => '1',
      q => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      d => mux_y_net_x1,
      en => '1',
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      d => force_re_output_port_net_x2,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      d => force_im_output_port_net_x2,
      en => '1',
      q => delay4_q_net
    );

  delay5: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      d => force_re_output_port_net_x1,
      en => '1',
      q => delay5_q_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 17,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => convert_dout_net,
      b => delay5_q_net,
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      clr => '0',
      core_ce => ce_1_sg_x145,
      core_clk => clk_1_sg_x145,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay4_q_net,
      b => convert1_dout_net,
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      clr => '0',
      core_ce => ce_1_sg_x145,
      core_clk => clk_1_sg_x145,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  mult2: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay3_q_net,
      b => convert2_dout_net,
      ce => ce_1_sg_x145,
      clk => clk_1_sg_x145,
      clr => '0',
      core_ce => ce_1_sg_x145,
      core_clk => clk_1_sg_x145,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_6/butterfly_direct"

entity butterfly_direct_entity_433faf80cb is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_433faf80cb;

architecture structural of butterfly_direct_entity_433faf80cb is
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net: std_logic_vector(22 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x146: std_logic;
  signal clk_1_sg_x146: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal scale_op_net: std_logic_vector(22 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(35 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  single_port_ram_data_out_net_x1 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x146 <= ce_1;
  clk_1_sg_x146 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  addsub: entity work.addsub_b167d676fa
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x146,
      clk => clk_1_sg_x146,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_b167d676fa
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x146,
      clk => clk_1_sg_x146,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_0816bd8680
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x146,
      clk => clk_1_sg_x146,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_0816bd8680
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x146,
      clk => clk_1_sg_x146,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_036ef70071: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x146,
      clk_1 => clk_1_sg_x146,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_a6df49854c: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x146,
      clk_1 => clk_1_sg_x146,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_b734462dcf: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x146,
      clk_1 => clk_1_sg_x146,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_f1092390ef: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x146,
      clk_1 => clk_1_sg_x146,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x146,
      clk => clk_1_sg_x146,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x146,
      clk => clk_1_sg_x146,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x146,
      clk => clk_1_sg_x146,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x146,
      clk => clk_1_sg_x146,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x146,
      clk => clk_1_sg_x146,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x146,
      clk => clk_1_sg_x146,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_c1828986f0: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x3
    );

  ri_to_c_f07f00ca1f: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x2
    );

  scale: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_114c6663ca: entity work.twiddle_entity_114c6663ca
    port map (
      a => single_port_ram_data_out_net_x1,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x146,
      clk_1 => clk_1_sg_x146,
      sync => mux_y_net_x4,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => addsub4_s_net_x0,
      bw_re => addsub_s_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_6/delay_b"

entity delay_b_entity_79bf2d58e7 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_79bf2d58e7;

architecture structural of delay_b_entity_79bf2d58e7 is
  signal ce_1_sg_x147: std_logic;
  signal clk_1_sg_x147: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(4 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x147 <= ce_1;
  clk_1_sg_x147 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x2;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 29,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_dd549111ea74373d",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 5
    )
    port map (
      ce => ce_1_sg_x147,
      clk => clk_1_sg_x147,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 5,
      c_width => 36,
      core_name0 => "single_port_block_memory_virtex2p_6_1_7ff232eaea8dc2aa",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x147,
      clk => clk_1_sg_x147,
      data_in => mux1_y_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_6/sync_delay"

entity sync_delay_entity_70bb0e805f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_70bb0e805f;

architecture structural of sync_delay_entity_70bb0e805f is
  signal ce_1_sg_x149: std_logic;
  signal clk_1_sg_x149: std_logic;
  signal constant1_op_net: std_logic_vector(5 downto 0);
  signal constant2_op_net: std_logic_vector(5 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(5 downto 0);
  signal counter_op_net: std_logic_vector(5 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x149 <= ce_1;
  clk_1_sg_x149 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_7ea0f2fff7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_961b61f8a1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_a267c870be
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_880f7c3a3529b3b1",
      op_arith => xlUnsigned,
      op_width => 6
    )
    port map (
      ce => ce_1_sg_x149,
      clk => clk_1_sg_x149,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_931d61fb72
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_fe487ce1c7
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_6"

entity fft_stage_6_entity_52b85899f8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_6_entity_52b85899f8;

architecture structural of fft_stage_6_entity_52b85899f8 is
  signal ce_1_sg_x150: std_logic;
  signal clk_1_sg_x150: std_logic;
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x13: std_logic_vector(35 downto 0);
  signal concat_y_net_x14: std_logic_vector(35 downto 0);
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(5 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x6: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x7: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x150 <= ce_1;
  clk_1_sg_x150 <= clk_1;
  concat_y_net_x11 <= in1;
  concat_y_net_x13 <= in2;
  slice21_y_net_x7 <= shift;
  delay_q_net_x5 <= sync;
  out1 <= concat_y_net_x4;
  out2 <= concat_y_net_x14;
  sync_out <= delay_q_net_x6;

  butterfly_direct_433faf80cb: entity work.butterfly_direct_entity_433faf80cb
    port map (
      a => single_port_ram_data_out_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x150,
      clk_1 => clk_1_sg_x150,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x4,
      a_bw_x0 => concat_y_net_x14,
      sync_out => delay_q_net_x6
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_52d6d6d99674748f",
      op_arith => xlUnsigned,
      op_width => 6
    )
    port map (
      ce => ce_1_sg_x150,
      clk => clk_1_sg_x150,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x5,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x150,
      clk => clk_1_sg_x150,
      d(0) => delay_q_net_x5,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_79bf2d58e7: entity work.delay_b_entity_79bf2d58e7
    port map (
      ce_1 => ce_1_sg_x150,
      clk_1 => clk_1_sg_x150,
      in1 => mux1_y_net_x0,
      out1 => single_port_ram_data_out_net_x2
    );

  delay_f_ba0f9dd4aa: entity work.delay_b_entity_79bf2d58e7
    port map (
      ce_1 => ce_1_sg_x150,
      clk_1 => clk_1_sg_x150,
      in1 => concat_y_net_x13,
      out1 => single_port_ram_data_out_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x150,
      clk => clk_1_sg_x150,
      clr => '0',
      d0 => single_port_ram_data_out_net_x0,
      d1 => concat_y_net_x11,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x150,
      clk => clk_1_sg_x150,
      clr => '0',
      d0 => concat_y_net_x11,
      d1 => single_port_ram_data_out_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 5,
      new_msb => 5,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x7,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 5,
      new_msb => 5,
      x_width => 6,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_70bb0e805f: entity work.sync_delay_entity_70bb0e805f
    port map (
      ce_1 => ce_1_sg_x150,
      clk_1 => clk_1_sg_x150,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_7/butterfly_direct/twiddle/coeff_gen"

entity coeff_gen_entity_58a43f7506 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_58a43f7506;

architecture structural of coeff_gen_entity_58a43f7506 is
  signal ce_1_sg_x155: std_logic;
  signal clk_1_sg_x155: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(5 downto 0);

begin
  ce_1_sg_x155 <= ce_1;
  clk_1_sg_x155 <= clk_1;
  mux_y_net_x0 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x155,
      clk => clk_1_sg_x155,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x0,
      op => counter_op_net
    );

  ri_to_c_edaf74c6a4: entity work.ri_to_c_entity_7019693a09
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 6,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_42a5b8ca1bc39b96",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x155,
      clk => clk_1_sg_x155,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 6,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_8f872a02ff02aadb",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x155,
      clk => clk_1_sg_x155,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 9,
      x_width => 10,
      y_width => 6
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_7/butterfly_direct/twiddle"

entity twiddle_entity_e41c8973ab is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_entity_e41c8973ab;

architecture structural of twiddle_entity_e41c8973ab is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x159: std_logic;
  signal clk_1_sg_x159: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net: std_logic_vector(17 downto 0);
  signal convert2_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(20 downto 0);
  signal convert_dout_net_x1: std_logic_vector(20 downto 0);
  signal convert_dout_net_x2: std_logic_vector(20 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay5_q_net: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net_x0: std_logic_vector(35 downto 0);
  signal mult2_p_net_x0: std_logic_vector(35 downto 0);
  signal mult_p_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);

begin
  single_port_ram_data_out_net_x0 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x159 <= ce_1;
  clk_1_sg_x159 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= addsub4_s_net_x0;
  bw_re <= addsub_s_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_6e32911fe1
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x1,
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      clr => '0',
      s => addsub_s_net_x0
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x1,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      clr => '0',
      s => addsub3_s_net
    );

  addsub4: entity work.addsub_f6ef4de287
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x2,
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      clr => '0',
      s => addsub4_s_net_x0
    );

  c_to_ri1_8a5b1d4f5b: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_aaa0b4de6c: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_3ccdbfd046: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_58a43f7506: entity work.coeff_gen_entity_58a43f7506
    port map (
      ce_1 => ce_1_sg_x159,
      clk_1 => clk_1_sg_x159,
      rst => mux_y_net_x2,
      w => concat_y_net_x2
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub1_s_net,
      dout => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub2_s_net,
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub3_s_net,
      dout => convert2_dout_net
    );

  convert_of1_73311289f6: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x159,
      clk_1 => clk_1_sg_x159,
      din => mult1_p_net_x0,
      dout => convert_dout_net_x1
    );

  convert_of2_ee55c41b50: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x159,
      clk_1 => clk_1_sg_x159,
      din => mult2_p_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of_1f3fa56719: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x159,
      clk_1 => clk_1_sg_x159,
      din => mult_p_net_x0,
      dout => convert_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      d => single_port_ram_data_out_net_x0,
      en => '1',
      q => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      d => mux_y_net_x1,
      en => '1',
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      d => force_re_output_port_net_x2,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      d => force_im_output_port_net_x2,
      en => '1',
      q => delay4_q_net
    );

  delay5: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      d => force_re_output_port_net_x1,
      en => '1',
      q => delay5_q_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 17,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => convert_dout_net,
      b => delay5_q_net,
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      clr => '0',
      core_ce => ce_1_sg_x159,
      core_clk => clk_1_sg_x159,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay4_q_net,
      b => convert1_dout_net,
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      clr => '0',
      core_ce => ce_1_sg_x159,
      core_clk => clk_1_sg_x159,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  mult2: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay3_q_net,
      b => convert2_dout_net,
      ce => ce_1_sg_x159,
      clk => clk_1_sg_x159,
      clr => '0',
      core_ce => ce_1_sg_x159,
      core_clk => clk_1_sg_x159,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_7/butterfly_direct"

entity butterfly_direct_entity_d8828496c0 is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_d8828496c0;

architecture structural of butterfly_direct_entity_d8828496c0 is
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net: std_logic_vector(22 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x160: std_logic;
  signal clk_1_sg_x160: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal scale_op_net: std_logic_vector(22 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(35 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  single_port_ram_data_out_net_x1 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x160 <= ce_1;
  clk_1_sg_x160 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  addsub: entity work.addsub_b167d676fa
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x160,
      clk => clk_1_sg_x160,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_b167d676fa
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x160,
      clk => clk_1_sg_x160,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_0816bd8680
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x160,
      clk => clk_1_sg_x160,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_0816bd8680
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x160,
      clk => clk_1_sg_x160,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_b6b01308e6: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x160,
      clk_1 => clk_1_sg_x160,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_a66e0b878b: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x160,
      clk_1 => clk_1_sg_x160,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_15266f7b60: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x160,
      clk_1 => clk_1_sg_x160,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_ffcfa910b4: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x160,
      clk_1 => clk_1_sg_x160,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x160,
      clk => clk_1_sg_x160,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x160,
      clk => clk_1_sg_x160,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x160,
      clk => clk_1_sg_x160,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x160,
      clk => clk_1_sg_x160,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x160,
      clk => clk_1_sg_x160,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x160,
      clk => clk_1_sg_x160,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_fab3678563: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x3
    );

  ri_to_c_4e90187cd6: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x2
    );

  scale: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_e41c8973ab: entity work.twiddle_entity_e41c8973ab
    port map (
      a => single_port_ram_data_out_net_x1,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x160,
      clk_1 => clk_1_sg_x160,
      sync => mux_y_net_x4,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => addsub4_s_net_x0,
      bw_re => addsub_s_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_7/delay_b"

entity delay_b_entity_33018d6e55 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_33018d6e55;

architecture structural of delay_b_entity_33018d6e55 is
  signal ce_1_sg_x161: std_logic;
  signal clk_1_sg_x161: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(3 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x161 <= ce_1;
  clk_1_sg_x161 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x2;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 13,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_e80093aea990e7ea",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 4
    )
    port map (
      ce => ce_1_sg_x161,
      clk => clk_1_sg_x161,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 4,
      c_width => 36,
      core_name0 => "single_port_block_memory_virtex2p_6_1_7068db77349ce284",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x161,
      clk => clk_1_sg_x161,
      data_in => mux1_y_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_7/sync_delay"

entity sync_delay_entity_cf31187f8b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_cf31187f8b;

architecture structural of sync_delay_entity_cf31187f8b is
  signal ce_1_sg_x163: std_logic;
  signal clk_1_sg_x163: std_logic;
  signal constant1_op_net: std_logic_vector(4 downto 0);
  signal constant2_op_net: std_logic_vector(4 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(4 downto 0);
  signal counter_op_net: std_logic_vector(4 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x163 <= ce_1;
  clk_1_sg_x163 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_fe72737ca0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_ef0e2e5fc6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_582a3706dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_3241d5218ebd61cd",
      op_arith => xlUnsigned,
      op_width => 5
    )
    port map (
      ce => ce_1_sg_x163,
      clk => clk_1_sg_x163,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_9ece3c8c4e
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_dc5bc996c9
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_7"

entity fft_stage_7_entity_87efef01a9 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_7_entity_87efef01a9;

architecture structural of fft_stage_7_entity_87efef01a9 is
  signal ce_1_sg_x164: std_logic;
  signal clk_1_sg_x164: std_logic;
  signal concat_y_net_x16: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(4 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x2: std_logic;
  signal delay_q_net_x7: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x8: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x164 <= ce_1;
  clk_1_sg_x164 <= clk_1;
  concat_y_net_x5 <= in1;
  concat_y_net_x16 <= in2;
  slice21_y_net_x8 <= shift;
  delay_q_net_x7 <= sync;
  out1 <= concat_y_net_x6;
  out2 <= concat_y_net_x7;
  sync_out <= delay_q_net_x2;

  butterfly_direct_d8828496c0: entity work.butterfly_direct_entity_d8828496c0
    port map (
      a => single_port_ram_data_out_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x164,
      clk_1 => clk_1_sg_x164,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x6,
      a_bw_x0 => concat_y_net_x7,
      sync_out => delay_q_net_x2
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_dd549111ea74373d",
      op_arith => xlUnsigned,
      op_width => 5
    )
    port map (
      ce => ce_1_sg_x164,
      clk => clk_1_sg_x164,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x7,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x164,
      clk => clk_1_sg_x164,
      d(0) => delay_q_net_x7,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_33018d6e55: entity work.delay_b_entity_33018d6e55
    port map (
      ce_1 => ce_1_sg_x164,
      clk_1 => clk_1_sg_x164,
      in1 => mux1_y_net_x0,
      out1 => single_port_ram_data_out_net_x2
    );

  delay_f_6ebbc3a912: entity work.delay_b_entity_33018d6e55
    port map (
      ce_1 => ce_1_sg_x164,
      clk_1 => clk_1_sg_x164,
      in1 => concat_y_net_x16,
      out1 => single_port_ram_data_out_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x164,
      clk => clk_1_sg_x164,
      clr => '0',
      d0 => single_port_ram_data_out_net_x0,
      d1 => concat_y_net_x5,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x164,
      clk => clk_1_sg_x164,
      clr => '0',
      d0 => concat_y_net_x5,
      d1 => single_port_ram_data_out_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 6,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x8,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 4,
      x_width => 5,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_cf31187f8b: entity work.sync_delay_entity_cf31187f8b
    port map (
      ce_1 => ce_1_sg_x164,
      clk_1 => clk_1_sg_x164,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_8/butterfly_direct/twiddle/coeff_gen"

entity coeff_gen_entity_f1b8f12ad3 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_f1b8f12ad3;

architecture structural of coeff_gen_entity_f1b8f12ad3 is
  signal ce_1_sg_x169: std_logic;
  signal clk_1_sg_x169: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(6 downto 0);

begin
  ce_1_sg_x169 <= ce_1;
  clk_1_sg_x169 <= clk_1;
  mux_y_net_x0 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x169,
      clk => clk_1_sg_x169,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x0,
      op => counter_op_net
    );

  ri_to_c_735e6ceba6: entity work.ri_to_c_entity_7019693a09
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 7,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_baae78c6cf62a88f",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x169,
      clk => clk_1_sg_x169,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 7,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_578f4a8fb59b1f38",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x169,
      clk => clk_1_sg_x169,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 3,
      new_msb => 9,
      x_width => 10,
      y_width => 7
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_8/butterfly_direct/twiddle"

entity twiddle_entity_1297d5a90e is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_entity_1297d5a90e;

architecture structural of twiddle_entity_1297d5a90e is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x173: std_logic;
  signal clk_1_sg_x173: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net: std_logic_vector(17 downto 0);
  signal convert2_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(20 downto 0);
  signal convert_dout_net_x1: std_logic_vector(20 downto 0);
  signal convert_dout_net_x2: std_logic_vector(20 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay5_q_net: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net_x0: std_logic_vector(35 downto 0);
  signal mult2_p_net_x0: std_logic_vector(35 downto 0);
  signal mult_p_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);

begin
  single_port_ram_data_out_net_x0 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x173 <= ce_1;
  clk_1_sg_x173 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= addsub4_s_net_x0;
  bw_re <= addsub_s_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_6e32911fe1
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x1,
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      clr => '0',
      s => addsub_s_net_x0
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x1,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      clr => '0',
      s => addsub3_s_net
    );

  addsub4: entity work.addsub_f6ef4de287
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x2,
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      clr => '0',
      s => addsub4_s_net_x0
    );

  c_to_ri1_6550044f34: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_2727cf6150: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_5190569338: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_f1b8f12ad3: entity work.coeff_gen_entity_f1b8f12ad3
    port map (
      ce_1 => ce_1_sg_x173,
      clk_1 => clk_1_sg_x173,
      rst => mux_y_net_x2,
      w => concat_y_net_x2
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub1_s_net,
      dout => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub2_s_net,
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub3_s_net,
      dout => convert2_dout_net
    );

  convert_of1_32ce1f3fe4: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x173,
      clk_1 => clk_1_sg_x173,
      din => mult1_p_net_x0,
      dout => convert_dout_net_x1
    );

  convert_of2_4622411c45: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x173,
      clk_1 => clk_1_sg_x173,
      din => mult2_p_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of_891437ce41: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x173,
      clk_1 => clk_1_sg_x173,
      din => mult_p_net_x0,
      dout => convert_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      d => single_port_ram_data_out_net_x0,
      en => '1',
      q => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      d => mux_y_net_x1,
      en => '1',
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      d => force_re_output_port_net_x2,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      d => force_im_output_port_net_x2,
      en => '1',
      q => delay4_q_net
    );

  delay5: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      d => force_re_output_port_net_x1,
      en => '1',
      q => delay5_q_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 17,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => convert_dout_net,
      b => delay5_q_net,
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      clr => '0',
      core_ce => ce_1_sg_x173,
      core_clk => clk_1_sg_x173,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay4_q_net,
      b => convert1_dout_net,
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      clr => '0',
      core_ce => ce_1_sg_x173,
      core_clk => clk_1_sg_x173,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  mult2: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay3_q_net,
      b => convert2_dout_net,
      ce => ce_1_sg_x173,
      clk => clk_1_sg_x173,
      clr => '0',
      core_ce => ce_1_sg_x173,
      core_clk => clk_1_sg_x173,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_8/butterfly_direct"

entity butterfly_direct_entity_6efabbc5cc is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_6efabbc5cc;

architecture structural of butterfly_direct_entity_6efabbc5cc is
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net: std_logic_vector(22 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x174: std_logic;
  signal clk_1_sg_x174: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x3: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic;
  signal delay_q_net_x0: std_logic;
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal scale_op_net: std_logic_vector(22 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(35 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  single_port_ram_data_out_net_x1 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x174 <= ce_1;
  clk_1_sg_x174 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x2;
  a_bw_x0 <= concat_y_net_x3;
  sync_out <= delay_q_net_x0;

  addsub: entity work.addsub_b167d676fa
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_b167d676fa
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_0816bd8680
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_0816bd8680
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_6254b3227b: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x174,
      clk_1 => clk_1_sg_x174,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_647d75da75: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x174,
      clk_1 => clk_1_sg_x174,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_2ea7c82475: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x174,
      clk_1 => clk_1_sg_x174,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_06ce51d155: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x174,
      clk_1 => clk_1_sg_x174,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x174,
      clk => clk_1_sg_x174,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_2e630c87df: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x3
    );

  ri_to_c_e7bad611eb: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x2
    );

  scale: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_1297d5a90e: entity work.twiddle_entity_1297d5a90e
    port map (
      a => single_port_ram_data_out_net_x1,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x174,
      clk_1 => clk_1_sg_x174,
      sync => mux_y_net_x4,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => addsub4_s_net_x0,
      bw_re => addsub_s_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_8/delay_b"

entity delay_b_entity_0004e1fa13 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_0004e1fa13;

architecture structural of delay_b_entity_0004e1fa13 is
  signal ce_1_sg_x175: std_logic;
  signal clk_1_sg_x175: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x175 <= ce_1;
  clk_1_sg_x175 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= single_port_ram_data_out_net_x2;

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 5,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_b8a3efcc9651e5d3",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x175,
      clk => clk_1_sg_x175,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 3,
      c_width => 36,
      core_name0 => "single_port_block_memory_virtex2p_6_1_38d4305037783d2c",
      latency => 1
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x175,
      clk => clk_1_sg_x175,
      data_in => mux1_y_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_8/sync_delay"

entity sync_delay_entity_5b798a5321 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_5b798a5321;

architecture structural of sync_delay_entity_5b798a5321 is
  signal ce_1_sg_x177: std_logic;
  signal clk_1_sg_x177: std_logic;
  signal constant1_op_net: std_logic_vector(3 downto 0);
  signal constant2_op_net: std_logic_vector(3 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(3 downto 0);
  signal counter_op_net: std_logic_vector(3 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x177 <= ce_1;
  clk_1_sg_x177 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_4c449dd556
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_145086465d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_67ad97ca70
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_fdd1a28438047006",
      op_arith => xlUnsigned,
      op_width => 4
    )
    port map (
      ce => ce_1_sg_x177,
      clk => clk_1_sg_x177,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_4d3cfceaf4
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_d930162434
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_8"

entity fft_stage_8_entity_d926bd956d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_8_entity_d926bd956d;

architecture structural of fft_stage_8_entity_d926bd956d is
  signal ce_1_sg_x178: std_logic;
  signal clk_1_sg_x178: std_logic;
  signal concat_y_net_x10: std_logic_vector(35 downto 0);
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(3 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x4: std_logic;
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal single_port_ram_data_out_net_x0: std_logic_vector(35 downto 0);
  signal single_port_ram_data_out_net_x2: std_logic_vector(35 downto 0);
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x9: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x178 <= ce_1;
  clk_1_sg_x178 <= clk_1;
  concat_y_net_x7 <= in1;
  concat_y_net_x9 <= in2;
  slice21_y_net_x9 <= shift;
  delay_q_net_x3 <= sync;
  out1 <= concat_y_net_x10;
  out2 <= concat_y_net_x11;
  sync_out <= delay_q_net_x4;

  butterfly_direct_6efabbc5cc: entity work.butterfly_direct_entity_6efabbc5cc
    port map (
      a => single_port_ram_data_out_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x178,
      clk_1 => clk_1_sg_x178,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x10,
      a_bw_x0 => concat_y_net_x11,
      sync_out => delay_q_net_x4
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_e80093aea990e7ea",
      op_arith => xlUnsigned,
      op_width => 4
    )
    port map (
      ce => ce_1_sg_x178,
      clk => clk_1_sg_x178,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x3,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x178,
      clk => clk_1_sg_x178,
      d(0) => delay_q_net_x3,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_0004e1fa13: entity work.delay_b_entity_0004e1fa13
    port map (
      ce_1 => ce_1_sg_x178,
      clk_1 => clk_1_sg_x178,
      in1 => mux1_y_net_x0,
      out1 => single_port_ram_data_out_net_x2
    );

  delay_f_7158e84bb5: entity work.delay_b_entity_0004e1fa13
    port map (
      ce_1 => ce_1_sg_x178,
      clk_1 => clk_1_sg_x178,
      in1 => concat_y_net_x9,
      out1 => single_port_ram_data_out_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x178,
      clk => clk_1_sg_x178,
      clr => '0',
      d0 => single_port_ram_data_out_net_x0,
      d1 => concat_y_net_x7,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x178,
      clk => clk_1_sg_x178,
      clr => '0',
      d0 => concat_y_net_x7,
      d1 => single_port_ram_data_out_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 7,
      new_msb => 7,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x9,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 3,
      new_msb => 3,
      x_width => 4,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_5b798a5321: entity work.sync_delay_entity_5b798a5321
    port map (
      ce_1 => ce_1_sg_x178,
      clk_1 => clk_1_sg_x178,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_9/butterfly_direct/twiddle/coeff_gen"

entity coeff_gen_entity_1e2d4b272d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    w: out std_logic_vector(35 downto 0)
  );
end coeff_gen_entity_1e2d4b272d;

architecture structural of coeff_gen_entity_1e2d4b272d is
  signal ce_1_sg_x183: std_logic;
  signal clk_1_sg_x183: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal mux_y_net_x0: std_logic;
  signal rom1_data_net_x0: std_logic_vector(17 downto 0);
  signal rom_data_net_x0: std_logic_vector(17 downto 0);
  signal slice_y_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x183 <= ce_1;
  clk_1_sg_x183 <= clk_1;
  mux_y_net_x0 <= rst;
  w <= concat_y_net_x2;

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x183,
      clk => clk_1_sg_x183,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x0,
      op => counter_op_net
    );

  ri_to_c_05c6fa3c7f: entity work.ri_to_c_entity_7019693a09
    port map (
      im => rom1_data_net_x0,
      re => rom_data_net_x0,
      c => concat_y_net_x2
    );

  rom: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_f9f47a6cb9d2aa15",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x183,
      clk => clk_1_sg_x183,
      en => "1",
      rst => "0",
      data => rom_data_net_x0
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 8,
      c_width => 18,
      core_name0 => "single_port_block_memory_virtex2p_6_1_6394d46b7454c18a",
      latency => 1
    )
    port map (
      addr => slice_y_net,
      ce => ce_1_sg_x183,
      clk => clk_1_sg_x183,
      en => "1",
      rst => "0",
      data => rom1_data_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 9,
      x_width => 10,
      y_width => 8
    )
    port map (
      x => counter_op_net,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_9/butterfly_direct/twiddle"

entity twiddle_entity_7d811bb11c is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sync: in std_logic; 
    a_im: out std_logic_vector(17 downto 0); 
    a_re: out std_logic_vector(17 downto 0); 
    bw_im: out std_logic_vector(21 downto 0); 
    bw_re: out std_logic_vector(21 downto 0); 
    sync_out: out std_logic
  );
end twiddle_entity_7d811bb11c;

architecture structural of twiddle_entity_7d811bb11c is
  signal addsub1_s_net: std_logic_vector(18 downto 0);
  signal addsub2_s_net: std_logic_vector(18 downto 0);
  signal addsub3_s_net: std_logic_vector(18 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x187: std_logic;
  signal clk_1_sg_x187: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net: std_logic_vector(17 downto 0);
  signal convert2_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net: std_logic_vector(17 downto 0);
  signal convert_dout_net_x0: std_logic_vector(20 downto 0);
  signal convert_dout_net_x1: std_logic_vector(20 downto 0);
  signal convert_dout_net_x2: std_logic_vector(20 downto 0);
  signal delay1_q_net_x0: std_logic_vector(35 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic_vector(17 downto 0);
  signal delay4_q_net: std_logic_vector(17 downto 0);
  signal delay5_q_net: std_logic_vector(17 downto 0);
  signal delay_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_slr_q_net_x0: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x1: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mult1_p_net_x0: std_logic_vector(35 downto 0);
  signal mult2_p_net_x0: std_logic_vector(35 downto 0);
  signal mult_p_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal mux_y_net_x2: std_logic;

begin
  delay_slr_q_net_x0 <= a;
  mux_y_net_x1 <= b;
  ce_1_sg_x187 <= ce_1;
  clk_1_sg_x187 <= clk_1;
  mux_y_net_x2 <= sync;
  a_im <= force_im_output_port_net_x3;
  a_re <= force_re_output_port_net_x3;
  bw_im <= addsub4_s_net_x0;
  bw_re <= addsub_s_net_x0;
  sync_out <= delay2_q_net_x0;

  addsub: entity work.addsub_6e32911fe1
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x1,
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      clr => '0',
      s => addsub_s_net_x0
    );

  addsub1: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x2,
      b => force_im_output_port_net_x2,
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_c7ad41276b
    port map (
      a => force_re_output_port_net_x1,
      b => force_im_output_port_net_x1,
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_3b890bd063
    port map (
      a => force_im_output_port_net_x1,
      b => force_re_output_port_net_x1,
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      clr => '0',
      s => addsub3_s_net
    );

  addsub4: entity work.addsub_f6ef4de287
    port map (
      a => convert_dout_net_x0,
      b => convert_dout_net_x2,
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      clr => '0',
      s => addsub4_s_net_x0
    );

  c_to_ri1_17de7cd2a8: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay_q_net_x0,
      im => force_im_output_port_net_x3,
      re => force_re_output_port_net_x3
    );

  c_to_ri2_b9546e118a: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x2,
      im => force_im_output_port_net_x1,
      re => force_re_output_port_net_x1
    );

  c_to_ri3_5dd3a0caec: entity work.c_to_ri_entity_2485354a01
    port map (
      c => delay1_q_net_x0,
      im => force_im_output_port_net_x2,
      re => force_re_output_port_net_x2
    );

  coeff_gen_1e2d4b272d: entity work.coeff_gen_entity_1e2d4b272d
    port map (
      ce_1 => ce_1_sg_x187,
      clk_1 => clk_1_sg_x187,
      rst => mux_y_net_x2,
      w => concat_y_net_x2
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub1_s_net,
      dout => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub2_s_net,
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 19,
      dout_arith => 2,
      dout_bin_pt => 16,
      dout_width => 18,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => addsub3_s_net,
      dout => convert2_dout_net
    );

  convert_of1_ef709f6438: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x187,
      clk_1 => clk_1_sg_x187,
      din => mult1_p_net_x0,
      dout => convert_dout_net_x1
    );

  convert_of2_df67973d4c: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x187,
      clk_1 => clk_1_sg_x187,
      din => mult2_p_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of_5829fa601d: entity work.convert_of_entity_80190dc550
    port map (
      ce_1 => ce_1_sg_x187,
      clk_1 => clk_1_sg_x187,
      din => mult_p_net_x0,
      dout => convert_dout_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      d => delay_slr_q_net_x0,
      en => '1',
      q => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      d => mux_y_net_x1,
      en => '1',
      q => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x0
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      d => force_re_output_port_net_x2,
      en => '1',
      q => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      d => force_im_output_port_net_x2,
      en => '1',
      q => delay4_q_net
    );

  delay5: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 18
    )
    port map (
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      d => force_re_output_port_net_x1,
      en => '1',
      q => delay5_q_net
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 16,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 17,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => convert_dout_net,
      b => delay5_q_net,
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      clr => '0',
      core_ce => ce_1_sg_x187,
      core_clk => clk_1_sg_x187,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay4_q_net,
      b => convert1_dout_net,
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      clr => '0',
      core_ce => ce_1_sg_x187,
      core_clk => clk_1_sg_x187,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  mult2: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 17,
      a_width => 18,
      b_arith => xlSigned,
      b_bin_pt => 16,
      b_width => 18,
      c_a_type => 0,
      c_a_width => 18,
      c_b_type => 0,
      c_b_width => 18,
      c_baat => 18,
      c_output_width => 36,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_3ccc2842ec4e2cc9",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 36,
      quantization => 1
    )
    port map (
      a => delay3_q_net,
      b => convert2_dout_net,
      ce => ce_1_sg_x187,
      clk => clk_1_sg_x187,
      clr => '0',
      core_ce => ce_1_sg_x187,
      core_clk => clk_1_sg_x187,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_9/butterfly_direct"

entity butterfly_direct_entity_8510d32eba is
  port (
    a: in std_logic_vector(35 downto 0); 
    b: in std_logic_vector(35 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    shift: in std_logic; 
    sync: in std_logic; 
    a_bw: out std_logic_vector(35 downto 0); 
    a_bw_x0: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end butterfly_direct_entity_8510d32eba;

architecture structural of butterfly_direct_entity_8510d32eba is
  signal addsub1_s_net: std_logic_vector(22 downto 0);
  signal addsub2_s_net: std_logic_vector(22 downto 0);
  signal addsub3_s_net: std_logic_vector(22 downto 0);
  signal addsub4_s_net_x0: std_logic_vector(21 downto 0);
  signal addsub_s_net: std_logic_vector(22 downto 0);
  signal addsub_s_net_x0: std_logic_vector(21 downto 0);
  signal ce_1_sg_x188: std_logic;
  signal clk_1_sg_x188: std_logic;
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal concat_y_net_x8: std_logic_vector(35 downto 0);
  signal convert_dout_net_x2: std_logic_vector(17 downto 0);
  signal convert_dout_net_x3: std_logic_vector(17 downto 0);
  signal convert_dout_net_x4: std_logic_vector(17 downto 0);
  signal convert_dout_net_x5: std_logic_vector(17 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay3_q_net: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_slr_q_net_x1: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x3: std_logic_vector(17 downto 0);
  signal mux1_y_net_x0: std_logic_vector(23 downto 0);
  signal mux2_y_net_x0: std_logic_vector(23 downto 0);
  signal mux3_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x0: std_logic_vector(23 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x4: std_logic;
  signal scale1_op_net: std_logic_vector(22 downto 0);
  signal scale2_op_net: std_logic_vector(22 downto 0);
  signal scale3_op_net: std_logic_vector(22 downto 0);
  signal scale_op_net: std_logic_vector(22 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  delay_slr_q_net_x1 <= a;
  mux_y_net_x3 <= b;
  ce_1_sg_x188 <= ce_1;
  clk_1_sg_x188 <= clk_1;
  slice_y_net_x0 <= shift;
  mux_y_net_x4 <= sync;
  a_bw <= concat_y_net_x7;
  a_bw_x0 <= concat_y_net_x8;
  sync_out <= delay_q_net_x3;

  addsub: entity work.addsub_b167d676fa
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      clr => '0',
      s => addsub_s_net
    );

  addsub1: entity work.addsub_b167d676fa
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      clr => '0',
      s => addsub1_s_net
    );

  addsub2: entity work.addsub_0816bd8680
    port map (
      a => force_re_output_port_net_x3,
      b => addsub_s_net_x0,
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      clr => '0',
      s => addsub2_s_net
    );

  addsub3: entity work.addsub_0816bd8680
    port map (
      a => force_im_output_port_net_x3,
      b => addsub4_s_net_x0,
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      clr => '0',
      s => addsub3_s_net
    );

  convert_of1_e96fd89ee1: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x188,
      clk_1 => clk_1_sg_x188,
      din => mux_y_net_x0,
      dout => convert_dout_net_x2
    );

  convert_of2_ae18304cef: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x188,
      clk_1 => clk_1_sg_x188,
      din => mux1_y_net_x0,
      dout => convert_dout_net_x3
    );

  convert_of3_12b572276a: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x188,
      clk_1 => clk_1_sg_x188,
      din => mux2_y_net_x0,
      dout => convert_dout_net_x4
    );

  convert_of4_83940409c9: entity work.convert_of1_entity_059cbdd908
    port map (
      ce_1 => ce_1_sg_x188,
      clk_1 => clk_1_sg_x188,
      din => mux3_y_net_x0,
      dout => convert_dout_net_x5
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_q_net_x3
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      d(0) => slice_y_net_x0,
      en => '1',
      q(0) => delay3_q_net
    );

  mux: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      clr => '0',
      d0 => addsub_s_net,
      d1 => scale_op_net,
      sel(0) => delay3_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      clr => '0',
      d0 => addsub1_s_net,
      d1 => scale1_op_net,
      sel(0) => delay3_q_net,
      y => mux1_y_net_x0
    );

  mux2: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      clr => '0',
      d0 => addsub2_s_net,
      d1 => scale2_op_net,
      sel(0) => delay3_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_5f181dc739
    port map (
      ce => ce_1_sg_x188,
      clk => clk_1_sg_x188,
      clr => '0',
      d0 => addsub3_s_net,
      d1 => scale3_op_net,
      sel(0) => delay3_q_net,
      y => mux3_y_net_x0
    );

  ri_to_c1_a8dd03de92: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x5,
      re => convert_dout_net_x4,
      c => concat_y_net_x8
    );

  ri_to_c_57da27bbe1: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert_dout_net_x3,
      re => convert_dout_net_x2,
      c => concat_y_net_x7
    );

  scale: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub_s_net,
      op => scale_op_net
    );

  scale1: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub1_s_net,
      op => scale1_op_net
    );

  scale2: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub2_s_net,
      op => scale2_op_net
    );

  scale3: entity work.scale_e5d0b4a1ec
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addsub3_s_net,
      op => scale3_op_net
    );

  twiddle_7d811bb11c: entity work.twiddle_entity_7d811bb11c
    port map (
      a => delay_slr_q_net_x1,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x188,
      clk_1 => clk_1_sg_x188,
      sync => mux_y_net_x4,
      a_im => force_im_output_port_net_x3,
      a_re => force_re_output_port_net_x3,
      bw_im => addsub4_s_net_x0,
      bw_re => addsub_s_net_x0,
      sync_out => delay2_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_9/delay_b"

entity delay_b_entity_21b97b5026 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    out1: out std_logic_vector(35 downto 0)
  );
end delay_b_entity_21b97b5026;

architecture structural of delay_b_entity_21b97b5026 is
  signal ce_1_sg_x189: std_logic;
  signal clk_1_sg_x189: std_logic;
  signal delay_slr_q_net_x2: std_logic_vector(35 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);

begin
  ce_1_sg_x189 <= ce_1;
  clk_1_sg_x189 <= clk_1;
  mux1_y_net_x0 <= in1;
  out1 <= delay_slr_q_net_x2;

  delay_slr: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x189,
      clk => clk_1_sg_x189,
      d => mux1_y_net_x0,
      en => '1',
      q => delay_slr_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_9/sync_delay"

entity sync_delay_entity_f61544ec88 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_f61544ec88;

architecture structural of sync_delay_entity_f61544ec88 is
  signal ce_1_sg_x191: std_logic;
  signal clk_1_sg_x191: std_logic;
  signal constant1_op_net: std_logic_vector(2 downto 0);
  signal constant2_op_net: std_logic_vector(2 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(2 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x191 <= ce_1;
  clk_1_sg_x191 <= clk_1;
  delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_822933f89b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_469094441c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_a1c496ea88
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_d8ae89720b5de7f6",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x191,
      clk => clk_1_sg_x191,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_8fc7f5539b
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_47b317dab6
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core/fft_stage_9"

entity fft_stage_9_entity_01bf3b9f0b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(35 downto 0); 
    in2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_stage_9_entity_01bf3b9f0b;

architecture structural of fft_stage_9_entity_01bf3b9f0b is
  signal ce_1_sg_x192: std_logic;
  signal clk_1_sg_x192: std_logic;
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x13: std_logic_vector(35 downto 0);
  signal concat_y_net_x14: std_logic_vector(35 downto 0);
  signal concat_y_net_x15: std_logic_vector(35 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay_q_net_x0: std_logic;
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x6: std_logic;
  signal delay_slr_q_net_x0: std_logic_vector(35 downto 0);
  signal delay_slr_q_net_x2: std_logic_vector(35 downto 0);
  signal mux1_y_net_x0: std_logic_vector(35 downto 0);
  signal mux_y_net_x3: std_logic_vector(35 downto 0);
  signal mux_y_net_x5: std_logic;
  signal slice1_y_net: std_logic;
  signal slice21_y_net_x10: std_logic_vector(15 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x192 <= ce_1;
  clk_1_sg_x192 <= clk_1;
  concat_y_net_x11 <= in1;
  concat_y_net_x13 <= in2;
  slice21_y_net_x10 <= shift;
  delay_q_net_x5 <= sync;
  out1 <= concat_y_net_x14;
  out2 <= concat_y_net_x15;
  sync_out <= delay_q_net_x6;

  butterfly_direct_8510d32eba: entity work.butterfly_direct_entity_8510d32eba
    port map (
      a => delay_slr_q_net_x2,
      b => mux_y_net_x3,
      ce_1 => ce_1_sg_x192,
      clk_1 => clk_1_sg_x192,
      shift => slice_y_net_x0,
      sync => mux_y_net_x5,
      a_bw => concat_y_net_x14,
      a_bw_x0 => concat_y_net_x15,
      sync_out => delay_q_net_x6
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_b8a3efcc9651e5d3",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x192,
      clk => clk_1_sg_x192,
      clr => '0',
      en => "1",
      rst(0) => delay_q_net_x5,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x192,
      clk => clk_1_sg_x192,
      d(0) => delay_q_net_x5,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay_b_21b97b5026: entity work.delay_b_entity_21b97b5026
    port map (
      ce_1 => ce_1_sg_x192,
      clk_1 => clk_1_sg_x192,
      in1 => mux1_y_net_x0,
      out1 => delay_slr_q_net_x2
    );

  delay_f_fea89e559b: entity work.delay_b_entity_21b97b5026
    port map (
      ce_1 => ce_1_sg_x192,
      clk_1 => clk_1_sg_x192,
      in1 => concat_y_net_x13,
      out1 => delay_slr_q_net_x0
    );

  mux: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x192,
      clk => clk_1_sg_x192,
      clr => '0',
      d0 => delay_slr_q_net_x0,
      d1 => concat_y_net_x11,
      sel(0) => slice1_y_net,
      y => mux_y_net_x3
    );

  mux1: entity work.mux_4bb6f691f7
    port map (
      ce => ce_1_sg_x192,
      clk => clk_1_sg_x192,
      clr => '0',
      d0 => concat_y_net_x11,
      d1 => delay_slr_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux1_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 8,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => slice21_y_net_x10,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 3,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice1_y_net
    );

  sync_delay_f61544ec88: entity work.sync_delay_entity_f61544ec88
    port map (
      ce_1 => ce_1_sg_x192,
      clk_1 => clk_1_sg_x192,
      in_x0 => delay_q_net_x0,
      out_x0 => mux_y_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/biplex_core"

entity biplex_core_entity_7983aad8b5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol1: in std_logic_vector(35 downto 0); 
    pol2: in std_logic_vector(35 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(35 downto 0); 
    out2: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end biplex_core_entity_7983aad8b5;

architecture structural of biplex_core_entity_7983aad8b5 is
  signal ce_1_sg_x193: std_logic;
  signal clk_1_sg_x193: std_logic;
  signal concat_y_net_x10: std_logic_vector(35 downto 0);
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x14: std_logic_vector(35 downto 0);
  signal concat_y_net_x15: std_logic_vector(35 downto 0);
  signal concat_y_net_x16: std_logic_vector(35 downto 0);
  signal concat_y_net_x17: std_logic_vector(35 downto 0);
  signal concat_y_net_x18: std_logic_vector(35 downto 0);
  signal concat_y_net_x19: std_logic_vector(35 downto 0);
  signal concat_y_net_x20: std_logic_vector(35 downto 0);
  signal concat_y_net_x21: std_logic_vector(35 downto 0);
  signal concat_y_net_x22: std_logic_vector(35 downto 0);
  signal concat_y_net_x23: std_logic_vector(35 downto 0);
  signal concat_y_net_x24: std_logic_vector(35 downto 0);
  signal concat_y_net_x25: std_logic_vector(35 downto 0);
  signal concat_y_net_x26: std_logic_vector(35 downto 0);
  signal concat_y_net_x27: std_logic_vector(35 downto 0);
  signal concat_y_net_x28: std_logic_vector(35 downto 0);
  signal concat_y_net_x30: std_logic_vector(35 downto 0);
  signal concat_y_net_x31: std_logic_vector(35 downto 0);
  signal concat_y_net_x32: std_logic_vector(35 downto 0);
  signal concat_y_net_x33: std_logic_vector(35 downto 0);
  signal concat_y_net_x5: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal delay1_q_net_x1: std_logic;
  signal delay_q_net_x10: std_logic;
  signal delay_q_net_x11: std_logic;
  signal delay_q_net_x12: std_logic;
  signal delay_q_net_x13: std_logic;
  signal delay_q_net_x14: std_logic;
  signal delay_q_net_x15: std_logic;
  signal delay_q_net_x3: std_logic;
  signal delay_q_net_x5: std_logic;
  signal delay_q_net_x7: std_logic;
  signal delay_q_net_x8: std_logic;
  signal delay_q_net_x9: std_logic;
  signal slice21_y_net_x11: std_logic_vector(15 downto 0);

begin
  ce_1_sg_x193 <= ce_1;
  clk_1_sg_x193 <= clk_1;
  concat_y_net_x30 <= pol1;
  concat_y_net_x31 <= pol2;
  slice21_y_net_x11 <= shift;
  delay1_q_net_x1 <= sync;
  out1 <= concat_y_net_x32;
  out2 <= concat_y_net_x33;
  sync_out <= delay_q_net_x15;

  fft_stage_10_c05fdecae6: entity work.fft_stage_10_entity_c05fdecae6
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x27,
      in2 => concat_y_net_x28,
      shift => slice21_y_net_x11,
      sync => delay_q_net_x14,
      out1 => concat_y_net_x10,
      out2 => concat_y_net_x11,
      sync_out => delay_q_net_x5
    );

  fft_stage_11_6b726dccdb: entity work.fft_stage_11_entity_6b726dccdb
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x10,
      in2 => concat_y_net_x11,
      shift => slice21_y_net_x11,
      sync => delay_q_net_x5,
      out1 => concat_y_net_x32,
      out2 => concat_y_net_x33,
      sync_out => delay_q_net_x15
    );

  fft_stage_1_d92d817b13: entity work.fft_stage_1_entity_d92d817b13
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x30,
      in2 => concat_y_net_x31,
      shift => slice21_y_net_x11,
      sync => delay1_q_net_x1,
      out1 => concat_y_net_x7,
      out2 => concat_y_net_x9,
      sync_out => delay_q_net_x3
    );

  fft_stage_2_4f180e53e6: entity work.fft_stage_2_entity_4f180e53e6
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x7,
      in2 => concat_y_net_x9,
      shift => slice21_y_net_x11,
      sync => delay_q_net_x3,
      out1 => concat_y_net_x14,
      out2 => concat_y_net_x15,
      sync_out => delay_q_net_x7
    );

  fft_stage_3_bf18bfd94a: entity work.fft_stage_3_entity_bf18bfd94a
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x14,
      in2 => concat_y_net_x15,
      shift => slice21_y_net_x11,
      sync => delay_q_net_x7,
      out1 => concat_y_net_x5,
      out2 => concat_y_net_x16,
      sync_out => delay_q_net_x8
    );

  fft_stage_4_636be03632: entity work.fft_stage_4_entity_636be03632
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x5,
      in2 => concat_y_net_x16,
      shift => slice21_y_net_x11,
      sync => delay_q_net_x8,
      out1 => concat_y_net_x17,
      out2 => concat_y_net_x18,
      sync_out => delay_q_net_x9
    );

  fft_stage_5_fe11e402bc: entity work.fft_stage_5_entity_fe11e402bc
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x17,
      in2 => concat_y_net_x18,
      shift => slice21_y_net_x11,
      sync => delay_q_net_x9,
      out1 => concat_y_net_x19,
      out2 => concat_y_net_x20,
      sync_out => delay_q_net_x10
    );

  fft_stage_6_52b85899f8: entity work.fft_stage_6_entity_52b85899f8
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x19,
      in2 => concat_y_net_x20,
      shift => slice21_y_net_x11,
      sync => delay_q_net_x10,
      out1 => concat_y_net_x21,
      out2 => concat_y_net_x22,
      sync_out => delay_q_net_x11
    );

  fft_stage_7_87efef01a9: entity work.fft_stage_7_entity_87efef01a9
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x21,
      in2 => concat_y_net_x22,
      shift => slice21_y_net_x11,
      sync => delay_q_net_x11,
      out1 => concat_y_net_x23,
      out2 => concat_y_net_x24,
      sync_out => delay_q_net_x12
    );

  fft_stage_8_d926bd956d: entity work.fft_stage_8_entity_d926bd956d
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x23,
      in2 => concat_y_net_x24,
      shift => slice21_y_net_x11,
      sync => delay_q_net_x12,
      out1 => concat_y_net_x25,
      out2 => concat_y_net_x26,
      sync_out => delay_q_net_x13
    );

  fft_stage_9_01bf3b9f0b: entity work.fft_stage_9_entity_01bf3b9f0b
    port map (
      ce_1 => ce_1_sg_x193,
      clk_1 => clk_1_sg_x193,
      in1 => concat_y_net_x25,
      in2 => concat_y_net_x26,
      shift => slice21_y_net_x11,
      sync => delay_q_net_x13,
      out1 => concat_y_net_x27,
      out2 => concat_y_net_x28,
      sync_out => delay_q_net_x14
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0/ri_to_c1"

entity ri_to_c1_entity_573e33b48e is
  port (
    im: in std_logic_vector(17 downto 0); 
    re: in std_logic_vector(17 downto 0); 
    c: out std_logic_vector(35 downto 0)
  );
end ri_to_c1_entity_573e33b48e;

architecture structural of ri_to_c1_entity_573e33b48e is
  signal concat_y_net_x32: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x2: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x3: std_logic_vector(17 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(17 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(17 downto 0);

begin
  force_im_output_port_net_x3 <= im;
  force_im_output_port_net_x2 <= re;
  c <= concat_y_net_x32;

  concat: entity work.concat_b198bd62b0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret_output_port_net,
      in1 => reinterpret1_output_port_net,
      y => concat_y_net_x32
    );

  reinterpret: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_im_output_port_net_x2,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_580feec131
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => force_im_output_port_net_x3,
      output_port => reinterpret1_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft0"

entity fft0_entity_e330b148e2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol0: in std_logic_vector(17 downto 0); 
    pol1: in std_logic_vector(17 downto 0); 
    pol2: in std_logic_vector(17 downto 0); 
    pol3: in std_logic_vector(17 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    pol02_out: out std_logic_vector(35 downto 0); 
    pol13_out: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft0_entity_e330b148e2;

architecture structural of fft0_entity_e330b148e2 is
  signal ce_1_sg_x194: std_logic;
  signal clk_1_sg_x194: std_logic;
  signal concat_y_net_x10: std_logic_vector(35 downto 0);
  signal concat_y_net_x31: std_logic_vector(35 downto 0);
  signal concat_y_net_x32: std_logic_vector(35 downto 0);
  signal concat_y_net_x33: std_logic_vector(35 downto 0);
  signal concat_y_net_x34: std_logic_vector(35 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal delay1_q_net_x2: std_logic;
  signal delay8_q_net_x5: std_logic;
  signal delay_q_net_x15: std_logic;
  signal force_im_output_port_net_x4: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x5: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x4: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x5: std_logic_vector(17 downto 0);
  signal slice21_y_net_x12: std_logic_vector(15 downto 0);

begin
  ce_1_sg_x194 <= ce_1;
  clk_1_sg_x194 <= clk_1;
  force_re_output_port_net_x4 <= pol0;
  force_re_output_port_net_x5 <= pol1;
  force_im_output_port_net_x4 <= pol2;
  force_im_output_port_net_x5 <= pol3;
  slice21_y_net_x12 <= shift;
  delay1_q_net_x2 <= sync;
  pol02_out <= concat_y_net_x9;
  pol13_out <= concat_y_net_x10;
  sync_out <= delay8_q_net_x5;

  bi_real_unscr_2x_09890717ae: entity work.bi_real_unscr_2x_entity_09890717ae
    port map (
      ce_1 => ce_1_sg_x194,
      clk_1 => clk_1_sg_x194,
      even => concat_y_net_x32,
      odd => concat_y_net_x33,
      sync => delay_q_net_x15,
      pol12_out => concat_y_net_x9,
      pol34_out => concat_y_net_x10,
      sync_out => delay8_q_net_x5
    );

  biplex_core_7983aad8b5: entity work.biplex_core_entity_7983aad8b5
    port map (
      ce_1 => ce_1_sg_x194,
      clk_1 => clk_1_sg_x194,
      pol1 => concat_y_net_x31,
      pol2 => concat_y_net_x34,
      shift => slice21_y_net_x12,
      sync => delay1_q_net_x2,
      out1 => concat_y_net_x32,
      out2 => concat_y_net_x33,
      sync_out => delay_q_net_x15
    );

  ri_to_c0_d2633c1d5c: entity work.ri_to_c_entity_7019693a09
    port map (
      im => force_re_output_port_net_x5,
      re => force_re_output_port_net_x4,
      c => concat_y_net_x31
    );

  ri_to_c1_573e33b48e: entity work.ri_to_c1_entity_573e33b48e
    port map (
      im => force_im_output_port_net_x5,
      re => force_im_output_port_net_x4,
      c => concat_y_net_x34
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft1/bi_real_unscr_2x"

entity bi_real_unscr_2x_entity_cff8b4d77d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    even: in std_logic_vector(35 downto 0); 
    odd: in std_logic_vector(35 downto 0); 
    sync: in std_logic; 
    pol12_out: out std_logic_vector(35 downto 0); 
    pol34_out: out std_logic_vector(35 downto 0)
  );
end bi_real_unscr_2x_entity_cff8b4d77d;

architecture structural of bi_real_unscr_2x_entity_cff8b4d77d is
  signal bram0_data_out_net_x0: std_logic_vector(35 downto 0);
  signal bram0_data_out_net_x2: std_logic_vector(35 downto 0);
  signal ce_1_sg_x199: std_logic;
  signal clk_1_sg_x199: std_logic;
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal concat_y_net_x6: std_logic_vector(35 downto 0);
  signal concat_y_net_x7: std_logic_vector(35 downto 0);
  signal concat_y_net_x8: std_logic_vector(35 downto 0);
  signal constant1_op_net: std_logic_vector(9 downto 0);
  signal constant_op_net_x3: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay_q_net: std_logic_vector(35 downto 0);
  signal delay_q_net_x2: std_logic;
  signal mux_y_net_x1: std_logic_vector(35 downto 0);
  signal post_sync_delay_q_net_x0: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x199 <= ce_1;
  clk_1_sg_x199 <= clk_1;
  concat_y_net_x2 <= even;
  concat_y_net_x6 <= odd;
  delay_q_net_x2 <= sync;
  pol12_out <= concat_y_net_x7;
  pol34_out <= concat_y_net_x8;

  complex_addsub_fb2541db19: entity work.complex_addsub_entity_18ec2b7e61
    port map (
      a => bram0_data_out_net_x2,
      b => mux_y_net_x1,
      ce_1 => ce_1_sg_x199,
      clk_1 => clk_1_sg_x199,
      a_b => concat_y_net_x7,
      a_b_x0 => concat_y_net_x8
    );

  constant1: entity work.constant_498bc68c14
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net_x3
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_0260fba4aec82188",
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x199,
      clk => clk_1_sg_x199,
      clr => '0',
      en => "1",
      rst(0) => post_sync_delay_q_net_x0,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 36
    )
    port map (
      ce => ce_1_sg_x199,
      clk => clk_1_sg_x199,
      d => bram0_data_out_net_x0,
      en => '1',
      q => delay_q_net
    );

  mux: entity work.mux_b75bc1e5be
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => delay_q_net,
      d1 => bram0_data_out_net_x2,
      sel(0) => relational_op_net,
      y => mux_y_net_x1
    );

  relational: entity work.relational_0ffd72e037
    port map (
      a => constant1_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  reorder1_33c7593c72: entity work.reorder1_entity_4ceec62f48
    port map (
      ce_1 => ce_1_sg_x199,
      clk_1 => clk_1_sg_x199,
      din0 => concat_y_net_x6,
      en => constant_op_net_x3,
      sync => delay_q_net_x2,
      dout0 => bram0_data_out_net_x0
    );

  reorder_f9807f7ed9: entity work.reorder_entity_685328f00d
    port map (
      ce_1 => ce_1_sg_x199,
      clk_1 => clk_1_sg_x199,
      din0 => concat_y_net_x2,
      en => constant_op_net_x3,
      sync => delay_q_net_x2,
      dout0 => bram0_data_out_net_x2,
      sync_out => post_sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft1"

entity fft1_entity_ffa116fe36 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol0: in std_logic_vector(17 downto 0); 
    pol1: in std_logic_vector(17 downto 0); 
    pol2: in std_logic_vector(17 downto 0); 
    pol3: in std_logic_vector(17 downto 0); 
    shift: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    pol02_out: out std_logic_vector(35 downto 0); 
    pol13_out: out std_logic_vector(35 downto 0)
  );
end fft1_entity_ffa116fe36;

architecture structural of fft1_entity_ffa116fe36 is
  signal ce_1_sg_x346: std_logic;
  signal clk_1_sg_x346: std_logic;
  signal concat_y_net_x10: std_logic_vector(35 downto 0);
  signal concat_y_net_x31: std_logic_vector(35 downto 0);
  signal concat_y_net_x32: std_logic_vector(35 downto 0);
  signal concat_y_net_x33: std_logic_vector(35 downto 0);
  signal concat_y_net_x34: std_logic_vector(35 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal delay1_q_net_x5: std_logic;
  signal delay_q_net_x15: std_logic;
  signal force_im_output_port_net_x4: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x5: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x4: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x5: std_logic_vector(17 downto 0);
  signal slice21_y_net_x25: std_logic_vector(15 downto 0);

begin
  ce_1_sg_x346 <= ce_1;
  clk_1_sg_x346 <= clk_1;
  force_re_output_port_net_x4 <= pol0;
  force_re_output_port_net_x5 <= pol1;
  force_im_output_port_net_x4 <= pol2;
  force_im_output_port_net_x5 <= pol3;
  slice21_y_net_x25 <= shift;
  delay1_q_net_x5 <= sync;
  pol02_out <= concat_y_net_x9;
  pol13_out <= concat_y_net_x10;

  bi_real_unscr_2x_cff8b4d77d: entity work.bi_real_unscr_2x_entity_cff8b4d77d
    port map (
      ce_1 => ce_1_sg_x346,
      clk_1 => clk_1_sg_x346,
      even => concat_y_net_x32,
      odd => concat_y_net_x33,
      sync => delay_q_net_x15,
      pol12_out => concat_y_net_x9,
      pol34_out => concat_y_net_x10
    );

  biplex_core_050eb89a73: entity work.biplex_core_entity_7983aad8b5
    port map (
      ce_1 => ce_1_sg_x346,
      clk_1 => clk_1_sg_x346,
      pol1 => concat_y_net_x31,
      pol2 => concat_y_net_x34,
      shift => slice21_y_net_x25,
      sync => delay1_q_net_x5,
      out1 => concat_y_net_x32,
      out2 => concat_y_net_x33,
      sync_out => delay_q_net_x15
    );

  ri_to_c0_1ba32f4f83: entity work.ri_to_c_entity_7019693a09
    port map (
      im => force_re_output_port_net_x5,
      re => force_re_output_port_net_x4,
      c => concat_y_net_x31
    );

  ri_to_c1_f95b8b1aeb: entity work.ri_to_c1_entity_573e33b48e
    port map (
      im => force_im_output_port_net_x5,
      re => force_im_output_port_net_x4,
      c => concat_y_net_x34
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft2x_tvg/delay_bram"

entity delay_bram_entity_9e1e2816db is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(7 downto 0); 
    out1: out std_logic_vector(7 downto 0)
  );
end delay_bram_entity_9e1e2816db;

architecture structural of delay_bram_entity_9e1e2816db is
  signal ce_1_sg_x347: std_logic;
  signal clk_1_sg_x347: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(7 downto 0);
  signal slice4_y_net_x0: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x347 <= ce_1;
  clk_1_sg_x347 <= clk_1;
  slice4_y_net_x0 <= in1;
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
      cnt_15_0 => 1020,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 10,
      c_width => 8,
      core_name0 => "single_port_block_memory_virtex2p_6_1_7ea60367d40e0967",
      latency => 2
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x347,
      clk => clk_1_sg_x347,
      data_in => slice4_y_net_x0,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/fft2x_tvg"

entity fft2x_tvg_entity_e93378a1e1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    sync: in std_logic; 
    use_tvg: in std_logic_vector(1 downto 0); 
    dout: out std_logic_vector(31 downto 0)
  );
end fft2x_tvg_entity_e93378a1e1;

architecture structural of fft2x_tvg_entity_e93378a1e1 is
  signal ce_1_sg_x348: std_logic;
  signal clk_1_sg_x348: std_logic;
  signal concat17_y_net: std_logic_vector(31 downto 0);
  signal concat1_y_net: std_logic_vector(31 downto 0);
  signal concat2_y_net: std_logic_vector(3 downto 0);
  signal concat3_y_net_x0: std_logic_vector(3 downto 0);
  signal concat3_y_net_x1: std_logic_vector(31 downto 0);
  signal concat4_y_net: std_logic_vector(3 downto 0);
  signal concat5_y_net: std_logic_vector(7 downto 0);
  signal concat6_y_net: std_logic_vector(7 downto 0);
  signal concat7_y_net: std_logic_vector(7 downto 0);
  signal concat8_y_net: std_logic_vector(7 downto 0);
  signal concat9_y_net: std_logic_vector(15 downto 0);
  signal concat_y_net: std_logic_vector(3 downto 0);
  signal constant1_op_net: std_logic_vector(2 downto 0);
  signal constant2_op_net: std_logic_vector(2 downto 0);
  signal constant3_op_net: std_logic_vector(2 downto 0);
  signal constant_op_net: std_logic_vector(2 downto 0);
  signal counter2_op_net: std_logic_vector(16 downto 0);
  signal counter3_op_net: std_logic_vector(10 downto 0);
  signal delay4_q_net_x3: std_logic;
  signal mux1_y_net_x5: std_logic_vector(31 downto 0);
  signal mux2_y_net: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(7 downto 0);
  signal slice11_y_net: std_logic;
  signal slice1_y_net: std_logic_vector(3 downto 0);
  signal slice2_y_net: std_logic_vector(9 downto 0);
  signal slice3_y_net: std_logic_vector(5 downto 0);
  signal slice4_y_net_x0: std_logic_vector(7 downto 0);
  signal slice5_y_net: std_logic_vector(7 downto 0);
  signal slice6_y_net: std_logic;
  signal slice8_y_net_x0: std_logic_vector(1 downto 0);

begin
  ce_1_sg_x348 <= ce_1;
  clk_1_sg_x348 <= clk_1;
  concat3_y_net_x1 <= din;
  delay4_q_net_x3 <= sync;
  slice8_y_net_x0 <= use_tvg;
  dout <= mux1_y_net_x5;

  concat: entity work.concat_d90e7950ae
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => constant_op_net,
      in1(0) => slice11_y_net,
      y => concat_y_net
    );

  concat1: entity work.concat_a1e126f11c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat5_y_net,
      in1 => concat6_y_net,
      in2 => concat7_y_net,
      in3 => concat8_y_net,
      y => concat1_y_net
    );

  concat17: entity work.concat_a1e126f11c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => mux2_y_net,
      in1 => mux2_y_net,
      in2 => mux2_y_net,
      in3 => mux2_y_net,
      y => concat17_y_net
    );

  concat2: entity work.concat_d90e7950ae
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => constant1_op_net,
      in1(0) => slice11_y_net,
      y => concat2_y_net
    );

  concat3: entity work.concat_d90e7950ae
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => constant2_op_net,
      in1(0) => slice11_y_net,
      y => concat3_y_net_x0
    );

  concat4: entity work.concat_d90e7950ae
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => constant3_op_net,
      in1(0) => slice11_y_net,
      y => concat4_y_net
    );

  concat5: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat_y_net,
      in1 => slice1_y_net,
      y => concat5_y_net
    );

  concat6: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat2_y_net,
      in1 => slice1_y_net,
      y => concat6_y_net
    );

  concat7: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat3_y_net_x0,
      in1 => slice1_y_net,
      y => concat7_y_net
    );

  concat8: entity work.concat_1a070f1f35
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat4_y_net,
      in1 => slice1_y_net,
      y => concat8_y_net
    );

  concat9: entity work.concat_db546eb10e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => slice3_y_net,
      in1 => slice2_y_net,
      y => concat9_y_net
    );

  constant1: entity work.constant_a1c496ea88
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_1f5cc32f1e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_0f59f02ba5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net
    );

  constant_x0: entity work.constant_822933f89b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter2: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_b8a5551b3c16b99b",
      op_arith => xlUnsigned,
      op_width => 17
    )
    port map (
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      en => "1",
      rst(0) => delay4_q_net_x3,
      op => counter2_op_net
    );

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_d0a204b7c881b521",
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x348,
      clk => clk_1_sg_x348,
      clr => '0',
      en => "1",
      rst(0) => delay4_q_net_x3,
      op => counter3_op_net
    );

  delay_bram_9e1e2816db: entity work.delay_bram_entity_9e1e2816db
    port map (
      ce_1 => ce_1_sg_x348,
      clk_1 => clk_1_sg_x348,
      in1 => slice4_y_net_x0,
      out1 => single_port_ram_data_out_net_x0
    );

  mux1: entity work.mux_9d682a1165
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => concat3_y_net_x1,
      d1 => concat1_y_net,
      d2 => concat17_y_net,
      sel => slice8_y_net_x0,
      y => mux1_y_net_x5
    );

  mux2: entity work.mux_2af8d8c05a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => slice5_y_net,
      d1 => single_port_ram_data_out_net_x0,
      sel(0) => slice6_y_net,
      y => mux2_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 3,
      x_width => 11,
      y_width => 4
    )
    port map (
      x => counter3_op_net,
      y => slice1_y_net
    );

  slice11: entity work.xlslice
    generic map (
      new_lsb => 10,
      new_msb => 10,
      x_width => 11,
      y_width => 1
    )
    port map (
      x => counter3_op_net,
      y(0) => slice11_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 9,
      x_width => 17,
      y_width => 10
    )
    port map (
      x => counter2_op_net,
      y => slice2_y_net
    );

  slice3: entity work.xlslice
    generic map (
      new_lsb => 11,
      new_msb => 16,
      x_width => 17,
      y_width => 6
    )
    port map (
      x => counter2_op_net,
      y => slice3_y_net
    );

  slice4: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 16,
      y_width => 8
    )
    port map (
      x => concat9_y_net,
      y => slice4_y_net_x0
    );

  slice5: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 15,
      x_width => 16,
      y_width => 8
    )
    port map (
      x => concat9_y_net,
      y => slice5_y_net
    );

  slice6: entity work.xlslice
    generic map (
      new_lsb => 10,
      new_msb => 10,
      x_width => 17,
      y_width => 1
    )
    port map (
      x => counter2_op_net,
      y(0) => slice6_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/gpio"

entity gpio_entity_3e8445cfff is
  port (
    gpio_out: in std_logic; 
    convert_x0: out std_logic
  );
end gpio_entity_3e8445cfff;

architecture structural of gpio_entity_3e8445cfff is
  signal convert_dout_net_x0: std_logic;
  signal slice_y_net_x0: std_logic;

begin
  slice_y_net_x0 <= gpio_out;
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
      din(0) => slice_y_net_x0,
      dout(0) => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/led6_link_dn"

entity led6_link_dn_entity_1683a0dcc3 is
  port (
    gpio_out: in std_logic; 
    convert_x0: out std_logic
  );
end led6_link_dn_entity_1683a0dcc3;

architecture structural of led6_link_dn_entity_1683a0dcc3 is
  signal convert_dout_net_x0: std_logic;
  signal delay6_q_net_x0: std_logic;

begin
  delay6_q_net_x0 <= gpio_out;
  convert_x0 <= convert_dout_net_x0;

  convert: entity work.xlconvert
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
      din(0) => delay6_q_net_x0,
      dout(0) => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/mux_adc_levels/edge"

entity edge_entity_d80c921afd is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end edge_entity_d80c921afd;

architecture structural of edge_entity_d80c921afd is
  signal ce_1_sg_x349: std_logic;
  signal clk_1_sg_x349: std_logic;
  signal delay4_q_net: std_logic;
  signal logical3_y_net_x0: std_logic;
  signal slice8_y_net_x0: std_logic;

begin
  ce_1_sg_x349 <= ce_1;
  clk_1_sg_x349 <= clk_1;
  slice8_y_net_x0 <= in_x0;
  out_x0 <= logical3_y_net_x0;

  delay4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x349,
      clk => clk_1_sg_x349,
      d(0) => slice8_y_net_x0,
      en => '1',
      q(0) => delay4_q_net
    );

  logical3: entity work.logical_e77c53f8bd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay4_q_net,
      d1(0) => slice8_y_net_x0,
      y(0) => logical3_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/mux_adc_levels"

entity mux_adc_levels_entity_8fe3304055 is
  port (
    adc_power0: in std_logic_vector(31 downto 0); 
    adc_power1: in std_logic_vector(31 downto 0); 
    adc_power2: in std_logic_vector(31 downto 0); 
    adc_power3: in std_logic_vector(31 downto 0); 
    adc_power4: in std_logic_vector(31 downto 0); 
    adc_power5: in std_logic_vector(31 downto 0); 
    adc_power6: in std_logic_vector(31 downto 0); 
    adc_power7: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(63 downto 0); 
    eof: in std_logic; 
    header: in std_logic; 
    mrst: in std_logic; 
    sync: in std_logic; 
    valid_in: in std_logic; 
    data_out: out std_logic_vector(63 downto 0); 
    oob: out std_logic_vector(7 downto 0); 
    valid_out: out std_logic
  );
end mux_adc_levels_entity_8fe3304055;

architecture structural of mux_adc_levels_entity_8fe3304055 is
  signal ce_1_sg_x350: std_logic;
  signal clk_1_sg_x350: std_logic;
  signal concat2_y_net_x1: std_logic_vector(7 downto 0);
  signal concat_y_net: std_logic_vector(63 downto 0);
  signal constant5_op_net: std_logic_vector(2 downto 0);
  signal convert_dout_net: std_logic_vector(31 downto 0);
  signal counter1_op_net: std_logic_vector(13 downto 0);
  signal counter_op_net: std_logic_vector(2 downto 0);
  signal delay1_q_net: std_logic;
  signal delay1_q_net_x1: std_logic;
  signal delay2_q_net: std_logic;
  signal delay_q_net: std_logic_vector(2 downto 0);
  signal inverter_op_net: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical2_y_net: std_logic;
  signal logical2_y_net_x1: std_logic;
  signal logical3_y_net_x0: std_logic;
  signal logical3_y_net_x1: std_logic;
  signal logical_y_net: std_logic;
  signal mux1_y_net_x1: std_logic_vector(63 downto 0);
  signal mux_y_net: std_logic_vector(31 downto 0);
  signal mux_y_net_x2: std_logic_vector(63 downto 0);
  signal mux_y_net_x3: std_logic;
  signal register1_q_net_x0: std_logic;
  signal register2_q_net: std_logic;
  signal register3_q_net: std_logic;
  signal reinterpret1_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret2_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret3_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret4_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret5_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret6_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret7_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
  signal slice8_y_net_x0: std_logic;

begin
  reinterpret_output_port_net_x0 <= adc_power0;
  reinterpret1_output_port_net_x0 <= adc_power1;
  reinterpret2_output_port_net_x0 <= adc_power2;
  reinterpret3_output_port_net_x0 <= adc_power3;
  reinterpret4_output_port_net_x0 <= adc_power4;
  reinterpret5_output_port_net_x0 <= adc_power5;
  reinterpret6_output_port_net_x0 <= adc_power6;
  reinterpret7_output_port_net_x0 <= adc_power7;
  ce_1_sg_x350 <= ce_1;
  clk_1_sg_x350 <= clk_1;
  mux_y_net_x2 <= data_in;
  logical3_y_net_x1 <= eof;
  delay1_q_net_x1 <= header;
  mux_y_net_x3 <= mrst;
  register1_q_net_x0 <= sync;
  logical2_y_net_x1 <= valid_in;
  data_out <= mux1_y_net_x1;
  oob <= concat2_y_net_x1;
  valid_out <= logical1_y_net_x1;

  concat: entity work.concat_62c4475a80
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => convert_dout_net,
      in1 => mux_y_net,
      y => concat_y_net
    );

  concat2: entity work.concat_ce17a02288
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => constant5_op_net,
      in1(0) => register3_q_net,
      in2(0) => logical_y_net,
      in3(0) => logical3_y_net_x1,
      in4(0) => register1_q_net_x0,
      in5(0) => delay1_q_net_x1,
      y => concat2_y_net_x1
    );

  constant5: entity work.constant_822933f89b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 3,
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
      din => delay_q_net,
      dout => convert_dout_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_b8a3efcc9651e5d3",
      op_arith => xlUnsigned,
      op_width => 3
    )
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      en(0) => delay2_q_net,
      rst(0) => delay1_q_net,
      op => counter_op_net
    );

  counter1: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_9539f41705559a71",
      op_arith => xlUnsigned,
      op_width => 14
    )
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      en => "1",
      rst(0) => register1_q_net_x0,
      op => counter1_op_net
    );

  delay: entity work.delay_54d5af2115
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      d => counter_op_net,
      q => delay_q_net
    );

  delay1: entity work.delay_e18fb31a3d
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      d(0) => register1_q_net_x0,
      q(0) => delay1_q_net
    );

  delay2: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      d(0) => logical_y_net,
      q(0) => delay2_q_net
    );

  edge_d80c921afd: entity work.edge_entity_d80c921afd
    port map (
      ce_1 => ce_1_sg_x350,
      clk_1 => clk_1_sg_x350,
      in_x0 => slice8_y_net_x0,
      out_x0 => logical3_y_net_x0
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      ip(0) => logical2_y_net_x1,
      op(0) => inverter_op_net
    );

  logical: entity work.logical_3927d3238d
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      d0(0) => inverter_op_net,
      d1(0) => register2_q_net,
      y(0) => logical_y_net
    );

  logical1: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical2_y_net_x1,
      d1(0) => logical_y_net,
      y(0) => logical1_y_net_x1
    );

  logical2: entity work.logical_3927d3238d
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      clr => '0',
      d0(0) => logical2_y_net_x1,
      d1(0) => register2_q_net,
      y(0) => logical2_y_net
    );

  mux: entity work.mux_e9e9c2e4f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => reinterpret_output_port_net_x0,
      d1 => reinterpret1_output_port_net_x0,
      d2 => reinterpret2_output_port_net_x0,
      d3 => reinterpret3_output_port_net_x0,
      d4 => reinterpret4_output_port_net_x0,
      d5 => reinterpret5_output_port_net_x0,
      d6 => reinterpret6_output_port_net_x0,
      d7 => reinterpret7_output_port_net_x0,
      sel => delay_q_net,
      y => mux_y_net
    );

  mux1: entity work.mux_66e06093b2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => mux_y_net_x2,
      d1 => concat_y_net,
      sel(0) => logical_y_net,
      y => mux1_y_net_x1
    );

  register2: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      d(0) => logical3_y_net_x0,
      en(0) => logical3_y_net_x0,
      rst(0) => logical2_y_net,
      q(0) => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x350,
      clk => clk_1_sg_x350,
      d(0) => mux_y_net_x3,
      en(0) => mux_y_net_x3,
      rst(0) => logical1_y_net_x1,
      q(0) => register3_q_net
    );

  slice8: entity work.xlslice
    generic map (
      new_lsb => 13,
      new_msb => 13,
      x_width => 14,
      y_width => 1
    )
    port map (
      x => counter1_op_net,
      y(0) => slice8_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/neg_edge_ext0"

entity neg_edge_ext0_entity_dccdbdd8c2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end neg_edge_ext0_entity_dccdbdd8c2;

architecture structural of neg_edge_ext0_entity_dccdbdd8c2 is
  signal ce_1_sg_x351: std_logic;
  signal clk_1_sg_x351: std_logic;
  signal constant5_op_net: std_logic_vector(27 downto 0);
  signal counter3_op_net: std_logic_vector(27 downto 0);
  signal i_128w_2k_10_r310iadc_xaui0_rx_linkdown_net_x0: std_logic;
  signal relational5_op_net_x0: std_logic;

begin
  ce_1_sg_x351 <= ce_1;
  clk_1_sg_x351 <= clk_1;
  i_128w_2k_10_r310iadc_xaui0_rx_linkdown_net_x0 <= in_x0;
  out_x0 <= relational5_op_net_x0;

  constant5: entity work.constant_3afb0a580d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_658945f0a80d459a",
      op_arith => xlUnsigned,
      op_width => 28
    )
    port map (
      ce => ce_1_sg_x351,
      clk => clk_1_sg_x351,
      clr => '0',
      en(0) => relational5_op_net_x0,
      rst(0) => i_128w_2k_10_r310iadc_xaui0_rx_linkdown_net_x0,
      op => counter3_op_net
    );

  relational5: entity work.relational_8759749125
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

-- Generated from Simulink block "i_128w_2k_10_r310iadc/neg_edge_ext1"

entity neg_edge_ext1_entity_4827f7f517 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end neg_edge_ext1_entity_4827f7f517;

architecture structural of neg_edge_ext1_entity_4827f7f517 is
  signal ce_1_sg_x352: std_logic;
  signal clk_1_sg_x352: std_logic;
  signal constant5_op_net: std_logic_vector(23 downto 0);
  signal counter3_op_net: std_logic_vector(23 downto 0);
  signal i_128w_2k_10_r310iadc_xaui0_tx_full_net_x0: std_logic;
  signal relational5_op_net_x0: std_logic;

begin
  ce_1_sg_x352 <= ce_1;
  clk_1_sg_x352 <= clk_1;
  i_128w_2k_10_r310iadc_xaui0_tx_full_net_x0 <= in_x0;
  out_x0 <= relational5_op_net_x0;

  constant5: entity work.constant_bdd7f47790
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_804522374d9edc41",
      op_arith => xlUnsigned,
      op_width => 24
    )
    port map (
      ce => ce_1_sg_x352,
      clk => clk_1_sg_x352,
      clr => '0',
      en(0) => relational5_op_net_x0,
      rst(0) => i_128w_2k_10_r310iadc_xaui0_tx_full_net_x0,
      op => counter3_op_net
    );

  relational5: entity work.relational_831189b190
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

-- Generated from Simulink block "i_128w_2k_10_r310iadc/one_ant_a_time/reorder/sync_delay_en"

entity sync_delay_en_entity_10dd69b277 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    en: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_en_entity_10dd69b277;

architecture structural of sync_delay_en_entity_10dd69b277 is
  signal ce_1_sg_x353: std_logic;
  signal clk_1_sg_x353: std_logic;
  signal constant1_op_net: std_logic_vector(8 downto 0);
  signal constant2_op_net_x0: std_logic_vector(8 downto 0);
  signal constant2_op_net_x1: std_logic;
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(8 downto 0);
  signal counter_op_net: std_logic_vector(8 downto 0);
  signal logical1_y_net: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x0: std_logic;
  signal pre_sync_delay_q_net_x0: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x353 <= ce_1;
  clk_1_sg_x353 <= clk_1;
  constant2_op_net_x1 <= en;
  pre_sync_delay_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x0;

  constant1: entity work.constant_fd85eb7067
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_4a391b9a0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net_x0
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_b4ec9de7d1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_715f1205a46a625c",
      op_arith => xlUnsigned,
      op_width => 9
    )
    port map (
      ce => ce_1_sg_x353,
      clk => clk_1_sg_x353,
      clr => '0',
      din => constant2_op_net_x0,
      en(0) => logical1_y_net,
      load(0) => pre_sync_delay_q_net_x0,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => pre_sync_delay_q_net_x0,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net,
      d1(0) => constant2_op_net_x1,
      y(0) => logical1_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => pre_sync_delay_q_net_x0,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x0
    );

  relational: entity work.relational_6c3ee657fa
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_78eac2928d
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/one_ant_a_time/reorder"

entity reorder_entity_73683e37a7 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(31 downto 0); 
    en: in std_logic; 
    sync: in std_logic; 
    dout0: out std_logic_vector(31 downto 0); 
    sync_out: out std_logic
  );
end reorder_entity_73683e37a7;

architecture structural of reorder_entity_73683e37a7 is
  signal bram0_data_out_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x354: std_logic;
  signal clk_1_sg_x354: std_logic;
  signal concat2_y_net_x0: std_logic_vector(31 downto 0);
  signal constant2_op_net_x2: std_logic;
  signal counter_op_net: std_logic_vector(9 downto 0);
  signal delay0_q_net_x0: std_logic;
  signal delay_d0_q_net: std_logic_vector(7 downto 0);
  signal delay_din0_q_net: std_logic_vector(31 downto 0);
  signal delay_map1_q_net: std_logic_vector(7 downto 0);
  signal delay_map2_q_net: std_logic_vector(7 downto 0);
  signal delay_map3_q_net: std_logic_vector(7 downto 0);
  signal delay_sel_q_net: std_logic_vector(1 downto 0);
  signal delay_we_q_net: std_logic;
  signal map1_data_net: std_logic_vector(7 downto 0);
  signal map2_data_net: std_logic_vector(7 downto 0);
  signal map3_data_net: std_logic_vector(7 downto 0);
  signal mux_y_net: std_logic_vector(7 downto 0);
  signal mux_y_net_x0: std_logic;
  signal post_sync_delay_q_net_x0: std_logic;
  signal pre_sync_delay_q_net_x0: std_logic;
  signal slice1_y_net: std_logic_vector(1 downto 0);
  signal slice2_y_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x354 <= ce_1;
  clk_1_sg_x354 <= clk_1;
  concat2_y_net_x0 <= din0;
  constant2_op_net_x2 <= en;
  delay0_q_net_x0 <= sync;
  dout0 <= bram0_data_out_net_x0;
  sync_out <= post_sync_delay_q_net_x0;

  bram0: entity work.xlspram
    generic map (
      c_address_width => 8,
      c_width => 32,
      core_name0 => "single_port_block_memory_virtex2p_6_1_f239e1ef1af0e201",
      latency => 1
    )
    port map (
      addr => mux_y_net,
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      data_in => delay_din0_q_net,
      en => "1",
      rst => "0",
      we(0) => delay_we_q_net,
      data_out => bram0_data_out_net_x0
    );

  counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 1023,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_7c2d447100ca50c7",
      count_limited => 0,
      op_arith => xlUnsigned,
      op_width => 10
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      en(0) => constant2_op_net_x2,
      rst(0) => delay0_q_net_x0,
      op => counter_op_net
    );

  delay_d0: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d => slice2_y_net,
      en => '1',
      q => delay_d0_q_net
    );

  delay_din0: entity work.xldelay
    generic map (
      latency => 7,
      reg_retiming => 0,
      width => 32
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d => concat2_y_net_x0,
      en => '1',
      q => delay_din0_q_net
    );

  delay_map1: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d => map1_data_net,
      en => '1',
      q => delay_map1_q_net
    );

  delay_map2: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d => map2_data_net,
      en => '1',
      q => delay_map2_q_net
    );

  delay_map3: entity work.delay_423c6c1400
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => map3_data_net,
      q => delay_map3_q_net
    );

  delay_sel: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 2
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d => slice1_y_net,
      en => '1',
      q => delay_sel_q_net
    );

  delay_we: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d(0) => constant2_op_net_x2,
      en => '1',
      q(0) => delay_we_q_net
    );

  map1: entity work.xlsprom_dist
    generic map (
      addr_width => 8,
      c_address_width => 8,
      c_width => 8,
      core_name0 => "distributed_memory_virtex2p_7_1_17126bf86411dabf",
      latency => 2
    )
    port map (
      addr => slice2_y_net,
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      en => "1",
      data => map1_data_net
    );

  map2: entity work.xlsprom_dist
    generic map (
      addr_width => 8,
      c_address_width => 8,
      c_width => 8,
      core_name0 => "distributed_memory_virtex2p_7_1_17126bf86411dabf",
      latency => 2
    )
    port map (
      addr => map1_data_net,
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      en => "1",
      data => map2_data_net
    );

  map3: entity work.xlsprom_dist
    generic map (
      addr_width => 8,
      c_address_width => 8,
      c_width => 8,
      core_name0 => "distributed_memory_virtex2p_7_1_17126bf86411dabf",
      latency => 2
    )
    port map (
      addr => map2_data_net,
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      en => "1",
      data => map3_data_net
    );

  mux: entity work.mux_81f00cece7
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      clr => '0',
      d0 => delay_d0_q_net,
      d1 => delay_map1_q_net,
      d2 => delay_map2_q_net,
      d3 => delay_map3_q_net,
      sel => delay_sel_q_net,
      y => mux_y_net
    );

  post_sync_delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d(0) => mux_y_net_x0,
      en => '1',
      q(0) => post_sync_delay_q_net_x0
    );

  pre_sync_delay: entity work.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x354,
      clk => clk_1_sg_x354,
      d(0) => delay0_q_net_x0,
      en => '1',
      q(0) => pre_sync_delay_q_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 9,
      x_width => 10,
      y_width => 2
    )
    port map (
      x => counter_op_net,
      y => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 10,
      y_width => 8
    )
    port map (
      x => counter_op_net,
      y => slice2_y_net
    );

  sync_delay_en_10dd69b277: entity work.sync_delay_en_entity_10dd69b277
    port map (
      ce_1 => ce_1_sg_x354,
      clk_1 => clk_1_sg_x354,
      en => constant2_op_net_x2,
      in_x0 => pre_sync_delay_q_net_x0,
      out_x0 => mux_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/one_ant_a_time/square_transposer1/barrel_switcher"

entity barrel_switcher_entity_f954ef445f is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(7 downto 0); 
    in2: in std_logic_vector(7 downto 0); 
    in3: in std_logic_vector(7 downto 0); 
    in4: in std_logic_vector(7 downto 0); 
    sel: in std_logic_vector(1 downto 0); 
    sync_in: in std_logic; 
    out1: out std_logic_vector(7 downto 0); 
    out2: out std_logic_vector(7 downto 0); 
    out3: out std_logic_vector(7 downto 0); 
    out4: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic
  );
end barrel_switcher_entity_f954ef445f;

architecture structural of barrel_switcher_entity_f954ef445f is
  signal ce_1_sg_x355: std_logic;
  signal clk_1_sg_x355: std_logic;
  signal counter_op_net_x0: std_logic_vector(1 downto 0);
  signal delay1_q_net: std_logic_vector(1 downto 0);
  signal delay2_q_net_x0: std_logic;
  signal delay_sync_q_net_x0: std_logic;
  signal delayf1_q_net_x0: std_logic_vector(7 downto 0);
  signal delayf2_q_net_x0: std_logic_vector(7 downto 0);
  signal delayf3_q_net_x0: std_logic_vector(7 downto 0);
  signal delayf4_q_net_x0: std_logic_vector(7 downto 0);
  signal mux11_y_net: std_logic_vector(7 downto 0);
  signal mux12_y_net_x0: std_logic_vector(7 downto 0);
  signal mux21_y_net: std_logic_vector(7 downto 0);
  signal mux22_y_net_x0: std_logic_vector(7 downto 0);
  signal mux31_y_net: std_logic_vector(7 downto 0);
  signal mux32_y_net_x0: std_logic_vector(7 downto 0);
  signal mux41_y_net: std_logic_vector(7 downto 0);
  signal mux42_y_net_x0: std_logic_vector(7 downto 0);
  signal slice1_y_net: std_logic;
  signal slice2_y_net: std_logic;

begin
  ce_1_sg_x355 <= ce_1;
  clk_1_sg_x355 <= clk_1;
  delayf1_q_net_x0 <= in1;
  delayf4_q_net_x0 <= in2;
  delayf3_q_net_x0 <= in3;
  delayf2_q_net_x0 <= in4;
  counter_op_net_x0 <= sel;
  delay2_q_net_x0 <= sync_in;
  out1 <= mux12_y_net_x0;
  out2 <= mux22_y_net_x0;
  out3 <= mux32_y_net_x0;
  out4 <= mux42_y_net_x0;
  sync_out <= delay_sync_q_net_x0;

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 2
    )
    port map (
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      d => counter_op_net_x0,
      en => '1',
      q => delay1_q_net
    );

  delay_sync: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      d(0) => delay2_q_net_x0,
      en => '1',
      q(0) => delay_sync_q_net_x0
    );

  mux11: entity work.mux_7f6b7da686
    port map (
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      clr => '0',
      d0 => delayf1_q_net_x0,
      d1 => delayf3_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux11_y_net
    );

  mux12: entity work.mux_7f6b7da686
    port map (
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      clr => '0',
      d0 => mux11_y_net,
      d1 => mux21_y_net,
      sel(0) => slice2_y_net,
      y => mux12_y_net_x0
    );

  mux21: entity work.mux_7f6b7da686
    port map (
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      clr => '0',
      d0 => delayf4_q_net_x0,
      d1 => delayf2_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux21_y_net
    );

  mux22: entity work.mux_7f6b7da686
    port map (
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      clr => '0',
      d0 => mux21_y_net,
      d1 => mux31_y_net,
      sel(0) => slice2_y_net,
      y => mux22_y_net_x0
    );

  mux31: entity work.mux_7f6b7da686
    port map (
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      clr => '0',
      d0 => delayf3_q_net_x0,
      d1 => delayf1_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux31_y_net
    );

  mux32: entity work.mux_7f6b7da686
    port map (
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      clr => '0',
      d0 => mux31_y_net,
      d1 => mux41_y_net,
      sel(0) => slice2_y_net,
      y => mux32_y_net_x0
    );

  mux41: entity work.mux_7f6b7da686
    port map (
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      clr => '0',
      d0 => delayf2_q_net_x0,
      d1 => delayf4_q_net_x0,
      sel(0) => slice1_y_net,
      y => mux41_y_net
    );

  mux42: entity work.mux_7f6b7da686
    port map (
      ce => ce_1_sg_x355,
      clk => clk_1_sg_x355,
      clr => '0',
      d0 => mux41_y_net,
      d1 => mux11_y_net,
      sel(0) => slice2_y_net,
      y => mux42_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 2,
      y_width => 1
    )
    port map (
      x => counter_op_net_x0,
      y(0) => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 2,
      y_width => 1
    )
    port map (
      x => delay1_q_net,
      y(0) => slice2_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/one_ant_a_time/square_transposer1"

entity square_transposer1_entity_12db029092 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(7 downto 0); 
    in2: in std_logic_vector(7 downto 0); 
    in3: in std_logic_vector(7 downto 0); 
    in4: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    out1: out std_logic_vector(7 downto 0); 
    out2: out std_logic_vector(7 downto 0); 
    out3: out std_logic_vector(7 downto 0); 
    out4: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic
  );
end square_transposer1_entity_12db029092;

architecture structural of square_transposer1_entity_12db029092 is
  signal ce_1_sg_x356: std_logic;
  signal clk_1_sg_x356: std_logic;
  signal counter_op_net_x0: std_logic_vector(1 downto 0);
  signal delay0_q_net_x1: std_logic;
  signal delay2_q_net_x1: std_logic;
  signal delay_sync_q_net_x0: std_logic;
  signal delayb1_q_net_x0: std_logic_vector(7 downto 0);
  signal delayb2_q_net_x0: std_logic_vector(7 downto 0);
  signal delayb3_q_net_x0: std_logic_vector(7 downto 0);
  signal delayb4_q_net_x0: std_logic_vector(7 downto 0);
  signal delayf1_q_net_x0: std_logic_vector(7 downto 0);
  signal delayf2_q_net_x0: std_logic_vector(7 downto 0);
  signal delayf3_q_net_x0: std_logic_vector(7 downto 0);
  signal delayf4_q_net_x0: std_logic_vector(7 downto 0);
  signal mux12_y_net_x0: std_logic_vector(7 downto 0);
  signal mux22_y_net_x0: std_logic_vector(7 downto 0);
  signal mux32_y_net_x0: std_logic_vector(7 downto 0);
  signal mux42_y_net_x0: std_logic_vector(7 downto 0);
  signal slice11_y_net_x0: std_logic_vector(7 downto 0);
  signal slice1_y_net_x0: std_logic_vector(7 downto 0);
  signal slice2_y_net_x0: std_logic_vector(7 downto 0);
  signal slice7_y_net_x0: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x356 <= ce_1;
  clk_1_sg_x356 <= clk_1;
  slice1_y_net_x0 <= in1;
  slice2_y_net_x0 <= in2;
  slice11_y_net_x0 <= in3;
  slice7_y_net_x0 <= in4;
  delay2_q_net_x1 <= sync;
  out1 <= delayb1_q_net_x0;
  out2 <= delayb2_q_net_x0;
  out3 <= delayb3_q_net_x0;
  out4 <= delayb4_q_net_x0;
  sync_out <= delay0_q_net_x1;

  barrel_switcher_f954ef445f: entity work.barrel_switcher_entity_f954ef445f
    port map (
      ce_1 => ce_1_sg_x356,
      clk_1 => clk_1_sg_x356,
      in1 => delayf1_q_net_x0,
      in2 => delayf4_q_net_x0,
      in3 => delayf3_q_net_x0,
      in4 => delayf2_q_net_x0,
      sel => counter_op_net_x0,
      sync_in => delay2_q_net_x1,
      out1 => mux12_y_net_x0,
      out2 => mux22_y_net_x0,
      out3 => mux32_y_net_x0,
      out4 => mux42_y_net_x0,
      sync_out => delay_sync_q_net_x0
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_2b3d5de203345a84",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
      clr => '0',
      en => "1",
      rst(0) => delay2_q_net_x1,
      op => counter_op_net_x0
    );

  delay0: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
      d(0) => delay_sync_q_net_x0,
      en => '1',
      q(0) => delay0_q_net_x1
    );

  delayb1: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
      d => mux12_y_net_x0,
      en => '1',
      q => delayb1_q_net_x0
    );

  delayb2: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
      d => mux22_y_net_x0,
      en => '1',
      q => delayb2_q_net_x0
    );

  delayb3: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
      d => mux32_y_net_x0,
      en => '1',
      q => delayb3_q_net_x0
    );

  delayb4: entity work.delay_423c6c1400
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => mux42_y_net_x0,
      q => delayb4_q_net_x0
    );

  delayf1: entity work.delay_423c6c1400
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => slice1_y_net_x0,
      q => delayf1_q_net_x0
    );

  delayf2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
      d => slice2_y_net_x0,
      en => '1',
      q => delayf2_q_net_x0
    );

  delayf3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
      d => slice11_y_net_x0,
      en => '1',
      q => delayf3_q_net_x0
    );

  delayf4: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x356,
      clk => clk_1_sg_x356,
      d => slice7_y_net_x0,
      en => '1',
      q => delayf4_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/one_ant_a_time"

entity one_ant_a_time_entity_03d66a07c9 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    sync: in std_logic; 
    dout: out std_logic_vector(31 downto 0); 
    sync_out: out std_logic
  );
end one_ant_a_time_entity_03d66a07c9;

architecture structural of one_ant_a_time_entity_03d66a07c9 is
  signal bram0_data_out_net_x1: std_logic_vector(31 downto 0);
  signal ce_1_sg_x357: std_logic;
  signal clk_1_sg_x357: std_logic;
  signal concat2_y_net_x0: std_logic_vector(31 downto 0);
  signal constant2_op_net_x2: std_logic;
  signal delay0_q_net_x1: std_logic;
  signal delay2_q_net_x2: std_logic;
  signal delayb1_q_net_x0: std_logic_vector(7 downto 0);
  signal delayb2_q_net_x0: std_logic_vector(7 downto 0);
  signal delayb3_q_net_x0: std_logic_vector(7 downto 0);
  signal delayb4_q_net_x0: std_logic_vector(7 downto 0);
  signal mux3_y_net_x0: std_logic_vector(31 downto 0);
  signal post_sync_delay_q_net_x1: std_logic;
  signal slice11_y_net_x0: std_logic_vector(7 downto 0);
  signal slice1_y_net_x0: std_logic_vector(7 downto 0);
  signal slice2_y_net_x0: std_logic_vector(7 downto 0);
  signal slice7_y_net_x0: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x357 <= ce_1;
  clk_1_sg_x357 <= clk_1;
  mux3_y_net_x0 <= din;
  delay2_q_net_x2 <= sync;
  dout <= bram0_data_out_net_x1;
  sync_out <= post_sync_delay_q_net_x1;

  concat2: entity work.concat_a1e126f11c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => delayb1_q_net_x0,
      in1 => delayb2_q_net_x0,
      in2 => delayb3_q_net_x0,
      in3 => delayb4_q_net_x0,
      y => concat2_y_net_x0
    );

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net_x2
    );

  reorder_73683e37a7: entity work.reorder_entity_73683e37a7
    port map (
      ce_1 => ce_1_sg_x357,
      clk_1 => clk_1_sg_x357,
      din0 => concat2_y_net_x0,
      en => constant2_op_net_x2,
      sync => delay0_q_net_x1,
      dout0 => bram0_data_out_net_x1,
      sync_out => post_sync_delay_q_net_x1
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 24,
      new_msb => 31,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => mux3_y_net_x0,
      y => slice1_y_net_x0
    );

  slice11: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 15,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => mux3_y_net_x0,
      y => slice11_y_net_x0
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 23,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => mux3_y_net_x0,
      y => slice2_y_net_x0
    );

  slice7: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => mux3_y_net_x0,
      y => slice7_y_net_x0
    );

  square_transposer1_12db029092: entity work.square_transposer1_entity_12db029092
    port map (
      ce_1 => ce_1_sg_x357,
      clk_1 => clk_1_sg_x357,
      in1 => slice1_y_net_x0,
      in2 => slice2_y_net_x0,
      in3 => slice11_y_net_x0,
      in4 => slice7_y_net_x0,
      sync => delay2_q_net_x2,
      out1 => delayb1_q_net_x0,
      out2 => delayb2_q_net_x0,
      out3 => delayb3_q_net_x0,
      out4 => delayb4_q_net_x0,
      sync_out => delay0_q_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/packetiser1"

entity packetiser1_entity_e02a16843a is
  port (
    ant_base: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(31 downto 0); 
    mrst_in: in std_logic; 
    sync_in: in std_logic; 
    ant: out std_logic_vector(1 downto 0); 
    data_out: out std_logic_vector(63 downto 0); 
    eof: out std_logic; 
    header_out: out std_logic; 
    mcnt: out std_logic_vector(47 downto 0); 
    slice1_x0: out std_logic_vector(31 downto 0); 
    sync_out: out std_logic; 
    valid_out: out std_logic
  );
end packetiser1_entity_e02a16843a;

architecture structural of packetiser1_entity_e02a16843a is
  signal bram0_data_out_net_x2: std_logic_vector(31 downto 0);
  signal ce_1_sg_x359: std_logic;
  signal clk_1_sg_x359: std_logic;
  signal clk_cnt_op_net: std_logic_vector(55 downto 0);
  signal concat10_y_net: std_logic_vector(63 downto 0);
  signal concat1_y_net: std_logic_vector(63 downto 0);
  signal convert4_dout_net: std_logic;
  signal delay11_q_net: std_logic_vector(31 downto 0);
  signal delay1_q_net_x2: std_logic;
  signal delay2_q_net_x0: std_logic_vector(31 downto 0);
  signal delay2_q_net_x1: std_logic_vector(31 downto 0);
  signal delay4_q_net: std_logic;
  signal delay5_q_net_x0: std_logic_vector(1 downto 0);
  signal delay6_q_net_x0: std_logic_vector(47 downto 0);
  signal logical1_y_net_x0: std_logic;
  signal logical2_y_net_x2: std_logic;
  signal logical3_y_net_x3: std_logic;
  signal mux_y_net_x4: std_logic;
  signal mux_y_net_x5: std_logic_vector(63 downto 0);
  signal post_sync_delay_q_net_x2: std_logic;
  signal register1_q_net_x1: std_logic;
  signal register_q_net: std_logic;
  signal slice11_y_net: std_logic_vector(1 downto 0);
  signal slice1_y_net_x0: std_logic_vector(31 downto 0);
  signal slice2_y_net: std_logic_vector(47 downto 0);
  signal slice3_y_net: std_logic;
  signal slice4_y_net: std_logic;
  signal slice5_y_net: std_logic_vector(13 downto 0);

begin
  delay2_q_net_x1 <= ant_base;
  ce_1_sg_x359 <= ce_1;
  clk_1_sg_x359 <= clk_1;
  bram0_data_out_net_x2 <= data_in;
  mux_y_net_x4 <= mrst_in;
  post_sync_delay_q_net_x2 <= sync_in;
  ant <= delay5_q_net_x0;
  data_out <= mux_y_net_x5;
  eof <= logical3_y_net_x3;
  header_out <= delay1_q_net_x2;
  mcnt <= delay6_q_net_x0;
  slice1_x0 <= slice1_y_net_x0;
  sync_out <= register1_q_net_x1;
  valid_out <= logical2_y_net_x2;

  clk_cnt: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_5a07f4bba2e9cb5e",
      op_arith => xlUnsigned,
      op_width => 56
    )
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      clr => '0',
      en => "1",
      rst(0) => register_q_net,
      op => clk_cnt_op_net
    );

  concat1: entity work.concat_3d6d010511
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => delay6_q_net_x0,
      in1 => slice5_y_net,
      in2 => delay5_q_net_x0,
      y => concat1_y_net
    );

  concat10: entity work.concat_62c4475a80
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => delay11_q_net,
      in1 => delay2_q_net_x0,
      y => concat10_y_net
    );

  convert4: entity work.xlconvert
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
      din(0) => delay1_q_net_x2,
      dout(0) => convert4_dout_net
    );

  delay1: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      clr => '0',
      d(0) => logical3_y_net_x3,
      q(0) => delay1_q_net_x2
    );

  delay11: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      clr => '0',
      d => delay2_q_net_x0,
      q => delay11_q_net
    );

  delay2: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      clr => '0',
      d => bram0_data_out_net_x2,
      q => delay2_q_net_x0
    );

  delay4: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      clr => '0',
      d(0) => slice3_y_net,
      q(0) => delay4_q_net
    );

  delay5: entity work.delay_4ce33ca7e7
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      clr => '0',
      d => slice11_y_net,
      q => delay5_q_net_x0
    );

  delay6: entity work.delay_d8eaaced1c
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      clr => '0',
      d => slice2_y_net,
      q => delay6_q_net_x0
    );

  edge1_9259fb907c: entity work.edge_entity_d80c921afd
    port map (
      ce_1 => ce_1_sg_x359,
      clk_1 => clk_1_sg_x359,
      in_x0 => logical1_y_net_x0,
      out_x0 => logical3_y_net_x3
    );

  logical1: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => slice4_y_net,
      d1(0) => register_q_net,
      y(0) => logical1_y_net_x0
    );

  logical2: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay1_q_net_x2,
      d1(0) => delay4_q_net,
      y(0) => logical2_y_net_x2
    );

  mux: entity work.mux_dc8b84fd59
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => concat10_y_net,
      d1 => concat1_y_net,
      sel(0) => convert4_dout_net,
      y => mux_y_net_x5
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      d(0) => post_sync_delay_q_net_x2,
      en(0) => post_sync_delay_q_net_x2,
      rst(0) => logical2_y_net_x2,
      q(0) => register1_q_net_x1
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x359,
      clk => clk_1_sg_x359,
      d(0) => mux_y_net_x4,
      en(0) => mux_y_net_x4,
      rst(0) => post_sync_delay_q_net_x2,
      q(0) => register_q_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 31,
      x_width => 64,
      y_width => 32
    )
    port map (
      x => mux_y_net_x5,
      y => slice1_y_net_x0
    );

  slice11: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 7,
      x_width => 56,
      y_width => 2
    )
    port map (
      x => clk_cnt_op_net,
      y => slice11_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 55,
      x_width => 56,
      y_width => 48
    )
    port map (
      x => clk_cnt_op_net,
      y => slice2_y_net
    );

  slice3: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 56,
      y_width => 1
    )
    port map (
      x => clk_cnt_op_net,
      y(0) => slice3_y_net
    );

  slice4: entity work.xlslice
    generic map (
      new_lsb => 6,
      new_msb => 6,
      x_width => 56,
      y_width => 1
    )
    port map (
      x => clk_cnt_op_net,
      y(0) => slice4_y_net
    );

  slice5: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 15,
      x_width => 32,
      y_width => 14
    )
    port map (
      x => delay2_q_net_x1,
      y => slice5_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_first_tap/c_to_ri"

entity c_to_ri_entity_b56daa3700 is
  port (
    c: in std_logic_vector(15 downto 0); 
    im: out std_logic_vector(7 downto 0); 
    re: out std_logic_vector(7 downto 0)
  );
end c_to_ri_entity_b56daa3700;

architecture structural of c_to_ri_entity_b56daa3700 is
  signal delay1_q_net_x0: std_logic_vector(15 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal slice_im_y_net: std_logic_vector(7 downto 0);
  signal slice_re_y_net: std_logic_vector(7 downto 0);

begin
  delay1_q_net_x0 <= c;
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
      x => delay1_q_net_x0,
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
      x => delay1_q_net_x0,
      y => slice_re_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_first_tap/delay_bram"

entity delay_bram_entity_7429e167ee is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in1: in std_logic_vector(15 downto 0); 
    out1: out std_logic_vector(15 downto 0)
  );
end delay_bram_entity_7429e167ee;

architecture structural of delay_bram_entity_7429e167ee is
  signal ce_1_sg_x360: std_logic;
  signal clk_1_sg_x360: std_logic;
  signal constant2_op_net: std_logic;
  signal counter_op_net: std_logic_vector(10 downto 0);
  signal delay1_q_net_x1: std_logic_vector(15 downto 0);
  signal single_port_ram_data_out_net_x0: std_logic_vector(15 downto 0);

begin
  ce_1_sg_x360 <= ce_1;
  clk_1_sg_x360 <= clk_1;
  delay1_q_net_x1 <= in1;
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
      cnt_15_0 => 2044,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "binary_counter_virtex2p_7_0_78a3dd824f4df0df",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x360,
      clk => clk_1_sg_x360,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  single_port_ram: entity work.xlspram
    generic map (
      c_address_width => 11,
      c_width => 16,
      core_name0 => "single_port_block_memory_virtex2p_6_1_287130c77eef8a13",
      latency => 2
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x360,
      clk => clk_1_sg_x360,
      data_in => delay1_q_net_x1,
      en => "1",
      rst => "0",
      we(0) => constant2_op_net,
      data_out => single_port_ram_data_out_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_first_tap/pfb_coeff_gen"

entity pfb_coeff_gen_entity_e9d8a7d349 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    coeff: out std_logic_vector(31 downto 0); 
    dout: out std_logic_vector(15 downto 0); 
    sync_out: out std_logic
  );
end pfb_coeff_gen_entity_e9d8a7d349;

architecture structural of pfb_coeff_gen_entity_e9d8a7d349 is
  signal ce_1_sg_x361: std_logic;
  signal clk_1_sg_x361: std_logic;
  signal concat_y_net: std_logic_vector(31 downto 0);
  signal concat_y_net_x1: std_logic_vector(15 downto 0);
  signal counter_op_net: std_logic_vector(10 downto 0);
  signal delay1_q_net_x2: std_logic_vector(15 downto 0);
  signal delay_q_net_x0: std_logic;
  signal logical3_y_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(7 downto 0);
  signal rom1_data_net: std_logic_vector(7 downto 0);
  signal rom2_data_net: std_logic_vector(7 downto 0);
  signal rom3_data_net: std_logic_vector(7 downto 0);
  signal rom4_data_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x361 <= ce_1;
  clk_1_sg_x361 <= clk_1;
  concat_y_net_x1 <= din;
  logical3_y_net_x0 <= sync;
  coeff <= register_q_net_x0;
  dout <= delay1_q_net_x2;
  sync_out <= delay_q_net_x0;

  concat: entity work.concat_a1e126f11c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret1_output_port_net,
      in1 => reinterpret2_output_port_net,
      in2 => reinterpret3_output_port_net,
      in3 => reinterpret4_output_port_net,
      y => concat_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_d0a204b7c881b521",
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      clr => '0',
      en => "1",
      rst(0) => logical3_y_net_x0,
      op => counter_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      d(0) => logical3_y_net_x0,
      en => '1',
      q(0) => delay_q_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 16
    )
    port map (
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      d => concat_y_net_x1,
      en => '1',
      q => delay1_q_net_x2
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 32,
      init_value => b"00000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      d => concat_y_net,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret1: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom1_data_net,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom2_data_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom3_data_net,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom4_data_net,
      output_port => reinterpret4_output_port_net
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 11,
      c_width => 8,
      core_name0 => "single_port_block_memory_virtex2p_6_1_c4da1499b2390313",
      latency => 2
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      en => "1",
      rst => "0",
      data => rom1_data_net
    );

  rom2: entity work.xlsprom
    generic map (
      c_address_width => 11,
      c_width => 8,
      core_name0 => "single_port_block_memory_virtex2p_6_1_d13072650a2ab55b",
      latency => 2
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      en => "1",
      rst => "0",
      data => rom2_data_net
    );

  rom3: entity work.xlsprom
    generic map (
      c_address_width => 11,
      c_width => 8,
      core_name0 => "single_port_block_memory_virtex2p_6_1_ee12ce34adfa5ec2",
      latency => 2
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      en => "1",
      rst => "0",
      data => rom3_data_net
    );

  rom4: entity work.xlsprom
    generic map (
      c_address_width => 11,
      c_width => 8,
      core_name0 => "single_port_block_memory_virtex2p_6_1_fc890bd72b8e4bff",
      latency => 2
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x361,
      clk => clk_1_sg_x361,
      en => "1",
      rst => "0",
      data => rom4_data_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_first_tap/ri_to_c"

entity ri_to_c_entity_62640ddb7f is
  port (
    im: in std_logic_vector(15 downto 0); 
    re: in std_logic_vector(15 downto 0); 
    c: out std_logic_vector(31 downto 0)
  );
end ri_to_c_entity_62640ddb7f;

architecture structural of ri_to_c_entity_62640ddb7f is
  signal concat_y_net_x0: std_logic_vector(31 downto 0);
  signal mult1_p_net_x0: std_logic_vector(15 downto 0);
  signal mult_p_net_x0: std_logic_vector(15 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(15 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(15 downto 0);

begin
  mult_p_net_x0 <= im;
  mult1_p_net_x0 <= re;
  c <= concat_y_net_x0;

  concat: entity work.concat_a369e00c6b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret_output_port_net,
      in1 => reinterpret1_output_port_net,
      y => concat_y_net_x0
    );

  reinterpret: entity work.reinterpret_7025463ea8
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => mult1_p_net_x0,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_7025463ea8
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => mult_p_net_x0,
      output_port => reinterpret1_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_first_tap/sync_delay"

entity sync_delay_entity_4e0570d115 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_4e0570d115;

architecture structural of sync_delay_entity_4e0570d115 is
  signal ce_1_sg_x362: std_logic;
  signal clk_1_sg_x362: std_logic;
  signal constant1_op_net: std_logic_vector(11 downto 0);
  signal constant2_op_net: std_logic_vector(11 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(11 downto 0);
  signal counter_op_net: std_logic_vector(11 downto 0);
  signal delay_q_net_x1: std_logic;
  signal logical_y_net: std_logic;
  signal mux_y_net_x0: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x362 <= ce_1;
  clk_1_sg_x362 <= clk_1;
  delay_q_net_x1 <= in_x0;
  out_x0 <= mux_y_net_x0;

  constant1: entity work.constant_fd28b32bf8
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_e054d850c5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_7c91b1b314
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_805fe5e395e47402",
      op_arith => xlUnsigned,
      op_width => 12
    )
    port map (
      ce => ce_1_sg_x362,
      clk => clk_1_sg_x362,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => delay_q_net_x1,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x1,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net_x1,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x0
    );

  relational: entity work.relational_d36fe12c1c
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_acb3c05dd0
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_first_tap"

entity pol1_in1_first_tap_entity_f782e4fba8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    coeff_out: out std_logic_vector(23 downto 0); 
    dout: out std_logic_vector(15 downto 0); 
    sync_out: out std_logic; 
    taps_out: out std_logic_vector(31 downto 0)
  );
end pol1_in1_first_tap_entity_f782e4fba8;

architecture structural of pol1_in1_first_tap_entity_f782e4fba8 is
  signal ce_1_sg_x363: std_logic;
  signal clk_1_sg_x363: std_logic;
  signal concat_y_net_x2: std_logic_vector(15 downto 0);
  signal concat_y_net_x3: std_logic_vector(31 downto 0);
  signal delay1_q_net_x2: std_logic_vector(15 downto 0);
  signal delay_q_net_x1: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal logical3_y_net_x1: std_logic;
  signal mult1_p_net_x0: std_logic_vector(15 downto 0);
  signal mult_p_net_x0: std_logic_vector(15 downto 0);
  signal mux_y_net_x1: std_logic;
  signal register_q_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(15 downto 0);
  signal slice1_y_net_x0: std_logic_vector(23 downto 0);
  signal slice_y_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x363 <= ce_1;
  clk_1_sg_x363 <= clk_1;
  concat_y_net_x2 <= din;
  logical3_y_net_x1 <= sync;
  coeff_out <= slice1_y_net_x0;
  dout <= single_port_ram_data_out_net_x1;
  sync_out <= mux_y_net_x1;
  taps_out <= concat_y_net_x3;

  c_to_ri_b56daa3700: entity work.c_to_ri_entity_b56daa3700
    port map (
      c => delay1_q_net_x2,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay_bram_7429e167ee: entity work.delay_bram_entity_7429e167ee
    port map (
      ce_1 => ce_1_sg_x363,
      clk_1 => clk_1_sg_x363,
      in1 => delay1_q_net_x2,
      out1 => single_port_ram_data_out_net_x1
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      core_ce => ce_1_sg_x363,
      core_clk => clk_1_sg_x363,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x363,
      clk => clk_1_sg_x363,
      clr => '0',
      core_ce => ce_1_sg_x363,
      core_clk => clk_1_sg_x363,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  pfb_coeff_gen_e9d8a7d349: entity work.pfb_coeff_gen_entity_e9d8a7d349
    port map (
      ce_1 => ce_1_sg_x363,
      clk_1 => clk_1_sg_x363,
      din => concat_y_net_x2,
      sync => logical3_y_net_x1,
      coeff => register_q_net_x0,
      dout => delay1_q_net_x2,
      sync_out => delay_q_net_x1
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  ri_to_c_62640ddb7f: entity work.ri_to_c_entity_62640ddb7f
    port map (
      im => mult_p_net_x0,
      re => mult1_p_net_x0,
      c => concat_y_net_x3
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => register_q_net_x0,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 31,
      x_width => 32,
      y_width => 24
    )
    port map (
      x => register_q_net_x0,
      y => slice1_y_net_x0
    );

  sync_delay_4e0570d115: entity work.sync_delay_entity_4e0570d115
    port map (
      ce_1 => ce_1_sg_x363,
      clk_1 => clk_1_sg_x363,
      in_x0 => delay_q_net_x1,
      out_x0 => mux_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_last_tap/pfb_add_tree/adder_tree1"

entity adder_tree1_entity_90ea522bff is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din1: in std_logic_vector(15 downto 0); 
    din2: in std_logic_vector(15 downto 0); 
    din3: in std_logic_vector(15 downto 0); 
    din4: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    dout: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end adder_tree1_entity_90ea522bff;

architecture structural of adder_tree1_entity_90ea522bff is
  signal addr1_s_net: std_logic_vector(16 downto 0);
  signal addr2_s_net: std_logic_vector(16 downto 0);
  signal addr3_s_net_x0: std_logic_vector(17 downto 0);
  signal ce_1_sg_x364: std_logic;
  signal clk_1_sg_x364: std_logic;
  signal delay_q_net_x0: std_logic;
  signal reint0_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint1_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint2_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint3_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal sync_delay_q_net_x0: std_logic;

begin
  ce_1_sg_x364 <= ce_1;
  clk_1_sg_x364 <= clk_1;
  reint0_1_output_port_net_x0 <= din1;
  reint1_1_output_port_net_x0 <= din2;
  reint2_1_output_port_net_x0 <= din3;
  reint3_1_output_port_net_x0 <= din4;
  delay_q_net_x0 <= sync;
  dout <= addr3_s_net_x0;
  sync_out <= sync_delay_q_net_x0;

  addr1: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 16,
      b_arith => xlSigned,
      b_bin_pt => 14,
      b_width => 16,
      c_has_b_out => 0,
      c_has_c_out => 0,
      c_has_q_b_out => 0,
      c_has_q_c_out => 0,
      c_latency => 1,
      c_output_width => 17,
      core_name0 => "adder_subtracter_virtex2p_7_0_9301e8703140ec16",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 17,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 14,
      s_width => 17
    )
    port map (
      a => reint0_1_output_port_net_x0,
      b => reint1_1_output_port_net_x0,
      ce => ce_1_sg_x364,
      clk => clk_1_sg_x364,
      clr => '0',
      en => "1",
      s => addr1_s_net
    );

  addr2: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 16,
      b_arith => xlSigned,
      b_bin_pt => 14,
      b_width => 16,
      c_has_b_out => 0,
      c_has_c_out => 0,
      c_has_q_b_out => 0,
      c_has_q_c_out => 0,
      c_latency => 1,
      c_output_width => 17,
      core_name0 => "adder_subtracter_virtex2p_7_0_9301e8703140ec16",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 17,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 14,
      s_width => 17
    )
    port map (
      a => reint2_1_output_port_net_x0,
      b => reint3_1_output_port_net_x0,
      ce => ce_1_sg_x364,
      clk => clk_1_sg_x364,
      clr => '0',
      en => "1",
      s => addr2_s_net
    );

  addr3: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 17,
      b_arith => xlSigned,
      b_bin_pt => 14,
      b_width => 17,
      c_has_b_out => 0,
      c_has_c_out => 0,
      c_has_q_b_out => 0,
      c_has_q_c_out => 0,
      c_latency => 1,
      c_output_width => 18,
      core_name0 => "adder_subtracter_virtex2p_7_0_c5dcd9e7347382cf",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 18,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 14,
      s_width => 18
    )
    port map (
      a => addr1_s_net,
      b => addr2_s_net,
      ce => ce_1_sg_x364,
      clk => clk_1_sg_x364,
      clr => '0',
      en => "1",
      s => addr3_s_net_x0
    );

  sync_delay: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x364,
      clk => clk_1_sg_x364,
      d(0) => delay_q_net_x0,
      en => '1',
      q(0) => sync_delay_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_last_tap/pfb_add_tree/adder_tree2"

entity adder_tree2_entity_d60253b642 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din1: in std_logic_vector(15 downto 0); 
    din2: in std_logic_vector(15 downto 0); 
    din3: in std_logic_vector(15 downto 0); 
    din4: in std_logic_vector(15 downto 0); 
    dout: out std_logic_vector(17 downto 0)
  );
end adder_tree2_entity_d60253b642;

architecture structural of adder_tree2_entity_d60253b642 is
  signal addr1_s_net: std_logic_vector(16 downto 0);
  signal addr2_s_net: std_logic_vector(16 downto 0);
  signal addr3_s_net_x0: std_logic_vector(17 downto 0);
  signal ce_1_sg_x365: std_logic;
  signal clk_1_sg_x365: std_logic;
  signal reint0_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint1_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint2_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint3_2_output_port_net_x0: std_logic_vector(15 downto 0);

begin
  ce_1_sg_x365 <= ce_1;
  clk_1_sg_x365 <= clk_1;
  reint0_2_output_port_net_x0 <= din1;
  reint1_2_output_port_net_x0 <= din2;
  reint2_2_output_port_net_x0 <= din3;
  reint3_2_output_port_net_x0 <= din4;
  dout <= addr3_s_net_x0;

  addr1: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 16,
      b_arith => xlSigned,
      b_bin_pt => 14,
      b_width => 16,
      c_has_b_out => 0,
      c_has_c_out => 0,
      c_has_q_b_out => 0,
      c_has_q_c_out => 0,
      c_latency => 1,
      c_output_width => 17,
      core_name0 => "adder_subtracter_virtex2p_7_0_9301e8703140ec16",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 17,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 14,
      s_width => 17
    )
    port map (
      a => reint0_2_output_port_net_x0,
      b => reint1_2_output_port_net_x0,
      ce => ce_1_sg_x365,
      clk => clk_1_sg_x365,
      clr => '0',
      en => "1",
      s => addr1_s_net
    );

  addr2: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 16,
      b_arith => xlSigned,
      b_bin_pt => 14,
      b_width => 16,
      c_has_b_out => 0,
      c_has_c_out => 0,
      c_has_q_b_out => 0,
      c_has_q_c_out => 0,
      c_latency => 1,
      c_output_width => 17,
      core_name0 => "adder_subtracter_virtex2p_7_0_9301e8703140ec16",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 17,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 14,
      s_width => 17
    )
    port map (
      a => reint2_2_output_port_net_x0,
      b => reint3_2_output_port_net_x0,
      ce => ce_1_sg_x365,
      clk => clk_1_sg_x365,
      clr => '0',
      en => "1",
      s => addr2_s_net
    );

  addr3: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 14,
      a_width => 17,
      b_arith => xlSigned,
      b_bin_pt => 14,
      b_width => 17,
      c_has_b_out => 0,
      c_has_c_out => 0,
      c_has_q_b_out => 0,
      c_has_q_c_out => 0,
      c_latency => 1,
      c_output_width => 18,
      core_name0 => "adder_subtracter_virtex2p_7_0_c5dcd9e7347382cf",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 18,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 14,
      s_width => 18
    )
    port map (
      a => addr1_s_net,
      b => addr2_s_net,
      ce => ce_1_sg_x365,
      clk => clk_1_sg_x365,
      clr => '0',
      en => "1",
      s => addr3_s_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_last_tap/pfb_add_tree"

entity pfb_add_tree_entity_eeb2e40a1a is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(127 downto 0); 
    sync: in std_logic; 
    dout: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end pfb_add_tree_entity_eeb2e40a1a;

architecture structural of pfb_add_tree_entity_eeb2e40a1a is
  signal addr3_s_net_x0: std_logic_vector(17 downto 0);
  signal addr3_s_net_x1: std_logic_vector(17 downto 0);
  signal ce_1_sg_x366: std_logic;
  signal clk_1_sg_x366: std_logic;
  signal concat_y_net_x0: std_logic_vector(127 downto 0);
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(17 downto 0);
  signal delay1_q_net_x6: std_logic;
  signal delay_q_net_x1: std_logic;
  signal reint0_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint0_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint1_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint1_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint2_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint2_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint3_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint3_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal scale1_op_net: std_logic_vector(17 downto 0);
  signal scale2_op_net: std_logic_vector(17 downto 0);
  signal slice0_1_y_net: std_logic_vector(15 downto 0);
  signal slice0_2_y_net: std_logic_vector(15 downto 0);
  signal slice1_1_y_net: std_logic_vector(15 downto 0);
  signal slice1_2_y_net: std_logic_vector(15 downto 0);
  signal slice2_1_y_net: std_logic_vector(15 downto 0);
  signal slice2_2_y_net: std_logic_vector(15 downto 0);
  signal slice3_1_y_net: std_logic_vector(15 downto 0);
  signal slice3_2_y_net: std_logic_vector(15 downto 0);
  signal sync_delay_q_net_x0: std_logic;

begin
  ce_1_sg_x366 <= ce_1;
  clk_1_sg_x366 <= clk_1;
  concat_y_net_x0 <= din;
  delay_q_net_x1 <= sync;
  dout <= concat_y_net_x2;
  sync_out <= delay1_q_net_x6;

  adder_tree1_90ea522bff: entity work.adder_tree1_entity_90ea522bff
    port map (
      ce_1 => ce_1_sg_x366,
      clk_1 => clk_1_sg_x366,
      din1 => reint0_1_output_port_net_x0,
      din2 => reint1_1_output_port_net_x0,
      din3 => reint2_1_output_port_net_x0,
      din4 => reint3_1_output_port_net_x0,
      sync => delay_q_net_x1,
      dout => addr3_s_net_x0,
      sync_out => sync_delay_q_net_x0
    );

  adder_tree2_d60253b642: entity work.adder_tree2_entity_d60253b642
    port map (
      ce_1 => ce_1_sg_x366,
      clk_1 => clk_1_sg_x366,
      din1 => reint0_2_output_port_net_x0,
      din2 => reint1_2_output_port_net_x0,
      din3 => reint2_2_output_port_net_x0,
      din4 => reint3_2_output_port_net_x0,
      dout => addr3_s_net_x1
    );

  convert1: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      clr => '0',
      din => scale1_op_net,
      dout => convert1_dout_net_x0
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      clr => '0',
      din => scale2_op_net,
      dout => convert2_dout_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x366,
      clk => clk_1_sg_x366,
      d(0) => sync_delay_q_net_x0,
      en => '1',
      q(0) => delay1_q_net_x6
    );

  reint0_1: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice0_1_y_net,
      output_port => reint0_1_output_port_net_x0
    );

  reint0_2: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice0_2_y_net,
      output_port => reint0_2_output_port_net_x0
    );

  reint1_1: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice1_1_y_net,
      output_port => reint1_1_output_port_net_x0
    );

  reint1_2: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice1_2_y_net,
      output_port => reint1_2_output_port_net_x0
    );

  reint2_1: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice2_1_y_net,
      output_port => reint2_1_output_port_net_x0
    );

  reint2_2: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice2_2_y_net,
      output_port => reint2_2_output_port_net_x0
    );

  reint3_1: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice3_1_y_net,
      output_port => reint3_1_output_port_net_x0
    );

  reint3_2: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice3_2_y_net,
      output_port => reint3_2_output_port_net_x0
    );

  ri_to_c_03e85497f2: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert2_dout_net_x0,
      re => convert1_dout_net_x0,
      c => concat_y_net_x2
    );

  scale1: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addr3_s_net_x0,
      op => scale1_op_net
    );

  scale2: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addr3_s_net_x1,
      op => scale2_op_net
    );

  slice0_1: entity work.xlslice
    generic map (
      new_lsb => 112,
      new_msb => 127,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice0_1_y_net
    );

  slice0_2: entity work.xlslice
    generic map (
      new_lsb => 96,
      new_msb => 111,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice0_2_y_net
    );

  slice1_1: entity work.xlslice
    generic map (
      new_lsb => 80,
      new_msb => 95,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice1_1_y_net
    );

  slice1_2: entity work.xlslice
    generic map (
      new_lsb => 64,
      new_msb => 79,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice1_2_y_net
    );

  slice2_1: entity work.xlslice
    generic map (
      new_lsb => 48,
      new_msb => 63,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice2_1_y_net
    );

  slice2_2: entity work.xlslice
    generic map (
      new_lsb => 32,
      new_msb => 47,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice2_2_y_net
    );

  slice3_1: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 31,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice3_1_y_net
    );

  slice3_2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 15,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice3_2_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_last_tap"

entity pol1_in1_last_tap_entity_87bf560f2d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(7 downto 0); 
    din: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    taps: in std_logic_vector(95 downto 0); 
    dout: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end pol1_in1_last_tap_entity_87bf560f2d;

architecture structural of pol1_in1_last_tap_entity_87bf560f2d is
  signal ce_1_sg_x367: std_logic;
  signal clk_1_sg_x367: std_logic;
  signal concat_y_net_x0: std_logic_vector(127 downto 0);
  signal concat_y_net_x1: std_logic_vector(31 downto 0);
  signal concat_y_net_x3: std_logic_vector(95 downto 0);
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal delay1_q_net_x7: std_logic;
  signal delay_q_net_x1: std_logic;
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal mult1_p_net_x0: std_logic_vector(15 downto 0);
  signal mult_p_net_x0: std_logic_vector(15 downto 0);
  signal mux_y_net_x0: std_logic;
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(15 downto 0);
  signal slice1_y_net_x0: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x367 <= ce_1;
  clk_1_sg_x367 <= clk_1;
  slice1_y_net_x0 <= coeff;
  single_port_ram_data_out_net_x1 <= din;
  mux_y_net_x0 <= sync;
  concat_y_net_x3 <= taps;
  dout <= concat_y_net_x4;
  sync_out <= delay1_q_net_x7;

  c_to_ri_ac058e0c5a: entity work.c_to_ri_entity_b56daa3700
    port map (
      c => single_port_ram_data_out_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  concat: entity work.concat_65b7cc6f0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat_y_net_x1,
      in1 => concat_y_net_x3,
      y => concat_y_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x367,
      clk => clk_1_sg_x367,
      d(0) => mux_y_net_x0,
      en => '1',
      q(0) => delay_q_net_x1
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x367,
      clk => clk_1_sg_x367,
      clr => '0',
      core_ce => ce_1_sg_x367,
      core_clk => clk_1_sg_x367,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x367,
      clk => clk_1_sg_x367,
      clr => '0',
      core_ce => ce_1_sg_x367,
      core_clk => clk_1_sg_x367,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  pfb_add_tree_eeb2e40a1a: entity work.pfb_add_tree_entity_eeb2e40a1a
    port map (
      ce_1 => ce_1_sg_x367,
      clk_1 => clk_1_sg_x367,
      din => concat_y_net_x0,
      sync => delay_q_net_x1,
      dout => concat_y_net_x4,
      sync_out => delay1_q_net_x7
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice1_y_net_x0,
      output_port => reinterpret_output_port_net
    );

  ri_to_c_77179b7a29: entity work.ri_to_c_entity_62640ddb7f
    port map (
      im => mult_p_net_x0,
      re => mult1_p_net_x0,
      c => concat_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_tap2"

entity pol1_in1_tap2_entity_51b09e6130 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(23 downto 0); 
    din: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    taps: in std_logic_vector(31 downto 0); 
    coeff_out: out std_logic_vector(15 downto 0); 
    dout: out std_logic_vector(15 downto 0); 
    sync_out: out std_logic; 
    taps_out: out std_logic_vector(63 downto 0)
  );
end pol1_in1_tap2_entity_51b09e6130;

architecture structural of pol1_in1_tap2_entity_51b09e6130 is
  signal ce_1_sg_x370: std_logic;
  signal clk_1_sg_x370: std_logic;
  signal concat_y_net_x0: std_logic_vector(31 downto 0);
  signal concat_y_net_x4: std_logic_vector(31 downto 0);
  signal concat_y_net_x5: std_logic_vector(63 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal mult1_p_net_x0: std_logic_vector(15 downto 0);
  signal mult_p_net_x0: std_logic_vector(15 downto 0);
  signal mux_y_net_x3: std_logic;
  signal mux_y_net_x4: std_logic;
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x4: std_logic_vector(15 downto 0);
  signal single_port_ram_data_out_net_x5: std_logic_vector(15 downto 0);
  signal slice1_y_net_x1: std_logic_vector(23 downto 0);
  signal slice1_y_net_x2: std_logic_vector(15 downto 0);
  signal slice_y_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x370 <= ce_1;
  clk_1_sg_x370 <= clk_1;
  slice1_y_net_x1 <= coeff;
  single_port_ram_data_out_net_x4 <= din;
  mux_y_net_x3 <= sync;
  concat_y_net_x4 <= taps;
  coeff_out <= slice1_y_net_x2;
  dout <= single_port_ram_data_out_net_x5;
  sync_out <= mux_y_net_x4;
  taps_out <= concat_y_net_x5;

  c_to_ri_b95d94186f: entity work.c_to_ri_entity_b56daa3700
    port map (
      c => single_port_ram_data_out_net_x4,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  concat: entity work.concat_62c4475a80
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat_y_net_x0,
      in1 => concat_y_net_x4,
      y => concat_y_net_x5
    );

  delay_bram_9520bc6fa1: entity work.delay_bram_entity_7429e167ee
    port map (
      ce_1 => ce_1_sg_x370,
      clk_1 => clk_1_sg_x370,
      in1 => single_port_ram_data_out_net_x4,
      out1 => single_port_ram_data_out_net_x5
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x370,
      clk => clk_1_sg_x370,
      clr => '0',
      core_ce => ce_1_sg_x370,
      core_clk => clk_1_sg_x370,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x370,
      clk => clk_1_sg_x370,
      clr => '0',
      core_ce => ce_1_sg_x370,
      core_clk => clk_1_sg_x370,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  ri_to_c_829cfa0b37: entity work.ri_to_c_entity_62640ddb7f
    port map (
      im => mult_p_net_x0,
      re => mult1_p_net_x0,
      c => concat_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 24,
      y_width => 8
    )
    port map (
      x => slice1_y_net_x1,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 23,
      x_width => 24,
      y_width => 16
    )
    port map (
      x => slice1_y_net_x1,
      y => slice1_y_net_x2
    );

  sync_delay_ad35939993: entity work.sync_delay_entity_4e0570d115
    port map (
      ce_1 => ce_1_sg_x370,
      clk_1 => clk_1_sg_x370,
      in_x0 => mux_y_net_x3,
      out_x0 => mux_y_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0/pol1_in1_tap3"

entity pol1_in1_tap3_entity_589ea34790 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(15 downto 0); 
    din: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    taps: in std_logic_vector(63 downto 0); 
    coeff_out: out std_logic_vector(7 downto 0); 
    dout: out std_logic_vector(15 downto 0); 
    sync_out: out std_logic; 
    taps_out: out std_logic_vector(95 downto 0)
  );
end pol1_in1_tap3_entity_589ea34790;

architecture structural of pol1_in1_tap3_entity_589ea34790 is
  signal ce_1_sg_x373: std_logic;
  signal clk_1_sg_x373: std_logic;
  signal concat_y_net_x0: std_logic_vector(31 downto 0);
  signal concat_y_net_x6: std_logic_vector(63 downto 0);
  signal concat_y_net_x7: std_logic_vector(95 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal mult1_p_net_x0: std_logic_vector(15 downto 0);
  signal mult_p_net_x0: std_logic_vector(15 downto 0);
  signal mux_y_net_x2: std_logic;
  signal mux_y_net_x6: std_logic;
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x3: std_logic_vector(15 downto 0);
  signal single_port_ram_data_out_net_x8: std_logic_vector(15 downto 0);
  signal slice1_y_net_x3: std_logic_vector(15 downto 0);
  signal slice1_y_net_x4: std_logic_vector(7 downto 0);
  signal slice_y_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x373 <= ce_1;
  clk_1_sg_x373 <= clk_1;
  slice1_y_net_x3 <= coeff;
  single_port_ram_data_out_net_x8 <= din;
  mux_y_net_x6 <= sync;
  concat_y_net_x6 <= taps;
  coeff_out <= slice1_y_net_x4;
  dout <= single_port_ram_data_out_net_x3;
  sync_out <= mux_y_net_x2;
  taps_out <= concat_y_net_x7;

  c_to_ri_554bded8b5: entity work.c_to_ri_entity_b56daa3700
    port map (
      c => single_port_ram_data_out_net_x8,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  concat: entity work.concat_0e2072f8e1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat_y_net_x0,
      in1 => concat_y_net_x6,
      y => concat_y_net_x7
    );

  delay_bram_4a528b24a9: entity work.delay_bram_entity_7429e167ee
    port map (
      ce_1 => ce_1_sg_x373,
      clk_1 => clk_1_sg_x373,
      in1 => single_port_ram_data_out_net_x8,
      out1 => single_port_ram_data_out_net_x3
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
      clr => '0',
      core_ce => ce_1_sg_x373,
      core_clk => clk_1_sg_x373,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x373,
      clk => clk_1_sg_x373,
      clr => '0',
      core_ce => ce_1_sg_x373,
      core_clk => clk_1_sg_x373,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  ri_to_c_7859f0188b: entity work.ri_to_c_entity_62640ddb7f
    port map (
      im => mult_p_net_x0,
      re => mult1_p_net_x0,
      c => concat_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 16,
      y_width => 8
    )
    port map (
      x => slice1_y_net_x3,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 15,
      x_width => 16,
      y_width => 8
    )
    port map (
      x => slice1_y_net_x3,
      y => slice1_y_net_x4
    );

  sync_delay_a22938e22c: entity work.sync_delay_entity_4e0570d115
    port map (
      ce_1 => ce_1_sg_x373,
      clk_1 => clk_1_sg_x373,
      in_x0 => mux_y_net_x6,
      out_x0 => mux_y_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir0"

entity pfb_fir0_entity_53493745fd is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol1_in1: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    pol1_out1: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end pfb_fir0_entity_53493745fd;

architecture structural of pfb_fir0_entity_53493745fd is
  signal ce_1_sg_x374: std_logic;
  signal clk_1_sg_x374: std_logic;
  signal concat_y_net_x4: std_logic_vector(31 downto 0);
  signal concat_y_net_x6: std_logic_vector(63 downto 0);
  signal concat_y_net_x7: std_logic_vector(95 downto 0);
  signal concat_y_net_x8: std_logic_vector(15 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal delay1_q_net_x8: std_logic;
  signal logical3_y_net_x2: std_logic;
  signal mux_y_net_x2: std_logic;
  signal mux_y_net_x3: std_logic;
  signal mux_y_net_x6: std_logic;
  signal single_port_ram_data_out_net_x3: std_logic_vector(15 downto 0);
  signal single_port_ram_data_out_net_x4: std_logic_vector(15 downto 0);
  signal single_port_ram_data_out_net_x8: std_logic_vector(15 downto 0);
  signal slice1_y_net_x1: std_logic_vector(23 downto 0);
  signal slice1_y_net_x3: std_logic_vector(15 downto 0);
  signal slice1_y_net_x4: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x374 <= ce_1;
  clk_1_sg_x374 <= clk_1;
  concat_y_net_x8 <= pol1_in1;
  logical3_y_net_x2 <= sync;
  pol1_out1 <= concat_y_net_x9;
  sync_out <= delay1_q_net_x8;

  pol1_in1_first_tap_f782e4fba8: entity work.pol1_in1_first_tap_entity_f782e4fba8
    port map (
      ce_1 => ce_1_sg_x374,
      clk_1 => clk_1_sg_x374,
      din => concat_y_net_x8,
      sync => logical3_y_net_x2,
      coeff_out => slice1_y_net_x1,
      dout => single_port_ram_data_out_net_x4,
      sync_out => mux_y_net_x3,
      taps_out => concat_y_net_x4
    );

  pol1_in1_last_tap_87bf560f2d: entity work.pol1_in1_last_tap_entity_87bf560f2d
    port map (
      ce_1 => ce_1_sg_x374,
      clk_1 => clk_1_sg_x374,
      coeff => slice1_y_net_x4,
      din => single_port_ram_data_out_net_x3,
      sync => mux_y_net_x2,
      taps => concat_y_net_x7,
      dout => concat_y_net_x9,
      sync_out => delay1_q_net_x8
    );

  pol1_in1_tap2_51b09e6130: entity work.pol1_in1_tap2_entity_51b09e6130
    port map (
      ce_1 => ce_1_sg_x374,
      clk_1 => clk_1_sg_x374,
      coeff => slice1_y_net_x1,
      din => single_port_ram_data_out_net_x4,
      sync => mux_y_net_x3,
      taps => concat_y_net_x4,
      coeff_out => slice1_y_net_x3,
      dout => single_port_ram_data_out_net_x8,
      sync_out => mux_y_net_x6,
      taps_out => concat_y_net_x6
    );

  pol1_in1_tap3_589ea34790: entity work.pol1_in1_tap3_entity_589ea34790
    port map (
      ce_1 => ce_1_sg_x374,
      clk_1 => clk_1_sg_x374,
      coeff => slice1_y_net_x3,
      din => single_port_ram_data_out_net_x8,
      sync => mux_y_net_x6,
      taps => concat_y_net_x6,
      coeff_out => slice1_y_net_x4,
      dout => single_port_ram_data_out_net_x3,
      sync_out => mux_y_net_x2,
      taps_out => concat_y_net_x7
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir1/pol1_in1_first_tap/pfb_coeff_gen"

entity pfb_coeff_gen_entity_33c4c15fa9 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    coeff: out std_logic_vector(31 downto 0); 
    dout: out std_logic_vector(15 downto 0)
  );
end pfb_coeff_gen_entity_33c4c15fa9;

architecture structural of pfb_coeff_gen_entity_33c4c15fa9 is
  signal ce_1_sg_x376: std_logic;
  signal clk_1_sg_x376: std_logic;
  signal concat_y_net: std_logic_vector(31 downto 0);
  signal concat_y_net_x1: std_logic_vector(15 downto 0);
  signal counter_op_net: std_logic_vector(10 downto 0);
  signal delay1_q_net_x2: std_logic_vector(15 downto 0);
  signal logical3_y_net_x3: std_logic;
  signal register_q_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(7 downto 0);
  signal rom1_data_net: std_logic_vector(7 downto 0);
  signal rom2_data_net: std_logic_vector(7 downto 0);
  signal rom3_data_net: std_logic_vector(7 downto 0);
  signal rom4_data_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x376 <= ce_1;
  clk_1_sg_x376 <= clk_1;
  concat_y_net_x1 <= din;
  logical3_y_net_x3 <= sync;
  coeff <= register_q_net_x0;
  dout <= delay1_q_net_x2;

  concat: entity work.concat_a1e126f11c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret1_output_port_net,
      in1 => reinterpret2_output_port_net,
      in2 => reinterpret3_output_port_net,
      in3 => reinterpret4_output_port_net,
      y => concat_y_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_d0a204b7c881b521",
      op_arith => xlUnsigned,
      op_width => 11
    )
    port map (
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
      clr => '0',
      en => "1",
      rst(0) => logical3_y_net_x3,
      op => counter_op_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 4,
      reg_retiming => 0,
      width => 16
    )
    port map (
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
      d => concat_y_net_x1,
      en => '1',
      q => delay1_q_net_x2
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 32,
      init_value => b"00000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
      d => concat_y_net,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret1: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom1_data_net,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom2_data_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom3_data_net,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rom4_data_net,
      output_port => reinterpret4_output_port_net
    );

  rom1: entity work.xlsprom
    generic map (
      c_address_width => 11,
      c_width => 8,
      core_name0 => "single_port_block_memory_virtex2p_6_1_c4da1499b2390313",
      latency => 2
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
      en => "1",
      rst => "0",
      data => rom1_data_net
    );

  rom2: entity work.xlsprom
    generic map (
      c_address_width => 11,
      c_width => 8,
      core_name0 => "single_port_block_memory_virtex2p_6_1_d13072650a2ab55b",
      latency => 2
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
      en => "1",
      rst => "0",
      data => rom2_data_net
    );

  rom3: entity work.xlsprom
    generic map (
      c_address_width => 11,
      c_width => 8,
      core_name0 => "single_port_block_memory_virtex2p_6_1_ee12ce34adfa5ec2",
      latency => 2
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
      en => "1",
      rst => "0",
      data => rom3_data_net
    );

  rom4: entity work.xlsprom
    generic map (
      c_address_width => 11,
      c_width => 8,
      core_name0 => "single_port_block_memory_virtex2p_6_1_fc890bd72b8e4bff",
      latency => 2
    )
    port map (
      addr => counter_op_net,
      ce => ce_1_sg_x376,
      clk => clk_1_sg_x376,
      en => "1",
      rst => "0",
      data => rom4_data_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir1/pol1_in1_first_tap"

entity pol1_in1_first_tap_entity_49bfd9f585 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    coeff_out: out std_logic_vector(23 downto 0); 
    dout: out std_logic_vector(15 downto 0); 
    taps_out: out std_logic_vector(31 downto 0)
  );
end pol1_in1_first_tap_entity_49bfd9f585;

architecture structural of pol1_in1_first_tap_entity_49bfd9f585 is
  signal ce_1_sg_x377: std_logic;
  signal clk_1_sg_x377: std_logic;
  signal concat_y_net_x2: std_logic_vector(15 downto 0);
  signal concat_y_net_x3: std_logic_vector(31 downto 0);
  signal delay1_q_net_x2: std_logic_vector(15 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal logical3_y_net_x4: std_logic;
  signal mult1_p_net_x0: std_logic_vector(15 downto 0);
  signal mult_p_net_x0: std_logic_vector(15 downto 0);
  signal register_q_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(15 downto 0);
  signal slice1_y_net_x0: std_logic_vector(23 downto 0);
  signal slice_y_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x377 <= ce_1;
  clk_1_sg_x377 <= clk_1;
  concat_y_net_x2 <= din;
  logical3_y_net_x4 <= sync;
  coeff_out <= slice1_y_net_x0;
  dout <= single_port_ram_data_out_net_x1;
  taps_out <= concat_y_net_x3;

  c_to_ri_2f35c228b3: entity work.c_to_ri_entity_b56daa3700
    port map (
      c => delay1_q_net_x2,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  delay_bram_94e64312d9: entity work.delay_bram_entity_7429e167ee
    port map (
      ce_1 => ce_1_sg_x377,
      clk_1 => clk_1_sg_x377,
      in1 => delay1_q_net_x2,
      out1 => single_port_ram_data_out_net_x1
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x377,
      clk => clk_1_sg_x377,
      clr => '0',
      core_ce => ce_1_sg_x377,
      core_clk => clk_1_sg_x377,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x377,
      clk => clk_1_sg_x377,
      clr => '0',
      core_ce => ce_1_sg_x377,
      core_clk => clk_1_sg_x377,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  pfb_coeff_gen_33c4c15fa9: entity work.pfb_coeff_gen_entity_33c4c15fa9
    port map (
      ce_1 => ce_1_sg_x377,
      clk_1 => clk_1_sg_x377,
      din => concat_y_net_x2,
      sync => logical3_y_net_x4,
      coeff => register_q_net_x0,
      dout => delay1_q_net_x2
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  ri_to_c_def8d103b5: entity work.ri_to_c_entity_62640ddb7f
    port map (
      im => mult_p_net_x0,
      re => mult1_p_net_x0,
      c => concat_y_net_x3
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 32,
      y_width => 8
    )
    port map (
      x => register_q_net_x0,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 31,
      x_width => 32,
      y_width => 24
    )
    port map (
      x => register_q_net_x0,
      y => slice1_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir1/pol1_in1_last_tap/pfb_add_tree"

entity pfb_add_tree_entity_5393a56386 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(127 downto 0); 
    dout: out std_logic_vector(35 downto 0)
  );
end pfb_add_tree_entity_5393a56386;

architecture structural of pfb_add_tree_entity_5393a56386 is
  signal addr3_s_net_x0: std_logic_vector(17 downto 0);
  signal addr3_s_net_x1: std_logic_vector(17 downto 0);
  signal ce_1_sg_x380: std_logic;
  signal clk_1_sg_x380: std_logic;
  signal concat_y_net_x0: std_logic_vector(127 downto 0);
  signal concat_y_net_x2: std_logic_vector(35 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(17 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(17 downto 0);
  signal reint0_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint0_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint1_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint1_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint2_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint2_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint3_1_output_port_net_x0: std_logic_vector(15 downto 0);
  signal reint3_2_output_port_net_x0: std_logic_vector(15 downto 0);
  signal scale1_op_net: std_logic_vector(17 downto 0);
  signal scale2_op_net: std_logic_vector(17 downto 0);
  signal slice0_1_y_net: std_logic_vector(15 downto 0);
  signal slice0_2_y_net: std_logic_vector(15 downto 0);
  signal slice1_1_y_net: std_logic_vector(15 downto 0);
  signal slice1_2_y_net: std_logic_vector(15 downto 0);
  signal slice2_1_y_net: std_logic_vector(15 downto 0);
  signal slice2_2_y_net: std_logic_vector(15 downto 0);
  signal slice3_1_y_net: std_logic_vector(15 downto 0);
  signal slice3_2_y_net: std_logic_vector(15 downto 0);

begin
  ce_1_sg_x380 <= ce_1;
  clk_1_sg_x380 <= clk_1;
  concat_y_net_x0 <= din;
  dout <= concat_y_net_x2;

  adder_tree1_8565605fc0: entity work.adder_tree2_entity_d60253b642
    port map (
      ce_1 => ce_1_sg_x380,
      clk_1 => clk_1_sg_x380,
      din1 => reint0_1_output_port_net_x0,
      din2 => reint1_1_output_port_net_x0,
      din3 => reint2_1_output_port_net_x0,
      din4 => reint3_1_output_port_net_x0,
      dout => addr3_s_net_x0
    );

  adder_tree2_bc98008799: entity work.adder_tree2_entity_d60253b642
    port map (
      ce_1 => ce_1_sg_x380,
      clk_1 => clk_1_sg_x380,
      din1 => reint0_2_output_port_net_x0,
      din2 => reint1_2_output_port_net_x0,
      din3 => reint2_2_output_port_net_x0,
      din4 => reint3_2_output_port_net_x0,
      dout => addr3_s_net_x1
    );

  convert1: entity work.xlconvert_pipeline
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x380,
      clk => clk_1_sg_x380,
      clr => '0',
      din => scale1_op_net,
      dout => convert1_dout_net_x0
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 17,
      din_width => 18,
      dout_arith => 2,
      dout_bin_pt => 17,
      dout_width => 18,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRoundBanker
    )
    port map (
      ce => ce_1_sg_x380,
      clk => clk_1_sg_x380,
      clr => '0',
      din => scale2_op_net,
      dout => convert2_dout_net_x0
    );

  reint0_1: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice0_1_y_net,
      output_port => reint0_1_output_port_net_x0
    );

  reint0_2: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice0_2_y_net,
      output_port => reint0_2_output_port_net_x0
    );

  reint1_1: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice1_1_y_net,
      output_port => reint1_1_output_port_net_x0
    );

  reint1_2: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice1_2_y_net,
      output_port => reint1_2_output_port_net_x0
    );

  reint2_1: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice2_1_y_net,
      output_port => reint2_1_output_port_net_x0
    );

  reint2_2: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice2_2_y_net,
      output_port => reint2_2_output_port_net_x0
    );

  reint3_1: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice3_1_y_net,
      output_port => reint3_1_output_port_net_x0
    );

  reint3_2: entity work.reinterpret_151459306d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice3_2_y_net,
      output_port => reint3_2_output_port_net_x0
    );

  ri_to_c_8f3bf681b4: entity work.ri_to_c_entity_7019693a09
    port map (
      im => convert2_dout_net_x0,
      re => convert1_dout_net_x0,
      c => concat_y_net_x2
    );

  scale1: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addr3_s_net_x0,
      op => scale1_op_net
    );

  scale2: entity work.scale_1768584a8d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      ip => addr3_s_net_x1,
      op => scale2_op_net
    );

  slice0_1: entity work.xlslice
    generic map (
      new_lsb => 112,
      new_msb => 127,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice0_1_y_net
    );

  slice0_2: entity work.xlslice
    generic map (
      new_lsb => 96,
      new_msb => 111,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice0_2_y_net
    );

  slice1_1: entity work.xlslice
    generic map (
      new_lsb => 80,
      new_msb => 95,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice1_1_y_net
    );

  slice1_2: entity work.xlslice
    generic map (
      new_lsb => 64,
      new_msb => 79,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice1_2_y_net
    );

  slice2_1: entity work.xlslice
    generic map (
      new_lsb => 48,
      new_msb => 63,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice2_1_y_net
    );

  slice2_2: entity work.xlslice
    generic map (
      new_lsb => 32,
      new_msb => 47,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice2_2_y_net
    );

  slice3_1: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 31,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice3_1_y_net
    );

  slice3_2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 15,
      x_width => 128,
      y_width => 16
    )
    port map (
      x => concat_y_net_x0,
      y => slice3_2_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir1/pol1_in1_last_tap"

entity pol1_in1_last_tap_entity_42e06cbfef is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(7 downto 0); 
    din: in std_logic_vector(15 downto 0); 
    taps: in std_logic_vector(95 downto 0); 
    dout: out std_logic_vector(35 downto 0)
  );
end pol1_in1_last_tap_entity_42e06cbfef;

architecture structural of pol1_in1_last_tap_entity_42e06cbfef is
  signal ce_1_sg_x381: std_logic;
  signal clk_1_sg_x381: std_logic;
  signal concat_y_net_x0: std_logic_vector(127 downto 0);
  signal concat_y_net_x1: std_logic_vector(31 downto 0);
  signal concat_y_net_x3: std_logic_vector(95 downto 0);
  signal concat_y_net_x4: std_logic_vector(35 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal mult1_p_net_x0: std_logic_vector(15 downto 0);
  signal mult_p_net_x0: std_logic_vector(15 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x1: std_logic_vector(15 downto 0);
  signal slice1_y_net_x0: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x381 <= ce_1;
  clk_1_sg_x381 <= clk_1;
  slice1_y_net_x0 <= coeff;
  single_port_ram_data_out_net_x1 <= din;
  concat_y_net_x3 <= taps;
  dout <= concat_y_net_x4;

  c_to_ri_712817af8f: entity work.c_to_ri_entity_b56daa3700
    port map (
      c => single_port_ram_data_out_net_x1,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  concat: entity work.concat_65b7cc6f0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat_y_net_x1,
      in1 => concat_y_net_x3,
      y => concat_y_net_x0
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x381,
      clk => clk_1_sg_x381,
      clr => '0',
      core_ce => ce_1_sg_x381,
      core_clk => clk_1_sg_x381,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x381,
      clk => clk_1_sg_x381,
      clr => '0',
      core_ce => ce_1_sg_x381,
      core_clk => clk_1_sg_x381,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  pfb_add_tree_5393a56386: entity work.pfb_add_tree_entity_5393a56386
    port map (
      ce_1 => ce_1_sg_x381,
      clk_1 => clk_1_sg_x381,
      din => concat_y_net_x0,
      dout => concat_y_net_x4
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice1_y_net_x0,
      output_port => reinterpret_output_port_net
    );

  ri_to_c_63a03b14d2: entity work.ri_to_c_entity_62640ddb7f
    port map (
      im => mult_p_net_x0,
      re => mult1_p_net_x0,
      c => concat_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir1/pol1_in1_tap2"

entity pol1_in1_tap2_entity_46b2d9fc6b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(23 downto 0); 
    din: in std_logic_vector(15 downto 0); 
    taps: in std_logic_vector(31 downto 0); 
    coeff_out: out std_logic_vector(15 downto 0); 
    dout: out std_logic_vector(15 downto 0); 
    taps_out: out std_logic_vector(63 downto 0)
  );
end pol1_in1_tap2_entity_46b2d9fc6b;

architecture structural of pol1_in1_tap2_entity_46b2d9fc6b is
  signal ce_1_sg_x383: std_logic;
  signal clk_1_sg_x383: std_logic;
  signal concat_y_net_x0: std_logic_vector(31 downto 0);
  signal concat_y_net_x4: std_logic_vector(31 downto 0);
  signal concat_y_net_x5: std_logic_vector(63 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal mult1_p_net_x0: std_logic_vector(15 downto 0);
  signal mult_p_net_x0: std_logic_vector(15 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x4: std_logic_vector(15 downto 0);
  signal single_port_ram_data_out_net_x5: std_logic_vector(15 downto 0);
  signal slice1_y_net_x1: std_logic_vector(23 downto 0);
  signal slice1_y_net_x2: std_logic_vector(15 downto 0);
  signal slice_y_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x383 <= ce_1;
  clk_1_sg_x383 <= clk_1;
  slice1_y_net_x1 <= coeff;
  single_port_ram_data_out_net_x4 <= din;
  concat_y_net_x4 <= taps;
  coeff_out <= slice1_y_net_x2;
  dout <= single_port_ram_data_out_net_x5;
  taps_out <= concat_y_net_x5;

  c_to_ri_36b73fb459: entity work.c_to_ri_entity_b56daa3700
    port map (
      c => single_port_ram_data_out_net_x4,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  concat: entity work.concat_62c4475a80
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat_y_net_x0,
      in1 => concat_y_net_x4,
      y => concat_y_net_x5
    );

  delay_bram_ace0ebc832: entity work.delay_bram_entity_7429e167ee
    port map (
      ce_1 => ce_1_sg_x383,
      clk_1 => clk_1_sg_x383,
      in1 => single_port_ram_data_out_net_x4,
      out1 => single_port_ram_data_out_net_x5
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x383,
      clk => clk_1_sg_x383,
      clr => '0',
      core_ce => ce_1_sg_x383,
      core_clk => clk_1_sg_x383,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x383,
      clk => clk_1_sg_x383,
      clr => '0',
      core_ce => ce_1_sg_x383,
      core_clk => clk_1_sg_x383,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  ri_to_c_0362f9edb7: entity work.ri_to_c_entity_62640ddb7f
    port map (
      im => mult_p_net_x0,
      re => mult1_p_net_x0,
      c => concat_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 24,
      y_width => 8
    )
    port map (
      x => slice1_y_net_x1,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 23,
      x_width => 24,
      y_width => 16
    )
    port map (
      x => slice1_y_net_x1,
      y => slice1_y_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir1/pol1_in1_tap3"

entity pol1_in1_tap3_entity_6f6be6c408 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff: in std_logic_vector(15 downto 0); 
    din: in std_logic_vector(15 downto 0); 
    taps: in std_logic_vector(63 downto 0); 
    coeff_out: out std_logic_vector(7 downto 0); 
    dout: out std_logic_vector(15 downto 0); 
    taps_out: out std_logic_vector(95 downto 0)
  );
end pol1_in1_tap3_entity_6f6be6c408;

architecture structural of pol1_in1_tap3_entity_6f6be6c408 is
  signal ce_1_sg_x385: std_logic;
  signal clk_1_sg_x385: std_logic;
  signal concat_y_net_x0: std_logic_vector(31 downto 0);
  signal concat_y_net_x6: std_logic_vector(63 downto 0);
  signal concat_y_net_x7: std_logic_vector(95 downto 0);
  signal force_im_output_port_net_x0: std_logic_vector(7 downto 0);
  signal force_re_output_port_net_x0: std_logic_vector(7 downto 0);
  signal mult1_p_net_x0: std_logic_vector(15 downto 0);
  signal mult_p_net_x0: std_logic_vector(15 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(7 downto 0);
  signal single_port_ram_data_out_net_x3: std_logic_vector(15 downto 0);
  signal single_port_ram_data_out_net_x8: std_logic_vector(15 downto 0);
  signal slice1_y_net_x3: std_logic_vector(15 downto 0);
  signal slice1_y_net_x4: std_logic_vector(7 downto 0);
  signal slice_y_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x385 <= ce_1;
  clk_1_sg_x385 <= clk_1;
  slice1_y_net_x3 <= coeff;
  single_port_ram_data_out_net_x8 <= din;
  concat_y_net_x6 <= taps;
  coeff_out <= slice1_y_net_x4;
  dout <= single_port_ram_data_out_net_x3;
  taps_out <= concat_y_net_x7;

  c_to_ri_c5f5f13240: entity work.c_to_ri_entity_b56daa3700
    port map (
      c => single_port_ram_data_out_net_x8,
      im => force_im_output_port_net_x0,
      re => force_re_output_port_net_x0
    );

  concat: entity work.concat_0e2072f8e1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat_y_net_x0,
      in1 => concat_y_net_x6,
      y => concat_y_net_x7
    );

  delay_bram_c8ef7b2746: entity work.delay_bram_entity_7429e167ee
    port map (
      ce_1 => ce_1_sg_x385,
      clk_1 => clk_1_sg_x385,
      in1 => single_port_ram_data_out_net_x8,
      out1 => single_port_ram_data_out_net_x3
    );

  mult: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_im_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x385,
      clk => clk_1_sg_x385,
      clr => '0',
      core_ce => ce_1_sg_x385,
      core_clk => clk_1_sg_x385,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net_x0
    );

  mult1: entity work.xlmult_v9_0
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 7,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 7,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "multiplier_virtex2p_10_1_26e459ad9aa810bd",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 14,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => force_re_output_port_net_x0,
      b => reinterpret_output_port_net,
      ce => ce_1_sg_x385,
      clk => clk_1_sg_x385,
      clr => '0',
      core_ce => ce_1_sg_x385,
      core_clk => clk_1_sg_x385,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

  reinterpret: entity work.reinterpret_4389dc89bf
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  ri_to_c_f419a9c92e: entity work.ri_to_c_entity_62640ddb7f
    port map (
      im => mult_p_net_x0,
      re => mult1_p_net_x0,
      c => concat_y_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 7,
      x_width => 16,
      y_width => 8
    )
    port map (
      x => slice1_y_net_x3,
      y => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 8,
      new_msb => 15,
      x_width => 16,
      y_width => 8
    )
    port map (
      x => slice1_y_net_x3,
      y => slice1_y_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pfb_fir1"

entity pfb_fir1_entity_6880f213e5 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol1_in1: in std_logic_vector(15 downto 0); 
    sync: in std_logic; 
    pol1_out1: out std_logic_vector(35 downto 0)
  );
end pfb_fir1_entity_6880f213e5;

architecture structural of pfb_fir1_entity_6880f213e5 is
  signal ce_1_sg_x386: std_logic;
  signal clk_1_sg_x386: std_logic;
  signal concat_y_net_x4: std_logic_vector(31 downto 0);
  signal concat_y_net_x6: std_logic_vector(63 downto 0);
  signal concat_y_net_x7: std_logic_vector(95 downto 0);
  signal concat_y_net_x8: std_logic_vector(15 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal logical3_y_net_x5: std_logic;
  signal single_port_ram_data_out_net_x3: std_logic_vector(15 downto 0);
  signal single_port_ram_data_out_net_x4: std_logic_vector(15 downto 0);
  signal single_port_ram_data_out_net_x8: std_logic_vector(15 downto 0);
  signal slice1_y_net_x1: std_logic_vector(23 downto 0);
  signal slice1_y_net_x3: std_logic_vector(15 downto 0);
  signal slice1_y_net_x4: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x386 <= ce_1;
  clk_1_sg_x386 <= clk_1;
  concat_y_net_x8 <= pol1_in1;
  logical3_y_net_x5 <= sync;
  pol1_out1 <= concat_y_net_x9;

  pol1_in1_first_tap_49bfd9f585: entity work.pol1_in1_first_tap_entity_49bfd9f585
    port map (
      ce_1 => ce_1_sg_x386,
      clk_1 => clk_1_sg_x386,
      din => concat_y_net_x8,
      sync => logical3_y_net_x5,
      coeff_out => slice1_y_net_x1,
      dout => single_port_ram_data_out_net_x4,
      taps_out => concat_y_net_x4
    );

  pol1_in1_last_tap_42e06cbfef: entity work.pol1_in1_last_tap_entity_42e06cbfef
    port map (
      ce_1 => ce_1_sg_x386,
      clk_1 => clk_1_sg_x386,
      coeff => slice1_y_net_x4,
      din => single_port_ram_data_out_net_x3,
      taps => concat_y_net_x7,
      dout => concat_y_net_x9
    );

  pol1_in1_tap2_46b2d9fc6b: entity work.pol1_in1_tap2_entity_46b2d9fc6b
    port map (
      ce_1 => ce_1_sg_x386,
      clk_1 => clk_1_sg_x386,
      coeff => slice1_y_net_x1,
      din => single_port_ram_data_out_net_x4,
      taps => concat_y_net_x4,
      coeff_out => slice1_y_net_x3,
      dout => single_port_ram_data_out_net_x8,
      taps_out => concat_y_net_x6
    );

  pol1_in1_tap3_6f6be6c408: entity work.pol1_in1_tap3_entity_6f6be6c408
    port map (
      ce_1 => ce_1_sg_x386,
      clk_1 => clk_1_sg_x386,
      coeff => slice1_y_net_x3,
      din => single_port_ram_data_out_net_x8,
      taps => concat_y_net_x6,
      coeff_out => slice1_y_net_x4,
      dout => single_port_ram_data_out_net_x3,
      taps_out => concat_y_net_x7
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pulse_ext2/posedge"

entity posedge_entity_ac028bf8d0 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end posedge_entity_ac028bf8d0;

architecture structural of posedge_entity_ac028bf8d0 is
  signal ce_1_sg_x411: std_logic;
  signal clk_1_sg_x411: std_logic;
  signal delay_q_net: std_logic;
  signal inverter_op_net: std_logic;
  signal logical3_y_net_x12: std_logic;
  signal logical_y_net_x0: std_logic;

begin
  ce_1_sg_x411 <= ce_1;
  clk_1_sg_x411 <= clk_1;
  logical3_y_net_x12 <= in_x0;
  out_x0 <= logical_y_net_x0;

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x411,
      clk => clk_1_sg_x411,
      d(0) => logical3_y_net_x12,
      en => '1',
      q(0) => delay_q_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x411,
      clk => clk_1_sg_x411,
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
      d1(0) => logical3_y_net_x12,
      y(0) => logical_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pulse_ext2"

entity pulse_ext2_entity_af3e587f01 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end pulse_ext2_entity_af3e587f01;

architecture structural of pulse_ext2_entity_af3e587f01 is
  signal ce_1_sg_x412: std_logic;
  signal clk_1_sg_x412: std_logic;
  signal constant5_op_net: std_logic_vector(23 downto 0);
  signal counter3_op_net: std_logic_vector(23 downto 0);
  signal logical3_y_net_x13: std_logic;
  signal logical_y_net_x0: std_logic;
  signal relational5_op_net_x1: std_logic;

begin
  ce_1_sg_x412 <= ce_1;
  clk_1_sg_x412 <= clk_1;
  logical3_y_net_x13 <= in_x0;
  out_x0 <= relational5_op_net_x1;

  constant5: entity work.constant_bdd7f47790
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_804522374d9edc41",
      op_arith => xlUnsigned,
      op_width => 24
    )
    port map (
      ce => ce_1_sg_x412,
      clk => clk_1_sg_x412,
      clr => '0',
      en(0) => relational5_op_net_x1,
      rst(0) => logical_y_net_x0,
      op => counter3_op_net
    );

  posedge_ac028bf8d0: entity work.posedge_entity_ac028bf8d0
    port map (
      ce_1 => ce_1_sg_x412,
      clk_1 => clk_1_sg_x412,
      in_x0 => logical3_y_net_x13,
      out_x0 => logical_y_net_x0
    );

  relational5: entity work.relational_831189b190
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

-- Generated from Simulink block "i_128w_2k_10_r310iadc/pulse_ext3"

entity pulse_ext3_entity_89e91108c9 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end pulse_ext3_entity_89e91108c9;

architecture structural of pulse_ext3_entity_89e91108c9 is
  signal ce_1_sg_x414: std_logic;
  signal clk_1_sg_x414: std_logic;
  signal constant5_op_net: std_logic_vector(18 downto 0);
  signal counter3_op_net: std_logic_vector(18 downto 0);
  signal logical1_y_net_x1: std_logic;
  signal logical_y_net_x0: std_logic;
  signal relational5_op_net_x1: std_logic;

begin
  ce_1_sg_x414 <= ce_1;
  clk_1_sg_x414 <= clk_1;
  logical1_y_net_x1 <= in_x0;
  out_x0 <= relational5_op_net_x1;

  constant5: entity work.constant_b713aad2a7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  counter3: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_2ccd4f2322b1fa6a",
      op_arith => xlUnsigned,
      op_width => 19
    )
    port map (
      ce => ce_1_sg_x414,
      clk => clk_1_sg_x414,
      clr => '0',
      en(0) => relational5_op_net_x1,
      rst(0) => logical_y_net_x0,
      op => counter3_op_net
    );

  posedge_44c89c33f7: entity work.posedge_entity_ac028bf8d0
    port map (
      ce_1 => ce_1_sg_x414,
      clk_1 => clk_1_sg_x414,
      in_x0 => logical1_y_net_x1,
      out_x0 => logical_y_net_x0
    );

  relational5: entity work.relational_502d6cf7c0
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

-- Generated from Simulink block "i_128w_2k_10_r310iadc/ri_to_c"

entity ri_to_c_entity_e30b502d91 is
  port (
    im: in std_logic_vector(7 downto 0); 
    re: in std_logic_vector(7 downto 0); 
    c: out std_logic_vector(15 downto 0)
  );
end ri_to_c_entity_e30b502d91;

architecture structural of ri_to_c_entity_e30b502d91 is
  signal concat_y_net_x9: std_logic_vector(15 downto 0);
  signal force_im_output_port_net: std_logic_vector(7 downto 0);
  signal force_re_output_port_net: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x8: std_logic_vector(7 downto 0);
  signal reinterpret_output_port_net_x9: std_logic_vector(7 downto 0);

begin
  reinterpret_output_port_net_x9 <= im;
  reinterpret_output_port_net_x8 <= re;
  c <= concat_y_net_x9;

  concat: entity work.concat_8e53793314
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => force_re_output_port_net,
      in1 => force_im_output_port_net,
      y => concat_y_net_x9
    );

  force_im: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret_output_port_net_x9,
      output_port => force_im_output_port_net
    );

  force_re: entity work.reinterpret_d51df7ac30
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret_output_port_net_x8,
      output_port => force_re_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/sram_tvg"

entity sram_tvg_entity_70a20dd50c is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(31 downto 0); 
    sync: in std_logic; 
    use_tvg: in std_logic; 
    dout: out std_logic_vector(31 downto 0); 
    sync_out: out std_logic
  );
end sram_tvg_entity_70a20dd50c;

architecture structural of sram_tvg_entity_70a20dd50c is
  signal ce_1_sg_x417: std_logic;
  signal clk_1_sg_x417: std_logic;
  signal concat10_y_net: std_logic_vector(31 downto 0);
  signal constant1_op_net: std_logic_vector(7 downto 0);
  signal constant2_op_net: std_logic_vector(7 downto 0);
  signal counter1_op_net: std_logic_vector(7 downto 0);
  signal delay2_q_net_x3: std_logic;
  signal mux3_y_net_x1: std_logic_vector(31 downto 0);
  signal mux_y_net_x2: std_logic;
  signal slice2_y_net_x1: std_logic_vector(31 downto 0);
  signal slice9_y_net_x0: std_logic;

begin
  ce_1_sg_x417 <= ce_1;
  clk_1_sg_x417 <= clk_1;
  slice2_y_net_x1 <= din;
  mux_y_net_x2 <= sync;
  slice9_y_net_x0 <= use_tvg;
  dout <= mux3_y_net_x1;
  sync_out <= delay2_q_net_x3;

  concat10: entity work.concat_a1e126f11c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => constant1_op_net,
      in1 => counter1_op_net,
      in2 => constant2_op_net,
      in3 => counter1_op_net,
      y => concat10_y_net
    );

  constant1: entity work.constant_91ef1678ca
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_b437b02512
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  counter1: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_1fa1686255cc3bb6",
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x417,
      clk => clk_1_sg_x417,
      clr => '0',
      en => "1",
      rst(0) => mux_y_net_x2,
      op => counter1_op_net
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x417,
      clk => clk_1_sg_x417,
      d(0) => mux_y_net_x2,
      en => '1',
      q(0) => delay2_q_net_x3
    );

  mux3: entity work.mux_52ae77d946
    port map (
      ce => ce_1_sg_x417,
      clk => clk_1_sg_x417,
      clr => '0',
      d0 => slice2_y_net_x1,
      d1 => concat10_y_net,
      sel(0) => slice9_y_net_x0,
      y => mux3_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/sync_gen/sync_delay"

entity sync_delay_entity_5f466b3c41 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end sync_delay_entity_5f466b3c41;

architecture structural of sync_delay_entity_5f466b3c41 is
  signal ce_1_sg_x421: std_logic;
  signal clk_1_sg_x421: std_logic;
  signal constant1_op_net: std_logic_vector(27 downto 0);
  signal constant2_op_net: std_logic_vector(27 downto 0);
  signal constant3_op_net: std_logic;
  signal constant_op_net: std_logic_vector(27 downto 0);
  signal counter_op_net: std_logic_vector(27 downto 0);
  signal logical_y_net: std_logic;
  signal logical_y_net_x1: std_logic;
  signal mux_y_net_x5: std_logic;
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x421 <= ce_1;
  clk_1_sg_x421 <= clk_1;
  logical_y_net_x1 <= in_x0;
  out_x0 <= mux_y_net_x5;

  constant1: entity work.constant_98b461a391
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_3afb0a580d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant_x0: entity work.constant_c1bd3afa8c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_341763362dbc45a2",
      op_arith => xlUnsigned,
      op_width => 28
    )
    port map (
      ce => ce_1_sg_x421,
      clk => clk_1_sg_x421,
      clr => '0',
      din => constant2_op_net,
      en(0) => logical_y_net,
      load(0) => logical_y_net_x1,
      rst => "0",
      op => counter_op_net
    );

  logical: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net_x1,
      d1(0) => relational1_op_net,
      y(0) => logical_y_net
    );

  mux: entity work.mux_1bef4ba0e4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net_x1,
      d1(0) => relational_op_net,
      sel(0) => constant3_op_net,
      y(0) => mux_y_net_x5
    );

  relational: entity work.relational_1ea7543d62
    port map (
      a => constant_op_net,
      b => counter_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_8759749125
    port map (
      a => counter_op_net,
      b => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/sync_gen"

entity sync_gen_entity_b491977194 is
  port (
    arm: in std_logic; 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    rst: in std_logic; 
    armed: out std_logic; 
    mrst: out std_logic; 
    sync: out std_logic
  );
end sync_gen_entity_b491977194;

architecture structural of sync_gen_entity_b491977194 is
  signal ce_1_sg_x422: std_logic;
  signal clk_1_sg_x422: std_logic;
  signal constant10_op_net: std_logic;
  signal counter_op_net: std_logic_vector(27 downto 0);
  signal inverter_op_net_x1: std_logic;
  signal logical3_y_net_x15: std_logic;
  signal logical7_y_net_x0: std_logic;
  signal logical_y_net_x0: std_logic;
  signal logical_y_net_x1: std_logic;
  signal mux_y_net_x6: std_logic;
  signal register_q_net_x0: std_logic;
  signal slice7_y_net_x1: std_logic;
  signal slice8_y_net_x0: std_logic;

begin
  slice7_y_net_x1 <= arm;
  ce_1_sg_x422 <= ce_1;
  clk_1_sg_x422 <= clk_1;
  logical7_y_net_x0 <= rst;
  armed <= inverter_op_net_x1;
  mrst <= mux_y_net_x6;
  sync <= logical3_y_net_x15;

  constant10: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant10_op_net
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_658945f0a80d459a",
      op_arith => xlUnsigned,
      op_width => 28
    )
    port map (
      ce => ce_1_sg_x422,
      clk => clk_1_sg_x422,
      clr => '0',
      en => "1",
      rst(0) => logical_y_net_x1,
      op => counter_op_net
    );

  edge_d0604a1c12: entity work.edge_entity_d80c921afd
    port map (
      ce_1 => ce_1_sg_x422,
      clk_1 => clk_1_sg_x422,
      in_x0 => slice8_y_net_x0,
      out_x0 => logical3_y_net_x15
    );

  inverter: entity work.inverter_251f82b86b
    port map (
      ce => ce_1_sg_x422,
      clk => clk_1_sg_x422,
      clr => '0',
      ip(0) => register_q_net_x0,
      op(0) => inverter_op_net_x1
    );

  posedge1_0801dc84fa: entity work.posedge_entity_ac028bf8d0
    port map (
      ce_1 => ce_1_sg_x422,
      clk_1 => clk_1_sg_x422,
      in_x0 => register_q_net_x0,
      out_x0 => logical_y_net_x1
    );

  posedge2_346078c437: entity work.posedge_entity_ac028bf8d0
    port map (
      ce_1 => ce_1_sg_x422,
      clk_1 => clk_1_sg_x422,
      in_x0 => slice7_y_net_x1,
      out_x0 => logical_y_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x422,
      clk => clk_1_sg_x422,
      d(0) => constant10_op_net,
      en(0) => logical7_y_net_x0,
      rst(0) => logical_y_net_x0,
      q(0) => register_q_net_x0
    );

  slice8: entity work.xlslice
    generic map (
      new_lsb => 27,
      new_msb => 27,
      x_width => 28,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice8_y_net_x0
    );

  sync_delay_5f466b3c41: entity work.sync_delay_entity_5f466b3c41
    port map (
      ce_1 => ce_1_sg_x422,
      clk_1 => clk_1_sg_x422,
      in_x0 => logical_y_net_x1,
      out_x0 => mux_y_net_x6
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc/xaui_process"

entity xaui_process_entity_ec66f1ce1b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(63 downto 0); 
    lnk_dn: in std_logic; 
    valid: in std_logic; 
    addr: out std_logic_vector(31 downto 0); 
    data_out: out std_logic_vector(31 downto 0); 
    we: out std_logic
  );
end xaui_process_entity_ec66f1ce1b;

architecture structural of xaui_process_entity_ec66f1ce1b is
  signal ce_1_sg_x423: std_logic;
  signal clk_1_sg_x423: std_logic;
  signal delay2_q_net_x6: std_logic;
  signal delay3_q_net_x0: std_logic_vector(63 downto 0);
  signal delay4_q_net_x0: std_logic;
  signal delay5_q_net_x0: std_logic;
  signal inverter1_op_net: std_logic;
  signal logical2_y_net: std_logic;
  signal register3_q_net: std_logic_vector(63 downto 0);
  signal slice30_y_net_x2: std_logic_vector(31 downto 0);
  signal slice31_y_net_x6: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x423 <= ce_1;
  clk_1_sg_x423 <= clk_1;
  delay3_q_net_x0 <= data_in;
  delay5_q_net_x0 <= lnk_dn;
  delay4_q_net_x0 <= valid;
  addr <= slice31_y_net_x6;
  data_out <= slice30_y_net_x2;
  we <= delay2_q_net_x6;

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x423,
      clk => clk_1_sg_x423,
      d(0) => logical2_y_net,
      en => '1',
      q(0) => delay2_q_net_x6
    );

  inverter1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x423,
      clk => clk_1_sg_x423,
      clr => '0',
      ip(0) => delay5_q_net_x0,
      op(0) => inverter1_op_net
    );

  logical2: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay4_q_net_x0,
      d1(0) => inverter1_op_net,
      y(0) => logical2_y_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 64,
      init_value => b"0000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x423,
      clk => clk_1_sg_x423,
      d => delay3_q_net_x0,
      en(0) => logical2_y_net,
      rst => "0",
      q => register3_q_net
    );

  slice30: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 31,
      x_width => 64,
      y_width => 32
    )
    port map (
      x => register3_q_net,
      y => slice30_y_net_x2
    );

  slice31: entity work.xlslice
    generic map (
      new_lsb => 32,
      new_msb => 63,
      x_width => 64,
      y_width => 32
    )
    port map (
      x => register3_q_net,
      y => slice31_y_net_x6
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "i_128w_2k_10_r310iadc"

entity i_128w_2k_10_r310iadc is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_data_valid: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_datai0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_datai1: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_datai2: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_datai3: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_dataq0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_dataq1: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_dataq2: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_dataq3: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_outofrangei0: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_outofrangei1: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_outofrangeq0: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_outofrangeq1: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_sync0: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_sync1: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_sync2: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_sync3: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_data_valid: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_datai0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_datai1: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_datai2: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_datai3: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_dataq0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_dataq1: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_dataq2: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_dataq3: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_outofrangei0: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_outofrangei1: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_outofrangeq0: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_outofrangeq1: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_sync0: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_sync1: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_sync2: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_sync3: in std_logic; 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out: in std_logic_vector(35 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid: in std_logic; 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out: in std_logic_vector(35 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid: in std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_almost_full: in std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_data: in std_logic_vector(63 downto 0); 
    i_128w_2k_10_r310iadc_xaui0_rx_empty: in std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_linkdown: in std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_outofband: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_xaui0_rx_valid: in std_logic; 
    i_128w_2k_10_r310iadc_xaui0_tx_full: in std_logic; 
    gateway_out1: out std_logic; 
    gateway_out18: out std_logic; 
    gateway_out19: out std_logic; 
    gateway_out2: out std_logic; 
    gateway_out20: out std_logic; 
    gateway_out3: out std_logic_vector(31 downto 0); 
    gateway_out6: out std_logic_vector(1 downto 0); 
    gateway_out8: out std_logic_vector(47 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address: out std_logic_vector(18 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be: out std_logic_vector(3 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in: out std_logic_vector(35 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we: out std_logic; 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address: out std_logic_vector(18 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be: out std_logic_vector(3 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in: out std_logic_vector(35 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we: out std_logic; 
    i_128w_2k_10_r310iadc_gpio_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led1_arm_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led2_sync_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led4_eq_clip_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led5_adc_clip_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led6_link_dn_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_get: out std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_reset: out std_logic; 
    i_128w_2k_10_r310iadc_xaui0_tx_data: out std_logic_vector(63 downto 0); 
    i_128w_2k_10_r310iadc_xaui0_tx_outofband: out std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_xaui0_tx_valid: out std_logic
  );
end i_128w_2k_10_r310iadc;

architecture structural of i_128w_2k_10_r310iadc is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "i_128w_2k_10_r310iadc,sysgen_core_10_1_3_1386,{total_blocks=8010,modelsim_hdl_co_simulation_interface_block=2,xilinx_accumulator_block=8,xilinx_adder_subtractor_block=210,xilinx_arithmetic_relational_operator_block=119,xilinx_binary_shift_operator_block=8,xilinx_bit_slice_extractor_block=787,xilinx_black_box_block=2,xilinx_bus_concatenator_block=157,xilinx_bus_multiplexer_block=209,xilinx_constant_block_block=345,xilinx_counter_block=159,xilinx_delay_block=313,xilinx_disregard_subsystem_for_generation_block=2,xilinx_dual_port_random_access_memory_block=4,xilinx_gateway_in_block=45,xilinx_gateway_out_block=51,xilinx_input_scaler_block=96,xilinx_inverter_block=418,xilinx_logical_block_block=404,xilinx_multiplier_block=110,xilinx_negate_block_block=2,xilinx_register_block=38,xilinx_simulation_multiplexer_block=4,xilinx_single_port_random_access_memory_block=50,xilinx_single_port_read_only_memory_block=59,xilinx_system_generator_block=1,xilinx_type_converter_block=244,xilinx_type_reinterpreter_block=468,}";

  signal bram0_data_out_net_x2: std_logic_vector(31 downto 0);
  signal ce_1_sg_x424: std_logic;
  signal clk_1_sg_x424: std_logic;
  signal concat2_y_net_x1: std_logic_vector(7 downto 0);
  signal concat3_y_net_x1: std_logic_vector(31 downto 0);
  signal concat_y_net_x10: std_logic_vector(35 downto 0);
  signal concat_y_net_x11: std_logic_vector(35 downto 0);
  signal concat_y_net_x12: std_logic_vector(35 downto 0);
  signal concat_y_net_x13: std_logic_vector(35 downto 0);
  signal concat_y_net_x14: std_logic_vector(35 downto 0);
  signal concat_y_net_x15: std_logic_vector(35 downto 0);
  signal concat_y_net_x16: std_logic_vector(35 downto 0);
  signal concat_y_net_x17: std_logic_vector(15 downto 0);
  signal concat_y_net_x18: std_logic_vector(15 downto 0);
  signal concat_y_net_x19: std_logic_vector(15 downto 0);
  signal concat_y_net_x2: std_logic_vector(7 downto 0);
  signal concat_y_net_x20: std_logic_vector(15 downto 0);
  signal concat_y_net_x3: std_logic_vector(7 downto 0);
  signal concat_y_net_x4: std_logic_vector(7 downto 0);
  signal concat_y_net_x5: std_logic_vector(7 downto 0);
  signal concat_y_net_x9: std_logic_vector(35 downto 0);
  signal constant4_op_net_x0: std_logic;
  signal constant5_op_net_x0: std_logic;
  signal counter1_op_net: std_logic_vector(26 downto 0);
  signal counter_op_net: std_logic_vector(15 downto 0);
  signal delay1_q_net: std_logic_vector(31 downto 0);
  signal delay1_q_net_x8: std_logic;
  signal delay2_q_net_x1: std_logic_vector(31 downto 0);
  signal delay2_q_net_x3: std_logic;
  signal delay2_q_net_x6: std_logic;
  signal delay3_q_net_x0: std_logic_vector(63 downto 0);
  signal delay4_q_net_x0: std_logic;
  signal delay4_q_net_x3: std_logic;
  signal delay5_q_net_x0: std_logic;
  signal delay6_q_net_x0: std_logic;
  signal delay7_q_net_x0: std_logic;
  signal delay8_q_net_x5: std_logic;
  signal edge_op_y_net_x8: std_logic;
  signal force_im_output_port_net_x4: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x5: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x6: std_logic_vector(17 downto 0);
  signal force_im_output_port_net_x7: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x4: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x5: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x6: std_logic_vector(17 downto 0);
  signal force_re_output_port_net_x7: std_logic_vector(17 downto 0);
  signal gateway_out18_net: std_logic;
  signal gateway_out19_net: std_logic;
  signal gateway_out1_net: std_logic;
  signal gateway_out20_net: std_logic;
  signal gateway_out2_net: std_logic;
  signal gateway_out3_net: std_logic_vector(31 downto 0);
  signal gateway_out6_net: std_logic_vector(1 downto 0);
  signal gateway_out8_net: std_logic_vector(47 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_data_valid_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_datai0_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_datai1_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_datai2_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_datai3_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_dataq0_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_dataq1_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_dataq2_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_dataq3_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_outofrangei0_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_outofrangei1_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_outofrangeq0_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_outofrangeq1_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_sync0_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_sync1_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_sync2_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_sync3_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_data_valid_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_datai0_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_datai1_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_datai2_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_datai3_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_dataq0_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_dataq1_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_dataq2_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_dataq3_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_outofrangei0_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_outofrangei1_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_outofrangeq0_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_outofrangeq1_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_sync0_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_sync1_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_sync2_net: std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_sync3_net: std_logic;
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address_net: std_logic_vector(18 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be_net: std_logic_vector(3 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in_net: std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out_net: std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid_net: std_logic;
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we_net: std_logic;
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address_net: std_logic_vector(18 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be_net: std_logic_vector(3 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in_net: std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out_net: std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid_net: std_logic;
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we_net: std_logic;
  signal i_128w_2k_10_r310iadc_gpio_gateway_net: std_logic;
  signal i_128w_2k_10_r310iadc_led1_arm_gateway_net: std_logic;
  signal i_128w_2k_10_r310iadc_led2_sync_gateway_net: std_logic;
  signal i_128w_2k_10_r310iadc_led4_eq_clip_gateway_net: std_logic;
  signal i_128w_2k_10_r310iadc_led5_adc_clip_gateway_net: std_logic;
  signal i_128w_2k_10_r310iadc_led6_link_dn_gateway_net: std_logic;
  signal i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway_net: std_logic;
  signal i_128w_2k_10_r310iadc_xaui0_rx_almost_full_net: std_logic;
  signal i_128w_2k_10_r310iadc_xaui0_rx_data_net: std_logic_vector(63 downto 0);
  signal i_128w_2k_10_r310iadc_xaui0_rx_empty_net: std_logic;
  signal i_128w_2k_10_r310iadc_xaui0_rx_get_net: std_logic;
  signal i_128w_2k_10_r310iadc_xaui0_rx_linkdown_net: std_logic;
  signal i_128w_2k_10_r310iadc_xaui0_rx_outofband_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_xaui0_rx_reset_net: std_logic;
  signal i_128w_2k_10_r310iadc_xaui0_rx_valid_net: std_logic;
  signal i_128w_2k_10_r310iadc_xaui0_tx_data_net: std_logic_vector(63 downto 0);
  signal i_128w_2k_10_r310iadc_xaui0_tx_full_net: std_logic;
  signal i_128w_2k_10_r310iadc_xaui0_tx_outofband_net: std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_xaui0_tx_valid_net: std_logic;
  signal inverter_op_net_x1: std_logic;
  signal logical1_y_net_x1: std_logic;
  signal logical1_y_net_x2: std_logic;
  signal logical1_y_net_x3: std_logic;
  signal logical1_y_net_x4: std_logic;
  signal logical1_y_net_x5: std_logic;
  signal logical1_y_net_x6: std_logic;
  signal logical3_y_net_x15: std_logic;
  signal logical5_y_net_x1: std_logic;
  signal logical6_y_net: std_logic;
  signal logical7_y_net_x0: std_logic;
  signal logical8_y_net: std_logic;
  signal logical_y_net_x1: std_logic;
  signal logical_y_net_x2: std_logic;
  signal logical_y_net_x3: std_logic;
  signal logical_y_net_x4: std_logic;
  signal mux1_y_net_x1: std_logic_vector(63 downto 0);
  signal mux1_y_net_x5: std_logic_vector(31 downto 0);
  signal mux3_y_net_x1: std_logic_vector(31 downto 0);
  signal mux_y_net_x2: std_logic;
  signal mux_y_net_x5: std_logic_vector(63 downto 0);
  signal post_sync_delay_q_net_x2: std_logic;
  signal register1_q_net_x1: std_logic_vector(17 downto 0);
  signal register1_q_net_x2: std_logic_vector(17 downto 0);
  signal register1_q_net_x3: std_logic_vector(17 downto 0);
  signal register1_q_net_x4: std_logic_vector(17 downto 0);
  signal register2_q_net_x1: std_logic_vector(5 downto 0);
  signal register2_q_net_x2: std_logic_vector(5 downto 0);
  signal register2_q_net_x3: std_logic_vector(5 downto 0);
  signal register2_q_net_x4: std_logic_vector(5 downto 0);
  signal register_q_net_x0: std_logic_vector(31 downto 0);
  signal register_q_net_x1: std_logic_vector(31 downto 0);
  signal register_q_net_x2: std_logic_vector(31 downto 0);
  signal register_q_net_x3: std_logic_vector(31 downto 0);
  signal register_q_net_x4: std_logic_vector(31 downto 0);
  signal register_q_net_x5: std_logic_vector(31 downto 0);
  signal register_q_net_x6: std_logic_vector(31 downto 0);
  signal register_q_net_x7: std_logic_vector(31 downto 0);
  signal register_q_net_x8: std_logic_vector(31 downto 0);
  signal register_q_net_x9: std_logic_vector(31 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret2_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret3_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret4_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret5_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret6_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret7_output_port_net_x0: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(31 downto 0);
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
  signal relational_op_net_x0: std_logic;
  signal relational_op_net_x1: std_logic;
  signal relational_op_net_x2: std_logic;
  signal relational_op_net_x3: std_logic;
  signal relational_op_net_x4: std_logic;
  signal relational_op_net_x5: std_logic;
  signal relational_op_net_x6: std_logic;
  signal relational_op_net_x7: std_logic;
  signal slice16_y_net_x0: std_logic;
  signal slice1_y_net_x0: std_logic_vector(17 downto 0);
  signal slice21_y_net_x25: std_logic_vector(15 downto 0);
  signal slice22_y_net_x1: std_logic_vector(17 downto 0);
  signal slice2_y_net_x0: std_logic_vector(17 downto 0);
  signal slice2_y_net_x1: std_logic_vector(31 downto 0);
  signal slice30_y_net_x2: std_logic_vector(31 downto 0);
  signal slice31_y_net_x6: std_logic_vector(31 downto 0);
  signal slice3_y_net_x0: std_logic_vector(17 downto 0);
  signal slice6_y_net: std_logic;
  signal slice7_y_net_x1: std_logic;
  signal slice8_y_net_x0: std_logic_vector(1 downto 0);
  signal slice9_y_net_x0: std_logic;
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x424 <= ce_1;
  clk_1_sg_x424 <= clk_1;
  i_128w_2k_10_r310iadc_adc0_user_data_valid_net <= i_128w_2k_10_r310iadc_adc0_user_data_valid;
  i_128w_2k_10_r310iadc_adc0_user_datai0_net <= i_128w_2k_10_r310iadc_adc0_user_datai0;
  i_128w_2k_10_r310iadc_adc0_user_datai1_net <= i_128w_2k_10_r310iadc_adc0_user_datai1;
  i_128w_2k_10_r310iadc_adc0_user_datai2_net <= i_128w_2k_10_r310iadc_adc0_user_datai2;
  i_128w_2k_10_r310iadc_adc0_user_datai3_net <= i_128w_2k_10_r310iadc_adc0_user_datai3;
  i_128w_2k_10_r310iadc_adc0_user_dataq0_net <= i_128w_2k_10_r310iadc_adc0_user_dataq0;
  i_128w_2k_10_r310iadc_adc0_user_dataq1_net <= i_128w_2k_10_r310iadc_adc0_user_dataq1;
  i_128w_2k_10_r310iadc_adc0_user_dataq2_net <= i_128w_2k_10_r310iadc_adc0_user_dataq2;
  i_128w_2k_10_r310iadc_adc0_user_dataq3_net <= i_128w_2k_10_r310iadc_adc0_user_dataq3;
  i_128w_2k_10_r310iadc_adc0_user_outofrangei0_net <= i_128w_2k_10_r310iadc_adc0_user_outofrangei0;
  i_128w_2k_10_r310iadc_adc0_user_outofrangei1_net <= i_128w_2k_10_r310iadc_adc0_user_outofrangei1;
  i_128w_2k_10_r310iadc_adc0_user_outofrangeq0_net <= i_128w_2k_10_r310iadc_adc0_user_outofrangeq0;
  i_128w_2k_10_r310iadc_adc0_user_outofrangeq1_net <= i_128w_2k_10_r310iadc_adc0_user_outofrangeq1;
  i_128w_2k_10_r310iadc_adc0_user_sync0_net <= i_128w_2k_10_r310iadc_adc0_user_sync0;
  i_128w_2k_10_r310iadc_adc0_user_sync1_net <= i_128w_2k_10_r310iadc_adc0_user_sync1;
  i_128w_2k_10_r310iadc_adc0_user_sync2_net <= i_128w_2k_10_r310iadc_adc0_user_sync2;
  i_128w_2k_10_r310iadc_adc0_user_sync3_net <= i_128w_2k_10_r310iadc_adc0_user_sync3;
  i_128w_2k_10_r310iadc_adc1_user_data_valid_net <= i_128w_2k_10_r310iadc_adc1_user_data_valid;
  i_128w_2k_10_r310iadc_adc1_user_datai0_net <= i_128w_2k_10_r310iadc_adc1_user_datai0;
  i_128w_2k_10_r310iadc_adc1_user_datai1_net <= i_128w_2k_10_r310iadc_adc1_user_datai1;
  i_128w_2k_10_r310iadc_adc1_user_datai2_net <= i_128w_2k_10_r310iadc_adc1_user_datai2;
  i_128w_2k_10_r310iadc_adc1_user_datai3_net <= i_128w_2k_10_r310iadc_adc1_user_datai3;
  i_128w_2k_10_r310iadc_adc1_user_dataq0_net <= i_128w_2k_10_r310iadc_adc1_user_dataq0;
  i_128w_2k_10_r310iadc_adc1_user_dataq1_net <= i_128w_2k_10_r310iadc_adc1_user_dataq1;
  i_128w_2k_10_r310iadc_adc1_user_dataq2_net <= i_128w_2k_10_r310iadc_adc1_user_dataq2;
  i_128w_2k_10_r310iadc_adc1_user_dataq3_net <= i_128w_2k_10_r310iadc_adc1_user_dataq3;
  i_128w_2k_10_r310iadc_adc1_user_outofrangei0_net <= i_128w_2k_10_r310iadc_adc1_user_outofrangei0;
  i_128w_2k_10_r310iadc_adc1_user_outofrangei1_net <= i_128w_2k_10_r310iadc_adc1_user_outofrangei1;
  i_128w_2k_10_r310iadc_adc1_user_outofrangeq0_net <= i_128w_2k_10_r310iadc_adc1_user_outofrangeq0;
  i_128w_2k_10_r310iadc_adc1_user_outofrangeq1_net <= i_128w_2k_10_r310iadc_adc1_user_outofrangeq1;
  i_128w_2k_10_r310iadc_adc1_user_sync0_net <= i_128w_2k_10_r310iadc_adc1_user_sync0;
  i_128w_2k_10_r310iadc_adc1_user_sync1_net <= i_128w_2k_10_r310iadc_adc1_user_sync1;
  i_128w_2k_10_r310iadc_adc1_user_sync2_net <= i_128w_2k_10_r310iadc_adc1_user_sync2;
  i_128w_2k_10_r310iadc_adc1_user_sync3_net <= i_128w_2k_10_r310iadc_adc1_user_sync3;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out_net <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid_net <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out_net <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid_net <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid;
  i_128w_2k_10_r310iadc_xaui0_rx_almost_full_net <= i_128w_2k_10_r310iadc_xaui0_rx_almost_full;
  i_128w_2k_10_r310iadc_xaui0_rx_data_net <= i_128w_2k_10_r310iadc_xaui0_rx_data;
  i_128w_2k_10_r310iadc_xaui0_rx_empty_net <= i_128w_2k_10_r310iadc_xaui0_rx_empty;
  i_128w_2k_10_r310iadc_xaui0_rx_linkdown_net <= i_128w_2k_10_r310iadc_xaui0_rx_linkdown;
  i_128w_2k_10_r310iadc_xaui0_rx_outofband_net <= i_128w_2k_10_r310iadc_xaui0_rx_outofband;
  i_128w_2k_10_r310iadc_xaui0_rx_valid_net <= i_128w_2k_10_r310iadc_xaui0_rx_valid;
  i_128w_2k_10_r310iadc_xaui0_tx_full_net <= i_128w_2k_10_r310iadc_xaui0_tx_full;
  gateway_out1 <= gateway_out1_net;
  gateway_out18 <= gateway_out18_net;
  gateway_out19 <= gateway_out19_net;
  gateway_out2 <= gateway_out2_net;
  gateway_out20 <= gateway_out20_net;
  gateway_out3 <= gateway_out3_net;
  gateway_out6 <= gateway_out6_net;
  gateway_out8 <= gateway_out8_net;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address_net;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be_net;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in_net;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we_net;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address_net;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be_net;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in_net;
  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we <= i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we_net;
  i_128w_2k_10_r310iadc_gpio_gateway <= i_128w_2k_10_r310iadc_gpio_gateway_net;
  i_128w_2k_10_r310iadc_led1_arm_gateway <= i_128w_2k_10_r310iadc_led1_arm_gateway_net;
  i_128w_2k_10_r310iadc_led2_sync_gateway <= i_128w_2k_10_r310iadc_led2_sync_gateway_net;
  i_128w_2k_10_r310iadc_led4_eq_clip_gateway <= i_128w_2k_10_r310iadc_led4_eq_clip_gateway_net;
  i_128w_2k_10_r310iadc_led5_adc_clip_gateway <= i_128w_2k_10_r310iadc_led5_adc_clip_gateway_net;
  i_128w_2k_10_r310iadc_led6_link_dn_gateway <= i_128w_2k_10_r310iadc_led6_link_dn_gateway_net;
  i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway <= i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway_net;
  i_128w_2k_10_r310iadc_xaui0_rx_get <= i_128w_2k_10_r310iadc_xaui0_rx_get_net;
  i_128w_2k_10_r310iadc_xaui0_rx_reset <= i_128w_2k_10_r310iadc_xaui0_rx_reset_net;
  i_128w_2k_10_r310iadc_xaui0_tx_data <= i_128w_2k_10_r310iadc_xaui0_tx_data_net;
  i_128w_2k_10_r310iadc_xaui0_tx_outofband <= i_128w_2k_10_r310iadc_xaui0_tx_outofband_net;
  i_128w_2k_10_r310iadc_xaui0_tx_valid <= i_128w_2k_10_r310iadc_xaui0_tx_valid_net;

  adc0_6b78fa1b53: entity work.adc0_entity_6b78fa1b53
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      i_128w_2k_10_r310iadc_adc0_user_datai0 => i_128w_2k_10_r310iadc_adc0_user_datai0_net,
      i_128w_2k_10_r310iadc_adc0_user_datai2 => i_128w_2k_10_r310iadc_adc0_user_datai2_net,
      i_128w_2k_10_r310iadc_adc0_user_dataq0 => i_128w_2k_10_r310iadc_adc0_user_dataq0_net,
      i_128w_2k_10_r310iadc_adc0_user_dataq2 => i_128w_2k_10_r310iadc_adc0_user_dataq2_net,
      i0 => reinterpret_output_port_net_x8,
      i2 => reinterpret_output_port_net_x9,
      q0 => reinterpret_output_port_net_x10,
      q2 => reinterpret_output_port_net_x11
    );

  adc1_a86e20684c: entity work.adc1_entity_a86e20684c
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      i_128w_2k_10_r310iadc_adc1_user_datai0 => i_128w_2k_10_r310iadc_adc1_user_datai0_net,
      i_128w_2k_10_r310iadc_adc1_user_datai2 => i_128w_2k_10_r310iadc_adc1_user_datai2_net,
      i_128w_2k_10_r310iadc_adc1_user_dataq0 => i_128w_2k_10_r310iadc_adc1_user_dataq0_net,
      i_128w_2k_10_r310iadc_adc1_user_dataq2 => i_128w_2k_10_r310iadc_adc1_user_dataq2_net,
      i0 => reinterpret_output_port_net_x12,
      i2 => reinterpret_output_port_net_x13,
      q0 => reinterpret_output_port_net_x14,
      q2 => reinterpret_output_port_net_x15
    );

  adc_clip_detect0_6dd73d58f8: entity work.adc_clip_detect0_entity_6dd73d58f8
    port map (
      adc_in => reinterpret_output_port_net_x8,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      clip => relational_op_net_x0
    );

  adc_clip_detect1_67442d8b28: entity work.adc_clip_detect0_entity_6dd73d58f8
    port map (
      adc_in => reinterpret_output_port_net_x9,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      clip => relational_op_net_x1
    );

  adc_clip_detect2_4d6e5b0312: entity work.adc_clip_detect0_entity_6dd73d58f8
    port map (
      adc_in => reinterpret_output_port_net_x10,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      clip => relational_op_net_x2
    );

  adc_clip_detect3_0c7ed29fb4: entity work.adc_clip_detect0_entity_6dd73d58f8
    port map (
      adc_in => reinterpret_output_port_net_x11,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      clip => relational_op_net_x3
    );

  adc_clip_detect4_c17f52b864: entity work.adc_clip_detect0_entity_6dd73d58f8
    port map (
      adc_in => reinterpret_output_port_net_x12,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      clip => relational_op_net_x4
    );

  adc_clip_detect5_bc132b7b61: entity work.adc_clip_detect0_entity_6dd73d58f8
    port map (
      adc_in => reinterpret_output_port_net_x13,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      clip => relational_op_net_x5
    );

  adc_clip_detect6_0ea457d308: entity work.adc_clip_detect0_entity_6dd73d58f8
    port map (
      adc_in => reinterpret_output_port_net_x14,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      clip => relational_op_net_x6
    );

  adc_clip_detect7_c98e586b74: entity work.adc_clip_detect0_entity_6dd73d58f8
    port map (
      adc_in => reinterpret_output_port_net_x15,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      clip => relational_op_net_x7
    );

  ant_base_offset_ctrl_10120a026d: entity work.ant_base_offset_ctrl_entity_10120a026d
    port map (
      addr_in => slice31_y_net_x6,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      data_in => slice30_y_net_x2,
      valid_in => delay2_q_net_x6,
      data_out => register_q_net_x1
    );

  c_to_ri1_feffc004f4: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x14,
      im => force_im_output_port_net_x5,
      re => force_re_output_port_net_x5
    );

  c_to_ri2_4421df4274: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x15,
      im => force_im_output_port_net_x6,
      re => force_re_output_port_net_x6
    );

  c_to_ri3_c6898aea97: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x16,
      im => force_im_output_port_net_x7,
      re => force_re_output_port_net_x7
    );

  c_to_ri_2485354a01: entity work.c_to_ri_entity_2485354a01
    port map (
      c => concat_y_net_x13,
      im => force_im_output_port_net_x4,
      re => force_re_output_port_net_x4
    );

  calc_adc_sum_sq0_5605c0c0f9: entity work.calc_adc_sum_sq0_entity_5605c0c0f9
    port map (
      accum_rst => edge_op_y_net_x8,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol_in => reinterpret_output_port_net_x8,
      sum_sq => register_q_net_x2
    );

  calc_adc_sum_sq1_dd0e13ff75: entity work.calc_adc_sum_sq0_entity_5605c0c0f9
    port map (
      accum_rst => edge_op_y_net_x8,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol_in => reinterpret_output_port_net_x9,
      sum_sq => register_q_net_x3
    );

  calc_adc_sum_sq2_a92819b53f: entity work.calc_adc_sum_sq0_entity_5605c0c0f9
    port map (
      accum_rst => edge_op_y_net_x8,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol_in => reinterpret_output_port_net_x10,
      sum_sq => register_q_net_x4
    );

  calc_adc_sum_sq3_b703a47242: entity work.calc_adc_sum_sq0_entity_5605c0c0f9
    port map (
      accum_rst => edge_op_y_net_x8,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol_in => reinterpret_output_port_net_x11,
      sum_sq => register_q_net_x5
    );

  calc_adc_sum_sq4_b42099cddf: entity work.calc_adc_sum_sq0_entity_5605c0c0f9
    port map (
      accum_rst => edge_op_y_net_x8,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol_in => reinterpret_output_port_net_x12,
      sum_sq => register_q_net_x6
    );

  calc_adc_sum_sq5_4c6332c5f1: entity work.calc_adc_sum_sq0_entity_5605c0c0f9
    port map (
      accum_rst => edge_op_y_net_x8,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol_in => reinterpret_output_port_net_x13,
      sum_sq => register_q_net_x7
    );

  calc_adc_sum_sq6_350cc2d0f7: entity work.calc_adc_sum_sq0_entity_5605c0c0f9
    port map (
      accum_rst => edge_op_y_net_x8,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol_in => reinterpret_output_port_net_x14,
      sum_sq => register_q_net_x8
    );

  calc_adc_sum_sq7_cd936a7303: entity work.calc_adc_sum_sq0_entity_5605c0c0f9
    port map (
      accum_rst => edge_op_y_net_x8,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol_in => reinterpret_output_port_net_x15,
      sum_sq => register_q_net_x9
    );

  concat3: entity work.concat_a1e126f11c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => concat_y_net_x2,
      in1 => concat_y_net_x3,
      in2 => concat_y_net_x4,
      in3 => concat_y_net_x5,
      y => concat3_y_net_x1
    );

  constant4: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant4_op_net_x0
    );

  constant5: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant5_op_net_x0
    );

  counter: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_da21d47bce83ad78",
      op_arith => xlUnsigned,
      op_width => 16
    )
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  counter1: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex2p_7_0_7a138cef7a7cb135",
      op_arith => xlUnsigned,
      op_width => 27
    )
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter1_op_net
    );

  dbuf_ct_sram_fft_2x_1e967dd41a: entity work.dbuf_ct_sram_fft_2x_entity_1e967dd41a
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      din => mux1_y_net_x5,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out_net,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out_net,
      sync_in => delay4_q_net_x3,
      out_x0 => slice2_y_net_x1,
      sram => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in_net,
      sram1 => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in_net,
      sram1_x0 => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address_net,
      sram1_x1 => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be_net,
      sram1_x2 => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we_net,
      sram_x0 => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address_net,
      sram_x1 => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be_net,
      sram_x2 => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we_net,
      sync_out => mux_y_net_x2
    );

  delay1: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d => register_q_net_x0,
      q => delay1_q_net
    );

  delay2: entity work.delay_672d2b8d1e
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d => register_q_net_x1,
      q => delay2_q_net_x1
    );

  delay3: entity work.delay_e2d047c154
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d => i_128w_2k_10_r310iadc_xaui0_rx_data_net,
      q => delay3_q_net_x0
    );

  delay4: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d(0) => i_128w_2k_10_r310iadc_xaui0_rx_valid_net,
      q(0) => delay4_q_net_x0
    );

  delay5: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d(0) => relational5_op_net_x0,
      q(0) => delay5_q_net_x0
    );

  delay6: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d(0) => relational5_op_net_x0,
      q(0) => delay6_q_net_x0
    );

  delay7: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d(0) => relational5_op_net_x1,
      q(0) => delay7_q_net_x0
    );

  edge_detect_8e9c1e46e6: entity work.edge_detect_entity_8e9c1e46e6
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      in_x0 => slice16_y_net_x0,
      out_x0 => edge_op_y_net_x8
    );

  eq0_91bbc3edb5: entity work.eq0_entity_91bbc3edb5
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      coeff => register1_q_net_x1,
      coeff_addr => register2_q_net_x1,
      coeff_we => logical_y_net_x1,
      in_x0 => concat_y_net_x9,
      sync => delay8_q_net_x5,
      clip => logical1_y_net_x2,
      dout => concat_y_net_x2,
      sync_out => delay4_q_net_x3
    );

  eq1_9996d1cf51: entity work.eq1_entity_9996d1cf51
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      coeff => register1_q_net_x2,
      coeff_addr => register2_q_net_x2,
      coeff_we => logical_y_net_x2,
      in_x0 => concat_y_net_x10,
      sync => delay8_q_net_x5,
      clip => logical1_y_net_x3,
      dout => concat_y_net_x3
    );

  eq2_259d73dbcc: entity work.eq1_entity_9996d1cf51
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      coeff => register1_q_net_x3,
      coeff_addr => register2_q_net_x3,
      coeff_we => logical_y_net_x3,
      in_x0 => concat_y_net_x11,
      sync => delay8_q_net_x5,
      clip => logical1_y_net_x4,
      dout => concat_y_net_x4
    );

  eq3_b46f566842: entity work.eq1_entity_9996d1cf51
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      coeff => register1_q_net_x4,
      coeff_addr => register2_q_net_x4,
      coeff_we => logical_y_net_x4,
      in_x0 => concat_y_net_x12,
      sync => delay8_q_net_x5,
      clip => logical1_y_net_x5,
      dout => concat_y_net_x5
    );

  eq_coeff0_ffee26f807: entity work.eq_coeff0_entity_ffee26f807
    port map (
      addr_in => slice31_y_net_x6,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      data_in => slice22_y_net_x1,
      valid_in => delay2_q_net_x6,
      addr_out => register2_q_net_x1,
      data_out => register1_q_net_x1,
      valid_out => logical_y_net_x1
    );

  eq_coeff1_3a84f6aa4b: entity work.eq_coeff1_entity_3a84f6aa4b
    port map (
      addr_in => slice31_y_net_x6,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      data_in => slice1_y_net_x0,
      valid_in => delay2_q_net_x6,
      addr_out => register2_q_net_x2,
      data_out => register1_q_net_x2,
      valid_out => logical_y_net_x2
    );

  eq_coeff2_6d9d4ed2cd: entity work.eq_coeff2_entity_6d9d4ed2cd
    port map (
      addr_in => slice31_y_net_x6,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      data_in => slice2_y_net_x0,
      valid_in => delay2_q_net_x6,
      addr_out => register2_q_net_x3,
      data_out => register1_q_net_x3,
      valid_out => logical_y_net_x3
    );

  eq_coeff3_34fd4ccc34: entity work.eq_coeff3_entity_34fd4ccc34
    port map (
      addr_in => slice31_y_net_x6,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      data_in => slice3_y_net_x0,
      valid_in => delay2_q_net_x6,
      addr_out => register2_q_net_x4,
      data_out => register1_q_net_x4,
      valid_out => logical_y_net_x4
    );

  feng_ctl_6a48d5210c: entity work.feng_ctl_entity_6a48d5210c
    port map (
      addr_in => slice31_y_net_x6,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      data_in => slice30_y_net_x2,
      valid_in => delay2_q_net_x6,
      data_out => register_q_net_x0
    );

  fft0_e330b148e2: entity work.fft0_entity_e330b148e2
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol0 => force_re_output_port_net_x4,
      pol1 => force_re_output_port_net_x5,
      pol2 => force_im_output_port_net_x4,
      pol3 => force_im_output_port_net_x5,
      shift => slice21_y_net_x25,
      sync => delay1_q_net_x8,
      pol02_out => concat_y_net_x9,
      pol13_out => concat_y_net_x10,
      sync_out => delay8_q_net_x5
    );

  fft1_ffa116fe36: entity work.fft1_entity_ffa116fe36
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol0 => force_re_output_port_net_x6,
      pol1 => force_re_output_port_net_x7,
      pol2 => force_im_output_port_net_x6,
      pol3 => force_im_output_port_net_x7,
      shift => slice21_y_net_x25,
      sync => delay1_q_net_x8,
      pol02_out => concat_y_net_x11,
      pol13_out => concat_y_net_x12
    );

  fft2x_tvg_e93378a1e1: entity work.fft2x_tvg_entity_e93378a1e1
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      din => concat3_y_net_x1,
      sync => delay4_q_net_x3,
      use_tvg => slice8_y_net_x0,
      dout => mux1_y_net_x5
    );

  gpio_3e8445cfff: entity work.gpio_entity_3e8445cfff
    port map (
      gpio_out => slice_y_net_x0,
      convert_x0 => i_128w_2k_10_r310iadc_gpio_gateway_net
    );

  led1_arm_e5c8104b6a: entity work.gpio_entity_3e8445cfff
    port map (
      gpio_out => inverter_op_net_x1,
      convert_x0 => i_128w_2k_10_r310iadc_led1_arm_gateway_net
    );

  led2_sync_fc3e208f4f: entity work.gpio_entity_3e8445cfff
    port map (
      gpio_out => relational5_op_net_x2,
      convert_x0 => i_128w_2k_10_r310iadc_led2_sync_gateway_net
    );

  led4_eq_clip_f86338e453: entity work.gpio_entity_3e8445cfff
    port map (
      gpio_out => relational5_op_net_x4,
      convert_x0 => i_128w_2k_10_r310iadc_led4_eq_clip_gateway_net
    );

  led5_adc_clip_5be0e67365: entity work.gpio_entity_3e8445cfff
    port map (
      gpio_out => relational5_op_net_x3,
      convert_x0 => i_128w_2k_10_r310iadc_led5_adc_clip_gateway_net
    );

  led6_link_dn_1683a0dcc3: entity work.led6_link_dn_entity_1683a0dcc3
    port map (
      gpio_out => delay6_q_net_x0,
      convert_x0 => i_128w_2k_10_r310iadc_led6_link_dn_gateway_net
    );

  led7_xaui_overlfow_f35d4647e3: entity work.led6_link_dn_entity_1683a0dcc3
    port map (
      gpio_out => delay7_q_net_x0,
      convert_x0 => i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway_net
    );

  logical1: entity work.logical_19a8cd80c8
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d0(0) => relational_op_net_x0,
      d1(0) => relational_op_net_x1,
      d2(0) => relational_op_net_x2,
      d3(0) => relational_op_net_x3,
      d4(0) => relational_op_net_x4,
      d5(0) => relational_op_net_x5,
      d6(0) => relational_op_net_x6,
      d7(0) => relational_op_net_x7,
      y(0) => logical1_y_net_x1
    );

  logical5: entity work.logical_a6d07705dd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical1_y_net_x2,
      d1(0) => logical1_y_net_x3,
      d2(0) => logical1_y_net_x4,
      d3(0) => logical1_y_net_x5,
      y(0) => logical5_y_net_x1
    );

  logical6: entity work.logical_1cef476837
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d0(0) => i_128w_2k_10_r310iadc_adc0_user_sync0_net,
      d1(0) => i_128w_2k_10_r310iadc_adc0_user_sync1_net,
      d2(0) => i_128w_2k_10_r310iadc_adc0_user_sync2_net,
      d3(0) => i_128w_2k_10_r310iadc_adc0_user_sync3_net,
      y(0) => logical6_y_net
    );

  logical7: entity work.logical_5773759131
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d0(0) => logical6_y_net,
      d1(0) => slice6_y_net,
      d2(0) => logical8_y_net,
      y(0) => logical7_y_net_x0
    );

  logical8: entity work.logical_1cef476837
    port map (
      ce => ce_1_sg_x424,
      clk => clk_1_sg_x424,
      clr => '0',
      d0(0) => i_128w_2k_10_r310iadc_adc1_user_sync0_net,
      d1(0) => i_128w_2k_10_r310iadc_adc1_user_sync1_net,
      d2(0) => i_128w_2k_10_r310iadc_adc1_user_sync2_net,
      d3(0) => i_128w_2k_10_r310iadc_adc1_user_sync3_net,
      y(0) => logical8_y_net
    );

  mux_adc_levels_8fe3304055: entity work.mux_adc_levels_entity_8fe3304055
    port map (
      adc_power0 => reinterpret_output_port_net_x0,
      adc_power1 => reinterpret1_output_port_net_x0,
      adc_power2 => reinterpret2_output_port_net_x0,
      adc_power3 => reinterpret3_output_port_net_x0,
      adc_power4 => reinterpret4_output_port_net_x0,
      adc_power5 => reinterpret5_output_port_net_x0,
      adc_power6 => reinterpret6_output_port_net_x0,
      adc_power7 => reinterpret7_output_port_net_x0,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      data_in => mux_y_net_x5,
      eof => gateway_out1_net,
      header => gateway_out2_net,
      mrst => gateway_out19_net,
      sync => gateway_out20_net,
      valid_in => gateway_out18_net,
      data_out => mux1_y_net_x1,
      oob => concat2_y_net_x1,
      valid_out => logical1_y_net_x6
    );

  neg_edge_ext0_dccdbdd8c2: entity work.neg_edge_ext0_entity_dccdbdd8c2
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      in_x0 => i_128w_2k_10_r310iadc_xaui0_rx_linkdown_net,
      out_x0 => relational5_op_net_x0
    );

  neg_edge_ext1_4827f7f517: entity work.neg_edge_ext1_entity_4827f7f517
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      in_x0 => i_128w_2k_10_r310iadc_xaui0_tx_full_net,
      out_x0 => relational5_op_net_x1
    );

  one_ant_a_time_03d66a07c9: entity work.one_ant_a_time_entity_03d66a07c9
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      din => mux3_y_net_x1,
      sync => delay2_q_net_x3,
      dout => bram0_data_out_net_x2,
      sync_out => post_sync_delay_q_net_x2
    );

  packetiser1_e02a16843a: entity work.packetiser1_entity_e02a16843a
    port map (
      ant_base => delay2_q_net_x1,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      data_in => bram0_data_out_net_x2,
      mrst_in => gateway_out19_net,
      sync_in => post_sync_delay_q_net_x2,
      ant => gateway_out6_net,
      data_out => mux_y_net_x5,
      eof => gateway_out1_net,
      header_out => gateway_out2_net,
      mcnt => gateway_out8_net,
      slice1_x0 => gateway_out3_net,
      sync_out => gateway_out20_net,
      valid_out => gateway_out18_net
    );

  pfb_fir0_53493745fd: entity work.pfb_fir0_entity_53493745fd
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol1_in1 => concat_y_net_x17,
      sync => logical3_y_net_x15,
      pol1_out1 => concat_y_net_x13,
      sync_out => delay1_q_net_x8
    );

  pfb_fir1_6880f213e5: entity work.pfb_fir1_entity_6880f213e5
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol1_in1 => concat_y_net_x18,
      sync => logical3_y_net_x15,
      pol1_out1 => concat_y_net_x14
    );

  pfb_fir2_42ba2486b8: entity work.pfb_fir1_entity_6880f213e5
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol1_in1 => concat_y_net_x19,
      sync => logical3_y_net_x15,
      pol1_out1 => concat_y_net_x15
    );

  pfb_fir3_1446973b28: entity work.pfb_fir1_entity_6880f213e5
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      pol1_in1 => concat_y_net_x20,
      sync => logical3_y_net_x15,
      pol1_out1 => concat_y_net_x16
    );

  pulse_ext2_af3e587f01: entity work.pulse_ext2_entity_af3e587f01
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      in_x0 => logical3_y_net_x15,
      out_x0 => relational5_op_net_x2
    );

  pulse_ext3_89e91108c9: entity work.pulse_ext3_entity_89e91108c9
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      in_x0 => logical1_y_net_x1,
      out_x0 => relational5_op_net_x3
    );

  pulse_ext4_10a4722abd: entity work.pulse_ext3_entity_89e91108c9
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      in_x0 => logical5_y_net_x1,
      out_x0 => relational5_op_net_x4
    );

  reinterpret: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => register_q_net_x2,
      output_port => reinterpret_output_port_net_x0
    );

  reinterpret1: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => register_q_net_x3,
      output_port => reinterpret1_output_port_net_x0
    );

  reinterpret2: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => register_q_net_x4,
      output_port => reinterpret2_output_port_net_x0
    );

  reinterpret3: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => register_q_net_x5,
      output_port => reinterpret3_output_port_net_x0
    );

  reinterpret4: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => register_q_net_x6,
      output_port => reinterpret4_output_port_net_x0
    );

  reinterpret5: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => register_q_net_x7,
      output_port => reinterpret5_output_port_net_x0
    );

  reinterpret6: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => register_q_net_x8,
      output_port => reinterpret6_output_port_net_x0
    );

  reinterpret7: entity work.reinterpret_3f7e3674f6
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => register_q_net_x9,
      output_port => reinterpret7_output_port_net_x0
    );

  ri_to_c1_77d260ea1a: entity work.ri_to_c_entity_e30b502d91
    port map (
      im => reinterpret_output_port_net_x11,
      re => reinterpret_output_port_net_x10,
      c => concat_y_net_x18
    );

  ri_to_c2_ecc7fce442: entity work.ri_to_c_entity_e30b502d91
    port map (
      im => reinterpret_output_port_net_x13,
      re => reinterpret_output_port_net_x12,
      c => concat_y_net_x19
    );

  ri_to_c3_2f2d884fa7: entity work.ri_to_c_entity_e30b502d91
    port map (
      im => reinterpret_output_port_net_x15,
      re => reinterpret_output_port_net_x14,
      c => concat_y_net_x20
    );

  ri_to_c_e30b502d91: entity work.ri_to_c_entity_e30b502d91
    port map (
      im => reinterpret_output_port_net_x9,
      re => reinterpret_output_port_net_x8,
      c => concat_y_net_x17
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 26,
      new_msb => 26,
      x_width => 27,
      y_width => 1
    )
    port map (
      x => counter1_op_net,
      y(0) => slice_y_net_x0
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 32,
      y_width => 18
    )
    port map (
      x => slice30_y_net_x2,
      y => slice1_y_net_x0
    );

  slice16: entity work.xlslice
    generic map (
      new_lsb => 15,
      new_msb => 15,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice16_y_net_x0
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 32,
      y_width => 18
    )
    port map (
      x => slice30_y_net_x2,
      y => slice2_y_net_x0
    );

  slice21: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 15,
      x_width => 32,
      y_width => 16
    )
    port map (
      x => delay1_q_net,
      y => slice21_y_net_x25
    );

  slice22: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 32,
      y_width => 18
    )
    port map (
      x => slice30_y_net_x2,
      y => slice22_y_net_x1
    );

  slice3: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 17,
      x_width => 32,
      y_width => 18
    )
    port map (
      x => slice30_y_net_x2,
      y => slice3_y_net_x0
    );

  slice6: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 16,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => delay1_q_net,
      y(0) => slice6_y_net
    );

  slice7: entity work.xlslice
    generic map (
      new_lsb => 17,
      new_msb => 17,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => delay1_q_net,
      y(0) => slice7_y_net_x1
    );

  slice8: entity work.xlslice
    generic map (
      new_lsb => 21,
      new_msb => 22,
      x_width => 32,
      y_width => 2
    )
    port map (
      x => delay1_q_net,
      y => slice8_y_net_x0
    );

  slice9: entity work.xlslice
    generic map (
      new_lsb => 19,
      new_msb => 19,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => delay1_q_net,
      y(0) => slice9_y_net_x0
    );

  sram_tvg_70a20dd50c: entity work.sram_tvg_entity_70a20dd50c
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      din => slice2_y_net_x1,
      sync => mux_y_net_x2,
      use_tvg => slice9_y_net_x0,
      dout => mux3_y_net_x1,
      sync_out => delay2_q_net_x3
    );

  sync_gen_b491977194: entity work.sync_gen_entity_b491977194
    port map (
      arm => slice7_y_net_x1,
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      rst => logical7_y_net_x0,
      armed => inverter_op_net_x1,
      mrst => gateway_out19_net,
      sync => logical3_y_net_x15
    );

  xaui0_73db2e8bdf: entity work.xaui0_entity_73db2e8bdf
    port map (
      rx_get => constant4_op_net_x0,
      rx_reset => constant5_op_net_x0,
      tx_data => mux1_y_net_x1,
      tx_outofband => concat2_y_net_x1,
      tx_valid => logical1_y_net_x6,
      convert_rx_get_x0 => i_128w_2k_10_r310iadc_xaui0_rx_get_net,
      convert_rx_reset_x0 => i_128w_2k_10_r310iadc_xaui0_rx_reset_net,
      convert_tx_data_x0 => i_128w_2k_10_r310iadc_xaui0_tx_data_net,
      convert_tx_outofband_x0 => i_128w_2k_10_r310iadc_xaui0_tx_outofband_net,
      convert_tx_valid_x0 => i_128w_2k_10_r310iadc_xaui0_tx_valid_net
    );

  xaui_process_ec66f1ce1b: entity work.xaui_process_entity_ec66f1ce1b
    port map (
      ce_1 => ce_1_sg_x424,
      clk_1 => clk_1_sg_x424,
      data_in => delay3_q_net_x0,
      lnk_dn => delay5_q_net_x0,
      valid => delay4_q_net_x0,
      addr => slice31_y_net_x6,
      data_out => slice30_y_net_x2,
      we => delay2_q_net_x6
    );

end structural;
