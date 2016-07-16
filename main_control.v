/*
	Name: Derek Cook
	Class: CS 4480 - Computer Architecture and Design
	Instructor: Dr. Charlie Wang
	Project: 32-bit Single Cycle Processor
	Description: Create the Main Control
	intput: inst
	Output: ALUOp, ALUSrc, RegDst, RegWrite, MemWrite, MemtoReg, MemRead, Branch, bne, Jump, jal, ui
*/

module main_control(
	input[5:0] inst,
	output reg[3:0] ALUOp,
	output reg ALUSrc, RegDst, RegWrite, MemWrite, MemtoReg, MemRead, Branch, bne, Jump, jal, ui);
	
	always @ (inst)
		begin
			case(inst)
				6'b000000: // R-type instruction
					begin
						ALUOp=4'b0010; ALUSrc=0; RegDst=1; RegWrite=1; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=0; jal=0; ui=0;
					end
					
				6'b001111: // lui instruction
					begin
						ALUOp=4'b0011; ALUSrc=1; RegDst=0; RegWrite=1; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=0; jal=0; ui=0;
					end 
				
				6'b001001: // addui instruction
					begin
						ALUOp=4'b0000; ALUSrc=1; RegDst=0; RegWrite=1; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=0; jal=0; ui=1;
					end
					
				6'b001100: // andi instruction
					begin
						ALUOp = 4'b0101; ALUSrc=1; RegDst=0; RegWrite=1; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=0; jal=0; ui=1;
					end
				
				6'b001101: // ori instruction
					begin
						ALUOp=4'b0110; ALUSrc=1; RegDst=0; RegWrite=1; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=0; jal=0; ui=1;
					end
					
				6'b001110: // xori instruction
					begin
						ALUOp=4'b0111; ALUSrc=1; RegDst=0; RegWrite=1; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=0; jal=0; ui=1;
					end
				
				6'b001010: //slti instruction
					begin
						ALUOp=4'b0100; ALUSrc=1; RegDst=0; RegWrite=1; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=0; jal=0; ui=0;
					end
					
				6'b001011: //sltiu instruction
					begin
						ALUOp=4'b1001; ALUSrc=1; RegDst=0; RegWrite=1; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=0; jal=0; ui=1;
					end
					
				6'b000100: // beq instruction
					begin
						ALUOp=4'b0001; ALUSrc=0; RegDst=0; RegWrite=0; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=1; bne=0; Jump=0; jal=0; ui=0;
					end
					
				6'b000101: // bne instruction
					begin
						ALUOp=4'b0001; ALUSrc=0; RegDst=0; RegWrite=0; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=1; Jump=0; jal=0; ui=0;
					end
				
				6'b100011: // lw instruction
					begin
						ALUOp=4'b0000; ALUSrc=1; RegDst=0; RegWrite=1; MemWrite=0;
						MemtoReg=1; MemRead=1; Branch=0; bne=0; Jump=0; jal=0; ui=0;
					end
				
				6'b101011: // sw instruction
					begin
						ALUOp=4'b0000; ALUSrc=1; RegDst=0; RegWrite=0; MemWrite=1;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=0; jal=0; ui=0;
					end
					
				6'b000010: // j instruction
					begin 
						ALUOp=4'b0000; ALUSrc=0; RegDst=0; RegWrite=0; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=1; jal=0; ui=0;
					end
					
				6'b000011: // jal instruction
					begin
						ALUOp=4'b0000; ALUSrc=0; RegDst=0; RegWrite=1; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=1; jal=1; ui=0;
					end
					
				default:
					begin
						ALUOp=4'b0000; ALUSrc=0; RegDst=0; RegWrite=0; MemWrite=0;
						MemtoReg=0; MemRead=0; Branch=0; bne=0; Jump=0; jal=0; ui=0;
					end
			endcase
		end
endmodule
				