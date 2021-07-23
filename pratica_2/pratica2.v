module pratica2 (
	input MemoryClock, ProcClock, Resetn, Run
);
	wire [15:0] DIN, BusWires;
	wire [5:0] addrCount;
	wire Done;
	
	wire [5:0] addrM;
	wire [15:0] addr, dout;
	wire w;
	wire [15:0] MemoryOut;
	
	assign addrM = addr[4:0];
	
	instFetch iF(addrCount, MemoryClock, DIN);
	ramlpm memory (addrM, MemoryClock, dout, w, MemoryOut);
	proc processor(DIN, MemoryOut, Resetn, ProcClock, Run, Done, BusWires, addrCount, addr, dout, w);
	
	
endmodule
