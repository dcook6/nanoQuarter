/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create an ALU Control
	Input: ALUOp, funct
	Output: jr, ALUfunc
*/

module ALU_Control(
	input[2:0] ALUOp,
	input[2:0] funct,
	output reg jr,
	output reg[2:0] ALUfunc);
	
	always @ (ALUOp, funct, ALUfunc)
		begin
			jr = 0; // defualt
			case(ALUOp)
				2'b00: // R-type instructions
					begin
						case (funct)
							6'b100001: ALUfunc = 3'b101; // addu
							6'b100011: ALUfunc = 3'b110; // subu
							6'b100100: ALUfunc = 3'b000; // nand
							6'b100110: ALUfunc = 3'b001; // xor
							6'b000000: ALUfunc = 3'b010; // sll
							6'b000011: ALUfunc = 3'b100; // sra
							6'b000010: ALUfunc = 3'b011; // srl
							//need to look at the code below this:
							6'b001000: begin ALUfunc = 4'b0010; jr = 1; end // jr
						endcase
					end
				2'b01: ALUfunc = 3'b000; //sw
				2'b01: ALUfunc = 3'b001; //lw
				2'b01: ALUfunc = 3'b010; //lb
				2'b01: ALUfunc = 3'b011; //sb
				2'b10: ALUfunc = 3'b000; //jmp
				2'b10: ALUfunc = 3'b001; //jr
				2'b11: ALUfunc = 3'b000; // bne
			endcase 
		end
endmodule
