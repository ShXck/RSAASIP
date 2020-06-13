`timescale 1ns / 1ps

module ALU_TB();

	parameter ARQ = 16;
	
	logic [ARQ - 1:0] d1, d2, d3, result;
	logic z, clk, rst;
	logic [1:0] contrl;
	
	ALU uut(d1, d2, d3, contrl, clk, rst, result, z);
	
	initial begin
		clk = 0; rst = 0;
		d1 = 16'd15; d2 = 16'd15; d3 = 16'd15;
		#100 contrl = 2'b0;
		#100 contrl = 2'b1;
		#100 d1 = 16'd16; d2 = 16'd27; d3 = 16'd237;
		#10 rst = 1'b1; contrl = 2'b10;
		#10 rst = 1'b0; 
	end
	
	always #5 clk = ~clk;

endmodule
