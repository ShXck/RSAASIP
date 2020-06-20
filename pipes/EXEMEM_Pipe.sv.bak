module EXEMEM_Pipe #(parameter ARQ = 16)(input logic clk, rst, wb_enable_in, mem_enable_in, input logic[ARQ - 1:0] src1_in, srcdest_in, alu_result_in,
														output logic wb_enable_out, mem_enable_out, output logic[ARQ - 1:0] src1_out, srcdest_out, alu_result_out);
														
	always @(posedge clk) begin
		if(rst) begin
			{wb_enable_out, mem_enable_out, src1_out, srcdest_out, alu_result_out} <= 0;
		end
		else begin
			wb_enable_out <= wb_enable_in;
			mem_enable_out <= mem_enable_in;
			src1_out <= src1_in;
			srcdest_out <= srcdest_in;
			alu_result_out <= alu_result_in;
		end
	end
endmodule
