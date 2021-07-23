module instFetch(addr, MClock, DIN);

	input [5:0] addr;
	input MClock;
	output [15:0] DIN;
	
	wire [5:0] memOut;
		
	romlpm address(addr, MClock, memOut);  	
	tlb tlb(memOut, MClock, DIN);			
	
endmodule
