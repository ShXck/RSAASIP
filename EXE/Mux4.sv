module Mux4 #(parameter ARQ = 16)(input logic [ARQ - 1:0] data1,                 
											 input logic [ARQ - 1:0] data2,                 
											 input logic [ARQ - 1:0] data3,                 
											 input logic [ARQ - 1:0] data4,                 
											 input logic [1:0] sel,               
											 output logic [ARQ - 1:0] out);             
											 
   assign out = sel[1] ? (sel[0] ? data4 : data3) : (sel[0] ? data2 : data1); 
 
endmodule
