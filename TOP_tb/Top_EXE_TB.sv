`timescale 1ms / 1ns


module Top_EXE_TB();

	parameter ARQ = 16;
	parameter MEMORY_ADDR_SIZE = 13;
	
	logic clk, rst, rst_ALU, wr_reg_en;
	logic [ARQ-1:0] instr_out, wb_result_in;

	logic[ARQ - 1:0] alu_result_mem_in, src3_mem_in, src1_mem_in;
	logic pc_mem_in, wb_enable_mem_in, rd_mem_mem_in, wr_mem_mem_in;
											
	TOP uut (clk, rst, rst_ALU, wr_reg_en, wb_result_in, instr_out, 
				wb_enable_mem_in, rd_mem_mem_in, wr_mem_mem_in, pc_mem_in,
				src1_mem_in, src3_mem_in, alu_result_mem_in); 

	
	initial begin 
		clk = 1; rst = 1; wb_result_in = 16'd17; wr_reg_en = 1;   
		#5 rst = 0; 
	end 
	
	always #5 clk = ~clk; 

endmodule
