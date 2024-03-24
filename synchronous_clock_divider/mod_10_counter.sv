module mod_10_counter (
	input i_clk,    // Clock
	input i_rst_n,  // Asynchronous reset active low
	output reg [3:0] o_count
);

  reg l_q_0, l_q_1, l_q_2, l_q_3; 

  // dff dff_inst_0 (i_clk, i_rst_n, (!l_q_0 & (!l_q_3 | !l_q_1)), l_q_0);
  // dff dff_inst_1 (i_clk, i_rst_n, (!l_q_3 & (l_q_0 ^ l_q_1	)), l_q_1);
  // dff dff_inst_2 (i_clk, i_rst_n, ((l_q_2 & !l_q_1) | (!l_q_2 & l_q_1 & l_q_0) | (!l_q_3 & l_q_2 & !l_q_0)), l_q_2);
  // dff dff_inst_3 (i_clk, i_rst_n, ((!l_q_0 & !l_q_1 & !l_q_2 & l_q_3) | (l_q_0 & l_q_2)), l_q_3);

  dff dff_inst_0 (i_clk, i_rst_n, (~l_q_0), l_q_0);
  dff dff_inst_1 (i_clk, i_rst_n, ((l_q_1 & ~l_q_0) | (~l_q_3 & ~l_q_1 & l_q_0)), l_q_1);
  dff dff_inst_2 (i_clk, i_rst_n, ((l_q_2 & ~l_q_1) | (l_q_2 & ~l_q_0) | (~l_q_2 & l_q_1 & l_q_0)), l_q_2);
  dff dff_inst_3 (i_clk, i_rst_n, ((l_q_3 & ~l_q_0) | (l_q_2 & l_q_1 & l_q_0)), l_q_3);


  assign o_count = {l_q_3, l_q_2, l_q_1, l_q_0};


endmodule : mod_10_counter