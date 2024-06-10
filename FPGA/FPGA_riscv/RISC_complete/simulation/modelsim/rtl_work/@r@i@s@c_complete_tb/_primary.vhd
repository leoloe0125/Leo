library verilog;
use verilog.vl_types.all;
entity RISC_complete_tb is
    generic(
        clk_period      : integer := 30;
        delay_factor    : integer := 2
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of clk_period : constant is 1;
    attribute mti_svvh_generic_type of delay_factor : constant is 1;
end RISC_complete_tb;
