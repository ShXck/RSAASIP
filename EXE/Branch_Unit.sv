module Branch_Unit #(parameter ARQ = 16)(input logic[12:0] jaddress, input logic[2:0] opcode, input logic z,
														output logic branch_taken, output logic[ARQ - 1:0] jaddress_out);

	always_comb 
		begin
			if ((opcode == 3'b101 & z) | opcode == 3'b110) // jump if equal or jump
				branch_taken <= 1;
			else
				branch_taken <= 0;
		end
	
	assign jaddress_out = jaddress;
	
endmodule
