library verilog;
use verilog.vl_types.all;
entity Mux2to1_16bits is
    port(
        Din0            : in     vl_logic_vector(15 downto 0);
        Din1            : in     vl_logic_vector(15 downto 0);
        Control         : in     vl_logic;
        Dout            : out    vl_logic_vector(15 downto 0)
    );
end Mux2to1_16bits;
