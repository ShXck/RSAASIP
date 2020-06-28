module Instr_Decoder #(parameter ARQ = 16)(input logic[ARQ - 1:0] instr, output logic[2:0] src1, src2, srcdest, opcode,
																	output logic[12:0] addr, output logic [9:0] imm,
																	output logic jop_lsb);
				 													
	always @* begin 
		case (instr[15:13])
				3'b010, 3'b100: //MODEX - CMPEQ
					begin
						src1 = instr[9:7];
						src2 = instr[6:4];
						srcdest = instr[12:10];
						addr = 13'd0;
						imm = 10'd0;
						jop_lsb = 1'd0;
					end
				3'b001, 3'b011: //LDPX - STPX
					begin
						src1 = instr[9:7]; 
						src2 = 3'd0;
						srcdest = instr[12:10];
						addr = 13'd0;
						imm = 10'd0;
						jop_lsb = 1'd0;
					end
				3'b101, 3'b110: //JEQ - J
					begin
						src1 = 3'd0;
						src2 = 3'd0;
						srcdest = 3'd0;
						addr = instr[12:0];
						imm = 10'd0;
						jop_lsb = instr[13];
					end
				3'd0, 3'b111: //SET - ADD
					begin
						src1 = instr[12:10];
						src2 = 3'd0;
						srcdest = instr[12:10];
						addr = 13'd0;
						imm = instr[9:0];
						jop_lsb = 1'd0;
					end
				default:
					begin
						src1 = 3'b111;
						src2 = 3'b111;
						srcdest = 3'b111;
						addr = 13'b111;
						imm = 10'b111;
						jop_lsb = 1'd0;
					end
			endcase
	end
	
	assign opcode = instr[15:13];


endmodule
