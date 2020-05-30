module  control_unit(input logic clk, reset, 
							input logic [31:0] Instr, 
							input logic [3:0] ALUFlags, 
							output logic [1:0] RegSrc, 
							output logic RegWrite, 
							output logic [1:0] immSrc, 
							output logic ALUSrc, 
							output logic [3:0] ALUControl, 
							output logic MemWrite, MemtoReg,
							output logic PCSrc,
							output logic [11:0] SPUCode); 
		logic [1:0] FlagW; 
		logic PCS, RegW, MemW,NoWrite,RegWSPU;
		//								Op					funct				Rd     COlor / Shape
		decoder decoder_unit(Instr[27:26], Instr[25:20], Instr[15:12],Instr[11:4], FlagW, PCS, RegW, MemW,RegWSPU,NoWrite, MemtoReg, ALUSrc, immSrc, RegSrc, ALUControl,SPUCode); 
		conditional_logic conditional_logic_unit(clk, reset,NoWrite, Instr[31:28], ALUFlags,PCS,RegW,MemW,RegWSPU,FlagW,PCSrc,RegWrite,MemWrite); 
endmodule