module tb_deco_instructions();
	parameter INSTRUCTION_SIZE = 16;
	parameter TYPES = 2;
	parameter REG_ADDR = 3;
	
	reg [INSTRUCTION_SIZE-1:0] instruction;
	wire [TYPES-1:0] type;
	wire [REG_ADDR-1:0] src1, src2, dest;
	wire [INSTRUCTION_SIZE-4:0] addr;
	wire [INSTRUCTION_SIZE-7:0] imm;
	
	deco_instructions dut(instruction, type, src1, src2, dest, addr, imm);

	initial 
		begin  
			instruction <= 16'b0100111011101110; //Tipo R
			#1
			$display("Instruction: %b", instruction);
			$display("Type: %b", type);
			$display("Source 1: %b", src1);
			$display("Source 2: %b", src2);
			$display("Destine: %b", dest);
			$display("Address: %b", addr);
			$display("Immediate: %b\n", imm);
			
			instruction <= 16'b0010111011101110; //Tipo M
			#1
			$display("Instruction: %b", instruction);
			$display("Type: %b", type);
			$display("Source 1: %b", src1);
			$display("Source 2: %b", src2);
			$display("Destine: %b", dest);
			$display("Address: %b", addr);
			$display("Immediate: %b\n", imm);
			
			instruction <= 16'b1100111011101110; //Tipo J
			#1
			$display("Instruction: %b", instruction);
			$display("Type: %b", type);
			$display("Source 1: %b", src1);
			$display("Source 2: %b", src2);
			$display("Destine: %b", dest);
			$display("Address: %b", addr);
			$display("Immediate: %b\n", imm);
			
			instruction <= 16'b1110111011101110;
			#1
			$display("Instruction: %b", instruction); //Tipo I
			$display("Type: %b", type);
			$display("Source 1: %b", src1);
			$display("Source 2: %b", src2);
			$display("Destine: %b", dest);
			$display("Address: %b", addr);
			$display("Immediate: %b\n", imm);
		end

endmodule
