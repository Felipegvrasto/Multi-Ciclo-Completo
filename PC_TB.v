`timescale 1ns / 1ps

module PC_TB();

reg CLK;
reg [6 : 0] D;
wire [6 : 0] Q;

PC PTT(
    .CLK(CLK),
    .D(D),
    .Q(Q)
    );

initial begin
CLK = 0;    D = 0;
end

always begin
#2 CLK = !CLK;
end

always begin
#4 D = D + 7'd4;
end

endmodule
