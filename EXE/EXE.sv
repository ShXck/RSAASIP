module EXE #(parameter ARQ = 16)(input logic clk, rst, mux_exe, jop_lsb, jenable, input logic[1:0] alu_op, 
											input logic[ARQ - 1:0] src1, src2, srcdest, imm,
											input logic[12:0] jaddr, 
											output logic[ARQ - 1:0] alu_result,
											output logic branch_taken, output logic[12:0] jaddr_out);
	logic zero;
	logic[ARQ - 1: 0] data_mux;
	
	Mux2 in_mux(srcdest, imm, mux_exe, data_mux);
											
	ALU alu(src1, src2, data_mux, alu_op, clk, rst, alu_result, zero);
	
	Branch_Unit branch(jaddr, jop_lsb, zero, jenable, branch_taken, jaddr_out);
	
endmodule
