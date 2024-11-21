`timescale 1ns / 1ps

module Data_Memory_TB();

reg [31:0] WD;
reg CLK;
reg WE;
reg [31:0] A;
wire [31:0] RD;

Data_Memory DM(
.CLK(CLK),
.WE(WE),
.WD(WD),
.A(A),
.RD(RD)
);

initial begin
 CLK = 1'd0;
end

always begin
#5 CLK = !CLK;
end

initial begin
WE = 1'd1;     A = 32'd0;     WD = 32'd3;
#10;                          
WE = 1'd1;     A = 32'd1;     WD = 32'd6;
#10;                          
WE = 1'd1;     A = 32'd2;     WD = 32'd9;
#10;                          
WE = 1'd1;     A = 32'd3;     WD = 32'd12;
#10;                          
WE = 1'd0;     A = 32'd0;     WD = 32'd0;
#10;                          
WE = 1'd0;     A = 32'd1;     WD = 32'd1;
#10;                          
WE = 1'd0;     A = 32'd2;     WD = 32'd2;
#10;                          
WE = 1'd0;     A = 32'd3;     WD = 32'd3;
end

endmodule
