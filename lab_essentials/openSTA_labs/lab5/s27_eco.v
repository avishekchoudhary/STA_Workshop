module s27 (G1,
    G2,
    clk_net,
    reset_net,
    G3,
    G0,
    G17);
 input G1;
 input G2;
 input clk_net;
 input reset_net;
 input G3;
 input G0;
 output G17;

 wire c1;
 wire c2;
 wire c3;
 wire c4;
 wire c4_1;
 wire c4_2;
 wire c4_3;
 wire c5;
 wire c6;
 wire n1;
 wire n2;
 wire n3;
 wire n4;
 wire n5;
 wire n6;

 DFFR_X2 F1 (.CK(c4),
    .D(G0),
    .Q(n1));
 DFFR_X2 F2 (.CK(c5),
    .D(n6),
    .Q(G17));
 CLKBUF_X2 U10 (.A(c2),
    .Z(c3));
 CLKBUF_X2 U11 (.A(c3),
    .Z(c4_1));
 CLKBUF_X2 U12 (.A(c4_1),
    .Z(c4_2));
 CLKBUF_X2 U13 (.A(c4_2),
    .Z(c4_3));
 CLKBUF_X2 U14 (.A(c4_3),
    .Z(c4));
 CLKBUF_X2 U15 (.A(c2),
    .Z(c6));
 CLKBUF_X3 U16 (.A(c6),
    .Z(c5));
 INV_X1 U3 (.A(n1),
    .ZN(n2));
 INV_X1 U4 (.A(n2),
    .ZN(n3));
 NAND2_X2 U5 (.A1(n3),
    .A2(n2),
    .ZN(n5));
 NAND2_X2 U6 (.A1(n1),
    .A2(n3),
    .ZN(n4));
 NOR2_X1 U7 (.A1(n4),
    .A2(n5),
    .ZN(n6));
 CLKBUF_X2 U8 (.A(clk_net),
    .Z(c1));
 CLKBUF_X2 U9 (.A(c1),
    .Z(c2));
endmodule
