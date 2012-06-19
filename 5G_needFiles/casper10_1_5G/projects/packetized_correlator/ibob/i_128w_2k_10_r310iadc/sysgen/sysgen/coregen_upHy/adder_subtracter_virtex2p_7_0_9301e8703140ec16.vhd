--------------------------------------------------------------------------------
--     This file is owned and controlled by Xilinx and must be used           --
--     solely for design, simulation, implementation and creation of          --
--     design files limited to Xilinx devices or technologies. Use            --
--     with non-Xilinx devices or technologies is expressly prohibited        --
--     and immediately terminates your license.                               --
--                                                                            --
--     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"          --
--     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                --
--     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION        --
--     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION            --
--     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS              --
--     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                --
--     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE       --
--     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY               --
--     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                --
--     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         --
--     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        --
--     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS        --
--     FOR A PARTICULAR PURPOSE.                                              --
--                                                                            --
--     Xilinx products are not intended for use in life support               --
--     appliances, devices, or systems. Use in such applications are          --
--     expressly prohibited.                                                  --
--                                                                            --
--     (c) Copyright 1995-2007 Xilinx, Inc.                                   --
--     All rights reserved.                                                   --
--------------------------------------------------------------------------------
-- You must compile the wrapper file adder_subtracter_virtex2p_7_0_9301e8703140ec16.vhd when simulating
-- the core, adder_subtracter_virtex2p_7_0_9301e8703140ec16. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
Library XilinxCoreLib;
-- synthesis translate_on
ENTITY adder_subtracter_virtex2p_7_0_9301e8703140ec16 IS
	port (
	A: IN std_logic_VECTOR(16 downto 0);
	B: IN std_logic_VECTOR(16 downto 0);
	Q: OUT std_logic_VECTOR(16 downto 0);
	CLK: IN std_logic;
	CE: IN std_logic);
END adder_subtracter_virtex2p_7_0_9301e8703140ec16;

ARCHITECTURE adder_subtracter_virtex2p_7_0_9301e8703140ec16_a OF adder_subtracter_virtex2p_7_0_9301e8703140ec16 IS
-- synthesis translate_off
component wrapped_adder_subtracter_virtex2p_7_0_9301e8703140ec16
	port (
	A: IN std_logic_VECTOR(16 downto 0);
	B: IN std_logic_VECTOR(16 downto 0);
	Q: OUT std_logic_VECTOR(16 downto 0);
	CLK: IN std_logic;
	CE: IN std_logic);
end component;

-- Configuration specification 
	for all : wrapped_adder_subtracter_virtex2p_7_0_9301e8703140ec16 use entity XilinxCoreLib.C_ADDSUB_V7_0(behavioral)
		generic map(
			c_has_bypass_with_cin => 0,
			c_a_type => 0,
			c_has_sclr => 0,
			c_sync_priority => 1,
			c_has_aset => 0,
			c_has_b_out => 0,
			c_has_s => 0,
			c_has_q => 1,
			c_bypass_enable => 0,
			c_b_constant => 0,
			c_has_ovfl => 0,
			c_high_bit => 16,
			c_latency => 1,
			c_sinit_val => "0",
			c_has_bypass => 0,
			c_pipe_stages => 1,
			c_has_sset => 0,
			c_has_ainit => 0,
			c_has_a_signed => 0,
			c_has_q_c_out => 0,
			c_b_type => 0,
			c_has_add => 0,
			c_has_sinit => 0,
			c_has_b_in => 0,
			c_has_b_signed => 0,
			c_bypass_low => 0,
			c_enable_rlocs => 1,
			c_b_value => "0",
			c_add_mode => 0,
			c_has_aclr => 0,
			c_out_width => 17,
			c_ainit_val => "0000",
			c_low_bit => 0,
			c_has_q_ovfl => 0,
			c_has_q_b_out => 0,
			c_has_c_out => 0,
			c_b_width => 17,
			c_a_width => 17,
			c_sync_enable => 0,
			c_has_ce => 1,
			c_has_c_in => 0);
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_adder_subtracter_virtex2p_7_0_9301e8703140ec16
		port map (
			A => A,
			B => B,
			Q => Q,
			CLK => CLK,
			CE => CE);
-- synthesis translate_on

END adder_subtracter_virtex2p_7_0_9301e8703140ec16_a;

