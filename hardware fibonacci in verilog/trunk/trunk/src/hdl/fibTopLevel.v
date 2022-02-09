`timescale 1ns/1ns
module fibTopLevel(input clk, rst, [4:0] N, output[9:0] out, output outReady);

wire ans, second, G, isEmpty, ld, ldI, ldA, pop, top, push, s1;
wire [1:0]s;

fibController fc(clk,rst, ans, second, G, isEmpty, ld, ldI, ldA, pop, top, push, s1, outReady, s);

fibDataPath fd(N, clk, ldI, ld, ldA, pop, top, push, s1, s, ans, second, G, isEmpty, out);

endmodule