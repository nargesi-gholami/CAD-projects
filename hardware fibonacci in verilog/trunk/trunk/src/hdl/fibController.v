`timescale 1ns/1ns
module fibController(input clk,rst, ans, second, G,isEmpty, output reg ld,ldI, ldA, pop, top, push, s1, outReady, output reg[1:0]s );
 
parameter[3:0] IDLE = 4'b0000, A1 = 4'b0001, A2 = 4'b0010, A3 = 4'b0011 ,A4 = 4'b0100,
	 A5 = 4'b0101, A6 = 4'b0110, A7 = 4'b0111, A8 = 4'b1000, FIN = 4'b1001;
		
reg[3:0] ps, ns;
wire Bout;
reg start, countDown;
wire [1:0]out;

always@(ps,ans, G, Bout,isEmpty, second)begin
	ns = IDLE;
	case(ps) 
	(IDLE): ns = A1;
	(A1): ns = A2;
	(A2): ns = (~ans && G) ? A3 : A4;
	(A3): ns = A1;
	(A4): ns = Bout ? A5 : A4;
	(A5): ns = isEmpty ? FIN : A6;
	(A6): ns = second ? A8 : A7;
	(A7): ns = A8;
	(A8): ns = A1;
	(FIN): ns = FIN;
	default : ns = IDLE;
	endcase
end

always @(ps)  begin  
	{ld, ldI, ldA, pop, top, push, s1, s, start, countDown, outReady} = 0;
	case(ps) 
		IDLE: begin
			push=  1'b1;
			s = 2'b00;
			ldI = 1'b1;
		end
		A1:begin
			top =  1'b1;
			ldA =  1'b1;
		end
		A2:
			start =  1'b1;
		A3: begin
			push =  1'b1;
			s = 2'b01;
		end
		A4: begin
			pop =  1'b1;
			ld =  1'b1;
			countDown =  1'b1;
		end
		A5: begin
			top =  1'b1;
			ld =  1'b1;
		end
		A6: begin
			push =  1'b1;
			s = 2'b10;
		end
		A7: begin
			s = 2'b01;
			push =  1'b1;
			s1 =  1'b1;
		end
		A8: s1 = 1'b1;
		FIN: outReady = 1'b1;

		 
	endcase
end

always@(posedge clk, posedge rst)begin
	if(rst)
		ps <= IDLE;
	else
		ps <= ns;
end


multiplexer2 #2 m(2'b00, 2'b10, ans, out);
counter c(clk, start, countDown, out, Bout);

endmodule
