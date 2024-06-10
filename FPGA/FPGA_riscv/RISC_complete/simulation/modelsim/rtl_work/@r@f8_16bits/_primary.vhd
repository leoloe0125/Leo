library verilog;
use verilog.vl_types.all;
entity RF8_16bits is
    port(
        wr_data         : in     vl_logic_vector(15 downto 0);
        wr_addr         : in     vl_logic_vector(2 downto 0);
        rs_addr         : in     vl_logic_vector(2 downto 0);
        rt_addr         : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        rs              : out    vl_logic_vector(15 downto 0);
        rt              : out    vl_logic_vector(15 downto 0)
    );
end RF8_16bits;
