/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create the Branch Logic
	Input: Branch, bne, zero
	Output: Branchsel
*/

module Branch_logic(
	input Branch, bne, zero,
	output Branchsel);
	
	assign Branchsel = (Branch & zero) | (bne & ~zero);
	
endmodule