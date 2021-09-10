module cache #(
  parameter NAME = "", FILE = "",
  parameter [1:0] readMiss, readHit, writeBack
) (
  input [1:0] step,
  input [9:0] instruction,
  input [8:0] inBus,
  output reg [8:0] outBus,
  output reg [8:0] q
);

  parameter [1:0] invalid = 2'b00, shared = 2'b01, modified = 2'b10;
  
  reg [8:0] memory [0:3];  

  wire opInstruc, esseProc;
  wire [1:0] estadoCache, tipoBus, bloco;
  wire [2:0] tagInstruc, tagCache, tagBus;
  wire [3:0] valorInstruc, valorCache, valorBus;
							
  // Dados da Intrucao (Input)         					// Se o valor for:	
  assign opInstruc = instruction[9];                 // 0 - Instrução de Load (Read)          1 - Instrução de Store (Write)
  assign esseProc = (instruction[8:7] == NAME);       // 0 - A origem é o outro processador    1 - A origem é o processador atual
  assign tagInstruc = instruction[6:4];              // TAG da instrucao
  assign valorInstruc = instruction[3:0];            // Valor a ser escrito
  
  // Dados da Cache
  assign bloco = tagInstruc[1:0];

  assign estadoCache = memory[bloco][8:7];
  assign tagCache = memory[bloco][6:4];
  assign valorCache = memory[bloco][3:0];

  // Dados do barramento Bus
  assign tipoBus = inBus[8:7];
  assign tagBus = inBus[6:4];
  assign valorBus = inBus[3:0];

  initial
    $readmemb(FILE, memory);

  always @(step) begin
    outBus = {readHit, 3'b0, 4'b0};
	 
    case(step)
	 
      2'b00:
        if(esseProc) begin
          // MISS
          if(tagCache != tagInstruc || estadoCache == invalid) begin
            // Para estado Modified 
            if(estadoCache == modified) begin
              outBus = {writeBack, tagCache, valorCache};
            end
          end
        end

      2'b01:
        if(esseProc) begin
          // WRITE
          if(opInstruc) begin
            memory[bloco] = {modified, tagInstruc, valorInstruc};
            outBus = {invalid, tagInstruc, 4'b0};

          // READ
          end else begin
            // MISS
            if(tagCache != tagInstruc || estadoCache == invalid)
              outBus = {readMiss, tagInstruc, 4'b0};
				// HIT
            else
              outBus = {readHit, tagInstruc, 4'b0};
          end
        end
      2'b10:
        if(!esseProc) begin
          // WRITE
          if(opInstruc) begin
            // HIT
            if(tagCache == tagInstruc) begin
              if(estadoCache == modified)
                outBus = {writeBack, tagCache, valorCache};

              memory[bloco][8:7] = invalid;
            end

          // READ
          end else begin

            // MISS
            if(tipoBus == readMiss) // informacao pode estar desatualizada
              if(tagCache == tagInstruc && estadoCache != invalid) begin
                outBus = {writeBack, tagCache, valorCache};
                memory[bloco][8:7] = shared;
              end
				  
          end
        end

      default: begin
        if(esseProc) begin
          // READ
          if(!opInstruc) begin

            // MISS
            if(tagCache != tagInstruc || estadoCache == invalid) begin
              memory[bloco] = {shared, tagBus, valorBus};
            end
				
            q = memory[bloco];
          end
        end 
       end
     endcase
   end
	
endmodule
