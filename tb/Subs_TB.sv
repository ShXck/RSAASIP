module Subs_TB();

parameter ARQ = 16;

logic [ARQ - 1:0] num1, num2, result;
logic cout;

Substraction uut(num1, num2, result, cout);

initial begin
	
	#50 num1 = 16'd15; num2 = 16'd5;

end

endmodule
