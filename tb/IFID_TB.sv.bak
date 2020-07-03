`timescale 1ns / 1ps

module IFID_TB();

	parameter ARQ = 16;

	logic clk, rst, stop;
	logic[ARQ - 1:0] instr_in, instr_out;
	
	IFID_Pipe uut(clk, rst, stop, instr_in, instr_out);
	
	initial begin
		clk = 0; rst = 1; stop = 0;
		#100 rst = 0; instr_in = 16'b0000100000010000;
		#100 instr_in = 16'b0000101100010000; stop = 1;
		#100 stop = 0;
		
	end
	
always #5 clk = ~clk;

endmodule
