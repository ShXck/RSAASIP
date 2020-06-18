`timescale 1ns / 1ps

module MEMWB_TB();

	parameter ARQ = 16;

	logic clk, rst, mem_rd_mux_in, wb_enable_in, mem_rd_mux_out, wb_enable_out;
	logic[ARQ - 1:0] alu_result_in, mem_result_in, alu_result_out, mem_result_out;
	
	MEMWB_Pipe uut(clk, rst, mem_rd_mux_in, wb_enable_in, alu_result_in, mem_result_in, 
						mem_rd_mux_out, wb_enable_out, alu_result_out, mem_result_out);
						
	initial begin
		clk = 0; rst = 1;
		#100 rst = 0; mem_rd_mux_in = 1; wb_enable_in = 0; alu_result_in = 16'd1110; mem_result_in = 16'd1874;
		#100 rst = 1;
	end
	
	always #5 clk = ~clk; 
	
endmodule

