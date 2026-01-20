module fsm (START, ZERO_FLAG, CLK, RST, opcode, operand1, operand2, DONE);
    parameter SIZE = 4, S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7, S8=8, S9=9, S10=10;
    reg [SIZE-1:0] state, nextstate;
    output reg [2:0] opcode;
    output reg [1:0] operand1, operand2;
    output reg DONE;
    input START, ZERO_FLAG, CLK, RST;

    // State Update Block
    always @(posedge CLK or posedge RST) begin
        if (RST) state <= S0;
        else state <= nextstate;
    end

    // Output Logic Block (Moore FSM)
    always @(state) begin
        operand1 = 2'b00; 
        operand2 = 2'b00; 
        case (state)
            S0:  begin opcode = 3'b000; DONE = 0; end
            S1:  begin opcode = 3'b100; operand1 = 2'b00; DONE = 0; end
            S2:  begin opcode = 3'b001; operand1 = 2'b01; DONE = 0; end
            S3:  begin opcode = 3'b001; operand1 = 2'b10; DONE = 0; end
            S4:  begin opcode = 3'b101; operand1 = 2'b00; DONE = 0; end
            S5:  begin opcode = 3'b111; operand1 = 2'b11; operand2 = 2'b01; DONE = 0; end
            S6:  begin opcode = 3'b110; operand1 = 2'b01; operand2 = 2'b10; DONE = 0; end
            S7:  begin opcode = 3'b111; operand1 = 2'b10; operand2 = 2'b11; DONE = 0; end
            S8:  begin opcode = 3'b011; operand1 = 2'b00; DONE = 0; end
            S9:  begin opcode = 3'b101; operand1 = 2'b00; DONE = 0; end
            S10: begin opcode = 3'b101; operand1 = 2'b01; DONE = 1; end
            default: begin opcode = 3'b000; DONE = 0; end
        endcase
    end

    // Next State Logic Block
    always @(state or START or ZERO_FLAG or RST) begin
        case (state)
            S0: nextstate = (START && !RST) ? S1 : S0;
            S1: nextstate = (!RST) ? S2 : S0;
            S2: nextstate = (!RST) ? S3 : S0;
            S3: nextstate = (!RST) ? S4 : S0;
            S4: nextstate = (!RST) ? (ZERO_FLAG ? S1 : S5) : S0;
            S5: nextstate = (!RST) ? S6 : S0;
            S6: nextstate = (!RST) ? S7 : S0;
            S7: nextstate = (!RST) ? S8 : S0;
            S8: nextstate = (!RST) ? S9 : S0;
            S9: nextstate = (!RST) ? (ZERO_FLAG ? S10 : S5) : S0;
            S10: nextstate = (!RST) ? S10 : S0;
            default: nextstate = S0;
        endcase
    end
endmodule