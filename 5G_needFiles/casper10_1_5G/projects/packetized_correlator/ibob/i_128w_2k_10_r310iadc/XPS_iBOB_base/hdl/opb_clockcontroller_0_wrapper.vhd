-------------------------------------------------------------------------------
-- opb_clockcontroller_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library opb_clockcontroller_v1_00_a;
use opb_clockcontroller_v1_00_a.all;

entity opb_clockcontroller_0_wrapper is
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
    clk_clk : in std_logic;
    clk_psclk : out std_logic;
    clk_psen : out std_logic;
    clk_psincdec : out std_logic;
    clk_reset : out std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of opb_clockcontroller_0_wrapper : entity is "opb_clockcontroller_v1_00_a";

end opb_clockcontroller_0_wrapper;

architecture STRUCTURE of opb_clockcontroller_0_wrapper is

  component opb_clockcontroller is
    generic (
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_OPB_AWIDTH : INTEGER;
      C_OPB_DWIDTH : INTEGER;
      C_FAMILY : STRING
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
      clk_clk : in std_logic;
      clk_psclk : out std_logic;
      clk_psen : out std_logic;
      clk_psincdec : out std_logic;
      clk_reset : out std_logic
    );
  end component;

begin

  opb_clockcontroller_0 : opb_clockcontroller
    generic map (
      C_BASEADDR => X"d0ffdd00",
      C_HIGHADDR => X"d0ffddff",
      C_OPB_AWIDTH => 32,
      C_OPB_DWIDTH => 32,
      C_FAMILY => "virtex2p"
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
      clk_clk => clk_clk,
      clk_psclk => clk_psclk,
      clk_psen => clk_psen,
      clk_psincdec => clk_psincdec,
      clk_reset => clk_reset
    );

end architecture STRUCTURE;

