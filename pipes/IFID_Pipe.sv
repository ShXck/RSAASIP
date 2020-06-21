module IFID_Pipe #(ARQ = 16)(input logic clk, rst, stop, input logic[ARQ - 1:0] instr_in, 
										output logic[ARQ - 1:0]  instr_out);
										
	always @(posedge clk) begin
		if(rst) begin
			instr_out <= 0;
		end
		else if(~stop) begin
			instr_out <= instr_in;
		end
	end
 
endmodule
