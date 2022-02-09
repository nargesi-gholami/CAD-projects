`timescale 1ns/1ns
module S2(input D00, D01, D10, D11, input A1, B1, A0, B0, clk, clr, output reg out);
wire outmux4, s0, s1;
assign #0.5 s0 = A0 && B0;
assign #0.5 s1 = A1 || B1;
assign #2 outmux4 = s0 ? (s1 ? D11 : D01) : (s1 ? D10 : D00);

always@(posedge clk, posedge clr)begin
	if(clr)
		out <= 1'b0;
	else begin
		out <=  outmux4;
	end
end
endmodule
