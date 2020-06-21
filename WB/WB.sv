module WB #(parameter ARQ = 16) 
				(input logic [ARQ-1:0] ALU_value, mem_value, input logic mux_sel, 
				output logic [ARQ-1:0] wb_result);
				
	assign wb_result = mux_sel ? mem_value : ALU_value;
endmodule
