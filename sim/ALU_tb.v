module ALU_tb();
    parameter SIZE = 4;
    wire [SIZE-1:0] out;
    wire zero_flag;
    reg [SIZE-1:0] in1, in2;
    reg [2:0] alu_opcode;

    // Instantiate the Unit Under Test (UUT)
    ALU DUT (in1, in2, alu_opcode, out, zero_flag);

    initial
    begin
        in1=4'b0011; in2=4'b0110; alu_opcode=3'b001; #100;
        in1=4'b1111; in2=4'b0110; alu_opcode=3'b010; #100; 
        in1=4'b1111; in2=4'b0110; alu_opcode=3'b011; #100; 
        in1=4'b1001; in2=4'b0110; alu_opcode=3'b100; #100;
        in1=4'b1011; in2=4'b0110; alu_opcode=3'b101; #100;
        in1=4'b1101; in2=4'b0011; alu_opcode=3'b110; #100;
        in2=4'b0010; alu_opcode=3'b111; in1=4'b1101; #100;
        in1=4'b1000; in2=4'b0110; alu_opcode=3'b000; #100;
    end
endmodule