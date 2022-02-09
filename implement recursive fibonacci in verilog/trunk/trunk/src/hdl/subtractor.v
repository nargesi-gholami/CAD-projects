`timescale 1ns/1ns
module subtractor(input [2:0]a, b, output [2:0]s);

wire Bo1, Bo2;
wire [2:0] nota, notb;

C1 not1(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, a[0], 1'b1, 1'b1, nota[0]);
C1 not2(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, a[1], 1'b1, 1'b1, nota[1]);
C1 not3(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, a[2], 1'b1, 1'b1, nota[2]);
C1 not4(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, b[0], 1'b1, 1'b1, notb[0]);
C1 not5(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, b[1], 1'b1, 1'b1, notb[1]);
C1 not6(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, b[2], 1'b1, 1'b1, notb[2]);

C1 S1( b[0], notb[0], a[0], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, s[0]);// xor
C1 S2( b[1], notb[1], a[1], notb[1], b[1], a[1], Bo1, 1'b0, s[1]); // xor inputs and Bo1
C1 S3( b[2], notb[2], a[2], notb[2], b[2], a[2], Bo2, 1'b0, s[2]);//xor inputs and Bo2


C1 B0(1'b0, nota[0], b[0], nota[0], 1'b1, b[0], 1'b0, 1'b0, Bo1);
C1 B1(1'b0, nota[1], b[1], nota[1], 1'b1, b[1], 1'b0, Bo1, Bo2);



endmodule
