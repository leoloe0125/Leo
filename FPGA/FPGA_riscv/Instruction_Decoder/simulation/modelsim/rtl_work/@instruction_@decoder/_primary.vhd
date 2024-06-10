library verilog;
use verilog.vl_types.all;
entity Instruction_Decoder is
    port(
        Inst            : in     vl_logic_vector(15 downto 0);
        MOV             : out    vl_logic;
        ADDI            : out    vl_logic;
        SUBI            : out    vl_logic;
        LHI             : out    vl_logic;
        LLI             : out    vl_logic;
        LDR             : out    vl_logic;
        STR             : out    vl_logic;
        ADD             : out    vl_logic;
        ADC             : out    vl_logic;
        SUB             : out    vl_logic;
        SBB             : out    vl_logic;
        CMP             : out    vl_logic;
        BCC             : out    vl_logic;
        BCS             : out    vl_logic;
        BNE             : out    vl_logic;
        BEQ             : out    vl_logic;
        BAL             : out    vl_logic;
        JMP             : out    vl_logic;
        JAL_Label       : out    vl_logic;
        JAL_Rm          : out    vl_logic;
        JR              : out    vl_logic;
        OutR            : out    vl_logic;
        HLT             : out    vl_logic
    );
end Instruction_Decoder;
