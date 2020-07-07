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
		#100 d1 = 32'd255; d2 = 32'd1927; d3 = 32'd1349; contrl = 2'b10; rst = 1;
		#50 rst = 0; 
	end
	
	always #5 clk = ~clk;

endmodule
