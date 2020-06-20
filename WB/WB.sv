module WB #(parameter MEMORY_DATA_SIZE = 16) 
				(input logic [MEMORY_DATA_SIZE-1:0] mem_value, ALU_value, input logic mux_sel, 
				output logic [MEMORY_DATA_SIZE-1:0] wb_result);
				
	assign wb_result = mux_sel ? ALU_value : mem_value;
endmodule
