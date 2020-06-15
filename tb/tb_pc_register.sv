module tb_pc_register();

	logic clk, rst, pc_en;
	logic[5:0] addr_in=6'b0, addr_out;
	
	pc_register dut(clk, rst, pc_en, addr_in, addr_out);
	
	initial 
		begin  
			rst <= 1;
			pc_en <= 1;
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
			pc_en <= 1;
			addr_in  <= addr_in+1;
			# 5
			pc_en <= 0;
		end

endmodule 