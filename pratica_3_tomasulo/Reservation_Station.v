module Reservation_Station(
	input [15:0] instruction, 
	input Clock, Adderin, 
	input[15:0] Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, 
	output reg instOutEnable, 
	output reg [15:0] instOut, 
	output wire d, 
	output wire [15:0] dout, 
	output disponivel, 
	output wire[15:0] dInst
);
  // Quando a estacao de reserva e a unidade estiverem ocupadas
  reg [7:0] busy; 									
  
  // Operacao em si, descobre quando o resultado ficou pronto. Guarda o resultado da instrucao
  reg [15:0] OP[7:0]; 			
  
  // Guarda o estado de cada registrador. Disponivel = 0, valor = apelido da instrucao que ele aguarda
  reg [2:0] registerStatus[7:0]; 
  
  // Conecta os dois registradores que foi passado para unidade funcional
  wire[15:0]reg1; wire[15:0]reg2; wire avaliableUF;

  reg [2:0] Name[7:0]; reg [2:0]	Qj[7:0]; reg [2:0] Qk[7:0];  wire[2:0] instructionCodeOut;
  reg [2:0] instructionCodeIn; reg [2:0] verifyWire; integer i, j;
  
  // marca quando algum fica disponivel
  assign avaliable = ~busy[1] | ~busy[2] | ~busy[3] | ~busy[4] | ~busy[5] | ~busy[6] | ~busy[7]; 
  
  initial
  begin
  for(j = 0; j <= 7; j = j + 1)
	begin
		registerStatus[j] = 0;
		busy[j] = 0;
	end
	verifyWire = 0;
  end

  TM_MUX getR1(Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, instOut[6:4], reg1);  TM_MUX getR2(Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, instOut[9:7], reg2);
  
  Functional_Unit UF(Clock, instOut, instOutEnable, instructionCodeIn, instructionCodeOut, d, dInst, dout, avaliableUF, reg1, reg2);
  //	>>> Os resultados das unidades funcionais estão disponíveis. Se o CDB estiver
  // disponível, os dados são escritos nele e, consequentemente, encaminhados para as estações e
  // registradores que os esperam. Nessa etapa também ocorrem as escritas à memória.
  
  reg break1 = 0;
  
  always @ (posedge Clock)
  begin
    instOut = 1'b0; instOutEnable = 1'b0;

    if(Adderin == 1'b1)
    begin
	 for(i=1; i<=7; i = i + 1) 
		begin

		if(busy[i]==1'b0 && break1 != 1)
			begin
				busy[i]=1; OP[i][15:0] = instruction[15:0]; 						
				
				if(OP[i][3:0]==4'b0000 || OP[i][3:0]==4'b0001 || OP[i][3:0]==4'b0100)
					begin															
						Qj[i] = registerStatus[instruction[9:7]]; Qk[i] = registerStatus[instruction[6:4]]; registerStatus[instruction[12:10]] = i; 		
					end
					else
					begin 														
						Qj[i] = registerStatus[instruction[9:7]]; Qk[i] = 3'b000; registerStatus[instruction[6:4]] = i; 			
					end
				break1 = 1;
			end																
		end
   end
	 
	for(i=7; i>=0; i=i-1) 
		begin
		  if(Qj[i]== 3'b000 && Qk[i]== 3'b000 && busy[i]==1 && break1 != 0) 
			begin 
				verifyWire = i; instructionCodeIn = i;	break1 = 1; 
			end
		end
	
  if(d==1)
	begin
		busy[instructionCodeOut] = 0; 
		for(i=7; i>0; i=i-1)
			begin
				if(Qj[i]==instOut[12:10])
					begin
						registerStatus[i]=0;	Qj[i]=3'b000;
					end
				if(Qk[i]==instOut[12:10])
					begin
						registerStatus[i]=0;	Qk[i]=3'b000;
					end
			end
	end
	if(verifyWire != 0 && avaliableUF)
		begin
			instOutEnable = 1'b1; instOut = OP[verifyWire];
		end
end
  
endmodule