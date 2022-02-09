`timescale 1ns/1ns
module combController( input clk, rst,input start, isEmpty, eq1, eq2, output reg[1:0] s, output reg push, pop, ldM, s1,ld_ans, z_ans, Done);
parameter[3:0] IDLE = 4'b0000, A1 = 4'b0001, A2 = 4'b0010, A3 = 4'b0011 ,A4 = 4'b0100,
	 A5 = 4'b0101, A6 = 4'b0110, A7 = 4'b0111, A8 = 4'b1000, A9 = 4'b1001, END = 4'b1010, A3_5 = 4'b1011;
		
reg[3:0] ps, ns;

always@(ps, start, isEmpty, eq1, eq2)begin
	ns = IDLE;
	case(ps) 
	(IDLE): ns = start ? A1 : IDLE;
	(A1): ns = A2;
	(A2): ns = A3;
	(A3): ns = isEmpty ? END : A3_5;
	(A3_5): ns = A4;
	(A4): ns = (eq1 | eq2) ? A9 : A5;
	(A5): ns = A6;
	(A6): ns = A7;
	(A7): ns = A8;
	(A8): ns = A3;
	(A9): ns = A3;
	(END): ns = IDLE;
	default : ns = IDLE;
	endcase
end

always @(ps)  begin  
	{s, push, pop, ldM, s1,ld_ans, z_ans, Done} = 0;
	case(ps) 
		A1:begin
			push = 1'b1;
			z_ans = 1'b1;
			s = 2'b00;
		end
		A2:begin
			push = 1'b1;
			s = 2'b00;
		end
			
		A3: 
			pop = 1'b1;
		A3_5:begin
			ldM = 1;
			pop = 1'b1;
		end
			
		A5: begin
			push = 1'b1;
			s = 2'b10;
			s1 = 1'b1;
		end
		A6: begin
			s = 2'b01;
			push = 1'b1;
		end
		A7: begin			
			s = 2'b10;
			push = 1'b1;
			s1 = 1'b1;	
		end

		A8: begin
			s1 = 1'b0;
			s = 2'b10;
			push = 1'b1;
		end
		A9:
			ld_ans = 1'b1;

		END: Done = 1'b1;

	endcase
end

always@(posedge clk, posedge rst)begin
	if(rst)
		ps <= IDLE;
	else
		ps <= ns;
end

endmodule