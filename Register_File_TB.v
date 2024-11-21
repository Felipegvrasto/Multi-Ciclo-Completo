`timescale 1ns / 1ps

module Register_File_TB();

reg CLK;
reg WE3;
reg [4:0] A1, A2, A3;
reg [31:0] WD3;
wire [31:0] RD1, RD2;


Register_File RF(
    .CLK(CLK),
    .WE3(WE3),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .WD3(WD3),
    .RD1(RD1),
    .RD2(RD2)
    );

initial begin
 CLK = 1'd0;
end

always begin
#5 CLK = !CLK;
end

initial begin
WE3 = 1'd1;     WD3 = 32'd0;     A1 = 8'd3;      A2 = 8'd1;      A3 = 8'd2;
#10;
WE3 = 1'd1;     WD3 = 32'd3;     A1 = 8'd1;      A2 = 8'd2;      A3 = 8'd0;
#10;
WE3 = 1'd0;     WD3 = 32'd1;     A1 = 8'd2;      A2 = 8'd0;      A3 = 8'd3;
#10;
WE3 = 1'd0;     WD3 = 32'd2;     A1 = 8'd0;      A2 = 8'd3;      A3 = 8'd1;
#10;
end

endmodule
