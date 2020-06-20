 module IF #(parameter ARQ = 16)(clk, rst, pc_en, mux_sel, branch_addr,  instr);
 
	parameter MEMORY_ADDR_SIZE = 13;
	
	input logic clk, rst, pc_en, mux_sel;
	input logic [MEMORY_ADDR_SIZE-1:0] branch_addr;
	output logic [ARQ-1:0] instr;
	
	logic[MEMORY_ADDR_SIZE-1:0] addr_in=13'b0, addr_out;
	logic [MEMORY_ADDR_SIZE-1:0] addr_mux;
	
	Mux2_PC mux_pc(addr_in, branch_addr, mux_sel, addr_mux);
	pc_register pc_reg(clk, rst, pc_en, addr_mux, addr_out);
	Instruction_Mem instruction_mem(addr_out, instr);
	plus_1 plus_pc(addr_out, addr_in);
 
 endmodule
 