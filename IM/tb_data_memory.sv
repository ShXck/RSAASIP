module tb_data_memory();

	parameter MEMORY_SIZE = 1024;
	parameter MEMORY_ADDR_SIZE = 10;
	parameter MEMORY_DATA_SIZE = 16;

	logic clk, rst, writeEn, readEn;
	logic [MEMORY_ADDR_SIZE-1:0] address;
	logic [MEMORY_DATA_SIZE-1:0] dataIn, dataOut;

	dataMem dut(clk, rst, writeEn, readEn, address, dataIn, dataOut);

	initial 
		begin  
			readEn <= 1;
			rst <= 1;
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
			writeEn <= 1;
			dataIn <= 16'b1110;
		end

endmodule 