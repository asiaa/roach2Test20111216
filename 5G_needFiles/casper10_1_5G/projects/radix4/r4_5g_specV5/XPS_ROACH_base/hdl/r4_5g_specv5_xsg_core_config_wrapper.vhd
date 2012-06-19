-------------------------------------------------------------------------------
-- r4_5g_specv5_xsg_core_config_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity r4_5g_specv5_xsg_core_config_wrapper is
  port (
    clk : in std_logic;
    r4_5g_specV5_acc_cnt_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_acc_len_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_adc_5g_user_data_valid : in std_logic;
    r4_5g_specV5_adc_5g_user_datai0 : in std_logic_vector(7 downto 0);
    r4_5g_specV5_adc_5g_user_datai1 : in std_logic_vector(7 downto 0);
    r4_5g_specV5_adc_5g_user_datai2 : in std_logic_vector(7 downto 0);
    r4_5g_specV5_adc_5g_user_datai3 : in std_logic_vector(7 downto 0);
    r4_5g_specV5_adc_5g_user_dataq0 : in std_logic_vector(7 downto 0);
    r4_5g_specV5_adc_5g_user_dataq1 : in std_logic_vector(7 downto 0);
    r4_5g_specV5_adc_5g_user_dataq2 : in std_logic_vector(7 downto 0);
    r4_5g_specV5_adc_5g_user_dataq3 : in std_logic_vector(7 downto 0);
    r4_5g_specV5_adc_5g_user_outofrange0 : in std_logic;
    r4_5g_specV5_adc_5g_user_outofrange1 : in std_logic;
    r4_5g_specV5_adc_5g_user_sync0 : in std_logic;
    r4_5g_specV5_adc_5g_user_sync1 : in std_logic;
    r4_5g_specV5_adc_5g_user_sync2 : in std_logic;
    r4_5g_specV5_adc_5g_user_sync3 : in std_logic;
    r4_5g_specV5_cnt_rst_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_led0_sync_gateway : out std_logic;
    r4_5g_specV5_led1_new_acc_gateway : out std_logic;
    r4_5g_specV5_snap_adc_addr_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_adc_bram_lsb_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_adc_bram_lsb_addr : out std_logic_vector(12 downto 0);
    r4_5g_specV5_snap_adc_bram_lsb_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_adc_bram_lsb_we : out std_logic;
    r4_5g_specV5_snap_adc_bram_msb_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_adc_bram_msb_addr : out std_logic_vector(12 downto 0);
    r4_5g_specV5_snap_adc_bram_msb_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_adc_bram_msb_we : out std_logic;
    r4_5g_specV5_snap_adc_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc0_addr_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc0_bram_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc0_bram_addr : out std_logic_vector(9 downto 0);
    r4_5g_specV5_snap_vacc0_bram_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc0_bram_we : out std_logic;
    r4_5g_specV5_snap_vacc0_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc1_addr_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc1_bram_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc1_bram_addr : out std_logic_vector(9 downto 0);
    r4_5g_specV5_snap_vacc1_bram_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc1_bram_we : out std_logic;
    r4_5g_specV5_snap_vacc1_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc2_addr_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc2_bram_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc2_bram_addr : out std_logic_vector(9 downto 0);
    r4_5g_specV5_snap_vacc2_bram_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc2_bram_we : out std_logic;
    r4_5g_specV5_snap_vacc2_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc3_addr_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc3_bram_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc3_bram_addr : out std_logic_vector(9 downto 0);
    r4_5g_specV5_snap_vacc3_bram_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specV5_snap_vacc3_bram_we : out std_logic;
    r4_5g_specV5_snap_vacc3_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specV5_sync_cnt_user_data_in : out std_logic_vector(31 downto 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of r4_5g_specv5_xsg_core_config_wrapper : entity is "r4_5g_specV5_v1_00_a";

end r4_5g_specv5_xsg_core_config_wrapper;

architecture STRUCTURE of r4_5g_specv5_xsg_core_config_wrapper is

  component r4_5g_specv5 is
    port (
      clk : in std_logic;
      r4_5g_specV5_acc_cnt_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_acc_len_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_adc_5g_user_data_valid : in std_logic;
      r4_5g_specV5_adc_5g_user_datai0 : in std_logic_vector(7 downto 0);
      r4_5g_specV5_adc_5g_user_datai1 : in std_logic_vector(7 downto 0);
      r4_5g_specV5_adc_5g_user_datai2 : in std_logic_vector(7 downto 0);
      r4_5g_specV5_adc_5g_user_datai3 : in std_logic_vector(7 downto 0);
      r4_5g_specV5_adc_5g_user_dataq0 : in std_logic_vector(7 downto 0);
      r4_5g_specV5_adc_5g_user_dataq1 : in std_logic_vector(7 downto 0);
      r4_5g_specV5_adc_5g_user_dataq2 : in std_logic_vector(7 downto 0);
      r4_5g_specV5_adc_5g_user_dataq3 : in std_logic_vector(7 downto 0);
      r4_5g_specV5_adc_5g_user_outofrange0 : in std_logic;
      r4_5g_specV5_adc_5g_user_outofrange1 : in std_logic;
      r4_5g_specV5_adc_5g_user_sync0 : in std_logic;
      r4_5g_specV5_adc_5g_user_sync1 : in std_logic;
      r4_5g_specV5_adc_5g_user_sync2 : in std_logic;
      r4_5g_specV5_adc_5g_user_sync3 : in std_logic;
      r4_5g_specV5_cnt_rst_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_led0_sync_gateway : out std_logic;
      r4_5g_specV5_led1_new_acc_gateway : out std_logic;
      r4_5g_specV5_snap_adc_addr_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_adc_bram_lsb_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_adc_bram_lsb_addr : out std_logic_vector(12 downto 0);
      r4_5g_specV5_snap_adc_bram_lsb_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_adc_bram_lsb_we : out std_logic;
      r4_5g_specV5_snap_adc_bram_msb_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_adc_bram_msb_addr : out std_logic_vector(12 downto 0);
      r4_5g_specV5_snap_adc_bram_msb_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_adc_bram_msb_we : out std_logic;
      r4_5g_specV5_snap_adc_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc0_addr_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc0_bram_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc0_bram_addr : out std_logic_vector(9 downto 0);
      r4_5g_specV5_snap_vacc0_bram_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc0_bram_we : out std_logic;
      r4_5g_specV5_snap_vacc0_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc1_addr_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc1_bram_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc1_bram_addr : out std_logic_vector(9 downto 0);
      r4_5g_specV5_snap_vacc1_bram_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc1_bram_we : out std_logic;
      r4_5g_specV5_snap_vacc1_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc2_addr_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc2_bram_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc2_bram_addr : out std_logic_vector(9 downto 0);
      r4_5g_specV5_snap_vacc2_bram_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc2_bram_we : out std_logic;
      r4_5g_specV5_snap_vacc2_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc3_addr_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc3_bram_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc3_bram_addr : out std_logic_vector(9 downto 0);
      r4_5g_specV5_snap_vacc3_bram_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specV5_snap_vacc3_bram_we : out std_logic;
      r4_5g_specV5_snap_vacc3_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specV5_sync_cnt_user_data_in : out std_logic_vector(31 downto 0)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of r4_5g_specv5 : component is "black_box";

begin

  r4_5g_specV5_XSG_core_config : r4_5g_specv5
    port map (
      clk => clk,
      r4_5g_specV5_acc_cnt_user_data_in => r4_5g_specV5_acc_cnt_user_data_in,
      r4_5g_specV5_acc_len_user_data_out => r4_5g_specV5_acc_len_user_data_out,
      r4_5g_specV5_adc_5g_user_data_valid => r4_5g_specV5_adc_5g_user_data_valid,
      r4_5g_specV5_adc_5g_user_datai0 => r4_5g_specV5_adc_5g_user_datai0,
      r4_5g_specV5_adc_5g_user_datai1 => r4_5g_specV5_adc_5g_user_datai1,
      r4_5g_specV5_adc_5g_user_datai2 => r4_5g_specV5_adc_5g_user_datai2,
      r4_5g_specV5_adc_5g_user_datai3 => r4_5g_specV5_adc_5g_user_datai3,
      r4_5g_specV5_adc_5g_user_dataq0 => r4_5g_specV5_adc_5g_user_dataq0,
      r4_5g_specV5_adc_5g_user_dataq1 => r4_5g_specV5_adc_5g_user_dataq1,
      r4_5g_specV5_adc_5g_user_dataq2 => r4_5g_specV5_adc_5g_user_dataq2,
      r4_5g_specV5_adc_5g_user_dataq3 => r4_5g_specV5_adc_5g_user_dataq3,
      r4_5g_specV5_adc_5g_user_outofrange0 => r4_5g_specV5_adc_5g_user_outofrange0,
      r4_5g_specV5_adc_5g_user_outofrange1 => r4_5g_specV5_adc_5g_user_outofrange1,
      r4_5g_specV5_adc_5g_user_sync0 => r4_5g_specV5_adc_5g_user_sync0,
      r4_5g_specV5_adc_5g_user_sync1 => r4_5g_specV5_adc_5g_user_sync1,
      r4_5g_specV5_adc_5g_user_sync2 => r4_5g_specV5_adc_5g_user_sync2,
      r4_5g_specV5_adc_5g_user_sync3 => r4_5g_specV5_adc_5g_user_sync3,
      r4_5g_specV5_cnt_rst_user_data_out => r4_5g_specV5_cnt_rst_user_data_out,
      r4_5g_specV5_led0_sync_gateway => r4_5g_specV5_led0_sync_gateway,
      r4_5g_specV5_led1_new_acc_gateway => r4_5g_specV5_led1_new_acc_gateway,
      r4_5g_specV5_snap_adc_addr_user_data_in => r4_5g_specV5_snap_adc_addr_user_data_in,
      r4_5g_specV5_snap_adc_bram_lsb_data_out => r4_5g_specV5_snap_adc_bram_lsb_data_out,
      r4_5g_specV5_snap_adc_bram_lsb_addr => r4_5g_specV5_snap_adc_bram_lsb_addr,
      r4_5g_specV5_snap_adc_bram_lsb_data_in => r4_5g_specV5_snap_adc_bram_lsb_data_in,
      r4_5g_specV5_snap_adc_bram_lsb_we => r4_5g_specV5_snap_adc_bram_lsb_we,
      r4_5g_specV5_snap_adc_bram_msb_data_out => r4_5g_specV5_snap_adc_bram_msb_data_out,
      r4_5g_specV5_snap_adc_bram_msb_addr => r4_5g_specV5_snap_adc_bram_msb_addr,
      r4_5g_specV5_snap_adc_bram_msb_data_in => r4_5g_specV5_snap_adc_bram_msb_data_in,
      r4_5g_specV5_snap_adc_bram_msb_we => r4_5g_specV5_snap_adc_bram_msb_we,
      r4_5g_specV5_snap_adc_ctrl_user_data_out => r4_5g_specV5_snap_adc_ctrl_user_data_out,
      r4_5g_specV5_snap_vacc0_addr_user_data_in => r4_5g_specV5_snap_vacc0_addr_user_data_in,
      r4_5g_specV5_snap_vacc0_bram_data_out => r4_5g_specV5_snap_vacc0_bram_data_out,
      r4_5g_specV5_snap_vacc0_bram_addr => r4_5g_specV5_snap_vacc0_bram_addr,
      r4_5g_specV5_snap_vacc0_bram_data_in => r4_5g_specV5_snap_vacc0_bram_data_in,
      r4_5g_specV5_snap_vacc0_bram_we => r4_5g_specV5_snap_vacc0_bram_we,
      r4_5g_specV5_snap_vacc0_ctrl_user_data_out => r4_5g_specV5_snap_vacc0_ctrl_user_data_out,
      r4_5g_specV5_snap_vacc1_addr_user_data_in => r4_5g_specV5_snap_vacc1_addr_user_data_in,
      r4_5g_specV5_snap_vacc1_bram_data_out => r4_5g_specV5_snap_vacc1_bram_data_out,
      r4_5g_specV5_snap_vacc1_bram_addr => r4_5g_specV5_snap_vacc1_bram_addr,
      r4_5g_specV5_snap_vacc1_bram_data_in => r4_5g_specV5_snap_vacc1_bram_data_in,
      r4_5g_specV5_snap_vacc1_bram_we => r4_5g_specV5_snap_vacc1_bram_we,
      r4_5g_specV5_snap_vacc1_ctrl_user_data_out => r4_5g_specV5_snap_vacc1_ctrl_user_data_out,
      r4_5g_specV5_snap_vacc2_addr_user_data_in => r4_5g_specV5_snap_vacc2_addr_user_data_in,
      r4_5g_specV5_snap_vacc2_bram_data_out => r4_5g_specV5_snap_vacc2_bram_data_out,
      r4_5g_specV5_snap_vacc2_bram_addr => r4_5g_specV5_snap_vacc2_bram_addr,
      r4_5g_specV5_snap_vacc2_bram_data_in => r4_5g_specV5_snap_vacc2_bram_data_in,
      r4_5g_specV5_snap_vacc2_bram_we => r4_5g_specV5_snap_vacc2_bram_we,
      r4_5g_specV5_snap_vacc2_ctrl_user_data_out => r4_5g_specV5_snap_vacc2_ctrl_user_data_out,
      r4_5g_specV5_snap_vacc3_addr_user_data_in => r4_5g_specV5_snap_vacc3_addr_user_data_in,
      r4_5g_specV5_snap_vacc3_bram_data_out => r4_5g_specV5_snap_vacc3_bram_data_out,
      r4_5g_specV5_snap_vacc3_bram_addr => r4_5g_specV5_snap_vacc3_bram_addr,
      r4_5g_specV5_snap_vacc3_bram_data_in => r4_5g_specV5_snap_vacc3_bram_data_in,
      r4_5g_specV5_snap_vacc3_bram_we => r4_5g_specV5_snap_vacc3_bram_we,
      r4_5g_specV5_snap_vacc3_ctrl_user_data_out => r4_5g_specV5_snap_vacc3_ctrl_user_data_out,
      r4_5g_specV5_sync_cnt_user_data_in => r4_5g_specV5_sync_cnt_user_data_in
    );

end architecture STRUCTURE;

