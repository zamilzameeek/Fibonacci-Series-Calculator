module dff (Q, D, Clk);
    parameter SIZE = 4;
    output reg [SIZE-1:0] Q;
    input [SIZE-1:0] D;
    input Clk;

    always @(posedge Clk) begin
        Q <= D;
    end
endmodule