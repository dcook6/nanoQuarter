/*
* 	Nathan Chinn
* 	Minion CPU - NanoQuarter
*
*	Module:  Pre-Fetch Buffer
*	Inputs:  instruction 1, instruction 2, write protect bar
*	Outputs: instruction
*	
*	Note: This works to solve a 1 clock cycle latency in APB
*/

module PrefetchBuffer(	input 			clk, 	// System Clock
						rst, 	// System Reset
			input[15:0]		inst1,	// Instruction 1
			input[15:0]		inst2,	// Instruction 2
			input			wp_,	// Write Protect Bar

			output reg[15:0]	inst	// function	
	  );

	reg[15:0]	inst_mem;
	
	always @(posedge clk)
	begin
		if(wp_ === 1)
		begin 
			inst		= inst1; //Greg said these need to be non-blocking <=
			inst_mem 	= inst2; //Greg said these need to be non-blocking <=
		end
		else
			inst	= inst_mem; //Greg said these need to be non-blocking <=
	end
endmodule
