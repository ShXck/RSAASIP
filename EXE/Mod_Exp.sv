`timescale 1ns / 1ps
`define UPDATE 2'd1
`define HOLD 2'd2

/* to calculate *** a^b mod n *** we use right to left binary exponentiation (by .BRUCE SCHIENER)
*/
module Mod_Exp #(parameter ARQ = 16)(
    input [ARQ*2-1:0] base,
	 input [ARQ*2-1:0] modulo,
	 input [ARQ*2-1:0] exponent,
	 input clk,
	 input reset,
	 output finish,
    output [ARQ*2-1:0] result
    );
        
    logic [ARQ*2-1:0] base_logic, modulo_logic, exponent_logic, result_logic;
    logic [1:0] state;
    
    wire [ARQ*2-1:0] result_mul_base = result_logic * base_logic;
    wire [ARQ*2-1:0] result_next;
    wire [ARQ*2-1:0] base_squared = base_logic * base_logic;
    wire [ARQ*2-1:0] base_next;
    wire [ARQ*2-1:0] exponent_next = exponent_logic >> 1;
    
    assign finish = (state == `HOLD) ? 1'b1:1'b0;
    assign result = result_logic;
    
    Mod base_squared_mod(base_squared, modulo_logic, base_next);                
    defparam base_squared_mod.ARQ = ARQ*2;                                    
                                                                                     
    Mod result_mul_base_mod (result_mul_base, modulo_logic, result_next);          
    defparam result_mul_base_mod.ARQ = ARQ*2;                                   
    
   
    always @(posedge clk) begin
        if(reset) begin                                                         
            base_logic <= base;
            modulo_logic <= modulo;
            exponent_logic <= exponent;                
            result_logic <= 32'd1;
            state <= `UPDATE;
        end
        else case(state)
            `UPDATE: begin
                if (exponent_logic != 64'd0) begin
                    if (exponent_logic[0])
                        result_logic <= result_next;
                    base_logic <= base_next;
                    exponent_logic <= exponent_next;
                    state <= `UPDATE;
                end
                else state <= `HOLD;
            end
            
           `HOLD: begin
                end
       endcase
    end
endmodule