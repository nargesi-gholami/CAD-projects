`timescale 1ns/1ns
module C1(input A0, A1, SA, B0, B1, SB, S0, S1, output F);

wire F1, F2, F3, F4, S2;

assign #1  F1 = SA ? A1 : A0;

assign #1  F2 = SB ? B1 : B0;

assign #0.5 S2 = S0 | S1; 

assign #1  F = S2 ? F2 : F1; 

endmodule