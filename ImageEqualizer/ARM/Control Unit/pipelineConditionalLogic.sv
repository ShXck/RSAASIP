module pipelineConditionalLogic(input logic clk, reset,NoWrite,
										  input logic [3:0] CondE, ALUFlags, flagsE,
										  input logic PCSrcE_IN,RegWriteE_IN,MemWriteE_IN,RegWSPU,BranchE,
										  input logic [1:0] FlagWriteE,
										  output logic PCSrcE_OUT,RegWriteE_OUT,MemWriteE_OUT,BranchTakenE,
										  output logic [3:0] flags);
	logic CondEx;
	logic [1:0] FlagWrite;
	//first we start by saving the ALUFlags result in 2 registers
	REG_EN reg_1(clk,reset,FlagWrite[0],ALUFlags[1:0],flags[1:0]);
	REG_EN reg_2(clk,reset,FlagWrite[1],ALUFlags[3:2],flags[3:2]);
	//after that we add the check the conditions
	conditions conditions_unit(CondE, flags,CondEx);
	//FlagWrite[0] will only be 1 if selected flag is 1 and condition enable is on
	//FlagWrite[0] will only be 1 if selected flag is 1 and condition enable is on and we are doing a ADD, SUB o CMP.
	assign FlagWrite = FlagWriteE & {2{CondEx}}; 
	//RegWrite will only be 1 if we want to write to a register and if selected flag is 1 
	assign RegWriteE_OUT = (RegWriteE_IN & CondEx & ~NoWrite)|RegWSPU; 
	//MemWrite will only be 1 if we want to write to memory(ram) and if selected flag is 1
	assign MemWriteE_OUT = MemWriteE_IN & CondEx; 
	//PCSrc will only be onw if we want to load an address in to the PC
	assign PCSrcE_OUT = PCSrcE_IN & CondEx; 
	
	assign BranchTakenE = BranchE & CondEx; 
endmodule
