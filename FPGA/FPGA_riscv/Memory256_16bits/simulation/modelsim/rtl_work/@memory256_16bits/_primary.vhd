library verilog;
use verilog.vl_types.all;
entity Memory256_16bits is
    port(
        addr            : in     vl_logic_vector(7 downto 0);
        Din             : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        en              : in     vl_logic;
        Dout            : out    vl_logic_vector(15 downto 0)
    );
end Memory256_16bits;
