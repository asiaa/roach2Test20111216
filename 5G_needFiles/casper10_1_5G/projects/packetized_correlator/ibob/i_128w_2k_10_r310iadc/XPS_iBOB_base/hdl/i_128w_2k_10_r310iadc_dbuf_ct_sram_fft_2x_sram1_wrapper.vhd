-------------------------------------------------------------------------------
-- i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library sram_interface_v1_00_a;
use sram_interface_v1_00_a.all;

entity i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_wrapper is
  port (
    clk : in std_logic;
    we : in std_logic;
    be : in std_logic_vector(3 downto 0);
    address : in std_logic_vector(18 downto 0);
    data_in : in std_logic_vector(35 downto 0);
    data_out : out std_logic_vector(35 downto 0);
    data_valid : out std_logic;
    pads_address : out std_logic_vector(18 downto 0);
    pads_bw_b : out std_logic_vector(3 downto 0);
    pads_we_b : out std_logic;
    pads_adv_ld_b : out std_logic;
    pads_clk : out std_logic;
    pads_ce : out std_logic;
    pads_oe_b : out std_logic;
    pads_cen_b : out std_logic;
    pads_mode : out std_logic;
    pads_zz : out std_logic;
    pads_dq_I : in std_logic_vector(35 downto 0);
    pads_dq_O : out std_logic_vector(35 downto 0);
    pads_dq_T : out std_logic_vector(35 downto 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_wrapper : entity is "sram_interface_v1_00_a";

end i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_wrapper;

architecture STRUCTURE of i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_wrapper is

  component sram_interface is
    port (
      clk : in std_logic;
      we : in std_logic;
      be : in std_logic_vector(3  downto 0);
      address : in std_logic_vector(18 downto 0);
      data_in : in std_logic_vector(35 downto 0);
      data_out : out std_logic_vector(35 downto 0);
      data_valid : out std_logic;
      pads_address : out std_logic_vector(18 downto 0);
      pads_bw_b : out std_logic_vector(3  downto 0);
      pads_we_b : out std_logic;
      pads_adv_ld_b : out std_logic;
      pads_clk : out std_logic;
      pads_ce : out std_logic;
      pads_oe_b : out std_logic;
      pads_cen_b : out std_logic;
      pads_mode : out std_logic;
      pads_zz : out std_logic;
      pads_dq_I : in std_logic_vector(35 downto 0);
      pads_dq_O : out std_logic_vector(35 downto 0);
      pads_dq_T : out std_logic_vector(35 downto 0)
    );
  end component;

begin

  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1 : sram_interface
    port map (
      clk => clk,
      we => we,
      be => be,
      address => address,
      data_in => data_in,
      data_out => data_out,
      data_valid => data_valid,
      pads_address => pads_address,
      pads_bw_b => pads_bw_b,
      pads_we_b => pads_we_b,
      pads_adv_ld_b => pads_adv_ld_b,
      pads_clk => pads_clk,
      pads_ce => pads_ce,
      pads_oe_b => pads_oe_b,
      pads_cen_b => pads_cen_b,
      pads_mode => pads_mode,
      pads_zz => pads_zz,
      pads_dq_I => pads_dq_I,
      pads_dq_O => pads_dq_O,
      pads_dq_T => pads_dq_T
    );

end architecture STRUCTURE;

