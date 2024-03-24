module clk_div_by_10_tb ();


	reg i_clk;    // Clock
	reg i_rst_n;  // Asynchronous reset active low
	wire o_clk;

	clk_div_by_10 clk_div_by_10_inst_0 (.*);



	initial begin
		i_clk = 0;
		forever begin
			#1 i_clk = ~i_clk;
        end
    end

	
	
  	initial begin
		#10
		i_rst_n = 0;
		#10
		i_rst_n = 1;
// 		#10
// 		$dumpfile("dump.vcd");
//       $dumpvars(1);
// 		#50
// 		$stop;
    end

	initial begin
		#100
		$stop;
    end
	

endmodule : clk_div_by_10_tb