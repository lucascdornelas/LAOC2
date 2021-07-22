library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        sinal           : in     vl_logic_vector(2 downto 0);
        A               : in     vl_logic_vector(15 downto 0);
        \Bus\           : in     vl_logic_vector(15 downto 0);
        G               : out    vl_logic_vector(15 downto 0)
    );
end ULA;
