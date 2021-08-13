// 												Tomasulo
// 	O escalonamento dinâmico visa a reorganização das instruções, de modo a se esquivar dos
// stalls gerados pelas dependências envolvidas no código desdobrado. Ele consegue decidir qual
// instrução executará, diferentemente do escalonamento estático (feito pelos compiladores), que
// organiza previamente o código, antes de executá-lo. Além disso, o escalonamento dinâmico
// permite a simplificação do compilador e que o código que foi compilado para um determinado
// pipeline seja executado eficientemente em outro.

module CDB (input clock); 
  reg [2:0]dataAddress;
  reg writeEnable;
  reg [15:0]dataCDBin;
  
  wire [15:0]Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, dataCDBout, nextInstruction, instOut, currentInst, Rout;
  wire nextInstructionEnable, done, disponivel;
  
  reg [15:0]MEM[31:0]; // Memoria
  
  initial 
	begin
		writeEnable = 0;
		dataAddress = 0;
	end

	TM_MUX mux_cdb(Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, instOut[9:7], Rout);
	
	// Banco de registradores
	FPregisters fpreg(clock, dataCDBin, dataAddress, writeEnable, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6);
	
	// A instrução é pega de um módulo de fila de instruções. Se seus operandos 
	// estiverem disponíveis nos respectivos registradores, eles são emitidos juntos para a instrução
	// para a respectiva estação de reserva.
	IQ instructions_queue(clock, nextInstructionEnable, nextInstruction, done, disponivel);
	
   // Se todos os registradores de uma determinada instrução que está em uma (estação de reserva) estão disponíveis, 
	// os operandos são encaminhados para a respectiva unidade funcional para a execução.
	Reservation_Station rs(nextInstruction, clock, nextInstructionEnable, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, instOutEnable, currentInst, done, dataCDBout, disponivel, instOut); 

	always @(posedge done)
		begin
			if(instOut[3:0] == 4'b0000 || instOut[3:0] == 4'b0001) 	// ADD && SUB
				begin	
					dataCDBin = dataCDBout;
					dataAddress = instOut[12:10];
					writeEnable = 1'b1;
				end
			if(instOut[3:0] == 4'b0100)										// MUL
				begin
					dataCDBin = dataCDBout;
					dataAddress = instOut[12:10];
					writeEnable = 1'b1;
				end
			else
				begin
					if(instOut[3:0] == 4'b0010) 								// LD												
						begin
							dataCDBin = MEM[dataCDBout];
							dataAddress = instOut[6:4];
							writeEnable = 1'b1;
						end
					else
						begin
							if(instOut[3:0] == 4'b0011) 						// SD													
								begin
									MEM[dataCDBout] = Rout;
								end
						end
				end
		end
endmodule