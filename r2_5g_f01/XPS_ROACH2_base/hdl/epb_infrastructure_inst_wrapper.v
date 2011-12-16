//-----------------------------------------------------------------------------
// epb_infrastructure_inst_wrapper.v
//-----------------------------------------------------------------------------

  (* x_core_info = "epb_infrastructure_v1_00_a" *)
module epb_infrastructure_inst_wrapper
  (
    epb_data_buf,
    epb_data_oe_n_i,
    epb_data_out_i,
    epb_data_in_o
  );
  inout [31:0] epb_data_buf;
  input epb_data_oe_n_i;
  input [31:0] epb_data_out_i;
  output [31:0] epb_data_in_o;

  epb_infrastructure
    epb_infrastructure_inst (
      .epb_data_buf ( epb_data_buf ),
      .epb_data_oe_n_i ( epb_data_oe_n_i ),
      .epb_data_out_i ( epb_data_out_i ),
      .epb_data_in_o ( epb_data_in_o )
    );

endmodule

