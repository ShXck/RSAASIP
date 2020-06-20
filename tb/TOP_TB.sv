`timescale 1ms / 1ns

module TOP_TB();

parameter ARQ = 16;
parameter MEMORY_ADDR_SIZE = 13;

logic clk, rst, rst_ALU;
logic [ARQ-1:0] result_WB;
logic wb_enable_out, rd_mem_en_out, wr_mem_en_out, mux_exe_out, mux_mem_out, jop_lsb_out, jenable_out, pc_en_out;
logic [ARQ - 1:0] src1_out, src2_out, src3_out, imm_out;
logic[1:0] alu_op_out; 
logic[12:0] addr_out;


TOP uut(clk, rst, rst_ALU, result_WB, wb_enable_out, rd_mem_en_out, wr_mem_en_out, mux_exe_out, mux_mem_out, 
		jop_lsb_out, jenable_out, pc_en_out, src1_out, src2_out, src3_out, imm_out, alu_op_out, addr_out);
											
initial begin
	clk = 1; rst = 1; 
	#10
	rst = 0; 
end

always #5 clk = ~clk;

endmodule
