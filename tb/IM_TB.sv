module IM_TB();

	parameter MEMORY_SIZE = 1024;
	parameter MEMORY_ADDR_SIZE = 10;
	parameter MEMORY_DATA_SIZE = 16;
	
	logic clk, rst, readEn, writeEn, mux_sel;
	logic [MEMORY_ADDR_SIZE-1:0] address;
	logic [MEMORY_DATA_SIZE-1:0] data_ALU, data_Reg;
	logic [MEMORY_DATA_SIZE-1:0] dataOut;

	IM dit(clk, rst, readEn, writeEn, mux_sel, address, data_ALU, data_Reg, dataOut);

	initial 
		begin  
			rst <= 1;
			writeEn <= 1;
			readEn <= 0;
		end
	always 
		begin 
			clk <= 1; 
			# 5; 
			clk <= 0; 
			# 5;
		end
	always 
		begin  
			# 10; 
			rst <= 0;
			address  <= 10'b0;
			mux_sel <= 0;
			data_ALU <= 16'b100;
			data_Reg <= 16'b111;
			# 10; 
			address  <= 10'b0;
			mux_sel <= 1;
			data_ALU <= 16'b100;
			data_Reg <= 16'b111;
			readEn <= 1;
			# 10
			writeEn <= 0;
		end

endmodule 