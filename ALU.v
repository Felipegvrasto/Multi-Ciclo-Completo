`timescale 1ns / 1ps

module ALU(
    input [31:0] A, B,
    input [2:0] Control,
    output reg [31:0] Result,
    output Zero
    );

always @(*)
    case (Control)
        3'b000 : Result <= A + B;
        3'b001 : Result <= A - B;
        3'b010 : Result <= A & B;
        3'b011 : Result <= A | B;
        3'b101 : Result <= A < B;
        3'b110 : Result <= A ^ B;
        default : Result <= 32'dx;
    endcase

assign Zero = ((A - B) == 32'd0);

endmodule
