/*
* 	Bryan Lee
* 	Minion CPU - NanoQuarter
*
*	Module:  Pre-Fetch Buffer testbench
*	Inputs:  instruction 1, instruction 2, write protect bar
*	Outputs: instruction
*	
*	Note: This works to solve a 1 clock cycle latency in APB
*/
module PrefetchBuffer_TB();

reg clk, rst;
reg[15:0] inst1,
	  inst2;
reg wp_;
wire [15:0] inst;

PrefetchBuffer PrefetchBuffer_testbench(.inst(inst), .wp_(wp_), .inst1(inst1), .inst2(inst2), .clk(clk), .rst(rst));

initial begin
	clk = 0;
	wp_ = 1'b1;
	//delay for buffer to initalize
	#5	;
	//simulate 6 instructions being fed into buffer
	#10 inst1 = 16'h0000; inst2 = 16'h0001;
	#10 inst1 = 16'h0002; inst2 = 16'h0003;
	#10 inst1 = 16'h0004; inst2 = 16'h0005;
	#10 inst1 = 16'h0006; inst2 = 16'h0007;
	#10 inst1 = 16'h0008; inst2 = 16'h0009;
	#10 wp_ = 1'b0;
	//following commands should not be written
	#10 inst1 = 16'h0006; inst2 = 16'h0007;

end

always
#5 clk = ~clk;
endmodule
