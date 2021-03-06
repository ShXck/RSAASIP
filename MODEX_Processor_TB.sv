`timescale 1ms / 1ns  

module MODEX_Processor_TB();

	parameter ADDR = 18;
	parameter ARQ = 16;

	logic clk, rst;
	logic[ADDR-1:0] address;
	logic[ARQ-1:0] encrypted, decrypted;
	
	integer file;

	MODEX_Processor uut(clk, rst, address, encrypted, decrypted);
	
	initial begin
		file = $fopen("output.txt", "w");
	end
	
	
	initial begin
		clk = 0; rst = 0; address = 18'd0;
		
		for(int i = 0; i < 102400; i++) begin
			#50 rst = 1;
			#50 rst = 0;
			#100 address = address + 18'd2;
			#50;
			$fwrite(file, "%d\n", decrypted);
		end
		
		$fclose(file);
		$finish;
	end

	always #5 clk = ~clk; 

endmodule
