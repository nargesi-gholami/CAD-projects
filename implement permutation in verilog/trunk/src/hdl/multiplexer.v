`timescale 1ns/1ns
module multiplexer2#(parameter size = 10)(input [size -1:0] in1,[size -1:0] in2, input s, output[size -1:0] out);

assign out = s ? in2 : in1;

endmodule
