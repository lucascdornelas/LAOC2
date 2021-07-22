library verilog;
use verilog.vl_types.all;
entity instructionFetch is
    port(
        addr            : in     vl_logic_vector(5 downto 0);
        MClock          : in     vl_logic;
        DIN             : out    vl_logic_vector(15 downto 0)
    );
end instructionFetch;
