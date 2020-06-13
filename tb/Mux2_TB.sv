module Mux2_TB();

parameter ARQ = 16;

logic [ARQ - 1:0] in1, in2;
logic sel;
logic [ARQ - 1:0] out;

Mux2 uut(in1, in2, sel, out);

initial begin

#100 in1 = 16'd10; in2 = 16'd15; sel = 1'b0;

end

endmodule
