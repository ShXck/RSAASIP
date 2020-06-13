`timescale 1ns / 1ps

module ALU #(parameter ARQ = 16)(input logic [ARQ - 1:0] data1, data2, data3, input logic[1:0] ALU_Contrl, input logic clk, rst,  
											output logic [ARQ - 1:0] ALU_Result, output logic z);
	
	logic cout, mod_fin;
	
	logic [ARQ - 1:0] out0;	// Addition (00)
	logic [ARQ - 1:0] out1;	// Substract (01)
	logic [ARQ - 1:0] out2;	// mod (10)
	
	logic [ARQ - 1:0] final_result;
	
	Adder adder(data1, data2, out0);
	Substraction subs(data1, data2, out1, cout);
	Mod_Exp modex(data1, data2, data3, clk, rst, mod_fin, out2);
	defparam modex.ARQ = 8;
	
	Mux4 selector(out0, out1, out2, 0, ALU_Contrl, final_result); 
	
	Zero_Flag zero(final_result, z);
	// incluir overflow
	
	assign ALU_Result = final_result;
	
endmodule
