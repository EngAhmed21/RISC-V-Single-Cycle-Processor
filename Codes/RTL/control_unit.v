module control_unit (
    input [6:0] opcode,
    input [2:0] funct3,
    input zero,
    input [1:0] OP_f7,
    output memWrite, aluSrcB, regWrite,
    output [1:0] resultSrc, aluSrcA,
    output [2:0] immSrc,
    output [3:0] ALU_control,
    output reg [1:0] PC_src, store,
    output reg [2:0] load
);  
    localparam LOAD    = 7'b0000011;
    localparam STORE   = 7'b0100011;
    localparam LW      = 3'b000;
    localparam LH      = 3'b001;
    localparam LB      = 3'b010;
    localparam LHU     = 3'b011;
    localparam LBU     = 3'b100;
    localparam SW      = 2'b00;
    localparam SH      = 2'b01;
    localparam SB      = 2'b10;

    wire branch, jump;
    wire [1:0] aluOP;

    // main_decoder
    main_decoder MAIN_DECODER (.opcode(opcode), .aluOP(aluOP), .branch(branch), .resultSrc(resultSrc), .memWrite(memWrite),
     .aluSrcA(aluSrcA), .aluSrcB(aluSrcB), .regWrite(regWrite), .jump(jump), .immSrc(immSrc));

    // ALU_decoder
    ALU_decoder ALU_DECODER (.aluOP(aluOP), .OP_f7(OP_f7), .funct3(funct3), .ALU_control(ALU_control));

    // PC_src
    always @(*) begin
        PC_src[1] = jump;
        if (~funct3[2])
            if (~funct3[0])
                PC_src[0] = (branch & zero);      // BEQ
            else
                PC_src[0] = (branch & (~zero));   // BNE
        else
            if (funct3[0])
                PC_src[0] = (branch & zero);      // BGE, BGEU
            else
                PC_src[0] = (branch & (~zero));   // BLT, BLTU
    end

    // LOAD
    always @(*) begin
        if (opcode == LOAD) 
            if (funct3 == 3'b000)
                load = LB;
            else if (funct3 == 3'b001)
                load = LH;
            else if (funct3 == 3'b100)
                load = LBU;
            else if (funct3 == 3'b101)
                load = LHU;
            else
                load = LW;
        else
            load = LW;
    end

    // STORE
    always @(*) begin
        if (opcode == STORE) 
            if (funct3 == 3'b000)
                store = SB;
            else if (funct3 == 3'b001)
                store = SH;
            else
                store = SW;
        else
            store = SW;
    end
endmodule