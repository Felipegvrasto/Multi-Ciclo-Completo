`timescale 1ns / 1ps

module Instruction_Memory_TB();

reg [6:0] A;
wire [31:0] RD;

Instruction_Memory IM(
    .A(A),
    .RD(RD)
);

initial begin
 A = 7'd0;
end

always begin
#4 A = A+7'd4;
end

endmodule

