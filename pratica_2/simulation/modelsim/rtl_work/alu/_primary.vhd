library verilog;
use verilog.vl_types.all;
entity alu is
    generic(
        add             : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        sub             : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        orr             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        slt             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        \sll\           : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        \srl\           : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1)
    );
    port(
        control         : in     vl_logic_vector(2 downto 0);
        A               : in     vl_logic_vector(15 downto 0);
        \Bus\           : in     vl_logic_vector(15 downto 0);
        G               : out    vl_logic_vector(15 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of add : constant is 1;
    attribute mti_svvh_generic_type of sub : constant is 1;
    attribute mti_svvh_generic_type of orr : constant is 1;
    attribute mti_svvh_generic_type of slt : constant is 1;
    attribute mti_svvh_generic_type of \sll\ : constant is 1;
    attribute mti_svvh_generic_type of \srl\ : constant is 1;
end alu;
