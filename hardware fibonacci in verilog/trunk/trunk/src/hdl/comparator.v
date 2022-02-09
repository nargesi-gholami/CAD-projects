`timescale 1ns/1ns
module camparator(input[9:0] in1, in2, output G);

assign G = (in1 > in2); 

endmodule
