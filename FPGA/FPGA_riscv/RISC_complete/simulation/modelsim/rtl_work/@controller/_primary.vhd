library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        MOV             : in     vl_logic;
        ADDI            : in     vl_logic;
        SUBI            : in     vl_logic;
        LHI             : in     vl_logic;
        LLI             : in     vl_logic;
        LDR             : in     vl_logic;
        STR             : in     vl_logic;
        ADD             : in     vl_logic;
        ADC             : in     vl_logic;
        SUB             : in     vl_logic;
        SBB             : in     vl_logic;
        CMP             : in     vl_logic;
        BCC             : in     vl_logic;
        BCS             : in     vl_logic;
        BNE             : in     vl_logic;
        BEQ             : in     vl_logic;
        BAL             : in     vl_logic;
        JMP             : in     vl_logic;
        JAL_Label       : in     vl_logic;
        JAL_Rm          : in     vl_logic;
        JR              : in     vl_logic;
        OutR            : in     vl_logic;
        HLT             : in     vl_logic;
        RF_rt_addr      : out    vl_logic;
        RF_wr_en        : out    vl_logic;
        RF_wr_from      : out    vl_logic;
        Imm5or8         : out    vl_logic;
        JAL             : out    vl_logic;
        ALU_B           : out    vl_logic;
        ALU_op          : out    vl_logic;
        ALU_PSW         : out    vl_logic;
        Memory_wr_en    : out    vl_logic;
        ALU_target      : out    vl_logic_vector(1 downto 0)
    );
end Controller;
