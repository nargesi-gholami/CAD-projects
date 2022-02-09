`timescale 1ns/1ns
module fibDatapath(input clk,rst,input[2:0]N,input push, pop, s, s1, ld,z_ans,  output G, isEmpty, output [4:0] sout);

wire[2:0] outSub,outSub2, nextSub, preStack, nextStack;

multiplexer mx(nextSub, N, s, preStack);//ok
stack st(clk, preStack, push, pop, isEmpty, nextStack);

comparatorWithOne comp(nextStack, G);

subtractor sub1(nextStack, 3'b001, outSub);
subtractor sub2(outSub, 3'b001, outSub2);

multiplexer mx2(outSub2, outSub, s1, nextSub);

accumulator acc(1'b0, ld, z_ans, clk, sout);

endmodule
