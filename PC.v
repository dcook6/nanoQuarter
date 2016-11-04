/*
* 	Nathan Chinn
* 	Minion CPU - NanoQuarter
*
*	Module:  Program Counter
*	Inputs:  clock, reset, new PC
*	Outputs: Program Counter
*
*/

module PC( input 		clk, // System Clock
		 		rst, // System Reset
	   input[31:0] 		new_PC, // PC in 

	   output reg[31:0] 	PC_out //PC out
	 );

	 always @ (posedge clk) //needs non blocking <=
	 begin
		PC_out <= new_PC;
	 end

	 always @ (posedge rst)
	 begin
		PC_out <= 0;
	 end
endmodule
