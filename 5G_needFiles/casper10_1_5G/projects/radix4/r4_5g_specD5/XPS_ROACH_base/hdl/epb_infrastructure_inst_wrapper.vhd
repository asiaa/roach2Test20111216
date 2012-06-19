-------------------------------------------------------------------------------
-- epb_infrastructure_inst_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity epb_infrastructure_inst_wrapper is
  port (
    epb_data_buf : inout std_logic_vector(15 downto 0);
    epb_data_oe_n_i : in std_logic;
    epb_data_out_i : in std_logic_vector(15 downto 0);
    epb_data_in_o : out std_logic_vector(15 downto 0);
    epb_oe_n_buf : in std_logic;
    epb_oe_n : out std_logic;
    epb_cs_n_buf : in std_logic;
    epb_cs_n : out std_logic;
    epb_r_w_n_buf : in std_logic;
    epb_r_w_n : out std_logic;
    epb_be_n_buf : in std_logic_vector(1 downto 0);
    epb_be_n : out std_logic_vector(1 downto 0);
    epb_addr_buf : in std_logic_vector(22 downto 0);
    epb_addr : out std_logic_vector(22 downto 0);
    epb_addr_gp_buf : in std_logic_vector(5 downto 0);
    epb_addr_gp : out std_logic_vector(5 downto 0);
    epb_rdy_buf : out std_logic;
    epb_rdy : in std_logic;
    epb_rdy_oe : in std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of epb_infrastructure_inst_wrapper : entity is "epb_infrastructure_v1_00_a";

end epb_infrastructure_inst_wrapper;

architecture STRUCTURE of epb_infrastructure_inst_wrapper is

  component epb_infrastructure is
    port (
      epb_data_buf : inout std_logic_vector(15 downto 0);
      epb_data_oe_n_i : in std_logic;
      epb_data_out_i : in std_logic_vector(15 downto 0);
      epb_data_in_o : out std_logic_vector(15 downto 0);
      epb_oe_n_buf : in std_logic;
      epb_oe_n : out std_logic;
      epb_cs_n_buf : in std_logic;
      epb_cs_n : out std_logic;
      epb_r_w_n_buf : in std_logic;
      epb_r_w_n : out std_logic;
      epb_be_n_buf : in std_logic_vector(1 downto 0);
      epb_be_n : out std_logic_vector(1 downto 0);
      epb_addr_buf : in std_logic_vector(22 downto 0);
      epb_addr : out std_logic_vector(22 downto 0);
      epb_addr_gp_buf : in std_logic_vector(5 downto 0);
      epb_addr_gp : out std_logic_vector(5 downto 0);
      epb_rdy_buf : out std_logic;
      epb_rdy : in std_logic;
      epb_rdy_oe : in std_logic
    );
  end component;

begin

  epb_infrastructure_inst : epb_infrastructure
    port map (
      epb_data_buf => epb_data_buf,
      epb_data_oe_n_i => epb_data_oe_n_i,
      epb_data_out_i => epb_data_out_i,
      epb_data_in_o => epb_data_in_o,
      epb_oe_n_buf => epb_oe_n_buf,
      epb_oe_n => epb_oe_n,
      epb_cs_n_buf => epb_cs_n_buf,
      epb_cs_n => epb_cs_n,
      epb_r_w_n_buf => epb_r_w_n_buf,
      epb_r_w_n => epb_r_w_n,
      epb_be_n_buf => epb_be_n_buf,
      epb_be_n => epb_be_n,
      epb_addr_buf => epb_addr_buf,
      epb_addr => epb_addr,
      epb_addr_gp_buf => epb_addr_gp_buf,
      epb_addr_gp => epb_addr_gp,
      epb_rdy_buf => epb_rdy_buf,
      epb_rdy => epb_rdy,
      epb_rdy_oe => epb_rdy_oe
    );

end architecture STRUCTURE;

