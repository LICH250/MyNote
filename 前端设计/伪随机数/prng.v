module prng(
    input clk,
    input rst_n,
    input ivalid,
    input [31:0] seed,
    output reg [31:0] data
)
//线性反馈移位寄存器实现伪随机数，多项式为x^32+x^7+x^5+x^3+x^2+x+1
always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
        data <= 32'b0;
    else if(ivaild)
        data <= seed;
    else begin
      data[0] <= data[31];
      data[1] <= data[0] ^ data[31];
      data[2] <= data[1] ^ data[31];
      data[3] <= data[2] ^ data[31];
      data[4] <= data[3];
      data[5] <= data[4] ^ data[31];
      data[6] <= data[5];
      data[7] <= data[6] ^ data[31];
      data[8] <= data[7];
      data[9] <= data[8];
      data[10] <= data[9];
      data[11] <= data[10];
      data[12] <= data[11];
      data[13] <= data[12];
      data[14] <= data[13];
      data[15] <= data[14];
      data[16] <= data[15];
      data[17] <= data[16];
      data[18] <= data[17];
      data[19] <= data[18];
      data[20] <= data[19];
      data[21] <= data[20];
      data[22] <= data[21];
      data[23] <= data[22];
      data[24] <= data[23];
      data[25] <= data[24];
      data[26] <= data[25];
      data[27] <= data[26];
      data[28] <= data[27];
      data[29] <= data[28];
      data[30] <= data[29];
      data[31] <= data[30];
    end
end

endmodule