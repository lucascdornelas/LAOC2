module upcount(
	input Clear, Clock,
	output reg [2:0] Q
	);
	
	initial begin
		Q = 3'b0;
	end
	
	always @(posedge Clock)
		if (Clear) 
			Q <= 3'b0;
		else 
			Q <= Q + 1'b1;
endmodule