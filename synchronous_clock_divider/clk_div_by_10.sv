module clk_div_by_10 (
	input i_clk,    // Clock
	input i_rst_n,  // Asynchronous reset active low
	output reg o_clk
);
	reg [3:0] r_counter;
	reg r_q;

  mod_10_counter mod_10_counter_inst_0 (i_clk, i_rst_n, r_counter);

  dff dff_inst_0 (i_clk, i_rst_n, r_counter[2], r_q);


  assign o_clk = r_counter[2] | r_q;


endmodule : clk_div_by_10