`timescale 1ns/1ns
module register#(parameter size = 8)(input clk, rst, ld, z,  input [size - 1:0] in, output reg [size-1 : 0] out);

always@(posedge clk)begin
	if(rst)
		out <= 0;
	else if(z)
		out <= 0;
	else if(ld)
     		out <= in; 
end
endmodule

