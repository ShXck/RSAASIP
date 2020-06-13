module Mux4_TB();

parameter ARQ = 16;

logic [ARQ - 1:0] d1, d2, d3, d4, out;
logic [1:0] sel;

Mux4 uut(d1, d2, d3, d4, sel, out);

initial begin
	#0 d1 = 16'd5; d2 = 16'd10; d3 = 16'd9; d4 = 16'd20;
	#100 sel = 2'b0;	
	#100 sel = 2'b1;	
	#100 sel = 2'b10;
	#100 sel = 2'b11;	
end

endmodule
