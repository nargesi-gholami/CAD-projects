`timescale 1ns/1ns

wire push, pop, s, s1, ld, z_ans, G;

fibDatapath df(clk, rst, N, push, pop, s, s1, ld, z_ans, G, isEmpty, out);
fibController cf(clk, rst, G, push, pop, s, s1, ld, z_ans);

endmodule