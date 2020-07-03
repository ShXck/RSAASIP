module dataMem (clk, rst, writeEn, readEn, address, dataIn, dataOut);

	parameter MEMORY_SIZE = 1024;
	parameter MEMORY_ADDR_SIZE = 10;
	parameter MEMORY_DATA_SIZE = 16;

	input logic clk, rst, readEn, writeEn;
	input logic [MEMORY_ADDR_SIZE-1:0] address;
	input logic [MEMORY_DATA_SIZE-1:0] dataIn;
	output logic [MEMORY_DATA_SIZE-1:0] dataOut;


	integer i;
	reg [MEMORY_DATA_SIZE-1:0] memory [0:MEMORY_SIZE-1];
	
	always @ (negedge clk) begin
		if (rst) begin
			$readmemb("pixels.dat", memory);
		end

		else if (writeEn) memory[address] <= dataIn;	 
	end
  
	always @ (posedge clk) begin
	  if (readEn) begin
			dataOut <= (memory[address]);
		end  
	end

endmodule 
 