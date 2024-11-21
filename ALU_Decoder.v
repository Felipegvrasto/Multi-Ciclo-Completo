`timescale 1ns / 1ps

module ALU_Decoder(
    input funct7, op5,
    input [2:0] funct3,
    input [1:0] ALUOp,
    output reg [2:0] ALUControl
    );

always @(*)
    case (ALUOp)
        2'b00 : ALUControl <= 3'b000;   // Add
        2'b01 : ALUControl <= 3'b001;   // Subtract
        2'b10 : case (funct3)
                    3'b000  : ALUControl <= ({op5, funct7} == 2'b11) ? 3'b001 : 3'b000;   // Subtract : Add
                    3'b010  : ALUControl <= 3'b101;  // SLT
                    3'b100  : ALUControl <= 3'b110;  // XOR
                    3'b110  : ALUControl <= 3'b011;  // OR
                    3'b111  : ALUControl <= 3'b010;  // AND   
                    default : ALUControl <= 3'bxxx;
                endcase     
        default : ALUControl <= 3'bxxx;
    endcase    

endmodule
