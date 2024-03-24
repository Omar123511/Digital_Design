module clk_divider_tb;
	
  localparam SIZE = 4; localparam WIDTH = $clog2(SIZE);
	
	bit i_clk;    // Clock
	bit i_rst_n;  // Asynchronous reset active low
    bit o_clk;

  clk_divider #(.DIVISOR(15)) inst0 (.*);


	initial begin
		i_clk = 0;
		forever begin
			#1 i_clk = ~i_clk;
        end
    end

	
	
  	initial begin
		#10
		i_rst_n = 0;
		
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
	

endmodule