//`timescale 1ns/100fs 
timeunit 1ns;
module testbench_top();

logic clk;
logic reset;
logic Hsynq;
logic Vsynq;
logic blank;
logic [3:0] Red;
logic [3:0] Green;
logic [3:0] Blue;
integer f,i;

top DUT(clk, Hsynq, Vsynq, blank, Red, Green, Blue);
always #10 clk= ~clk;

  //Clock and reset release
  initial begin
    clk=0; reset=1; //Clock low at time zero
    @(posedge clk);
    @(posedge clk);
    reset=0;
  end


initial begin
	$timeformat(-9, 0, " ns", 20);
    f = $fopen("imagen.txt","w");
    @(negedge reset); //Wait for reset to be released
    @(posedge clk);   //Wait for fisrt clock out of reset
	
	for (i = 0; i<1000000; i=i+1) begin
		@(posedge clk);
		$fwrite(f,"%0t: %b %b %b %b %b\n",$time, Hsynq, Vsynq, Red, Green, Blue);
	end
	 
	$fclose(f);  
	$finish;
end
		
endmodule


