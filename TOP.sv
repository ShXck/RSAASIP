 module TOP #(parameter ARQ = 16)(input logic clk, rst, rst_ALU, branch_taken,   
											input logic[12:0] jaddr_out,
											output logic [ARQ-1:0] instr_out);
 
	parameter MEMORY_ADDR_SIZE = 13;

	//IF 
	logic pc_en=1, stop=0; 
	logic [ARQ-1:0] instr;
	
	//ID
	/*logic wr_reg_data; 
	//logic[ARQ - 1:0] src1_in, src2_in, src3_in, imm;
	logic[MEMORY_ADDR_SIZE-1:0] addr;
	logic jop_lsb, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable;
	logic[1:0] alu_op;
	
	logic wb_enable_out, rd_mem_en_out, wr_mem_en_out, mux_exe_out, mux_mem_out, jop_lsb_out, jenable_out, pc_en_out;
	logic[ARQ - 1:0] src1_out, src2_out, src3_out, imm_out;
	logic[1:0] alu_op_out;
	logic[MEMORY_ADDR_SIZE-1:0] addr_out;*/
	
	//EXE
	/*logic[ARQ - 1:0] alu_result;
	logic branch_taken=0;
	logic[MEMORY_ADDR_SIZE-1:0] jaddr_out;
	logic wb_en_exe_out;*/
	//logic wb_en_exe_out, rd_mem_en_exe_out, wr_mem_en_exe_out, pc_en_exe_out;
	//logic [ARQ-1] sr1_exe_out, srdest_exe_out, alu_result_out;
	
	//logic[ARQ - 1:0] wb_result_in;
	
	//logic[MEMORY_ADDR_SIZE-1:0] jaddr = 13'd1112;
	

	IF fetch(clk, rst, pc_en, branch_taken, jaddr_out,  instr);
	IFID_Pipe ifid_pipe(clk, rst, stop, instr, instr_out);
	
	/*ID deco(instr_out, wb_result_in, clk, rst, wb_enable, src1_in, src2_in, src3_in, imm, addr, jop_lsb, rd_mem_en, 
				wr_mem_en, mux_exe, mux_mem, jenable, pc_en_out, wb_en_exe_out, alu_op);*/	

				
	/*IDEXE_Pipe idexe_pipe(clk, rst, wb_en_exe_out, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jop_lsb, jenable, pc_en, src1_in, src2_in, 
								src3_in, imm, alu_op, addr, wb_enable_out, rd_mem_en_out, wr_mem_en_out, mux_exe_out, 
								mux_mem_out, 
								jop_lsb_out, jenable_out, pc_en_out, src1_out, src2_out, src3_out, imm_out, alu_op_out, 
								addr_out);
								
	EXE execution(clk, rst_ALU, mux_exe, jop_lsb_out, jenable_out, alu_op_out, src1_out, src2_out, src3_out, imm_out, 
					addr_out, alu_result, branch_taken, jaddr_out);
 
	EXEMEM_Pipe exemem_pipe(clk, rst, wb_enable_out, rd_mem_en_out, wr_mem_en_out, pc_en_out,
									src1_out, src3_out, alu_result, wb_enable, rd_mem_en_exe_out, wr_mem_en_exe_out, 
									pc_en_wb, sr1_exe_out, srdest_exe_out, alu_result_out);
									
	WB writeback(alu_result_out, 16'd50, rd_mem_en_exe_out, wb_result_in);
	
	assign wb_result_test = wb_result_in;*/

 endmodule
 