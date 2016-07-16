/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create the Jump portion of the processor
	intput: PCbits, instbits
	Output: JumpAdrs
*/

module jump_calc(
	input[3:0] PCbits, 
	input[25:0] instbits,
	output[31:0] JumpAdrs);
	
	assign JumpAdrs = {PCbits, instbits, 2'b00};

endmodule