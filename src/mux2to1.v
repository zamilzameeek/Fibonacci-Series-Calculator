module mux2to1 (Y, I0, I1, S);
    parameter SIZE = 4;
    input [SIZE-1:0] I0, I1;
    input S;
    output reg [SIZE-1:0] Y;

    always @(I0 or I1 or S) 
    begin
        if (S == 0) Y = I0;
        else Y = I1;
    end
endmodule