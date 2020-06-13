module Adder_TB();

parameter ARQ = 16;

logic [ARQ - 1:0] num1, num2, result;

Adder uut(num1, num2, result);

initial begin
	#100 num1 = 16'd12; num2 = 16'd10;
end

endmodule

