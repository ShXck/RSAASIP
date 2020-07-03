`timescale 1ms / 1ns  


module ProcessorEXE_TB();

parameter ARQ = 16;

	//IF 
	logic clk, rst, rst_alu, pc_enable;
	logic[ARQ-1:0] instr_out;
	
	//ID 
	logic[ARQ-1:0] src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in, alu_result;
	logic wb_enable_mem_in;
	
	ProcessorEXE uut(clk, rst, rst_alu, pc_enable, instr_out,  // IF
						src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in,
						alu_result, wb_enable_mem_in); //ID
	
	initial begin
		clk = 0; rst = 1; rst_alu = 1; pc_enable = 1; 
		#10 rst = 0; 
		#5 pc_enable = 0;
		#10;
		#5 pc_enable = 1;
		#10;
		#5 pc_enable = 0;
		#10;
		#5 pc_enable = 1; rst_alu = 0;
		#10
		#5 pc_enable = 0; 
		#10;
		#5 pc_enable = 1;
		#10
		#5 pc_enable = 0; 
	end
	
	always #5 clk = ~clk; 


endmodule

/*
MEMFILE
____________________
SET R0, 20
SET R1, 28
SET R2, 45
CMPEQ R0, R1
MODEX R0, R1, R2
ADD R2, 15


0000000000010100
0000010000011100
0000100000101101
1000000000010000
0100000010100000
1110100000001111
*/
