`timescale 1ns/1ns
module comparatorWithOne(input[2:0] a, output G);


C1 compare( 1'b0, 1'b0, 1'b0, a[2], 1'b1, a[1], 1'b0, 1'b1, G);// all 1'b0 are don't care


//C1(input A0, A1, SA, B0, B1, SB, S0, S1, output F);
endmodule