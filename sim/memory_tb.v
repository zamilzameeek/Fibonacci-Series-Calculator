module memory_tb();
    parameter SIZE = 4;
    wire [SIZE-1:0] Outcounter, Data_out;
    reg [SIZE-1:0] Incounter, Data_in;
    reg Clk;

memory DUT (Incounter, Outcounter, Data_in, Data_out, Clk);

initial
begin
    Clk=1'b1;
    forever #50 Clk=~Clk;
end

initial
begin
    Data_in = 4'b1101; Incounter = 4'b0111; #100;
    Data_in = 4'b1111; Incounter = 4'b0010; #100;
    Data_in = 4'b1010; Incounter = 4'b0010; #100;
    Data_in = 4'b1010; Incounter = 4'b0011; #100;
    Data_in = 4'b0011; Incounter = 4'b0011; #100;
    Data_in = 4'b1101; Incounter = 4'b1100; #100;
end
endmodule 