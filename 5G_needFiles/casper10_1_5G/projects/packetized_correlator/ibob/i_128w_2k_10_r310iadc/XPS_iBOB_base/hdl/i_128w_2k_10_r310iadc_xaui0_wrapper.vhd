-------------------------------------------------------------------------------
-- i_128w_2k_10_r310iadc_xaui0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library XAUI_interface_v1_00_a;
use XAUI_interface_v1_00_a.all;

entity i_128w_2k_10_r310iadc_xaui0_wrapper is
  port (
    app_clk : in std_logic;
    rx_data : out std_logic_vector(63 downto 0);
    rx_outofband : out std_logic_vector(7 downto 0);
    rx_get : in std_logic;
    rx_almost_full : out std_logic;
    rx_empty : out std_logic;
    rx_reset : in std_logic;
    rx_linkdown : out std_logic;
    rx_valid : out std_logic;
    tx_data : in std_logic_vector(63 downto 0);
    tx_outofband : in std_logic_vector(7 downto 0);
    tx_valid : in std_logic;
    tx_full : out std_logic;
    mgt_tx_l0_p : out std_logic;
    mgt_tx_l0_n : out std_logic;
    mgt_tx_l1_p : out std_logic;
    mgt_tx_l1_n : out std_logic;
    mgt_tx_l2_p : out std_logic;
    mgt_tx_l2_n : out std_logic;
    mgt_tx_l3_p : out std_logic;
    mgt_tx_l3_n : out std_logic;
    mgt_rx_l0_p : in std_logic;
    mgt_rx_l0_n : in std_logic;
    mgt_rx_l1_p : in std_logic;
    mgt_rx_l1_n : in std_logic;
    mgt_rx_l2_p : in std_logic;
    mgt_rx_l2_n : in std_logic;
    mgt_rx_l3_p : in std_logic;
    mgt_rx_l3_n : in std_logic;
    mgt_clk : in std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of i_128w_2k_10_r310iadc_xaui0_wrapper : entity is "XAUI_interface_v1_00_a";

end i_128w_2k_10_r310iadc_xaui0_wrapper;

architecture STRUCTURE of i_128w_2k_10_r310iadc_xaui0_wrapper is

  component xaui_interface is
    generic (
      DEMUX : integer
    );
    port (
      app_clk : in std_logic;
      rx_data : out std_logic_vector((64/DEMUX - 1) downto 0);
      rx_outofband : out std_logic_vector(( 8/DEMUX - 1) downto 0);
      rx_get : in std_logic;
      rx_almost_full : out std_logic;
      rx_empty : out std_logic;
      rx_reset : in std_logic;
      rx_linkdown : out std_logic;
      rx_valid : out std_logic;
      tx_data : in std_logic_vector((64/DEMUX - 1) downto 0);
      tx_outofband : in std_logic_vector(( 8/DEMUX - 1) downto 0);
      tx_valid : in std_logic;
      tx_full : out std_logic;
      mgt_tx_l0_p : out std_logic;
      mgt_tx_l0_n : out std_logic;
      mgt_tx_l1_p : out std_logic;
      mgt_tx_l1_n : out std_logic;
      mgt_tx_l2_p : out std_logic;
      mgt_tx_l2_n : out std_logic;
      mgt_tx_l3_p : out std_logic;
      mgt_tx_l3_n : out std_logic;
      mgt_rx_l0_p : in std_logic;
      mgt_rx_l0_n : in std_logic;
      mgt_rx_l1_p : in std_logic;
      mgt_rx_l1_n : in std_logic;
      mgt_rx_l2_p : in std_logic;
      mgt_rx_l2_n : in std_logic;
      mgt_rx_l3_p : in std_logic;
      mgt_rx_l3_n : in std_logic;
      mgt_clk : in std_logic
    );
  end component;

begin

  i_128w_2k_10_r310iadc_XAUI0 : xaui_interface
    generic map (
      DEMUX => 1
    )
    port map (
      app_clk => app_clk,
      rx_data => rx_data,
      rx_outofband => rx_outofband,
      rx_get => rx_get,
      rx_almost_full => rx_almost_full,
      rx_empty => rx_empty,
      rx_reset => rx_reset,
      rx_linkdown => rx_linkdown,
      rx_valid => rx_valid,
      tx_data => tx_data,
      tx_outofband => tx_outofband,
      tx_valid => tx_valid,
      tx_full => tx_full,
      mgt_tx_l0_p => mgt_tx_l0_p,
      mgt_tx_l0_n => mgt_tx_l0_n,
      mgt_tx_l1_p => mgt_tx_l1_p,
      mgt_tx_l1_n => mgt_tx_l1_n,
      mgt_tx_l2_p => mgt_tx_l2_p,
      mgt_tx_l2_n => mgt_tx_l2_n,
      mgt_tx_l3_p => mgt_tx_l3_p,
      mgt_tx_l3_n => mgt_tx_l3_n,
      mgt_rx_l0_p => mgt_rx_l0_p,
      mgt_rx_l0_n => mgt_rx_l0_n,
      mgt_rx_l1_p => mgt_rx_l1_p,
      mgt_rx_l1_n => mgt_rx_l1_n,
      mgt_rx_l2_p => mgt_rx_l2_p,
      mgt_rx_l2_n => mgt_rx_l2_n,
      mgt_rx_l3_p => mgt_rx_l3_p,
      mgt_rx_l3_n => mgt_rx_l3_n,
      mgt_clk => mgt_clk
    );

end architecture STRUCTURE;

