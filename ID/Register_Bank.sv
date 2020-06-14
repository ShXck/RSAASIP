module Register_Bank #(parameter ARQ = 16)(input logic clk, rst, writeEn, readEn,
												  input logic[2:0] src1, src2, srcdest, 
												  input logic[ARQ -1: 0] wr_data, 
												  output logic[ARQ - 1:0] src1_out, src2_out, src3_out);
												  
	reg [ARQ - 1:0] regMem [0:7]; //Tamaño del registo || Cantidad de registros
	integer i;

	always @ (negedge clk) begin
		if (rst) begin
		for (i = 0; i < 7; i = i + 1)
		  regMem[i] <= 0;
		 end

		else if (writeEn) regMem[srcdest] <= wr_data;	 
	end
  
	always @ (posedge clk) begin
	  if (readEn) begin
			src1_out <= (regMem[src1]);
			src2_out <= (regMem[src2]);
			src3_out <= (regMem[srcdest]);
		end  
	end
												  
												  
endmodule
