read_liberty -min simple_min.lib
read_liberty -max simple_max.lib
read_verilog simple.v
link_design simple
read_spef simple.spef
read_sdc simple.sdc
report_checks -through u1/a
