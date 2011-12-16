//-----------------------------------------------------------------------------
// infrastructure_inst_wrapper.v
//-----------------------------------------------------------------------------

  (* x_core_info = "roach_infrastructure_v1_00_a" *)
module infrastructure_inst_wrapper
  (
    sys_clk_n,
    sys_clk_p,
    aux_clk_n,
    aux_clk_p,
    epb_clk_in,
    sys_clk,
    sys_clk90,
    sys_clk180,
    sys_clk270,
    sys_clk_lock,
    sys_clk2x,
    sys_clk2x90,
    sys_clk2x180,
    sys_clk2x270,
    aux_clk,
    aux_clk90,
    aux_clk180,
    aux_clk270,
    aux_clk2x,
    aux_clk2x90,
    aux_clk2x180,
    aux_clk2x270,
    epb_clk,
    idelay_rst,
    idelay_rdy
  );
  input sys_clk_n;
  input sys_clk_p;
  input aux_clk_n;
  input aux_clk_p;
  input epb_clk_in;
  output sys_clk;
  output sys_clk90;
  output sys_clk180;
  output sys_clk270;
  output sys_clk_lock;
  output sys_clk2x;
  output sys_clk2x90;
  output sys_clk2x180;
  output sys_clk2x270;
  output aux_clk;
  output aux_clk90;
  output aux_clk180;
  output aux_clk270;
  output aux_clk2x;
  output aux_clk2x90;
  output aux_clk2x180;
  output aux_clk2x270;
  output epb_clk;
  input idelay_rst;
  output idelay_rdy;

  roach_infrastructure
    #(
      .CLK_FREQ ( 450 )
    )
    infrastructure_inst (
      .sys_clk_n ( sys_clk_n ),
      .sys_clk_p ( sys_clk_p ),
      .aux_clk_n ( aux_clk_n ),
      .aux_clk_p ( aux_clk_p ),
      .epb_clk_in ( epb_clk_in ),
      .sys_clk ( sys_clk ),
      .sys_clk90 ( sys_clk90 ),
      .sys_clk180 ( sys_clk180 ),
      .sys_clk270 ( sys_clk270 ),
      .sys_clk_lock ( sys_clk_lock ),
      .sys_clk2x ( sys_clk2x ),
      .sys_clk2x90 ( sys_clk2x90 ),
      .sys_clk2x180 ( sys_clk2x180 ),
      .sys_clk2x270 ( sys_clk2x270 ),
      .aux_clk ( aux_clk ),
      .aux_clk90 ( aux_clk90 ),
      .aux_clk180 ( aux_clk180 ),
      .aux_clk270 ( aux_clk270 ),
      .aux_clk2x ( aux_clk2x ),
      .aux_clk2x90 ( aux_clk2x90 ),
      .aux_clk2x180 ( aux_clk2x180 ),
      .aux_clk2x270 ( aux_clk2x270 ),
      .epb_clk ( epb_clk ),
      .idelay_rst ( idelay_rst ),
      .idelay_rdy ( idelay_rdy )
    );

endmodule

