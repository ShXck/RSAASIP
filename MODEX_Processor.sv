module MODEX_Processor#(parameter ARQ = 16)(clk, rst, address, encripted_32, desencripted);
	
	parameter ADDR = 18;
	
	input logic clk, rst;
	input logic[ADDR-1:0] address;
	output logic[ARQ-1:0] desencripted;
	output logic[2*ARQ-1:0] encripted_32;
	
	logic[ARQ-1:0] alu_result, encripted;
	//logic[2*ARQ-1:0] encripted_32;
	logic finish;
	
	MODEX_Memory modex_mem(address, encripted);
	
	Zero_Ext_32 ext_32(encripted, encripted_32);
	
	Mod_Exp modex(encripted_32, 1927, 1349, clk, rst, finish, desencripted);

endmodule