module multiplex(
	input [15:0] din, R0, R1, R2, R3, R4, R5, R6, 
	input [5:0] R7, 
	input [15:0] g, mem, 
	input [0:10] control, 
	output reg [15:0] out
	);

	always@(control) 
		begin
				case (control)
					11'b10000000000: out = din;
					11'b01000000000: out = R0;
					11'b00100000000: out = R1;
					11'b00010000000: out = R2;
					11'b00001000000: out = R3;
					11'b00000100000: out = R4;
					11'b00000010000: out = R5;
					11'b00000001000: out = R6;
					11'b00000000100: out = {4'b0,R7};
					11'b00000000010: out = g;
					11'b00000000001: out = mem;
				endcase
		end
endmodule