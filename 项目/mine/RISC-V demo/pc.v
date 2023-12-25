`include "utils.v"

module PC(
    input clk,
    input rst,
    input jump_flag,
    input[BUSWIDTH-1 : 0] jump_addr,
    input[2:0] hold_flag,
    input jtag_reset_flag,
    output[BUSWIDTH-1 : 0] pc_address
);

reg[BUSWIDTH-1 : 0] pc_o;

always @(posedge clk) begin
    if(rst || jtag_reset_flag) begin
        pc_o <= CPURESETADDR;
    end else if(jump_flag) begin
        pc_o <= jump_addr;
    end else if(hold_flag > 3'b0) begin
        pc_o <= pc_o;
    end else
        pc_o <= pc_o + 4;
end

assign pc_address = pc_o;