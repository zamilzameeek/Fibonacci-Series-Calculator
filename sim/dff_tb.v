module dff_tb();
    parameter SIZE = 4;
    wire [SIZE-1:0] Q;
    reg [SIZE-1:0] D;
    reg Clk;

    dff DUT (Q, D, Clk);

    initial
    begin
        Clk=1'b1;
        forever #100 Clk=~Clk;
    end

    initial
    begin
        D=4'b0001; #100;
        D=4'b0010; #100;
        D=4'b0100; #100;
        D=4'b1000; #100;
        D=4'b0011; #100;
        D=4'b0111; #100;
    end
endmodule