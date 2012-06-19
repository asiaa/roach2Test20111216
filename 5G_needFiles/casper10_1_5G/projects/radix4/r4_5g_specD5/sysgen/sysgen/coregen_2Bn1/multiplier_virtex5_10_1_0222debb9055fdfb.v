////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: multiplier_virtex5_10_1_0222debb9055fdfb.v
// /___/   /\     Timestamp: Thu Sep 02 17:16:34 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog .\tmp\_cg\multiplier_virtex5_10_1_0222debb9055fdfb.ngc .\tmp\_cg\multiplier_virtex5_10_1_0222debb9055fdfb.v 
// Device	: 5vlx20tff323-2
// Input file	: ./tmp/_cg/multiplier_virtex5_10_1_0222debb9055fdfb.ngc
// Output file	: ./tmp/_cg/multiplier_virtex5_10_1_0222debb9055fdfb.v
// # of Modules	: 1
// Design Name	: multiplier_virtex5_10_1_0222debb9055fdfb
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

module multiplier_virtex5_10_1_0222debb9055fdfb (
  sclr, ce, clk, a, b, p
);
  input sclr;
  input ce;
  input clk;
  input [9 : 0] a;
  input [9 : 0] b;
  output [19 : 0] p;
  
  // synthesis translate_off
  
  wire \BU2/U0/i_synth.i_synth_model/sclr_i ;
  wire \BU2/N1 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_OVERFLOW_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_UNDERFLOW_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYCASCIN_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_MULTSIGNIN_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_A(29)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_A(28)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_A(27)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_A(26)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_A(25)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(47)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(46)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(45)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(44)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(43)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(42)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(41)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(40)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(39)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(38)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(37)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(36)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(35)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(34)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(33)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(32)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(31)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(30)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(29)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(28)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(27)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(26)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(25)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(24)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(23)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(22)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(21)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(20)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(19)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(18)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(17)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(16)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(15)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(14)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(13)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(12)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(11)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(10)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(9)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(8)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(7)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(6)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(5)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(4)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(3)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(2)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(1)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(0)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(47)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(46)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(45)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(44)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(43)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(42)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(41)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(40)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(39)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(38)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(37)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(36)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(35)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(34)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(33)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(32)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(31)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(30)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(29)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(28)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(27)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(26)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(25)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(24)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(23)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(22)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(21)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(20)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(19)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(18)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(17)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(16)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(15)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(14)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(13)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(12)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(11)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(10)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(9)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(8)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(7)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(6)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(5)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(4)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(3)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(2)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(1)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(0)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(17)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(16)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(15)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(14)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(13)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(12)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(11)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(10)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(9)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(8)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(7)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(6)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(5)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(4)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(3)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(2)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(1)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(0)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(47)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(46)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(45)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(44)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(43)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(42)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(41)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(40)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(39)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(38)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(37)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(36)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(35)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(34)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(33)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(32)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(31)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(30)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(29)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(28)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(27)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(26)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(25)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(24)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(23)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(22)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(21)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(20)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(19)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(18)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(17)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(16)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(15)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(14)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(13)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(12)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(11)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(10)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(9)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(8)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(7)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(6)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(5)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(4)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(3)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(2)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(1)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(0)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(47)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(46)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(45)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(44)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(43)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(42)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(41)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(40)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(39)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(38)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(37)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(36)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(35)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(34)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(33)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(32)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(31)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(30)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(29)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(28)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(27)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(26)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(25)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(24)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(23)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(22)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(21)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(20)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(17)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(16)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(15)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(14)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(13)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(12)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(11)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(10)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(9)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(8)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(7)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(6)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(5)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(4)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(3)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(2)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(1)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(0)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(29)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(28)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(27)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(26)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(25)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(24)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(23)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(22)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(21)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(20)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(19)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(18)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(17)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(16)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(15)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(14)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(13)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(12)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(11)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(10)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(9)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(8)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(7)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(6)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(5)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(4)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(3)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(2)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(1)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(0)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(29)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(28)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(27)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(26)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(25)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(24)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(23)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(22)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(21)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(20)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(19)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(18)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(17)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(16)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(15)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(14)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(13)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(12)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(11)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(10)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(9)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(8)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(7)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(6)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(5)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(4)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(3)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(2)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(1)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(0)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYOUT(3)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYOUT(2)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYOUT(1)_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYOUT(0)_UNCONNECTED ;
  wire [19 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg ;
  wire [0 : 0] \BU2/zero_detect ;
  assign
    p[19] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [19],
    p[18] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [18],
    p[17] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [17],
    p[16] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [16],
    p[15] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [15],
    p[14] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [14],
    p[13] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [13],
    p[12] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [12],
    p[11] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [11],
    p[10] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [10],
    p[9] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [9],
    p[8] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [8],
    p[7] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [7],
    p[6] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [6],
    p[5] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [5],
    p[4] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [4],
    p[3] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [3],
    p[2] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [2],
    p[1] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [1],
    p[0] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [0];
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
  DSP48E #(
    .USE_MULT ( "MULT_S" ),
    .A_INPUT ( "DIRECT" ),
    .MULTCARRYINREG ( 0 ),
    .AREG ( 1 ),
    .ACASCREG ( 1 ),
    .BREG ( 1 ),
    .BCASCREG ( 1 ),
    .CREG ( 0 ),
    .MREG ( 1 ),
    .PREG ( 1 ),
    .CARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .USE_SIMD ( "ONE48" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .PATTERN ( 48'h000000000000 ),
    .SEL_PATTERN ( "PATTERN" ),
    .SEL_MASK ( "MASK" ),
    .SEL_ROUNDING_MASK ( "SEL_MASK" ),
    .AUTORESET_PATTERN_DETECT ( "FALSE" ),
    .AUTORESET_PATTERN_DETECT_OPTINV ( "MATCH" ),
    .MASK ( 48'h3FFFFFFFFFFF ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000  (
    .CARRYIN(\BU2/zero_detect [0]),
    .CEA1(\BU2/zero_detect [0]),
    .CEA2(ce),
    .CEB1(\BU2/zero_detect [0]),
    .CEB2(ce),
    .CEC(\BU2/zero_detect [0]),
    .CECTRL(\BU2/zero_detect [0]),
    .CEP(ce),
    .CEM(ce),
    .CECARRYIN(\BU2/zero_detect [0]),
    .CEMULTCARRYIN(\BU2/zero_detect [0]),
    .CLK(clk),
    .RSTA(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .RSTB(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .RSTC(\BU2/zero_detect [0]),
    .RSTCTRL(\BU2/zero_detect [0]),
    .RSTP(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .RSTM(\BU2/U0/i_synth.i_synth_model/sclr_i ),
    .RSTALLCARRYIN(\BU2/zero_detect [0]),
    .CEALUMODE(\BU2/zero_detect [0]),
    .RSTALUMODE(\BU2/zero_detect [0]),
    .PATTERNBDETECT(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PATTERNBDETECT_UNCONNECTED ),
    .PATTERNDETECT(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PATTERNDETECT_UNCONNECTED ),
    .OVERFLOW(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_OVERFLOW_UNCONNECTED ),
    .UNDERFLOW(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_UNDERFLOW_UNCONNECTED ),
    .CARRYCASCIN(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYCASCIN_UNCONNECTED ),
    .CARRYCASCOUT(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYCASCOUT_UNCONNECTED ),
    .MULTSIGNIN(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_MULTSIGNIN_UNCONNECTED ),
    .MULTSIGNOUT(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_MULTSIGNOUT_UNCONNECTED ),
    .A({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_A(29)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_A(28)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_A(27)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_A(26)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_A(25)_UNCONNECTED , a[9], a[9], a[9], a[9], a[9], a[9], 
a[9], a[9], a[9], a[9], a[9], a[9], a[9], a[9], a[9], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .PCIN({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(47)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(46)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(45)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(44)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(43)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(42)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(41)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(40)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(39)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(38)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(37)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(36)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(35)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(34)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(33)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(32)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(31)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(30)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(29)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(28)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(27)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(26)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(25)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(24)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(23)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(22)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(21)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(20)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(19)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(18)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(17)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(16)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(15)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(14)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(13)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(12)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(11)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(10)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(9)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(8)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(7)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(6)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(5)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(4)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(3)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(2)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(1)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCIN(0)_UNCONNECTED }),
    .B({b[9], b[9], b[9], b[9], b[9], b[9], b[9], b[9], b[9], b[8], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]}),
    .C({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(47)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(46)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(45)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(44)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(43)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(42)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(41)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(40)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(39)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(38)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(37)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(36)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(35)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(34)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(33)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(32)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(31)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(30)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(29)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(28)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(27)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(26)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(25)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(24)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(23)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(22)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(21)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(20)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(19)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(18)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(17)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(16)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(15)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(14)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(13)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(12)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(11)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(10)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(9)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(8)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(7)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(6)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(5)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(4)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(3)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(2)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(1)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_C(0)_UNCONNECTED }),
    .CARRYINSEL({\BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0]}),
    .OPMODE({\BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/N1 , \BU2/zero_detect [0], \BU2/N1 }),
    .BCIN({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(17)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(16)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(15)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(14)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(13)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(12)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(11)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(10)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(9)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(8)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(7)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(6)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(5)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(4)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(3)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(2)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(1)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCIN(0)_UNCONNECTED }),
    .ALUMODE({\BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0]}),
    .PCOUT({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(47)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(46)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(45)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(44)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(43)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(42)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(41)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(40)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(39)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(38)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(37)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(36)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(35)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(34)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(33)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(32)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(31)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(30)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(29)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(28)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(27)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(26)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(25)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(24)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(23)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(22)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(21)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(20)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(19)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(18)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(17)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(16)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(15)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(14)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(13)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(12)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(11)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(10)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(9)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(8)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(7)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(6)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(5)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(4)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(3)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(2)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(1)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_PCOUT(0)_UNCONNECTED }),
    .P({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(47)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(46)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(45)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(44)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(43)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(42)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(41)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(40)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(39)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(38)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(37)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(36)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(35)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(34)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(33)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(32)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(31)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(30)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(29)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(28)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(27)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(26)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(25)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(24)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(23)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(22)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(21)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_P(20)_UNCONNECTED , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/p_reg [0]}),
    .BCOUT({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(17)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(16)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(15)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(14)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(13)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(12)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(11)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(10)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(9)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(8)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(7)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(6)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(5)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(4)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(3)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(2)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(1)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_BCOUT(0)_UNCONNECTED }),
    .ACIN({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(29)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(28)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(27)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(26)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(25)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(24)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(23)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(22)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(21)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(20)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(19)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(18)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(17)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(16)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(15)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(14)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(13)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(12)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(11)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(10)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(9)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(8)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(7)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(6)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(5)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(4)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(3)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(2)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(1)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACIN(0)_UNCONNECTED }),
    .ACOUT({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(29)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(28)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(27)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(26)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(25)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(24)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(23)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(22)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(21)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(20)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(19)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(18)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(17)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(16)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(15)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(14)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(13)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(12)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(11)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(10)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(9)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(8)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(7)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(6)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(5)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(4)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(3)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(2)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(1)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_ACOUT(0)_UNCONNECTED }),
    .CARRYOUT({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYOUT(3)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYOUT(2)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYOUT(1)_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/Mmult__mult0000_CARRYOUT(0)_UNCONNECTED })
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/N1 )
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
