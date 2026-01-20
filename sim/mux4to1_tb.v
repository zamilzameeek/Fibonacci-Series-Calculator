module mux4to1_tb();
    parameter SIZE = 4;
    wire [SIZE-1:0] Y;
    reg [SIZE-1:0] I0, I1, I2, I3;
    reg [1:0] S;

    mux4to1 DUT (Y, I0, I1, I2, I3, S);

    initial
    begin
        I0=4'b0000; I1=4'b0001; I2=4'b0010; I3=4'b0011; S=2'b00; #100;
        I0=4'b0000; I1=4'b0001; I2=4'b0010; I3=4'b0011; S=2'b01; #100;
        I0=4'b0000; I1=4'b0001; I2=4'b0010; I3=4'b0011; S=2'b10; #100;
        I0=4'b0000; I1=4'b0001; I2=4'b0010; I3=4'b0011; S=2'b11; #100;
    end
endmodule