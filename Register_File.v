`timescale 1ns / 1ps

module Register_File(
    input CLK,
    input WE3,
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
    output [31:0] RD1, RD2
    );

reg [31:0] Registers [0:(2**5)-1];

// Inicialización de registros en cero
integer i;

initial begin
for (i = 0; i <= 31; i = i + 1)
    Registers[i] <= 0;
end

always @(posedge CLK)
    if (WE3)
        Registers[A3] <= WD3;

assign RD1 = Registers[A1];
assign RD2 = Registers[A2];

endmodule
