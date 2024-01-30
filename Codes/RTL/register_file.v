module register_file #(parameter DATA = 32, ADDR = 5)(
    input clk, rstn, WE,
    input [ADDR - 1 : 0] RA1, RA2, WA,
    input [DATA - 1 : 0] WD,
    output [DATA - 1 : 0] RD1,RD2 
);
    // Register file
    reg [DATA - 1 : 0] reg_file [0 : (2 ** ADDR) - 1];

    // Writing
    integer i;
    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            for (i = 0; i < 2 ** ADDR; i = i + 1) 
                reg_file[i] <= 0;
        else if (WE && (|WA))
            reg_file[WA] <= WD;
        
    end

    // Reading 
    assign RD1 = reg_file[RA1];
    assign RD2 = reg_file[RA2];
endmodule