module ZeroExtend_TB();

	parameter ARQ = 16;

	logic [9:0] in;
	logic [ARQ - 1:0] out;
	
	Zero_Extend uut(in, out);
	
	initial begin
		#100 in = 10'd15; 
	end
endmodule
