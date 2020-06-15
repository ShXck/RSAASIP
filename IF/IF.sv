 module IF #(parameter ARQ = 16)(clk, rst, pc_en, addr_in, addr_out, instr);
 
	parameter MEMORY_ADDR_SIZE = 6;
	
	input logic clk, rst, pc_en;
	input logic[MEMORY_ADDR_SIZE-1:0] addr_in;
	
	output logic[MEMORY_ADDR_SIZE-1:0] addr_out;
	output logic [ARQ-1:0] instr;
	
	
	pc_register pc_reg(clk, rst, pc_en, addr_in, addr_out);
	Instruction_Mem instruction_mem(addr_out, instr);
 
 endmodule
 