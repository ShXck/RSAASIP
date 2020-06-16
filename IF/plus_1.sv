module plus_1 #(parameter MEMORY_ADDR_SIZE = 6) (addr_in, addr_out);
	
	input logic[MEMORY_ADDR_SIZE-1:0] addr_in;
	output logic[MEMORY_ADDR_SIZE-1:0] addr_out;

	assign addr_out = addr_in + 1;

endmodule
