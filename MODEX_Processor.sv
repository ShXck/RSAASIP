module MODEX_Processor#(parameter ARQ = 16)(clk, rst, address, encrypted_32, decrypted);
	
	parameter ADDR = 17;
	
	input logic clk, rst;
	input logic[ADDR-1:0] address;
	output logic[ARQ-1:0] decrypted;
	output logic[2*ARQ-1:0] encrypted_32;
	
	logic[ARQ-1:0] encrypted;
	logic finish;
	
	MODEX_Memory modex_mem(address, encrypted);
	
	Zero_Ext_32 ext_32(encrypted, encrypted_32);
	
	Mod_Exp modex(encrypted_32, 1927, 1349, clk, rst, finish, decrypted);

endmodule