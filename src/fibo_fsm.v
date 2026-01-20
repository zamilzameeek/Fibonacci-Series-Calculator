module fibo_fsm (START, CLK, ZERO_FLAG, RST, DONE, alu_opcode, rd_addr1, rd_addr2, wrt_addr, wrt_en, clk_out, load_data);
    parameter SIZE = 4;
    output [1:0] rd_addr1, rd_addr2, wrt_addr;
    output [2:0] alu_opcode;
    output DONE, wrt_en, clk_out, load_data;
    input START, CLK, ZERO_FLAG, RST;

    wire [2:0] opcode;
    wire [1:0] Opr1, Opr2;

    // Instantiate main FSM
    fsm F1 (START, ZERO_FLAG, CLK, RST, opcode, Opr1, Opr2, DONE);

    // Instantiate FSM Decoder
    fsm_deco F2 (opcode, Opr1, Opr2, alu_opcode, rd_addr1, rd_addr2, wrt_addr, wrt_en, load_data);

    assign clk_out = CLK;
endmodule