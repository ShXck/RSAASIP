module EXEMEM_Pipe #(parameter ARQ = 16)(input logic clk, rst, wb_enable_in, rd_mem_en, wr_mem_en, pc_en_in, 
														input logic[ARQ - 1:0] src1_in, srcdest_in, alu_result_in,
														output logic wb_enable_out, rd_mem_en_out, wr_mem_en_out, pc_en_out, 
														output logic[ARQ - 1:0] src1_out, srcdest_out, alu_result_out);
														
	always @(posedge clk) begin
		if(rst) begin
			{wb_enable_out, rd_mem_en_out, wr_mem_en_out, src1_out, srcdest_out, alu_result_out, pc_en_out} <= 0;
		end
		else begin
			wb_enable_out <= wb_enable_in;
			rd_mem_en_out <= rd_mem_en;
			wr_mem_en_out <= wr_mem_en;
			src1_out <= src1_in;
			srcdest_out <= srcdest_in;
			alu_result_out <= alu_result_in;
			pc_en_out <= pc_en_in;
		end
	end
endmodule
