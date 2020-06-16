module Branch_Unit #(parameter ARQ = 16)(input logic[12:0] jaddress, input logic op_lsb, z,
														output logic branch_taken, output logic[12:0] jaddress_out);

	always_comb 
		begin
			if ((op_lsb == 1 & z) | op_lsb == 0) // jump if equal or jump
				branch_taken <= 1;
			else
				branch_taken <= 0;
		end
	
	assign jaddress_out = jaddress;
	
endmodule
