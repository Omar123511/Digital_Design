quit -sim
vlog -work work clk_divider.sv clk_divider_tb.sv 
vsim -voptargs=+acc work.clk_divider_tb -do "add wave *; run -all;"