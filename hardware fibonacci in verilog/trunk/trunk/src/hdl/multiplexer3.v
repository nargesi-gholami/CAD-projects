`timescale 1ns/1ns
module multiplexer3(input[10:0] in1,[10:0]in2, [10:0]in3,input [1:0]s, output[10:0] out);

assign out = s[1] ? in3 : s[0] ? in2 : in1;

endmodule
