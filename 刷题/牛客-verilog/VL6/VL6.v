`timescale 1ns/1ns
module data_select(
	input clk,
	input rst_n,
	input signed[7:0]a,
	input signed[7:0]b,
	input [1:0]select,
	output reg signed [8:0]c
);
always@(posedge clk or negedge rst_n) begin
	if(~rst_n)
		c <= 9'd0;
	else begin
		case(select)
		2'd0:c <= a;
		2'd1:c <= b;
		2'd2:c <= a+b;
		2'd3:c <= a-b;
		endcase
	end
end

endmodule