`timescale 1ns/1ns

module data_cal(
input clk,
input rst,
input [15:0]d,
input [1:0]sel,

output [4:0]out,
output validout
);
//*************code***********//
reg[15:0] dv;
reg[4:0] outv;
always@(posedge clk or negedge rst) begin
    if(~rst)
        dv <= 16'b0;
    else if(!sel)
        dv <= d;
end
always@(*) begin
    case(sel)
    2'd0: outv = 4'b0;
    2'd1: outv = dv[3:0] + dv[7:4];
    2'd2: outv = dv[3:0] + dv[11:8];
    2'd3: outv = dv[3:0] + dv[15:12];
    endcase
end

assign out = outv;
assign validout = sel != 2'b0;
//*************code***********//
endmodule