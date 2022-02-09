`timescale 1ns/1ns
module combDataPath(input [3:0] N, input clk, rst, input[1:0] s,input push, pop, ldM, s1, ld_ans, z_ans, output isEmpty, eq1, eq2, output[14:0]answer );

wire [3:0] preStack, nextStack, outRegM, outSubtract, outSubtract2;
wire [14:0] outInc;
multiplexer3 m3(N, outRegM, outSubtract2, s, preStack);

stack st(clk, rst, preStack, push, pop, isEmpty, nextStack);

register#4 MReg(clk, rst, ldM, 1'b0,  nextStack, outRegM);

camparator compZM(outRegM, 4'b0, eq1);
camparator compNM(outRegM, nextStack, eq2);

multiplexer2#4 m2(outRegM , nextStack , s1, outSubtract);

assign outSubtract2= outSubtract - 4'b0001;

register#15 ansReg(clk, rst, ld_ans, z_ans, outInc, answer);
assign outInc = answer + 15'd1;

endmodule

