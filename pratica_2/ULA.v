module ULA(sinal, A, Bus, G);
	input[2:0] sinal;
	input [15:0] A, Bus;
	output reg [15:0] G;
	
	always@(*)
		begin
			case(sinal) 
				3'b000:	G = A + Bus;						//add
				3'b001:	G = A - Bus;						//sub
				3'b010:	G = A | Bus;						//or
				3'b011:											//slt
							if(A < Bus)
								G = 16'b1;
							else
								G = 16'b0;
				3'b100:	G = A << Bus;						//sll
				3'b101:	G = A >> Bus;						//srl
			endcase
		end
	endmodule