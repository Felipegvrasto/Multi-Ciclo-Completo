`timescale 1ns / 1ps

module PC #(parameter n=7)(
    input CLK, RST,
    input [n-1 : 0] D,
    output reg [n-1 : 0] Q = 0
    );

always @(posedge CLK)
    if (RST)
        Q <= {n{1'b0}};
    else
        Q <= D;
        
endmodule
