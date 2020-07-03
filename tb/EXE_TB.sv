`timescale 1ns / 1ps

module EXE_TB();

parameter ARQ = 16;

logic clk, rst, mux_exe, jenable; 
logic[1:0] alu_op; 
logic[ARQ - 1:0] src1, src2, srcdest, imm, alu_result;
logic branch_taken, jop_lsb;
logic[12:0] jaddr_out, jaddr; 

EXE uut(clk, rst, mux_exe, jop_lsb, jenable, alu_op, src1, src2, srcdest, imm, jaddr, alu_result, branch_taken, jaddr_out);

initial begin

	clk = 0; rst = 1; mux_exe = 0; jop_lsb = 0; jaddr = 13'd1500; jenable = 0;
	#50 rst = 0; mux_exe = 1; alu_op = 2'b00; src1 = 16'd250; src2 = 16'b0; srcdest = 16'd300; imm = 16'd400; jop_lsb = 1;
	#50 mux_exe = 1; alu_op = 2'b01; src1 = 16'd250; src2 = 16'd250; srcdest = 16'd50; imm = 16'd25; jop_lsb = 1;
	#50 mux_exe = 1; alu_op = 2'b01; src1 = 16'd250; src2 = 16'd251; srcdest = 16'd50; imm = 16'd25; jop_lsb = 1;
	#50 mux_exe = 1; alu_op = 2'b01; src1 = 16'd250; src2 = 16'd251; srcdest = 16'd50; imm = 16'd25; jop_lsb = 0;
	#50 mux_exe = 0; alu_op = 2'b10; src1 = 16'd16; src2 = 16'd100; srcdest = 16'd140; imm = 16'd152; rst = 1;
	#50 rst = 0;

end

always #5 clk = ~clk;

endmodule
