library verilog;
use verilog.vl_types.all;
entity Memory32_8bits is
    port(
        addr            : in     vl_logic_vector(4 downto 0);
        clk             : in     vl_logic;
        Din             : in     vl_logic_vector(7 downto 0);
        en              : in     vl_logic;
        Dout            : out    vl_logic_vector(7 downto 0)
    );
end Memory32_8bits;
