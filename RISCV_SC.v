`timescale 1ns / 1ps

module RISCV_SC(
    input CLK, RST
);

wire [6:0] PCNext, PCNow, PCPlus, PCTarget;
wire [31:0] Instr, ImmExt, ALUResult;
wire [31:0] SrcA, WriteData, SrcB, ReadData;
wire  PCSrc, MemWrite, ALUSrc, RegWrite, Branch;
wire Zero;
wire [1:0] ResultSrc;
wire [2:0] ALUControl, ImmSrc;
reg [31:0] Result;

assign PCPlus = PCNow + 5'd4;
assign PCTarget = PCNow + ImmExt;
assign PCNext = PCSrc ? PCTarget : PCPlus;
assign SrcB = ALUSrc ? ImmExt : WriteData;

PC #(7) PPC(
    .CLK(CLK),
    .RST(RST),
    .D(PCNext),
    .Q(PCNow)
    );

Instruction_Memory #(32, 7) IM(
    .A(PCNow),
    .RD(Instr)
    );

Extend EX(
    .ImmSrc(ImmSrc),
    .Imm(Instr[31:7]),
    .ImmExt(ImmExt)
    );

Register_File RF(
    .CLK(CLK),
    .WE3(RegWrite),
    .A1(Instr[19:15]),
    .A2(Instr[24:20]),
    .A3(Instr[11:7]),
    .WD3(Result),
    .RD1(SrcA),
    .RD2(WriteData)
    );

ALU AAU(
    .A(SrcA),
    .B(SrcB),
    .Control((ALUControl)),
    .Result(ALUResult),
    .Zero(Zero)
    );

Data_Memory #(32, 7) DM(
    .CLK(CLK),
    .WE(MemWrite),
    .WD(WriteData),
    .A(ALUResult),
    .RD(ReadData)
    );

always @(*)
    case (ResultSrc)
        2'b00 : Result <= ALUResult;
        2'b01 : Result <= ReadData;
        2'b10 : Result <= PCPlus;
        2'b11 : Result <= ImmExt;
        default : Result <= 32'dx;
    endcase

Control_Unit CU(
    .Zero(Zero),      
    .funct7(Instr[30]),    
    .funct3(Instr[14:12]),   
    .op(Instr[6:0]),        
    .PCSrc(PCSrc),     
    .MemWrite(MemWrite),  
    .ALUSrc(ALUSrc),    
    .RegWrite(RegWrite),
    .Branch(Branch),
    .ResultSrc(ResultSrc), 
    .ALUControl(ALUControl),
    .ImmSrc(ImmSrc)     
    );
endmodule
