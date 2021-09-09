module parte1maq1(clock, counter);
  input clock;
  input [1:0] counter;

  // Possiveis Operação
  parameter readMiss = 2'b00;
  parameter readHit = 2'b01;
  parameter writeMiss = 2'b10;
  parameter writeHit = 2'b11;

  // Estados do Processador
  parameter invalid = 2'b00;
  parameter exclusive = 2'b01;
  parameter shared = 2'b10;

  // Mensagens do Processador
  parameter emptyMessage = 2'b00;
  parameter placeReadMissOnBus = 2'b01;
  parameter placeInvalidateOnBus = 2'b10; 
  parameter placeWriteMissOnBus = 2'b11;
  
  // Ações do Processador
  parameter emptyAction = 2'b00;
  parameter writeBackBlock = 2'b01;
  parameter writeBackCacheBlock = 2'b10;

  reg [1:0] estado;
  reg [1:0] mensagem, acao;

  initial
    estado <= 0;

  always @(posedge clock)
    case(estado)
      invalid:
        case(counter)
          readMiss, readHit:
            begin
              estado <= shared;
              mensagem <= placeReadMissOnBus;
				  acao <= emptyAction;
            end
          writeMiss, writeHit:
            begin
              estado <= exclusive;
              mensagem <= placeWriteMissOnBus;
				  acao <= emptyAction;
            end
        endcase
      exclusive:
        case(counter)
          writeHit, readHit:
            begin
              estado <= exclusive;
              mensagem <= emptyMessage;
				  acao <= emptyAction;
            end
          writeMiss:
            begin
              estado <= exclusive;
              mensagem <= placeWriteMissOnBus;
				  acao <= writeBackCacheBlock;
            end
          readMiss:
            begin
              estado <= shared;
              mensagem <= placeReadMissOnBus;
				  acao <= writeBackBlock;
            end
        endcase
      shared:
        case(counter)
          readHit:
            begin
              estado <= shared;
              mensagem <= emptyMessage;
				  acao <= emptyAction;
            end
          readMiss:
            begin
              estado <= shared;
              mensagem <= placeReadMissOnBus;
				  acao <= emptyAction;
            end
          writeMiss:
            begin
              estado <= exclusive;
              mensagem <= placeWriteMissOnBus;
				  acao <= emptyAction;
            end
			writeHit:
            begin
              estado <= exclusive;
              mensagem <= placeInvalidateOnBus;
				  acao <= emptyAction;
            end
        endcase
    endcase
endmodule
