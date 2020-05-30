module data_memory(input logic clk, WE,
						 input logic [31:0] A,WD,
						 output logic [31:0] RD);
	//logic [5:0] memory [0:307839];
	logic [31:0] memory [0:31];
	initial 
		$readmemb("RAM2.mem",memory);
	
	always_ff@(posedge clk)
		if(WE)
			memory[A[31:2]] <= WD;
	assign RD = memory[A[31:2]];
			
			
endmodule
