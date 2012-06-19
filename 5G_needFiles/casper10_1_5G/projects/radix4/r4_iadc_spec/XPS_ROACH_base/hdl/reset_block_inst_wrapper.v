//-----------------------------------------------------------------------------
// reset_block_inst_wrapper.v
//-----------------------------------------------------------------------------

module reset_block_inst_wrapper
  (
    clk,
    async_reset_i,
    reset_i,
    reset_o
  );
  input clk;
  input async_reset_i;
  input reset_i;
  output reset_o;

  reset_block
    #(
      .DELAY ( 10 ),
      .WIDTH ( 50 )
    )
    reset_block_inst (
      .clk ( clk ),
      .async_reset_i ( async_reset_i ),
      .reset_i ( reset_i ),
      .reset_o ( reset_o )
    );

endmodule

// synthesis attribute x_core_info of reset_block_inst_wrapper is reset_block_v1_00_a;

