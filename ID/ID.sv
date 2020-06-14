 module ID #(parameter ARQ = 16)(input logic[ARQ - 1:0] instr, wb_result, input logic rd_enable, wb_enable, clk, rst, cntrl_mux,
											output logic[ARQ - 1:0] out1, out2, out3, imm, output logic[12:0] addr);
	 
	logic [2:0] bank_in1, bank_in2, bank_in3;
	logic [12:0] jaddr;
	logic [9:0] imm_in;
	logic [ARQ - 1:0] wr_data, imm_out;
	
	Instr_Decoder decoder(instr, bank_in1, bank_in2, bank_in3, jaddr, imm_in);
	
	Zero_Extend zero_extend(imm_in, imm_out);
	
	Mux2 wr_mux(imm_out, wb_result, cntrl_mux, wr_data);
	
	Register_Bank reg_bank(clk, rst, wb_enable, rd_enable, bank_in1, bank_in2, bank_in3, wr_data, out1, out2, out3);
	
	assign imm = imm_out;
	assign addr = jaddr;
 
 endmodule
 