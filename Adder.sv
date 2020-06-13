module Adder #(parameter ARQ = 16)(input logic [ARQ - 1:0] num1, num2, output logic [ARQ - 1: 0] result);
	assign result = num1 + num2;
endmodule
