`timescale 1ns / 1ps

module IDEXE_Pipe #(parameter ARQ = 16)(input logic clk, rst, wb_enable_in, mem_enable_in, mux_exe_in, jop_lsb_in,
						input logic[ARQ - 1:0] src1_in, src2_in, srcdest_in, imm_in, input logic[1:0] alu_op_in, input logic[12:0] jaddr_in,
						output logic wb_enable_out, mem_enable_out, mux_exe_out, jop_lsb_out, output logic[ARQ - 1:0] src1_out, src2_out, srcdest_out, imm_out,
						output logic [1:0] alu_op_out, output logic[12:0] jaddr_out);
	
	always @(posedge clk) begin
		if(rst) begin
			{wb_enable_out, mem_enable_out, mem_enable_out, jop_lsb_out, src1_out, src2_out, srcdest_out, imm_out, alu_op_out, jaddr_out} <= 0;
		end
		else begin
			wb_enable_out <= wb_enable_in;
			mem_enable_out <= mem_enable_in;
			mux_exe_out <= mux_exe_in;
			jop_lsb_out <= jop_lsb_in;
			src1_out <= src1_in;
			src2_out <= src2_in;
			srcdest_out <= srcdest_in;
			imm_out <= imm_in;
			alu_op_out <= alu_op_in;
			jaddr_out <= jaddr_in;
		end
	
	end

endmodule
