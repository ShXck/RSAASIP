module Processor_TB();

	parameter ARQ = 16;

	logic clk, rst, rst_alu, pc_enable;
	logic[ARQ-1:0] instr_out;
	
	Processor uut(clk, rst, rst_alu, pc_enable, instr_out);
	
	initial begin
		clk = 0; rst = 1; rst_alu = 1; pc_enable = 1;
		#10 rst = 0; 
		#5 pc_enable = 0;
		#10;
		#5 pc_enable = 1;
	end
	
	always #5 clk = ~clk; 

endmodule
