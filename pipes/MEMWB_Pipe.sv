module MEMWB_Pipe #(parameter ARQ = 16)(input logic clk, rst, mem_rd_mux_in, wb_enable_in, pc_en_in, input logic[ARQ - 1:0] alu_result_in, mem_result_in,
													output logic mem_rd_mux_out, wb_enable_out, pc_en_out, output logic[ARQ - 1:0] alu_result_out, mem_result_out);
	always @(posedge clk) begin
		if(rst) begin
			{mem_rd_mux_out, wb_enable_out, alu_result_out, mem_result_out, pc_en_out} <= 0;
		end
		else begin
			mem_rd_mux_out <= mem_rd_mux_in;
			wb_enable_out <=  wb_enable_in;
			alu_result_out <= alu_result_in;
			mem_result_out <= mem_result_in;
			pc_en_out <= pc_en_in;
		end
	end

endmodule  