-------------------------------------------------------------------------------
-- diffclk_buf_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library diffclk_buf_v1_01_a;
use diffclk_buf_v1_01_a.all;

entity diffclk_buf_0_wrapper is
  port (
    Clkin_p : in std_logic;
    Clkin_m : in std_logic;
    Clkout : out std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of diffclk_buf_0_wrapper : entity is "diffclk_buf_v1_01_a";

end diffclk_buf_0_wrapper;

architecture STRUCTURE of diffclk_buf_0_wrapper is

  component diffclk_buf is
    port (
      Clkin_p : in std_logic;
      Clkin_m : in std_logic;
      Clkout : out std_logic
    );
  end component;

begin

  diffclk_buf_0 : diffclk_buf
    port map (
      Clkin_p => Clkin_p,
      Clkin_m => Clkin_m,
      Clkout => Clkout
    );

end architecture STRUCTURE;

