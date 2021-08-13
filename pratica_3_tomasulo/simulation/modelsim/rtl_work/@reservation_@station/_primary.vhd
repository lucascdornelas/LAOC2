library verilog;
use verilog.vl_types.all;
entity Reservation_Station is
    port(
        instruction     : in     vl_logic_vector(15 downto 0);
        Clock           : in     vl_logic;
        Adderin         : in     vl_logic;
        Reg1            : in     vl_logic_vector(15 downto 0);
        Reg2            : in     vl_logic_vector(15 downto 0);
        Reg3            : in     vl_logic_vector(15 downto 0);
        Reg4            : in     vl_logic_vector(15 downto 0);
        Reg5            : in     vl_logic_vector(15 downto 0);
        Reg6            : in     vl_logic_vector(15 downto 0);
        instOutEnable   : out    vl_logic;
        instOut         : out    vl_logic_vector(15 downto 0);
        d               : out    vl_logic;
        dout            : out    vl_logic_vector(15 downto 0);
        disponivel      : out    vl_logic;
        dInst           : out    vl_logic_vector(15 downto 0)
    );
end Reservation_Station;
