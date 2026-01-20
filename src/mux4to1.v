module mux4to1 (Y, I0, I1, I2, I3, S);
    parameter SIZE = 4;
    output reg [SIZE-1:0] Y;
    input [SIZE-1:0] I0, I1, I2, I3;
    input [1:0] S;

    always @(I0 or I1 or I2 or I3 or S) begin
        if (S == 2'b00)
            Y = I0;
        else if (S == 2'b01)
            Y = I1;
        else if (S == 2'b10)
            Y = I2;
        else
            Y = I3;
    end
endmodule