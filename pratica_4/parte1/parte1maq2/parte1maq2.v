module parte1maq2 (clock, counter);
  input clock;
  input [1:0] counter;

  //Possíveis operações
  parameter readMiss = 2'b00;
  parameter invalidate = 2'b01;
  parameter writeMiss = 2'b10;
  
  //Estados do Processador
  parameter invalid = 2'b00;
  parameter exclusive = 2'b01;
  parameter shared = 2'b10;
  
  //Ações do Processador
  parameter empty = 1'b0;
  parameter writeBackBlock = 1'b1;

  reg [1:0] estado;
  reg action;

  initial
    estado <= 2;

  always @(posedge clock)
    case(estado)
      invalid:
        begin
          estado <= invalid;
          action <= empty;
        end

      exclusive:
        case(counter)
          writeMiss:
            begin
              estado <= invalid;
              action <= writeBackBlock;
            end
          readMiss:
            begin
              estado <= shared;
              action <= writeBackBlock;
            end
        endcase

      shared:
        case(counter)
          writeMiss, invalidate:
            begin
              estado <= invalid;
              action <= empty;
            end
          readMiss:
            begin
              estado <= shared;
              action <= empty;
            end
        endcase
    endcase
endmodule
