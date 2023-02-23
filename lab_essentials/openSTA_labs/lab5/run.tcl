read_liberty -min s27_Early.lib
read_liberty -max s27_Late.lib
read_verilog s27.v
link_design s27
read_sdc s27.sdc
report_checks -through F2/CK -path_delay max
report_checks -through F2/CK -path_delay min 
### Inserting Timing ECOs
make_instance U16 CLKBUF_X3
make_net c6
disconnect_pin c5 U15/Z
connect_pin c6 U15/Z
connect_pin c6 U16/A
connect_pin c5 U16/Z
write_verilog s27_eco.v
report_checks -through F2/CK -path_delay max
report_checks -through F2/CK -path_delay min 
