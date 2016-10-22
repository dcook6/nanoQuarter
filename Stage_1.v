/*
* 	Nathan Chinn
* 	Minion CPU - NanoQuarter
*
*	Module:  Stage1.v
*	Purpose: Stalls all necessary data 1 clock cycle
*
*
*/

module Stage1( input 			clk,
			 		rst,

		input[15:0]		reg1data_in,	// Register 1 data	
			       		reg2data_in,	// Register 2 data	
		input[7:0]		jtarget_in,	// Target to jump to 
		input[5:0]		memaddr_in,	// Memory address
		input[4:0]		boffset_in,	// Branch Offset
		input[2:0]		funct_in,	// function code
		input[2:0]		ALUfunct_in,	// ALU function Code
		input			jr_in,		// jump register?  - as of 9/8/16 I have forgot what this is supposed to do...
	        input[31:0]		PC_in,

		output reg[15:0]	reg1data_out,	// Register 1 data	
		       			reg2data_out,	// Register 2 data	
		output reg[7:0]		jtarget_out,	// Target to jump to 
		output reg[5:0]		memaddr_out,	// Memory address
		output reg[4:0]		boffset_out,	// Branch Offset
		output reg[2:0]		funct_out,	// function code
		output reg[2:0]		ALUfunct_out,	// ALU function Code
		output reg		jr_out,		// jump register?  - as of 9/8/16 I have forgot what this is supposed to do...
	        output reg[31:0]	PC_out
	  );

	always @(posedge clk) //non blocking statements...
	begin
		reg1data_out <= reg1data_in;
		reg2data_out <= reg2data_in;
		jtarget_out  <= jtarget_in;
		memaddr_out  <= memaddr_in;
		boffset_out  <= boffset_in;
		funct_out    <= funct_in;
		ALUfunct_out <= ALUfunct_in;
		jr_out 	     <= jr_in;
		PC_out	     <= PC_in;
	end
endmodule
