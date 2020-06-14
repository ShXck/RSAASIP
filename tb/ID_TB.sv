module ID_TB();

parameter ARQ = 16;

logic[ARQ - 1:0] instr, wb_result;
logic rd_enable, wb_enable, clk, rst, cntrl_mux;
logic[ARQ - 1:0] out1, out2, out3;
logic[9:0] imm;

ID uut(instr, wb_result, rd_enable, wb_enable, clk, rst, cntrl_mux, out1, out2, out3, imm);

initial begin
	rd_enable = 0; wb_enable = 0; clk = 0; rst = 1; cntrl_mux = 0;
	
	#50 rst = 1;
	#50 rst = 0; wb_enable = 1; instr = 16'b0000100000010000; wb_result = 0;  // SET R2, 16
	#50 rst = 0; wb_enable = 1; instr = 16'b0000010000010001; wb_result = 0;  // SET R1, 17
	#50 rst = 0; wb_enable = 1; instr = 16'b0000000000010011; wb_result = 0;  // SET R0, 19
	#50 rd_enable = 1; wb_enable = 0; cntrl_mux = 1; instr = 16'b0100000010100000; // MODEX R0, R1, R2
	#50 rd_enable = 1; wb_enable = 1; cntrl_mux = 1; instr = 16'b0010010100000000; wb_result = 16'd150; // LDPX R1, [R2]
	#50;

end

always #5 clk = ~clk;

endmodule
