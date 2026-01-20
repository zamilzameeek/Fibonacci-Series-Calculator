module decoder2to4_tb();
    parameter SIZE = 4;
    wire [SIZE-1:0] Out;
    reg [SIZE-3:0] In;

    decoder2to4 DUT (Out, In);

    initial
    begin
        In=2'b00; #100;
        In=2'b01; #100;
        In=2'b10; #100;
        In=2'b11; #100;
    end
endmodule