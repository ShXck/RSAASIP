module synq(input logic [15:0] H_Counter_Value, V_Counter_Value,	output logic Hsynq, Vsynq, blank);
// 3.8us * 25MHz = 65		3.8+1.9*25 = 142.5       	3.8+1.9+25.4 * 25 = 777.5
	assign Hsynq = (H_Counter_Value < 96) ? 1'b0 : 1'b1;
	
	assign Vsynq = (V_Counter_Value < 2) ? 1'b0 : 1'b1;
	
	
	assign blank = ((H_Counter_Value > 143) && (H_Counter_Value < 778) && (V_Counter_Value > 35) && (V_Counter_Value < 515)) ? 1'b1 : 1'b0;
	

endmodule
