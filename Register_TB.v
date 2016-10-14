/*
* 	Derek Cook
* 	Minion CPU - NanoQuarter
*
*	Module:  Register TB
*	Inputs:  clock, reset, rest1, rst2, rd , data_in, wp_
*	Outputs: reg1data, reg2data
*
*/
`include "registers.v"
module Reg_TB();

	reg 		clk, rst, wp_;
	reg[2:0]    rs1, rs2, rd;
	reg[15:0]   data_in;
	
	wire[15:0] 	reg1data, reg2data; 

	

	Registers test(	.clk(clk), .rst(rst), .rs1(rs1), .rs2(rs2), .rd(rd), 
	.data_in(data_in), .wp_(wp_), .reg1data(reg1data), .reg2data(reg2data));


	initial begin
		$dumpfile("Reg_TB.vcd");
		$dumpvars(0, Reg_TB);
		clk = 0;	error_count = 0;	rst = 0;

		#5 rst = 1;
		#10 rst = 0;	rs1 = 0; rs2 = 1;
		#10 rst = 0;	rs1 = 1; rs2 = 0;
		#10 rst = 0;	rs1 = 1; rs2 = 1;
		#5 $display("Finished Register Test Bench. ");
		$finish;

	end
endmodule
