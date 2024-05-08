`timescale 1ns/1ns

module encoder_0(
   input      [8:0]         I_n   ,
   
   output reg [3:0]         Y_n   
);
always@(*)begin
    casez(I_n)
    9'b111111111: Y_n = 4'b1111;
    9'b111111110: Y_n = 4'b1110;
    9'b11111110?: Y_n = 4'b1101;
    9'b1111110??: Y_n = 4'b1100;
    9'b111110???: Y_n = 4'b1011;
    9'b11110????: Y_n = 4'b1010;
    9'b1110?????: Y_n = 4'b1001;
    9'b110??????: Y_n = 4'b1000;
    9'b10???????: Y_n = 4'b0111;
    9'b0????????: Y_n = 4'b0110;
    default: Y_n = 4'b0000;
    endcase
end 

endmodule