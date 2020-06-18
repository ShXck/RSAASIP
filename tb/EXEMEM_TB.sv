`timescale 1ns / 1ps

module EXEMEM_TB();

	parameter ARQ = 16;

	logic clk, rst, wb_enable_in, mem_enable_in, wb_enable_out, mem_enable_out;
	logic[ARQ - 1:0] src1_in, srcdest_in, alu_result_in, src1_out, srcdest_out, alu_result_out;
	
	EXEMEM_Pipe uut(clk, rst, wb_enable_in, mem_enable_in, src1_in, srcdest_in, alu_result_in,
						wb_enable_out, mem_enable_out, src1_out, srcdest_out, alu_result_out);
						
	initial begin
		clk = 0; rst = 1;
		#100 rst = 0; wb_enable_in = 0; mem_enable_in = 1; src1_in = 16'd1821; srcdest_in = 16'd1114; alu_result_in = 16'd1421;
		#100 rst = 1;
	end
	
	always #5 clk = ~clk;

endmodule
