module Control_Unit #(parameter ARQ = 16)(input logic[2:0] opcode, output logic rd_register_en, wb_enable, rd_mem_en, wr_mem_en, mux_id, mux_exe, mux_mem, jenable,
														output logic[1:0] alu_op);
														
	always @(*) begin
		case(opcode) 
			3'b000: begin    /// SET instruction.
				rd_register_en <= 0;
				wb_enable <= 1;
				rd_mem_en <= 0;
				wr_mem_en <= 0;
				mux_id <= 0;
				mux_exe <= 1;
				mux_mem <= 0;
				jenable <= 0;
				alu_op <= 2'b11;
			end
			
			3'b001: begin    /// LDPX instruction.
				rd_register_en <= 1;
				wb_enable <= 1;
				rd_mem_en <= 1;
				wr_mem_en <= 0;
				mux_id <= 1;
				mux_exe <= 1;
				mux_mem <= 0;
				jenable <= 0;
				alu_op <= 2'b11;
			end
			
			3'b010: begin    /// MODEX instruction.
				rd_register_en <= 1;
				wb_enable <= 1;
				rd_mem_en <= 0;
				wr_mem_en <= 0;
				mux_id <= 1;
				mux_exe <= 0;
				mux_mem <= 0;
				jenable <= 0;
				alu_op <= 2'b10;
			end
			
			3'b011: begin    /// STPX instruction.
				rd_register_en <= 1;
				wb_enable <= 0;
				rd_mem_en <= 0;
				wr_mem_en <= 1;
				mux_id <= 0;
				mux_exe <= 1;
				mux_mem <= 1;
				jenable <= 0;
				alu_op <= 2'b11;
			end
			
			3'b100: begin    /// CMPEQ instruction.
				rd_register_en <= 1;
				wb_enable <= 0;
				rd_mem_en <= 0;
				wr_mem_en <= 0;
				mux_id <= 0;
				mux_exe <= 1;
				mux_mem <= 0;
				jenable <= 0;
				alu_op <= 2'b01;
			end
			
			3'b101, 3'b110: begin    /// JEQ/J instruction.
				rd_register_en <= 0;
				wb_enable <= 0;
				rd_mem_en <= 0;
				wr_mem_en <= 0;
				mux_id <= 1;
				mux_exe <= 1;
				mux_mem <= 0;
				jenable <= 1;
				alu_op <= 2'b11;
			end
			
			3'b111: begin    /// ADD instruction.
				rd_register_en <= 1;
				wb_enable <= 1;
				rd_mem_en <= 0;
				wr_mem_en <= 0;
				mux_id <= 0;
				mux_exe <= 1;
				mux_mem <= 0;
				jenable <= 0;
				alu_op <= 2'b0;
			end
				
			
		endcase
	end


endmodule
