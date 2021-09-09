library verilog;
use verilog.vl_types.all;
entity parte1maq1 is
    generic(
        readMiss        : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        readHit         : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        writeMiss       : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        writeHit        : vl_logic_vector(0 to 1) := (Hi1, Hi1);
        invalid         : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        exclusive       : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        \shared\        : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        emptyMessage    : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        placeReadMissOnBus: vl_logic_vector(0 to 1) := (Hi0, Hi1);
        placeInvalidateOnBus: vl_logic_vector(0 to 1) := (Hi1, Hi0);
        placeWriteMissOnBus: vl_logic_vector(0 to 1) := (Hi1, Hi1);
        emptyAction     : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        writeBackBlock  : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        writeBackCacheBlock: vl_logic_vector(0 to 1) := (Hi1, Hi0)
    );
    port(
        clock           : in     vl_logic;
        counter         : in     vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of readMiss : constant is 1;
    attribute mti_svvh_generic_type of readHit : constant is 1;
    attribute mti_svvh_generic_type of writeMiss : constant is 1;
    attribute mti_svvh_generic_type of writeHit : constant is 1;
    attribute mti_svvh_generic_type of invalid : constant is 1;
    attribute mti_svvh_generic_type of exclusive : constant is 1;
    attribute mti_svvh_generic_type of \shared\ : constant is 1;
    attribute mti_svvh_generic_type of emptyMessage : constant is 1;
    attribute mti_svvh_generic_type of placeReadMissOnBus : constant is 1;
    attribute mti_svvh_generic_type of placeInvalidateOnBus : constant is 1;
    attribute mti_svvh_generic_type of placeWriteMissOnBus : constant is 1;
    attribute mti_svvh_generic_type of emptyAction : constant is 1;
    attribute mti_svvh_generic_type of writeBackBlock : constant is 1;
    attribute mti_svvh_generic_type of writeBackCacheBlock : constant is 1;
end parte1maq1;
