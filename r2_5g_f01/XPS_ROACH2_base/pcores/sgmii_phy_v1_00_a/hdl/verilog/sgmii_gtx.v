///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version : 1.5
//  \   \         Application : Virtex-6 FPGA GTX Transceiver Wizard
//  /   /         Filename : v6_gtxwizard_gtx.v
// /___/   /\     Timestamp :
// \   \  /  \
//  \___\/\___\
//
//
// Module V6_GTXWIZARD_GTX (a GTX Wrapper)
// Generated by Xilinx Virtex-6 FPGA GTX Transceiver Wizard
//
//
// (c) Copyright 2009-2010 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of,
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 


`timescale 1ns / 1ps


//***************************** Entity Declaration ****************************

module sgmii_gtx #
(
    // Simulation attributes
    parameter   GTX_SIM_GTXRESET_SPEEDUP   =   0,      // Set to 1 to speed up sim reset

    // Share RX PLL parameter
    parameter   GTX_TX_CLK_SOURCE          =   "TXPLL",
    // Save power parameter
    parameter   GTX_POWER_SAVE             =   10'b0000110100
)
(
    //---------------------- Loopback and Powerdown Ports ----------------------
    input   [2:0]   LOOPBACK_IN,
    input   [1:0]   RXPOWERDOWN_IN,
    input   [1:0]   TXPOWERDOWN_IN,
    //--------------------- Receive Ports - 8b10b Decoder ----------------------
    output          RXCHARISCOMMA_OUT,
    output          RXCHARISK_OUT,
    output          RXDISPERR_OUT,
    output          RXNOTINTABLE_OUT,
    output          RXRUNDISP_OUT,
    //----------------- Receive Ports - Clock Correction Ports -----------------
    output  [2:0]   RXCLKCORCNT_OUT,
    //------------- Receive Ports - Comma Detection and Alignment --------------
    input           RXENMCOMMAALIGN_IN,
    input           RXENPCOMMAALIGN_IN,
    //----------------- Receive Ports - RX Data Path interface -----------------
    output  [7:0]   RXDATA_OUT,
    output          RXRECCLK_OUT,
    input           RXRESET_IN,
    input           RXUSRCLK2_IN,
    //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    output          RXELECIDLE_OUT,
    input           RXN_IN,
    input           RXP_IN,
    //------ Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    input           RXBUFRESET_IN,
    output  [2:0]   RXBUFSTATUS_OUT,
    //---------------------- Receive Ports - RX PLL Ports ----------------------
    input           GTXRXRESET_IN,
    input   [1:0]   MGTREFCLKRX_IN,
    input           PLLRXRESET_IN,
    output          RXPLLLKDET_OUT,
    output          RXRESETDONE_OUT,
    //-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    input           TXCHARDISPMODE_IN,
    input           TXCHARDISPVAL_IN,
    input           TXCHARISK_IN,
    //---------------- Transmit Ports - TX Data Path interface -----------------
    input   [7:0]   TXDATA_IN,
    output          TXOUTCLK_OUT,
    input           TXRESET_IN,
    input           TXUSRCLK2_IN,
    //-------------- Transmit Ports - TX Driver and OOB signaling --------------
    output          TXN_OUT,
    output          TXP_OUT,
    //--------- Transmit Ports - TX Elastic Buffer and Phase Alignment ---------
    output  [1:0]   TXBUFSTATUS_OUT,
    //--------------------- Transmit Ports - TX PLL Ports ----------------------
    input           GTXTXRESET_IN,
    input   [1:0]   MGTREFCLKTX_IN,
    input           PLLTXRESET_IN,
    output          TXPLLLKDET_OUT,
    output          TXRESETDONE_OUT


);


//***************************** Wire Declarations *****************************

    // ground and vcc signals
    wire            tied_to_ground_i;
    wire    [63:0]  tied_to_ground_vec_i;
    wire            tied_to_vcc_i;
    wire    [63:0]  tied_to_vcc_vec_i;


    //RX Datapath signals
    wire    [31:0]  rxdata_i;
    wire    [2:0]   rxchariscomma_float_i;
    wire    [2:0]   rxcharisk_float_i;
    wire    [2:0]   rxdisperr_float_i;
    wire    [2:0]   rxnotintable_float_i;
    wire    [2:0]   rxrundisp_float_i;

    //TX Datapath signals
    wire    [31:0]  txdata_i;
    wire    [2:0]   txkerr_float_i;
    wire    [2:0]   txrundisp_float_i;

//
//********************************* Main Body of Code**************************

    //-------------------------  Static signal Assigments ---------------------

    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;

    //-------------------  GTX Datapath byte mapping  -----------------
    assign  RXDATA_OUT = rxdata_i[7:0];

    assign  txdata_i   = {tied_to_ground_vec_i[23:0],TXDATA_IN};


    //------------------------- GTX Instantiations  --------------------------
        GTXE1 #
        (
            //_______________________ Simulation-Only Attributes __________________

            .SIM_RECEIVER_DETECT_PASS   ("TRUE"),

            .SIM_TX_ELEC_IDLE_LEVEL     ("X"),

            .SIM_GTXRESET_SPEEDUP       (GTX_SIM_GTXRESET_SPEEDUP),
            .SIM_VERSION                ("2.0"),
            .SIM_TXREFCLK_SOURCE        (3'b000),
            .SIM_RXREFCLK_SOURCE        (3'b000),


           //--------------------------TX PLL----------------------------
            .TX_CLK_SOURCE                          (GTX_TX_CLK_SOURCE),
            .TX_OVERSAMPLE_MODE                     ("FALSE"),
            .TXPLL_COM_CFG                          (24'h21680a),
            .TXPLL_CP_CFG                           (8'h0D),
            .TXPLL_DIVSEL_FB                        (2),
            .TXPLL_DIVSEL_OUT                       (2),
            .TXPLL_DIVSEL_REF                       (1),
            .TXPLL_DIVSEL45_FB                      (5),
            .TXPLL_LKDET_CFG                        (3'b111),
            .TX_CLK25_DIVIDER                       (5),
            .TXPLL_SATA                             (2'b00),
            .TX_TDCC_CFG                            (2'b00),
            .PMA_CAS_CLK_EN                         ("FALSE"),
            .POWER_SAVE                             (GTX_POWER_SAVE),

           //-----------------------TX Interface-------------------------
            .GEN_TXUSRCLK                           ("TRUE"),
            .TX_DATA_WIDTH                          (10),
            .TX_USRCLK_CFG                          (6'h00),
            .TXOUTCLK_CTRL                          ("TXPLLREFCLK_DIV1"),
            .TXOUTCLK_DLY                           (10'b0000000000),

           //------------TX Buffering and Phase Alignment----------------
            .TX_PMADATA_OPT                         (1'b0),
            .PMA_TX_CFG                             (20'h80082),
            .TX_BUFFER_USE                          ("TRUE"),
            .TX_BYTECLK_CFG                         (6'h00),
            .TX_EN_RATE_RESET_BUF                   ("TRUE"),
            .TX_XCLK_SEL                            ("TXOUT"),
            .TX_DLYALIGN_CTRINC                     (4'b0100),
            .TX_DLYALIGN_LPFINC                     (4'b0110),
            .TX_DLYALIGN_MONSEL                     (3'b000),
            .TX_DLYALIGN_OVRDSETTING                (8'b10000000),

           //-----------------------TX Gearbox---------------------------
            .GEARBOX_ENDEC                          (3'b000),
            .TXGEARBOX_USE                          ("FALSE"),

           //--------------TX Driver and OOB Signalling------------------
            .TX_DRIVE_MODE                          ("DIRECT"),
            .TX_IDLE_ASSERT_DELAY                   (3'b101),
            .TX_IDLE_DEASSERT_DELAY                 (3'b011),
            .TXDRIVE_LOOPBACK_HIZ                   ("FALSE"),
            .TXDRIVE_LOOPBACK_PD                    ("FALSE"),

           //------------TX Pipe Control for PCI Express/SATA------------
            .COM_BURST_VAL                          (4'b1111),

           //----------------TX Attributes for PCI Express---------------
            .TX_DEEMPH_0                            (5'b11010),
            .TX_DEEMPH_1                            (5'b10000),
            .TX_MARGIN_FULL_0                       (7'b1001110),
            .TX_MARGIN_FULL_1                       (7'b1001001),
            .TX_MARGIN_FULL_2                       (7'b1000101),
            .TX_MARGIN_FULL_3                       (7'b1000010),
            .TX_MARGIN_FULL_4                       (7'b1000000),
            .TX_MARGIN_LOW_0                        (7'b1000110),
            .TX_MARGIN_LOW_1                        (7'b1000100),
            .TX_MARGIN_LOW_2                        (7'b1000010),
            .TX_MARGIN_LOW_3                        (7'b1000000),
            .TX_MARGIN_LOW_4                        (7'b1000000),

           //--------------------------RX PLL----------------------------
            .RX_OVERSAMPLE_MODE                     ("FALSE"),
            .RXPLL_COM_CFG                          (24'h21680a),
            .RXPLL_CP_CFG                           (8'h0D),
            .RXPLL_DIVSEL_FB                        (2),
            .RXPLL_DIVSEL_OUT                       (2),
            .RXPLL_DIVSEL_REF                       (1),
            .RXPLL_DIVSEL45_FB                      (5),
            .RXPLL_LKDET_CFG                        (3'b111),
            .RX_CLK25_DIVIDER                       (5),

           //-----------------------RX Interface-------------------------
            .GEN_RXUSRCLK                           ("TRUE"),
            .RX_DATA_WIDTH                          (10),
            .RXRECCLK_CTRL                          ("RXRECCLKPMA_DIV1"),
            .RXRECCLK_DLY                           (10'b0000000000),
            .RXUSRCLK_DLY                           (16'h0000),

           //--------RX Driver,OOB signalling,Coupling and Eq.,CDR-------
            .AC_CAP_DIS                             ("TRUE"),
            .CDR_PH_ADJ_TIME                        (5'b10100),
            .OOBDETECT_THRESHOLD                    (3'b011),
            .PMA_CDR_SCAN                           (27'h640404C),
            .PMA_RX_CFG                             (25'h05ce048),
            .RCV_TERM_GND                           ("FALSE"),
            .RCV_TERM_VTTRX                         ("FALSE"),
            .RX_EN_IDLE_HOLD_CDR                    ("FALSE"),
            .RX_EN_IDLE_RESET_FR                    ("TRUE"),
            .RX_EN_IDLE_RESET_PH                    ("TRUE"),
            .TX_DETECT_RX_CFG                       (14'h1832),
            .TERMINATION_CTRL                       (5'b00000),
            .TERMINATION_OVRD                       ("FALSE"),
            .CM_TRIM                                (2'b01),
            .PMA_RXSYNC_CFG                         (7'h00),
            .PMA_CFG                                (76'h0040000040000000003),
            .BGTEST_CFG                             (2'b00),
            .BIAS_CFG                               (17'h00000),

           //------------RX Decision Feedback Equalizer(DFE)-------------
            .DFE_CAL_TIME                           (5'b01100),
            .DFE_CFG                                (8'b00011011),
            .RX_EN_IDLE_HOLD_DFE                    ("TRUE"),
            .RX_EYE_OFFSET                          (8'h4C),
            .RX_EYE_SCANMODE                        (2'b00),

           //-----------------------PRBS Detection-----------------------
            .RXPRBSERR_LOOPBACK                     (1'b0),

           //----------------Comma Detection and Alignment---------------
            .ALIGN_COMMA_WORD                       (1),
            .COMMA_10B_ENABLE                       (10'b0001111111),
            .COMMA_DOUBLE                           ("FALSE"),
            .DEC_MCOMMA_DETECT                      ("TRUE"),
            .DEC_PCOMMA_DETECT                      ("TRUE"),
            .DEC_VALID_COMMA_ONLY                   ("FALSE"),
            .MCOMMA_10B_VALUE                       (10'b1010000011),
            .MCOMMA_DETECT                          ("TRUE"),
            .PCOMMA_10B_VALUE                       (10'b0101111100),
            .PCOMMA_DETECT                          ("TRUE"),
            .RX_DECODE_SEQ_MATCH                    ("TRUE"),
            .RX_SLIDE_AUTO_WAIT                     (5),
            .RX_SLIDE_MODE                          ("OFF"),
            .SHOW_REALIGN_COMMA                     ("FALSE"),

           //---------------RX Loss-of-sync State Machine----------------
            .RX_LOS_INVALID_INCR                    (1),
            .RX_LOS_THRESHOLD                       (4),
            .RX_LOSS_OF_SYNC_FSM                    ("FALSE"),

           //-----------------------RX Gearbox---------------------------
            .RXGEARBOX_USE                          ("FALSE"),

           //-----------RX Elastic Buffer and Phase alignment------------
            .RX_BUFFER_USE                          ("TRUE"),
            .RX_EN_IDLE_RESET_BUF                   ("TRUE"),
            .RX_EN_MODE_RESET_BUF                   ("TRUE"),
            .RX_EN_RATE_RESET_BUF                   ("TRUE"),
            .RX_EN_REALIGN_RESET_BUF                ("FALSE"),
            .RX_EN_REALIGN_RESET_BUF2               ("FALSE"),
            .RX_FIFO_ADDR_MODE                      ("FULL"),
            .RX_IDLE_HI_CNT                         (4'b1000),
            .RX_IDLE_LO_CNT                         (4'b0000),
            .RX_XCLK_SEL                            ("RXREC"),
            .RX_DLYALIGN_CTRINC                     (4'b0100),
            .RX_DLYALIGN_EDGESET                    (5'b00010),
            .RX_DLYALIGN_LPFINC                     (4'b0110),
            .RX_DLYALIGN_MONSEL                     (3'b000),
            .RX_DLYALIGN_OVRDSETTING                (8'b10000000),

           //----------------------Clock Correction----------------------
            .CLK_COR_ADJ_LEN                        (2),
            .CLK_COR_DET_LEN                        (2),
            .CLK_COR_INSERT_IDLE_FLAG               ("FALSE"),
            .CLK_COR_KEEP_IDLE                      ("FALSE"),
            .CLK_COR_MAX_LAT                        (18),
            .CLK_COR_MIN_LAT                        (14),
            .CLK_COR_PRECEDENCE                     ("TRUE"),
            .CLK_COR_REPEAT_WAIT                    (0),
            .CLK_COR_SEQ_1_1                        (10'b0110111100),
            .CLK_COR_SEQ_1_2                        (10'b0001010000),
            .CLK_COR_SEQ_1_3                        (10'b0000000000),
            .CLK_COR_SEQ_1_4                        (10'b0000000000),
            .CLK_COR_SEQ_1_ENABLE                   (4'b1111),
            .CLK_COR_SEQ_2_1                        (10'b0110111100),
            .CLK_COR_SEQ_2_2                        (10'b0010110101),
            .CLK_COR_SEQ_2_3                        (10'b0000000000),
            .CLK_COR_SEQ_2_4                        (10'b0000000000),
            .CLK_COR_SEQ_2_ENABLE                   (4'b1111),
            .CLK_COR_SEQ_2_USE                      ("TRUE"),
            .CLK_CORRECT_USE                        ("TRUE"),

           //----------------------Channel Bonding----------------------
            .CHAN_BOND_1_MAX_SKEW                   (1),
            .CHAN_BOND_2_MAX_SKEW                   (1),
            .CHAN_BOND_KEEP_ALIGN                   ("FALSE"),
            .CHAN_BOND_SEQ_1_1                      (10'b0000000000),
            .CHAN_BOND_SEQ_1_2                      (10'b0000000000),
            .CHAN_BOND_SEQ_1_3                      (10'b0000000000),
            .CHAN_BOND_SEQ_1_4                      (10'b0000000000),
            .CHAN_BOND_SEQ_1_ENABLE                 (4'b1111),
            .CHAN_BOND_SEQ_2_1                      (10'b0000000000),
            .CHAN_BOND_SEQ_2_2                      (10'b0000000000),
            .CHAN_BOND_SEQ_2_3                      (10'b0000000000),
            .CHAN_BOND_SEQ_2_4                      (10'b0000000000),
            .CHAN_BOND_SEQ_2_CFG                    (5'b00000),
            .CHAN_BOND_SEQ_2_ENABLE                 (4'b1111),
            .CHAN_BOND_SEQ_2_USE                    ("FALSE"),
            .CHAN_BOND_SEQ_LEN                      (1),
            .PCI_EXPRESS_MODE                       ("FALSE"),

           //-----------RX Attributes for PCI Express/SATA/SAS----------
            .SAS_MAX_COMSAS                         (52),
            .SAS_MIN_COMSAS                         (40),
            .SATA_BURST_VAL                         (3'b100),
            .SATA_IDLE_VAL                          (3'b100),
            .SATA_MAX_BURST                         (9),
            .SATA_MAX_INIT                          (27),
            .SATA_MAX_WAKE                          (9),
            .SATA_MIN_BURST                         (5),
            .SATA_MIN_INIT                          (15),
            .SATA_MIN_WAKE                          (5),
            .TRANS_TIME_FROM_P2                     (12'h03c),
            .TRANS_TIME_NON_P2                      (8'h19),
            .TRANS_TIME_RATE                        (8'hff),
            .TRANS_TIME_TO_P2                       (10'h064)


        )
        gtxe1_i
        (

        //---------------------- Loopback and Powerdown Ports ----------------------
        .LOOPBACK                       (LOOPBACK_IN),
        .RXPOWERDOWN                    (RXPOWERDOWN_IN),
        .TXPOWERDOWN                    (TXPOWERDOWN_IN),
        //------------ Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
        .RXDATAVALID                    (),
        .RXGEARBOXSLIP                  (tied_to_ground_i),
        .RXHEADER                       (),
        .RXHEADERVALID                  (),
        .RXSTARTOFSEQ                   (),
        //--------------------- Receive Ports - 8b10b Decoder ----------------------
        .RXCHARISCOMMA                  ({rxchariscomma_float_i,RXCHARISCOMMA_OUT}),
        .RXCHARISK                      ({rxcharisk_float_i,RXCHARISK_OUT}),
        .RXDEC8B10BUSE                  (tied_to_vcc_i),
        .RXDISPERR                      ({rxdisperr_float_i,RXDISPERR_OUT}),
        .RXNOTINTABLE                   ({rxnotintable_float_i,RXNOTINTABLE_OUT}),
        .RXRUNDISP                      ({rxrundisp_float_i,RXRUNDISP_OUT}),
        .USRCODEERR                     (tied_to_ground_i),
        //----------------- Receive Ports - Channel Bonding Ports ------------------
        .RXCHANBONDSEQ                  (),
        .RXCHBONDI                      (tied_to_ground_vec_i[3:0]),
        .RXCHBONDLEVEL                  (tied_to_ground_vec_i[2:0]),
        .RXCHBONDMASTER                 (tied_to_ground_i),
        .RXCHBONDO                      (),
        .RXCHBONDSLAVE                  (tied_to_ground_i),
        .RXENCHANSYNC                   (tied_to_ground_i),
        //----------------- Receive Ports - Clock Correction Ports -----------------
        .RXCLKCORCNT                    (RXCLKCORCNT_OUT),
        //------------- Receive Ports - Comma Detection and Alignment --------------
        .RXBYTEISALIGNED                (),
        .RXBYTEREALIGN                  (),
        .RXCOMMADET                     (),
        .RXCOMMADETUSE                  (tied_to_vcc_i),
        .RXENMCOMMAALIGN                (RXENMCOMMAALIGN_IN),
        .RXENPCOMMAALIGN                (RXENPCOMMAALIGN_IN),
        .RXSLIDE                        (tied_to_ground_i),
        //--------------------- Receive Ports - PRBS Detection ---------------------
        .PRBSCNTRESET                   (tied_to_ground_i),
        .RXENPRBSTST                    (tied_to_ground_vec_i[2:0]),
        .RXPRBSERR                      (),
        //----------------- Receive Ports - RX Data Path interface -----------------
        .RXDATA                         (rxdata_i),
        .RXRECCLK                       (RXRECCLK_OUT),
        .RXRECCLKPCS                    (),
        .RXRESET                        (RXRESET_IN),
        .RXUSRCLK                       (tied_to_ground_i),
        .RXUSRCLK2                      (RXUSRCLK2_IN),
        //---------- Receive Ports - RX Decision Feedback Equalizer(DFE) -----------
        .DFECLKDLYADJ                   (tied_to_ground_vec_i[5:0]),
        .DFECLKDLYADJMON                (),
        .DFEDLYOVRD                     (tied_to_vcc_i),
        .DFEEYEDACMON                   (),
        .DFESENSCAL                     (),
        .DFETAP1                        (tied_to_ground_vec_i[4:0]),
        .DFETAP1MONITOR                 (),
        .DFETAP2                        (tied_to_ground_vec_i[4:0]),
        .DFETAP2MONITOR                 (),
        .DFETAP3                        (tied_to_ground_vec_i[3:0]),
        .DFETAP3MONITOR                 (),
        .DFETAP4                        (tied_to_ground_vec_i[3:0]),
        .DFETAP4MONITOR                 (),
        .DFETAPOVRD                     (tied_to_vcc_i),
        //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        .GATERXELECIDLE                 (tied_to_ground_i),
        .IGNORESIGDET                   (tied_to_ground_i),
        .RXCDRRESET                     (tied_to_ground_i),
        .RXELECIDLE                     (RXELECIDLE_OUT),
        .RXEQMIX                        (10'b0000000111),
        .RXN                            (RXN_IN),
        .RXP                            (RXP_IN),
        //------ Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
        .RXBUFRESET                     (RXBUFRESET_IN),
        .RXBUFSTATUS                    (RXBUFSTATUS_OUT),
        .RXCHANISALIGNED                (),
        .RXCHANREALIGN                  (),
        .RXDLYALIGNDISABLE              (tied_to_ground_i),
        .RXDLYALIGNMONENB               (tied_to_ground_i),
        .RXDLYALIGNMONITOR              (),
        .RXDLYALIGNOVERRIDE             (tied_to_ground_i),
        .RXDLYALIGNRESET                (tied_to_ground_i),
        .RXDLYALIGNSWPPRECURB           (tied_to_vcc_i),
        .RXDLYALIGNUPDSW                (tied_to_ground_i),
        .RXENPMAPHASEALIGN              (tied_to_ground_i),
        .RXPMASETPHASE                  (tied_to_ground_i),
        .RXSTATUS                       (),
        //------------- Receive Ports - RX Loss-of-sync State Machine --------------
        .RXLOSSOFSYNC                   (),
        //-------------------- Receive Ports - RX Oversampling ---------------------
        .RXENSAMPLEALIGN                (tied_to_ground_i),
        .RXOVERSAMPLEERR                (),
        //---------------------- Receive Ports - RX PLL Ports ----------------------
        .GREFCLKRX                      (tied_to_ground_i),
        .GTXRXRESET                     (GTXRXRESET_IN),
        .MGTREFCLKRX                    (MGTREFCLKRX_IN),
        .NORTHREFCLKRX                  (tied_to_ground_vec_i[1:0]),
        .PERFCLKRX                      (tied_to_ground_i),
        .PLLRXRESET                     (PLLRXRESET_IN),
        .RXPLLLKDET                     (RXPLLLKDET_OUT),
        .RXPLLLKDETEN                   (tied_to_vcc_i),
        .RXPLLPOWERDOWN                 (tied_to_ground_i),
        .RXPLLREFSELDY                  (tied_to_ground_vec_i[2:0]),
        .RXRATE                         (tied_to_ground_vec_i[1:0]),
        .RXRATEDONE                     (),
        .RXRESETDONE                    (RXRESETDONE_OUT),
        .SOUTHREFCLKRX                  (tied_to_ground_vec_i[1:0]),
        //------------ Receive Ports - RX Pipe Control for PCI Express -------------
        .PHYSTATUS                      (),
        .RXVALID                        (),
        //--------------- Receive Ports - RX Polarity Control Ports ----------------
        .RXPOLARITY                     (tied_to_ground_i),
        //------------------- Receive Ports - RX Ports for SATA --------------------
        .COMINITDET                     (),
        .COMSASDET                      (),
        .COMWAKEDET                     (),
        //----------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
        .DADDR                          (tied_to_ground_vec_i[7:0]),
        .DCLK                           (tied_to_ground_i),
        .DEN                            (tied_to_ground_i),
        .DI                             (tied_to_ground_vec_i[15:0]),
        .DRDY                           (),
        .DRPDO                          (),
        .DWE                            (tied_to_ground_i),
        //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
        .TXGEARBOXREADY                 (),
        .TXHEADER                       (tied_to_ground_vec_i[2:0]),
        .TXSEQUENCE                     (tied_to_ground_vec_i[6:0]),
        .TXSTARTSEQ                     (tied_to_ground_i),
        //-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
        .TXBYPASS8B10B                  (tied_to_ground_vec_i[3:0]),
        .TXCHARDISPMODE                 ({tied_to_ground_vec_i[2:0],TXCHARDISPMODE_IN}),
        .TXCHARDISPVAL                  ({tied_to_ground_vec_i[2:0],TXCHARDISPVAL_IN}),
        .TXCHARISK                      ({tied_to_ground_vec_i[2:0],TXCHARISK_IN}),
        .TXENC8B10BUSE                  (tied_to_vcc_i),
        .TXKERR                         (),
        .TXRUNDISP                      (),
        //----------------------- Transmit Ports - GTX Ports -----------------------
        .GTXTEST                        (13'b1000000000000),
        .MGTREFCLKFAB                   (),
        .TSTCLK0                        (tied_to_ground_i),
        .TSTCLK1                        (tied_to_ground_i),
        .TSTIN                          (20'b11111111111111111111),
        .TSTOUT                         (),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .TXDATA                         (txdata_i),
        .TXOUTCLK                       (TXOUTCLK_OUT),
        .TXOUTCLKPCS                    (),
        .TXRESET                        (TXRESET_IN),
        .TXUSRCLK                       (tied_to_ground_i),
        .TXUSRCLK2                      (TXUSRCLK2_IN),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
        .TXBUFDIFFCTRL                  (3'b100),
        .TXDIFFCTRL                     (4'b0000),
        .TXINHIBIT                      (tied_to_ground_i),
        .TXN                            (TXN_OUT),
        .TXP                            (TXP_OUT),
        .TXPOSTEMPHASIS                 (5'b00011),
        //------------- Transmit Ports - TX Driver and OOB signstalling --------------
        .TXPREEMPHASIS                  (4'b0111),
        //--------- Transmit Ports - TX Elastic Buffer and Phase Alignment ---------
        .TXBUFSTATUS                    (TXBUFSTATUS_OUT),
        //------ Transmit Ports - TX Elastic Buffer and Phase Alignment Ports ------
        .TXDLYALIGNDISABLE              (tied_to_vcc_i),
        .TXDLYALIGNMONENB               (tied_to_ground_i),
        .TXDLYALIGNMONITOR              (),
        .TXDLYALIGNOVERRIDE             (tied_to_ground_i),
        .TXDLYALIGNRESET                (tied_to_ground_i),
        .TXDLYALIGNUPDSW                (tied_to_vcc_i),
        .TXENPMAPHASEALIGN              (tied_to_ground_i),
        .TXPMASETPHASE                  (tied_to_ground_i),
        //--------------------- Transmit Ports - TX PLL Ports ----------------------
        .GREFCLKTX                      (tied_to_ground_i),
        .GTXTXRESET                     (GTXTXRESET_IN),
        .MGTREFCLKTX                    (MGTREFCLKTX_IN),
        .NORTHREFCLKTX                  (tied_to_ground_vec_i[1:0]),
        .PERFCLKTX                      (tied_to_ground_i),
        .PLLTXRESET                     (PLLTXRESET_IN),
        .SOUTHREFCLKTX                  (tied_to_ground_vec_i[1:0]),
        .TXPLLLKDET                     (TXPLLLKDET_OUT),
        .TXPLLLKDETEN                   (tied_to_vcc_i),
        .TXPLLPOWERDOWN                 (tied_to_ground_i),
        .TXPLLREFSELDY                  (tied_to_ground_vec_i[2:0]),
        .TXRATE                         (tied_to_ground_vec_i[1:0]),
        .TXRATEDONE                     (),
        .TXRESETDONE                    (TXRESETDONE_OUT),
        //------------------- Transmit Ports - TX PRBS Generator -------------------
        .TXENPRBSTST                    (tied_to_ground_vec_i[2:0]),
        .TXPRBSFORCEERR                 (tied_to_ground_i),
        //------------------ Transmit Ports - TX Polarity Control ------------------
        .TXPOLARITY                     (1'b1), /* TODO: this will be fixed on the next revision */
        //--------------- Transmit Ports - TX Ports for PCI Express ----------------
        .TXDEEMPH                       (tied_to_ground_i),
        .TXDETECTRX                     (tied_to_ground_i),
        .TXELECIDLE                     (tied_to_ground_i),
        .TXMARGIN                       (tied_to_ground_vec_i[2:0]),
        .TXPDOWNASYNCH                  (tied_to_ground_i),
        .TXSWING                        (tied_to_ground_i),
        //------------------- Transmit Ports - TX Ports for SATA -------------------
        .COMFINISH                      (),
        .TXCOMINIT                      (tied_to_ground_i),
        .TXCOMSAS                       (tied_to_ground_i),
        .TXCOMWAKE                      (tied_to_ground_i)

     );

endmodule
