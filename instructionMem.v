module instruction_memory(input [5:0] addr,
								  output [15:0] instruction);
								  
	parameter INSTRUCTION_SIZE = 16;
	parameter MEMORY_SIZE = 64;

	reg [INSTRUCTION_SIZE-1:0] memory [0:MEMORY_SIZE-1]; //Tamaño de la instrucción || Tamaño de la memoria
	initial 
		begin
			$readmemb("memfile.dat", memory);
		end

	assign instruction = memory[addr];
endmodule
