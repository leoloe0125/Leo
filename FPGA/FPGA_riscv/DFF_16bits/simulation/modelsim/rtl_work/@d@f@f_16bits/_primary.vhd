library verilog;
use verilog.vl_types.all;
entity DFF_16bits is
    port(
        Din             : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        en              : in     vl_logic;
        rst             : in     vl_logic;
        Dout            : out    vl_logic_vector(15 downto 0)
    );
end DFF_16bits;
