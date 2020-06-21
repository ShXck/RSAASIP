module Top_ID_TB();

	parameter ARQ = 16;
	logic clk, rst, rst_ALU, branch_taken;
	logic[12:0] jaddr, addr;
	logic [ARQ-1:0] instr;
	
	logic [ARQ-1:0] src1_in, src2_in, src3_in, imm, wb_result_in;
	logic wr_reg_en, jop_lsb, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable, pc_en_out, wb_enable_out;
	logic[1:0] alu_op;
											
	TOP uut(clk, rst, rst_ALU, branch_taken, wr_reg_en, jaddr, wb_result_in, instr, src1_in, src2_in, src3_in, imm, addr, jop_lsb, 
				rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable, pc_en_out, wb_enable_out, alu_op);
	
	initial begin
		clk = 1; rst = 1; branch_taken = 0; jaddr = 13'd2; wb_result_in = 16'd17; wr_reg_en = 1; 
		#5 rst = 0; 
		#5 branch_taken = 1; 
		#5 branch_taken = 0; 	 	
	end 
	
	always #5 clk = ~clk; 

endmodule
