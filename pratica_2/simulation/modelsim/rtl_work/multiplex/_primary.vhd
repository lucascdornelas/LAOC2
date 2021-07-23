library verilog;
use verilog.vl_types.all;
entity multiplex is
    port(
        din             : in     vl_logic_vector(15 downto 0);
        R0              : in     vl_logic_vector(15 downto 0);
        R1              : in     vl_logic_vector(15 downto 0);
        R2              : in     vl_logic_vector(15 downto 0);
        R3              : in     vl_logic_vector(15 downto 0);
        R4              : in     vl_logic_vector(15 downto 0);
        R5              : in     vl_logic_vector(15 downto 0);
        R6              : in     vl_logic_vector(15 downto 0);
        R7              : in     vl_logic_vector(5 downto 0);
        g               : in     vl_logic_vector(15 downto 0);
        mem             : in     vl_logic_vector(15 downto 0);
        control         : in     vl_logic_vector(0 to 10);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end multiplex;
