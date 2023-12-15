`timescale 1ns/1ns

module lca_4(
	input		[3:0]       A_in  ,
	input	    [3:0]		B_in  ,
    input                   C_1   ,
 
 	output	 wire			CO    ,
	output   wire [3:0]	    S
);
    wire [3:0] p, g;
	assign S[0] = p[0] ^ C_1;
	assign S[1] = p[1] ^((p[0] & C_1) | g[0]);
	assign S[2] = p[2] ^((p[1] &((p[0] & C_1) | g[0])) | g[1]);
	assign S[3] = p[3] ^((p[2] &(p[1] &((p[0] & C_1) | g[0]) | g[1])) |g[2]);
	assign CO = (p[3] &((p[2] &(p[1] &((p[0] & C_1) | g[0]) | g[1])) |g[2])) |g[3];
	pg pg1(.a(A_in), .b(B_in), .p(p), .g(g));

endmodule

module pg(
	input [3:0] a,
	input [3:0] b,

	output [3:0] p,
	output [3:0] g
);
	assign p = a ^ b;
	assign g = a & b;
endmodule