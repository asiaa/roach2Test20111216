-------------------------------------------------------------------------------
-- r2_5g_f01_xsg_core_config_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity r2_5g_f01_xsg_core_config_wrapper is
  port (
    clk : in std_logic;
    r2_5g_f01_acc_len_user_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_adc5g_sync : in std_logic;
    r2_5g_f01_adc5g_user_data_i0 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_i1 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_i2 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_i3 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_i4 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_i5 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_i6 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_i7 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_q0 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_q1 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_q2 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_q3 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_q4 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_q5 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_q6 : in std_logic_vector(7 downto 0);
    r2_5g_f01_adc5g_user_data_q7 : in std_logic_vector(7 downto 0);
    r2_5g_f01_cnt_rst_user_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_adc0_bram_data_out : in std_logic_vector(127 downto 0);
    r2_5g_f01_snap_adc0_bram_addr : out std_logic_vector(11 downto 0);
    r2_5g_f01_snap_adc0_bram_data_in : out std_logic_vector(127 downto 0);
    r2_5g_f01_snap_adc0_bram_we : out std_logic;
    r2_5g_f01_snap_adc0_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_adc0_status_user_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc0_addr_user_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc0_bram_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc0_bram_addr : out std_logic_vector(10 downto 0);
    r2_5g_f01_snap_vacc0_bram_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc0_bram_we : out std_logic;
    r2_5g_f01_snap_vacc0_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc1_addr_user_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc1_bram_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc1_bram_addr : out std_logic_vector(10 downto 0);
    r2_5g_f01_snap_vacc1_bram_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc1_bram_we : out std_logic;
    r2_5g_f01_snap_vacc1_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc2_addr_user_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc2_bram_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc2_bram_addr : out std_logic_vector(10 downto 0);
    r2_5g_f01_snap_vacc2_bram_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc2_bram_we : out std_logic;
    r2_5g_f01_snap_vacc2_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc3_addr_user_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc3_bram_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc3_bram_addr : out std_logic_vector(10 downto 0);
    r2_5g_f01_snap_vacc3_bram_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc3_bram_we : out std_logic;
    r2_5g_f01_snap_vacc3_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc4_addr_user_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc4_bram_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc4_bram_addr : out std_logic_vector(10 downto 0);
    r2_5g_f01_snap_vacc4_bram_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc4_bram_we : out std_logic;
    r2_5g_f01_snap_vacc4_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc5_addr_user_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc5_bram_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc5_bram_addr : out std_logic_vector(10 downto 0);
    r2_5g_f01_snap_vacc5_bram_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc5_bram_we : out std_logic;
    r2_5g_f01_snap_vacc5_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc6_addr_user_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc6_bram_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc6_bram_addr : out std_logic_vector(10 downto 0);
    r2_5g_f01_snap_vacc6_bram_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc6_bram_we : out std_logic;
    r2_5g_f01_snap_vacc6_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc7_addr_user_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc7_bram_data_out : in std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc7_bram_addr : out std_logic_vector(10 downto 0);
    r2_5g_f01_snap_vacc7_bram_data_in : out std_logic_vector(31 downto 0);
    r2_5g_f01_snap_vacc7_bram_we : out std_logic;
    r2_5g_f01_snap_vacc7_ctrl_user_data_out : in std_logic_vector(31 downto 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of r2_5g_f01_xsg_core_config_wrapper : entity is "r2_5g_f01_v1_00_a";

end r2_5g_f01_xsg_core_config_wrapper;

architecture STRUCTURE of r2_5g_f01_xsg_core_config_wrapper is

  component r2_5g_f01 is
    port (
      clk : in std_logic;
      r2_5g_f01_acc_len_user_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_adc5g_sync : in std_logic;
      r2_5g_f01_adc5g_user_data_i0 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_i1 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_i2 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_i3 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_i4 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_i5 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_i6 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_i7 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_q0 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_q1 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_q2 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_q3 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_q4 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_q5 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_q6 : in std_logic_vector(7 downto 0);
      r2_5g_f01_adc5g_user_data_q7 : in std_logic_vector(7 downto 0);
      r2_5g_f01_cnt_rst_user_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_adc0_bram_data_out : in std_logic_vector(127 downto 0);
      r2_5g_f01_snap_adc0_bram_addr : out std_logic_vector(11 downto 0);
      r2_5g_f01_snap_adc0_bram_data_in : out std_logic_vector(127 downto 0);
      r2_5g_f01_snap_adc0_bram_we : out std_logic;
      r2_5g_f01_snap_adc0_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_adc0_status_user_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc0_addr_user_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc0_bram_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc0_bram_addr : out std_logic_vector(10 downto 0);
      r2_5g_f01_snap_vacc0_bram_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc0_bram_we : out std_logic;
      r2_5g_f01_snap_vacc0_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc1_addr_user_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc1_bram_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc1_bram_addr : out std_logic_vector(10 downto 0);
      r2_5g_f01_snap_vacc1_bram_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc1_bram_we : out std_logic;
      r2_5g_f01_snap_vacc1_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc2_addr_user_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc2_bram_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc2_bram_addr : out std_logic_vector(10 downto 0);
      r2_5g_f01_snap_vacc2_bram_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc2_bram_we : out std_logic;
      r2_5g_f01_snap_vacc2_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc3_addr_user_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc3_bram_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc3_bram_addr : out std_logic_vector(10 downto 0);
      r2_5g_f01_snap_vacc3_bram_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc3_bram_we : out std_logic;
      r2_5g_f01_snap_vacc3_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc4_addr_user_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc4_bram_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc4_bram_addr : out std_logic_vector(10 downto 0);
      r2_5g_f01_snap_vacc4_bram_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc4_bram_we : out std_logic;
      r2_5g_f01_snap_vacc4_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc5_addr_user_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc5_bram_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc5_bram_addr : out std_logic_vector(10 downto 0);
      r2_5g_f01_snap_vacc5_bram_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc5_bram_we : out std_logic;
      r2_5g_f01_snap_vacc5_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc6_addr_user_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc6_bram_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc6_bram_addr : out std_logic_vector(10 downto 0);
      r2_5g_f01_snap_vacc6_bram_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc6_bram_we : out std_logic;
      r2_5g_f01_snap_vacc6_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc7_addr_user_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc7_bram_data_out : in std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc7_bram_addr : out std_logic_vector(10 downto 0);
      r2_5g_f01_snap_vacc7_bram_data_in : out std_logic_vector(31 downto 0);
      r2_5g_f01_snap_vacc7_bram_we : out std_logic;
      r2_5g_f01_snap_vacc7_ctrl_user_data_out : in std_logic_vector(31 downto 0)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of r2_5g_f01 : component is "user_black_box";

begin

  r2_5g_f01_XSG_core_config : r2_5g_f01
    port map (
      clk => clk,
      r2_5g_f01_acc_len_user_data_out => r2_5g_f01_acc_len_user_data_out,
      r2_5g_f01_adc5g_sync => r2_5g_f01_adc5g_sync,
      r2_5g_f01_adc5g_user_data_i0 => r2_5g_f01_adc5g_user_data_i0,
      r2_5g_f01_adc5g_user_data_i1 => r2_5g_f01_adc5g_user_data_i1,
      r2_5g_f01_adc5g_user_data_i2 => r2_5g_f01_adc5g_user_data_i2,
      r2_5g_f01_adc5g_user_data_i3 => r2_5g_f01_adc5g_user_data_i3,
      r2_5g_f01_adc5g_user_data_i4 => r2_5g_f01_adc5g_user_data_i4,
      r2_5g_f01_adc5g_user_data_i5 => r2_5g_f01_adc5g_user_data_i5,
      r2_5g_f01_adc5g_user_data_i6 => r2_5g_f01_adc5g_user_data_i6,
      r2_5g_f01_adc5g_user_data_i7 => r2_5g_f01_adc5g_user_data_i7,
      r2_5g_f01_adc5g_user_data_q0 => r2_5g_f01_adc5g_user_data_q0,
      r2_5g_f01_adc5g_user_data_q1 => r2_5g_f01_adc5g_user_data_q1,
      r2_5g_f01_adc5g_user_data_q2 => r2_5g_f01_adc5g_user_data_q2,
      r2_5g_f01_adc5g_user_data_q3 => r2_5g_f01_adc5g_user_data_q3,
      r2_5g_f01_adc5g_user_data_q4 => r2_5g_f01_adc5g_user_data_q4,
      r2_5g_f01_adc5g_user_data_q5 => r2_5g_f01_adc5g_user_data_q5,
      r2_5g_f01_adc5g_user_data_q6 => r2_5g_f01_adc5g_user_data_q6,
      r2_5g_f01_adc5g_user_data_q7 => r2_5g_f01_adc5g_user_data_q7,
      r2_5g_f01_cnt_rst_user_data_out => r2_5g_f01_cnt_rst_user_data_out,
      r2_5g_f01_snap_adc0_bram_data_out => r2_5g_f01_snap_adc0_bram_data_out,
      r2_5g_f01_snap_adc0_bram_addr => r2_5g_f01_snap_adc0_bram_addr,
      r2_5g_f01_snap_adc0_bram_data_in => r2_5g_f01_snap_adc0_bram_data_in,
      r2_5g_f01_snap_adc0_bram_we => r2_5g_f01_snap_adc0_bram_we,
      r2_5g_f01_snap_adc0_ctrl_user_data_out => r2_5g_f01_snap_adc0_ctrl_user_data_out,
      r2_5g_f01_snap_adc0_status_user_data_in => r2_5g_f01_snap_adc0_status_user_data_in,
      r2_5g_f01_snap_vacc0_addr_user_data_in => r2_5g_f01_snap_vacc0_addr_user_data_in,
      r2_5g_f01_snap_vacc0_bram_data_out => r2_5g_f01_snap_vacc0_bram_data_out,
      r2_5g_f01_snap_vacc0_bram_addr => r2_5g_f01_snap_vacc0_bram_addr,
      r2_5g_f01_snap_vacc0_bram_data_in => r2_5g_f01_snap_vacc0_bram_data_in,
      r2_5g_f01_snap_vacc0_bram_we => r2_5g_f01_snap_vacc0_bram_we,
      r2_5g_f01_snap_vacc0_ctrl_user_data_out => r2_5g_f01_snap_vacc0_ctrl_user_data_out,
      r2_5g_f01_snap_vacc1_addr_user_data_in => r2_5g_f01_snap_vacc1_addr_user_data_in,
      r2_5g_f01_snap_vacc1_bram_data_out => r2_5g_f01_snap_vacc1_bram_data_out,
      r2_5g_f01_snap_vacc1_bram_addr => r2_5g_f01_snap_vacc1_bram_addr,
      r2_5g_f01_snap_vacc1_bram_data_in => r2_5g_f01_snap_vacc1_bram_data_in,
      r2_5g_f01_snap_vacc1_bram_we => r2_5g_f01_snap_vacc1_bram_we,
      r2_5g_f01_snap_vacc1_ctrl_user_data_out => r2_5g_f01_snap_vacc1_ctrl_user_data_out,
      r2_5g_f01_snap_vacc2_addr_user_data_in => r2_5g_f01_snap_vacc2_addr_user_data_in,
      r2_5g_f01_snap_vacc2_bram_data_out => r2_5g_f01_snap_vacc2_bram_data_out,
      r2_5g_f01_snap_vacc2_bram_addr => r2_5g_f01_snap_vacc2_bram_addr,
      r2_5g_f01_snap_vacc2_bram_data_in => r2_5g_f01_snap_vacc2_bram_data_in,
      r2_5g_f01_snap_vacc2_bram_we => r2_5g_f01_snap_vacc2_bram_we,
      r2_5g_f01_snap_vacc2_ctrl_user_data_out => r2_5g_f01_snap_vacc2_ctrl_user_data_out,
      r2_5g_f01_snap_vacc3_addr_user_data_in => r2_5g_f01_snap_vacc3_addr_user_data_in,
      r2_5g_f01_snap_vacc3_bram_data_out => r2_5g_f01_snap_vacc3_bram_data_out,
      r2_5g_f01_snap_vacc3_bram_addr => r2_5g_f01_snap_vacc3_bram_addr,
      r2_5g_f01_snap_vacc3_bram_data_in => r2_5g_f01_snap_vacc3_bram_data_in,
      r2_5g_f01_snap_vacc3_bram_we => r2_5g_f01_snap_vacc3_bram_we,
      r2_5g_f01_snap_vacc3_ctrl_user_data_out => r2_5g_f01_snap_vacc3_ctrl_user_data_out,
      r2_5g_f01_snap_vacc4_addr_user_data_in => r2_5g_f01_snap_vacc4_addr_user_data_in,
      r2_5g_f01_snap_vacc4_bram_data_out => r2_5g_f01_snap_vacc4_bram_data_out,
      r2_5g_f01_snap_vacc4_bram_addr => r2_5g_f01_snap_vacc4_bram_addr,
      r2_5g_f01_snap_vacc4_bram_data_in => r2_5g_f01_snap_vacc4_bram_data_in,
      r2_5g_f01_snap_vacc4_bram_we => r2_5g_f01_snap_vacc4_bram_we,
      r2_5g_f01_snap_vacc4_ctrl_user_data_out => r2_5g_f01_snap_vacc4_ctrl_user_data_out,
      r2_5g_f01_snap_vacc5_addr_user_data_in => r2_5g_f01_snap_vacc5_addr_user_data_in,
      r2_5g_f01_snap_vacc5_bram_data_out => r2_5g_f01_snap_vacc5_bram_data_out,
      r2_5g_f01_snap_vacc5_bram_addr => r2_5g_f01_snap_vacc5_bram_addr,
      r2_5g_f01_snap_vacc5_bram_data_in => r2_5g_f01_snap_vacc5_bram_data_in,
      r2_5g_f01_snap_vacc5_bram_we => r2_5g_f01_snap_vacc5_bram_we,
      r2_5g_f01_snap_vacc5_ctrl_user_data_out => r2_5g_f01_snap_vacc5_ctrl_user_data_out,
      r2_5g_f01_snap_vacc6_addr_user_data_in => r2_5g_f01_snap_vacc6_addr_user_data_in,
      r2_5g_f01_snap_vacc6_bram_data_out => r2_5g_f01_snap_vacc6_bram_data_out,
      r2_5g_f01_snap_vacc6_bram_addr => r2_5g_f01_snap_vacc6_bram_addr,
      r2_5g_f01_snap_vacc6_bram_data_in => r2_5g_f01_snap_vacc6_bram_data_in,
      r2_5g_f01_snap_vacc6_bram_we => r2_5g_f01_snap_vacc6_bram_we,
      r2_5g_f01_snap_vacc6_ctrl_user_data_out => r2_5g_f01_snap_vacc6_ctrl_user_data_out,
      r2_5g_f01_snap_vacc7_addr_user_data_in => r2_5g_f01_snap_vacc7_addr_user_data_in,
      r2_5g_f01_snap_vacc7_bram_data_out => r2_5g_f01_snap_vacc7_bram_data_out,
      r2_5g_f01_snap_vacc7_bram_addr => r2_5g_f01_snap_vacc7_bram_addr,
      r2_5g_f01_snap_vacc7_bram_data_in => r2_5g_f01_snap_vacc7_bram_data_in,
      r2_5g_f01_snap_vacc7_bram_we => r2_5g_f01_snap_vacc7_bram_we,
      r2_5g_f01_snap_vacc7_ctrl_user_data_out => r2_5g_f01_snap_vacc7_ctrl_user_data_out
    );

end architecture STRUCTURE;

