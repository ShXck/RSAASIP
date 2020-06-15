module pc_register (clk, rst, pc_en, addr_in, addr_out);

	input clk, rst, pc_en;
	input logic[5:0] addr_in;
	output logic[5:0] addr_out;

	logic[5:0] next_addr_out;

	always @ (posedge clk && pc_en) begin
		if (rst == 1) next_addr_out <= 6'b0;
		else next_addr_out <= addr_in;
	end
  
	always @ (negedge clk && pc_en) 
		addr_out <= next_addr_out;
  
endmodule 
