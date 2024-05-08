`timescale 1ns/1ns
module Tff_2 (
input wire data, clk, rst,
output reg q  
);
//*************code***********//
reg mid;
always@(posedge clk or negedge rst) begin
    if(~rst) begin
        mid <= 1'b0;
        // q <= 1'b0;
    end
    else begin
        if(data) begin
            mid <= ~mid;
        end
        // if(mid) begin
        //     q <= ~q;
        // end
    end
end

always@(posedge clk or negedge rst) begin
    if(~rst)
        q <= 1'b0;
    else if(mid)
        q <= ~q;
end

//*************code***********//
endmodule