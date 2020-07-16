module lines(input logic [15:0] H_Counter_Value, V_Counter_Value, output logic printlines);


	assign printlines = (((H_Counter_Value > 10'd340) && (H_Counter_Value < 10'd345)) 
							||  
							((H_Counter_Value > 10'd580) && (H_Counter_Value < 10'd585))) 
							||
						 (((V_Counter_Value > 10'd172) && (V_Counter_Value < 10'd177))
							||
							((V_Counter_Value > 10'd343) && (V_Counter_Value < 10'd348)));
endmodule
