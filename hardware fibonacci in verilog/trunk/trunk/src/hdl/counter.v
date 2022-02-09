`timescale 1ns/1ns
module counter(input clk, input start, countDown, input [1:0]in,  output Bout);

reg [1:0] out;


always@(posedge clk)begin
	if(start)
		out <= in ;
	else if(countDown)
		out <= out - 2'b01;
end

assign Bout = (out == 2'b00) ? 1'b1 : 1'b0;


endmodule
