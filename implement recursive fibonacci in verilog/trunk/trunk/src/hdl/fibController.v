`timescale 1ps/1ps
module fibController(input clk, rst, G, output push, pop, s, s1, ld, zero);

wire [2:0] ps, ns, notps;
// A-->ps[2]
// B-->ps[1]
// C-->ps[0]

// next state
C1 not1(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, ps[2], 1'b1, 1'b1, notps[2]);
C1 c1out1(1'b0, 1'b0, 1'b0, 1'b0, 1'b1, notps[2], ps[0], 1'b0, ns[2]);// A
S2 next2(ps[2], ps[2], 1'b0, 1'b1, 1'b1, 1'b0, ns[2], 1'b1, clk, rst, ps[2]);


C1 not2(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, ps[1], 1'b1, 1'b1, notps[1]);
C1 not3(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, ps[0], 1'b1, 1'b1, notps[0]);
C1 c1out2(1'b0, 1'b0, 1'b0, 1'b0, notps[2], notps[1], ps[0], 1'b0, outns10);//B
C1 c1out20(1'b0, 1'b0, 1'b0, 1'b0, ps[2], ps[1], notps[0], 1'b0, outns11);
C1 c1out23(outns10, 1'b1, outns11, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, ns[1]);
S2 next1(ps[1], ps[1], 1'b0, 1'b1, 1'b1, 1'b0, ns[1], 1'b1, clk, rst, ps[1]);


C1 c1out3(1'b0, 1'b0, 1'b0, 1'b0, notps[2], notps[0], 1'b1, 1'b1, outns00);
C1 c1out4(1'b0, 1'b0, 1'b0, 1'b0, notps[1], ~ps[0], 1'b1, 1'b1, outns01);
C1 c1out21(1'b0, 1'b0, 1'b0, 1'b0, notps[0], G, 1'b1, 1'b1, outns02);
C1 c1out22(outns00, 1'b1, outns01, 1'b1, 1'b1, 1'b1, outns02, 1'b0, ns[0]);
S2 next0(ps[0], ps[0], 1'b0, 1'b1, 1'b1, 1'b0, ns[0], 1'b1, clk, rst, ps[0]);

// signals
C1 c1out6(1'b0, 1'b0, 1'b0, 1'b0, notps[2], notps[1], ps[0], 1'b0, pop);

C1 c1out7(1'b0, 1'b0, 1'b0, 1'b0, notps[2], ps[1], ps[0], 1'b0, s1);

C1 c1out8(1'b0, 1'b0, 1'b0, 1'b0, notps[1], notps[0], 1'b1, 1'b1, outpush1);
C1 c1out9(1'b0, 1'b0, 1'b0, 1'b0, notps[2], ps[1], ps[0], 1'b0, outpush2);
C1 c1out14(outpush1, 1'b1, outpush2, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, push);

C1 c1out11(1'b0, 1'b0, 1'b0, 1'b0, notps[2], notps[1], notps[0], 1'b0, s);
assign zero = s;
C1 c1out12(1'b0, 1'b0, 1'b0, 1'b0, notps[2], ps[1], notps[0], 1'b0, ld);

endmodule
