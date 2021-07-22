module multiplex (din, r0, r1, r2, r3, r4, r5, r6, pc, g, control, out);
	input [0:9]  control;
	input [15:0] din, r0, r1, r2, r3, r4, r5, r6, g;
	input [5:0] pc;

	output reg [15:0] out;


	always@(control) 
		begin
				case (control)
					10'b1000000000: 
						out = din;
						
					10'b0100000000: 
						out = r0;
					
					10'b0010000000: 
						out = r1;
					
					10'b0001000000: 
						out = r2;
					
					10'b0000100000: 
						out = r3;
					
					10'b0000010000: 
						out = r4;
					
					10'b0000001000: 
						out = r5;
					
					10'b0000000100: 
						out = r6;
					
					10'b0000000010: 
						out = {5'b0,pc};
					
					10'b0000000001: 
						out = g;
				endcase
		end
endmodule