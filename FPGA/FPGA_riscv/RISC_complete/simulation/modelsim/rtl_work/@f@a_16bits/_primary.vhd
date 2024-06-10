library verilog;
use verilog.vl_types.all;
entity FA_16bits is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        Cin             : in     vl_logic;
        S               : out    vl_logic_vector(15 downto 0);
        Cout            : out    vl_logic_vector(16 downto 15)
    );
end FA_16bits;
