/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create the registers
	Input: RegWrite, clk, reg1ad, reg2ad, writead, data_in
	Output: reg1data, reg2data
*/

module registers(
	input RegWrite, clk, 
	input[4:0] reg1ad, reg2ad, writead, 
	input[31:0] data_in, 
	output wire [31:0] reg1data, reg2data);
	
	reg[31:0] register[31:0];
	
	initial begin register[0] = 0; end
	
	assign reg1data = register[reg1ad]; // read
	assign reg2data = register[reg2ad];
	
	always @ (posedge clk) // write
		begin
			if (RegWrite == 1) register[writead] <= data_in;
		end
endmodule