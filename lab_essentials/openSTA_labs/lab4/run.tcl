set sta_crpr_enabled 0
read_liberty -max s27_Late.lib
read_liberty -min s27_Early.lib
read_verilog s27.v
link_design s27
read_sdc s27.sdc
## Try run with cppr -disable
report_checks -to F2/D -format full_clock_expanded 
