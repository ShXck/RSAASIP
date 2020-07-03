module ProcessorID #(parameter ARQ = 16)(clk, rst, rst_alu, pc_enable, instr_out,  // IF
													wb_result_in, wr_reg_en, src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in,
													mux_exe_exe_in, alu_op_exe_in);
	
	parameter MEM_ADDR = 13;
	
	//IF 
	input logic clk, rst, rst_alu, pc_enable;
	output logic[ARQ-1:0] instr_out;
	
	//ID 
	input logic[ARQ-1:0] wb_result_in;
	input logic wr_reg_en;
	output logic[ARQ-1:0] src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in;
	output logic mux_exe_exe_in;
	output logic[1:0] alu_op_exe_in;
	
	// IF Linkers
	logic branch_taken = 0;
	logic[ARQ-1:0] instr;
	logic[MEM_ADDR-1:0] jump_address;
	
	// ID Linkers
	logic[MEM_ADDR-1:0] jaddr, jaddr_exe_in;
	logic jop_lsb, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable, pc_en_out, wb_enable_out, wb_enable_exe_in, 
			rd_mem_exe_in, wr_mem_exe_in/*, mux_exe_exe_in*/, mux_mem_exe_in, jop_exe_in, jenable_exe_in, pc_exe_in;
	logic[ARQ-1:0] src1, src2, src3, imm; //src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in;
	logic[1:0] alu_op; //alu_op_exe_in;
	
	IF fetch(clk, rst, pc_enable, branch_taken, jump_address, instr);
	
	IFID_Pipe ifid_pipe(clk, rst, 0, instr, instr_out);
	
	ID deco(instr_out, wb_result_in, clk, rst, wr_reg_en, src1, src2, src3, imm, jaddr, jop_lsb, rd_mem_en, 
			wr_mem_en, mux_exe, mux_mem, jenable, pc_en_out, wb_enable_out, alu_op);
			
	IDEXE_Pipe idexe_pipe(clk, rst, wb_enable_out, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jop_lsb, jenable, pc_en_out,
								src1, src2, src3, imm, alu_op, jaddr,
								wb_enable_exe_in, rd_mem_exe_in, wr_mem_exe_in, mux_exe_exe_in, mux_mem_exe_in, jop_exe_in,
								jenable_exe_in, pc_exe_in, src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in, alu_op_exe_in, 
								jaddr_exe_in);
			
	/*module IDEXE_Pipe #(parameter ARQ = 16)(
							output logic [1:0] alu_op_out, output logic[12:0] jaddr_out);*/
			
endmodule

