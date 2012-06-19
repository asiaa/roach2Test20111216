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

// You must compile the wrapper file single_port_block_memory_virtex2p_6_1_7068db77349ce284.v when simulating
// the core, single_port_block_memory_virtex2p_6_1_7068db77349ce284. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ns/1ps

module single_port_block_memory_virtex2p_6_1_7068db77349ce284(
	addr,
	clk,
	din,
	dout,
	en,
	we);


input [3 : 0] addr;
input clk;
input [35 : 0] din;
output [35 : 0] dout;
input en;
input we;

// synthesis translate_off

      BLKMEMSP_V6_1 #(
		.c_addr_width(4),
		.c_default_data("0"),
		.c_depth(16),
		.c_enable_rlocs(0),
		.c_has_default_data(0),
		.c_has_din(1),
		.c_has_en(1),
		.c_has_limit_data_pitch(0),
		.c_has_nd(0),
		.c_has_rdy(0),
		.c_has_rfd(0),
		.c_has_sinit(0),
		.c_has_we(1),
		.c_limit_data_pitch(18),
		.c_mem_init_file("single_port_block_memory_virtex2p_6_1_7068db77349ce284.mif"),
		.c_pipe_stages(1),
		.c_reg_inputs(0),
		.c_sinit_value("0"),
		.c_width(36),
		.c_write_mode(1),
		.c_ybottom_addr("0"),
		.c_yclk_is_rising(1),
		.c_yen_is_high(1),
		.c_yhierarchy("hierarchy1"),
		.c_ymake_bmm(0),
		.c_yprimitive_type("16kx1"),
		.c_ysinit_is_high(1),
		.c_ytop_addr("1024"),
		.c_yuse_single_primitive(0),
		.c_ywe_is_high(1),
		.c_yydisable_warnings(1))
	inst (
		.ADDR(addr),
		.CLK(clk),
		.DIN(din),
		.DOUT(dout),
		.EN(en),
		.WE(we),
		.ND(),
		.RFD(),
		.RDY(),
		.SINIT());


// synthesis translate_on

endmodule

