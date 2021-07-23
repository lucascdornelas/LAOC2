library verilog;
use verilog.vl_types.all;
entity pratica2 is
    port(
        MemoryClock     : in     vl_logic;
        ProcClock       : in     vl_logic;
        Resetn          : in     vl_logic;
        Run             : in     vl_logic
    );
end pratica2;
