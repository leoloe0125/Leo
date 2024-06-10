library verilog;
use verilog.vl_types.all;
entity Mux8to1_16bits is
    port(
        Din0            : in     vl_logic_vector(15 downto 0);
        Din1            : in     vl_logic_vector(15 downto 0);
        Din2            : in     vl_logic_vector(15 downto 0);
        Din3            : in     vl_logic_vector(15 downto 0);
        Din4            : in     vl_logic_vector(15 downto 0);
        Din5            : in     vl_logic_vector(15 downto 0);
        Din6            : in     vl_logic_vector(15 downto 0);
        Din7            : in     vl_logic_vector(15 downto 0);
        Control         : in     vl_logic_vector(2 downto 0);
        Dout            : out    vl_logic_vector(15 downto 0)
    );
end Mux8to1_16bits;
