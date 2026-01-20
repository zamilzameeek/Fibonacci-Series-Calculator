module memory (Incounter, Outcounter, Data_in, Data_out, Clk);
    parameter SIZE = 4;
    output reg [SIZE-1:0] Outcounter, Data_out;
    input [SIZE-1:0] Incounter, Data_in;
    input Clk;

    always @(posedge Clk) begin
        Outcounter <= Incounter;
        Data_out <= Data_in;
    end
endmodule