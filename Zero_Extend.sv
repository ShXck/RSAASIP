module Zero_Extend #(parameter ARQ = 16)(input logic [9:0] immediate, output logic[ARQ - 1:0] ext_imm);
	assign ext_imm = {6'b0, immediate};
endmodule
