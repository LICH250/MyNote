`timescale 1ns/1ns
module gen_for_module( 
    input [7:0] data_in,
    output [7:0] data_out
);
genvar II;
generate
    for(II=0; II < 8; II=II+1) begin
        assign data_out[II] = data_in[7-II];
    end
endgenerate
 
endmodule