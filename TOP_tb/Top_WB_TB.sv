`timescale 1ms / 1ns 


module Top_WB_TB();

	parameter ARQ = 16;
	parameter MEMORY_ADDR_SIZE = 13;

	logic clk, rst, rst_ALU, wr_reg_en;
	logic [ARQ-1:0] instr_out;
	
	logic[ARQ - 1:0] wb_result_wb_out, alu_result_wb_in;
	logic wb_enable_wb_in;

	TOP uut(clk, rst, rst_ALU, wr_reg_en, instr_out, wb_enable_wb_in, wb_result_wb_out, alu_result_wb_in);
	
	initial begin 
		clk = 1; rst = 1; wr_reg_en = 1;   
		#5 rst = 0; 
	end 
	
	always #5 clk = ~clk; 

endmodule
