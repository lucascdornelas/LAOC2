module FPregisters(
	input clock, 
	input [15:0] dataIn,
	input [2:0] dataAddress, 
	input writeEnable, 
	output reg[15:0] R1, R2, R3, R4, R5, R6
);
	// Inicia os registradores com os respectivos estados.
	initial
		begin
		  R1 = 1; R2 = 1; R3 = 1; R4 = 2; R5 = 0; R6 = 1;
		end
		
	always@(posedge clock)
	begin
		if(writeEnable==1'b1)
		begin
			case(dataAddress)
				3'b001: R1 = dataIn;
				3'b010: R2 = dataIn;
				3'b011: R3 = dataIn;
				3'b100: R4 = dataIn;
				3'b101: R5 = dataIn;
				3'b110: R6 = dataIn;
			endcase
		end
	end

endmodule