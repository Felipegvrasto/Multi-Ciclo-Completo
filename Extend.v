`timescale 1ns / 1ps

module Extend(
    input [2:0] ImmSrc,
    input [24:0] Imm,
    output reg [31:0] ImmExt
    );

always @(*)
    case (ImmSrc)
        3'b000 : ImmExt <= {{20{Imm[24]}}, Imm[24:13]};
        3'b001 : ImmExt <= {{20{Imm[24]}}, Imm[24:18], Imm[4:0]};
        3'b010 : ImmExt <= {{20{Imm[24]}}, Imm[0], Imm[23:18], Imm[4:1], 1'b0};
        3'b011 : ImmExt <= {{12{Imm[24]}}, Imm[12:5], Imm[13], Imm[23:14], 1'b0};
        3'b101 : ImmExt <= {Imm[24:5], 12'b0};
        default : ImmExt <= 32'dx;
    endcase
endmodule
