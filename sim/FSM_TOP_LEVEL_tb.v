module FSM_TOP_LEVEL_tb();
  parameter size =4;
  wire [size-1:0]DATA;
  wire DONE;
  reg START, CLK, RST, clock;
  reg [size-1:0] COUNT;

FSM_TOP_LEVEL DUT (START, CLK, RST, COUNT, DONE, DATA);
always begin
    CLK = 1; #50; CLK = 0; #50;
end

initial
begin
    START = 0; RST = 1; COUNT = 4'b0110; #100;
    START = 1; RST = 0; COUNT = 4'b0110; #100;
end
endmodule