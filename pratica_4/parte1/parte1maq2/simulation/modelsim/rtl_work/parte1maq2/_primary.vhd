library verilog;
use verilog.vl_types.all;
entity parte1maq2 is
    generic(
        readMiss        : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        invalidate      : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        writeMiss       : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        invalid         : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        exclusive       : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        \shared\        : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        empty           : vl_logic := Hi0;
        writeBackBlockAbortMemoryAccess: vl_logic := Hi1
    );
    port(
        clock           : in     vl_logic;
        counter         : in     vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of readMiss : constant is 1;
    attribute mti_svvh_generic_type of invalidate : constant is 1;
    attribute mti_svvh_generic_type of writeMiss : constant is 1;
    attribute mti_svvh_generic_type of invalid : constant is 1;
    attribute mti_svvh_generic_type of exclusive : constant is 1;
    attribute mti_svvh_generic_type of \shared\ : constant is 1;
    attribute mti_svvh_generic_type of empty : constant is 1;
    attribute mti_svvh_generic_type of writeBackBlockAbortMemoryAccess : constant is 1;
end parte1maq2;
