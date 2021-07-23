module alu(control, A, Bus, G);
	input[2:0] control;
	input [15:0] A, Bus;
	output reg [15:0] G;
	
	parameter add = 3'b000;
	parameter sub = 3'b001;
	parameter orr = 3'b010;
	parameter slt = 3'b011;
	parameter sll = 3'b100;
	parameter srl = 3'b101;
	
	always@(*)
		begin
			case(control) 
				add:	G = A + Bus;						
				sub:	G = A - Bus;						
				orr:	G = A | Bus;						
				slt:											
							if(A < Bus)
								G = 16'b1;
							else
								G = 16'b0;
				sll:	G = A << Bus;						
				srl:	G = A >> Bus;						
			endcase
		end
endmodule