module MODEX_Processor#(parameter ARQ = 16)(clk, rst, address, encrypted_32, decrypted);
	
	parameter ADDR = 18;
	
	input logic clk, rst;
	input logic[ADDR-1:0] address;
	output logic[ARQ-1:0] decrypted;
	output logic[2*ARQ-1:0] encrypted_32;
	
	logic[ARQ-1:0] encrypted;
	logic finish;
	
	logic[ADDR-1:0] address2;
	
	assign address2 = address + 1;
	
	logic[ARQ-1:0] pix1, pix2;
	
	MODEX_Memory modex_mem(address, pix1);
	
	MODEX_Memory mem2(address2, pix2);
	
	logic[ARQ-1:0] concat;
	assign concat	= {pix1[7:0], pix2[7:0]};
	
	Zero_Ext_32 ext_32(concat, encrypted_32);
	
	Mod_Exp modex(encrypted_32, 1927, 1349, clk, rst, finish, decrypted);

endmodule