-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    sys_clk_n : in std_logic;
    sys_clk_p : in std_logic;
    aux_clk_n : in std_logic;
    aux_clk_p : in std_logic;
    epb_clk_in : in std_logic;
    epb_data : inout std_logic_vector(0 to 31);
    epb_addr : in std_logic_vector(5 to 29);
    epb_cs_n : in std_logic;
    epb_be_n : in std_logic_vector(0 to 3);
    epb_r_w_n : in std_logic;
    epb_oe_n : in std_logic;
    epb_doe_n : out std_logic;
    epb_rdy : out std_logic;
    ppc_irq_n : out std_logic;
    adc0_adc3wire_clk : out std_logic;
    adc0_adc3wire_data : out std_logic;
    adc0_adc3wire_spi_rst : out std_logic;
    adc0_modepin : out std_logic;
    adc0clk_p : in std_logic;
    adc0clk_n : in std_logic;
    adc0sync_p : in std_logic;
    adc0sync_n : in std_logic;
    adc0data0_p_i : in std_logic_vector(7 downto 0);
    adc0data0_n_i : in std_logic_vector(7 downto 0);
    adc0data1_p_i : in std_logic_vector(7 downto 0);
    adc0data1_n_i : in std_logic_vector(7 downto 0);
    adc0data2_p_i : in std_logic_vector(7 downto 0);
    adc0data2_n_i : in std_logic_vector(7 downto 0);
    adc0data3_p_i : in std_logic_vector(7 downto 0);
    adc0data3_n_i : in std_logic_vector(7 downto 0)
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      sys_clk_n : in std_logic;
      sys_clk_p : in std_logic;
      aux_clk_n : in std_logic;
      aux_clk_p : in std_logic;
      epb_clk_in : in std_logic;
      epb_data : inout std_logic_vector(0 to 31);
      epb_addr : in std_logic_vector(5 to 29);
      epb_cs_n : in std_logic;
      epb_be_n : in std_logic_vector(0 to 3);
      epb_r_w_n : in std_logic;
      epb_oe_n : in std_logic;
      epb_doe_n : out std_logic;
      epb_rdy : out std_logic;
      ppc_irq_n : out std_logic;
      adc0_adc3wire_clk : out std_logic;
      adc0_adc3wire_data : out std_logic;
      adc0_adc3wire_spi_rst : out std_logic;
      adc0_modepin : out std_logic;
      adc0clk_p : in std_logic;
      adc0clk_n : in std_logic;
      adc0sync_p : in std_logic;
      adc0sync_n : in std_logic;
      adc0data0_p_i : in std_logic_vector(7 downto 0);
      adc0data0_n_i : in std_logic_vector(7 downto 0);
      adc0data1_p_i : in std_logic_vector(7 downto 0);
      adc0data1_n_i : in std_logic_vector(7 downto 0);
      adc0data2_p_i : in std_logic_vector(7 downto 0);
      adc0data2_n_i : in std_logic_vector(7 downto 0);
      adc0data3_p_i : in std_logic_vector(7 downto 0);
      adc0data3_n_i : in std_logic_vector(7 downto 0)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      sys_clk_n => sys_clk_n,
      sys_clk_p => sys_clk_p,
      aux_clk_n => aux_clk_n,
      aux_clk_p => aux_clk_p,
      epb_clk_in => epb_clk_in,
      epb_data => epb_data,
      epb_addr => epb_addr,
      epb_cs_n => epb_cs_n,
      epb_be_n => epb_be_n,
      epb_r_w_n => epb_r_w_n,
      epb_oe_n => epb_oe_n,
      epb_doe_n => epb_doe_n,
      epb_rdy => epb_rdy,
      ppc_irq_n => ppc_irq_n,
      adc0_adc3wire_clk => adc0_adc3wire_clk,
      adc0_adc3wire_data => adc0_adc3wire_data,
      adc0_adc3wire_spi_rst => adc0_adc3wire_spi_rst,
      adc0_modepin => adc0_modepin,
      adc0clk_p => adc0clk_p,
      adc0clk_n => adc0clk_n,
      adc0sync_p => adc0sync_p,
      adc0sync_n => adc0sync_n,
      adc0data0_p_i => adc0data0_p_i,
      adc0data0_n_i => adc0data0_n_i,
      adc0data1_p_i => adc0data1_p_i,
      adc0data1_n_i => adc0data1_n_i,
      adc0data2_p_i => adc0data2_p_i,
      adc0data2_n_i => adc0data2_n_i,
      adc0data3_p_i => adc0data3_p_i,
      adc0data3_n_i => adc0data3_n_i
    );

end architecture STRUCTURE;

