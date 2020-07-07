 module IM (clk, rst, readEn, writeEn, mux_sel, address, data_ALU, data_Reg, dataOut);
 
	parameter MEMORY_SIZE = 1024;
	parameter MEMORY_ADDR_SIZE = 10;
	parameter MEMORY_DATA_SIZE = 16;
	
	input logic clk, rst, readEn, writeEn, mux_sel;
	input logic [MEMORY_ADDR_SIZE-1:0] address;
	input logic [MEMORY_DATA_SIZE-1:0] data_ALU, data_Reg;
	output logic [MEMORY_DATA_SIZE-1:0] dataOut;
	
	logic [MEMORY_DATA_SIZE-1:0] data_mux;
	
	Mux2_IM mux_mem(data_ALU, data_Reg, mux_sel, data_mux);
	dataMem mem(clk, rst, writeEn, readEn, address, data_mux, dataOut);

	
 endmodule
 