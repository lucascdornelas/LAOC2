library verilog;
use verilog.vl_types.all;
entity proc is
    generic(
        mv              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        st              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        mvnz            : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        ld              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        mvi             : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        add             : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        sub             : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        orr             : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        slt             : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        \sll\           : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        \srl\           : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0)
    );
    port(
        DIN             : in     vl_logic_vector(15 downto 0);
        MemoryIn        : in     vl_logic_vector(15 downto 0);
        Resetn          : in     vl_logic;
        Clock           : in     vl_logic;
        Run             : in     vl_logic;
        Done            : out    vl_logic;
        BusWires        : out    vl_logic_vector(15 downto 0);
        PC              : out    vl_logic_vector(5 downto 0);
        addrM           : out    vl_logic_vector(15 downto 0);
        doutM           : out    vl_logic_vector(15 downto 0);
        enableMemory    : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of mv : constant is 1;
    attribute mti_svvh_generic_type of st : constant is 1;
    attribute mti_svvh_generic_type of mvnz : constant is 1;
    attribute mti_svvh_generic_type of ld : constant is 1;
    attribute mti_svvh_generic_type of mvi : constant is 1;
    attribute mti_svvh_generic_type of add : constant is 1;
    attribute mti_svvh_generic_type of sub : constant is 1;
    attribute mti_svvh_generic_type of orr : constant is 1;
    attribute mti_svvh_generic_type of slt : constant is 1;
    attribute mti_svvh_generic_type of \sll\ : constant is 1;
    attribute mti_svvh_generic_type of \srl\ : constant is 1;
end proc;
