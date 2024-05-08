`timescale 1ns/1ns
module multi_sel(
input [7:0]d ,
input clk,
input rst,
output reg input_grant,
output reg [10:0]out
);
//*************code***********//
reg[1:0] cnt;
reg[7:0] temp;
always@(posedge clk or negedge rst) begin
    if(~rst)
        cnt <= 2'b0;
    else
        cnt <= cnt + 1;
end

always@(posedge clk or negedge rst) begin
    if(~rst)
        temp <= 8'b0;
    else if(cnt == 2'b0)
        temp <= d;
end

always@(*) begin
    input_grant = cnt == 2'b1;
    case(cnt)
    2'b0: out = temp*8;
    2'b1: out = temp;
    2'b10: out = temp*3;
    2'b11: out = temp*7;
    default : out = temp;
    endcase
end
//*************code***********//
endmodule