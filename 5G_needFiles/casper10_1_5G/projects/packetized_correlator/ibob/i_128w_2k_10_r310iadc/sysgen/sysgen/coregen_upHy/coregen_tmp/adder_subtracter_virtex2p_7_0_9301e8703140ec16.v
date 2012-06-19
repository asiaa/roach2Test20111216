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

// You must compile the wrapper file adder_subtracter_virtex2p_7_0_9301e8703140ec16.v when simulating
// the core, adder_subtracter_virtex2p_7_0_9301e8703140ec16. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ns/1ps

module adder_subtracter_virtex2p_7_0_9301e8703140ec16(
	A,
	B,
	Q,
	CLK,
	CE);


input [16 : 0] A;
input [16 : 0] B;
output [16 : 0] Q;
input CLK;
input CE;

// synthesis translate_off

      C_ADDSUB_V7_0 #(
		.C_ADD_MODE(0),
		.C_AINIT_VAL("0000"),
		.C_A_TYPE(0),
		.C_A_WIDTH(17),
		.C_BYPASS_ENABLE(0),
		.C_BYPASS_LOW(0),
		.C_B_CONSTANT(0),
		.C_B_TYPE(0),
		.C_B_VALUE("0"),
		.C_B_WIDTH(17),
		.C_ENABLE_RLOCS(1),
		.C_HAS_ACLR(0),
		.C_HAS_ADD(0),
		.C_HAS_AINIT(0),
		.C_HAS_ASET(0),
		.C_HAS_A_SIGNED(0),
		.C_HAS_BYPASS(0),
		.C_HAS_BYPASS_WITH_CIN(0),
		.C_HAS_B_IN(0),
		.C_HAS_B_OUT(0),
		.C_HAS_B_SIGNED(0),
		.C_HAS_CE(1),
		.C_HAS_C_IN(0),
		.C_HAS_C_OUT(0),
		.C_HAS_OVFL(0),
		.C_HAS_Q(1),
		.C_HAS_Q_B_OUT(0),
		.C_HAS_Q_C_OUT(0),
		.C_HAS_Q_OVFL(0),
		.C_HAS_S(0),
		.C_HAS_SCLR(0),
		.C_HAS_SINIT(0),
		.C_HAS_SSET(0),
		.C_HIGH_BIT(16),
		.C_LATENCY(1),
		.C_LOW_BIT(0),
		.C_OUT_WIDTH(17),
		.C_PIPE_STAGES(1),
		.C_SINIT_VAL("0"),
		.C_SYNC_ENABLE(0),
		.C_SYNC_PRIORITY(1))
	inst (
		.A(A),
		.B(B),
		.Q(Q),
		.CLK(CLK),
		.CE(CE),
		.ACLR(),
		.ADD(),
		.AINIT(),
		.ASET(),
		.A_SIGNED(),
		.B_OUT(),
		.C_IN(),
		.B_SIGNED(),
		.C_OUT(),
		.B_IN(),
		.BYPASS(),
		.OVFL(),
		.Q_C_OUT(),
		.Q_B_OUT(),
		.Q_OVFL(),
		.S(),
		.SCLR(),
		.SINIT(),
		.SSET());


// synthesis translate_on

endmodule

