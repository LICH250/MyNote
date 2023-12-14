`timescale 1ns/1ns
module function_mod(
	input [3:0]a,
	input [3:0]b,
	
	output [3:0]c,
	output [3:0]d
);
revert rev1(.in(a), .out(c));
revert rev2(.in(b), .out(d));
endmodule

module revert(
	input [3:0] in,
	output [3:0]out
);
assign out[0] = in[3];
assign out[1] = in[2];
assign out[2] = in[1];
assign out[3] = in[0];
endmodule