module clock_divider_ (input logic clk, output logic dividier_clk = 0);
	
	always@(posedge clk)	
		begin
			dividier_clk <= ~dividier_clk;
		end
		
endmodule
