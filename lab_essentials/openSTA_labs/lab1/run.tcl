## reading liberty model
read_liberty ../sky130_fd_sc_hd__tt_025C_1v80.lib 
## reading netlist model
read_verilog simple.v
link_design simple
## Parsing constraints
read_sdc -echo simple.sdc
## report timing reports for 5 paths
report_checks -group_count 5
