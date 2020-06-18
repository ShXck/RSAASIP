`timescale 1ns / 1ps

module IDEXE_TB();

	parameter ARQ = 16;

	logic clk, rst, wb_enable_in, mem_enable_in, mux_exe_in, jop_lsb_in, wb_enable_out, mem_enable_out, mux_exe_out, jop_lsb_out;
	logic[ARQ - 1:0] src1_in, src2_in, srcdest_in, imm_in, src1_out, src2_out, srcdest_out, imm_out;
	logic[1:0] alu_op_in, alu_op_out;
	logic[12:0] jaddr_in, jaddr_out;
	
	IDEXE_Pipe uut(clk, rst, wb_enable_in, mem_enable_in, mux_exe_in, jop_lsb_in, src1_in, src2_in, srcdest_in, imm_in, alu_op_in, jaddr_in,
						wb_enable_out, mem_enable_out, mux_exe_out, jop_lsb_out, src1_out, src2_out, srcdest_out, imm_out, alu_op_out, jaddr_out);
	
	initial begin
	
	clk = 0; rst = 1; 
	#100 rst = 0; wb_enable_in = 1; mem_enable_in = 0; mux_exe_in = 1; jop_lsb_in = 0; src1_in = 16'd152; src2_in = 16'd155; srcdest_in = 16'd170; imm_in = 16'd450; alu_op_in = 2'b00; jaddr_in = 13'd1254;
	
	
	end
	
	always #5 clk = ~clk;

endmodule
