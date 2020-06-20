module IF_TB();

	parameter ARQ = 16;
	parameter MEMORY_ADDR_SIZE = 13;
	
	logic clk, rst, pc_en, mux_sel;
	logic [ARQ-1:0] instr;
	logic [MEMORY_ADDR_SIZE-1:0] branch_addr;

	IF dut(clk, rst, pc_en, mux_sel, branch_addr, instr);

initial begin
	pc_en = 1; clk = 0; rst = 1; mux_sel = 0; //branch_addr=6'b1101;
	
	#10 rst = 1;
	#10 rst = 0;
	#10 rst = 0;
	#10 mux_sel = 1;
	#10 mux_sel = 1;
end

always #5 clk = ~clk;

endmodule
