module BranchUnit_TB();

	logic [9:0] address, out_addr;
	logic z, b_taken, jenable;
	logic [2:0] op;
	
	Branch_Unit uut(address, op, z, jenable, b_taken, out_addr);
	
	initial begin
		#100 address = 10'd25; op = 3'b101; z = 1; jenable = 1;
		#100 address = 10'd30; op = 3'b101; z = 0; jenable = 1;
		#100 address = 10'd60; op = 3'b110; z = 0; jenable = 0;
		#100 address = 10'd65; op = 3'b110; z = 1; jenable = 1;
	end
	
endmodule
