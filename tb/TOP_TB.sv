`timescale 1ms / 1ns

module TOP_TB();

parameter ARQ = 16;
parameter MEMORY_ADDR_SIZE = 13;

logic clk, rst, rst_ALU, wb_enable;
logic [ARQ-1:0] src1_in, src2_in, src3_in, imm;
logic [12:0] addr; 
logic jop_lsb, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable, pc_en, wb_en_exe_out;
logic [1:0] alu_op;


TOP uut(clk, rst, rst_ALU, src1_in, src2_in, src3_in, imm, addr, jop_lsb, rd_mem_en, 
				wr_mem_en, mux_exe, mux_mem, jenable, pc_en, wb_en_exe_out, alu_op);
											
initial begin
	clk = 1; rst = 1; 
	#10
	rst = 0; 
end

always #5 clk = ~clk;

endmodule
