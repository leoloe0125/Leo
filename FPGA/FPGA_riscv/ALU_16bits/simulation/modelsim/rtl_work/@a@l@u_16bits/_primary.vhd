library verilog;
use verilog.vl_types.all;
entity ALU_16bits is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        op              : in     vl_logic;
        S               : out    vl_logic_vector(15 downto 0);
        N               : out    vl_logic;
        Z               : out    vl_logic;
        V               : out    vl_logic;
        C               : out    vl_logic
    );
end ALU_16bits;
