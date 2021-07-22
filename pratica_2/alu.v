module alu(control, A,  BusWires, G);
	input [2:0] control;
	input [15:0] A, BusWires;
	output reg [15:0] G;
	
	parameter add  = 3'b000; 
	parameter sub  = 3'b001;
	parameter orr  = 3'b010;
	parameter slt  = 3'b011;
	parameter sll  = 3'b100;
	parameter srl  = 3'b101;
	
	always@(*)begin
		case(control)
			add: 
				G = A + BusWires;  
				
			sub: 
				G = A - BusWires;

			orr: 
				G = A | BusWires;

			slt: 
				G = (A < BusWires) ? 1:0;

			sll: 
				G = A << BusWires;

			srl: 
				G = A >> BusWires;
		endcase
	end
endmodule
