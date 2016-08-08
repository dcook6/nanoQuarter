/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create Data Memory
	Input: clk, MemRead, MemWrite, ALUout, reg2data
	Output: memout
*/

module Data_Memory(
	input clk, MemRead, MemWrite,
	input [15:0] ALUout, reg2data,
	output reg [15:0] memout);
	
	reg [15:0] memory[199:0];
	
	initial begin
		memory[4] = 16'b1100110011001100;
		memory[6] = 16'b0000000000000011;
	end
	
	always @ (ALUout, MemRead)
		begin
			if (MemRead == 1) memout = memory[ALUout];
		end
		
	always @ (posedge clk)
		begin	
			if (MemWrite == 1) memory[ALUout] <= reg2data;
		end
endmodule
