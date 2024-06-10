library verilog;
use verilog.vl_types.all;
entity RISC_complete is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        test_normal     : in     vl_logic;
        done            : out    vl_logic;
        ext_inst_we     : in     vl_logic;
        ext_data_we     : in     vl_logic;
        ext_data        : in     vl_logic_vector(15 downto 0);
        ext_addr        : in     vl_logic_vector(15 downto 0);
        mem_out         : out    vl_logic_vector(15 downto 0);
        OutR            : out    vl_logic_vector(15 downto 0)
    );
end RISC_complete;
