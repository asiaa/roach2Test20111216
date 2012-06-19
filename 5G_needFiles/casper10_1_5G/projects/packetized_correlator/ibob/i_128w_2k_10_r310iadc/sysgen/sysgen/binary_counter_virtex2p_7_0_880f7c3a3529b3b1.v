/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used             *
*     solely for design, simulation, implementation and creation of            *
*     design files limited to Xilinx devices or technologies. Use              *
*     with non-Xilinx devices or technologies is expressly prohibited          *
*     and immediately terminates your license.                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"            *
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                  *
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION          *
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION              *
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS                *
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                  *
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE         *
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY                 *
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                  *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS          *
*     FOR A PARTICULAR PURPOSE.                                                *
*                                                                              *
*     Xilinx products are not intended for use in life support                 *
*     appliances, devices, or systems. Use in such applications are            *
*     expressly prohibited.                                                    *
*                                                                              *
*     (c) Copyright 1995-2007 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/
// The synthesis directives "translate_off/translate_on" specified below are
// supported by Xilinx, Mentor Graphics and Synplicity synthesis
// tools. Ensure they are correct for your synthesis tool(s).

// You must compile the wrapper file binary_counter_virtex2p_7_0_880f7c3a3529b3b1.v when simulating
// the core, binary_counter_virtex2p_7_0_880f7c3a3529b3b1. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ns/1ps

module binary_counter_virtex2p_7_0_880f7c3a3529b3b1(
	Q,
	CLK,
	LOAD,
	L,
	CE,
	SINIT);


output [5 : 0] Q;
input CLK;
input LOAD;
input [5 : 0] L;
input CE;
input SINIT;

// synthesis translate_off

      C_COUNTER_BINARY_V7_0 #(
		.C_AINIT_VAL("0000"),
		.C_COUNT_BY("0001"),
		.C_COUNT_MODE(1),
		.C_COUNT_TO("1111111111111111"),
		.C_ENABLE_RLOCS(1),
		.C_HAS_ACLR(0),
		.C_HAS_AINIT(0),
		.C_HAS_ASET(0),
		.C_HAS_CE(1),
		.C_HAS_IV(0),
		.C_HAS_L(1),
		.C_HAS_LOAD(1),
		.C_HAS_Q_THRESH0(0),
		.C_HAS_Q_THRESH1(0),
		.C_HAS_SCLR(0),
		.C_HAS_SINIT(1),
		.C_HAS_SSET(0),
		.C_HAS_THRESH0(0),
		.C_HAS_THRESH1(0),
		.C_HAS_UP(0),
		.C_LOAD_ENABLE(1),
		.C_LOAD_LOW(0),
		.C_PIPE_STAGES(0),
		.C_RESTRICT_COUNT(0),
		.C_SINIT_VAL("0000"),
		.C_SYNC_ENABLE(0),
		.C_SYNC_PRIORITY(1),
		.C_THRESH0_VALUE("1111111111111111"),
		.C_THRESH1_VALUE("1111111111111111"),
		.C_THRESH_EARLY(1),
		.C_WIDTH(6))
	inst (
		.Q(Q),
		.CLK(CLK),
		.LOAD(LOAD),
		.L(L),
		.CE(CE),
		.SINIT(SINIT),
		.IV(),
		.UP(),
		.THRESH0(),
		.Q_THRESH0(),
		.THRESH1(),
		.Q_THRESH1(),
		.SCLR(),
		.SSET(),
		.ACLR(),
		.AINIT(),
		.ASET());


// synthesis translate_on

endmodule

