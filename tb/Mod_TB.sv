`timescale 1ns / 1ps

module Mod_TB;
	parameter ARQ = 16;
	 
	logic [ARQ-1:0] og_numbr, mod;
	logic [ARQ-1:0] result, div_res;
 
	Mod uut(og_numbr, mod, result, div_res);
	
	initial begin
		#100 og_numbr = 12345; mod = 23;
	end       
endmodule
