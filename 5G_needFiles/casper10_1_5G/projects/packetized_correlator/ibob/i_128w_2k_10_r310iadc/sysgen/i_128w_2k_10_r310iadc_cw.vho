
-------------------------------------------------------------------
-- System Generator version 10.1.3 VHDL source file.
--
-- Copyright(C) 2008 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2008 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component i_128w_2k_10_r310iadc_cw  port (
    ce: in std_logic := '1'; 
    clk: in std_logic; -- clock period = 5.0 ns (200.0 Mhz)
    i_128w_2k_10_r310iadc_adc0_user_data_valid: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_datai0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_datai1: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_datai2: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_datai3: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_dataq0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_dataq1: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_dataq2: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_dataq3: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc0_user_outofrangei0: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_outofrangei1: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_outofrangeq0: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_outofrangeq1: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_sync0: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_sync1: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_sync2: in std_logic; 
    i_128w_2k_10_r310iadc_adc0_user_sync3: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_data_valid: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_datai0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_datai1: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_datai2: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_datai3: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_dataq0: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_dataq1: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_dataq2: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_dataq3: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_adc1_user_outofrangei0: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_outofrangei1: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_outofrangeq0: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_outofrangeq1: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_sync0: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_sync1: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_sync2: in std_logic; 
    i_128w_2k_10_r310iadc_adc1_user_sync3: in std_logic; 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out: in std_logic_vector(35 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid: in std_logic; 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out: in std_logic_vector(35 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid: in std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_almost_full: in std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_data: in std_logic_vector(63 downto 0); 
    i_128w_2k_10_r310iadc_xaui0_rx_empty: in std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_linkdown: in std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_outofband: in std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_xaui0_rx_valid: in std_logic; 
    i_128w_2k_10_r310iadc_xaui0_tx_full: in std_logic; 
    gateway_out1: out std_logic; 
    gateway_out18: out std_logic; 
    gateway_out19: out std_logic; 
    gateway_out2: out std_logic; 
    gateway_out20: out std_logic; 
    gateway_out3: out std_logic_vector(31 downto 0); 
    gateway_out6: out std_logic_vector(1 downto 0); 
    gateway_out8: out std_logic_vector(47 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address: out std_logic_vector(18 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be: out std_logic_vector(3 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in: out std_logic_vector(35 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we: out std_logic; 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address: out std_logic_vector(18 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be: out std_logic_vector(3 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in: out std_logic_vector(35 downto 0); 
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we: out std_logic; 
    i_128w_2k_10_r310iadc_gpio_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led1_arm_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led2_sync_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led4_eq_clip_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led5_adc_clip_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led6_link_dn_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway: out std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_get: out std_logic; 
    i_128w_2k_10_r310iadc_xaui0_rx_reset: out std_logic; 
    i_128w_2k_10_r310iadc_xaui0_tx_data: out std_logic_vector(63 downto 0); 
    i_128w_2k_10_r310iadc_xaui0_tx_outofband: out std_logic_vector(7 downto 0); 
    i_128w_2k_10_r310iadc_xaui0_tx_valid: out std_logic
  );
end component;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body.  Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : i_128w_2k_10_r310iadc_cw
  port map (
    ce => ce,
    clk => clk,
    i_128w_2k_10_r310iadc_adc0_user_data_valid => i_128w_2k_10_r310iadc_adc0_user_data_valid,
    i_128w_2k_10_r310iadc_adc0_user_datai0 => i_128w_2k_10_r310iadc_adc0_user_datai0,
    i_128w_2k_10_r310iadc_adc0_user_datai1 => i_128w_2k_10_r310iadc_adc0_user_datai1,
    i_128w_2k_10_r310iadc_adc0_user_datai2 => i_128w_2k_10_r310iadc_adc0_user_datai2,
    i_128w_2k_10_r310iadc_adc0_user_datai3 => i_128w_2k_10_r310iadc_adc0_user_datai3,
    i_128w_2k_10_r310iadc_adc0_user_dataq0 => i_128w_2k_10_r310iadc_adc0_user_dataq0,
    i_128w_2k_10_r310iadc_adc0_user_dataq1 => i_128w_2k_10_r310iadc_adc0_user_dataq1,
    i_128w_2k_10_r310iadc_adc0_user_dataq2 => i_128w_2k_10_r310iadc_adc0_user_dataq2,
    i_128w_2k_10_r310iadc_adc0_user_dataq3 => i_128w_2k_10_r310iadc_adc0_user_dataq3,
    i_128w_2k_10_r310iadc_adc0_user_outofrangei0 => i_128w_2k_10_r310iadc_adc0_user_outofrangei0,
    i_128w_2k_10_r310iadc_adc0_user_outofrangei1 => i_128w_2k_10_r310iadc_adc0_user_outofrangei1,
    i_128w_2k_10_r310iadc_adc0_user_outofrangeq0 => i_128w_2k_10_r310iadc_adc0_user_outofrangeq0,
    i_128w_2k_10_r310iadc_adc0_user_outofrangeq1 => i_128w_2k_10_r310iadc_adc0_user_outofrangeq1,
    i_128w_2k_10_r310iadc_adc0_user_sync0 => i_128w_2k_10_r310iadc_adc0_user_sync0,
    i_128w_2k_10_r310iadc_adc0_user_sync1 => i_128w_2k_10_r310iadc_adc0_user_sync1,
    i_128w_2k_10_r310iadc_adc0_user_sync2 => i_128w_2k_10_r310iadc_adc0_user_sync2,
    i_128w_2k_10_r310iadc_adc0_user_sync3 => i_128w_2k_10_r310iadc_adc0_user_sync3,
    i_128w_2k_10_r310iadc_adc1_user_data_valid => i_128w_2k_10_r310iadc_adc1_user_data_valid,
    i_128w_2k_10_r310iadc_adc1_user_datai0 => i_128w_2k_10_r310iadc_adc1_user_datai0,
    i_128w_2k_10_r310iadc_adc1_user_datai1 => i_128w_2k_10_r310iadc_adc1_user_datai1,
    i_128w_2k_10_r310iadc_adc1_user_datai2 => i_128w_2k_10_r310iadc_adc1_user_datai2,
    i_128w_2k_10_r310iadc_adc1_user_datai3 => i_128w_2k_10_r310iadc_adc1_user_datai3,
    i_128w_2k_10_r310iadc_adc1_user_dataq0 => i_128w_2k_10_r310iadc_adc1_user_dataq0,
    i_128w_2k_10_r310iadc_adc1_user_dataq1 => i_128w_2k_10_r310iadc_adc1_user_dataq1,
    i_128w_2k_10_r310iadc_adc1_user_dataq2 => i_128w_2k_10_r310iadc_adc1_user_dataq2,
    i_128w_2k_10_r310iadc_adc1_user_dataq3 => i_128w_2k_10_r310iadc_adc1_user_dataq3,
    i_128w_2k_10_r310iadc_adc1_user_outofrangei0 => i_128w_2k_10_r310iadc_adc1_user_outofrangei0,
    i_128w_2k_10_r310iadc_adc1_user_outofrangei1 => i_128w_2k_10_r310iadc_adc1_user_outofrangei1,
    i_128w_2k_10_r310iadc_adc1_user_outofrangeq0 => i_128w_2k_10_r310iadc_adc1_user_outofrangeq0,
    i_128w_2k_10_r310iadc_adc1_user_outofrangeq1 => i_128w_2k_10_r310iadc_adc1_user_outofrangeq1,
    i_128w_2k_10_r310iadc_adc1_user_sync0 => i_128w_2k_10_r310iadc_adc1_user_sync0,
    i_128w_2k_10_r310iadc_adc1_user_sync1 => i_128w_2k_10_r310iadc_adc1_user_sync1,
    i_128w_2k_10_r310iadc_adc1_user_sync2 => i_128w_2k_10_r310iadc_adc1_user_sync2,
    i_128w_2k_10_r310iadc_adc1_user_sync3 => i_128w_2k_10_r310iadc_adc1_user_sync3,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid,
    i_128w_2k_10_r310iadc_xaui0_rx_almost_full => i_128w_2k_10_r310iadc_xaui0_rx_almost_full,
    i_128w_2k_10_r310iadc_xaui0_rx_data => i_128w_2k_10_r310iadc_xaui0_rx_data,
    i_128w_2k_10_r310iadc_xaui0_rx_empty => i_128w_2k_10_r310iadc_xaui0_rx_empty,
    i_128w_2k_10_r310iadc_xaui0_rx_linkdown => i_128w_2k_10_r310iadc_xaui0_rx_linkdown,
    i_128w_2k_10_r310iadc_xaui0_rx_outofband => i_128w_2k_10_r310iadc_xaui0_rx_outofband,
    i_128w_2k_10_r310iadc_xaui0_rx_valid => i_128w_2k_10_r310iadc_xaui0_rx_valid,
    i_128w_2k_10_r310iadc_xaui0_tx_full => i_128w_2k_10_r310iadc_xaui0_tx_full,
    gateway_out1 => gateway_out1,
    gateway_out18 => gateway_out18,
    gateway_out19 => gateway_out19,
    gateway_out2 => gateway_out2,
    gateway_out20 => gateway_out20,
    gateway_out3 => gateway_out3,
    gateway_out6 => gateway_out6,
    gateway_out8 => gateway_out8,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in,
    i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we,
    i_128w_2k_10_r310iadc_gpio_gateway => i_128w_2k_10_r310iadc_gpio_gateway,
    i_128w_2k_10_r310iadc_led1_arm_gateway => i_128w_2k_10_r310iadc_led1_arm_gateway,
    i_128w_2k_10_r310iadc_led2_sync_gateway => i_128w_2k_10_r310iadc_led2_sync_gateway,
    i_128w_2k_10_r310iadc_led4_eq_clip_gateway => i_128w_2k_10_r310iadc_led4_eq_clip_gateway,
    i_128w_2k_10_r310iadc_led5_adc_clip_gateway => i_128w_2k_10_r310iadc_led5_adc_clip_gateway,
    i_128w_2k_10_r310iadc_led6_link_dn_gateway => i_128w_2k_10_r310iadc_led6_link_dn_gateway,
    i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway => i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway,
    i_128w_2k_10_r310iadc_xaui0_rx_get => i_128w_2k_10_r310iadc_xaui0_rx_get,
    i_128w_2k_10_r310iadc_xaui0_rx_reset => i_128w_2k_10_r310iadc_xaui0_rx_reset,
    i_128w_2k_10_r310iadc_xaui0_tx_data => i_128w_2k_10_r310iadc_xaui0_tx_data,
    i_128w_2k_10_r310iadc_xaui0_tx_outofband => i_128w_2k_10_r310iadc_xaui0_tx_outofband,
    i_128w_2k_10_r310iadc_xaui0_tx_valid => i_128w_2k_10_r310iadc_xaui0_tx_valid);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
