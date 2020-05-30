module tb_PROCESSOR();
	logic clk, reset;
	logic [31:0] WriteData, DataAdr; 
	logic MemWrite;
	logic [7:0] r,g,b;
	logic hsync, vsync, n_sync, n_blanc, n25MHZCLK;
	// instantiate device to be tested 
	//PROCESSOR dut(clk, reset, WriteData, DataAdr, MemWrite);
	//MAIN_VGA_TEST(clk, reset, hsync, vsync, n_sync, n_blanc, n25MHZCLK,r,g,b,WriteData,DataAdr,MemWrite);
	top dut(clk, reset, WriteData, DataAdr, MemWrite);
	// initialize test
	
	always 
		begin 
			clk <= 1; 
			# 5;
			clk <= 0; 
			# 5;
		end
	initial
		begin
			reset <= 1;
			#10
			reset <= 0;
		end
		



endmodule
