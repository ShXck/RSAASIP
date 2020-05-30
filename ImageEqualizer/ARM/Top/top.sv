module top(input  logic clk, reset,
			  output logic [31:0] WriteData,
			  output logic [31:0] DataAdr,
			  output logic MemWrite);

    logic [31:0] PC = 0, Instr, ReadData;
	 logic [171:0] posicionesConColor;
	 instruction_memory instruction_memory_Unit(PC, Instr);
    pipelineARM  pipelineARM_Unit(clk, reset,Instr,ReadData,PC,MemWrite,DataAdr, WriteData, posicionesConColor);
    data_memory data_memory_Unit(clk, MemWrite, DataAdr, WriteData, ReadData);
endmodule
