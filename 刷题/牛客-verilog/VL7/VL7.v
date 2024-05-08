`timescale 1ns/1ns
module data_minus(
	input clk,
	input rst_n,
	input [7:0]a,
	input [7:0]b,

	output  reg [8:0]c
);
wire ab;
always@(posedge clk or negedge rst_n) begin
	if(~rst_n)
		c <= 9'd0;
	else
		c <= ab ? (a - b) : (b - a);
end

assign ab = a > b ? 1'b1: 1'b0;
endmodule