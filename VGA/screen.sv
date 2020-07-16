module screen(input logic [15:0] H_Counter_Value, V_Counter_Value, output logic [7:0] Red, Green, Blue);

logic printlines;

lines	VGA_lines (H_Counter_Value, V_Counter_Value, printlines);

assign {Red, Green, Blue} = (printlines == 1) ? 24'h000000: 24'hffffff;	// FF : Blanco 00: negro

endmodule
