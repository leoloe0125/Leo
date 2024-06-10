library verilog;
use verilog.vl_types.all;
entity Decoder3to8 is
    port(
        Din             : in     vl_logic_vector(2 downto 0);
        en              : in     vl_logic;
        Dout            : out    vl_logic_vector(7 downto 0)
    );
end Decoder3to8;
