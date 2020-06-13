`timescale 1ns / 1ps

module ModExp_TB();

	parameter ARQ = 16;
    
   reg [ARQ*2-1:0] base;
	reg [ARQ*2-1:0] modulo;
	reg [ARQ*2-1:0] exponent;
	reg clk;
	reg reset;
	wire finish;
	wire [ARQ*2-1:0] result;
	
	Mod_Exp uut(base, modulo, exponent, clk, reset, finish, result);
	defparam uut.ARQ = ARQ;
	
	initial begin
	   base = 150;
	   modulo = 1927;
	   exponent =  1349;
	   clk = 0;
	   reset = 0;
	   #10 reset = 1;
	   #10 reset = 0;
	end
	
	always #5 clk = ~clk;
endmodule
