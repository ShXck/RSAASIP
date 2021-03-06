module Zero_TB();

	parameter ARQ = 16;
	
	logic [ARQ - 1:0] in;
	logic z;
	
	Zero_Flag uut(in, z);
	
	initial begin
		#100 in = 16'd0;
		#100 in = 16'd2;
	end

endmodule
