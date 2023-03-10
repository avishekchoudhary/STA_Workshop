create_clock -period 1 -name clk_net [get_ports clk_net]
set_input_delay 0 -min -rise [get_ports G1] -clock clk_net
set_input_delay 0 -min -fall [get_ports G1] -clock clk_net
set_input_delay 0 -max -rise [get_ports G1] -clock clk_net
set_input_delay 0 -max -fall [get_ports G1] -clock clk_net
set_input_transition 5 -min -rise [get_ports G1] 
set_input_transition 5 -min -fall [get_ports G1] 
set_input_transition 5 -max -rise [get_ports G1] 
set_input_transition 5 -max -fall [get_ports G1] 
set_input_delay 0 -min -rise [get_ports G2] -clock clk_net
set_input_delay 0 -min -fall [get_ports G2] -clock clk_net
set_input_delay 0 -max -rise [get_ports G2] -clock clk_net
set_input_delay 0 -max -fall [get_ports G2] -clock clk_net
set_input_transition 5 -min -rise [get_ports G2]
set_input_transition 5 -min -fall [get_ports G2]
set_input_transition 5 -max -rise [get_ports G2]
set_input_transition 5 -max -fall [get_ports G2]
set_input_delay 0 -min -rise [get_ports clk_net] -clock clk_net
set_input_delay 0 -min -fall [get_ports clk_net] -clock clk_net
set_input_delay 0 -max -rise [get_ports clk_net] -clock clk_net
set_input_delay 0 -max -fall [get_ports clk_net] -clock clk_net
set_input_transition 5 -min -rise [get_ports clk_net] 
set_input_transition 5 -min -fall [get_ports clk_net] 
set_input_transition 5 -max -rise [get_ports clk_net] 
set_input_transition 5 -max -fall [get_ports clk_net] 
set_input_delay 0 -min -rise [get_ports reset_net] -clock clk_net
set_input_delay 0 -min -fall [get_ports reset_net] -clock clk_net
set_input_delay 0 -max -rise [get_ports reset_net] -clock clk_net
set_input_delay 0 -max -fall [get_ports reset_net] -clock clk_net
set_input_transition 5 -min -rise [get_ports reset_net] 
set_input_transition 5 -min -fall [get_ports reset_net] 
set_input_transition 5 -max -rise [get_ports reset_net] 
set_input_transition 5 -max -fall [get_ports reset_net] 
set_input_delay 0 -min -rise [get_ports G3] -clock clk_net
set_input_delay 0 -min -fall [get_ports G3] -clock clk_net
set_input_delay 0 -max -rise [get_ports G3] -clock clk_net
set_input_delay 0 -max -fall [get_ports G3] -clock clk_net
set_input_transition 5 -min -rise [get_ports G3] 
set_input_transition 5 -min -fall [get_ports G3] 
set_input_transition 5 -max -rise [get_ports G3] 
set_input_transition 5 -max -fall [get_ports G3] 
set_input_transition 5 -min -rise [get_ports G0] 
set_input_transition 5 -min -fall [get_ports G0] 
set_input_transition 5 -max -rise [get_ports G0] 
set_input_transition 5 -max -fall [get_ports G0] 
set_output_delay -2.1 -min -rise [get_ports G17] -clock clk_net
set_output_delay -2.1 -min -fall [get_ports G17] -clock clk_net
set_output_delay -1.2 -max -rise [get_ports G17] -clock clk_net
set_output_delay -1.2 -max -fall [get_ports G17] -clock clk_net
set_load -pin_load 4 [get_ports G17]
set_propagated_clock [all_clocks]
