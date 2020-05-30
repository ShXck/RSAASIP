module ARMV4(input logic clk, reset, 
				 input logic [31:0] Instruction,ReadData,
				 output logic MemWrite, 
				 output logic [31:0] PC, ALUResult, WriteData,
				 output logic [171:0] posicionesConColor);
		logic [3:0] ALUFlags,ALUControl; 
		logic RegWrite, ALUSrc, MemtoReg, PCSrc; 
		logic [1:0] RegSrc, ImmSrc;
		logic [11:0] SPUCode;
		control_unit control_unit_unit(clk, reset, Instruction, ALUFlags, RegSrc, RegWrite, ImmSrc, ALUSrc, ALUControl, MemWrite, MemtoReg, PCSrc,SPUCode); 
		data_path datapath_unit(clk, reset, RegSrc, RegWrite, ImmSrc, ALUSrc, ALUControl, MemtoReg, PCSrc, Instruction, ReadData,SPUCode, ALUFlags, PC, ALUResult, WriteData,posicionesConColor); 
endmodule
