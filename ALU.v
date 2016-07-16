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
	input[31:0] reg1data, ALU2,
	input[3:0] ALUfunc, 
	input[4:0] shamt, 
	output reg [31:0] ALUout,
	output reg zero, overflow);
	
	reg[5:0] i;
	
	always @ (*)
		begin
			case (ALUfunc)
				4'b0010: ALUout = reg1data + ALU2; // add, addui, lw, sw
				4'b0110: ALUout = reg1data - ALU2; // sub, bne, beq
				4'b0000: ALUout = reg1data & ALU2; // and, andi
				4'b0001: ALUout = reg1data | ALU2; // or, ori
				4'b1001: ALUout = reg1data ^ ALU2; // xor, xori
				4'b1010: ALUout = ALU2 << shamt; // sll
				4'b1100: ALUout = ALU2 >> shamt; // srl
				4'b0111: begin // slt, slti - SIGNED
							if (reg1data[31] == ALU2[31])
								begin
									if (reg1data < ALU2) ALUout = 1;
									else ALUout = 0;
								end
							else
								begin
									if (reg1data > ALU2) ALUout = 1;
									else ALUout = 0;
								end
						end
				4'b1101: ALUout = ALU2 << 16; // lui
				4'b1110: begin // sltu, sltui - UNSIGNED
							if(reg1data < ALU2) ALUout = 1;
							else ALUout = 0;
						end
				4'b1011: begin // sra
							ALUout = ALU2;
							for (i=0; i<31; i=i+1)
								begin
									if (i < shamt) ALUout = {ALUout[31], ALUout[31:1]};
								end 
						end
				default: ALUout = 0;
			endcase
			
			if(ALUout == 0) zero = 1; else zero = 0;
			
		end
endmodule
							

