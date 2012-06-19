-------------------------------------------------------------------------------
-- r4_iadc_spec_sync_cnt_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library opb_register_simulink2ppc_v1_00_a;
use opb_register_simulink2ppc_v1_00_a.all;

entity r4_iadc_spec_sync_cnt_wrapper is
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
    user_data_in : in std_logic_vector(31 downto 0);
    user_clk : in std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of r4_iadc_spec_sync_cnt_wrapper : entity is "opb_register_simulink2ppc_v1_00_a";

end r4_iadc_spec_sync_cnt_wrapper;

architecture STRUCTURE of r4_iadc_spec_sync_cnt_wrapper is

  component opb_register_simulink2ppc is
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
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

begin

  r4_iadc_spec_sync_cnt : opb_register_simulink2ppc
    generic map (
      C_BASEADDR => X"0100A100",
      C_HIGHADDR => X"0100A1FF",
      C_OPB_AWIDTH => 32,
      C_OPB_DWIDTH => 32,
      C_FAMILY => "virtex5"
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
      user_data_in => user_data_in,
      user_clk => user_clk
    );

end architecture STRUCTURE;

