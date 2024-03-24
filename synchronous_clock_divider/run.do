quit -sim
vlog -work work dff.sv mod_10_counter.sv clk_div_by_10.sv clk_div_by_10_tb.sv  
vsim -voptargs=+acc work.clk_div_by_10_tb
#add wave *
add wave -position insertpoint  \
sim:/clk_div_by_10_tb/clk_div_by_10_inst_0/* \
sim:/clk_div_by_10_tb/clk_div_by_10_inst_0/mod_10_counter_inst_0/*
run -all