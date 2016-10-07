/*
* 	Nathan Chinn
* 	Minion CPU - NanoQuarter
*
*	Module:  Stall Unit
*	Inputs:  opcode, register source 1, register source 2, register
*		 destination, program counter
*	Outputs: stall flag, Program counter
*
*/

module StallUnit(	input		clk,	// System Clock
					rst, 	// System Reset
			input[1:0]	opcode,	// operation code
			input[2:0]	rs1,	// register source 1
					rs2,	// register source 2
					rd,	// register destination
			input[63:0]	pc_old,	// program counter in
			output reg[63:0]	pc_new,	// program counter out
			output reg		stall_flg // Flag set high when stall required
		);
	reg[2:0] rd_last;

	always @ (posedge clk)
	begin
		stall_flg = 0;
		pc_new = pc_old;

		if(rd_last == rs1 || rd_last == rs2)
			stall_flg = 1;

		rd_last = rd;
	end
endmodule
			
