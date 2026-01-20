module ALU (in1, in2, alu_opcode, out, zero_flag);
    parameter SIZE = 4;
    output reg [SIZE-1:0] out;
    output reg zero_flag;
    input [SIZE-1:0] in1, in2;
    input [2:0] alu_opcode;

    // Operation Selection Logic
    always @(in1 or in2 or alu_opcode) begin
        case (alu_opcode)
            3'b001 : out = 1;              
            3'b010 : out = in1 + 1;        
            3'b011 : out = in1 - 1;        
            3'b100 : out = in1;            
            3'b101 : out = in1;            
            3'b110 : out = in1 + in2;      
            3'b111 : out = in2;            
            default: out = 0;              
        endcase
    end

    // Zero Flag Logic
    always @(out) begin
        if (out == 0) 
            zero_flag <= 1;                
        else 
            zero_flag <= 0;                
    end
endmodule