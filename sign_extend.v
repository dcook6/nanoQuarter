/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create the sign extender
	Input: ui, inst
	Output: signex
*/

module sign_extend(
	input ui, 
	input[15:0] inst, 
	output reg [16:0] signex);
	
	always @ (ui, inst)
		begin
			if (ui == 1) signex = {16'b0000000000000000, inst};
			else begin
				if (inst[15] == 1) signex = {16'b1111111111111111, inst};
				if (inst[15] == 0) signex = {16'b0000000000000000, inst};
			end
		end
endmodule
