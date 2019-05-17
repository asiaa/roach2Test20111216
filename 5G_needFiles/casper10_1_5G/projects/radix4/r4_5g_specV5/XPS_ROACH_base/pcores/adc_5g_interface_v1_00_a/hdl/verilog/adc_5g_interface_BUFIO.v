/*
 *
 * ADC Interface for KAT ACD w/ National Semiconductor ADC08D1500
* modify the filename for ASIAA 5G adc
* Comment out powerdown pin 2010-04-01
 *
* Modified for clock domain crossing for 5G. 2010-05-17
 */

module adc_5g_interface #(
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
    output [7:0] user_datai3,
    output [7:0] user_datai2,
    output [7:0] user_datai1,
    output [7:0] user_datai0,
    output [7:0] user_dataq3,
    output [7:0] user_dataq2,
    output [7:0] user_dataq1,
    output [7:0] user_dataq0,
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
    // Clock to use for output data domain crossing 
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

/******** modified for clock domain crossing **************/

  IDDR #( 
    .DDR_CLK_EDGE ("SAME_EDGE_PIPELINED"),
    .INIT_Q1      (0),
    .INIT_Q2      (0),
    .SRTYPE       ("SYNC")
  ) iddr_overrange (
    .Q1 (adc_overrange_rise),
    .Q2 (adc_overrange_fall),
//    .C  (adc_clk),
    .C  (hi_adc_clk),
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

  wire adc_clk_dcm, adc_clk90_dcm, adc_clk180_dcm, adc_clk270_dcm;
  BUFG bufg_adc_clk[3:0](
    .I  ({adc_clk_dcm, adc_clk90_dcm, adc_clk180_dcm, adc_clk270_dcm}),
    .O  ({adc_clk, adc_clk90, adc_clk180, adc_clk270})
  );

/*********
  wire adc_clk_dcm, adc_clk90_dcm, adc_clk180_dcm, adc_clk270_dcm;
  BUFG bufg_adc_clk[3:0](
    .I  ({adc_clk_dcm, adc_clk180_dcm, adc_clk180_dcm, adc_clk180_dcm}),
    .O  ({adc_clk, adc_clk90, adc_clk180, adc_clk270})
  );
*********/

  assign ctrl_clk_out    = adc_clk;
  assign ctrl_clk90_out  = adc_clk90;
  assign ctrl_clk180_out = adc_clk180;
  assign ctrl_clk270_out = adc_clk270;


/*********** Domain crossing DCM *************/
/*
BUFG bufg_hi_adc_clk
  (
.O(hi_adc_clk), // Clock buffer outpu
.I(hi_adc_clk_dcm) // Clock buffer input
);
 */
/*
BUFR bufg_hi_adc_clk
  (
.O(hi_adc_clk), // Clock buffer outpu
.CE(1'b1),
.CLR(1'b0),
.I(hi_adc_clk_dcm) // Clock buffer input
);
*/

BUFIO bufg_hi_adc_clk
  (
.O(hi_adc_clk), // Clock buffer outpu
.I(hi_adc_clk_dcm) // Clock buffer input
);

/******** trying **********/
BUFIO bufg_hi_adc_clk_fifo
  (
.O(hi_adc_clk_fifo), // Clock buffer outpu
.I(hi_adc_clk_dcm) // Clock buffer input
);


/******** trying **********/

BUFIO bufg_hi_adc_clk_reg
  (
.O(hi_adc_clk_reg), // Clock buffer outpu
.I(hi_adc_clk_dcm) // Clock buffer input
);


/******** trying **********/

BUFIO bufg_hi_adc_clk_ddr
  (
.O(hi_adc_clk_ddr), // Clock buffer outpu
.I(hi_adc_clk_dcm) // Clock buffer input
);


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
  ) dcm_inst_1 (
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
    .CLK2X180              (),
    .CLK90                 (adc_clk90_dcm),
    .CLK180                (adc_clk180_dcm),
    .CLK270                (adc_clk270_dcm),
    .LOCKED                (ctrl_dcm_locked),
    .PSDONE                (dcm_psdone),
    .STATUS                ()
  );


/*********** original DCM *************/
/*
  DCM #(
    .CLK_FEEDBACK          ("1X"),
    .CLKDV_DIVIDE          (2.000000),
    .CLKFX_DIVIDE          (1),
    .CLKFX_MULTIPLY        (4),
    .CLKIN_PERIOD          (3.906250),
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
    .CLKDV                 (),
    .CLKFX                 (),
    .CLKFX180              (),
    .CLK0                  (adc_clk_dcm),
    .CLK2X                 (),
    .CLK2X180              (),
    .CLK90                 (adc_clk90_dcm),
    .CLK180                (adc_clk180_dcm),
    .CLK270                (adc_clk270_dcm),
    .LOCKED                (ctrl_dcm_locked),
    .PSDONE                (dcm_psdone),
    .STATUS                ()
  );
*/

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

  wire [7:0] adc_di_d_rise;
  wire [7:0] adc_di_rise;
  wire [7:0] adc_dq_d_rise;
  wire [7:0] adc_dq_rise;

  wire [7:0] adc_di_d_fall;
  wire [7:0] adc_di_fall;
  wire [7:0] adc_dq_d_fall;
  wire [7:0] adc_dq_fall;

/******** modified for clock domain crossing **************/


  IDDR #( 
    .DDR_CLK_EDGE ("SAME_EDGE_PIPELINED"),
    .INIT_Q1      (1'b0),
    .INIT_Q2      (1'b0)
  ) iddr_data[31:0] (
    .Q1 ({adc_di_d_rise, adc_di_rise, adc_dq_d_rise, adc_dq_rise}),
    .Q2 ({adc_di_d_fall, adc_di_fall, adc_dq_d_fall, adc_dq_fall}),
    .C  (hi_adc_clk_ddr),
//  .C  (adc_clk),
    .CE (1'b1),
    .D  ({adc_di_d, adc_di, adc_dq_d, adc_dq}),
    .R  (1'b0),
    .S  (1'b0)
  );

  /*************** ADC Clock Domain FIFO *****************/

  wire [69:0] fifo_data_in;
  wire [69:0] reg_data_in;
 assign reg_data_in = {capture_sync, adc_overrange_fall, adc_overrange_rise, adc_dq_fall, adc_dq_d_fall, adc_dq_rise, adc_dq_d_rise, adc_di_fall, adc_di_d_fall, adc_di_rise, adc_di_d_rise};
/* timing contraint failed if switch to the following*/
 //assign reg_data_in = {capture_sync, adc_overrange_fall, adc_overrange_rise, adc_dq_fall, adc_dq_d_fall, adc_di_fall, adc_di_d_fall, adc_dq_rise,  adc_dq_d_rise, adc_di_rise, adc_di_d_rise};


  wire [69:0] fifo_data_out;
  wire fifo_empty;

  reg fifo_rd_en;

/* Optional stage of registeration to between input buffer and 
   clock domain crossing FIFO to improve timing performance */

/******** modified to clock domain crossing ********/

generate if (EXTRA_REG) begin : with_extra_reg

  reg [69:0] extra_reg;
  always @(posedge hi_adc_clk_reg) begin
//  always @(posedge adc_clk) begin

    extra_reg <= reg_data_in;
  end
  assign fifo_data_in = extra_reg;
  
end else begin
  assign fifo_data_in = reg_data_in;
end endgenerate
  

/******** modified to clock domain crossing ********/
  adc_async_fifo adc_async_fifo_inst(
    .rst    (dcm_reset),
    .din    (fifo_data_in),
    .wr_clk (hi_adc_clk_fifo),
//    .wr_clk (adc_clk),
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

  assign user_datai0 = fifo_data_out[7:0];
  assign user_datai2 = fifo_data_out[15:8];
  assign user_dataq0 = fifo_data_out[23:16];
  assign user_dataq2 = fifo_data_out[31:24];

  assign user_datai1 = fifo_data_out[39:32];
  assign user_datai3 = fifo_data_out[47:40];
  assign user_dataq1 = fifo_data_out[55:48];
  assign user_dataq3 = fifo_data_out[63:56];


  assign user_outofrange0 = fifo_data_out[64];
  assign user_outofrange1 = fifo_data_out[65];
  assign user_sync0 = fifo_data_out[66];
  assign user_sync1 = fifo_data_out[67];
  assign user_sync2 = fifo_data_out[68];
  assign user_sync3 = fifo_data_out[69];

  /***************** Misc *******************/

 // assign adc_powerdown = 1'b0; // active low
  assign adc_rst = ctrl_reset;
  
endmodule