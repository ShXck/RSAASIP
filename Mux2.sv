module Mux2 #(parameter ARQ = 16)(input logic [ARQ - 1:0] data1, data2, input logic sel, output logic [ARQ - 1:0] out);
	assign out = sel ? data2 : data1;
endmodule
