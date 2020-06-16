module Mux2_PC #(parameter MEMORY_ADDR_SIZE = 6) 
				(input logic [MEMORY_ADDR_SIZE-1:0] data1, data2, input logic sel, 
				output logic [MEMORY_ADDR_SIZE-1:0] out);
				
	assign out = sel ? data2 : data1;
endmodule
