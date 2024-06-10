library verilog;
use verilog.vl_types.all;
entity Branch_unit is
    port(
        ALU_PSW         : in     vl_logic;
        BCC             : in     vl_logic;
        BCS             : in     vl_logic;
        BNE             : in     vl_logic;
        BEQ             : in     vl_logic;
        C               : in     vl_logic;
        C_in            : in     vl_logic;
        Z               : in     vl_logic;
        Z_in            : in     vl_logic;
        Branch          : out    vl_logic
    );
end Branch_unit;
