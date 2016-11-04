/*
* 	Nathan Chinn
* 	Minion CPU - NanoQuarter
*
*	Module:  Integration 1
*	Inputs:  
*	Outputs: 
*
*/

// iverilog -o working.vpp Integration_1_TB.v && vvp working.vpp && gtkwave Integration_1_TB.vcd
`include "Integration_1.v"

module Integration1_TB();

	reg   		clk;
	reg	   	rst;
	reg[31:0] 	exInst;
	reg[31:0] 	PCNI;
	reg   		Mmuxout;
	reg   		regWrite;
	wire [1:0] 	shamt;
	wire		PC;	
	wire   		jmp;
	wire     	bne;
	wire   		memRead;
	wire    	memWrite;
	wire   		valid;
	wire[15:0]	reg1data;	
	wire[15:0]	reg2data;
	wire[2:0] 	ALU_func;
	wire[6:0] 	iVal;

	reg[4:0] error_count;
	reg[255:0] message;

	reg 		wp_;
	reg[15:0]	mem_data;

	Integration1 test(.clk(clk),
			.rst(rst),
			.exInst(exInst),
			.PCNI(PCNI),
			.Mmuxout(Mmuxout),
			.regWrite(regWrite),
			.shamt(shamt),
			.PC(PC),
			.jmp(jmp),
			.bne(bne),
			.memRead(memRead),
			.memWrite(memWrite),
			.valid(valid),
		     	.reg1data(reg1data),
			.reg2data(reg2data),
		      	.ALU_func(ALU_func),
			.iVal(iVal),
			
			.mem_data(mem_data),
			.wp_(wp_)	
		);

	initial begin
		$dumpfile("Integration_1_TB.vcd");
		$dumpvars(0, Integration1_TB);
		error_count = 0;	clk = 0;	rst = 0;

		$display("No Internal WP_"); error_count ++; wp_ = 0;

		// LW r0, 0, 00
		// LW r1, 1, 00
		#5 	exInst = 32'b0100000000000000_0100000000100000;
			wp_ = 1;	
		// Startup Latency of 2 clock cycles
		#5	wp_ = 0; message = "Line __ LW";
			check_Prefetch(exInst[15:0], message);
			check_MainControl( 1, 0, 0, 0, 0, message);

		#5 	message = "Line __ LW";
			check_Prefetch(exInst[31:0], message);


		$display("Finished Integration_1_TB Test Bench Error Count: %d", error_count);	
		#5 $finish;
	end
	always
		# 5 clk = ~clk;

	task check_Prefetch(	input[15:0] inst_wanted,
				input[255:0] message);
		if (inst_wanted !== test.inst)
		begin
			error_count = error_count + 1;
			$display("....................................................");
			$display("Prefetch Error", );
			$display("%s", message);
			$display("Instruction Wanted: %b", inst_wanted);	
			$display("Instruction Actual: %b\n", test.inst);	
			$display("Prefetch Instructi: %b", test.PrefetchBuffer.inst1);	
			$display("Prefetch Instructi: %b", test.PrefetchBuffer.inst2);	
			$display("Prefetch Memory   : %b", test.PrefetchBuffer.inst_mem);	
			$display("....................................................");
		end
	endtask

	task check_MainControl(	input 		memRd_flg_exp,
						memWrt_flg_exp,
						brnch_flg_exp,
						jmp_flg_exp,
						nop_flg_exp,
				input[255:0] message);
		if( 	{memRd_flg_exp, memWrt_flg_exp, brnch_flg_exp, jmp_flg_exp, nop_flg_exp} !==
			{test.memRd_flg, test.memWrt_flg, test.brnch_flg, test.jmp_flg, test.nop_flg}
		)
		begin
			error_count = error_count + 1;
			$display("....................................................");
			$display("Main Control Error", );
			$display("%s", message);
			$display("memRd_flg Wanted: %b", memRd_flg_exp);	
			$display("memRd_flg Actual: %b", test.memRd_flg);	
			$display("memWrt_flg Wanted: %b", memWrt_flg_exp);	
			$display("memWrt_flg Actual: %b", test.memWrt_flg);	
			$display("brnch_flg Wanted: %b", brnch_flg_exp);	
			$display("brnch_flg Actual: %b", test.brnch_flg);	
			$display("jmp_flg Wanted: %b", jmp_flg_exp);	
			$display("jmp_flg Actual: %b", test.jmp_flg);	
			$display("nop_flg Wanted: %b", nop_flg_exp);	
			$display("nop_flg Actual: %b", test.nop_flg);	
			$display("....................................................");
		end	
	endtask

endmodule
