`include "defines.sv"

module PR1_IF_ID(clk, rst, write_en, flush, PR0_PC_plus1, PR0_instruction, PR1_PC_plus1, PR1_instruction);
	input clk, rst, write_en, flush;
	input [`INSTRUCTION_LEN - 1:0] PR0_instruction;
	input [`ADDRESS_LEN - 1:0] PR0_PC_plus1;

	output logic [`INSTRUCTION_LEN - 1:0] PR1_instruction;
	output logic [`ADDRESS_LEN - 1:0] PR1_PC_plus1;

	always@(posedge clk, posedge rst) begin
		if(rst || flush) begin
			PR1_PC_plus1 <= 0;
			PR1_instruction <= 0;
		end
		else begin
			if (write_en) begin
				PR1_PC_plus1 <= PR0_PC_plus1;
				PR1_instruction <= PR0_instruction;
			end
		end
	end
endmodule // PR_1_IF_ID