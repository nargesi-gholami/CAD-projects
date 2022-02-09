`timescale 1ns/1ns
module accumulator(input cin, ld, z_ans, clk, output [4:0] out);

wire [4:0] sout;wire sout1, sout2, sout3, sout4, sout5, cout1, cout2, cout3, cout4, notcout1, notcout2, notcout3, notcout4, notout0;

C1 not1(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, cout1, 1'b1, 1'b1, notcout1);
C1 not2(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, cout2, 1'b1, 1'b1, notcout2);
C1 not3(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, cout3, 1'b1, 1'b1, notcout3);
C1 not4(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, cout4, 1'b1, 1'b1, notcout4);
C1 not5(1'b0, 1'b0, 1'b0, 1'b1, 1'b0, out[0], 1'b1, 1'b1, notout0);C1 c1sout1(1'b0, 1'b0, 1'b0, notout0, 1'b1, 1'b0, 1'b1, 1'b1, sout1);C1 c1sout2(1'b0, 1'b0, 1'b0, cout1, notcout1, out[1], 1'b1, 1'b1, sout2);C1 c1sout3(1'b0, 1'b0, 1'b0, cout2, notcout2, out[2], 1'b1, 1'b1, sout3);C1 c1sout4(1'b0, 1'b0, 1'b0, cout3, notcout3, out[3], 1'b1, 1'b1, sout4);C1 c1sout5(1'b0, 1'b0, 1'b0, cout4, notcout4, out[4], 1'b1, 1'b1, sout5);C1 c1cout1(1'b0, 1'b0, 1'b0, 1'b0, 1'b1, out[0], 1'b1, 1'b1, cout1);C1 c1cout2(1'b0, 1'b0, 1'b0, 1'b0, cout1, out[1], 1'b1, 1'b1, cout2);C1 c1cout3(1'b0, 1'b0, 1'b0, 1'b0, cout2, out[2], 1'b1, 1'b1, cout3);C1 c1cout4(1'b0, 1'b0, 1'b0, 1'b0, cout3, out[3], 1'b1, 1'b1, cout4);

S2 sreg1(out[0], out[0], 1'b0, 1'b1, ld, 1'b0, sout1, 1'b1, clk, z_ans, out[0]);
S2 sreg2(out[1], out[1], 1'b0, 1'b1, ld, 1'b0, sout2, 1'b1, clk, z_ans, out[1]);
S2 sreg3(out[2], out[2], 1'b0, 1'b1, ld, 1'b0, sout3, 1'b1, clk, z_ans, out[2]);
S2 sreg4(out[3], out[3], 1'b0, 1'b1, ld, 1'b0, sout4, 1'b1, clk, z_ans, out[3]);
S2 sreg5(out[4], out[4], 1'b0, 1'b1, ld, 1'b0, sout5, 1'b1, clk, z_ans, out[4]);
endmodule
