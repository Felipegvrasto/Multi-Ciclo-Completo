`timescale 1ns / 1ps

module RISCV_SC_TB();

reg CLK, RST;

RISCV_SC RV(
    .CLK(CLK),
    .RST(RST)
);

initial begin
CLK = 1'b0;
RST = 1'b1;
#6;
RST = 1'b0;
end

always begin
#5;     CLK = ~CLK;
end

endmodule
