module left_shift_logic #(parameter N)
				(input logic [N-1:0] a,b,
				 output logic [N-1:0] s);
	assign s = a << b;
endmodule