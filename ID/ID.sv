 module ID #(parameter ARQ = 16)(input logic[ARQ - 1:0] instr, wb_result, input logic clk, rst, wr_register,
											output logic[ARQ - 1:0] out1, out2, out3, imm, output logic[12:0] addr, 
											output logic jop_lsb, rd_mem_en, wr_mem_en, mux_exe, mux_mem, jenable, wb_enable, 
											output logic[1:0] alu_op);
	logic [2:0] bank_in1, bank_in2, bank_in3, opcode;
	logic [12:0] jaddr;
	logic [9:0] imm_in;
	logic [ARQ - 1:0] wr_data, imm_out;
	logic rd_reg_enable, mux_id;
	
	Instr_Decoder decoder(instr, bank_in1, bank_in2, bank_in3, opcode, jaddr, imm_in, jop_lsb);
	
	Control_Unit control_unit(opcode, rd_reg_enable, wb_enable, rd_mem_en, wr_mem_en, mux_id, mux_exe, mux_mem, jenable, alu_op);
	
	Zero_Extend zero_extend(imm_in, imm_out);
	
	Mux2 wr_mux(imm_out, wb_result, mux_id, wr_data);
	
	Register_Bank reg_bank(clk, rst, wr_register, rd_reg_enable, bank_in1, bank_in2, bank_in3, wr_data, out1, out2, out3);
	
	assign imm = imm_out;
	assign addr = jaddr;
 
 endmodule
 