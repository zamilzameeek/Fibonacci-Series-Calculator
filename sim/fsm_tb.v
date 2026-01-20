module fsm_tb ();
  parameter size = 4;
  wire [size-2:0] opcode;
  wire [size-3:0] operand1, operand2;
  wire DONE;
  reg START, ZERO_FLAG, CLK, RST;

fsm DUT (START, ZERO_FLAG, CLK, RST, opcode, operand1, operand2, DONE);

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