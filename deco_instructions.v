module deco_instructions (instruction, type, src1, src2, dest, addr, imm);

	parameter INSTRUCTION_SIZE = 16;
	parameter TYPES = 2;
	parameter REG_ADDR = 3;
	parameter OPCODE_SIZE = 3;
	
	input [INSTRUCTION_SIZE-1:0] instruction;
	output reg [TYPES-1:0] type;
	output reg [REG_ADDR-1:0] src1, src2, dest;
	output reg [INSTRUCTION_SIZE-4:0] addr;
	output reg [INSTRUCTION_SIZE-6:0] imm;

	always @* begin 
	case (instruction[15:13])
			3'b010, 3'b100: //MODEX - CMPEQ
				begin
					type = 2'b00;
					src1 = instruction[9:7];
					src2 = instruction[6:4];
					dest = instruction[12:10];
					addr = 13'b000;
					imm = 10'b000;
				end
			3'b001, 3'b011: //LDPX - STPX
				begin
					type = 2'b01;
					src1 = instruction[12:10];
					src2 = instruction[9:7];
					dest = 3'b000;
					addr = 13'b000;
					imm = 10'b000;
				end
			3'b101, 3'b110: //JEQ - J
				begin
					type = 2'b10;
					src1 = 3'b000;
					src2 = 3'b000;
					dest = 3'b000;
					addr = instruction[12:0];
					imm = 10'b000;
				end
			3'b000, 3'b111: //SET - ADD
				begin
					type = 2'b11;
					src1 = instruction[12:10];
					src2 = 3'b000;
					dest = 3'b000;
					addr = 13'b000;
					imm = instruction[9:0];
				end
			default:
				begin
					$display("IT IS NOT");
					type = 2'b11;
					src1 = 3'b111;
					src2 = 3'b111;
					dest = 3'b111;
					addr = 13'b111;
					imm = 10'b111;
				end
		endcase
	end

endmodule
