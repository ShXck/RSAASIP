module CntrlUnit_TB();

	logic[2:0] opcode;
	logic rd_register_en, wb_enable, rd_mem_en, wr_mem_en, mux_id, mux_exe, mux_mem, jenable;
	logic[1:0] alu_op;
	
	Control_Unit uut(opcode, rd_register_en, wb_enable, rd_mem_en, wr_mem_en, mux_id, mux_exe, mux_mem, jenable, alu_op);
	
	initial begin
		#100 opcode = 3'b0;
		#100 opcode = 3'b1;
		#100 opcode = 3'b10;
		#100 opcode = 3'b11;
		#100 opcode = 3'b100;
		#100 opcode = 3'b101;
		#100 opcode = 3'b110;
		#100 opcode = 3'b111;
	end


endmodule

