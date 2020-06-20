module IDEXE_Pipe #(parameter ARQ = 16)(input logic clk, rst, wb_enable_in, rd_enable_in, wr_mem_en, 
							mux_exe_in, mux_mem_in, 
							jop_lsb_in, jenable_in, pc_en_in, input logic[ARQ - 1:0] src1_in, src2_in, srcdest_in, imm_in, 
							input logic[1:0] alu_op_in, input logic[12:0] jaddr_in,
							output logic wb_enable_out, rd_mem_en_out, wr_mem_en_out, mux_exe_out, mux_mem_out, jop_lsb_out, jenable_out, 
							pc_en_out, output logic[ARQ - 1:0] src1_out, src2_out, srcdest_out, imm_out,
							output logic [1:0] alu_op_out, output logic[12:0] jaddr_out);
	
	always @(posedge clk) begin
		if(rst) begin
			{wb_enable_out, rd_mem_en_out, wr_mem_en_out, jop_lsb_out, src1_out, src2_out, srcdest_out, imm_out, alu_op_out, jaddr_out, jenable_out, pc_en_out} <= 0;
		end
		else begin
			wb_enable_out <= wb_enable_in;
			rd_mem_en_out <= rd_enable_in;
			wr_mem_en_out <= wr_mem_en;
			mux_exe_out <= mux_exe_in;
			mux_mem_out <= mux_mem_in;
			jop_lsb_out <= jop_lsb_in;
			src1_out <= src1_in;
			src2_out <= src2_in;
			srcdest_out <= srcdest_in;
			imm_out <= imm_in;
			alu_op_out <= alu_op_in;
			jaddr_out <= jaddr_in;
			jenable_out <= jenable_in;
			pc_en_out <= pc_en_in;
		end
	
	end

endmodule
