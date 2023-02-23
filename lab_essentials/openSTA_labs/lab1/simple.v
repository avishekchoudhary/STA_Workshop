module simple (
inp1,
inp2,
tau2015_clk,
out
);

// Start PIs
input inp1;
input inp2;
input tau2015_clk;

// Start POs
output out;

// Start wires
wire n1;
wire n2;
wire n3;
wire n4;
wire inp1;
wire inp2;
wire tau2015_clk;
wire out;

// Start cells
sky130_fd_sc_hd__nand2_1 u1 ( .A(inp1), .B(inp2), .Y(n1) );
sky130_fd_sc_hd__dfbbn_2 f1 ( .D(n2), .CLK_N(tau2015_clk), .Q(n3),.SET_B(1'b1),.RESET_B(1'b1));
sky130_fd_sc_hd__inv_1 u2 ( .A(n3), .Y(n4) );
sky130_fd_sc_hd__inv_1 u3 ( .A(n4), .Y(out) );
sky130_fd_sc_hd__nor2_1 u4 ( .A(n1), .B(n3), .Y(n2) );

endmodule
