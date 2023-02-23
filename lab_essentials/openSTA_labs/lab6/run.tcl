read_liberty ../sky130_fd_sc_hd__tt_025C_1v80.lib 
read_verilog s27.v
link_design s27
read_sdc -echo s27.sdc
check_setup -verbose
report_checks -to [get_pins clkgate/*]
