`timescale 1ns/1ns
module combToplevel(input clk, rst, start, [3:0]N, output Done, output[14:0]answer);

wire isEmpty, eq1, eq2, push, pop, ldM, s1,ld_ans, z_ans;

wire[1:0] s;

combController cc(clk, rst, start, isEmpty, eq1, eq2, s, push, pop, ldM, s1, ld_ans, z_ans, Done);
combDataPath cd(N, clk, rst, s, push, pop, ldM, s1, ld_ans, z_ans, isEmpty, eq1, eq2, answer );

endmodule
