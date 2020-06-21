module Top_Fetch_TB();

	parameter ARQ = 16;
	logic clk, rst, rst_ALU, pc_en, branch_taken;
	logic[12:0] jaddr;
	logic [ARQ-1:0] instr;
	
	TOP uut(clk, rst, rst_ALU, branch_taken, jaddr, instr);
	
	initial begin
		clk = 1; rst = 1; branch_taken = 0; jaddr = 13'd2;
		#5 rst = 0; 
		#5 branch_taken = 1; 
		#5 branch_taken = 0; 	 	
	end 
	
	always #5 clk = ~clk;

endmodule
