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
    dly_clk_n : in std_logic;
    dly_clk_p : in std_logic;
    aux0_clk_n : in std_logic;
    aux0_clk_p : in std_logic;
    aux1_clk_n : in std_logic;
    aux1_clk_p : in std_logic;
    epb_clk_in : in std_logic;
    epb_data : inout std_logic_vector(15 downto 0);
    epb_addr : in std_logic_vector(22 downto 0);
    epb_addr_gp : in std_logic_vector(5 downto 0);
    epb_cs_n : in std_logic;
    epb_be_n : in std_logic_vector(1 downto 0);
    epb_r_w_n : in std_logic;
    epb_oe_n : in std_logic;
    epb_rdy : out std_logic;
    ppc_irq_n : out std_logic;
    adc0_adc3wire_clk : out std_logic;
    adc0_adc3wire_data : out std_logic;
    adc0_adc3wire_strobe : out std_logic;
    adc0_modepin : out std_logic;
    adc0clk_p : in std_logic;
    adc0clk_n : in std_logic;
    adc0sync_p : in std_logic;
    adc0sync_n : in std_logic;
    adc0outofrangei_p : in std_logic;
    adc0outofrangei_n : in std_logic;
    adc0outofrangeq_p : in std_logic;
    adc0outofrangeq_n : in std_logic;
    adc0dataeveni_p : in std_logic_vector(7 downto 0);
    adc0dataeveni_n : in std_logic_vector(7 downto 0);
    adc0dataoddi_p : in std_logic_vector(7 downto 0);
    adc0dataoddi_n : in std_logic_vector(7 downto 0);
    adc0dataevenq_p : in std_logic_vector(7 downto 0);
    adc0dataevenq_n : in std_logic_vector(7 downto 0);
    adc0dataoddq_p : in std_logic_vector(7 downto 0);
    adc0dataoddq_n : in std_logic_vector(7 downto 0);
    adc0ddrb_p : out std_logic;
    adc0ddrb_n : out std_logic;
    r4_iadc_spec_led0_sync_ext : out std_logic_vector(0 to 0);
    r4_iadc_spec_led1_new_acc_ext : out std_logic_vector(0 to 0)
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      sys_clk_n : in std_logic;
      sys_clk_p : in std_logic;
      dly_clk_n : in std_logic;
      dly_clk_p : in std_logic;
      aux0_clk_n : in std_logic;
      aux0_clk_p : in std_logic;
      aux1_clk_n : in std_logic;
      aux1_clk_p : in std_logic;
      epb_clk_in : in std_logic;
      epb_data : inout std_logic_vector(15 downto 0);
      epb_addr : in std_logic_vector(22 downto 0);
      epb_addr_gp : in std_logic_vector(5 downto 0);
      epb_cs_n : in std_logic;
      epb_be_n : in std_logic_vector(1 downto 0);
      epb_r_w_n : in std_logic;
      epb_oe_n : in std_logic;
      epb_rdy : out std_logic;
      ppc_irq_n : out std_logic;
      adc0_adc3wire_clk : out std_logic;
      adc0_adc3wire_data : out std_logic;
      adc0_adc3wire_strobe : out std_logic;
      adc0_modepin : out std_logic;
      adc0clk_p : in std_logic;
      adc0clk_n : in std_logic;
      adc0sync_p : in std_logic;
      adc0sync_n : in std_logic;
      adc0outofrangei_p : in std_logic;
      adc0outofrangei_n : in std_logic;
      adc0outofrangeq_p : in std_logic;
      adc0outofrangeq_n : in std_logic;
      adc0dataeveni_p : in std_logic_vector(7 downto 0);
      adc0dataeveni_n : in std_logic_vector(7 downto 0);
      adc0dataoddi_p : in std_logic_vector(7 downto 0);
      adc0dataoddi_n : in std_logic_vector(7 downto 0);
      adc0dataevenq_p : in std_logic_vector(7 downto 0);
      adc0dataevenq_n : in std_logic_vector(7 downto 0);
      adc0dataoddq_p : in std_logic_vector(7 downto 0);
      adc0dataoddq_n : in std_logic_vector(7 downto 0);
      adc0ddrb_p : out std_logic;
      adc0ddrb_n : out std_logic;
      r4_iadc_spec_led0_sync_ext : out std_logic_vector(0 to 0);
      r4_iadc_spec_led1_new_acc_ext : out std_logic_vector(0 to 0)
    );
  end component;

begin

  system_i : system
    port map (
      sys_clk_n => sys_clk_n,
      sys_clk_p => sys_clk_p,
      dly_clk_n => dly_clk_n,
      dly_clk_p => dly_clk_p,
      aux0_clk_n => aux0_clk_n,
      aux0_clk_p => aux0_clk_p,
      aux1_clk_n => aux1_clk_n,
      aux1_clk_p => aux1_clk_p,
      epb_clk_in => epb_clk_in,
      epb_data => epb_data,
      epb_addr => epb_addr,
      epb_addr_gp => epb_addr_gp,
      epb_cs_n => epb_cs_n,
      epb_be_n => epb_be_n,
      epb_r_w_n => epb_r_w_n,
      epb_oe_n => epb_oe_n,
      epb_rdy => epb_rdy,
      ppc_irq_n => ppc_irq_n,
      adc0_adc3wire_clk => adc0_adc3wire_clk,
      adc0_adc3wire_data => adc0_adc3wire_data,
      adc0_adc3wire_strobe => adc0_adc3wire_strobe,
      adc0_modepin => adc0_modepin,
      adc0clk_p => adc0clk_p,
      adc0clk_n => adc0clk_n,
      adc0sync_p => adc0sync_p,
      adc0sync_n => adc0sync_n,
      adc0outofrangei_p => adc0outofrangei_p,
      adc0outofrangei_n => adc0outofrangei_n,
      adc0outofrangeq_p => adc0outofrangeq_p,
      adc0outofrangeq_n => adc0outofrangeq_n,
      adc0dataeveni_p => adc0dataeveni_p,
      adc0dataeveni_n => adc0dataeveni_n,
      adc0dataoddi_p => adc0dataoddi_p,
      adc0dataoddi_n => adc0dataoddi_n,
      adc0dataevenq_p => adc0dataevenq_p,
      adc0dataevenq_n => adc0dataevenq_n,
      adc0dataoddq_p => adc0dataoddq_p,
      adc0dataoddq_n => adc0dataoddq_n,
      adc0ddrb_p => adc0ddrb_p,
      adc0ddrb_n => adc0ddrb_n,
      r4_iadc_spec_led0_sync_ext => r4_iadc_spec_led0_sync_ext(0 to 0),
      r4_iadc_spec_led1_new_acc_ext => r4_iadc_spec_led1_new_acc_ext(0 to 0)
    );

end architecture STRUCTURE;

