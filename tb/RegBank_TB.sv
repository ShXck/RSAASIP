module RegBank_TB();

	parameter ARQ = 16;

	logic clk, rst, writeEn, readEn;
	logic [2:0] src1, src2, srcdest;
	logic [ARQ - 1:0] writeVal; 
	logic [ARQ - 1:0] out1, out2, out3;	
	
	Register_Bank dut(clk, rst, writeEn, readEn, src1, src2, srcdest, writeVal, out1, out2, out3);

	initial begin
		clk = 0; rst = 1; writeEn = 0; readEn = 0;
		#50 rst = 0;
		// write test
		#50
		writeEn = 1;
		srcdest = 3'b1;
		writeVal = 16'd150;
		src1 = 0;
		src2= 0;
		
		#10 writeEn = 0;
		
		#50
		writeEn = 1;
		srcdest = 3'b0;
		writeVal = 16'd144;
		
		#10 writeEn = 0;
		
		#50
		writeEn = 1;
		srcdest = 3'd2;
		writeVal = 16'd145;
		
		// read test
		#50 writeEn = 0; readEn = 1;  writeVal = 0;
		#10 src1 = 3'b0; src2 = 2'b1; srcdest = 3'd2; 
		
	end
	
	always #5 clk = ~clk;


endmodule
