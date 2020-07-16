module MODEX_Memory #(parameter ARQ = 16)(address, data_out);

	parameter ADDR = 18;
	
	input logic[ADDR-1:0] address; 
	output logic[ARQ-1:0] data_out;
	
	parameter MEMORY_SIZE = 262144;

	reg [ARQ-1:0] memory [0:MEMORY_SIZE-1]; //Tamaño de la instrucción || Tamaño de la memoria
	initial 
		begin
			$readmemb("pixels_img.dat", memory);
		end

	assign data_out = memory[address];



endmodule
