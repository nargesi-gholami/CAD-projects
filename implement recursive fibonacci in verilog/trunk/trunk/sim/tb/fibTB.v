`timescale 1ns/1ns
module fibTB();

reg clk, rst;
wire done;
reg [2:0]N;
wire [4:0]out;
wire [4:0] acout[7:0];
reg [3:0] i;
integer f;

assign acout[0] = 5'd1;
assign acout[1] = 5'd1;
assign acout[2] = 5'd2;
assign acout[3] = 5'd3;
assign acout[4] = 5'd5;
assign acout[5] = 5'd8;
assign acout[6] = 5'd13;
assign acout[7] = 5'd21;

fibTopLevel fib_TB(clk,rst, N, out, done);

always
	#25 clk = ~clk;

initial begin
	f = $fopen("output.txt","w");
	i = 4'd0;
	rst = 1'b1;
	#10
	rst = 1'b0;
	clk = 1'b0;
	N = 5'd0;
end

always @(posedge done) begin
	$fwrite(f, "for input: %d,  real output is: %d, expected output is: %d, results match: " , N, out, acout[i]);
	if(out == acout[i] & done) begin
		#50
		$fwrite(f, "true\n");
		rst = 1'b1;
		#10
		rst = 1'b0;
		N <= N+1;
		i <= 1+i;
	end
	else
		$fwrite(f, "false\n");
	if(i == 4'd7) begin
		$stop;	
		$fclose(f);
	end
end

endmodule
