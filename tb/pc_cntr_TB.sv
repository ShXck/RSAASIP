module pc_cntr_TB();

	logic clk, clk_out;
	
	pc_counter uut(clk, clk_out);
	
	initial begin
		clk = 0; 
	end
	
	always #5 clk = ~clk; 
	
endmodule
