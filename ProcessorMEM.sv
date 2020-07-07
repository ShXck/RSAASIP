module ProcessorMEM #(parameter ARQ = 16)(clk, rst, rst_alu, pc_enable, instr_out,  // IF
													alu_result_wb_in, mem_data_wb_in, wb_out);
													
	parameter MEM_ADDR = 13;
	
	//IF 
	input logic clk, rst, rst_alu, pc_enable;
	output logic[ARQ-1:0] instr_out;
	
	//ID 
	output logic[ARQ-1:0] alu_result_wb_in, mem_data_wb_in, wb_out;
	//output logic
	
	// IF Linkers
	logic branch_taken;
	logic[ARQ-1:0] instr;
	logic[MEM_ADDR-1:0] jump_address;
	
	// ID Linkers
	logic[MEM_ADDR-1:0] jaddr, jaddr_exe_in;
	logic jop_lsb, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable, pc_en_out, wb_enable_out, wb_enable_exe_in,
			rd_mem_exe_in, wr_mem_exe_in, mux_exe_exe_in, mux_mem_exe_in, jop_exe_in, jenable_exe_in, pc_exe_in;
	logic[ARQ-1:0] src1, src2, src3, imm, src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in;
	logic[1:0] alu_op, alu_op_exe_in;
	logic[2:0] wb_dest_out, wb_dest_exe_in;
	
	//EXE Linkers
	logic[ARQ-1:0] alu_result;
	logic wb_enable_mem_in, rd_mem_mem_in, wr_mem_mem_in, mux_mem_mem_in, pc_mem_in;
	logic[ARQ-1:0] src1_mem_in, src3_mem_in, wb_imm_mem_in, alu_result_mem_in;
	logic[2:0] wb_dest_mem_in;
	
	//MEM Linkers
	logic[ARQ-1:0] mem_data, wb_imm_wb_in; /*mem_data_wb_in alu_result_wb_in*/
	logic wb_mux_control, wb_enable_wb_in, pc_wb_in; 
	logic[2:0] wb_dest_wb_in;
	
	
	IF fetch(clk, rst, pc_enable, branch_taken, jump_address, instr);
	
	IFID_Pipe ifid_pipe(clk, rst, 0, instr, instr_out);
	
	ID deco(instr_out, wb_out, wb_imm_wb_in, clk, rst, wb_enable_wb_in, wb_dest_wb_in, src1, src2, src3, imm, jaddr, jop_lsb, rd_mem_en, 
			wr_mem_en, mux_exe, mux_mem, jenable, pc_en_out, wb_enable_out, alu_op, wb_dest_out);
			
	IDEXE_Pipe idexe_pipe(clk, rst, wb_enable_out, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jop_lsb, jenable, pc_en_out,
								src1, src2, src3, imm, alu_op, jaddr, wb_dest_out,
								wb_enable_exe_in, rd_mem_exe_in, wr_mem_exe_in, mux_exe_exe_in, mux_mem_exe_in, jop_exe_in,
								jenable_exe_in, pc_exe_in, src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in, alu_op_exe_in, 
								jaddr_exe_in, wb_dest_exe_in);
								
	EXE exe(clk, rst_alu, mux_exe_exe_in, jop_exe_in, jenable_exe_in, alu_op_exe_in, src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in,
				jaddr_exe_in, alu_result, branch_taken, jump_address);
				
	EXEMEM_Pipe exemem_pipe(clk, rst, wb_enable_exe_in, rd_mem_exe_in, wr_mem_exe_in, mux_mem_exe_in, pc_exe_in,
									src1_exe_in, src3_exe_in, alu_result, imm_exe_in, wb_dest_exe_in, 
									wb_enable_mem_in, rd_mem_mem_in, wr_mem_mem_in, mux_mem_mem_in, pc_mem_in,
									src1_mem_in, src3_mem_in, alu_result_mem_in, wb_imm_mem_in, wb_dest_mem_in);

	IM mem(clk, rst, rd_mem_mem_in, wr_mem_mem_in, mux_mem_mem_in, src3_mem_in[9:0], alu_result_mem_in, src1_mem_in, mem_data);
	
	MEMWB_Pipe memwb_pipe(clk, rst, rd_mem_mem_in, wb_enable_mem_in, pc_mem_in, alu_result_mem_in, mem_data, wb_imm_mem_in, wb_dest_mem_in,
					wb_mux_control, wb_enable_wb_in, pc_wb_in, alu_result_wb_in, mem_data_wb_in, wb_imm_wb_in, wb_dest_wb_in);
					
	WB wb(alu_result_wb_in, mem_data_wb_in, wb_mux_control, wb_out);
	
	
endmodule



//MEM Linkers
	/*logic[ARQ-1:0] mem_data, wb_imm_wb_in; /*mem_data_wb_in alu_result_wb_in*/
	/*logic wb_mux_control, wb_enable_wb_in, pc_wb_in; 
	logic[2:0] wb_dest_wb_in;*/
	
	//WB Linkers
	//logic[ARQ-1:0] wb_out;
	
		/*IM mem(clk, rst, rd_mem_mem_in, wr_mem_mem_in, mux_mem_mem_in, src3_mem_in[9:0], alu_result_mem_in, src1_mem_in, mem_data);
	
	
	MEMWB_Pipe memwb_pipe(clk, rst, rd_mem_mem_in, wb_enable_mem_in, pc_mem_in, alu_result_mem_in, mem_data, wb_imm_mem_in, wb_dest_mem_in,
					wb_mux_control, wb_enable_wb_in, pc_wb_in, alu_result_wb_in, mem_data_wb_in, wb_imm_wb_in, wb_dest_wb_in);
					
	WB wb(alu_result_wb_in, mem_data_wb_in, wb_mux_control, wb_out);*/
