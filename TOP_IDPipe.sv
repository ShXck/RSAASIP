module TOP_IDPipe #(parameter ARQ = 16)(clk, rst, rst_ALU, wr_reg_en, wb_result_in, instr_out, 
						wb_en_exe_in, rd_en_mem_exe_in, wr_en_mem_exe_in, mux_exe_in, mux_exe_mem_in, jop_lsb_exe_in, 
								jenable_exe_in, pc_en_exe_in, src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in, 
								alu_op_exe_in, jaddr_exe_in);

	parameter MEMORY_ADDR_SIZE = 13;
	
	input logic clk, rst, rst_ALU, wr_reg_en;
	input logic [ARQ-1:0] wb_result_in;
	output logic [ARQ-1:0] instr_out;
	
	output logic wb_en_exe_in, rd_en_mem_exe_in, wr_en_mem_exe_in, mux_exe_in, mux_exe_mem_in, jop_lsb_exe_in, jenable_exe_in, pc_en_exe_in;
	output logic[ARQ-1:0] src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in;
	output logic[1:0] alu_op_exe_in;
	output logic[12:0] jaddr_exe_in;
	
	
	//IF 
	logic pc_en=1, stop=0; 
	logic [ARQ-1:0] instr;
	
	//ID
	//logic wb_result_in;
	logic [ARQ-1:0] src1_in, src2_in, src3_in, imm;
	logic [MEMORY_ADDR_SIZE-1:0] addr;
	logic jop_lsb, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable, pc_en_out, wb_enable_out;
	logic [1:0] alu_op;
	
	/*logic wb_en_exe_in, rd_en_mem_exe_in, wr_en_mem_exe_in, mux_exe_in, mux_exe_mem_in, jop_lsb_exe_in, 
	jenable_exe_in, pc_en_exe_in;
	logic [ARQ-1:0] src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in;
	logic [1:0] alu_op_exe_in;
	logic [MEMORY_ADDR_SIZE-1:0] jaddr_exe_in;*/
	
	//EXE
	/*logic[ARQ - 1:0] alu_result;
	logic branch_taken;
	logic[MEMORY_ADDR_SIZE-1:0] jaddr_exe_out;*/
	
	//MEM
	/*logic wb_enable_mem_in, rd_mem_mem_in, wr_mem_mem_in, pc_mem_in;
	logic[ARQ-1:0] src1_mem_in, src3_mem_in, alu_result_mem_in;*/
	

	IF fetch(clk, rst, pc_en, branch_taken, jaddr_exe_out,  instr);
	IFID_Pipe ifid_pipe(clk, rst, stop, instr, instr_out);
	
	ID deco(instr_out, wb_result_in, clk, rst, wr_reg_en, src1_in, src2_in, src3_in, imm, addr, jop_lsb, rd_mem_en, 
				wr_mem_en, mux_exe, mux_mem, jenable, pc_en_out, wb_enable_out, alu_op);
				
	/* module ID #(parameter ARQ = 16)(input logic[ARQ - 1:0] instr, wb_result, input logic clk, rst, wr_register,
											output logic[ARQ - 1:0] out1, out2, out3, imm, output logic[12:0] addr, 
											output logic jop_lsb, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable, pc_en, wb_enable,
											output logic[1:0] alu_op);*/

	IDEXE_Pipe idexe_pipe(clk, rst, wr_reg_en, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jop_lsb, jenable, pc_en_out, 
								src1_in, src2_in, src3_in, imm, alu_op, addr, 
								wb_en_exe_in, rd_en_mem_exe_in, wr_en_mem_exe_in, mux_exe_in, mux_exe_mem_in, jop_lsb_exe_in, 
								jenable_exe_in, pc_en_exe_in, src1_exe_in, src2_exe_in, src3_exe_in, imm_exe_in, 
								alu_op_exe_in, jaddr_exe_in);
								
	/*module IDEXE_Pipe #(parameter ARQ = 16)(input logic clk, rst, wb_enable_in, rd_enable_in, wr_mem_en, 
							mux_exe_in, mux_mem_in, 
							jop_lsb_in, jenable_in, pc_en_in, input logic[ARQ - 1:0] src1_in, src2_in, srcdest_in, imm_in, 
							input logic[1:0] alu_op_in, input logic[12:0] jaddr_in,
							output logic wb_enable_out, rd_mem_en_out, wr_mem_en_out, mux_exe_out, mux_mem_out, jop_lsb_out, jenable_out, 
							pc_en_out, output logic[ARQ - 1:0] src1_out, src2_out, srcdest_out, imm_out,
							output logic [1:0] alu_op_out, output logic[12:0] jaddr_out);*/


endmodule
