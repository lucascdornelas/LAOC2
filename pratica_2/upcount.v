module upcount(Clear, Clock, Q);
	input Clear, Clock;
	output reg [1:0] Q;
	
	initial begin
		Q = 2'b0;
	end
	
	always @(posedge Clock)
		if (Clear) 
			Q <= 2'b0;
		else 
			Q <= Q + 1'b1;
endmodule


module upcount_5(Reset, Clock, count_en, Q);
	input Reset, Clock, count_en;
	output reg [4:0] Q;
	
	initial begin
		Q = 5'b0;
	end
	
	always @(posedge Clock)
		if (count_en)
			if (Reset) 
				Q <= 5'b0;
			else 
				Q <= Q + 1'b1;
endmodule




