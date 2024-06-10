library verilog;
use verilog.vl_types.all;
entity Hazard_Detector is
    port(
        Inst            : in     vl_logic_vector(15 downto 0);
        Inst3           : in     vl_logic_vector(15 downto 0);
        LDR_D2          : in     vl_logic;
        JAL_Label       : in     vl_logic;
        Branch          : in     vl_logic;
        JMP             : in     vl_logic;
        JAL_Rm          : in     vl_logic;
        JR              : in     vl_logic;
        RF_wr_en_bubble_check: in     vl_logic;
        work_c          : in     vl_logic;
        Mem_wr_en_bubble_check: in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Stall           : out    vl_logic;
        bubble1         : out    vl_logic;
        bubble2         : out    vl_logic;
        RF_wr_en_D3     : out    vl_logic;
        MEM_wr_en_D3    : out    vl_logic
    );
end Hazard_Detector;
