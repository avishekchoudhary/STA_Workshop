module s27 (
G1,
G2,
clk_net,
reset_net,
G3,
G0,
G17);

//Start PIs
input G0;
input G1;
input G2;
input G3;
input clk_net,reset_net;

//Start POs
output G17;

wire n1,n2,n3,n4,n5,n6,n7,n8,n9;
sky130_fd_sc_hd__dfbbp_1 F1 (.D(G0), .CLK(clk_net), .Q(n1),.RESET_B(1'b1),.SET_B(1'b1));
sky130_fd_sc_hd__inv_1 U3 (.A(n1), .Y(n2));
sky130_fd_sc_hd__inv_1 U4 (.A(n2), .Y(n3));
sky130_fd_sc_hd__nand2_1 U6 (.Y(n4), .A(n1), .B(n3));
sky130_fd_sc_hd__nand2_1 U5 (.Y(n5), .A(n3), .B(n2));
sky130_fd_sc_hd__nor2_1 U7 (.Y(n6), .A(n4), .B(n5));
sky130_fd_sc_hd__dfbbp_1 F2 (.D(G1), .CLK(gclk), .Q(G17),.RESET_B(1'b1),.SET_B(1'b1));

//Clock Gating Analysis
wire gclk;
sky130_fd_sc_hd__dlclkp_4 clkgate (.CLK(clk_net),.GATE(n6),.GCLK(gclk)); 
endmodule


