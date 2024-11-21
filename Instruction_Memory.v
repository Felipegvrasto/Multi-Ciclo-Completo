`timescale 1ns / 1ps

module Instruction_Memory #(parameter BITS_DATA=32, parameter BITS_ADDR=7)(
                            //Data width            //Address width 
    input [BITS_ADDR-1:0] A,        //Address bus
    output [BITS_DATA-1:0] RD   //Output data
    );

// Memory array (depth x width): 2^3= 8_rows x 4_bits
reg [7:0] memoria [0: (2**BITS_ADDR)-1];

initial
 $readmemh("datos_memory.mem", memoria, 0,	(2**BITS_ADDR)-1);
        //(File name, Memory array name, Start Address, Stop Address)

assign RD = {memoria[A], memoria[A+1], memoria[A+2], memoria[A+3]};

endmodule
