/*
* 	Derek Cook
* 	Minion CPU - NanoQuarter
*
*	Module:  Branch Adder TB
*	Inputs:  boff, PC_n, bne
*	Outputs: bse1
*
*/
`include "branch_add.v"
module Branch_Add_TB();

	reg[4:0] 	boff;
	reg[15:0]   PC_n;
	reg         bne;
	
	wire[15:0] 	bse1; 

	

	BranchAdd test(	.boff(boff), .PC_n(PC_n), .bne(bne), .bse1(bse1));


	initial begin
		$dumpfile("Branch_Add_TB.vcd");
		$dumpvars(0, Branch_Add_TB);
		
		#10 PC_n = 16'b0000000000000000;	bne = 0; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000001;	bne = 0; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000010;	bne = 0; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000011;	bne = 0; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000100;	bne = 0; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000101;	bne = 0; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000110;	bne = 0; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000111;	bne = 0; boff = 4'b00000;
		#10 PC_n = 16'b0000000000001000;	bne = 0; boff = 4'b00000;
		#10 PC_n = 16'b0000000000001001;	bne = 0; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000000;	bne = 1; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000001;	bne = 1; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000010;	bne = 1; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000011;	bne = 1; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000100;	bne = 1; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000101;	bne = 1; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000110;	bne = 1; boff = 4'b00000;
		#10 PC_n = 16'b0000000000000111;	bne = 1; boff = 4'b00000;
		#10 PC_n = 16'b0000000000001000;	bne = 1; boff = 4'b00000;
		#10 PC_n = 16'b0000000000001001;	bne = 1; boff = 4'b00000;
		#5 $display("Finished Branch Adder Test Bench. ");
		$finish;

	end
endmodule
