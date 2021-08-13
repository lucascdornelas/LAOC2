module IQ(
	input Clock, 
	output reg enableOut, 
	output reg[15:0] instructionOut, 
	input done, 
	input avaliable
);
	reg [15:0] PC1[31:0]; reg [15:0] count;
	
	// Inicializando instruções na fila:
	// ADD R3, R1, R2
	// SUB R5, R3, R1
	// ADD R5, R4, R6 [3-5]
	// MUL R6, R5, R4 [4-8]
	// MUL R2, R5, R3 [5-10]
	// SUB R6, R5, R4 [6-7]
	// ADD R6, R5, R5 [7-8]
  
	initial
		begin 
			count = 0;
			
			PC1[0]=16'b0000110010100000; 
			PC1[1]=16'b0001010110010001; 
			PC1[2]=16'b0001011001100000; 
			PC1[3]=16'b0001101011000100; 
			PC1[4]=16'b0000101010110100; 
			PC1[5]=16'b0001101011000001; 
			PC1[6]=16'b0001101011010000;
		end
		
		always @(posedge Clock)
			begin
				if(avaliable == 1'b1)
					begin
						instructionOut = PC1[count];
						enableOut = 1;
						count = count + 1;
				  end
			end
endmodule