module fibo_datapath (data, zero_flag, count, wrt_addr, wrt_en, clk, load_data, rd_addr1, rd_addr2, alu_opcode);
    parameter SIZE = 4;
    output [SIZE-1:0] data;
    output zero_flag;
    input [SIZE-1:0] count;
    input [2:0] alu_opcode;
    input [1:0] wrt_addr, rd_addr1, rd_addr2;
    input wrt_en, clk, load_data;

    wire [3:0] w1, w2;
    wire [SIZE-1:0] w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14;

    decoder2to4 H1 (w1, wrt_addr);
    and H2 (w2[3], w1[3], wrt_en);
    and H3 (w2[2], w1[2], wrt_en);
    and H4 (w2[1], w1[1], wrt_en);
    and H5 (w2[0], w1[0], wrt_en);

    mux2to1 H6 (w3, data, count, load_data);

    dff H7 (w8, w4, clk);
    dff H8 (w9, w5, clk);
    dff H9 (w10, w6, clk);
    dff H10 (w11, w7, clk);

    mux2to1 H11 (w4, w8, w3, w2[3]);
    mux2to1 H12 (w5, w9, w3, w2[2]);
    mux2to1 H13 (w6, w10, w3, w2[1]);
    mux2to1 H14 (w7, w11, w3, w2[0]);

    mux4to1 H15 (w12, w11, w10, w9, w8, rd_addr1);
    mux4to1 H16 (w13, w11, w10, w9, w8, rd_addr2);

    ALU H17 (w12, w13, alu_opcode, w14, zero_flag);
    dff H18 (data, w14, clk);
endmodule