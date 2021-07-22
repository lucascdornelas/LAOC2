module MUX(din, r0, r1, r2, r3, r4, r5, r6, r7, g, mem, control, out);

input [0:10]  control;
input [15:0] din, r0, r1, r2, r3, r4, r5, r6, g, mem;
input [5:0] r7;

output reg [15:0] out; //BusWires

always@(control) 
	begin
			case (control)
				11'b10000000000: out = din;
				11'b01000000000: out = r0;
				11'b00100000000: out = r1;
				11'b00010000000: out = r2;
				11'b00001000000: out = r3;
				11'b00000100000: out = r4;
				11'b00000010000: out = r5;
				11'b00000001000: out = r6;
				11'b00000000100: out = {4'b0,r7}; // 5 + 11
				11'b00000000010: out = g;
				11'b00000000001: out = mem;
			endcase
	end
endmodule