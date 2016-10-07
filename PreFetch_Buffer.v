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

module ALUControl(	input 			clk, 	// System Clock
						rst, 	// System Reset
			input[15:0]		inst1,	// Instruction 1
			input[15:0]		inst2,	// Instruction 2
			input			wp_,	// Write Protect Bar
			output wire[15:0]	inst	// function	
	  );
	reg[1:0] instructions [15:0];
	reg count;

	assign inst = instructions[count];
	always @(posedge clk)
	begin
		if (wp_ == 1)
		begin
			instructions[0] = inst1; // load prefetch buffer
			instructions[1] = inst2; 
			count = 0;
		end	
		else
		begin
			count = 1;
		end
	end
endmodule
