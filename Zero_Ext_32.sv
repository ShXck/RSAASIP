module Zero_Ext_32 #(parameter ARQ = 16)(in, out);
	
	input logic[ARQ-1:0] in;
	output logic[2*ARQ-1:0] out;
	
	assign out = {16'b0, in};
endmodule
