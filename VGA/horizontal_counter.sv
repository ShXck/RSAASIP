module horizontal_counter(input logic clr_25MHz, output logic enable_V_Counter = 0, output logic [15:0] H_Counter_value = 0);

always@(posedge clr_25MHz) 
	begin	// a:95 + b:47.5 + c:635 + b:15 = 792.5
		if(H_Counter_value < 793) begin
			H_Counter_value <= H_Counter_value + 1; // counting
			enable_V_Counter <= 0; // disable vertical counter	
		end
		else begin
			H_Counter_value <= 0; // reset Horizontal counter
			enable_V_Counter <= 1; // trigger V counter		
		end
	end
endmodule
