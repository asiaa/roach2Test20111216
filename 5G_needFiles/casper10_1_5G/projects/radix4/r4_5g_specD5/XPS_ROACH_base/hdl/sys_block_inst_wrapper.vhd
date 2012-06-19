-------------------------------------------------------------------------------
-- sys_block_inst_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity sys_block_inst_wrapper is
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
    soft_reset : out std_logic;
    irq_n : out std_logic;
    app_irq : in std_logic_vector(15 downto 0);
    fab_clk : in std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of sys_block_inst_wrapper : entity is "sys_block_v1_00_a";

end sys_block_inst_wrapper;

architecture STRUCTURE of sys_block_inst_wrapper is

  component sys_block is
    generic (
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_OPB_AWIDTH : INTEGER;
      C_OPB_DWIDTH : INTEGER;
      BOARD_ID : INTEGER;
      REV_MAJOR : INTEGER;
      REV_MINOR : INTEGER;
      REV_RCS : INTEGER;
      RCS_UPTODATE : INTEGER
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
      soft_reset : out std_logic;
      irq_n : out std_logic;
      app_irq : in std_logic_vector(15 downto 0);
      fab_clk : in std_logic
    );
  end component;

begin

  sys_block_inst : sys_block
    generic map (
      C_BASEADDR => X"00000000",
      C_HIGHADDR => X"0000FFFF",
      C_OPB_AWIDTH => 32,
      C_OPB_DWIDTH => 32,
      BOARD_ID => 16#B00B#,
      REV_MAJOR => 16#1#,
      REV_MINOR => 16#0#,
      REV_RCS => 16#0#,
      RCS_UPTODATE => 16#0#
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
      soft_reset => soft_reset,
      irq_n => irq_n,
      app_irq => app_irq,
      fab_clk => fab_clk
    );

end architecture STRUCTURE;

