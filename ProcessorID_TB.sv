module ProcessorID_TB();

	parameter ARQ = 16;

	logic clk, rst, rst_alu, pc_enable, wr_reg_en, mux_exe;
	logic[ARQ-1:0] src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in, wb_result_in, instr_out;
	logic mux_exe_exe_in;
	logic[1:0] alu_op_exe_in;
	
	ProcessorID uut(clk, rst, rst_alu, pc_enable, instr_out, // IF
						wb_result_in, wr_reg_en, src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in,
						mux_exe_exe_in, alu_op_exe_in); //ID
	
	initial begin
		clk = 0; rst = 1; rst_alu = 1; pc_enable = 1; wb_result_in = 16'd500; wr_reg_en = 1; 
		#10 rst = 0; 
		/*#5 pc_enable = 0; 
		#10;
		#5 pc_enable = 1;
		#10; 
		#5 pc_enable = 0; 
		#10;
		#5 pc_enable = 1; 
		#10;
		#5 pc_enable = 0;
		#10;
		#5 pc_enable = 1;
		#10;
		#5 pc_enable = 0; 
		#10;
		#5 pc_enable = 1;*/
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