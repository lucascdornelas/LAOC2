module alu (control, A,  BusWires, G);
	input [2:0] control;
	input [15:0] A, BusWires;
	output reg [15:0] G;
	
	/* 
		intructions: 
			000 = add
			001 = sub
			010 = or
			011 = slt
			100 = sll
			101 = srl
	*/
	
	always@(*)begin
		case(control)
			3'b000: 
				G = A + BusWires;  
				
			3'b001: 
				G = A - BusWires;

			3'b010: 
				G = A | BusWires;

			3'b011: 
				G = (A < BusWires) ? 1:0;

			3'b100: 
				G = A << BusWires;

			3'b101: 
				G = A >> BusWires;
		endcase
	end
endmodule
