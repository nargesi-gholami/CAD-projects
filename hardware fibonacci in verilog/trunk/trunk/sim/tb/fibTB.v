`timescale 1ps/1ps
module fibTB();

reg clk, rst;
wire outReady;
reg [4:0]N;
wire [9:0]out;
reg [9:0] acout;

fibTopLevel fib_TB(clk, rst, N, out, outReady);

always
	#25 clk = ~clk;

initial begin
	clk = 1'b0;
	N = 5'b00011;
	acout = 10'd3;
	$display ("input = 3: "); 
	#7500 rst = 1;
	#5 rst = 0;
	N = 5'b00100;
	acout = 10'd11;
	$display ("input = 4: ");
	#7500 rst = 1;
	#5 rst = 0; 
	N = 5'b00101;
	acout = 10'd53;
	$display ("input = 5: "); 
	#7500 rst = 1;
	#5 rst = 0; 
	N = 5'b00110;
	acout = 10'd309;
	$display ("input = 6: ");
  
end

always @(outReady) begin
	if(out == acout & outReady)
		$display ("answers match!"); 
end

endmodule
