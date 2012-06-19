
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
component r4_5g_specd5_cw  port (
    ce: in std_logic := '1'; 
    clk: in std_logic; -- clock period = 6.6667 ns (149.99925000374998 Mhz)
    r4_5g_specd5_acc_len_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_data_valid: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_datai0: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai1: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai2: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai3: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai4: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai5: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai6: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_datai7: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq0: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq1: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq2: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq3: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq4: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq5: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq6: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_dataq7: in std_logic_vector(3 downto 0); 
    r4_5g_specd5_adc_5g_dmux_user_outofrange0: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_outofrange1: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_sync0: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_sync1: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_sync2: in std_logic; 
    r4_5g_specd5_adc_5g_dmux_user_sync3: in std_logic; 
    r4_5g_specd5_cnt_rst_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_adc_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_adc_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc0_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc0_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc1_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc1_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc2_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc2_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc3_bram_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc3_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    r4_5g_specd5_acc_cnt_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_led0_sync_gateway: out std_logic; 
    r4_5g_specd5_led1_new_acc_gateway: out std_logic; 
    r4_5g_specd5_snap_adc_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_adc_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specd5_snap_adc_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_adc_bram_we: out std_logic; 
    r4_5g_specd5_snap_vacc0_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc0_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specd5_snap_vacc0_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc0_bram_we: out std_logic; 
    r4_5g_specd5_snap_vacc1_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc1_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specd5_snap_vacc1_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc1_bram_we: out std_logic; 
    r4_5g_specd5_snap_vacc2_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc2_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specd5_snap_vacc2_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc2_bram_we: out std_logic; 
    r4_5g_specd5_snap_vacc3_addr_user_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc3_bram_addr: out std_logic_vector(9 downto 0); 
    r4_5g_specd5_snap_vacc3_bram_data_in: out std_logic_vector(31 downto 0); 
    r4_5g_specd5_snap_vacc3_bram_we: out std_logic; 
    r4_5g_specd5_sync_cnt_user_data_in: out std_logic_vector(31 downto 0)
  );
end component;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body.  Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : r4_5g_specd5_cw
  port map (
    ce => ce,
    clk => clk,
    r4_5g_specd5_acc_len_user_data_out => r4_5g_specd5_acc_len_user_data_out,
    r4_5g_specd5_adc_5g_dmux_user_data_valid => r4_5g_specd5_adc_5g_dmux_user_data_valid,
    r4_5g_specd5_adc_5g_dmux_user_datai0 => r4_5g_specd5_adc_5g_dmux_user_datai0,
    r4_5g_specd5_adc_5g_dmux_user_datai1 => r4_5g_specd5_adc_5g_dmux_user_datai1,
    r4_5g_specd5_adc_5g_dmux_user_datai2 => r4_5g_specd5_adc_5g_dmux_user_datai2,
    r4_5g_specd5_adc_5g_dmux_user_datai3 => r4_5g_specd5_adc_5g_dmux_user_datai3,
    r4_5g_specd5_adc_5g_dmux_user_datai4 => r4_5g_specd5_adc_5g_dmux_user_datai4,
    r4_5g_specd5_adc_5g_dmux_user_datai5 => r4_5g_specd5_adc_5g_dmux_user_datai5,
    r4_5g_specd5_adc_5g_dmux_user_datai6 => r4_5g_specd5_adc_5g_dmux_user_datai6,
    r4_5g_specd5_adc_5g_dmux_user_datai7 => r4_5g_specd5_adc_5g_dmux_user_datai7,
    r4_5g_specd5_adc_5g_dmux_user_dataq0 => r4_5g_specd5_adc_5g_dmux_user_dataq0,
    r4_5g_specd5_adc_5g_dmux_user_dataq1 => r4_5g_specd5_adc_5g_dmux_user_dataq1,
    r4_5g_specd5_adc_5g_dmux_user_dataq2 => r4_5g_specd5_adc_5g_dmux_user_dataq2,
    r4_5g_specd5_adc_5g_dmux_user_dataq3 => r4_5g_specd5_adc_5g_dmux_user_dataq3,
    r4_5g_specd5_adc_5g_dmux_user_dataq4 => r4_5g_specd5_adc_5g_dmux_user_dataq4,
    r4_5g_specd5_adc_5g_dmux_user_dataq5 => r4_5g_specd5_adc_5g_dmux_user_dataq5,
    r4_5g_specd5_adc_5g_dmux_user_dataq6 => r4_5g_specd5_adc_5g_dmux_user_dataq6,
    r4_5g_specd5_adc_5g_dmux_user_dataq7 => r4_5g_specd5_adc_5g_dmux_user_dataq7,
    r4_5g_specd5_adc_5g_dmux_user_outofrange0 => r4_5g_specd5_adc_5g_dmux_user_outofrange0,
    r4_5g_specd5_adc_5g_dmux_user_outofrange1 => r4_5g_specd5_adc_5g_dmux_user_outofrange1,
    r4_5g_specd5_adc_5g_dmux_user_sync0 => r4_5g_specd5_adc_5g_dmux_user_sync0,
    r4_5g_specd5_adc_5g_dmux_user_sync1 => r4_5g_specd5_adc_5g_dmux_user_sync1,
    r4_5g_specd5_adc_5g_dmux_user_sync2 => r4_5g_specd5_adc_5g_dmux_user_sync2,
    r4_5g_specd5_adc_5g_dmux_user_sync3 => r4_5g_specd5_adc_5g_dmux_user_sync3,
    r4_5g_specd5_cnt_rst_user_data_out => r4_5g_specd5_cnt_rst_user_data_out,
    r4_5g_specd5_snap_adc_bram_data_out => r4_5g_specd5_snap_adc_bram_data_out,
    r4_5g_specd5_snap_adc_ctrl_user_data_out => r4_5g_specd5_snap_adc_ctrl_user_data_out,
    r4_5g_specd5_snap_vacc0_bram_data_out => r4_5g_specd5_snap_vacc0_bram_data_out,
    r4_5g_specd5_snap_vacc0_ctrl_user_data_out => r4_5g_specd5_snap_vacc0_ctrl_user_data_out,
    r4_5g_specd5_snap_vacc1_bram_data_out => r4_5g_specd5_snap_vacc1_bram_data_out,
    r4_5g_specd5_snap_vacc1_ctrl_user_data_out => r4_5g_specd5_snap_vacc1_ctrl_user_data_out,
    r4_5g_specd5_snap_vacc2_bram_data_out => r4_5g_specd5_snap_vacc2_bram_data_out,
    r4_5g_specd5_snap_vacc2_ctrl_user_data_out => r4_5g_specd5_snap_vacc2_ctrl_user_data_out,
    r4_5g_specd5_snap_vacc3_bram_data_out => r4_5g_specd5_snap_vacc3_bram_data_out,
    r4_5g_specd5_snap_vacc3_ctrl_user_data_out => r4_5g_specd5_snap_vacc3_ctrl_user_data_out,
    r4_5g_specd5_acc_cnt_user_data_in => r4_5g_specd5_acc_cnt_user_data_in,
    r4_5g_specd5_led0_sync_gateway => r4_5g_specd5_led0_sync_gateway,
    r4_5g_specd5_led1_new_acc_gateway => r4_5g_specd5_led1_new_acc_gateway,
    r4_5g_specd5_snap_adc_addr_user_data_in => r4_5g_specd5_snap_adc_addr_user_data_in,
    r4_5g_specd5_snap_adc_bram_addr => r4_5g_specd5_snap_adc_bram_addr,
    r4_5g_specd5_snap_adc_bram_data_in => r4_5g_specd5_snap_adc_bram_data_in,
    r4_5g_specd5_snap_adc_bram_we => r4_5g_specd5_snap_adc_bram_we,
    r4_5g_specd5_snap_vacc0_addr_user_data_in => r4_5g_specd5_snap_vacc0_addr_user_data_in,
    r4_5g_specd5_snap_vacc0_bram_addr => r4_5g_specd5_snap_vacc0_bram_addr,
    r4_5g_specd5_snap_vacc0_bram_data_in => r4_5g_specd5_snap_vacc0_bram_data_in,
    r4_5g_specd5_snap_vacc0_bram_we => r4_5g_specd5_snap_vacc0_bram_we,
    r4_5g_specd5_snap_vacc1_addr_user_data_in => r4_5g_specd5_snap_vacc1_addr_user_data_in,
    r4_5g_specd5_snap_vacc1_bram_addr => r4_5g_specd5_snap_vacc1_bram_addr,
    r4_5g_specd5_snap_vacc1_bram_data_in => r4_5g_specd5_snap_vacc1_bram_data_in,
    r4_5g_specd5_snap_vacc1_bram_we => r4_5g_specd5_snap_vacc1_bram_we,
    r4_5g_specd5_snap_vacc2_addr_user_data_in => r4_5g_specd5_snap_vacc2_addr_user_data_in,
    r4_5g_specd5_snap_vacc2_bram_addr => r4_5g_specd5_snap_vacc2_bram_addr,
    r4_5g_specd5_snap_vacc2_bram_data_in => r4_5g_specd5_snap_vacc2_bram_data_in,
    r4_5g_specd5_snap_vacc2_bram_we => r4_5g_specd5_snap_vacc2_bram_we,
    r4_5g_specd5_snap_vacc3_addr_user_data_in => r4_5g_specd5_snap_vacc3_addr_user_data_in,
    r4_5g_specd5_snap_vacc3_bram_addr => r4_5g_specd5_snap_vacc3_bram_addr,
    r4_5g_specd5_snap_vacc3_bram_data_in => r4_5g_specd5_snap_vacc3_bram_data_in,
    r4_5g_specd5_snap_vacc3_bram_we => r4_5g_specd5_snap_vacc3_bram_we,
    r4_5g_specd5_sync_cnt_user_data_in => r4_5g_specd5_sync_cnt_user_data_in);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
