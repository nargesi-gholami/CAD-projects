`timescale 1ns/1ns
module combTb();

reg clk, rst, start;
wire Done;
reg [3:0]N;
wire [14:0]answer;

combToplevel comb_tb(clk, rst, start, N, Done, answer);

always
	repeat(5000)
	#30 clk = ~clk;


initial begin
	clk = 1'b0;
	start = 1'b1;
	//ex 1
	#95 N = 4'b0101;// N = 5
	#60 N = 4'b0011;// M = 3
	//ex 2
	//#95 N = 4'b1000; // N = 8
	//#60 N = 4'b0010; // M = 2
	//ex 3 
	//#95 N = 4'b0110; // N = 6
	//#60 N = 4'b0011; // M = 3
	start = 1'b0;

	
	
end



endmodule
