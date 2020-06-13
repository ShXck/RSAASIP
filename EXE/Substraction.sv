module Substraction #(parameter ARQ = 16)(input logic [ARQ-1:0] num1, num2, output logic [ARQ-1:0] result, output logic cout);

	assign {cout, result} = num1 - num2; 

endmodule