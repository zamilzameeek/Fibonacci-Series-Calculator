module fibo_fsm_tb();
  parameter SIZE = 4;
  wire [SIZE-2:0] alu_opcode;
  wire [SIZE-3:0] rd_addr1, rd_addr2, wrt_addr;
  wire DONE, wrt_en, clk, load_data;
  reg START, CLK, ZERO_FLAG, RST;

fibo_fsm DUT (START, CLK, ZERO_FLAG, RST, DONE, alu_opcode, rd_addr1, rd_addr2, wrt_addr, wrt_en, clk, load_data);

initial
begin
    CLK=1'b1;
    forever #50 CLK=~CLK;
end

initial
begin
    START = 0; ZERO_FLAG = 0; RST = 1; #100; //RST is 1 so goes to S0
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //S0 is START state
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S1
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S2
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S3
    START = 1; ZERO_FLAG = 1; RST = 0; #100; //Moves to S4
    START = 1; ZERO_FLAG = 1; RST = 0; #100; //Goes back to S1
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S2
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S3
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S4
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S5
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S6
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S7
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S8
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S9
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Goes back to S5
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S6
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S7
    START = 1; ZERO_FLAG = 0; RST = 0; #100; //Moves to S8
    START = 1; ZERO_FLAG = 1; RST = 0; #100; //Moves to S9
    START = 1; ZERO_FLAG = 1; RST = 0; #100; //Moves to S10 and it's DONE
    START = 1; ZERO_FLAG = 1; RST = 1; #100; //Goes back to S0
end
endmodule