library verilog;
use verilog.vl_types.all;
entity Forwarding_unit is
    port(
        Inst0           : in     vl_logic_vector(10 downto 8);
        Inst1           : in     vl_logic_vector(10 downto 8);
        Inst2           : in     vl_logic_vector(10 downto 8);
        Inst3           : in     vl_logic_vector(10 downto 2);
        RF_wr_en_D1     : in     vl_logic;
        RF_wr_en        : in     vl_logic;
        RF_wr_en_for    : in     vl_logic;
        STR             : in     vl_logic;
        LHI             : in     vl_logic;
        Rs_forwarding   : out    vl_logic_vector(1 downto 0);
        Rt_forwarding   : out    vl_logic_vector(1 downto 0)
    );
end Forwarding_unit;
