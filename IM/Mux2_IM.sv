module Mux2_IM #(parameter MEMORY_DATA_SIZE = 16) 
				(input logic [MEMORY_DATA_SIZE-1:0] data1, data2, input logic sel, 
				output logic [MEMORY_DATA_SIZE-1:0] out);
				
	assign out = sel ? data2 : data1;
endmodule
