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

    // Core Datapath
    fibo_datapath F2 (
        .data(Data_in), 
        .zero_flag(ZERO_FLAG), 
        .count(COUNT), 
        .wrt_addr(wrt_addr), 
        .wrt_en(wrt_en), 
        .clk(clk_internal), 
        .load_data(load_data), 
        .rd_addr1(rd_addr1), 
        .rd_addr2(rd_addr2), 
        .alu_opcode(alu_opcode)
    );

    // Controller Unit
    fibo_fsm F1 (
        .START(START), 
        .CLK(CLK), 
        .ZERO_FLAG(ZERO_FLAG), 
        .RST(RST), 
        .DONE(DONE), 
        .alu_opcode(alu_opcode), 
        .rd_addr1(rd_addr1), 
        .rd_addr2(rd_addr2), 
        .wrt_addr(wrt_addr), 
        .wrt_en(wrt_en), 
        .clk_out(clk_internal), 
        .load_data(load_data)
    );

    // System Memory/Register
    memory F3 (
        .Incounter(COUNT), 
        .Outcounter(Outcounter), 
        .Data_in(Data_in), 
        .Data_out(DATA), 
        .Clk(CLK)
    );


endmodule
