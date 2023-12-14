`timescale 1ns/1ns
module main_mod(
	input clk,
	input rst_n,
	input [7:0]a,
	input [7:0]b,
	input [7:0]c,
	
	output [7:0]d
);
wire [7:0] mid, mid2;

sub_mod sub_mod1(
	.clk(clk),
	.rst_n(rst_n),
	.a(a),
	.b(b),
	.out(mid)
);
sub_mod sub_mod2(
	.clk(clk),
	.rst_n(rst_n),
	.a(a),
	.b(c),
	.out(mid2)
);

sub_mod sub_mod3(
	.clk(clk),
	.rst_n(rst_n),
	.a(mid),
	.b(mid2),
	.out(d)
);

endmodule

module sub_mod(
	input clk,
	input rst_n,
	input [7:0]a,
	input [7:0]b,

	output [7:0]out
);
reg [7:0] out_reg;
always@(posedge clk or negedge rst_n) begin
	if(~rst_n)
		out_reg <= 8'd0;
	else
		out_reg <= (a > b)? b : a;
end
assign out = out_reg;

endmodule