`include "PC.v"
`include "Instruction_Memory.v"
`include "Register_file.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Control_Unit_Top.v"
`include "Data_Memory.v"
`include "PC_Adder.v"
`include "Mux.v"


module Single_Cycle_Top(clk,rst);

input clk,rst;

wire [31:0] PC_Top,RD_Instr,RD1_Top,RD2_Top,Imm_Ext_Top,ALUResult,ReadData,PCPlus4,SrcB,Result;

// Control signals - all explicitly declared with correct widths
wire RegWrite,ALUSrc,MemWrite,ResultSrc,Branch;
wire [1:0] ImmSrc;
wire [2:0] ALUControl_Top;



PC PC(
    .clk(clk),
    .rst(rst),
    .PC_NEXT(PCPlus4),
    .PC(PC_Top) 
);

PC_Adder PC_Adder(
    .a(PC_Top),
    .b(32'h00000004),
    .c(PCPlus4)
);

Instruction_Memory Instruction_Memory(
    .A(PC_Top),
    .rst(rst),
    .RD(RD_Instr)
);

Register_File Register_File(
    .A1(RD_Instr[19:15]),
    .A2(RD_Instr[24:20]),
    .A3(RD_Instr[11:7]),
    .WD3(Result),
    .WE3(RegWrite),
    .RD1(RD1_Top),
    .RD2(RD2_Top),
    .rst(rst),
    .clk(clk)
);

Sign_Extend Sign_Extend(
    .In(RD_Instr),
    .Imm_Ext(Imm_Ext_Top),
    .ImmSrc(ImmSrc)
);

Mux Mux(
    .a(RD2_Top),
    .b(Imm_Ext_Top),
    .s(ALUSrc),
    .c(SrcB)
);

ALU ALU(
    .A(RD1_Top),
    .B(SrcB),
    .ALU_Control(ALUControl_Top),
    .Result(ALUResult),
    .Negative(),
    .Zero(),
    .Carry(),
    .OverFlow()
);

Control_Unit_Top Control_Unit_Top(
    .Op(RD_Instr[6:0]),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),
    .funct3(RD_Instr[14:12]),
    .funct7(RD_Instr[31:25]),
    .ALUControl(ALUControl_Top)
);

Data_Memory Data_Memory(
    .A(ALUResult),
    .WD(RD2_Top),
    .WE(MemWrite),
    .clk(clk),
    .rst(rst),
    .RD(ReadData)
);

Mux Mux_DataMemory_to_Register(
    .a(ALUResult),
    .b(ReadData),
    .s(ResultSrc),
    .c(Result)
);



endmodule