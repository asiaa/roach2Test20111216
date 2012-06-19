-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    bref_clk_bottom_p : in std_logic;
    bref_clk_bottom_n : in std_logic;
    adc0_adc3wire_clk : out std_logic;
    adc0_adc3wire_data : out std_logic;
    adc0_adc3wire_strobe : out std_logic;
    adc0_modepin : out std_logic;
    adc1_adc3wire_clk : out std_logic;
    adc1_adc3wire_data : out std_logic;
    adc1_adc3wire_strobe : out std_logic;
    adc1_modepin : out std_logic;
    rs232_rtsN : out std_logic;
    rs232_rx : in std_logic;
    rs232_tx : out std_logic;
    reset_n : in std_logic;
    sysclk_p : in std_logic;
    sysclk_m : in std_logic;
    phy_slew : out std_logic_vector(1 downto 0);
    phy_reset_n : out std_logic;
    XAUI1_tx_l0_p : out std_logic;
    XAUI1_tx_l0_n : out std_logic;
    XAUI1_tx_l1_p : out std_logic;
    XAUI1_tx_l1_n : out std_logic;
    XAUI1_tx_l2_p : out std_logic;
    XAUI1_tx_l2_n : out std_logic;
    XAUI1_tx_l3_p : out std_logic;
    XAUI1_tx_l3_n : out std_logic;
    XAUI1_rx_l0_p : in std_logic;
    XAUI1_rx_l0_n : in std_logic;
    XAUI1_rx_l1_p : in std_logic;
    XAUI1_rx_l1_n : in std_logic;
    XAUI1_rx_l2_p : in std_logic;
    XAUI1_rx_l2_n : in std_logic;
    XAUI1_rx_l3_p : in std_logic;
    XAUI1_rx_l3_n : in std_logic;
    adc0clk_p : in std_logic;
    adc0clk_n : in std_logic;
    adc0sync_p : in std_logic;
    adc0sync_n : in std_logic;
    adc0outofrangei_p : in std_logic;
    adc0outofrangei_n : in std_logic;
    adc0outofrangeq_p : in std_logic;
    adc0outofrangeq_n : in std_logic;
    adc0dataeveni_p : in std_logic_vector(7 downto 0);
    adc0dataeveni_n : in std_logic_vector(7 downto 0);
    adc0dataoddi_p : in std_logic_vector(7 downto 0);
    adc0dataoddi_n : in std_logic_vector(7 downto 0);
    adc0dataevenq_p : in std_logic_vector(7 downto 0);
    adc0dataevenq_n : in std_logic_vector(7 downto 0);
    adc0dataoddq_p : in std_logic_vector(7 downto 0);
    adc0dataoddq_n : in std_logic_vector(7 downto 0);
    adc0ddrb_p : out std_logic;
    adc0ddrb_n : out std_logic;
    adc1clk_p : in std_logic;
    adc1clk_n : in std_logic;
    adc1sync_p : in std_logic;
    adc1sync_n : in std_logic;
    adc1outofrangei_p : in std_logic;
    adc1outofrangei_n : in std_logic;
    adc1outofrangeq_p : in std_logic;
    adc1outofrangeq_n : in std_logic;
    adc1dataeveni_p : in std_logic_vector(7 downto 0);
    adc1dataeveni_n : in std_logic_vector(7 downto 0);
    adc1dataoddi_p : in std_logic_vector(7 downto 0);
    adc1dataoddi_n : in std_logic_vector(7 downto 0);
    adc1dataevenq_p : in std_logic_vector(7 downto 0);
    adc1dataevenq_n : in std_logic_vector(7 downto 0);
    adc1dataoddq_p : in std_logic_vector(7 downto 0);
    adc1dataoddq_n : in std_logic_vector(7 downto 0);
    adc1ddrb_p : out std_logic;
    adc1ddrb_n : out std_logic;
    sram0_address : out std_logic_vector(18 downto 0);
    sram0_bw_b : out std_logic_vector(3 downto 0);
    sram0_we_b : out std_logic;
    sram0_adv_ld_b : out std_logic;
    sram0_clk : out std_logic;
    sram0_ce : out std_logic;
    sram0_oe_b : out std_logic;
    sram0_cen_b : out std_logic;
    sram0_dq : inout std_logic_vector(35 downto 0);
    sram0_mode : out std_logic;
    sram0_zz : out std_logic;
    sram1_address : out std_logic_vector(18 downto 0);
    sram1_bw_b : out std_logic_vector(3 downto 0);
    sram1_we_b : out std_logic;
    sram1_adv_ld_b : out std_logic;
    sram1_clk : out std_logic;
    sram1_ce : out std_logic;
    sram1_oe_b : out std_logic;
    sram1_cen_b : out std_logic;
    sram1_dq : inout std_logic_vector(35 downto 0);
    sram1_mode : out std_logic;
    sram1_zz : out std_logic;
    i_128w_2k_10_r310iadc_gpio_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led1_arm_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led2_sync_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led4_eq_clip_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led5_adc_clip_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led6_link_dn_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led7_xaui_overlfow_ext : out std_logic_vector(0 to 0)
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      bref_clk_bottom_p : in std_logic;
      bref_clk_bottom_n : in std_logic;
      adc0_adc3wire_clk : out std_logic;
      adc0_adc3wire_data : out std_logic;
      adc0_adc3wire_strobe : out std_logic;
      adc0_modepin : out std_logic;
      adc1_adc3wire_clk : out std_logic;
      adc1_adc3wire_data : out std_logic;
      adc1_adc3wire_strobe : out std_logic;
      adc1_modepin : out std_logic;
      rs232_rtsN : out std_logic;
      rs232_rx : in std_logic;
      rs232_tx : out std_logic;
      reset_n : in std_logic;
      sysclk_p : in std_logic;
      sysclk_m : in std_logic;
      phy_slew : out std_logic_vector(1 downto 0);
      phy_reset_n : out std_logic;
      XAUI1_tx_l0_p : out std_logic;
      XAUI1_tx_l0_n : out std_logic;
      XAUI1_tx_l1_p : out std_logic;
      XAUI1_tx_l1_n : out std_logic;
      XAUI1_tx_l2_p : out std_logic;
      XAUI1_tx_l2_n : out std_logic;
      XAUI1_tx_l3_p : out std_logic;
      XAUI1_tx_l3_n : out std_logic;
      XAUI1_rx_l0_p : in std_logic;
      XAUI1_rx_l0_n : in std_logic;
      XAUI1_rx_l1_p : in std_logic;
      XAUI1_rx_l1_n : in std_logic;
      XAUI1_rx_l2_p : in std_logic;
      XAUI1_rx_l2_n : in std_logic;
      XAUI1_rx_l3_p : in std_logic;
      XAUI1_rx_l3_n : in std_logic;
      adc0clk_p : in std_logic;
      adc0clk_n : in std_logic;
      adc0sync_p : in std_logic;
      adc0sync_n : in std_logic;
      adc0outofrangei_p : in std_logic;
      adc0outofrangei_n : in std_logic;
      adc0outofrangeq_p : in std_logic;
      adc0outofrangeq_n : in std_logic;
      adc0dataeveni_p : in std_logic_vector(7 downto 0);
      adc0dataeveni_n : in std_logic_vector(7 downto 0);
      adc0dataoddi_p : in std_logic_vector(7 downto 0);
      adc0dataoddi_n : in std_logic_vector(7 downto 0);
      adc0dataevenq_p : in std_logic_vector(7 downto 0);
      adc0dataevenq_n : in std_logic_vector(7 downto 0);
      adc0dataoddq_p : in std_logic_vector(7 downto 0);
      adc0dataoddq_n : in std_logic_vector(7 downto 0);
      adc0ddrb_p : out std_logic;
      adc0ddrb_n : out std_logic;
      adc1clk_p : in std_logic;
      adc1clk_n : in std_logic;
      adc1sync_p : in std_logic;
      adc1sync_n : in std_logic;
      adc1outofrangei_p : in std_logic;
      adc1outofrangei_n : in std_logic;
      adc1outofrangeq_p : in std_logic;
      adc1outofrangeq_n : in std_logic;
      adc1dataeveni_p : in std_logic_vector(7 downto 0);
      adc1dataeveni_n : in std_logic_vector(7 downto 0);
      adc1dataoddi_p : in std_logic_vector(7 downto 0);
      adc1dataoddi_n : in std_logic_vector(7 downto 0);
      adc1dataevenq_p : in std_logic_vector(7 downto 0);
      adc1dataevenq_n : in std_logic_vector(7 downto 0);
      adc1dataoddq_p : in std_logic_vector(7 downto 0);
      adc1dataoddq_n : in std_logic_vector(7 downto 0);
      adc1ddrb_p : out std_logic;
      adc1ddrb_n : out std_logic;
      sram0_address : out std_logic_vector(18 downto 0);
      sram0_bw_b : out std_logic_vector(3 downto 0);
      sram0_we_b : out std_logic;
      sram0_adv_ld_b : out std_logic;
      sram0_clk : out std_logic;
      sram0_ce : out std_logic;
      sram0_oe_b : out std_logic;
      sram0_cen_b : out std_logic;
      sram0_dq : inout std_logic_vector(35 downto 0);
      sram0_mode : out std_logic;
      sram0_zz : out std_logic;
      sram1_address : out std_logic_vector(18 downto 0);
      sram1_bw_b : out std_logic_vector(3 downto 0);
      sram1_we_b : out std_logic;
      sram1_adv_ld_b : out std_logic;
      sram1_clk : out std_logic;
      sram1_ce : out std_logic;
      sram1_oe_b : out std_logic;
      sram1_cen_b : out std_logic;
      sram1_dq : inout std_logic_vector(35 downto 0);
      sram1_mode : out std_logic;
      sram1_zz : out std_logic;
      i_128w_2k_10_r310iadc_gpio_ext : out std_logic_vector(0 to 0);
      i_128w_2k_10_r310iadc_led1_arm_ext : out std_logic_vector(0 to 0);
      i_128w_2k_10_r310iadc_led2_sync_ext : out std_logic_vector(0 to 0);
      i_128w_2k_10_r310iadc_led4_eq_clip_ext : out std_logic_vector(0 to 0);
      i_128w_2k_10_r310iadc_led5_adc_clip_ext : out std_logic_vector(0 to 0);
      i_128w_2k_10_r310iadc_led6_link_dn_ext : out std_logic_vector(0 to 0);
      i_128w_2k_10_r310iadc_led7_xaui_overlfow_ext : out std_logic_vector(0 to 0)
    );
  end component;

begin

  system_i : system
    port map (
      bref_clk_bottom_p => bref_clk_bottom_p,
      bref_clk_bottom_n => bref_clk_bottom_n,
      adc0_adc3wire_clk => adc0_adc3wire_clk,
      adc0_adc3wire_data => adc0_adc3wire_data,
      adc0_adc3wire_strobe => adc0_adc3wire_strobe,
      adc0_modepin => adc0_modepin,
      adc1_adc3wire_clk => adc1_adc3wire_clk,
      adc1_adc3wire_data => adc1_adc3wire_data,
      adc1_adc3wire_strobe => adc1_adc3wire_strobe,
      adc1_modepin => adc1_modepin,
      rs232_rtsN => rs232_rtsN,
      rs232_rx => rs232_rx,
      rs232_tx => rs232_tx,
      reset_n => reset_n,
      sysclk_p => sysclk_p,
      sysclk_m => sysclk_m,
      phy_slew => phy_slew,
      phy_reset_n => phy_reset_n,
      XAUI1_tx_l0_p => XAUI1_tx_l0_p,
      XAUI1_tx_l0_n => XAUI1_tx_l0_n,
      XAUI1_tx_l1_p => XAUI1_tx_l1_p,
      XAUI1_tx_l1_n => XAUI1_tx_l1_n,
      XAUI1_tx_l2_p => XAUI1_tx_l2_p,
      XAUI1_tx_l2_n => XAUI1_tx_l2_n,
      XAUI1_tx_l3_p => XAUI1_tx_l3_p,
      XAUI1_tx_l3_n => XAUI1_tx_l3_n,
      XAUI1_rx_l0_p => XAUI1_rx_l0_p,
      XAUI1_rx_l0_n => XAUI1_rx_l0_n,
      XAUI1_rx_l1_p => XAUI1_rx_l1_p,
      XAUI1_rx_l1_n => XAUI1_rx_l1_n,
      XAUI1_rx_l2_p => XAUI1_rx_l2_p,
      XAUI1_rx_l2_n => XAUI1_rx_l2_n,
      XAUI1_rx_l3_p => XAUI1_rx_l3_p,
      XAUI1_rx_l3_n => XAUI1_rx_l3_n,
      adc0clk_p => adc0clk_p,
      adc0clk_n => adc0clk_n,
      adc0sync_p => adc0sync_p,
      adc0sync_n => adc0sync_n,
      adc0outofrangei_p => adc0outofrangei_p,
      adc0outofrangei_n => adc0outofrangei_n,
      adc0outofrangeq_p => adc0outofrangeq_p,
      adc0outofrangeq_n => adc0outofrangeq_n,
      adc0dataeveni_p => adc0dataeveni_p,
      adc0dataeveni_n => adc0dataeveni_n,
      adc0dataoddi_p => adc0dataoddi_p,
      adc0dataoddi_n => adc0dataoddi_n,
      adc0dataevenq_p => adc0dataevenq_p,
      adc0dataevenq_n => adc0dataevenq_n,
      adc0dataoddq_p => adc0dataoddq_p,
      adc0dataoddq_n => adc0dataoddq_n,
      adc0ddrb_p => adc0ddrb_p,
      adc0ddrb_n => adc0ddrb_n,
      adc1clk_p => adc1clk_p,
      adc1clk_n => adc1clk_n,
      adc1sync_p => adc1sync_p,
      adc1sync_n => adc1sync_n,
      adc1outofrangei_p => adc1outofrangei_p,
      adc1outofrangei_n => adc1outofrangei_n,
      adc1outofrangeq_p => adc1outofrangeq_p,
      adc1outofrangeq_n => adc1outofrangeq_n,
      adc1dataeveni_p => adc1dataeveni_p,
      adc1dataeveni_n => adc1dataeveni_n,
      adc1dataoddi_p => adc1dataoddi_p,
      adc1dataoddi_n => adc1dataoddi_n,
      adc1dataevenq_p => adc1dataevenq_p,
      adc1dataevenq_n => adc1dataevenq_n,
      adc1dataoddq_p => adc1dataoddq_p,
      adc1dataoddq_n => adc1dataoddq_n,
      adc1ddrb_p => adc1ddrb_p,
      adc1ddrb_n => adc1ddrb_n,
      sram0_address => sram0_address,
      sram0_bw_b => sram0_bw_b,
      sram0_we_b => sram0_we_b,
      sram0_adv_ld_b => sram0_adv_ld_b,
      sram0_clk => sram0_clk,
      sram0_ce => sram0_ce,
      sram0_oe_b => sram0_oe_b,
      sram0_cen_b => sram0_cen_b,
      sram0_dq => sram0_dq,
      sram0_mode => sram0_mode,
      sram0_zz => sram0_zz,
      sram1_address => sram1_address,
      sram1_bw_b => sram1_bw_b,
      sram1_we_b => sram1_we_b,
      sram1_adv_ld_b => sram1_adv_ld_b,
      sram1_clk => sram1_clk,
      sram1_ce => sram1_ce,
      sram1_oe_b => sram1_oe_b,
      sram1_cen_b => sram1_cen_b,
      sram1_dq => sram1_dq,
      sram1_mode => sram1_mode,
      sram1_zz => sram1_zz,
      i_128w_2k_10_r310iadc_gpio_ext => i_128w_2k_10_r310iadc_gpio_ext(0 to 0),
      i_128w_2k_10_r310iadc_led1_arm_ext => i_128w_2k_10_r310iadc_led1_arm_ext(0 to 0),
      i_128w_2k_10_r310iadc_led2_sync_ext => i_128w_2k_10_r310iadc_led2_sync_ext(0 to 0),
      i_128w_2k_10_r310iadc_led4_eq_clip_ext => i_128w_2k_10_r310iadc_led4_eq_clip_ext(0 to 0),
      i_128w_2k_10_r310iadc_led5_adc_clip_ext => i_128w_2k_10_r310iadc_led5_adc_clip_ext(0 to 0),
      i_128w_2k_10_r310iadc_led6_link_dn_ext => i_128w_2k_10_r310iadc_led6_link_dn_ext(0 to 0),
      i_128w_2k_10_r310iadc_led7_xaui_overlfow_ext => i_128w_2k_10_r310iadc_led7_xaui_overlfow_ext(0 to 0)
    );

end architecture STRUCTURE;

