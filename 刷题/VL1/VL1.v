`timescale 1ns/1ns
module mux4_1(
input [1:0]d1,d2,d3,d0,
input [1:0]sel,
output[1:0]mux_out
);
//*************code***********//
reg[1:0] out;
always@(*) begin
    case(sel)
    2'd0: out = d3;
    2'd1: out = d2;
    2'd2: out = d1;
    2'd3: out = d0;
    default: out = d0;
    endcase
end
assign mux_out = out;
//*************code***********//
endmodule