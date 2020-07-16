module vertical_counter(input clr_25MHz,	input logic enable_V_Counter,	output logic [15:0] V_Counter_value = 0);

always@(posedge clr_25MHz) begin
	if(enable_V_Counter == 1)	// a:2 + b:33 + c:480 + b:10 = 525
		if(V_Counter_value < 525)
			V_Counter_value <= V_Counter_value + 1; // disable vertical counter
		else
			V_Counter_value <= 0; // reset Horizontal counter		
	end
endmodule
