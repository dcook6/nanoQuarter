/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create the PC adder portion of the processor
	intput: PC
	Output: PCplus4
*/

module PC_adder(
	input [15:0] PC,
	output [15:0] PCplus2);
	
	assign PCplus2 = PC + 2;
	
endmodule
