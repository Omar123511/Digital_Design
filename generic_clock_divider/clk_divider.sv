module clk_divider #(parameter DIVISOR = 4, parameter WIDTH = $clog2(DIVISOR)) (
	input 		i_clk,    // Clock
	input 		i_rst_n,  // Asynchronous reset active low
	output 		o_clk
	
);

  localparam WIDTH_TEST = $clog2(DIVISOR << 1);
  logic [WIDTH_TEST : 0] l_count_tst;


  	logic [WIDTH : 0] l_count, l_even_count;
	reg r_n_clk, r_p_clk, r_even_clk;
    reg [$clog2(WIDTH) : 0] r_pos;
	
	assign r_pos = WIDTH - 1;

    mod_n #(.SIZE(DIVISOR)) inst0_mod_n (i_clk, i_rst_n, l_count);

    always_ff @(posedge i_clk or negedge i_rst_n) begin : proc_l_even_count
    	if(~i_rst_n) begin
    		l_even_count <= 0;
			r_even_clk <= 0;
        end else if (l_even_count < (DIVISOR/2) - 1) begin
    		l_even_count <= l_even_count + 1;
    	end
    	else begin
    		r_even_clk <= ~r_even_clk;
			l_even_count <= 0;
    	end
    end

	always_ff @(negedge i_clk or negedge i_rst_n) begin : proc_l_count
		// if(~i_rst_n) begin
        //   l_count[r_pos] <= 0;
		// end else begin
			r_n_clk <= l_count[r_pos];
		// end
	end

/////////////////////////////The used always_block//////////////////////////
  always_ff @(posedge i_clk or negedge i_clk or negedge i_rst_n) begin
		if(~i_rst_n) begin
          l_count_tst <= '0;
		end 
		  else begin
            if(l_count_tst == ((DIVISOR << 1) - 1)) begin
              l_count_tst <= '0;
          end
		  else begin
			l_count_tst <= l_count_tst + 1;
          end
		end
	end
//////////////////////////////////////////////////////////////////////////


  always_ff @(posedge i_clk or negedge i_rst_n) begin
					r_p_clk <= l_count[r_pos];
		
	end
//   assign o_clk = (DIVISOR % 2 == 0)? r_even_clk : r_n_clk;
//   assign o_clk = ($clog2(DIVISOR) % 2 == 0)? l_count[1] : (r_n_clk | l_count[1]);

//   assign o_clk = ($clog2(DIVISOR) % 2 == 0)? l_count[r_pos] :  ((DIVISOR % 2 == 0)? (r_p_clk | l_count[r_pos]) : (r_n_clk | l_count[r_pos]));
  
//   assign o_clk = (DIVISOR % 2 == 0)? ((($clog2(DIVISOR) % 2 == 0) || (($clog2(DIVISOR)-1) % 2 == 0))? l_count[r_pos] : (r_p_clk | l_count[r_pos])) :  (r_n_clk | l_count[r_pos]);
 
//     assign o_clk = l_count[r_pos];
//     assign o_clk = r_p_clk | l_count[r_pos];
//     assign o_clk = r_n_clk | l_count[r_pos];
//     assign o_clk = r_even_clk;

      assign o_clk = l_count_tst >= DIVISOR;



	

endmodule : clk_divider


module mod_n #(parameter SIZE = 4, parameter WIDTH = $clog2(SIZE)) (
	input i_clk,    // Clock
	input i_rst_n,  // Asynchronous reset active low
	output logic [WIDTH : 0] o_count
);

	// localparam lp_width = $clog2(SIZE);
	// reg [WIDTH : 0] r_count; 

	always_ff @(posedge i_clk or negedge i_rst_n) begin : proc_o_count
      if(~i_rst_n || o_count == SIZE-1) begin
			o_count <= 0;
		end 

		else begin
			o_count <= o_count + 1;			
		end

	end

endmodule : mod_n