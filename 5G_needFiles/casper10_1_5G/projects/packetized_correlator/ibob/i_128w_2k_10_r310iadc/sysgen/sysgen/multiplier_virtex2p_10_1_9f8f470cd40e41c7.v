////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: multiplier_virtex2p_10_1_9f8f470cd40e41c7.v
// /___/   /\     Timestamp: Wed Jan 06 14:57:21 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog .\tmp\_cg\multiplier_virtex2p_10_1_9f8f470cd40e41c7.ngc .\tmp\_cg\multiplier_virtex2p_10_1_9f8f470cd40e41c7.v 
// Device	: 2vp2fg256-7
// Input file	: ./tmp/_cg/multiplier_virtex2p_10_1_9f8f470cd40e41c7.ngc
// Output file	: ./tmp/_cg/multiplier_virtex2p_10_1_9f8f470cd40e41c7.v
// # of Modules	: 1
// Design Name	: multiplier_virtex2p_10_1_9f8f470cd40e41c7
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

module multiplier_virtex2p_10_1_9f8f470cd40e41c7 (
  sclr, ce, clk, a, b, p
);
  input sclr;
  input ce;
  input clk;
  input [7 : 0] a;
  input [7 : 0] b;
  output [15 : 0] p;
  
  // synthesis translate_off
  
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[0] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[1] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[2] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[3] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[4] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[5] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[6] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[7] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[8] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[9] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[10] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[11] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[12] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[13] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[14] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[35] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_0_87 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_1_86 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_2_85 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_3_84 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_4_83 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_5_82 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_6_81 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_7_80 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_8_79 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_9_78 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_10_77 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_11_76 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_12_75 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_13_74 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_14_73 ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_35_72 ;
  wire \BU2/U0/i_synth.i_synth_model/sclr_i ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(34)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(33)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(32)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(31)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(30)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(29)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(28)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(27)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(26)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(25)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(24)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(23)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(22)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(21)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(20)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(19)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(18)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(17)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(16)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(15)_UNCONNECTED ;
  wire [0 : 0] \BU2/zero_detect ;
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
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[0] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_0_87 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[1] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_1_86 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[2] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_2_85 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[3] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_3_84 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[4] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_4_83 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[5] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_5_82 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[6] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_6_81 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[7] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_7_80 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[8] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_8_79 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[9] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_9_78 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[10] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_10_77 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[11] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_11_76 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[12] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_12_75 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[13] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_13_74 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[14] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_14_73 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_35  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[35] ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_35_72 )
  );
  MULT18X18S   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s  (
    .C(clk),
    .CE(ce),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .A({a[7], a[7], a[7], a[7], a[7], a[7], a[7], a[7], a[7], a[7], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .B({b[7], b[7], b[7], b[7], b[7], b[7], b[7], b[7], b[7], b[7], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]}),
    .P({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[35] , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(34)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(33)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(32)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(31)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(30)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(29)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(28)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(27)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(26)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(25)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(24)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(23)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(22)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(21)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(20)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(19)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(18)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(17)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(16)_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].use_Mreg.m18x18s_P(15)_UNCONNECTED 
, \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[14] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[13] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[12] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[11] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[9] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[8] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[7] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[6] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[5] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[4] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[3] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[2] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[1] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg(0)(0)[0] })
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/zero_detect [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_35_72 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_14_73 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_13_74 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_12_75 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_11_76 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_10_77 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_9_78 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_8_79 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_7_80 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_6_81 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_5_82 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_4_83 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_3_84 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_2_85 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_1_86 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Pdelay/dout_i_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Preg(0)_0_0_87 ),
    .R(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .Q(p[0])
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
