module proc(
	input [15:0] DIN, mem, 
	input Resetn, Clock, Run, 
	
	output reg Done, 
	output [5:0] pc,
	output [15:0] BusWires, addrM, doutM, 
	output wM
	);
	
	wire Clear = Done | Resetn;		
	
	// registers
	wire [0:7] Xreg, Yreg;
	wire [15:0] R0, R1, R2, R3, R4, R5, R6, R7, A, G;	
	wire [15:0] aluOut;
	
	// instructions
	wire [9:0] IR;
	wire [3:0] I;	
	
	// time steps
	wire [2:0] TstepQ;		
	
	// signals
	reg dinOut, gOut, memOut, incr_pc, aIn, gIn, irIn, addrIn, doutIn, wIn;
	reg [0:7] regOut, regIn;
	reg [2:0] aluControl;
		
	// control
	assign I = IR[3:0];
	
	dec3to8 decX (IR[6:4], 1'b1, Xreg);
	dec3to8 decY (IR[9:7], 1'b1, Yreg);	
	upcount tstep (Clear, Clock, TstepQ);
	
	// paramenters
	parameter mv   = 4'b0000;
	parameter mvi  = 4'b0001;
	parameter mvnz = 4'b0011;
	parameter ld   = 4'b0100;
	parameter sd =   4'b0101;

	parameter add  = 4'b0110;
	parameter sub  = 4'b0111;
	parameter orr  = 4'b1000;
	parameter slt  = 4'b1001;
	parameter sll  = 4'b1010;
	parameter srl  = 4'b1011;

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
		aluControl = 3'b000;
		Done = 1'b0;
		
		if (Run) begin
			case (TstepQ)
				3'b000: 				// load instruction time step 0
					begin
						irIn = 1'b1;
						incr_pc = 1; // incrementa em pc
					end	
					
				3'b001: // store instruction time step 1 
					begin					
					end	
					
				3'b010: //define signals in time step 1
					case (I)				
						// mv -> copy a data to another reg
						mv: begin	
							regOut = Yreg;
							regIn = Xreg;
							Done = 1'b1;							
						end
						// mvi -> move the DIN to an reg
						mvi: begin							
							regIn = Xreg;
							dinOut = 1'b1;
							Done = 1'b1;
							incr_pc = 1;	// aumente novamente o pc, pois salva o valor de um imediato de 15 bits
						end
						// mvnz -> (move if not zero) allows a mv operation to be executed only under a certain condition
						mvnz: begin							
							if (G != 0) begin
							  regOut = Yreg;
							  regIn = Xreg;
							end
							Done = 1;
						end
						// ld -> load data from memory
						ld: begin							
							regOut = Yreg;
							addrIn = 1;
						end
						// sd -> write on memory
						sd: begin							
							regOut = Xreg;
							doutIn = 1;
						end
						// add -> add the data of two regs
						add: begin							
							regOut = Xreg;
							aIn = 1;
						end
						// sub -> subtract the data of two regs
						sub: begin							
							regOut = Xreg;
							aIn = 1;
						end
						// Or
						orr: begin
							regOut = Xreg;
							aIn = 1;
						end
						// Slt
						slt: begin
							regOut = Xreg;
							aIn = 1;
						end
						// Sll
						sll: begin
							regOut = Xreg;
							aIn = 1;
						end
						// Srl
						srl: begin
							regOut = Xreg;
							aIn = 1;
						end
					endcase
					
					
				3'b011: //define signals in time step 2
					case (I)
						// load -> load data from memory
						ld: begin							
							regIn = Xreg;
							memOut = 1;
							Done = 1;
						end
						// store -> write on memory
						sd: begin							
							regOut = Yreg;
							addrIn = 1;
							wIn = 1;
							Done = 1;
						end
						// add -> add the data of two regs
						add: begin							
							regOut = Yreg;
							gIn = 1;
							aluControl = 4'b0000;
						end
						// sub -> subtract the data of two regs
						sub: begin							
							regOut = Yreg;
							gIn = 1;
							aluControl = 4'b0001;
						end
						// Or
						orr: begin
							regOut = Yreg;
							gIn = 1;
							aluControl = 4'b0010;
						end
						// Slt
						slt: begin
							regOut = Yreg;
							gIn = 1;
							aluControl = 4'b0011;
						end
						// Sll
						sll: begin
							regOut = Yreg;
							gIn = 1;
							aluControl = 4'b0100;
						end
						// Srl
						srl: begin
							regOut = Yreg;
							gIn = 1;
							aluControl = 4'b0101;
						end
					endcase
					
					
				3'b100: //define signals in time step 3
					case (I)						
						// add -> add the data of two regs
						add: begin							
							regIn = Xreg;
							gOut = 1;
							Done = 1;
						end
						// sub -> subtract the data of two regs
						sub: begin							
							regIn = Xreg;
							gOut = 1;
							Done = 1;
						end
						// Or
						orr: begin
							regIn = Xreg;
							gOut = 1;
							Done = 1;
						end
						// Slt
						slt: begin
							regIn = Xreg;
							gOut = 1;
							Done = 1;
						end
						// Sll
						sll: begin
							regIn = Xreg;
							gOut = 1;
							Done = 1;
						end
						// Srl
						srl: begin
							regIn = Xreg;
							gOut = 1;
							Done = 1;
						end					
					endcase					
			endcase
		end
	end
		
	// Standart registers
	regn reg_0 (BusWires, regIn[0], Clock, R0, Resetn);
	regn reg_1 (BusWires, regIn[1], Clock, R1, Resetn);
	regn reg_2 (BusWires, regIn[2], Clock, R2, Resetn);
	regn reg_3 (BusWires, regIn[3], Clock, R3, Resetn);
	regn reg_4 (BusWires, regIn[4], Clock, R4, Resetn);
	regn reg_5 (BusWires, regIn[5], Clock, R5, Resetn);
	regn reg_6 (BusWires, regIn[6], Clock, R6, Resetn);
			
	//Counter
	lpmcounter count (1'b1, Clock, incr_pc, BusWires[5:0], Resetn, regIn[7], pc);
			
	//Alu
	alu alu (aluControl, A, BusWires, aluOut);
			
	// Aux reg for multi-cycle
	regn reg_A(BusWires, aIn, Clock, A, Resetn);
	regn reg_G(aluOut, gIn, Clock, G, Resetn);			
			
	// Instruction register
	regn reg_IR(DIN[15:6], irIn, Clock, IR, Resetn);	
	defparam reg_IR.n = 10; 
		
	// Memory register
	regn reg_Addr(BusWires, addrIn, Clock, addrM, Resetn);
	regn reg_Dout(BusWires, doutIn, Clock, doutM, Resetn);		
	regn reg_W(wIn, 1'b1, Clock, wM, Resetn);	
	defparam reg_W.n = 1;	

	multiplex multiplex (DIN, R0, R1, R2, R3, R4, R5, R6, pc, G, {dinOut, regOut, gOut}, BusWires);
endmodule