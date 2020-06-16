module InstrDec_TB();

parameter ARQ = 16;

logic [ARQ - 1:0] instr;
logic[2:0] src1, src2, srcdest; 
logic[12:0] addr;
logic [9:0] imm;
logic jop_lsb;

Instr_Decoder uut(instr, src1, src2, srcdest, addr, imm, jop_lsb);

initial begin
	#50 instr = 16'b0000100000010000; // SET R2, 16
	#50 instr = 16'b0010010100000000; // LDPX R1, [R2]
	#50 instr = 16'b0100000010100000; // MODEX R0, R1, R2
	#50 instr = 16'b0111001110000000; // STPX R4, [R8]
	#50 instr = 16'b1000001011100000; // CMPEQ R5, R6
	#50 instr = 16'b1010000000000100; // JEQ 4
	#50 instr = 16'b1100000000000101; // J 5 
	#50 instr = 16'b1110110000001111; // ADD R3,15
	#50;
end

endmodule
