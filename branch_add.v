/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create a branch adder
	Input: PCplus4, Boff
	Output: BAout
*/

module branch_add (
	input[31:0] PCplus4, Boff,
	output[31:0] BAout);
	
	assign BAout = PCplus4 + Boff;
	
endmodule

