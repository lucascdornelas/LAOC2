module multiplex (
	input [15:0] din, r0, r1, r2, r3, r4, r5, r6, g, 
	input [0:9] control,
	input [5:0] pc,
	output reg [15:0] MUXOut
	);


	always@(control)
		begin
				case (control)
					10'b1000000000: 
						MUXOut = din;
						
					10'b0100000000: 
						MUXOut = r0;
					
					10'b0010000000: 
						MUXOut = r1;
					
					10'b0001000000: 
						MUXOut = r2;
					
					10'b0000100000: 
						MUXOut = r3;
					
					10'b0000010000: 
						MUXOut = r4;
					
					10'b0000001000: 
						MUXOut = r5;
					
					10'b0000000100: 
						MUXOut = r6;
					
					10'b0000000010: 
						MUXOut = {5'b0,pc};
					
					10'b0000000001: 
						MUXOut = g;
				endcase
		end
endmodule