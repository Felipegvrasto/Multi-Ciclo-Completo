`timescale 1ns / 1ps

module Extend_TB();

reg [2:0] ImmSrc;
reg [24:0] Imm;
wire [31:0] ImmExt;

Extend E1(
    .ImmSrc(ImmSrc),
    .Imm(Imm),
    .ImmExt(ImmExt)
    );

initial begin
Imm = 32'd4294966451;
ImmSrc = 0;
#10;
ImmSrc = 1;
#10;
ImmSrc = 2;
#10;
ImmSrc = 3;
#10;
ImmSrc = 4;
#10;
ImmSrc = 5;
end

endmodule
