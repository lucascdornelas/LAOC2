module parte2(comandProcessor, selectProcessor, clock);
	input [11:0] comandProcessor;			// [11:9]endereco, 	[8]leitura ou escrita, 	[7:0]dado 
	input [2:0]  selectProcessor;
	
	input clock;
	
	reg [7:0] memory[7:0]; reg [7:0] busSnoopy; reg [1:0] step;
	
	wire writeBackEnable; 	wire [1:0] busMensage1, busMensage2, busMensage3;
	wire [7:0] busDada;		wire [2:0] busAddr;
	
	parameter emptyMessage = 2'b00;				parameter writeMissOnBusMessage = 2'b01;
	parameter readMissOnBusMessage = 2'b10;	parameter invalidateOnBusMessage = 2'b11; 
	
	always @(posedge clock) begin
		case(selectProcessor)
			1:
				if(busMensage1 == emptyMessage)begin
					step = 0;
				end
			2:
				if(busMensage2 == emptyMessage)begin
					step = 0;
				end	
			3:
				if(busMensage3 == emptyMessage)begin
					step = 0;
				end
		endcase
		
		if((step == 2) && writeBackEnable)begin
			memory[busAddr] = busDado;
			busSnoopy = memory[comandProcessor[11:9]];
		end
		step = step + 1;
	end
	
	cache c1(bus, busMensage1, busDado, busAddr, writeBackEnable,(selectProcessor == 1), comandProcessor, step, clock);
	cache c2(bus, busMensage2, busDado, busAddr, writeBackEnable,(selectProcessor == 2), comandProcessor, step, clock);
	cache c3(bus, busMensage3, busDado, busAddr, writeBackEnable,(selectProcessor == 3), comandProcessor, step, clock);
endmodule