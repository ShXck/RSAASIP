module Top_ID_TB();

	parameter ARQ = 16;
	parameter MEMORY_ADDR_SIZE = 13;
	
	logic clk, rst, rst_ALU, wr_reg_en;
	logic [ARQ-1:0] instr_out, wb_result_in;
	logic wb_en_exe_in, rd_en_mem_exe_in, wr_en_mem_exe_in, mux_exe_in, mux_exe_mem_in, jop_lsb_exe_in, 
			jenable_exe_in, pc_en_exe_in;
	logic [ARQ-1:0] src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in;
	logic [1:0] alu_op_exe_in;
	logic [MEMORY_ADDR_SIZE-1:0] jaddr_exe_in;
											
	TOP_IDPipe uut(clk, rst, rst_ALU, wr_reg_en, wb_result_in, instr_out,
				wb_en_exe_in, rd_en_mem_exe_in, wr_en_mem_exe_in, mux_exe_in, mux_exe_mem_in, 
				jop_lsb_exe_in, jenable_exe_in, pc_en_exe_in, src1_exe_in, src2_exe_in, src3_exe_in, 
				imm_exe_in, alu_op_exe_in, jaddr_exe_in);  
				
				
	/*module TOP_IDPipe #(parameter ARQ = 16)(clk, rst, rst_ALU, wr_reg_en, wb_result_in, instr_out, 
						wb_en_exe_in, rd_en_mem_exe_in, wr_en_mem_exe_in, mux_exe_in, mux_exe_mem_in, jop_lsb_exe_in, 
								jenable_exe_in, pc_en_exe_in, src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in, 
								alu_op_exe_in, jaddr_exe_in);*/

	
	initial begin 
		clk = 1; rst = 1; wb_result_in = 16'd17; wr_reg_en = 1;   
		#5 rst = 0; 
	end 
	
	always #5 clk = ~clk; 

endmodule
