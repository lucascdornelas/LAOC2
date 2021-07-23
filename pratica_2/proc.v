module proc (
	input [15:0] DIN, MemoryIn, 
	input Resetn, Clock, Run, 
	output reg Done, 
	output [15:0] BusWires, 
	output [5:0] PC, 
	output [15:0] addrM, doutM, 
	output enableMemory
	);
	
	// registradores
	wire [0:7] Xreg, Yreg;
	wire [15:0] R0, R1, R2, R3, R4, R5, R6, A, G;	
	wire [15:0] aluOut;
	
	// instructions
	wire [9:0] IR;
	wire [3:0] I;	
	
	// time steps
	wire [1:0] TstepQ;		
	
	// sinais
	reg dinOut, gOut, memOut, incr_pc, aIn, gIn, irIn, addrIn, doutIn, wIn;
	reg [0:7] regOut, regIn;
	reg [2:0] aluSignal;
	
	wire Clear = Done | Resetn;	
	
	assign I = IR[9:6];

	// extensor de sinal
	dec3to8 decX (IR[5:3], 1'b1, Xreg);
	dec3to8 decY (IR[2:0], 1'b1, Yreg);

	// paramentros
	parameter mv   = 4'b0000;
	parameter st   = 4'b0001;
	parameter mvnz = 4'b0010;
	parameter ld   = 4'b0011;
	parameter mvi  = 4'b0100;

	parameter add  = 4'b0101;
	parameter sub  = 4'b0110;
	parameter orr  = 4'b0111;
	parameter slt  = 4'b1000;
	parameter sll  = 4'b1001;
	parameter srl  = 4'b1010;
	
	upcount tstep (Clear, Clock, TstepQ);

	always @(TstepQ or I or Xreg or Yreg) begin
		
		regOut[0:7] = 8'b0;
		regIn [0:7] = 8'b0;	
		dinOut = 1'b0;			
		gOut = 1'b0;	
		memOut = 1'b0;
		incr_pc = 1'b0;
		aIn = 1'b0;
		gIn = 1'b0;
		irIn = 1'b0;
		addrIn = 1'b0;
		doutIn = 1'b0;
		wIn = 1'b0;
		aluSignal = 3'b000;
		Done = 1'b0;
		
		if (Run) begin
			case (TstepQ)
				2'b00: // load instruction time step 0
					begin
						regOut = 8'b00000001;
						irIn = 1'b1;
						incr_pc = 1; 
					end	
					
				2'b01: //define signals in time step 1
					case (I)				
						mv: begin
							regOut = Yreg;
							regIn = Xreg;
							Done = 1'b1;							
						end
						
						st: begin					
							regOut = Xreg;
							doutIn = 1;							
						end
						
						mvnz: begin 
							if (G != 0) begin
								  regOut = Yreg;
								  regIn = Xreg;
								end
								Done = 1;
							end
						
						ld: begin				
							regOut = Yreg;
							addrIn = 1;	
						end
						
						mvi: begin			
							
						end
						
						
						add: begin					
							regOut = Xreg;
							aIn = 1;
						end
						
						sub: begin				
							regOut = Xreg;
							aIn = 1;	
						end
						 
						orr: begin			
							regOut = Xreg;
							aIn = 1;		
						end
						
						slt: begin 
							regOut = Xreg;
							aIn = 1;
						end
						
						sll: begin 
							regOut = Xreg;
							aIn = 1;
						end
						
						srl: begin 	
							regOut = Xreg;
							aIn = 1;
						end
					endcase			
					
				2'b10: //define signals in time step 2
				 if(I > mvi) begin
					gIn = 1'b1;
					regOut = Yreg;
					case (I)				
						add:    aluSignal = 3'b000;
						sub:    aluSignal = 3'b001;
						orr:    aluSignal = 3'b010;
						slt: 	aluSignal = 3'b011;
						sll: 	aluSignal = 3'b100;
						srl: 	aluSignal = 3'b101;
							
					endcase
					end
					else begin 
						if(I == st) begin	
							regOut = Yreg;
							addrIn = 1;
							wIn = 1;
						end
												
						if(I == mvi) begin
							regIn = Xreg;
							dinOut = 1'b1;
							Done = 1'b1;
							#20 regOut = 5'b00001;
							incr_pc = 1;
						end
					end
					
				2'b11: //define signals in time step 3
					if(I > mvi) begin
						gOut = 1'b1;
						regIn = Xreg;
						Done = 1'b1;
					end
					else begin
						if(I == ld) begin
							regIn = Xreg;
							memOut = 1;
							Done = 1'b1;
						end
					end
			endcase
		end
	end
		
	regn reg_0 (BusWires, regIn[0], Clock, R0, Resetn);
	regn reg_1 (BusWires, regIn[1], Clock, R1, Resetn);
	regn reg_2 (BusWires, regIn[2], Clock, R2, Resetn);
	regn reg_3 (BusWires, regIn[3], Clock, R3, Resetn);
	regn reg_4 (BusWires, regIn[4], Clock, R4, Resetn);
	regn reg_5 (BusWires, regIn[5], Clock, R5, Resetn);
	regn reg_6 (BusWires, regIn[6], Clock, R6, Resetn);
	
	counterlpm reg_7 (1'b1, Clock, incr_pc, BusWires[5:0], Resetn, regIn[7], PC);
	
	regn reg_A(BusWires, aIn, Clock, A, Resetn);
	regn reg_G(aluOut, gIn, Clock, G, Resetn);
	
	regn_IR reg_IR(DIN[15:6], irIn, Clock, IR, Resetn);	 
	
	alu alu(aluSignal, A, BusWires, aluOut);
	
	
	// Memory register
	regn reg_Addr(BusWires, addrIn, Clock, addrM, Resetn);
	regn reg_Dout(BusWires, doutIn, Clock, doutM, Resetn);		
	regn reg_W(wIn, 1'b1, Clock, enableMemory, Resetn);	
	defparam reg_W.n = 1;	//  n = 1
						
	multiplex mux(DIN, R0, R1, R2, R3, R4, R5, R6, PC, G, MemoryIn, {dinOut, regOut, gOut, memOut}, BusWires);
endmodule
