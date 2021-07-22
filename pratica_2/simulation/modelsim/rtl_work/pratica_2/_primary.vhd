library verilog;
use verilog.vl_types.all;
entity pratica_2 is
    port(
        MClock          : in     vl_logic;
        PClock          : in     vl_logic;
        Resetn          : in     vl_logic;
        Run             : in     vl_logic
    );
end pratica_2;
