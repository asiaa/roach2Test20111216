-------------------------------------------------------------------------------
-- i_128w_2k_10_r310iadc_xsg_core_config_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity i_128w_2k_10_r310iadc_xsg_core_config_wrapper is
  port (
    clk : in std_logic;
    i_128w_2k_10_r310iadc_XAUI0_rx_almost_full : in std_logic;
    i_128w_2k_10_r310iadc_XAUI0_rx_data : in std_logic_vector(63 downto 0);
    i_128w_2k_10_r310iadc_XAUI0_rx_empty : in std_logic;
    i_128w_2k_10_r310iadc_XAUI0_rx_linkdown : in std_logic;
    i_128w_2k_10_r310iadc_XAUI0_rx_outofband : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_XAUI0_rx_valid : in std_logic;
    i_128w_2k_10_r310iadc_XAUI0_tx_full : in std_logic;
    i_128w_2k_10_r310iadc_XAUI0_rx_get : out std_logic;
    i_128w_2k_10_r310iadc_XAUI0_rx_reset : out std_logic;
    i_128w_2k_10_r310iadc_XAUI0_tx_data : out std_logic_vector(63 downto 0);
    i_128w_2k_10_r310iadc_XAUI0_tx_outofband : out std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_XAUI0_tx_valid : out std_logic;
    i_128w_2k_10_r310iadc_adc0_user_data_valid : in std_logic;
    i_128w_2k_10_r310iadc_adc0_user_datai0 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc0_user_datai1 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc0_user_datai2 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc0_user_datai3 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc0_user_dataq0 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc0_user_dataq1 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc0_user_dataq2 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc0_user_dataq3 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc0_user_outofrangei0 : in std_logic;
    i_128w_2k_10_r310iadc_adc0_user_outofrangei1 : in std_logic;
    i_128w_2k_10_r310iadc_adc0_user_outofrangeq0 : in std_logic;
    i_128w_2k_10_r310iadc_adc0_user_outofrangeq1 : in std_logic;
    i_128w_2k_10_r310iadc_adc0_user_sync0 : in std_logic;
    i_128w_2k_10_r310iadc_adc0_user_sync1 : in std_logic;
    i_128w_2k_10_r310iadc_adc0_user_sync2 : in std_logic;
    i_128w_2k_10_r310iadc_adc0_user_sync3 : in std_logic;
    i_128w_2k_10_r310iadc_adc1_user_data_valid : in std_logic;
    i_128w_2k_10_r310iadc_adc1_user_datai0 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc1_user_datai1 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc1_user_datai2 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc1_user_datai3 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc1_user_dataq0 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc1_user_dataq1 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc1_user_dataq2 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc1_user_dataq3 : in std_logic_vector(7 downto 0);
    i_128w_2k_10_r310iadc_adc1_user_outofrangei0 : in std_logic;
    i_128w_2k_10_r310iadc_adc1_user_outofrangei1 : in std_logic;
    i_128w_2k_10_r310iadc_adc1_user_outofrangeq0 : in std_logic;
    i_128w_2k_10_r310iadc_adc1_user_outofrangeq1 : in std_logic;
    i_128w_2k_10_r310iadc_adc1_user_sync0 : in std_logic;
    i_128w_2k_10_r310iadc_adc1_user_sync1 : in std_logic;
    i_128w_2k_10_r310iadc_adc1_user_sync2 : in std_logic;
    i_128w_2k_10_r310iadc_adc1_user_sync3 : in std_logic;
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out : in std_logic_vector(35 downto 0);
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid : in std_logic;
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address : out std_logic_vector(18 downto 0);
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be : out std_logic_vector(3 downto 0);
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in : out std_logic_vector(35 downto 0);
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we : out std_logic;
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out : in std_logic_vector(35 downto 0);
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid : in std_logic;
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address : out std_logic_vector(18 downto 0);
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be : out std_logic_vector(3 downto 0);
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in : out std_logic_vector(35 downto 0);
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we : out std_logic;
    i_128w_2k_10_r310iadc_gpio_gateway : out std_logic;
    i_128w_2k_10_r310iadc_led1_arm_gateway : out std_logic;
    i_128w_2k_10_r310iadc_led2_sync_gateway : out std_logic;
    i_128w_2k_10_r310iadc_led4_eq_clip_gateway : out std_logic;
    i_128w_2k_10_r310iadc_led5_adc_clip_gateway : out std_logic;
    i_128w_2k_10_r310iadc_led6_link_dn_gateway : out std_logic;
    i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway : out std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of i_128w_2k_10_r310iadc_xsg_core_config_wrapper : entity is "i_128w_2k_10_r310iadc_v1_00_a";

end i_128w_2k_10_r310iadc_xsg_core_config_wrapper;

architecture STRUCTURE of i_128w_2k_10_r310iadc_xsg_core_config_wrapper is

  component i_128w_2k_10_r310iadc is
    port (
      clk : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_almost_full : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_data : in std_logic_vector(63 downto 0);
      i_128w_2k_10_r310iadc_XAUI0_rx_empty : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_linkdown : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_outofband : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_XAUI0_rx_valid : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_tx_full : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_get : out std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_reset : out std_logic;
      i_128w_2k_10_r310iadc_XAUI0_tx_data : out std_logic_vector(63 downto 0);
      i_128w_2k_10_r310iadc_XAUI0_tx_outofband : out std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_XAUI0_tx_valid : out std_logic;
      i_128w_2k_10_r310iadc_adc0_user_data_valid : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_datai0 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_datai1 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_datai2 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_datai3 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_dataq0 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_dataq1 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_dataq2 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_dataq3 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_outofrangei0 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_outofrangei1 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_outofrangeq0 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_outofrangeq1 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_sync0 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_sync1 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_sync2 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_sync3 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_data_valid : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_datai0 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_datai1 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_datai2 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_datai3 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_dataq0 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_dataq1 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_dataq2 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_dataq3 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_outofrangei0 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_outofrangei1 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_outofrangeq0 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_outofrangeq1 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_sync0 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_sync1 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_sync2 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_sync3 : in std_logic;
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out : in std_logic_vector(35 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid : in std_logic;
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address : out std_logic_vector(18 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be : out std_logic_vector(3 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in : out std_logic_vector(35 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we : out std_logic;
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out : in std_logic_vector(35 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid : in std_logic;
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address : out std_logic_vector(18 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be : out std_logic_vector(3 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in : out std_logic_vector(35 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we : out std_logic;
      i_128w_2k_10_r310iadc_gpio_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led1_arm_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led2_sync_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led4_eq_clip_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led5_adc_clip_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led6_link_dn_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway : out std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of i_128w_2k_10_r310iadc : component is "black_box";

begin

  i_128w_2k_10_r310iadc_XSG_core_config : i_128w_2k_10_r310iadc
    port map (
      clk => clk,
      i_128w_2k_10_r310iadc_XAUI0_rx_almost_full => i_128w_2k_10_r310iadc_XAUI0_rx_almost_full,
      i_128w_2k_10_r310iadc_XAUI0_rx_data => i_128w_2k_10_r310iadc_XAUI0_rx_data,
      i_128w_2k_10_r310iadc_XAUI0_rx_empty => i_128w_2k_10_r310iadc_XAUI0_rx_empty,
      i_128w_2k_10_r310iadc_XAUI0_rx_linkdown => i_128w_2k_10_r310iadc_XAUI0_rx_linkdown,
      i_128w_2k_10_r310iadc_XAUI0_rx_outofband => i_128w_2k_10_r310iadc_XAUI0_rx_outofband,
      i_128w_2k_10_r310iadc_XAUI0_rx_valid => i_128w_2k_10_r310iadc_XAUI0_rx_valid,
      i_128w_2k_10_r310iadc_XAUI0_tx_full => i_128w_2k_10_r310iadc_XAUI0_tx_full,
      i_128w_2k_10_r310iadc_XAUI0_rx_get => i_128w_2k_10_r310iadc_XAUI0_rx_get,
      i_128w_2k_10_r310iadc_XAUI0_rx_reset => i_128w_2k_10_r310iadc_XAUI0_rx_reset,
      i_128w_2k_10_r310iadc_XAUI0_tx_data => i_128w_2k_10_r310iadc_XAUI0_tx_data,
      i_128w_2k_10_r310iadc_XAUI0_tx_outofband => i_128w_2k_10_r310iadc_XAUI0_tx_outofband,
      i_128w_2k_10_r310iadc_XAUI0_tx_valid => i_128w_2k_10_r310iadc_XAUI0_tx_valid,
      i_128w_2k_10_r310iadc_adc0_user_data_valid => i_128w_2k_10_r310iadc_adc0_user_data_valid,
      i_128w_2k_10_r310iadc_adc0_user_datai0 => i_128w_2k_10_r310iadc_adc0_user_datai0,
      i_128w_2k_10_r310iadc_adc0_user_datai1 => i_128w_2k_10_r310iadc_adc0_user_datai1,
      i_128w_2k_10_r310iadc_adc0_user_datai2 => i_128w_2k_10_r310iadc_adc0_user_datai2,
      i_128w_2k_10_r310iadc_adc0_user_datai3 => i_128w_2k_10_r310iadc_adc0_user_datai3,
      i_128w_2k_10_r310iadc_adc0_user_dataq0 => i_128w_2k_10_r310iadc_adc0_user_dataq0,
      i_128w_2k_10_r310iadc_adc0_user_dataq1 => i_128w_2k_10_r310iadc_adc0_user_dataq1,
      i_128w_2k_10_r310iadc_adc0_user_dataq2 => i_128w_2k_10_r310iadc_adc0_user_dataq2,
      i_128w_2k_10_r310iadc_adc0_user_dataq3 => i_128w_2k_10_r310iadc_adc0_user_dataq3,
      i_128w_2k_10_r310iadc_adc0_user_outofrangei0 => i_128w_2k_10_r310iadc_adc0_user_outofrangei0,
      i_128w_2k_10_r310iadc_adc0_user_outofrangei1 => i_128w_2k_10_r310iadc_adc0_user_outofrangei1,
      i_128w_2k_10_r310iadc_adc0_user_outofrangeq0 => i_128w_2k_10_r310iadc_adc0_user_outofrangeq0,
      i_128w_2k_10_r310iadc_adc0_user_outofrangeq1 => i_128w_2k_10_r310iadc_adc0_user_outofrangeq1,
      i_128w_2k_10_r310iadc_adc0_user_sync0 => i_128w_2k_10_r310iadc_adc0_user_sync0,
      i_128w_2k_10_r310iadc_adc0_user_sync1 => i_128w_2k_10_r310iadc_adc0_user_sync1,
      i_128w_2k_10_r310iadc_adc0_user_sync2 => i_128w_2k_10_r310iadc_adc0_user_sync2,
      i_128w_2k_10_r310iadc_adc0_user_sync3 => i_128w_2k_10_r310iadc_adc0_user_sync3,
      i_128w_2k_10_r310iadc_adc1_user_data_valid => i_128w_2k_10_r310iadc_adc1_user_data_valid,
      i_128w_2k_10_r310iadc_adc1_user_datai0 => i_128w_2k_10_r310iadc_adc1_user_datai0,
      i_128w_2k_10_r310iadc_adc1_user_datai1 => i_128w_2k_10_r310iadc_adc1_user_datai1,
      i_128w_2k_10_r310iadc_adc1_user_datai2 => i_128w_2k_10_r310iadc_adc1_user_datai2,
      i_128w_2k_10_r310iadc_adc1_user_datai3 => i_128w_2k_10_r310iadc_adc1_user_datai3,
      i_128w_2k_10_r310iadc_adc1_user_dataq0 => i_128w_2k_10_r310iadc_adc1_user_dataq0,
      i_128w_2k_10_r310iadc_adc1_user_dataq1 => i_128w_2k_10_r310iadc_adc1_user_dataq1,
      i_128w_2k_10_r310iadc_adc1_user_dataq2 => i_128w_2k_10_r310iadc_adc1_user_dataq2,
      i_128w_2k_10_r310iadc_adc1_user_dataq3 => i_128w_2k_10_r310iadc_adc1_user_dataq3,
      i_128w_2k_10_r310iadc_adc1_user_outofrangei0 => i_128w_2k_10_r310iadc_adc1_user_outofrangei0,
      i_128w_2k_10_r310iadc_adc1_user_outofrangei1 => i_128w_2k_10_r310iadc_adc1_user_outofrangei1,
      i_128w_2k_10_r310iadc_adc1_user_outofrangeq0 => i_128w_2k_10_r310iadc_adc1_user_outofrangeq0,
      i_128w_2k_10_r310iadc_adc1_user_outofrangeq1 => i_128w_2k_10_r310iadc_adc1_user_outofrangeq1,
      i_128w_2k_10_r310iadc_adc1_user_sync0 => i_128w_2k_10_r310iadc_adc1_user_sync0,
      i_128w_2k_10_r310iadc_adc1_user_sync1 => i_128w_2k_10_r310iadc_adc1_user_sync1,
      i_128w_2k_10_r310iadc_adc1_user_sync2 => i_128w_2k_10_r310iadc_adc1_user_sync2,
      i_128w_2k_10_r310iadc_adc1_user_sync3 => i_128w_2k_10_r310iadc_adc1_user_sync3,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we,
      i_128w_2k_10_r310iadc_gpio_gateway => i_128w_2k_10_r310iadc_gpio_gateway,
      i_128w_2k_10_r310iadc_led1_arm_gateway => i_128w_2k_10_r310iadc_led1_arm_gateway,
      i_128w_2k_10_r310iadc_led2_sync_gateway => i_128w_2k_10_r310iadc_led2_sync_gateway,
      i_128w_2k_10_r310iadc_led4_eq_clip_gateway => i_128w_2k_10_r310iadc_led4_eq_clip_gateway,
      i_128w_2k_10_r310iadc_led5_adc_clip_gateway => i_128w_2k_10_r310iadc_led5_adc_clip_gateway,
      i_128w_2k_10_r310iadc_led6_link_dn_gateway => i_128w_2k_10_r310iadc_led6_link_dn_gateway,
      i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway => i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway
    );

end architecture STRUCTURE;

