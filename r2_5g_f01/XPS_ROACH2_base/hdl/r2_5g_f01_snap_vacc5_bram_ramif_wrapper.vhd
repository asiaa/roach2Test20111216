-------------------------------------------------------------------------------
-- r2_5g_f01_snap_vacc5_bram_ramif_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library bram_if_v1_00_a;
use bram_if_v1_00_a.all;

entity r2_5g_f01_snap_vacc5_bram_ramif_wrapper is
  port (
    bram_rst : out std_logic;
    bram_clk : out std_logic;
    bram_en : out std_logic;
    bram_wen : out std_logic_vector(0 to 3);
    bram_addr : out std_logic_vector(0 to 31);
    bram_din : in std_logic_vector(0 to 31);
    bram_dout : out std_logic_vector(0 to 31);
    clk_in : in std_logic;
    addr : in std_logic_vector(10 downto 0);
    data_in : in std_logic_vector(31 downto 0);
    data_out : out std_logic_vector(31 downto 0);
    we : in std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of r2_5g_f01_snap_vacc5_bram_ramif_wrapper : entity is "bram_if_v1_00_a";

end r2_5g_f01_snap_vacc5_bram_ramif_wrapper;

architecture STRUCTURE of r2_5g_f01_snap_vacc5_bram_ramif_wrapper is

  component bram_if is
    generic (
      ADDR_SIZE : INTEGER
    );
    port (
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31);
      clk_in : in std_logic;
      addr : in std_logic_vector((ADDR_SIZE-1) downto 0);
      data_in : in std_logic_vector(31 downto 0);
      data_out : out std_logic_vector(31 downto 0);
      we : in std_logic
    );
  end component;

begin

  r2_5g_f01_snap_vacc5_bram_ramif : bram_if
    generic map (
      ADDR_SIZE => 11
    )
    port map (
      bram_rst => bram_rst,
      bram_clk => bram_clk,
      bram_en => bram_en,
      bram_wen => bram_wen,
      bram_addr => bram_addr,
      bram_din => bram_din,
      bram_dout => bram_dout,
      clk_in => clk_in,
      addr => addr,
      data_in => data_in,
      data_out => data_out,
      we => we
    );

end architecture STRUCTURE;
