`timescale 1ns/1ns
module fibDataPath(input [4:0] N,input clk, ldI, ld, ldA, pop, top, push, s1, [1:0]s, output answer, second, G, isEmpty,[9:0] out);

wire[9:0] out1, outRegIn, outReg1, outReg2, outMult3, outMult4, outA, outF, outs1;
wire [10:0] outs, outStack, outTemp ;
wire G1;
wire outAns;

register#10 IN(clk, ldI,{5'b0, N}, out1);
multiplexer3 mults({6'b0,N}, {1'b0,outs1},{1'b1, outA}, s, outs);

stack sta(clk, outs, push, top, pop, isEmpty, outStack);

register#11 temp(clk, 1'b1, outStack, outTemp);

camparator comp(outStack[9:0], 10'b0000000001, G);

assign answer = outStack[10];

assign second = isEmpty | answer;

multiplexer2 #10 mult2(outStack[9:0] - 10'b0000000001 , outTemp[9:0] - 10'b0000000010 , s1, outs1);


register#10 regIn(clk, ld, outStack[9:0], outRegIn);
register#10 reg2(clk, ld, outRegIn, outReg2);
register#10 reg1(clk, ld, outReg2, outReg1);

camparator comp2(outRegIn, out1 >> 1, G1);
multiplexer2 #10 mult3( outRegIn - 10'b0000000010, outRegIn - 10'b0000000001 , G1, outMult3);
multiplexer2 #10 mult4( outRegIn - 10'b0000000001, outRegIn - 10'b0000000010 , G1, outMult4);

assign outF = outMult3 * outReg2 + outMult4 * outReg1;

register#1 A(clk, ldA, answer, outAns);
multiplexer2 #10 mult5(10'b0000000001, outF, outAns ,outA);

assign out = outF;
 
endmodule
