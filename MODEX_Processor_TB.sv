`timescale 1ms / 1ns  

module MODEX_Processor_TB();

	parameter ADDR = 10;
	parameter ARQ = 16;

	logic clk, rst;
	logic[ADDR-1:0] address;
	logic[ARQ-1:0] encripted, desencripted;

	MODEX_Processor uut(clk, rst, address, encripted, desencripted);
	
	initial begin
		clk = 0; rst = 0; address = 10'd1023;
		#50 rst = 1;
		#50 rst = 0;
	end
	
	always #5 clk = ~clk; 

endmodule
