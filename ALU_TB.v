`timescale 1ns / 1ps

module ALU_TB();

reg [31:0] A, B;
reg [2:0] Control;
wire [31:0] Result;
wire Zero;

ALU AA(
    .A(A),
    .B(B),
    .Control(Control),
    .Result(Result),
    .Zero(Zero)
    );

initial begin
A = 5;      B = 0;      Control = 3'b111;
#10;
A = 13;     B = 0;      Control = 3'b111;
#10;
A = 12;     B = -9;     Control = 3'b000;
#10;
A = 3;      B = 5;      Control = 3'b011;
#10;
A = 12;     B = 7;      Control = 3'b010;
#10;
A = 4;      B = 7;      Control = 3'b000;
end

endmodule
