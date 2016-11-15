`include "APB_Adapter.v"
module APB_Adapter_TB();
	
	reg  clk;
	reg  reset_N;
	reg [15:0] paddr;
	reg     pwrite;
	reg     psel;
	reg     penable;
	reg     [15:0] pwdata;
	wire    [15:0] prdata;
	
	APB_Adapter APB_Adapter(.clk(clk), .reset_N(reset_N), .paddr(paddr), .pwrite(pwrite),
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
	end
endmodule
