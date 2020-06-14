`include "defines.v"

module regFile (clk, rst, src1, src2, dest, writeVal, writeEn, readEn, reg1, reg2);

	parameter REG_ADDR = 3;
	parameter REG_SIZE = 16;
	parameter REG_AMOUNT = 8;
	
	input clk, rst, writeEn, readEn;
	input [REG_ADDR-1:0] src1, src2, dest;
	input [REG_SIZE-1:0] writeVal;
	output reg [REG_SIZE-1:0] reg1, reg2;

	reg [REG_SIZE:0] regMem [0:REG_AMOUNT-1]; //Tamaño del registo || Cantidad de registros
	integer i;

	always @ (negedge clk) begin
		if (rst) begin
		for (i = 0; i < 7; i = i + 1)
		  regMem[i] <= 0;
		 end

		else if (writeEn) regMem[dest] <= writeVal;	 
	end
  
	always @ (posedge clk) begin
	  if (readEn) begin
			reg1 <= (regMem[src1]);
			reg2 <= (regMem[src2]);
		end  
	end

endmodule
