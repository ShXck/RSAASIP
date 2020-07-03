module pc_counter (clk, clk_out);

	input logic clk;
	output logic clk_out;
	
	logic[2:0] count = 2'd0; 
	
	always @(posedge clk)
		begin
			count <= count + 3'd1;
			if(count == 3'd5) begin
				clk_out <= 3'd1;
				count <= 3'd0;
			end
			else begin
				count <= count + 3'd1;
				clk_out = 3'd0;
			end
		end

endmodule
