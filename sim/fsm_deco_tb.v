module fsm_deco_tb();
  parameter SIZE = 4;
  wire [SIZE-2:0] ALU;
  wire [SIZE-3:0] Rd_addr1, Rd_addr2, wrt_addr;
  wire wrt_en, load_data;
  reg [SIZE-2:0] op_code;
  reg [SIZE-3:0] Opr1, Opr2;

fsm_deco DUT(op_code, Opr1, Opr2, ALU, Rd_addr1, Rd_addr2, wrt_addr, wrt_en, load_data);
initial
begin
    op_code = 3'b000; Opr1 = 2'b00; Opr2 = 2'b00; #100;
    op_code = 3'b100; Opr1 = 2'b00; Opr2 = 2'b00; #100;
    op_code = 3'b001; Opr1 = 2'b01; Opr2 = 2'b00; #100;
    op_code = 3'b001; Opr1 = 2'b10; Opr2 = 2'b00; #100;
    op_code = 3'b101; Opr1 = 2'b00; Opr2 = 2'b00; #100;
    op_code = 3'b111; Opr1 = 2'b11; Opr2 = 2'b01; #100;
    op_code = 3'b110; Opr1 = 2'b01; Opr2 = 2'b10; #100;
    op_code = 3'b111; Opr1 = 2'b10; Opr2 = 2'b11; #100;
    op_code = 3'b011; Opr1 = 2'b00; Opr2 = 2'b00; #100;
    op_code = 3'b101; Opr1 = 2'b00; Opr2 = 2'b00; #100;
    op_code = 3'b101; Opr1 = 2'b01; Opr2 = 2'b00; #100;
end
endmodule