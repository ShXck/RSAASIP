module tb_instruction_mem();

	reg [5:0] addr = 0;
	wire [15:0] instruction;
	instruction_memory dut(addr, instruction);
	initial begin  
		addr <= 6'b0000;
	end
	always 
	begin 
		# 5; 
		addr <= addr + 1;
	end
endmodule
