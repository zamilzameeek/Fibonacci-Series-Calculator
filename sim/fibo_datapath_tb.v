module fibo_datapath_tb();
    parameter SIZE=4;
    wire zero_flag;
    wire [SIZE-1: 0] data;
    reg wrt_en, clk, load_data;
    reg [SIZE-1: 0] count;
    reg [1: 0] wrt_addr, rd_addr1, rd_addr2;
    reg [2: 0] alu_opcode;

fibo_datapath DUT (data, zero_flag, count, wrt_addr, wrt_en, clk, load_data, rd_addr1, rd_addr2, alu_opcode);

initial
begin
    clk=1'b0;
    forever #25 clk=~clk;
end

initial
begin
    wrt_en=1; load_data=0; wrt_addr=2'b01; rd_addr1=2'b01; rd_addr2=2'b01; alu_opcode=3'b001; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b10; rd_addr1=2'b10; rd_addr2=2'b10; alu_opcode=3'b001; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b11; rd_addr1=2'b01; rd_addr2=2'b01; alu_opcode=3'b111; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b01; rd_addr1=2'b01; rd_addr2=2'b10; alu_opcode=3'b110; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b10; rd_addr1=2'b11; rd_addr2=2'b11; alu_opcode=3'b111; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b11; rd_addr1=2'b01; rd_addr2=2'b01; alu_opcode=3'b111; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b10; rd_addr1=2'b01; rd_addr2=2'b11; alu_opcode=3'b111; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b11; rd_addr1=2'b01; rd_addr2=2'b11; alu_opcode=3'b111; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b01; rd_addr1=2'b01; rd_addr2=2'b10; alu_opcode=3'b110; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b10; rd_addr1=2'b11; rd_addr2=2'b11; alu_opcode=3'b111; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b11; rd_addr1=2'b01; rd_addr2=2'b01; alu_opcode=3'b111; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b01; rd_addr1=2'b01; rd_addr2=2'b10; alu_opcode=3'b110; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b10; rd_addr1=2'b11; rd_addr2=2'b11; alu_opcode=3'b111; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b11; rd_addr1=2'b01; rd_addr2=2'b01; alu_opcode=3'b111; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b01; rd_addr1=2'b01; rd_addr2=2'b10; alu_opcode=3'b110; count=4'b0110; #100;
    wrt_en=1; load_data=0; wrt_addr=2'b10; rd_addr1=2'b11; rd_addr2=2'b11; alu_opcode=3'b111; count=4'b0110; #100;
end
endmodule