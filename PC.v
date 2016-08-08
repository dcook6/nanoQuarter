/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create the PC portion of the Processor
	intput: newPC, clk, reset
	Output: PC
*/

module PC(
	input clk, reset,
	input[15:0] newPC,
	output reg[15:0] PC);
	
	always @ (posedge clk or posedge reset)
		begin
			if (reset == 1)
				PC <= 0;
			else 
				PC <= newPC;
		end
endmodule
