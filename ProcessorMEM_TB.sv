`timescale 1ms / 1ns  

module ProcessorMEM_TB();

parameter ARQ = 16;
	
	//IF 
	logic clk, rst, rst_alu, pc_enable;
	logic[ARQ-1:0] instr_out;
	
	//ID 
	logic[ARQ-1:0] wb_out;
	
	
	ProcessorMEM uut(clk, rst, rst_alu, pc_enable, instr_out,  // IF
						wb_out); 
	initial begin 
		clk = 0; rst = 1; rst_alu = 1; pc_enable = 1; 
		#10 rst = 0; 
		#5 pc_enable = 0;
		#10;
		#5 pc_enable = 1;
		#10;
		#5 pc_enable = 0;
		#10;
		#5 pc_enable = 1; 
		#10
		#5 pc_enable = 0; 
		#10;
		#5 pc_enable = 1;
		#10;
		#5 pc_enable = 0;
		#10;
		#5 pc_enable = 1;
		#10
		#5 pc_enable = 0; 
		#10;
		#5 pc_enable = 1;
		#10;
		#5 pc_enable = 0;
		#10;
		#5 pc_enable = 1;
	end
	
	always #5 clk = ~clk; 


endmodule
