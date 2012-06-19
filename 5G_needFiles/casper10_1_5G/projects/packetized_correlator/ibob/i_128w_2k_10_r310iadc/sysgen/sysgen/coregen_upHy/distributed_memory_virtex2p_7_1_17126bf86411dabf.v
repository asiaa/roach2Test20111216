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

// You must compile the wrapper file distributed_memory_virtex2p_7_1_17126bf86411dabf.v when simulating
// the core, distributed_memory_virtex2p_7_1_17126bf86411dabf. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ns/1ps

module distributed_memory_virtex2p_7_1_17126bf86411dabf(
	A,
	CLK,
	QSPO_CE,
	QSPO);


input [7 : 0] A;
input CLK;
input QSPO_CE;
output [7 : 0] QSPO;

// synthesis translate_off

      C_DIST_MEM_V7_1 #(
		.C_ADDR_WIDTH(8),
		.C_DEFAULT_DATA("0"),
		.C_DEFAULT_DATA_RADIX(1),
		.C_DEPTH(256),
		.C_ENABLE_RLOCS(1),
		.C_GENERATE_MIF(1),
		.C_HAS_CLK(1),
		.C_HAS_D(0),
		.C_HAS_DPO(0),
		.C_HAS_DPRA(0),
		.C_HAS_I_CE(0),
		.C_HAS_QDPO(0),
		.C_HAS_QDPO_CE(0),
		.C_HAS_QDPO_CLK(0),
		.C_HAS_QDPO_RST(0),
		.C_HAS_QDPO_SRST(0),
		.C_HAS_QSPO(1),
		.C_HAS_QSPO_CE(1),
		.C_HAS_QSPO_RST(0),
		.C_HAS_QSPO_SRST(0),
		.C_HAS_RD_EN(0),
		.C_HAS_SPO(0),
		.C_HAS_SPRA(0),
		.C_HAS_WE(0),
		.C_LATENCY(1),
		.C_MEM_INIT_FILE("distributed_memory_virtex2p_7_1_17126bf86411dabf.mif"),
		.C_MEM_TYPE(0),
		.C_MUX_TYPE(0),
		.C_QCE_JOINED(0),
		.C_QUALIFY_WE(0),
		.C_READ_MIF(1),
		.C_REG_A_D_INPUTS(0),
		.C_REG_DPRA_INPUT(0),
		.C_SYNC_ENABLE(0),
		.C_WIDTH(8))
	inst (
		.A(A),
		.CLK(CLK),
		.QSPO_CE(QSPO_CE),
		.QSPO(QSPO),
		.D(),
		.DPRA(),
		.SPRA(),
		.I_CE(),
		.WE(),
		.QDPO_CE(),
		.QDPO_CLK(),
		.RD_EN(),
		.QSPO_RST(),
		.QDPO_RST(),
		.QSPO_SRST(),
		.QDPO_SRST(),
		.SPO(),
		.DPO(),
		.QDPO());


// synthesis translate_on

endmodule

