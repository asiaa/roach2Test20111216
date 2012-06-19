/*
 *
 * ADC Interface for KAT ACD w/ National Semiconductor ADC08D1500
* modify the filename for ASIAA 5G adc
* Comment out powerdown pin 2010-04-01
 * Modify for 5Gadc Iserdes. 2010-04-26 Homin
 */

module adc_5g_serdes_interface #(
    /* parameter to enable extra registers between
       input buffer and distributed ram fifo;
       enable to optimize timing */
    parameter    EXTRA_REG = 1
	
  ) (
    /* External signals */
    input        adc_clk_p,
    input        adc_clk_n,
    input        adc_sync_p,
    input        adc_sync_n,
    input        adc_overrange_p,
    input        adc_overrange_n,
    output       adc_rst,
   // output       adc_powerdown,
    input  [7:0] adc_di_d_p,
    input  [7:0] adc_di_d_n,
    input  [7:0] adc_di_p,
    input  [7:0] adc_di_n,
    input  [7:0] adc_dq_d_p,
    input  [7:0] adc_dq_d_n,
    input  [7:0] adc_dq_p,
    input  [7:0] adc_dq_n,
    /* User ports */
   // output [7:0] user_datai3,
   // output [7:0] user_datai2,
   // output [7:0] user_datai1,
   // output [7:0] user_datai0,
   // output [7:0] user_dataq3,
   // output [7:0] user_dataq2,
   // output [7:0] user_dataq1,
   // output [7:0] user_dataq0,
  output [7:0] user_datai30,
  output [7:0] user_datai31,
  output [7:0] user_datai20,
  output [7:0] user_datai21,
  output [7:0] user_datai10,
  output [7:0] user_datai11,
  output [7:0] user_datai00,
  output [7:0] user_datai01,
 output [7:0] user_dataq30,
output [7:0] user_dataq31,
output [7:0] user_dataq20,
output [7:0] user_dataq21,
 output [7:0] user_dataq10,
 output [7:0] user_dataq11,
 output [7:0] user_dataq00,
 output [7:0] user_dataq01,

    output       user_sync0,
    output       user_sync1,
    output       user_sync2,
    output       user_sync3,
    output       user_outofrange0,
    output       user_outofrange1,
    output       user_data_valid,
    /* Internal control signals */
    // ADC CLK DCM Reset
    input        dcm_reset,
    // Reset for ADC
    input        ctrl_reset,
    // Clock to use for output data domain crossing,choosen on the XSG yellow block.
    input        ctrl_clk_in,
    // ADC Clock outputs
    output       ctrl_clk_out,
    output       ctrl_clk90_out,
    output       ctrl_clk180_out,
    output       ctrl_clk270_out,
    output       ctrl_dcm_locked,
    /* DCM Phase control signals */
    input        dcm_psclk,
    input        dcm_psen,
    input        dcm_psincdec,
    output       dcm_psdone
  );

  wire adc_clk, adc_clk90, adc_clk180, adc_clk270;
  parameter  NO_OF_FIFO = 133; //16*8 + 6-1

  /********** Sync Capture *********/

  wire adc_sync_ibufds;

  IBUFDS ibufds_sync(
    .I  (adc_sync_p),
    .IB (adc_sync_n),
    .O  (adc_sync_ibufds)
  );
  wire [3:0] capture_sync;

  reg adc_sync0;
  always @(posedge adc_clk)
    adc_sync0 <= adc_sync_ibufds;
  assign capture_sync[0] = adc_sync0;

  reg adc_sync90;
  always @(posedge adc_clk90)
    adc_sync90 <= adc_sync_ibufds;
  assign capture_sync[1] = adc_sync90;

  reg adc_sync180;
  always @(posedge adc_clk180)
    adc_sync180 <= adc_sync_ibufds;
  assign capture_sync[2] = adc_sync180;

  reg adc_sync270;
  always @(posedge adc_clk270)
    adc_sync270 <= adc_sync_ibufds;
  assign capture_sync[3] = adc_sync270;

  /******* Over-Range Capture ******/

  wire adc_overrange_ibufds;
  IBUFDS ibufds_overrange(
    .I  (adc_overrange_p),
    .IB (adc_overrange_n),
    .O  (adc_overrange_ibufds)
  );
  
  wire adc_overrange_rise;
  wire adc_overrange_fall;

  IDDR #( 
    .DDR_CLK_EDGE ("SAME_EDGE_PIPELINED"),
    .INIT_Q1      (0),
    .INIT_Q2      (0),
    .SRTYPE       ("SYNC")
  ) iddr_overrange (
    .Q1 (adc_overrange_rise),
    .Q2 (adc_overrange_fall),
    .C  (adc_clk),
    .CE (1),
    .D  (adc_overrange_ibufds),
    .R  (0),
    .S  (0)
  );

  /************** DCM ****************/

  wire adc_clk_buf;

  IBUFDS ibufds(
    .I  (adc_clk_p),
    .IB (adc_clk_n),
    .O  (adc_clk_buf)
  );

  wire adc_clk_dcm, adc_clk90_dcm, adc_clk180_dcm, adc_clk270_dcm,adc_clkdv_dcm;

  BUFG bufg_adc_clk[3:0](
    .I  ({adc_clk_dcm, adc_clk90_dcm, adc_clk180_dcm, adc_clk270_dcm}),
    .O  ({adc_clk, adc_clk90, adc_clk180, adc_clk270})
  );

/******* addded for Iserdes homin ************/
/*
  BUFG bufg_adc_clkdv(
    .I  ( adc_clkdv_dcm),
    .O  ( adc_clkdv)
  );
*/
/************ regional hi speed clock ***********/
wire hi_adc_clk;
/*
BUFG bufg_hi_adc_clk[2:0]
  (
.O({hi_adc_clk,hi_adc_clkdv,hi_adc_clk180}), // Clock buffer outpu
.I({hi_adc_clk_dcm,hi_adc_clkdv_dcm,hi_adc_clk180_dcm}) // Clock buffer input
);
*/

/******* network OK
BUFG bufg_hi_adc_clk[1:0]
  (
.O({hi_adc_clk,hi_adc_clk180}), // Clock buffer outpu
.I({hi_adc_clk_dcm,hi_adc_clk180_dcm}) // Clock buffer input
);
*/

BUFIO bufio_hi_adc_clk
(
.O (hi_adc_clk),
.I  (hi_adc_clk_dcm)
);

BUFR bufr_hi_adc_clk180
(
.O (hi_adc_clk180),
.CE(1'b1),
.CLR(1'b0),
.I(hi_adc_clk180_dcm)
);

//wire hi_adc_clkdv_dcm;

/***********************************/

  assign ctrl_clk_out    = adc_clk;
  assign ctrl_clk90_out  = adc_clk90;
  assign ctrl_clk180_out = adc_clk180;
  assign ctrl_clk270_out = adc_clk270;
/*
  DCM #(
    .CLK_FEEDBACK          ("1X"),
    .CLKDV_DIVIDE          (2.000000),
    .CLKFX_DIVIDE          (2),
    .CLKFX_MULTIPLY        (1),
    .CLKIN_PERIOD          (2.00),
    .CLKOUT_PHASE_SHIFT    ("VARIABLE_CENTER"),
    .DESKEW_ADJUST         ("SYSTEM_SYNCHRONOUS"),
    .DFS_FREQUENCY_MODE    ("HIGH"),
    .DLL_FREQUENCY_MODE    ("HIGH"),
    .FACTORY_JF            (16'hC080),
    .PHASE_SHIFT           (64), // 64 is a 90 degree offset
    .STARTUP_WAIT          (1'b0)
  ) dcm_inst (
    .CLKFB                 (hi_adc_clk),
    .CLKIN                 (adc_clk_buf),  
    .DSSEN                 (0),
    .PSCLK                 (dcm_psclk),
    .PSEN                  (dcm_psen),
    .PSINCDEC              (dcm_psincdec),
    .RST                   (dcm_reset),
    .CLKDV                 (hi_adc_clkdv_dcm),
    .CLKFX                 (adc_clk_dcm),
    .CLKFX180              (adc_clk180_dcm),
    .CLK0                  (hi_adc_clk_dcm),
    .CLK2X                 (),
    .CLK2X180              (),
    .CLK90                 (adc_clk90_dcm),
    .CLK180                (),
    .CLK270                (adc_clk270_dcm),
    .LOCKED                (ctrl_dcm_locked),
    .PSDONE                (dcm_psdone),
    .STATUS                ()
  );
*/

  DCM #(
    .CLK_FEEDBACK          ("1X"),
    .CLKDV_DIVIDE          (2.000000),
    .CLKFX_DIVIDE          (1),
    .CLKFX_MULTIPLY        (4),
    .CLKIN_PERIOD          (2.00),
    .CLKIN_DIVIDE_BY_2 ("TRUE"),
    .CLKOUT_PHASE_SHIFT    ("VARIABLE_CENTER"),
    .DESKEW_ADJUST         ("SYSTEM_SYNCHRONOUS"),
    .DFS_FREQUENCY_MODE    ("HIGH"),
    .DLL_FREQUENCY_MODE    ("HIGH"),
    .FACTORY_JF            (16'hC080),
    .PHASE_SHIFT           (64), // 64 is a 90 degree offset
    .STARTUP_WAIT          (1'b0)
  ) dcm_inst (
    .CLKFB                 (adc_clk),
    .CLKIN                 (adc_clk_buf),  
    .DSSEN                 (0),
    .PSCLK                 (dcm_psclk),
    .PSEN                  (dcm_psen),
    .PSINCDEC              (dcm_psincdec),
    .RST                   (dcm_reset),
    .CLKDV                 (adc_clkdv_dcm),
    .CLKFX                 (),
    .CLKFX180              (),
    .CLK0                  (adc_clk_dcm),
    .CLK2X                 (hi_adc_clk_dcm),
    .CLK2X180              (hi_adc_clk180_dcm),
    .CLK90                 (adc_clk90_dcm),
    .CLK180                (adc_clk180_dcm),
    .CLK270                (adc_clk270_dcm),
    .LOCKED                (ctrl_dcm_locked),
    .PSDONE                (dcm_psdone),
    .STATUS                ()
  );

  /************* Data DDR Capture ************/

  wire [7:0] adc_di_d;
  wire [7:0] adc_di;
  wire [7:0] adc_dq_d;
  wire [7:0] adc_dq;
  
  IBUFDS #(
    .IOSTANDARD ("LVDS_25"),
    .DIFF_TERM  ("TRUE")
  ) ibufds_adc_data[31:0] (
    .I  ({adc_di_d_p, adc_di_p, adc_dq_d_p, adc_dq_p}),
    .IB ({adc_di_d_n, adc_di_n, adc_dq_d_n, adc_dq_n}),
    .O  ({adc_di_d, adc_di, adc_dq_d, adc_dq})
  );

 wire [7:0] adc_di_d_0;
 wire [7:0] adc_di_d_1;
 wire [7:0] adc_di_d_2;
 wire [7:0] adc_di_d_3;

 wire [7:0] adc_di_0;
 wire [7:0] adc_di_1;
 wire [7:0] adc_di_2;
 wire [7:0] adc_di_3;

 wire [7:0] adc_dq_d_0;
 wire [7:0] adc_dq_d_1;
 wire [7:0] adc_dq_d_2;
 wire [7:0] adc_dq_d_3;


 wire [7:0] adc_dq_0;
 wire [7:0] adc_dq_1;
 wire [7:0] adc_dq_2;
 wire [7:0] adc_dq_3;

/*** for debug only *******/
/*
assign adc_di_2 =0;
assign adc_di_3 =0;
assign adc_di_d_2 =0;
assign adc_di_d_3 =0;


  IDDR #( 
    .DDR_CLK_EDGE ("SAME_EDGE_PIPELINED"),
    .INIT_Q1      (1'b0),
    .INIT_Q2      (1'b0)
  ) iddr_data[15:0] (
    .Q1 ({adc_di_d_0, adc_di_0}),
    .Q2 ({adc_di_d_1, adc_di_1}),
    .C  (adc_clk),
    .CE (1'b1),
    .D  ({adc_di_d, adc_di}),
    .R  (1'b0),
    .S  (1'b0)
  );
*/

  /*************** ADC Clock Domain FIFO *****************/

  wire [NO_OF_FIFO:0] fifo_data_in; //4*4*8 + 4(capture_sync)+1(overrange)+1(overrange)= 134
  wire [NO_OF_FIFO:0] reg_data_in;
 assign reg_data_in = {capture_sync, adc_overrange_fall, adc_overrange_rise, 
 adc_dq_0,adc_dq_1,adc_dq_2,adc_dq_3, 
 adc_dq_d_0,adc_dq_d_1,adc_dq_d_2,adc_dq_d_3,
  adc_di_0, adc_di_1,adc_di_2,adc_di_3,
 adc_di_d_0, adc_di_d_1,adc_di_d_2,adc_di_d_3};

/* timing contraint failed if switch to the following*/
 //assign reg_data_in = {capture_sync, adc_overrange_fall, adc_overrange_rise, adc_dq_fall, adc_dq_d_fall, adc_di_fall, adc_di_d_fall, adc_dq_rise,  adc_dq_d_rise, adc_di_rise, adc_di_d_rise};


  wire [NO_OF_FIFO:0] fifo_data_out;
  wire fifo_empty;

  reg fifo_rd_en;

/* Optional stage of registeration to between input buffer and 
   clock domain crossing FIFO to improve timing performance */

generate if (EXTRA_REG) begin : with_extra_reg

  reg [NO_OF_FIFO:0] extra_reg;
  always @(posedge adc_clk) begin
    extra_reg <= reg_data_in;
  end
  assign fifo_data_in = extra_reg;
  
end else begin
  assign fifo_data_in = reg_data_in;
end endgenerate
  
  adc_serdes_async_fifo adc_async_fifo_inst(
    .rst    (dcm_reset),
    .din    (fifo_data_in),
    .wr_clk (hi_adc_clk),  // changed
    .wr_en  (1'b1),
    .rd_clk (ctrl_clk_in),
    .rd_en  (fifo_rd_en),
    .dout   (fifo_data_out), 
    .empty  (fifo_empty),
    .full   ()
  );

  always @(posedge adc_clk) begin
    if (dcm_reset) begin
      fifo_rd_en <= 1'b0;
    end else begin
      fifo_rd_en <= !fifo_empty;
    end
  end

  //synthesis attribute box_type adc_async_fifo_inst "black_box" 

  assign user_data_valid = fifo_empty;

/* rearrange for 5G 2010-04-15*/

/*
  assign user_datai0 = fifo_data_out[7:0];
  assign user_datai1 = fifo_data_out[15:8];
  assign user_datai2 = fifo_data_out[23:16];
  assign user_datai3 = fifo_data_out[31:24];

  assign user_dataq0 = fifo_data_out[39:32];
  assign user_dataq1 = fifo_data_out[47:40];
  assign user_dataq2 = fifo_data_out[55:48];
  assign user_dataq3 = fifo_data_out[63:56];
*/

  assign user_datai00 = fifo_data_out[7:0];	//adc_di_d3
  assign user_datai01 = fifo_data_out[15:8];	//adc_di_d2
   
  assign user_datai20 = fifo_data_out[23:16];	//adc_di_d1
  assign user_datai21 = fifo_data_out[31:24];         //adc_di_d0
  
  assign user_dataq00 = fifo_data_out[39:32];         //adc_di_3
  assign user_dataq01 = fifo_data_out[47:40];         //adc_di_2
  
  assign user_dataq20 = fifo_data_out[55:48];         //adc_di_1
  assign user_dataq21 = fifo_data_out[63:56];         //adc_di_0

  assign user_datai10 = fifo_data_out[71:64];         //adc_dq_d_3
  assign user_datai11 = fifo_data_out[79:72];         //adc_dq_d_2
 
  assign user_datai30 = fifo_data_out[87:80];         //adc_dq_d_1
  assign user_datai31 = fifo_data_out[95:88];         //adc_dq_d_0

  assign user_dataq10 = fifo_data_out[103:96];         //adc_dq_3
  assign user_dataq11 = fifo_data_out[111:104];         //adc_dq_2
 
  assign user_dataq30 = fifo_data_out[119:112];         //adc_dq_1
  assign user_dataq31 = fifo_data_out[127:120];         //adc_dq_0


  assign user_outofrange0 = fifo_data_out[NO_OF_FIFO -5];
  assign user_outofrange1 = fifo_data_out[NO_OF_FIFO -4];
  assign user_sync0 = fifo_data_out[NO_OF_FIFO -3];
  assign user_sync1 = fifo_data_out[NO_OF_FIFO-2];
  assign user_sync2 = fifo_data_out[NO_OF_FIFO-1];
  assign user_sync3 = fifo_data_out[NO_OF_FIFO];

  /***************** Misc *******************/

 // assign adc_powerdown = 1'b0; // active low
  assign adc_rst = ctrl_reset;

  /*************** Iserdes ******************/
// ISERDES_NODELAY: Input SERial / DESerilizer
// Virtex- 5
// Xilinx HDL Libraries Guide version 8.2.2
/*
ISERDES_NODELAY #(
.BITSLIP_ENABLE("FALSE"), // TRUE/FALSE to enable bitslip controller
.DATA_RATE("DDR"), // Specify data rate of "DDR", "SDR" or "DDR_2CLK"
.DATA_WIDTH(4), // Specify data width - For DDR 4,6,8, or 10
// For SDR 2,3,4,5,6,7, or 8
.INTERFACE_TYPE("MEMORY"), // Use model - "MEMORY" or "NETWORKING"
.SERDES_MODE("MASTER"), // Set SERDES mode to "MASTER" or "SLAVE"
.NUM_CE(2) // Number of clock enables used, 1 or 2
) ISERDES_NODELAY_inst (
.Q1(Q1), // 1-bit registered SERDES output
.Q2(Q2), // 1-bit registered SERDES output
.Q3(Q3), // 1-bit registered SERDES output
.Q4(Q4), // 1-bit registered SERDES output
.Q5(Q5), // 1-bit registered SERDES output
.Q6(Q6), // 1-bit registered SERDES output
.SHIFTOUT1(SHIFTOUT1), // 1-bit cascade Master/Slave output
.SHIFTOUT2(SHIFTOUT2), // 1-bit cascade Master/Slave output
.D(D), // 1-bit data input, connects to IODELAY or input buffer
.BITSLIP(BITSLIP), // 1-bit Bitslip enable input
.CE1(CE1), // 1-bit clock enable input
.CE2(CE2), // 1-bit clock enable input
.CLK(CLK), // 1-bit master clock input
.CLKB(CLKB), // 1-bit secondary clock input
.CLKDIV(CLKDIV), // 1-bit divided clock input
.OCLK(OCLK) // 1-bit fast output clock input
);
*/

//----------------------------------------
//-- 4-bit ISERDES de-series 
//----------------------------------------
/***********
ISERDES_NODELAY #(
.BITSLIP_ENABLE("TRUE"),
.DATA_RATE("DDR"), 
.DATA_WIDTH(4), 
.INTERFACE_TYPE("NETWORKING"), 
.SERDES_MODE("MASTER"), 
.NUM_CE(2) 
)
 iserdes_data[0] (
.Q1(adc_di_d_3[0]), 
.Q2(adc_di_d_2[0]),
.Q3(adc_di_d_1[0]),
.Q4(adc_di_d_0[0]),
.SHIFTOUT1(open), 
.SHIFTOUT2(open), 
.D(adc_di_d[0]), 
.BITSLIP(gnd_bit), 
.CE1(vcc_bit), 
.CE2(vcc_bit), 
.CLK(adc_clk), 
.CLKB(adc_clk180), 
.CLKDIV(adc_clkdv), 
.OCLK(gnd_bit), 
.SHIFTIN1(gnd_bit), 
.SHIFTIN2(gnd_bit), 
.RST(ctrl_reset) 
);
******/



//parameter integer S = 4 ;   			// Parameter to set the serdes factor 1..8
parameter integer N = 8 ;			// Set the number of inputs and outputs
genvar i;


generate
for (i = 0 ; i <= (N-1) ; i = i+1)
begin : loop0
ISERDES_NODELAY #(
.BITSLIP_ENABLE("TRUE"),
//.BITSLIP_ENABLE("FALSE"),
.DATA_RATE("DDR"), 
.DATA_WIDTH(4), 
.INTERFACE_TYPE("NETWORKING"), 
//.INTERFACE_TYPE("MEMORY"), 

.SERDES_MODE("MASTER"),
.NUM_CE(2) 
)
iserdes_data_di_d (
.Q1(adc_di_d_3[i]),  
.Q2(adc_di_d_2[i]), 
.Q3(adc_di_d_1[i]), 
.Q4(adc_di_d_0[i]), 
.Q5(),
.Q6(),
.SHIFTOUT1(), 
.SHIFTOUT2(), 
.D(adc_di_d[i]),  
//.BITSLIP(1'b0),
.BITSLIP(1'b1),
.CE1(1'b1), 
.CE2(1'b1), 
.CLK(hi_adc_clk), 
.CLKB(hi_adc_clk180), 
.CLKDIV(adc_clk), 
//.OCLK(1'b0), 
//.OCLK(adc_clkdv),
//.OCLK(hi_adc_clk),
.SHIFTIN1(1'b0), 
.SHIFTIN2(1'b0), 
.RST(ctrl_reset) 
);

end
endgenerate



generate
for (i = 0 ; i <= (N-1) ; i = i+1)
begin : loop1
ISERDES_NODELAY #(
.BITSLIP_ENABLE("TRUE"),
//.BITSLIP_ENABLE("FALSE"),
.DATA_RATE("DDR"), 
.DATA_WIDTH(4), 
.INTERFACE_TYPE("NETWORKING"), 
//.INTERFACE_TYPE("MEMORY"), 
.SERDES_MODE("MASTER"),
.NUM_CE(2) 
)
iserdes_data_di (
.Q1(adc_di_3[i]),  
.Q2(adc_di_2[i]), 
.Q3(adc_di_1[i]), 
.Q4(adc_di_0[i]), 
.Q5(),
.Q6(),
.SHIFTOUT1(), 
.SHIFTOUT2(), 
.D(adc_di[i]),  
.BITSLIP(1'b1),
//.BITSLIP(1'b0), 
.CE1(1'b1), 
.CE2(1'b1), 
.CLK(hi_adc_clk), 
.CLKB(hi_adc_clk180), 
.CLKDIV(adc_clk), 
//.OCLK(1'b0), 
//.OCLK(adc_clkdv),
//.OCLK(hi_adc_clk),
.SHIFTIN1(1'b0), 
.SHIFTIN2(1'b0), 
.RST(ctrl_reset) 
);
end
endgenerate

generate
for (i = 0 ; i <= (N-1) ; i = i+1)
begin : loop2
ISERDES_NODELAY #(
.BITSLIP_ENABLE("TRUE"),
//.BITSLIP_ENABLE("FALSE"),
.DATA_RATE("DDR"), 
.DATA_WIDTH(4), 
.INTERFACE_TYPE("NETWORKING"), 
//.INTERFACE_TYPE("MEMORY"), 
.SERDES_MODE("MASTER"),
.NUM_CE(2) 
)
iserdes_data_dq_d(
.Q1(adc_dq_d_3[i]),  
.Q2(adc_dq_d_2[i]), 
.Q3(adc_dq_d_1[i]), 
.Q4(adc_dq_d_0[i]), 
.Q5(),
.Q6(),
.SHIFTOUT1(), 
.SHIFTOUT2(), 
.D(adc_dq_d[i]),  
//.BITSLIP(1'b0), 
.BITSLIP(1'b1),
.CE1(1'b1), 
.CE2(1'b1), 
.CLK(hi_adc_clk), 
.CLKB(hi_adc_clk180), 
.CLKDIV(adc_clk), 
//.OCLK(1'b0), 
//.OCLK(adc_clkdv),
//.OCLK(hi_adc_clk),
.SHIFTIN1(1'b0), 
.SHIFTIN2(1'b0), 
.RST(ctrl_reset) 
);

end
endgenerate

generate
for (i = 0 ; i <= (N-1) ; i = i+1)
begin : loop3
ISERDES_NODELAY #(
.BITSLIP_ENABLE("TRUE"),
//.BITSLIP_ENABLE("FALSE"),
.DATA_RATE("DDR"), 
.DATA_WIDTH(4), 
.INTERFACE_TYPE("NETWORKING"), 
//.INTERFACE_TYPE("MEMORY"), 
.SERDES_MODE("MASTER"),
.NUM_CE(2) 
)
iserdes_data_dq (
.Q1(adc_dq_3[i]),  
.Q2(adc_dq_2[i]), 
.Q3(adc_dq_1[i]), 
.Q4(adc_dq_0[i]), 
.Q5(),
.Q6(),
.SHIFTOUT1(), 
.SHIFTOUT2(), 
.D(adc_dq[i]),  
//.BITSLIP(1'b0), 
.BITSLIP(1'b1),
.CE1(1'b1), 
.CE2(1'b1), 
.CLK(hi_adc_clk), 
.CLKB(hi_adc_clk180), 
.CLKDIV(adc_clk), 
//.OCLK(adc_clkdv),
//.OCLK(hi_adc_clk),
//.OCLK(1'b0), 
.SHIFTIN1(1'b0), 
.SHIFTIN2(1'b0), 
.RST(ctrl_reset) 
);

end
endgenerate


endmodule
