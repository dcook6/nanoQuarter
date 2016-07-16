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
	input [31:0] ALUout, reg2data,
	output reg [31:0] memout);
	
	reg [31:0] memory[199:0];
	
	initial begin
		memory[8] = 32'b11110000111100001111000011110000;
		memory[10] = 32'b0000000000000000000000000000101;
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