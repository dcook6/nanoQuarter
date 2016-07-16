/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create shifter to shift left two
	Input: signex
	Output: Boff
*/

module shift_left_two (
	input[31:0] signex,
	output[31:0] Boff);
	
	assign Boff = signex << 2;
	
endmodule