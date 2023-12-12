module sync_fifo_tb();
    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 8;

    parameter AFULL_DEPTH = FIFO_DEPTH - 1;
    parameter AEMPTY_DEPTH = 1;

    parameter ADDR_WIDTH = 3;
    parameter RDATA_MODE = 0;

    reg clk;
    reg rst_n;
    reg wr_en;
    reg [DATA_WIDTH-1 :0] wr_data;
    wire full;
    wire almost_full;

    reg rd_en;
    wire [DATA_WIDTH-1 :0] rd_data;
    wire empty;
    wire almost_empty;

    wire overflow;
    wire underflow;

integer II;

sync_fifo#(
    .DATA_WIDTH (DATA_WIDTH),
    .FIFO_DEPTH (FIFO_DEPTH),
    .AFULL_DEPTH (AFULL_DEPTH),
    .AEMPTY_DEPTH (AEMPTY_DEPTH),
    .ADDR_WIDTH (ADDR_WIDTH),
    .RDATA_MODE (RDATA_MODE)
)inst_sync_fifo(
    .clk(clk),
    .rst_n(rst_n),
    .wr_en(wr_en),
    .wr_data(wr_data),
    .full(full),
    .almost_full(almost_full),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .empty(empty),
    .almost_empty(almost_empty),
    .overflow(overflow),
    .underflow(underflow)
)

initial begin
    #0;
    clk = 0;
    rst_n = 0;
    #10;
    rst_n = 1;
end

always #5 clk = ~clk;

initial begin
    #0;
    wr_en = 0;
    wr_data =0;
    rd_en = 0;
end

initial begin
    #20;
    send_wr;
    #80;
    send_rd;
    #100;
    $finish;
end

task send_wr;
begin
    for(II=0; II <8; II++)begin
        @(posedge clk)begin
            wr_en <= 1'b1;
            wr_data <= II + 1'b1;
        end
    end
    @(posedge clk)begin
        wr_en <= 1'b0;
        wr_data <= 8'b0;
    end
    repeat(10) @(posedge clk);
end
endtask

task send_rd;
begin
    for(II=0; II <8; II++)begin
        @(posedge clk)begin
            rd_en <= 1'b1;
        end
    end
    @(posedge clk)
        rd_en <= 1'b0;
end
endtask

endmodule
