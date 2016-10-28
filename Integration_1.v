
/*
* 	Bryan Lee - Edited: Nathan Chinn
* 	Minion CPU - NanoQuarter
*
*	Module:  Integration_2.v
*	Purpose: Second stage of the integration Pipeline
*
*
*/
`include"Prefetch_Buffer.v"
`include"PC_MUX.v"
`include"PC.v"
`include"main_control.v"
`include"Stall_Unit.v"
`include"ALU_Control.v"
`include"Stage_1.v"
module integration1( 	input wire 		[31:0] exInst,
						PCNI,
			input wire		Mmuxout,
						regWrite,

			output wire [1:0] 	shamt,

			output reg 		PC,	
						jmp,
				        	bne,
						memRead,
				       		memWrite,
						valid,
		     	output reg [15:0] 	reg1data,	
						reg2data,
		      	output reg [2:0] 	ALU_func,
			output reg [6:0] 	iVal);

	//prefetch module
	wire [15:0] inst;				
	wire wp_;

	//pc and pc_mux module
	wire [31:0] PC_mux_out;
	wire [31:0] PC_out;
	wire stall_flg;

	//main control module
	wire jmp_flg, brnch_flg, nop_flg, 
		  memRd_flg, memWrt_flg;

	//ALUcontrol
	wire jr;
	wire [2:0] alu_funct; // alucontrol output function

	PrefetchBuffer PrefetchBuffer(	.clk(clk),			.rst(rst),
					.wp_(wp_),			.inst1(exInst[15:0]),
					.inst2(exInst[31:16]),     	.inst(inst)
				);

	PCMUX PCMUX(			.PC_in(PC_out), 		.PCNI(PCNI), 
					.stall_flg(stall_flg), 		.PC_out(PC_mux_out)
				);

	PC PC1(				.clk(clk),			.rst(rst),
					.new_PC(PC_mux_out),		.PC_out(PC_out)
				);


	MainControl MainControl(	.stall_flg(stall_flg),		.opcode(inst[15:14]),
					.funct(inst[2:0]),		.jmp_flg(jmp_flg),
					.brnch_flg(brnch_flg),		.nop_flg(nop_flg),
					.memRd_flg(memRd_flg),		.memWrt_flg(memWrt_flg)
				);

	StallUnit StallUnit(		.clk(clk),			.rst(rst),
					.opcode(inst[15:14]),		.rs1(inst[13:11]),
					.rs2(inst[10:8]),		.rd(inst[7:5]),
					.pc_old(PC_out),		.pc_new(PC_out),
					.stall_flg(stall_flg)
				);

	ALUControl ALUControl(		.inst(inst),			.func(alu_funct),
					.shamt(shamt),			.jr(jr)
				);

	// Do not need to declare stage 1 inside this integration
	// Stage 1 will be separate integration module
	// Lots of typing done though, so I don't want to delete it yet
//	Stage1 Stage1(			.clk(clk),			.rst(rst),
//					.jtarget_in(inst[10:3]),	.memaddr_in(inst[10:5]),
//					.boffset_in(inst[7:3]),		.funct_in(inst[2:0]),
//					.ALUfunct_in(alu_funct),	.jr_in(jump_flg),
//					.PC_in(PC_out),			.reg1data_in(reg1data),
//					.reg2data_in(reg2data),		.reg1data_out(reg1data_out),
//					.reg2data_out(reg2data_out),	.jtarget_out(jtarget_out),
//					.memaddr_out(memaddr_out),	.boffset_out(boffset_out),
//					.funct_out(funct_out),		.ALUfunct_out(ALU_func),
//					.jr_out(jr_out),		.PC_out(PC_out)
//				);
endmodule
