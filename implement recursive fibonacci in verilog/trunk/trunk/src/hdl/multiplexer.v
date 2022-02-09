`timescale 1ns/1ns
module multiplexer(input [2:0]N, a, input s, output [2:0] outMux); 

C1 m1(1'b0, 1'b0, 1'b0, N[0], a[0], s, 1'b1, 1'b1, outMux[0]);
C1 m2(1'b0, 1'b0, 1'b0, N[1], a[1], s, 1'b1, 1'b1, outMux[1]);
C1 m3(1'b0, 1'b0, 1'b0, N[2], a[2], s, 1'b1, 1'b1, outMux[2]);

 //C1(input A0, A1, SA, B0, B1, SB, S0, S1, output F);
endmodule