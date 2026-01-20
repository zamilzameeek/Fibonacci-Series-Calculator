module fsm_deco (op_code, Opr1, Opr2, ALU, Rd_addr1, Rd_addr2, wrt_addr, wrt_en, load_data);
    parameter SIZE = 4;
    output reg [2:0] ALU;
    output reg [1:0] Rd_addr1, Rd_addr2, wrt_addr;
    output reg wrt_en, load_data;
    input [2:0] op_code;
    input [1:0] Opr1, Opr2;

    always @(op_code or Opr1 or Opr2) begin
        ALU = op_code;
        Rd_addr1 = 2'b00; 
        Rd_addr2 = 2'b00; 
        wrt_addr = 2'b00;
        wrt_en = 0; 
        load_data = 0;

        case (op_code)
            3'b000: wrt_en = 0; // noop
            3'b001: begin wrt_addr = Opr1; wrt_en = 1; load_data = 0; end // set
            3'b010: begin Rd_addr1 = Opr1; wrt_addr = Opr1; wrt_en = 1; load_data = 0; end // inc
            3'b011: begin Rd_addr1 = Opr1; wrt_addr = Opr1; wrt_en = 1; load_data = 0; end // dec
            3'b100: begin wrt_addr = Opr1; wrt_en = 1; load_data = 1; end // load
            3'b101: begin Rd_addr1 = Opr1; wrt_en = 0; end // store
            3'b110: begin Rd_addr1 = Opr1; Rd_addr2 = Opr2; wrt_addr = Opr1; wrt_en = 1; load_data = 0; end // add
            3'b111: begin wrt_addr = Opr1; Rd_addr1 = Opr2; wrt_en = 1; load_data = 0; end // copy
            default: wrt_en = 0;
        endcase
    end
endmodule