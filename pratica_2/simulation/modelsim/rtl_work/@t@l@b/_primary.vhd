library verilog;
use verilog.vl_types.all;
entity TLB is
    port(
        address         : in     vl_logic_vector(5 downto 0);
        Clock           : in     vl_logic;
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end TLB;
