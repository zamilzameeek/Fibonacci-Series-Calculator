module FSM_TOP_LEVEL (DONE, DATA, START, CLK, RST, COUNT);
    parameter SIZE = 4;
    output [SIZE-1:0] DATA;
    output DONE;
    input [SIZE-1:0] COUNT;
    input START, CLK, RST;

    wire [SIZE-1:0] Outcounter, Data_in;
    wire [SIZE-2:0] alu_opcode;
    wire [SIZE-3:0] wrt_addr, rd_addr1, rd_addr2;
    wire wrt_en, clk_internal, load_data, ZERO_FLAG;

    fibo_fsm F1(START, CLK, ZERO_FLAG, RST, DONE, alu_opcode, rd_addr1, rd_addr2, wrt_addr, wrt_en, clk, load_data);
    fibo_datapath F2(Data_in, ZERO_FLAG, COUNT, wrt_addr, wrt_en, clk, load_data, rd_addr1, rd_addr2, alu_opcode);
    memory F3(COUNT, Outcounter, Data_in, DATA, CLK);
endmodule


