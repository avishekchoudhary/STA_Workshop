read_liberty s27_Late.lib
read_verilog s27.v
link_design s27
read_sdc s27.sdc
report_checks -from F1/CK
