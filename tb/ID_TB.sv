module ID_TB();

parameter ARQ = 16;

logic[ARQ - 1:0] instr, wb_result;
logic clk, rst, wr_register, jop_lsb, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable, wb_enable;
logic[ARQ - 1:0] out1, out2, out3;
logic[9:0] imm;
logic[13:0] addr;
logic[1:0] alu_op;

ID uut(instr, wb_result, clk, rst, wr_register, out1, out2, out3, imm, addr, jop_lsb, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable, wb_enable, alu_op);

initial begin
	clk = 0; rst = 1; 
	#100 rst = 0; wr_register = 1; instr = 16'b0000100000010000; wb_result = 16'b0;  // SET R2, 16
	#100 wr_register = 1; instr = 16'b0000010000010001; wb_result = 16'd451;  // SET R1, 17
	#100 wr_register = 1; instr = 16'b0000000000010011; wb_result = 16'd555;  // SET R0, 19
	#100 wr_register = 0; instr = 16'b0100000010100000; // MODEX R0, R1, R2
	#100 wr_register = 1; instr = 16'b0010010100000000; wb_result = 16'd150; // LDPX R1, [R2]
	#100 wr_register = 0; instr = 16'b0111001110000000; wb_result = 0; //STPX R4, [R8]
	#100 wr_register = 0; instr = 16'b1000001011100000; wb_result = 0; // CMPEQ R5, R6
	#100 wr_register = 0; instr = 16'b1010000000000100; wb_result = 0; // JEQ 4
	#100 wr_register = 0; instr = 16'b1100000000000101; wb_result = 0; // J 5 
	#100 wr_register = 1; instr = 16'b1110110000001111; wb_result = 16'd100; // ADD R3,15
	#100;
end

always #5 clk = ~clk;

endmodule
