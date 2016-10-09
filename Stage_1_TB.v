/*
* 	Rebekah Tomsick
* 	Minion CPU - NanoQuarter
*
*	Module:  Stage_1_TB
*	Inputs:  clk, rst, reg1data_in, reg2data_in, jtarget_in, memaddr_in, boffset_in, funct_in, ALUfunct_in, jr_in
*	Outputs: reg1data_out, reg2data_out, jtarget_out, memaddr_out, boffset_out, funct_out, ALUfunct_out, jr_out
*
*/
// Run Command: 
// iverilog -o Main_Control_TB Main_Control_TB.v && vvp Main_Control_TB
// `timescale 1ns/100ps
`include "Stage_1.v"

module Stage1_TB();
  
    reg 			clk;
	reg 	 		rst;

    reg[15:0]		reg1data_in,	
			       		reg2data_in;	
    reg[7:0]		jtarget_in;
    reg[5:0]		memaddr_in;
    reg[4:0]		boffset_in;
    reg[2:0]		funct_in;
    reg[2:0]		ALUfunct_in;
		reg		    	jr_in;

    wire[15:0]	reg1data_out,
		       			reg2data_out;
    wire[7:0]		jtarget_out;
    wire[5:0]		memaddr_out;
    wire[4:0]		boffset_out;
    wire[2:0]		funct_out;
    wire[2:0]		ALUfunct_out;
		wire		jr_out;		
	
	reg[7:0] error_count;

	Stage1 test(	
			.clk(clk),
			.rst(rst),

			.reg1data_in(reg1data_in),	
			.reg2data_in(reg2data_in),	
			.jtarget_in(jtarget_in),
			.memaddr_in(memaddr_in),
			.boffset_in(boffset_in),
			.funct_in(funct_in),
			.ALUfunct_in(ALUfunct_in),
			.jr_in(jr_in),

			.reg1data_out(reg1data_out),
			.reg2data_out(reg2data_out),
			.jtarget_out(jtarget_out),
			.memaddr_out(memaddr_out),
			.boffset_out(boffset_out),
			.funct_out(funct_out),
			.ALUfunct_out(ALUfunct_out),
			.jr_out(jr_out)
			);	
	
	initial begin
		$dumpfile("Main_Control_TB.vcd");
		$dumpvars(0, MainControl_TB);
		error_count = 0;


		#10	reg1data_in = 16'b0000_0000_0000_0000;	reg2data_in = 16'b0000_0000_0000_0000;
			jtarget_in  =  8'b0000_0000;		memaddr_in  =  6'b  00_0000;
			boffset_in  =  5'b   0_0000;            funct_in    =  3'b 000;
			ALUfunct_in =  3'b 000;			jr_in	    =  0;


		$display("Finished Main_Control_TB Test Bench Error Count: %d", error_count);	
		#5 $finish;
	end

  always
    #5 clk = ~clk;
  
	task check_output( 	input[4:0] concat_flg,
				input[255:0] message);
		if(concat_flg !== {test.jmp_flg, test.brnch_flg, test.nop_flg, test.memRd_flg, test.memWrt_flg})
		begin
			error_count = error_count + 1;
			$display("Error: Flag data not equal");
			$display("Actual:   \t %b", {test.jmp_flg, test.brnch_flg, test.nop_flg, test.memRd_flg, test.memWrt_flg});
			$display("Testbench:\t %b", concat_flg);
			$display("Message: %s\n", message);
		end
	endtask

endmodule
