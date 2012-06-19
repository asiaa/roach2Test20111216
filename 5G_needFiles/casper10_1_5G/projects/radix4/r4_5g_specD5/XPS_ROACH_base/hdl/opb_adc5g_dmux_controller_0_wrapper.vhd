-------------------------------------------------------------------------------
-- opb_adc5g_dmux_controller_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library opb_adc5g_dmux_controller_v1_00_a;
use opb_adc5g_dmux_controller_v1_00_a.all;

entity opb_adc5g_dmux_controller_0_wrapper is
  port (
    OPB_Clk : in std_logic;
    OPB_Rst : in std_logic;
    Sl_DBus : out std_logic_vector(0 to 31);
    Sl_errAck : out std_logic;
    Sl_retry : out std_logic;
    Sl_toutSup : out std_logic;
    Sl_xferAck : out std_logic;
    OPB_ABus : in std_logic_vector(0 to 31);
    OPB_BE : in std_logic_vector(0 to 3);
    OPB_DBus : in std_logic_vector(0 to 31);
    OPB_RNW : in std_logic;
    OPB_select : in std_logic;
    OPB_seqAddr : in std_logic;
    adc0_adc3wire_clk : out std_logic;
    adc0_adc3wire_data : out std_logic;
    adc0_adc3wire_spi_rst : out std_logic;
    adc0_modepin : out std_logic;
    adc0_dcm_reset : out std_logic;
    adc0_psclk : out std_logic;
    adc0_psen : out std_logic;
    adc0_psincdec : out std_logic;
    adc0_psdone : in std_logic;
    adc0_clk : in std_logic;
    adc1_adc3wire_clk : out std_logic;
    adc1_adc3wire_data : out std_logic;
    adc1_adc3wire_spi_rst : out std_logic;
    adc1_modepin : out std_logic;
    adc1_dcm_reset : out std_logic;
    adc1_psclk : out std_logic;
    adc1_psen : out std_logic;
    adc1_psincdec : out std_logic;
    adc1_psdone : in std_logic;
    adc1_clk : in std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of opb_adc5g_dmux_controller_0_wrapper : entity is "opb_adc5g_dmux_controller_v1_00_a";

end opb_adc5g_dmux_controller_0_wrapper;

architecture STRUCTURE of opb_adc5g_dmux_controller_0_wrapper is

  component opb_adc5g_dmux_controller is
    generic (
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_OPB_AWIDTH : INTEGER;
      C_OPB_DWIDTH : INTEGER;
      C_FAMILY : STRING;
      INTERLEAVED_0 : INTEGER;
      INTERLEAVED_1 : INTEGER;
      AUTOCONFIG_0 : INTEGER;
      AUTOCONFIG_1 : INTEGER
    );
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to (C_OPB_DWIDTH-1));
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to (C_OPB_AWIDTH-1));
      OPB_BE : in std_logic_vector(0 to ((C_OPB_DWIDTH/8)-1));
      OPB_DBus : in std_logic_vector(0 to (C_OPB_DWIDTH-1));
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      adc0_adc3wire_clk : out std_logic;
      adc0_adc3wire_data : out std_logic;
      adc0_adc3wire_spi_rst : out std_logic;
      adc0_modepin : out std_logic;
      adc0_dcm_reset : out std_logic;
      adc0_psclk : out std_logic;
      adc0_psen : out std_logic;
      adc0_psincdec : out std_logic;
      adc0_psdone : in std_logic;
      adc0_clk : in std_logic;
      adc1_adc3wire_clk : out std_logic;
      adc1_adc3wire_data : out std_logic;
      adc1_adc3wire_spi_rst : out std_logic;
      adc1_modepin : out std_logic;
      adc1_dcm_reset : out std_logic;
      adc1_psclk : out std_logic;
      adc1_psen : out std_logic;
      adc1_psincdec : out std_logic;
      adc1_psdone : in std_logic;
      adc1_clk : in std_logic
    );
  end component;

begin

  opb_adc5g_dmux_controller_0 : opb_adc5g_dmux_controller
    generic map (
      C_BASEADDR => X"00020000",
      C_HIGHADDR => X"0002ffff",
      C_OPB_AWIDTH => 32,
      C_OPB_DWIDTH => 32,
      C_FAMILY => "virtex5",
      INTERLEAVED_0 => 0,
      INTERLEAVED_1 => 0,
      AUTOCONFIG_0 => 0,
      AUTOCONFIG_1 => 0
    )
    port map (
      OPB_Clk => OPB_Clk,
      OPB_Rst => OPB_Rst,
      Sl_DBus => Sl_DBus,
      Sl_errAck => Sl_errAck,
      Sl_retry => Sl_retry,
      Sl_toutSup => Sl_toutSup,
      Sl_xferAck => Sl_xferAck,
      OPB_ABus => OPB_ABus,
      OPB_BE => OPB_BE,
      OPB_DBus => OPB_DBus,
      OPB_RNW => OPB_RNW,
      OPB_select => OPB_select,
      OPB_seqAddr => OPB_seqAddr,
      adc0_adc3wire_clk => adc0_adc3wire_clk,
      adc0_adc3wire_data => adc0_adc3wire_data,
      adc0_adc3wire_spi_rst => adc0_adc3wire_spi_rst,
      adc0_modepin => adc0_modepin,
      adc0_dcm_reset => adc0_dcm_reset,
      adc0_psclk => adc0_psclk,
      adc0_psen => adc0_psen,
      adc0_psincdec => adc0_psincdec,
      adc0_psdone => adc0_psdone,
      adc0_clk => adc0_clk,
      adc1_adc3wire_clk => adc1_adc3wire_clk,
      adc1_adc3wire_data => adc1_adc3wire_data,
      adc1_adc3wire_spi_rst => adc1_adc3wire_spi_rst,
      adc1_modepin => adc1_modepin,
      adc1_dcm_reset => adc1_dcm_reset,
      adc1_psclk => adc1_psclk,
      adc1_psen => adc1_psen,
      adc1_psincdec => adc1_psincdec,
      adc1_psdone => adc1_psdone,
      adc1_clk => adc1_clk
    );

end architecture STRUCTURE;

