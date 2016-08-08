/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create an ALU
	Input: reg1data, ALU2, ALUfunc, shamt
	Output: ALUout, zero, overflow
*/

module ALU (
	input[15:0] reg1data, ALU2,
	input[2:0] ALUfunc, 
	input[1:0] shamt, 
	output reg [15:0] ALUout,
	output reg zero, overflow);
	
	reg[4:0] i;
	
	always @ (*)
		begin
			case (ALUfunc)
				3'b101: ALUout = reg1data + ALU2; // add, addui, lw, sw
				3'b110: ALUout = reg1data - ALU2; // sub, bne, beq
				3'b000: ALUout = reg1data & ALU2; // nand, andi
				3'b001: ALUout = reg1data ^ ALU2; // xor, xori
				3'b010: ALUout = ALU2 << shamt; // sll
				3'b011: ALUout = ALU2 >> shamt; // srl
				3'b100: begin // sra
							ALUout = ALU2;
							for (i=0; i<15; i=i+1)
								begin
									if (i < shamt) ALUout = {ALUout[15], ALUout[15:1]};
								end 
						end
				default: ALUout = 0;
			endcase
			
			if(ALUout == 0) zero = 1; else zero = 0;
			
		end
endmodule
							

