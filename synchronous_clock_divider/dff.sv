module dff (
  input      i_clk,
  input      i_rst_n,
  input      i_d,
  output reg o_q
);


  always@(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
	  o_q <= 0;
	end
	else begin
	  o_q <= i_d;
	end
  end
    
endmodule