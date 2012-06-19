////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: multiplier_virtex2p_10_1_423ddb9f1e4b69b4.v
// /___/   /\     Timestamp: Wed Jun 09 11:59:23 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog .\tmp\_cg\multiplier_virtex2p_10_1_423ddb9f1e4b69b4.ngc .\tmp\_cg\multiplier_virtex2p_10_1_423ddb9f1e4b69b4.v 
// Device	: 2vp2fg256-7
// Input file	: ./tmp/_cg/multiplier_virtex2p_10_1_423ddb9f1e4b69b4.ngc
// Output file	: ./tmp/_cg/multiplier_virtex2p_10_1_423ddb9f1e4b69b4.v
// # of Modules	: 1
// Design Name	: multiplier_virtex2p_10_1_423ddb9f1e4b69b4
// Xilinx        : c:\xilinx\10.1\ise
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module multiplier_virtex2p_10_1_423ddb9f1e4b69b4 (
  sclr, ce, clk, a, b, p
);
  input sclr;
  input ce;
  input clk;
  input [17 : 0] a;
  input [17 : 0] b;
  output [35 : 0] p;
  
  // synthesis translate_off
  
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_0_280 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_17_279 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_1_277 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_18_276 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_2_273 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_19_272 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_3_269 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_20_268 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_4_265 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_21_264 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_5_261 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_22_260 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_6_257 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_23_256 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_7_253 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_24_252 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_8_249 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_25_248 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_9_245 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_26_244 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_10_241 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_27_240 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_11_237 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_28_236 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_12_233 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_29_232 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_13_229 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_30_228 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_14_225 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_31_224 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_15_221 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_32_220 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_16_217 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_33_216 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_17_213 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_18_210 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_19_207 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_34_206 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_0_148 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_1_147 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_2_146 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_3_145 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_4_144 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_5_143 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_6_142 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_7_141 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_8_140 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_9_139 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_10_138 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_11_137 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_12_136 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_13_135 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_14_134 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_15_133 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_16_132 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[0] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[1] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[2] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[3] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[4] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[5] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[6] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[7] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[8] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[9] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[10] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[11] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[12] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[13] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[14] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[15] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[16] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[17] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[19] ;
  wire \BU2/U0/i_synth.i_synth_model/sclr_i ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(35)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(35)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(34)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(33)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(32)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(31)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(30)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(29)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(28)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(27)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(26)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(25)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(24)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(23)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(22)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(21)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(20)_UNCONNECTED ;
  wire [19 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut ;
  wire [18 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy ;
  wire [34 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) ;
  wire [19 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) ;
  wire [0 : 0] \BU2/zero_detect ;
  assign
    p[35] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[19] ,
    p[34] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[17] ,
    p[33] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[16] ,
    p[32] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[15] ,
    p[31] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[14] ,
    p[30] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[13] ,
    p[29] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[12] ,
    p[28] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[11] ,
    p[27] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[10] ,
    p[26] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[9] ,
    p[25] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[8] ,
    p[24] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[7] ,
    p[23] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[6] ,
    p[22] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[5] ,
    p[21] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[4] ,
    p[20] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[3] ,
    p[19] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[2] ,
    p[18] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[1] ,
    p[17] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[0] ,
    p[16] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_16_132 ,
    p[15] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_15_133 ,
    p[14] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_14_134 ,
    p[13] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_13_135 ,
    p[12] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_12_136 ,
    p[11] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_11_137 ,
    p[10] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_10_138 ,
    p[9] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_9_139 ,
    p[8] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_8_140 ,
    p[7] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_7_141 ,
    p[6] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_6_142 ,
    p[5] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_5_143 ,
    p[4] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_4_144 ,
    p[3] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_3_145 ,
    p[2] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_2_146 ,
    p[1] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_1_147 ,
    p[0] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_0_148 ;
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/i_synth.i_synth_model/sclr_i1  (
    .I0(ce),
    .I1(sclr),
    .O(\BU2/U0/i_synth.i_synth_model/sclr_i )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [0]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_0_148 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [1]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_1_147 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [2]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_2_146 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [3]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_3_145 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [4]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_4_144 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [5]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_5_143 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [6]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_6_142 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [7]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_7_141 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [8]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_8_140 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [9]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_9_139 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [10]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_10_138 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [11]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_11_137 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [12]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_12_136 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [13]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_13_135 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [14]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_14_134 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [15]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_15_133 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [16]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_16_132 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [17]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_17_279 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_18  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [18]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_18_276 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_19  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [19]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_19_272 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_20  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [20]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_20_268 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_21  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [21]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_21_264 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_22  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [22]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_22_260 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_23  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [23]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_23_256 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_24  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [24]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_24_252 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_25  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [25]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_25_248 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_26  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [26]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_26_244 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_27  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [27]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_27_240 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_28  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [28]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_28_236 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_29  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [29]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_29_232 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_30  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [30]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_30_228 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_31  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [31]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_31_224 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_32  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [32]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_32_220 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_33  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [33]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_33_216 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_34  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [34]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_34_206 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [0]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_0_280 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [1]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_1_277 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [2]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_2_273 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [3]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_3_269 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [4]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_4_265 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [5]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_5_261 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [6]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_6_257 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [7]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_7_253 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [8]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_8_249 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [9]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_9_245 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [10]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_10_241 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [11]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_11_237 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [12]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_12_233 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [13]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_13_229 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [14]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_14_225 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [15]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_15_221 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [16]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_16_217 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [17]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_17_213 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_18  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [18]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_18_210 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_19  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [19]),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_19_207 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(0)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_17_279 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_0_280 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [0])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(0)  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_17_279 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [0])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(0)  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[0] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(1)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_18_276 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_1_277 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [1])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(1)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [0]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_18_276 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [1])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(1)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [0]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[1] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(2)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_19_272 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_2_273 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [2])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(2)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [1]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_19_272 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [2])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(2)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [1]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[2] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(3)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_20_268 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_3_269 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [3])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(3)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [2]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_20_268 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [3])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(3)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [2]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[3] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(4)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_21_264 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_4_265 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [4])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(4)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [3]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_21_264 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [4])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(4)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [3]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[4] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(5)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_22_260 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_5_261 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [5])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(5)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [4]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_22_260 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [5])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(5)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [4]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[5] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(6)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_23_256 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_6_257 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [6])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(6)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [5]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_23_256 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [6])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(6)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [5]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[6] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(7)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_24_252 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_7_253 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [7])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(7)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [6]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_24_252 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [7])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(7)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [6]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[7] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(8)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_25_248 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_8_249 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [8])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(8)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [7]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_25_248 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [8])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(8)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [7]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[8] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(9)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_26_244 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_9_245 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [9])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(9)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [8]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_26_244 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [9])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(9)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [8]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[9] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(10)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_27_240 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_10_241 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [10])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(10)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [9]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_27_240 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [10])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(10)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [9]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[10] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(11)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_28_236 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_11_237 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [11])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(11)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [10]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_28_236 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [11])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(11)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [10]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[11] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(12)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_29_232 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_12_233 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [12])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(12)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [11]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_29_232 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [12])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(12)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [11]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[12] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(13)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_30_228 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_13_229 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [13])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(13)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [12]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_30_228 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [13])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(13)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [12]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[13] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(14)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_31_224 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_14_225 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [14])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(14)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [13]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_31_224 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [14])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(14)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [13]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[14] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(15)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_32_220 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_15_221 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [15])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(15)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [14]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_32_220 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [15])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(15)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [14]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[15] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(16)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_33_216 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_16_217 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [16])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(16)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [15]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_33_216 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [16])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(16)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [15]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[16] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(17)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_34_206 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_17_213 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [17])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(17)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [16]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_34_206 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [17])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(17)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [16]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[17] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(18)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_34_206 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_18_210 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [18])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy(18)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [17]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_34_206 ),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [18]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut(19)  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_34_206 ),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(1)_0_19_207 ),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [19])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor(19)  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [18]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [19]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10[19] )
  );
  MULT18X18S   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s  (
    .C(clk),
    .CE(ce),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .A({\BU2/zero_detect [0], b[16], b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]}),
    .B({a[17], a[16], a[15], a[14], a[13], a[12], a[11], a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .P({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(35)_UNCONNECTED 
, \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [34], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [33], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [32], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [31], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [30], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [29], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [28], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [27], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [26], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [25], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [24], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [23], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [22], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [21], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [20], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0) [0]})
  );
  MULT18X18S   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s  (
    .C(clk),
    .CE(ce),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .A({\BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], 
\BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], 
\BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], b[17]}),
    .B({a[17], a[16], a[15], a[14], a[13], a[12], a[11], a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .P({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(35)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(34)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(33)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(32)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(31)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(30)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(29)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(28)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(27)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(26)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(25)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(24)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(23)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(22)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(21)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].use_Mreg.m18x18s_P(20)_UNCONNECTED 
, \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(1)(0) [0]})
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/zero_detect [0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

// synthesis translate_on
