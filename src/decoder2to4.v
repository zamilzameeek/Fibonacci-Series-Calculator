module decoder2to4 (Out, In);
    parameter SIZE = 4;
    output reg [SIZE-1:0] Out;
    input [SIZE-3:0] In;

    always @(In) begin
        case (In)
            2'b00: Out = 4'b0001;
            2'b01: Out = 4'b0010;
            2'b10: Out = 4'b0100;
            2'b11: Out = 4'b1000;
            default: Out = 4'b0000;
        endcase
    end

endmodule

