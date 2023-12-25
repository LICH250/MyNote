//设置32个寄存器，其中0号寄存器只读并且固定为0
module REGFILE(
    input clk,
    input rst,

    input[REGNUMLOG2-1 :0] raddr1,
    output reg[BUSWIDTH-1 :0] rdata1,

    input[REGNUMLOG2-1 :0] raddr2,
    output reg[BUSWIDTH-1 :0] rdata2,

    input wen,
    input[REGNUMLOG2-1 :0] waddr,
    input[BUSWIDTH-1 :0] wdata,


    input jtag_wen,
    input[REGNUMLOG2-1 :0] jtag_waddr,
    input[BUSWIDTH-1 :0] jtag_wdata,

    // input[REGNUM-1 :0] jtag_raddr,
    // output reg[BUSWIDTH-1 :0] jtag_rdata
);

reg[BUSWIDTH-1 :0] regfiles[0 : REGNUM - 1];
// reg [BUSWIDTH-1 :0] rdata1_reg;
// reg [BUSWIDTH-1 :0] rdata2_reg;
// reg [BUSWIDTH-1 :0] jtag_rdata_reg;

always @(*)begin
    if(rst) begin
        rdata1 = BUSWIDTH'd0;
    end else if(raddr1 == REGNUMLOG2'd0) begin
        rdata1 = BUSWIDTH'd0;
    end else if(wen && raddr1 == waddr) begin
        rdata1 = wdata;
    end else begin
        rdata1 = regfiles[raddr1];
    end
end

always @(*)begin
    if(rst) begin
        rdata2 = BUSWIDTH'd0;
    end else if(raddr2 == REGNUMLOG2'd0) begin
        rdata2 = BUSWIDTH'd0;
    end else if(wen && raddr2 == waddr) begin
        rdata2 = wdata;
    end else begin
        rdata2 = regfiles[raddr2];
    end
end

always @(posedge clk) begin
    if(rst) begin
    end else if(wen && waddr != REGNUMLOG2'd0) begin
        regfiles[waddr] <= wdata;
    end else if(jtag_wen && jtag_waddr != REGNUMLOG2'd0) begin
        regfiles[jtag_waddr] <= jtag_wdata;
    end
end