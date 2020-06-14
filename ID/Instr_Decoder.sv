module Instr_Decoder #(parameter ARQ = 16)(input logic[ARQ - 1:0] instr, output logic[2:0] src1, src2, srcdest, 
																	output logic[12:0] addr, output logic [9:0] imm);
																	
	always @* begin 
		case (instr[15:13])
				3'b010, 3'b100: //MODEX - CMPEQ
					begin
						src1 = instr[9:7];
						src2 = instr[6:4];
						srcdest = instr[12:10];
						addr = 13'b0;
						imm = 10'b0;
					end
				3'b001, 3'b011: //LDPX - STPX
					begin
						src1 = instr[9:7]; 
						src2 = 3'b0;
						srcdest = instr[12:10];
						addr = 13'b0;
						imm = 10'b0;
					end
				3'b101, 3'b110: //JEQ - J
					begin
						src1 = 3'b0;
						src2 = 3'b0;
						srcdest = 3'b0;
						addr = instr[12:0];
						imm = 10'b0;
					end
				3'b0, 3'b111: //SET - ADD
					begin
						src1 = instr[12:10];
						src2 = 3'b0;
						srcdest = instr[12:10];
						addr = 13'b0;
						imm = instr[9:0];
					end
				default:
					begin
						src1 = 3'b111;
						src2 = 3'b111;
						srcdest = 3'b111;
						addr = 13'b111;
						imm = 10'b111;
					end
			endcase
	end


endmodule
