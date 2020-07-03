module Processor #(parameter ARQ = 16)(clk, rst, rst_alu, pc_enable, instr_out);
	
	parameter MEM_ADDR = 13;
	
	//IF 
	input logic clk, rst, rst_alu, pc_enable;
	output logic[ARQ-1:0] instr_out;

	// IF Linkers
	logic branch_taken = 0;
	logic[MEM_ADDR-1:0] jump_address = 13'd4;
	logic[ARQ-1:0] instr;
	
	IF fetch(clk, rst, pc_enable, branch_taken, jump_address, instr);
	
	IFID_Pipe ifid_pipe(clk, rst, 0, instr, instr_out);
	
	

endmodule

