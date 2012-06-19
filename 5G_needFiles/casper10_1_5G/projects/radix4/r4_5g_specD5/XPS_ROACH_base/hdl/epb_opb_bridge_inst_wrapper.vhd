-------------------------------------------------------------------------------
-- epb_opb_bridge_inst_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity epb_opb_bridge_inst_wrapper is
  port (
    sys_reset : in std_logic;
    epb_data_oe_n : out std_logic;
    epb_cs_n : in std_logic;
    epb_oe_n : in std_logic;
    epb_r_w_n : in std_logic;
    epb_be_n : in std_logic_vector(1 downto 0);
    epb_addr : in std_logic_vector(22 downto 0);
    epb_addr_gp : in std_logic_vector(5 downto 0);
    epb_data_i : in std_logic_vector(15 downto 0);
    epb_data_o : out std_logic_vector(15 downto 0);
    epb_rdy : out std_logic;
    epb_rdy_oe : out std_logic;
    OPB_Clk : in std_logic;
    OPB_Rst : in std_logic;
    M_request : out std_logic;
    M_busLock : out std_logic;
    M_select : out std_logic;
    M_RNW : out std_logic;
    M_BE : out std_logic_vector(0 to 3);
    M_seqAddr : out std_logic;
    M_DBus : out std_logic_vector(0 to 31);
    M_ABus : out std_logic_vector(0 to 31);
    OPB_MGrant : in std_logic;
    OPB_xferAck : in std_logic;
    OPB_errAck : in std_logic;
    OPB_retry : in std_logic;
    OPB_timeout : in std_logic;
    OPB_DBus : in std_logic_vector(0 to 31)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of epb_opb_bridge_inst_wrapper : entity is "epb_opb_bridge_v1_00_a";

end epb_opb_bridge_inst_wrapper;

architecture STRUCTURE of epb_opb_bridge_inst_wrapper is

  component epb_opb_bridge is
    port (
      sys_reset : in std_logic;
      epb_data_oe_n : out std_logic;
      epb_cs_n : in std_logic;
      epb_oe_n : in std_logic;
      epb_r_w_n : in std_logic;
      epb_be_n : in std_logic_vector(1 downto 0);
      epb_addr : in std_logic_vector(22 downto 0);
      epb_addr_gp : in std_logic_vector(5 downto 0);
      epb_data_i : in std_logic_vector(15 downto 0);
      epb_data_o : out std_logic_vector(15 downto 0);
      epb_rdy : out std_logic;
      epb_rdy_oe : out std_logic;
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      M_request : out std_logic;
      M_busLock : out std_logic;
      M_select : out std_logic;
      M_RNW : out std_logic;
      M_BE : out std_logic_vector(0 to 3);
      M_seqAddr : out std_logic;
      M_DBus : out std_logic_vector(0 to 31);
      M_ABus : out std_logic_vector(0 to 31);
      OPB_MGrant : in std_logic;
      OPB_xferAck : in std_logic;
      OPB_errAck : in std_logic;
      OPB_retry : in std_logic;
      OPB_timeout : in std_logic;
      OPB_DBus : in std_logic_vector(0 to 31)
    );
  end component;

begin

  epb_opb_bridge_inst : epb_opb_bridge
    port map (
      sys_reset => sys_reset,
      epb_data_oe_n => epb_data_oe_n,
      epb_cs_n => epb_cs_n,
      epb_oe_n => epb_oe_n,
      epb_r_w_n => epb_r_w_n,
      epb_be_n => epb_be_n,
      epb_addr => epb_addr,
      epb_addr_gp => epb_addr_gp,
      epb_data_i => epb_data_i,
      epb_data_o => epb_data_o,
      epb_rdy => epb_rdy,
      epb_rdy_oe => epb_rdy_oe,
      OPB_Clk => OPB_Clk,
      OPB_Rst => OPB_Rst,
      M_request => M_request,
      M_busLock => M_busLock,
      M_select => M_select,
      M_RNW => M_RNW,
      M_BE => M_BE,
      M_seqAddr => M_seqAddr,
      M_DBus => M_DBus,
      M_ABus => M_ABus,
      OPB_MGrant => OPB_MGrant,
      OPB_xferAck => OPB_xferAck,
      OPB_errAck => OPB_errAck,
      OPB_retry => OPB_retry,
      OPB_timeout => OPB_timeout,
      OPB_DBus => OPB_DBus
    );

end architecture STRUCTURE;

