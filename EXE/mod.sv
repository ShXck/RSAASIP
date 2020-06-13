`timescale 1ns / 1ps

module Mod #(parameter ARQ = 16)(
    input [ARQ-1:0] og_number,
    input [ARQ-1:0] mod_numbr,
    output [ARQ-1:0] result,
    output [ARQ-1:0] div_result
    );
	 
   reg [ARQ-1:0] A, N;
   reg [ARQ:0] partial_result;   
   integer i;
  
   always@ (og_number or mod_numbr) begin
       A = og_number;
       N = mod_numbr;
       partial_result = 0;
		 
       for(i=0;i < ARQ;i=i+1) begin 
           partial_result = {partial_result[ARQ-2:0],A[ARQ-1]};
           A[ARQ-1:1] = A[ARQ-2:0];
           partial_result = partial_result-N;
           if(partial_result[ARQ-1] == 1) begin
                A[0] = 1'b0;
                partial_result = partial_result + N;   
           end
           else
                A[0] =1'b1;
      end
         
   end    
   
   assign result = partial_result, div_result = A;
endmodule
