`timescale 1ns/1ns

module encoder_83(
   input      [7:0]       I   ,
   input                  EI  ,
   
   output wire [2:0]      Y   ,
   output wire            GS  ,
   output wire            EO    
);
reg[2:0] Y_temp;
assign EO = EI & ~(|I);
assign GS = EI & (|I);
assign Y = {3{EI}} & Y_temp;

always@(*) begin
    casez(I)
    8'b1???????: Y_temp = 3'b111;
    8'b01??????: Y_temp = 3'b110;
    8'b001?????: Y_temp = 3'b101;
    8'b0001????: Y_temp = 3'b100;
    8'b00001???: Y_temp = 3'b011;
    8'b000001??: Y_temp = 3'b010;
    8'b0000001?: Y_temp = 3'b001;
    8'b00000001: Y_temp = 3'b000;
    8'b00000000: Y_temp = 3'b000;
    endcase
end
endmodule