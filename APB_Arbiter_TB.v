/*
* 	Derek Cook
* 	Edited to work by Nathan Chinn
* 	Minion CPU - NanoQuarter
*
*	Module:  Branch Adder TB
*	Inputs:  boff, PC_n, bne
*	Outputs: bsel
*
*/
`include "APB_Arbiter.v"
module APB_Arbiter_TB();
	
	reg  clk;
	reg  reset_N;
	reg [15:0] paddr;
	reg     pwrite;
	reg     psel;
	reg     penable;
	reg     [15:0] pwdata;
	wire    [15:0] prdata;
	
	APB_Arbiter APB_Arbiter(.clk(clk), .reset_N(reset_N), .paddr(paddr), .pwrite(pwrite),
							.psel(psel), .penable(penable), .pwdata(pwdata), .prdata(prdata));


	 initial begin
		 clk = 1'b0;
		 forever #10 clk = !clk;
	end
	
	initial begin
		reset_N = 1'b1;
		@(negedge clk);
		@(negedge clk);
		reset_N = 1'b0;
		@(negedge clk);
		penable = 1'b1; psel = 1'b1; pwrite = 1'b0; paddr = 15'b0000000000000001; // Read from memory
		@(negedge clk);
		penable = 1'b1; psel = 1'b1; pwrite = 1'b1; paddr = 15'b0000000000000001; pwdata = 15'b1111111111111111; // Write to memory
		@(negedge clk);
		penable = 1'b1; psel = 1'b1; pwrite = 1'b0; paddr = 15'b0000000000000001; // Verify Write
	end
endmodule
