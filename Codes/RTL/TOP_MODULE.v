module TOP_MODULE (
    input clk, rstn, WE,
    input [31:0] WD,
    output [31:0] test
);
    // Internal Signals
    wire memWrite, aluSrcB, regWrite, zero;
    wire [2:0] funct3, immSrc, load;
    wire [3:0] ALU_control;
    wire [1:0] OP_f7, resultSrc, aluSrcA, PCSrc, store;
    wire [31:0] instr, mem_RD, aluResult, PC, mem_WD;
    wire [6:0] opcode;

    // INSTR
    assign opcode  = instr[6:0];
    assign funct3  = instr [14:12];
    assign OP_f7   = {opcode[5], instr[30]};
   
    // Data Path
    data_path DATA_PATH (.clk(clk), .rstn(rstn), .PCSrc(PCSrc), .resultSrc(resultSrc), .memWrite(memWrite),
     .aluSrcA(aluSrcA), .aluSrcB(aluSrcB), .regWrite(regWrite), .aluControl(ALU_control), .immSrc(immSrc), .instr(instr),
     .load(load), .store(store), .mem_RD(mem_RD), .aluResult(aluResult), .PC(PC), .mem_WD(mem_WD), .zero(zero));

    // Control Unit
    control_unit CONTROL_UNIT (.opcode(opcode), .funct3(funct3), .OP_f7(OP_f7), .zero(zero), .PC_src(PCSrc), 
     .resultSrc(resultSrc), .memWrite(memWrite), .aluSrcA(aluSrcA), .aluSrcB(aluSrcB), .regWrite(regWrite), .immSrc(immSrc), 
     .load(load), .store(store), .ALU_control(ALU_control));

    // Instruction Memory
    instr_mem #(.DATA(32), .ADDR(32), .MEM_DEPTH(256)) INSTR_MEM (.clk(clk), .WE(WE), .WD(WD), .PC(PC), .RD(instr));

    // Data Memory
    data_mem #(.DATA(32), .ADDR(32), .MEM_DEPTH(256)) DATA_MEM (.clk(clk), .WE(memWrite), .WD(mem_WD), .A(aluResult), .RD(mem_RD), .test(test));
endmodule
