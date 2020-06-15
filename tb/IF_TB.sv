module IF_TB();

	parameter ARQ = 16;
	parameter MEMORY_ADDR_SIZE = 6;
	
	logic clk, rst, pc_en;
	logic[MEMORY_ADDR_SIZE-1:0] addr_in=6'b0, addr_out;
	logic [ARQ-1:0] instr;

	IF dut(clk, rst, pc_en, addr_in, addr_out, instr);

initial begin
	pc_en = 0; clk = 0; rst = 1;
	
	#50 rst = 1;
	#50 rst = 0; pc_en = 1; addr_in<=addr_in+1;
	#50 addr_in<=addr_in+1;
	#50 addr_in<=addr_in+1;
	#50 rst = 1;
	#50 addr_in<=addr_in+1;
	#50 addr_in<=addr_in+1;
end

always #5 clk = ~clk;

endmodule
