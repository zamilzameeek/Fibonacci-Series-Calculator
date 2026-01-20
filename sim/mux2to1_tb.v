module mux2to1_tb();
    parameter SIZE = 4;
    wire [SIZE-1:0] Y;
    reg [SIZE-1:0] I0, I1;
    reg S;

    mux2to1 DUT (Y, I0, I1, S);

    initial
    begin
        I0=4'b0001; I1=4'b1000; S=1'b0; #100;
        I0=4'b0001; I1=4'b1000; S=1'b1; #100;
        I0=4'b1011; I1=4'b1001; S=1'b0; #100;
        I0=4'b1011; I1=4'b1001; S=1'b1; #100;
    end
endmodule