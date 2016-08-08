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
	input[2:0] PCbits, 
	input[7:0] instbits,
	output[15:0] JumpAdrs);
	
	assign JumpAdrs = {PCbits, instbits, 2'b00};

endmodule
