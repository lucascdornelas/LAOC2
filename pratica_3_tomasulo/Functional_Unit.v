module Functional_Unit(
	input clock, 
	input [15:0]instruction, 
	input instructIn, 
	input [2:0]instructionCodeIn, 
	output reg[2:0]instructionCodeOut, 
	output reg done, 
	output reg [15:0]currentInst, 
	output reg [15:0]dout, 
	output reg avaliableUF, 
	input [15:0]R1, R2
);
initial 
	begin
		currentInst = 16'b0000000000001111; done = 0; avaliableUF = 1;
	end

integer cont;

always @(posedge clock)
	begin
	done=0;	
	
	if(instructIn == 1 && avaliableUF == 1)
		begin	
			avaliableUF = 0;
			currentInst = instruction;
			cont = 1;
			instructionCodeOut = instructionCodeIn;
		
			case(instruction[3:0])
				4'b0000: 
					dout <= R2 + R1;
				4'b0001: 
					dout <= R2 - R1;
				4'b0100: 
					dout <= R2 * R1;
			endcase
		end
	else
		cont = cont + 1;
	
	if(currentInst[3:0] == 4'b0000 || currentInst[3:0] == 4'b0001)
		begin
		if(cont == 2)
			begin
				done = 1'b1;
				avaliableUF = 1;
			end
		end
	if(currentInst[3:0] == 4'b0100)
		begin
		if(cont == 2)
			begin
				done = 1'b1;
				avaliableUF = 1;
			end
		end
	else 
		begin
		if(currentInst[3:0] == 4'b0010 || currentInst[3:0] == 4'b0011)
			begin
				done = 1'b1;
				avaliableUF = 1;
			end
		end
	end

endmodule