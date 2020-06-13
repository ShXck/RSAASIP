module Zero_Flag #(parameter ARQ = 16)(input logic [ARQ - 1:0] ALU_Result, output logic z);
	
	always_comb 
		begin
			if (ALU_Result == 16'b0)
				z <= 1;
			else
				z <= 0;
		end
	
endmodule
