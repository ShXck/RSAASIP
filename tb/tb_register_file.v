module tb_register_file();
	reg clk, rst, writeEn, readEn;
	reg [3:0] src1, src2, dest;
	reg [15:0] writeVal; 
	wire [15:0] reg1, reg2;	
	
	regFile dut(clk, rst, src1, src2, dest, writeVal, writeEn, readEn, reg1, reg2);

							
	initial 
		begin  
			writeEn <= 0;
			readEn <= 0;
			rst <= 1;
		end
	always 
		begin 
			clk <= 1; 
			# 5; 
			clk <= 0; 
			# 5;
		end
	always 
		begin  
			# 10; 
			rst <= 0;
			writeEn                 <= 1;
			readEn                  <= 1;
			src1							<= 0;
			src2							<= 0;
			dest							<= 4'b0000;
			writeVal						<= 16'b11100111;
			
			# 10; 
			writeEn                 <= 0;
			readEn                  <= 1;
			src1							<= 0;
			src2							<= 1;
			dest							<= 4'b0000;
		end

endmodule
