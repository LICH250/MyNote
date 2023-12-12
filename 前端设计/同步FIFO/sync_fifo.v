module sync_fifo#(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 8,

    parameter AFULL_DEPTH = 7,
    parameter AEMPTY_DEPTH = 1,

    parameter ADDR_WIDTH = 3,
    parameter RDATA_MODE = 0
)(
    input clk,
    input rst_n,
    input wr_en,
    input [DATA_WIDTH-1 :0] wr_data,
    output full,
    output almost_full,

    input rd_en,
    output reg [DATA_WIDTH-1 :0] rd_data,
    output empty,
    output almost_empty,

    output reg overflow,
    output reg underflow
)

reg [ADDR_WIDTH-1:0] wr_ptr;
reg [ADDR_WIDTH-1:0] rd_ptr;
reg [ADDR_WIDTH:0] fifo_cnt;
reg [DATA_WIDTH-1:0] buf_mem[0:FIFO_DEPTH-1];   //buffer memory

integer II;

//fifo_cnt
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    fifo_cnt <= {(ADDR_WIDTH+1){1'b0}};
    else begin
        if(wr_en && ~full && rd_en && ~empty)
            fifo_cnt <= fifo_cnt;
        else if(wr_en && ~full)
            fifo_cnt <= fifo_cnt + 1'b1;
        else if(rd_en && ~empty)
            fifo_cnt <= fifo_cnt - 1'b1;
    end
end

//wr_ptr
always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
        wr_ptr <= {(ADDR_WIDTH+1){1'b0}};
    else begin
      if (wr_ptr == FIFO_DEPTH-1)
        wr_ptr <= {(ADDR_WIDTH+1){1'b0}};
      else if (wr_en && ~full)
        wr_ptr <= wr_ptr + 1'b1;
    end
end

//rd_ptr
always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
        rd_ptr <= {(ADDR_WIDTH+1){1'b0}};
    else begin
      if (rd_ptr == FIFO_DEPTH-1)
        rd_ptr <= {(ADDR_WIDTH+1){1'b0}};
      else if (rd_en && ~empty)
        rd_ptr <= rd_ptr + 1'b1;
    end
end

//buf_mem
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        for(II=0;II<FIFO_DEPTH; II=II+1)
            buf_mem[II] <= {(ADDR_WIDTH+1){1'b0}};
    end
    else if(wr_en && ~full)
        buf_mem[wr_ptr] <= wr_data;
end

//rd_data
generate
    if(RDATA_MODE == 1'b0) begin
        always @(*)
            rd_data = buf_mem[rd_ptr];
    end
    else begin
        always @(posedge clk or negedge rst_n) begin
            if(~rst_n)
                rd_data <= {DATA_WIDTH{1'b0}};
            else if(rd_en && ~empty)
                rd_data <= buf_mem[rd_ptr];
        end
    end
endgenerate

//overflow, underflow
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        overflow <= 1'b0;
        underflow <= 1'b0;
    end
    else if(wr_en && full)
        overflow <= 1'b1;
    else if(rd_en && empty)
        underflow <= 1'b1;
end

assign full = (fifo_cnt == FIFO_DEPTH);
assign empty = (fifo_cnt == {(ADDR_WIDTH+1){1'b0}});
assign almost_full = fifo_cnt >= AFULL_DEPTH;
assign almost_empty = fifo_cnt <= AEMPTY_DEPTH;

endmodule
