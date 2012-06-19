-------------------------------------------------------------------------------
-- r4_5g_specd5_xsg_core_config_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity r4_5g_specd5_xsg_core_config_wrapper is
  port (
    clk : in std_logic;
    r4_5g_specD5_acc_cnt_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_acc_len_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_data_valid : in std_logic;
    r4_5g_specD5_adc_5G_dmux_user_datai0 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_datai1 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_datai2 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_datai3 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_datai4 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_datai5 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_datai6 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_datai7 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_dataq0 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_dataq1 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_dataq2 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_dataq3 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_dataq4 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_dataq5 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_dataq6 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_dataq7 : in std_logic_vector(3 downto 0);
    r4_5g_specD5_adc_5G_dmux_user_outofrange0 : in std_logic;
    r4_5g_specD5_adc_5G_dmux_user_outofrange1 : in std_logic;
    r4_5g_specD5_adc_5G_dmux_user_sync0 : in std_logic;
    r4_5g_specD5_adc_5G_dmux_user_sync1 : in std_logic;
    r4_5g_specD5_adc_5G_dmux_user_sync2 : in std_logic;
    r4_5g_specD5_adc_5G_dmux_user_sync3 : in std_logic;
    r4_5g_specD5_cnt_rst_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_led0_sync_gateway : out std_logic;
    r4_5g_specD5_led1_new_acc_gateway : out std_logic;
    r4_5g_specD5_snap_adc_addr_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_adc_bram_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_adc_bram_addr : out std_logic_vector(9 downto 0);
    r4_5g_specD5_snap_adc_bram_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_adc_bram_we : out std_logic;
    r4_5g_specD5_snap_adc_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc0_addr_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc0_bram_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc0_bram_addr : out std_logic_vector(9 downto 0);
    r4_5g_specD5_snap_vacc0_bram_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc0_bram_we : out std_logic;
    r4_5g_specD5_snap_vacc0_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc1_addr_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc1_bram_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc1_bram_addr : out std_logic_vector(9 downto 0);
    r4_5g_specD5_snap_vacc1_bram_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc1_bram_we : out std_logic;
    r4_5g_specD5_snap_vacc1_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc2_addr_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc2_bram_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc2_bram_addr : out std_logic_vector(9 downto 0);
    r4_5g_specD5_snap_vacc2_bram_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc2_bram_we : out std_logic;
    r4_5g_specD5_snap_vacc2_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc3_addr_user_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc3_bram_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc3_bram_addr : out std_logic_vector(9 downto 0);
    r4_5g_specD5_snap_vacc3_bram_data_in : out std_logic_vector(31 downto 0);
    r4_5g_specD5_snap_vacc3_bram_we : out std_logic;
    r4_5g_specD5_snap_vacc3_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    r4_5g_specD5_sync_cnt_user_data_in : out std_logic_vector(31 downto 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of r4_5g_specd5_xsg_core_config_wrapper : entity is "r4_5g_specD5_v1_00_a";

end r4_5g_specd5_xsg_core_config_wrapper;

architecture STRUCTURE of r4_5g_specd5_xsg_core_config_wrapper is

  component r4_5g_specd5 is
    port (
      clk : in std_logic;
      r4_5g_specD5_acc_cnt_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_acc_len_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_data_valid : in std_logic;
      r4_5g_specD5_adc_5G_dmux_user_datai0 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_datai1 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_datai2 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_datai3 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_datai4 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_datai5 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_datai6 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_datai7 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_dataq0 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_dataq1 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_dataq2 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_dataq3 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_dataq4 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_dataq5 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_dataq6 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_dataq7 : in std_logic_vector(3 downto 0);
      r4_5g_specD5_adc_5G_dmux_user_outofrange0 : in std_logic;
      r4_5g_specD5_adc_5G_dmux_user_outofrange1 : in std_logic;
      r4_5g_specD5_adc_5G_dmux_user_sync0 : in std_logic;
      r4_5g_specD5_adc_5G_dmux_user_sync1 : in std_logic;
      r4_5g_specD5_adc_5G_dmux_user_sync2 : in std_logic;
      r4_5g_specD5_adc_5G_dmux_user_sync3 : in std_logic;
      r4_5g_specD5_cnt_rst_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_led0_sync_gateway : out std_logic;
      r4_5g_specD5_led1_new_acc_gateway : out std_logic;
      r4_5g_specD5_snap_adc_addr_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_adc_bram_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_adc_bram_addr : out std_logic_vector(9 downto 0);
      r4_5g_specD5_snap_adc_bram_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_adc_bram_we : out std_logic;
      r4_5g_specD5_snap_adc_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc0_addr_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc0_bram_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc0_bram_addr : out std_logic_vector(9 downto 0);
      r4_5g_specD5_snap_vacc0_bram_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc0_bram_we : out std_logic;
      r4_5g_specD5_snap_vacc0_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc1_addr_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc1_bram_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc1_bram_addr : out std_logic_vector(9 downto 0);
      r4_5g_specD5_snap_vacc1_bram_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc1_bram_we : out std_logic;
      r4_5g_specD5_snap_vacc1_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc2_addr_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc2_bram_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc2_bram_addr : out std_logic_vector(9 downto 0);
      r4_5g_specD5_snap_vacc2_bram_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc2_bram_we : out std_logic;
      r4_5g_specD5_snap_vacc2_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc3_addr_user_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc3_bram_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc3_bram_addr : out std_logic_vector(9 downto 0);
      r4_5g_specD5_snap_vacc3_bram_data_in : out std_logic_vector(31 downto 0);
      r4_5g_specD5_snap_vacc3_bram_we : out std_logic;
      r4_5g_specD5_snap_vacc3_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      r4_5g_specD5_sync_cnt_user_data_in : out std_logic_vector(31 downto 0)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of r4_5g_specd5 : component is "black_box";

begin

  r4_5g_specD5_XSG_core_config : r4_5g_specd5
    port map (
      clk => clk,
      r4_5g_specD5_acc_cnt_user_data_in => r4_5g_specD5_acc_cnt_user_data_in,
      r4_5g_specD5_acc_len_user_data_out => r4_5g_specD5_acc_len_user_data_out,
      r4_5g_specD5_adc_5G_dmux_user_data_valid => r4_5g_specD5_adc_5G_dmux_user_data_valid,
      r4_5g_specD5_adc_5G_dmux_user_datai0 => r4_5g_specD5_adc_5G_dmux_user_datai0,
      r4_5g_specD5_adc_5G_dmux_user_datai1 => r4_5g_specD5_adc_5G_dmux_user_datai1,
      r4_5g_specD5_adc_5G_dmux_user_datai2 => r4_5g_specD5_adc_5G_dmux_user_datai2,
      r4_5g_specD5_adc_5G_dmux_user_datai3 => r4_5g_specD5_adc_5G_dmux_user_datai3,
      r4_5g_specD5_adc_5G_dmux_user_datai4 => r4_5g_specD5_adc_5G_dmux_user_datai4,
      r4_5g_specD5_adc_5G_dmux_user_datai5 => r4_5g_specD5_adc_5G_dmux_user_datai5,
      r4_5g_specD5_adc_5G_dmux_user_datai6 => r4_5g_specD5_adc_5G_dmux_user_datai6,
      r4_5g_specD5_adc_5G_dmux_user_datai7 => r4_5g_specD5_adc_5G_dmux_user_datai7,
      r4_5g_specD5_adc_5G_dmux_user_dataq0 => r4_5g_specD5_adc_5G_dmux_user_dataq0,
      r4_5g_specD5_adc_5G_dmux_user_dataq1 => r4_5g_specD5_adc_5G_dmux_user_dataq1,
      r4_5g_specD5_adc_5G_dmux_user_dataq2 => r4_5g_specD5_adc_5G_dmux_user_dataq2,
      r4_5g_specD5_adc_5G_dmux_user_dataq3 => r4_5g_specD5_adc_5G_dmux_user_dataq3,
      r4_5g_specD5_adc_5G_dmux_user_dataq4 => r4_5g_specD5_adc_5G_dmux_user_dataq4,
      r4_5g_specD5_adc_5G_dmux_user_dataq5 => r4_5g_specD5_adc_5G_dmux_user_dataq5,
      r4_5g_specD5_adc_5G_dmux_user_dataq6 => r4_5g_specD5_adc_5G_dmux_user_dataq6,
      r4_5g_specD5_adc_5G_dmux_user_dataq7 => r4_5g_specD5_adc_5G_dmux_user_dataq7,
      r4_5g_specD5_adc_5G_dmux_user_outofrange0 => r4_5g_specD5_adc_5G_dmux_user_outofrange0,
      r4_5g_specD5_adc_5G_dmux_user_outofrange1 => r4_5g_specD5_adc_5G_dmux_user_outofrange1,
      r4_5g_specD5_adc_5G_dmux_user_sync0 => r4_5g_specD5_adc_5G_dmux_user_sync0,
      r4_5g_specD5_adc_5G_dmux_user_sync1 => r4_5g_specD5_adc_5G_dmux_user_sync1,
      r4_5g_specD5_adc_5G_dmux_user_sync2 => r4_5g_specD5_adc_5G_dmux_user_sync2,
      r4_5g_specD5_adc_5G_dmux_user_sync3 => r4_5g_specD5_adc_5G_dmux_user_sync3,
      r4_5g_specD5_cnt_rst_user_data_out => r4_5g_specD5_cnt_rst_user_data_out,
      r4_5g_specD5_led0_sync_gateway => r4_5g_specD5_led0_sync_gateway,
      r4_5g_specD5_led1_new_acc_gateway => r4_5g_specD5_led1_new_acc_gateway,
      r4_5g_specD5_snap_adc_addr_user_data_in => r4_5g_specD5_snap_adc_addr_user_data_in,
      r4_5g_specD5_snap_adc_bram_data_out => r4_5g_specD5_snap_adc_bram_data_out,
      r4_5g_specD5_snap_adc_bram_addr => r4_5g_specD5_snap_adc_bram_addr,
      r4_5g_specD5_snap_adc_bram_data_in => r4_5g_specD5_snap_adc_bram_data_in,
      r4_5g_specD5_snap_adc_bram_we => r4_5g_specD5_snap_adc_bram_we,
      r4_5g_specD5_snap_adc_ctrl_user_data_out => r4_5g_specD5_snap_adc_ctrl_user_data_out,
      r4_5g_specD5_snap_vacc0_addr_user_data_in => r4_5g_specD5_snap_vacc0_addr_user_data_in,
      r4_5g_specD5_snap_vacc0_bram_data_out => r4_5g_specD5_snap_vacc0_bram_data_out,
      r4_5g_specD5_snap_vacc0_bram_addr => r4_5g_specD5_snap_vacc0_bram_addr,
      r4_5g_specD5_snap_vacc0_bram_data_in => r4_5g_specD5_snap_vacc0_bram_data_in,
      r4_5g_specD5_snap_vacc0_bram_we => r4_5g_specD5_snap_vacc0_bram_we,
      r4_5g_specD5_snap_vacc0_ctrl_user_data_out => r4_5g_specD5_snap_vacc0_ctrl_user_data_out,
      r4_5g_specD5_snap_vacc1_addr_user_data_in => r4_5g_specD5_snap_vacc1_addr_user_data_in,
      r4_5g_specD5_snap_vacc1_bram_data_out => r4_5g_specD5_snap_vacc1_bram_data_out,
      r4_5g_specD5_snap_vacc1_bram_addr => r4_5g_specD5_snap_vacc1_bram_addr,
      r4_5g_specD5_snap_vacc1_bram_data_in => r4_5g_specD5_snap_vacc1_bram_data_in,
      r4_5g_specD5_snap_vacc1_bram_we => r4_5g_specD5_snap_vacc1_bram_we,
      r4_5g_specD5_snap_vacc1_ctrl_user_data_out => r4_5g_specD5_snap_vacc1_ctrl_user_data_out,
      r4_5g_specD5_snap_vacc2_addr_user_data_in => r4_5g_specD5_snap_vacc2_addr_user_data_in,
      r4_5g_specD5_snap_vacc2_bram_data_out => r4_5g_specD5_snap_vacc2_bram_data_out,
      r4_5g_specD5_snap_vacc2_bram_addr => r4_5g_specD5_snap_vacc2_bram_addr,
      r4_5g_specD5_snap_vacc2_bram_data_in => r4_5g_specD5_snap_vacc2_bram_data_in,
      r4_5g_specD5_snap_vacc2_bram_we => r4_5g_specD5_snap_vacc2_bram_we,
      r4_5g_specD5_snap_vacc2_ctrl_user_data_out => r4_5g_specD5_snap_vacc2_ctrl_user_data_out,
      r4_5g_specD5_snap_vacc3_addr_user_data_in => r4_5g_specD5_snap_vacc3_addr_user_data_in,
      r4_5g_specD5_snap_vacc3_bram_data_out => r4_5g_specD5_snap_vacc3_bram_data_out,
      r4_5g_specD5_snap_vacc3_bram_addr => r4_5g_specD5_snap_vacc3_bram_addr,
      r4_5g_specD5_snap_vacc3_bram_data_in => r4_5g_specD5_snap_vacc3_bram_data_in,
      r4_5g_specD5_snap_vacc3_bram_we => r4_5g_specD5_snap_vacc3_bram_we,
      r4_5g_specD5_snap_vacc3_ctrl_user_data_out => r4_5g_specD5_snap_vacc3_ctrl_user_data_out,
      r4_5g_specD5_sync_cnt_user_data_in => r4_5g_specD5_sync_cnt_user_data_in
    );

end architecture STRUCTURE;

