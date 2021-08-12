module pratica_3_tomasulo(clock, Reset, Run);
 input clock, Reset, Run;
 
 CDB cdb (clock, Reset, Run);
endmodule