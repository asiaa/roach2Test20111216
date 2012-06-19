-------------------------------------------------------------------------------
-- r4_iadc_spec_adc_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library adc_interface_v1_01_a;
use adc_interface_v1_01_a.all;

entity r4_iadc_spec_adc_wrapper is
  port (
    adc_clk_p : in std_logic;
    adc_clk_n : in std_logic;
    adc_sync_p : in std_logic;
    adc_sync_n : in std_logic;
    adc_outofrangei_p : in std_logic;
    adc_outofrangei_n : in std_logic;
    adc_outofrangeq_p : in std_logic;
    adc_outofrangeq_n : in std_logic;
    adc_dataeveni_p : in std_logic_vector(7 downto 0);
    adc_dataeveni_n : in std_logic_vector(7 downto 0);
    adc_dataoddi_p : in std_logic_vector(7 downto 0);
    adc_dataoddi_n : in std_logic_vector(7 downto 0);
    adc_dataevenq_p : in std_logic_vector(7 downto 0);
    adc_dataevenq_n : in std_logic_vector(7 downto 0);
    adc_dataoddq_p : in std_logic_vector(7 downto 0);
    adc_dataoddq_n : in std_logic_vector(7 downto 0);
    adc_ddrb_p : out std_logic;
    adc_ddrb_n : out std_logic;
    user_datai0 : out std_logic_vector(7 downto 0);
    user_datai1 : out std_logic_vector(7 downto 0);
    user_datai2 : out std_logic_vector(7 downto 0);
    user_datai3 : out std_logic_vector(7 downto 0);
    user_dataq0 : out std_logic_vector(7 downto 0);
    user_dataq1 : out std_logic_vector(7 downto 0);
    user_dataq2 : out std_logic_vector(7 downto 0);
    user_dataq3 : out std_logic_vector(7 downto 0);
    user_outofrangei0 : out std_logic;
    user_outofrangei1 : out std_logic;
    user_outofrangeq0 : out std_logic;
    user_outofrangeq1 : out std_logic;
    user_sync0 : out std_logic;
    user_sync1 : out std_logic;
    user_sync2 : out std_logic;
    user_sync3 : out std_logic;
    user_data_valid : out std_logic;
    dcm_reset : in std_logic;
    ctrl_reset : in std_logic;
    ctrl_clk_in : in std_logic;
    ctrl_clk_out : out std_logic;
    ctrl_clk90_out : out std_logic;
    ctrl_clk180_out : out std_logic;
    ctrl_clk270_out : out std_logic;
    ctrl_dcm_locked : out std_logic;
    dcm_psclk : in std_logic;
    dcm_psen : in std_logic;
    dcm_psincdec : in std_logic;
    dcm_psdone : out std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of r4_iadc_spec_adc_wrapper : entity is "adc_interface_v1_01_a";

end r4_iadc_spec_adc_wrapper;

architecture STRUCTURE of r4_iadc_spec_adc_wrapper is

  component adc_interface is
    port (
      adc_clk_p : in std_logic;
      adc_clk_n : in std_logic;
      adc_sync_p : in std_logic;
      adc_sync_n : in std_logic;
      adc_outofrangei_p : in std_logic;
      adc_outofrangei_n : in std_logic;
      adc_outofrangeq_p : in std_logic;
      adc_outofrangeq_n : in std_logic;
      adc_dataeveni_p : in std_logic_vector(7 downto 0);
      adc_dataeveni_n : in std_logic_vector(7 downto 0);
      adc_dataoddi_p : in std_logic_vector(7 downto 0);
      adc_dataoddi_n : in std_logic_vector(7 downto 0);
      adc_dataevenq_p : in std_logic_vector(7 downto 0);
      adc_dataevenq_n : in std_logic_vector(7 downto 0);
      adc_dataoddq_p : in std_logic_vector(7 downto 0);
      adc_dataoddq_n : in std_logic_vector(7 downto 0);
      adc_ddrb_p : out std_logic;
      adc_ddrb_n : out std_logic;
      user_datai0 : out std_logic_vector(7 downto 0);
      user_datai1 : out std_logic_vector(7 downto 0);
      user_datai2 : out std_logic_vector(7 downto 0);
      user_datai3 : out std_logic_vector(7 downto 0);
      user_dataq0 : out std_logic_vector(7 downto 0);
      user_dataq1 : out std_logic_vector(7 downto 0);
      user_dataq2 : out std_logic_vector(7 downto 0);
      user_dataq3 : out std_logic_vector(7 downto 0);
      user_outofrangei0 : out std_logic;
      user_outofrangei1 : out std_logic;
      user_outofrangeq0 : out std_logic;
      user_outofrangeq1 : out std_logic;
      user_sync0 : out std_logic;
      user_sync1 : out std_logic;
      user_sync2 : out std_logic;
      user_sync3 : out std_logic;
      user_data_valid : out std_logic;
      dcm_reset : in std_logic;
      ctrl_reset : in std_logic;
      ctrl_clk_in : in std_logic;
      ctrl_clk_out : out std_logic;
      ctrl_clk90_out : out std_logic;
      ctrl_clk180_out : out std_logic;
      ctrl_clk270_out : out std_logic;
      ctrl_dcm_locked : out std_logic;
      dcm_psclk : in std_logic;
      dcm_psen : in std_logic;
      dcm_psincdec : in std_logic;
      dcm_psdone : out std_logic
    );
  end component;

begin

  r4_iadc_spec_adc : adc_interface
    port map (
      adc_clk_p => adc_clk_p,
      adc_clk_n => adc_clk_n,
      adc_sync_p => adc_sync_p,
      adc_sync_n => adc_sync_n,
      adc_outofrangei_p => adc_outofrangei_p,
      adc_outofrangei_n => adc_outofrangei_n,
      adc_outofrangeq_p => adc_outofrangeq_p,
      adc_outofrangeq_n => adc_outofrangeq_n,
      adc_dataeveni_p => adc_dataeveni_p,
      adc_dataeveni_n => adc_dataeveni_n,
      adc_dataoddi_p => adc_dataoddi_p,
      adc_dataoddi_n => adc_dataoddi_n,
      adc_dataevenq_p => adc_dataevenq_p,
      adc_dataevenq_n => adc_dataevenq_n,
      adc_dataoddq_p => adc_dataoddq_p,
      adc_dataoddq_n => adc_dataoddq_n,
      adc_ddrb_p => adc_ddrb_p,
      adc_ddrb_n => adc_ddrb_n,
      user_datai0 => user_datai0,
      user_datai1 => user_datai1,
      user_datai2 => user_datai2,
      user_datai3 => user_datai3,
      user_dataq0 => user_dataq0,
      user_dataq1 => user_dataq1,
      user_dataq2 => user_dataq2,
      user_dataq3 => user_dataq3,
      user_outofrangei0 => user_outofrangei0,
      user_outofrangei1 => user_outofrangei1,
      user_outofrangeq0 => user_outofrangeq0,
      user_outofrangeq1 => user_outofrangeq1,
      user_sync0 => user_sync0,
      user_sync1 => user_sync1,
      user_sync2 => user_sync2,
      user_sync3 => user_sync3,
      user_data_valid => user_data_valid,
      dcm_reset => dcm_reset,
      ctrl_reset => ctrl_reset,
      ctrl_clk_in => ctrl_clk_in,
      ctrl_clk_out => ctrl_clk_out,
      ctrl_clk90_out => ctrl_clk90_out,
      ctrl_clk180_out => ctrl_clk180_out,
      ctrl_clk270_out => ctrl_clk270_out,
      ctrl_dcm_locked => ctrl_dcm_locked,
      dcm_psclk => dcm_psclk,
      dcm_psen => dcm_psen,
      dcm_psincdec => dcm_psincdec,
      dcm_psdone => dcm_psdone
    );

end architecture STRUCTURE;

