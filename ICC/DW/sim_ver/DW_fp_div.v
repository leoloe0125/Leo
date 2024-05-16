
////////////////////////////////////////////////////////////////////////////////
//
//       This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 2006 - 2023 SYNOPSYS INC.
//                           ALL RIGHTS RESERVED
//
//       The entire notice above must be reproduced on all authorized
//     copies.
//
// AUTHOR:    Kyung-Nam Han, Mar. 22, 2006
//
// VERSION:   Verilog Simulation Model for DW_fp_div
//
// DesignWare_version: 47b2176d
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////

//-------------------------------------------------------------------------------
//
// ABSTRACT: Floating-Point Divider
//
//              DW_fp_div calculates the floating-point division
//              while supporting six rounding modes, including four IEEE
//              standard rounding modes.
//
//              parameters      valid values (defined in the DW manual)
//              ==========      ============
//              sig_width       significand size,  2 to 253 bits
//              exp_width       exponent size,     3 to 31 bits
//              ieee_compliance support the IEEE Compliance 
//                              0 - IEEE 754 compatible without denormal support
//                                  (NaN becomes Infinity, Denormal becomes Zero)
//                              1 - IEEE 754 compatible with denormal support
//                                  (NaN and denormal numbers are supported)
//				2 - Reserved for future use
//                              3 - Use denormals and comply with IEEE 754 standard for NaNs
//              faithful_round  select the faithful_rounding that admits 1 ulp error
//                              0 - default value. it keeps all rounding modes
//                              1 - z has 1 ulp error. RND input does not affect
//                                  the output
//              en_ubr_flag     Enable UBR (underflow before rounding) flag
//                              0 or 1 (default 0)
//                              0 - the flag is always zero
//                              1 - the flag indicates underflow before rounding
//
//              Input ports     Size & Description
//              ===========     ==================
//              a               (sig_width + exp_width + 1)-bits
//                              Floating-point Number Input
//              b               (sig_width + exp_width + 1)-bits
//                              Floating-point Number Input
//              rnd             3 bits
//                              Rounding Mode Input
//
//              Output ports    Size & Description
//              ============    ==================
//              z               (sig_width + exp_width + 1)-bits
//                              Floating-point Number Output
//              status          8 bits
//                              Status Flags Output
//

// MODIFIED: 
//
// 5/7/2007 (0703-SP2)    : Fixed the rounding error of denormal numbers when
//                          ieee_compliance = 1
// 10/18/2007 (0712)      : Fixed the 'divide by zero' flag when 0/0 
// 1/2/2008 (0712-SP1)    : New parameter, faithful_round, is introduced
// 6/4/2010 (2010.03-SP3) : Removed VCS error [IRIPS] when sig_width = 2 and 3.
// 3/31/2017 (2016.12-SP3): STAR 9001167381
//                          Fix of output z between zero and minnorm issue
// 6/15/2017 (2016.12-SP5): Fix of STAR 9001189734 and 9001210054
// 5/01/2018 (2018.06)    : Modification for the full parameter coverage
//                          at each implementation.
// 8/1/2019 (2019.03-SP4) : Fix of STAR 9001538974
// 12/19/2019 AFT         : Fix multiple issues related to faithful_round=1, 
//                          mostly related to TINY flag as reported in STAR 9001563922
// 05/15/2020 RJK         : Updated for STAR 9001514809 (Jira issue P80002116-640)
//                          for consistency in warning messages and control over
//                          such messages by replacing hard coded round function,
//                          RND_eval with an included file used by other FP 
//                          components.  This will allow a common file to control
//                          this behavior in case future adjustments are needed.
// 02/10/2020 TAWALBEH    : Added ieee_compliance = 3 functionality; NaN representation
//                          to match DWFC components, and warning messages when "rnd"  
//                          value equals '4' or '5'.
// 3/22/2021  RJK         : Addressed STAR 3625874 involving accepting the value
//                          on the 'rnd' input at time 0
// 1/18/2022  AFT         : STAR 3928902
// 2/27/2023  AFT         : STAR 3638931 - update the
//                          TINY flag behavior, based on more recent
//                          definition. The new behavior is controlled by a 
//                          parameter.
//
//-----------------------------------------------------------------------------
module DW_fp_div (a, b, rnd, z, status);

  parameter integer sig_width = 23;      // range 2 to 253
  parameter integer exp_width = 8;       // range 3 to 31
  parameter integer ieee_compliance = 0; // range 0 to 1
  parameter integer faithful_round = 0;  // range 0 to 1
  parameter integer en_ubr_flag = 0;     // range 0 to 1

  input  [sig_width + exp_width:0] a;
  input  [sig_width + exp_width:0] b;
  input  [2:0] rnd;
  output [sig_width + exp_width:0] z;
  output [7:0] status;

  // synopsys translate_off






  localparam OIIlOlO1 = (faithful_round == 1) && (sig_width >= 11) && (sig_width <= 57);

  //-------------------------------------------------------------------------
  // parameter legality check
  //-------------------------------------------------------------------------
    
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    
      
    if ( (sig_width < 2) || (sig_width > 253) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter sig_width (legal range: 2 to 253)",
	sig_width );
    end
      
    if ( (exp_width < 3) || (exp_width > 31) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter exp_width (legal range: 3 to 31)",
	exp_width );
    end
      
    if ( (ieee_compliance==2) || (ieee_compliance<0) || (ieee_compliance>3) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m : Illegal value of ieee_compliance. ieee_compliance must be 0, 1, or 3" );
    end
      
    if ( (faithful_round < 0) || (faithful_round > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter faithful_round (legal range: 0 to 1)",
	faithful_round );
    end
      
    if ( (en_ubr_flag < 0) || (en_ubr_flag > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter en_ubr_flag (legal range: 0 to 1)",
	en_ubr_flag );
    end
    
    if ( param_err_flg == 1) begin
      $display(
        "%m :\n  Simulation aborted due to invalid parameter value(s)");
      $finish;
    end

  end // parameter_check 

  //-------------------------------------------------------------------------


function [4-1:0] RND_eval;

  input [2:0] RND;
  input [0:0] Sign;
  input [0:0] L,R,STK;


  begin
  RND_eval[0] = 0;
  RND_eval[1] = R|STK;
  RND_eval[2] = 0;
  RND_eval[3] = 0;
  case (RND)
    3'b000:
    begin
      RND_eval[0] = R&(L|STK);
      RND_eval[2] = 1;
      RND_eval[3] = 0;
    end
    3'b001:
    begin
      RND_eval[0] = 0;
      RND_eval[2] = 0;
      RND_eval[3] = 0;
    end
    3'b010:
    begin
      RND_eval[0] = ~Sign & (R|STK);
      RND_eval[2] = ~Sign;
      RND_eval[3] = ~Sign;
    end
    3'b011:
    begin
      RND_eval[0] = Sign & (R|STK);
      RND_eval[2] = Sign;
      RND_eval[3] = Sign;
    end
    3'b100:
    begin
      RND_eval[0] = R;
      RND_eval[2] = 1;
      RND_eval[3] = 0;
    end
    3'b101:
    begin
      RND_eval[0] = R|STK;
      RND_eval[2] = 1;
      RND_eval[3] = 1;
    end
    default:
    begin
`ifndef DW_SUPPRESS_WARN
      if ($time > 0) begin
        $display ("WARNING: %m:\\n at time = %0t: Illegal rounding mode.", $time);
      end
`endif
    end
  endcase
  end

endfunction


  reg [(exp_width + sig_width):0] lOOOII1l;
  reg [exp_width-1:0] I11110O0,I0O0O0OO;
  reg signed [((exp_width <= 29) ? (((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>65536)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16777216)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>268435456)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>536870912)?30:29):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>67108864)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>134217728)?28:27):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>33554432)?26:25))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>1048576)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4194304)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8388608)?24:23):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2097152)?22:21)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>262144)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>524288)?20:19):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>131072)?18:17)))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>256)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4096)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16384)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>32768)?16:15):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8192)?14:13)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>1024)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2048)?12:11):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>512)?10:9))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>64)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>128)?8:7):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>32)?6:5)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8)?4:3):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2)?2:1))))) + 1 : exp_width + ((sig_width>65536)?((sig_width>16777216)?((sig_width>268435456)?((sig_width>536870912)?30:29):((sig_width>67108864)?((sig_width>134217728)?28:27):((sig_width>33554432)?26:25))):((sig_width>1048576)?((sig_width>4194304)?((sig_width>8388608)?24:23):((sig_width>2097152)?22:21)):((sig_width>262144)?((sig_width>524288)?20:19):((sig_width>131072)?18:17)))):((sig_width>256)?((sig_width>4096)?((sig_width>16384)?((sig_width>32768)?16:15):((sig_width>8192)?14:13)):((sig_width>1024)?((sig_width>2048)?12:11):((sig_width>512)?10:9))):((sig_width>16)?((sig_width>64)?((sig_width>128)?8:7):((sig_width>32)?6:5)):((sig_width>4)?((sig_width>8)?4:3):((sig_width>2)?2:1))))) + 2) - 1:0] IO1l1lO0;
  reg signed [((exp_width <= 29) ? (((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>65536)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16777216)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>268435456)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>536870912)?30:29):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>67108864)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>134217728)?28:27):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>33554432)?26:25))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>1048576)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4194304)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8388608)?24:23):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2097152)?22:21)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>262144)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>524288)?20:19):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>131072)?18:17)))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>256)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4096)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16384)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>32768)?16:15):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8192)?14:13)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>1024)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2048)?12:11):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>512)?10:9))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>64)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>128)?8:7):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>32)?6:5)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8)?4:3):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2)?2:1))))) + 1 : exp_width + ((sig_width>65536)?((sig_width>16777216)?((sig_width>268435456)?((sig_width>536870912)?30:29):((sig_width>67108864)?((sig_width>134217728)?28:27):((sig_width>33554432)?26:25))):((sig_width>1048576)?((sig_width>4194304)?((sig_width>8388608)?24:23):((sig_width>2097152)?22:21)):((sig_width>262144)?((sig_width>524288)?20:19):((sig_width>131072)?18:17)))):((sig_width>256)?((sig_width>4096)?((sig_width>16384)?((sig_width>32768)?16:15):((sig_width>8192)?14:13)):((sig_width>1024)?((sig_width>2048)?12:11):((sig_width>512)?10:9))):((sig_width>16)?((sig_width>64)?((sig_width>128)?8:7):((sig_width>32)?6:5)):((sig_width>4)?((sig_width>8)?4:3):((sig_width>2)?2:1))))) + 2) - 1:0] IOOIlI0I;
  reg l1l1O100;
  reg lO101111;
  reg [exp_width+1:0] lI00O00I;
  reg signed [((exp_width <= 29) ? (((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>65536)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16777216)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>268435456)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>536870912)?30:29):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>67108864)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>134217728)?28:27):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>33554432)?26:25))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>1048576)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4194304)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8388608)?24:23):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2097152)?22:21)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>262144)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>524288)?20:19):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>131072)?18:17)))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>256)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4096)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16384)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>32768)?16:15):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8192)?14:13)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>1024)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2048)?12:11):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>512)?10:9))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>64)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>128)?8:7):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>32)?6:5)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8)?4:3):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2)?2:1))))) + 1 : exp_width + ((sig_width>65536)?((sig_width>16777216)?((sig_width>268435456)?((sig_width>536870912)?30:29):((sig_width>67108864)?((sig_width>134217728)?28:27):((sig_width>33554432)?26:25))):((sig_width>1048576)?((sig_width>4194304)?((sig_width>8388608)?24:23):((sig_width>2097152)?22:21)):((sig_width>262144)?((sig_width>524288)?20:19):((sig_width>131072)?18:17)))):((sig_width>256)?((sig_width>4096)?((sig_width>16384)?((sig_width>32768)?16:15):((sig_width>8192)?14:13)):((sig_width>1024)?((sig_width>2048)?12:11):((sig_width>512)?10:9))):((sig_width>16)?((sig_width>64)?((sig_width>128)?8:7):((sig_width>32)?6:5)):((sig_width>4)?((sig_width>8)?4:3):((sig_width>2)?2:1))))) + 2) - 1:0] IOO1O01O;
  reg O10101O1;
  reg [sig_width:0] I1O1O11O,lO1O0OI1,IO10IOO1,l10OO10O,OlOO00lO;
  reg [sig_width+2:0] OOIl0010;
  reg [sig_width:0] IOOl0lII;
  reg [(2 * sig_width + 2)  :0] l11Illl0;
  reg [sig_width:0] lO001Ol0;
  reg I0OI1lO0,IOIlII10;
  reg [1:0] O10110O1;
  reg [4-1:0] O011IOO0;
  reg [8    -1:0] I101O11O;
  reg [(exp_width + sig_width):0] lO011100;
  reg [(exp_width + sig_width):0] I11IO1I1;
  reg OO000O0O;
  reg O00OO1I0;
  reg IIl1O10O;
  reg I00lIO1l;
  reg lOI111I1;
  reg O100O11l;
  reg l10OO1I0;
  reg l1O1Ol0O;
  reg I000lO00;
  reg l1OllI0I;
  reg [sig_width - 1:0] lO00I10I;
  reg [sig_width - 1:0] IIIl11O1;
  reg [7:0] OOO111OO;
  reg [7:0] l000I1O0;
  reg signed [((exp_width <= 29) ? (((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>65536)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16777216)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>268435456)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>536870912)?30:29):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>67108864)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>134217728)?28:27):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>33554432)?26:25))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>1048576)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4194304)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8388608)?24:23):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2097152)?22:21)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>262144)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>524288)?20:19):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>131072)?18:17)))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>256)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4096)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16384)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>32768)?16:15):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8192)?14:13)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>1024)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2048)?12:11):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>512)?10:9))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>64)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>128)?8:7):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>32)?6:5)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8)?4:3):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2)?2:1))))) + 1 : exp_width + ((sig_width>65536)?((sig_width>16777216)?((sig_width>268435456)?((sig_width>536870912)?30:29):((sig_width>67108864)?((sig_width>134217728)?28:27):((sig_width>33554432)?26:25))):((sig_width>1048576)?((sig_width>4194304)?((sig_width>8388608)?24:23):((sig_width>2097152)?22:21)):((sig_width>262144)?((sig_width>524288)?20:19):((sig_width>131072)?18:17)))):((sig_width>256)?((sig_width>4096)?((sig_width>16384)?((sig_width>32768)?16:15):((sig_width>8192)?14:13)):((sig_width>1024)?((sig_width>2048)?12:11):((sig_width>512)?10:9))):((sig_width>16)?((sig_width>64)?((sig_width>128)?8:7):((sig_width>32)?6:5)):((sig_width>4)?((sig_width>8)?4:3):((sig_width>2)?2:1))))) + 2) - 1:0] O00O1Ol1;
  reg [sig_width:0] II01O1O0;
  reg [sig_width:0] OIIO0OOl;
  reg [sig_width:0] l0III011;
  reg [8:0] OO0lIO1O;
  reg [8:0] II0IIO1O;
  reg [9:0] O1lO00O0;
  reg [sig_width + 9:0] I0I0Il0O;
  reg l110l11I;
  reg [8:0] IO00O1O1;
  reg [sig_width + 9:0] IOOlIOOO;
  reg [sig_width + 1:0] OOI10OIO;
  reg [(2 * (sig_width - 3)) - 1:0] l0IO1lOO;
  reg [sig_width + 3:0] OO0OO1I0;
  reg [sig_width + 3:0] O00OI010;
  reg [sig_width + 3:0] IOIlOO00;
  reg O0O0IIII;
  reg [sig_width + 3:0] II11llO0;
  reg [((sig_width >= 11) ? 2 * sig_width - 21 : 0):0] l0101100;
  reg [((sig_width >= 11) ? sig_width - 11 : 0):0] l0I1OOll;
  reg [((sig_width >= 11) ? 2 * sig_width - 21 : 0):0] OIlI10I1;
  reg [sig_width + 3:0] Ol1O10O0;
  reg O1l11OIO;
  reg [sig_width + 3:0] Il101Il1;
  reg [((sig_width >= 25) ? sig_width - 25 : 0):0] IOll10OO;
  reg [((sig_width >= 24) ? 2 * sig_width - 47 : 0):0] O0l0O011;
  reg [((sig_width >= 24) ? 2 * sig_width - 47 : 0):0] OOO01OO1;
  reg [((sig_width >= 25) ? sig_width - 25 : 0):0] O0O1011O;
  reg [sig_width + 3:0] llOO0II1;
  reg O010I0IO;
  reg [sig_width + 3:0] OOOl110I;
  reg [8:0] O00O00O1;
  reg [sig_width + 3:0] lI100I0I;
  reg [sig_width + 3:0] I10l01Il;
  reg [sig_width + 3:0] O1O0011O;
  reg [8:8 - sig_width] O1O1O01l;
  reg [sig_width:0] l0I1OI0l;
  reg [sig_width:0] IIOI0lOO;
  reg [sig_width:0] O11OOOOl;
  reg [sig_width:0] OO1110O0;
  reg I01II0I0;
  reg IOIOI010;
  reg IOO101lO;
  reg OlIlOOIO;
  reg [((sig_width >= 25) ? sig_width - 23 + 0 : 0) - 1:0] I010IlI0;
  reg [(2 * ((sig_width >= 25) ? sig_width - 23 + 0 : 0)) - 1:0] I11OIl0O;
  reg [((((sig_width >= 25) ? 2 * sig_width - 47 : 0) + 2 * 0) - (((sig_width >= 25) ? sig_width - 23 : 0) + 2 * 0 - 0) + 1) - 1:0] Ol01O010;
  reg [(((sig_width >= 25) ? sig_width + 3 : 0) - (((sig_width >= 25) ? 27 : 0) - 0) + 1) - 1:0] Ol011lO0;
  reg [(((((sig_width >= 25) ? 2 * sig_width - 47 : 0) + 2 * 0) - (((sig_width >= 25) ? sig_width - 23 : 0) + 2 * 0 - 0) + 1) + (((sig_width >= 25) ? sig_width + 3 : 0) - (((sig_width >= 25) ? 27 : 0) - 0) + 1)) - 1:0] I11OOI1O;
  reg [(sig_width - 24) - 1:0] I110OIOO;
  reg [(((sig_width >= 11) ? sig_width + 1 : 0) - (((sig_width >= 11) ? 12 : 0) - 0) + 1) - 1:0] O0OOIl0l;
  reg [(2 * (((sig_width >= 11) ? sig_width + 1 : 0) - (((sig_width >= 11) ? 12 : 0) - 0) + 1)) - 1:0] lI0I111I;
  reg [((((sig_width >= 11) ? 2 * sig_width - 21 : 0) + 2 * 0) - (((sig_width >= 11) ? sig_width - 10 : 0) + 2 * 0) + 1 + 0) - 1:0] O10I0O00;
  reg [(((sig_width >= 11) ? sig_width + 3 : 0) - ((sig_width >= 11) ? 14 : 0) + 1) - 1:0] O100101I;
  reg [((((sig_width >= 11) ? sig_width + 3 : 0) - ((sig_width >= 11) ? 14 : 0) + 1) + ((((sig_width >= 11) ? 2 * sig_width - 21 : 0) + 2 * 0) - (((sig_width >= 11) ? sig_width - 10 : 0) + 2 * 0) + 1 + 0)) - 1:0] O0OI1IO1;
  reg [(2 * ((sig_width - 3) + 3)) - 1:0] lI1I01Ol;
  reg [(sig_width + 4 + 3) - 1:0] I0l1O011;
  reg [(sig_width + 4 + 3) - 1:0] l0OOOIll;
  reg [(sig_width + 4 + 3) - 1:0] lO0110ll;
  reg [sig_width+1:0] IO0I1O10;
  reg [sig_width+1:0] O101OOOO;



  always @(a or b or rnd) begin : I10OIO10_PROC
    IOIlII10 = a[(exp_width + sig_width)] ^ b[(exp_width + sig_width)];
    I11110O0 = a[((exp_width + sig_width) - 1):sig_width];
    I0O0O0OO = b[((exp_width + sig_width) - 1):sig_width];
    lO00I10I = a[(sig_width - 1):0];
    IIIl11O1 = b[(sig_width - 1):0];
    OOO111OO = 0;
    l000I1O0 = 0;
    IOOl0lII = 0;
    IO0I1O10 = {sig_width+2{1'b1}};
    O101OOOO = {{sig_width+1{1'b1}},1'b0};

    I101O11O = 0;

    // division table for special inputs
    //
    //  -------------------------------------------------
    //         a      /       b      |       result
    //  -------------------------------------------------
    //        nan     |      any     |        nan
    //        any     |      nan     |        nan
    //        inf     |      inf     |        nan
    //         0      |       0      |        nan
    //        inf     |      any     |        inf
    //        any     |       0      |        inf
    //         0      |      any     |         0
    //        any     |      inf     |         0
    //  -------------------------------------------------
    // when ieee_compliance = 0, 
    // denormal numbers are considered as zero and 
    // nans are considered as infinity

    if ( ((ieee_compliance == 1) || (ieee_compliance == 3)) )
    begin
      OO000O0O = (I11110O0 == ((((1 << (exp_width-1)) - 1) * 2) + 1)) & (lO00I10I == 0);
      O00OO1I0 = (I0O0O0OO == ((((1 << (exp_width-1)) - 1) * 2) + 1)) & (IIIl11O1 == 0);
      IIl1O10O = (I11110O0 == ((((1 << (exp_width-1)) - 1) * 2) + 1)) & (lO00I10I != 0);
      I00lIO1l = (I0O0O0OO == ((((1 << (exp_width-1)) - 1) * 2) + 1)) & (IIIl11O1 != 0);
      lOI111I1 = (I11110O0 == 0) & (lO00I10I == 0);
      O100O11l = (I0O0O0OO == 0) & (IIIl11O1 == 0);
      l10OO1I0 = (I11110O0 == 0) & (lO00I10I != 0);
      l1O1Ol0O = (I0O0O0OO == 0) & (IIIl11O1 != 0);

      lO011100 = {IOIlII10, {(exp_width){1'b1}}, {(sig_width){1'b0}}}; 
      I11IO1I1 = {1'b0, {(exp_width){1'b1}}, {(sig_width - 1){1'b0}}, 1'b1};

         if (ieee_compliance == 3) 
           begin    
	    I11IO1I1 = {1'b0, {(exp_width){1'b1}}, 1'b1, {(sig_width - 1){1'b0}} }; 	    
	  end
    end 
    else
    begin
      OO000O0O = (I11110O0 == ((((1 << (exp_width-1)) - 1) * 2) + 1));
      O00OO1I0 = (I0O0O0OO == ((((1 << (exp_width-1)) - 1) * 2) + 1));
      IIl1O10O = 0;
      I00lIO1l = 0;
      lOI111I1 = (I11110O0 == 0);
      O100O11l = (I0O0O0OO == 0);
      l10OO1I0 = 0;
      l1O1Ol0O = 0;

      lO011100 = {IOIlII10, {(exp_width){1'b1}}, {(sig_width){1'b0}}};
      I11IO1I1 = {1'b0, {(exp_width){1'b1}}, {(sig_width){1'b0}}};
    end

    I101O11O[7] = ( ((ieee_compliance == 1) || (ieee_compliance == 3)) ) ?
            O100O11l & ~(lOI111I1 | IIl1O10O | OO000O0O) :
            O100O11l & ~(lOI111I1 | IIl1O10O); 

    if (IIl1O10O || I00lIO1l || (OO000O0O && O00OO1I0) || (lOI111I1 && O100O11l)) begin : DW_OIOlIO00
      lOOOII1l = I11IO1I1;
      I101O11O[2] = 1;
    end
    else if (OO000O0O || O100O11l) begin : DW_O1OO11I0
      lOOOII1l = lO011100;
      I101O11O[1] = 1;
    end
    else if (lOI111I1 || O00OO1I0) begin : DW_lO0IO11l
      I101O11O[0] = 1;
      lOOOII1l = 0;
      lOOOII1l[(exp_width + sig_width)] = IOIlII10;
    end
  
    else begin : DW_OOOOlOI0
      if ( ((ieee_compliance == 1) || (ieee_compliance == 3)) ) begin
        if (l10OO1I0) begin
          I1O1O11O = {1'b0, a[(sig_width - 1):0]};

          while(I1O1O11O[sig_width] != 1) begin
            I1O1O11O = I1O1O11O << 1;
            OOO111OO = OOO111OO + 1;
          end
        end 
        else begin
          I1O1O11O = {1'b1, a[(sig_width - 1):0]};
        end

        if (l1O1Ol0O) begin
          lO1O0OI1 = {1'b0, b[(sig_width - 1):0]};
          while(lO1O0OI1[sig_width] != 1) begin
            lO1O0OI1 = lO1O0OI1 << 1;
            l000I1O0 = l000I1O0 + 1;
          end
        end 
        else begin
          lO1O0OI1 = {1'b1, b[(sig_width - 1):0]};
        end
      end
      else begin
        I1O1O11O = {1'b1, a[(sig_width - 1):0]};
        lO1O0OI1 = {1'b1, b[(sig_width - 1):0]};
      end

      IOO101lO = (I1O1O11O == lO1O0OI1);
      OlIlOOIO = (lO1O0OI1[sig_width - 1:0] == 0);
      II01O1O0 = I1O1O11O;
      OIIO0OOl = ( ((ieee_compliance == 1) || (ieee_compliance == 3)) ) ? lO1O0OI1 : {1'b1, IIIl11O1};
      l0III011 = (OIIlOlO1) ? OIIO0OOl : {OIIO0OOl, 1'b0};
      OO0lIO1O = (sig_width >= 9) ? l0III011[sig_width - 1:((sig_width >= 9) ? sig_width - 9 : 0)] : {l0III011[sig_width - 1:0], {(((sig_width >= 9) ? 1 : 9 - sig_width)){1'b0}}};
      O1lO00O0 = {1'b1, OO0lIO1O[8:0]};
      II0IIO1O = {1'b1, 18'b0} / (O1lO00O0 + 1);
      I0I0Il0O = II0IIO1O * II01O1O0;
      l110l11I = I0I0Il0O[sig_width + 9];
      IO00O1O1 = (l110l11I) ? I0I0Il0O[sig_width + 9:sig_width + 1] : I0I0Il0O[sig_width + 8:sig_width];
      IOOlIOOO = l0III011 * II0IIO1O;
      OOI10OIO = ~IOOlIOOO[sig_width + 1:0];

      lI1I01Ol = I0I0Il0O[(sig_width + 10) - 1:(sig_width + 10) - (sig_width - 3) - 3] *
                OOI10OIO[(sig_width + 2) - 1:(sig_width + 2) - (sig_width - 3) - 3];
      I0l1O011 = {7'b0, lI1I01Ol[(2 * ((sig_width - 3) + 3)) - 1:(2 * ((sig_width - 3) + 3)) - (sig_width + 4 + 3) + 7]};
      l0OOOIll = I0I0Il0O[(sig_width + 10) - 1:(sig_width + 10) - (sig_width + 4 + 3)];
      lO0110ll = l0OOOIll + I0l1O011;

      l0IO1lOO = (sig_width <= 8) ? 0 :
               I0I0Il0O[sig_width + 9:((sig_width <= 8) ? 0 : sig_width + 9 - (sig_width - 3) + 1)] * 
               OOI10OIO[sig_width + 1:((sig_width <= 8) ? 0 : sig_width + 1 - (sig_width - 3) + 1)];
      O00OI010 = (sig_width <= 8) ? 0 :
               {6'b0, l0IO1lOO[((sig_width == 3) ? 0 : (2 * (sig_width - 3)) - 1):(2 * (sig_width - 3)) - 1 - sig_width + 5 - 1]};
      OO0OO1I0 = I0I0Il0O[sig_width + 9:6];
      IOIlOO00 = OO0OO1I0 + O00OI010;
      O0O0IIII = IOIlOO00[sig_width + 3];
      II11llO0 = ((sig_width >= 14)) ?
             lO0110ll[(sig_width + 4 + 3) - 1:(sig_width + 4 + 3) - (sig_width + 4)] :
             ((O0O0IIII) ? IOIlOO00 : {IOIlOO00[sig_width + 2:0], 1'b0});

      O0OOIl0l = OOI10OIO[((sig_width >= 11) ? sig_width + 1 : 0):(((sig_width >= 11) ? 12 : 0) - 0)];
      l0101100 = (sig_width >= 11) ? OOI10OIO[((sig_width >= 11) ? sig_width + 1 : 0):((sig_width >= 11) ? 12 : 0)] * OOI10OIO[((sig_width >= 11) ? sig_width + 1 : 0):((sig_width >= 11) ? 12 : 0)] : 0;
      l0I1OOll = (sig_width >= 11) ? l0101100[((sig_width >= 11) ? 2 * sig_width - 21 : 0):((sig_width >= 11) ? sig_width - 10 : 0)] : 0;
      OIlI10I1 = (sig_width >= 11) ? II11llO0[((sig_width >= 11) ? sig_width + 3 : 0):((sig_width >= 11) ? 14 : 0)] * l0I1OOll : 0;

      Ol1O10O0 = II11llO0 + OIlI10I1[((sig_width >= 11) ? 2 * sig_width - 21 : 0):((sig_width >= 11) ? sig_width - 10 : 0)];
      O1l11OIO = Ol1O10O0[sig_width + 3];
      Il101Il1 = (sig_width <= 28) ? 
             ((O1l11OIO) ? Ol1O10O0 : {Ol1O10O0[sig_width + 2:0], 1'b0}) :
             Ol1O10O0;

      I010IlI0 = O10I0O00[((sig_width == 53)? ((((sig_width >= 11) ? 2 * sig_width - 21 : 0) + 2 * 0) - (((sig_width >= 11) ? sig_width - 10 : 0) + 2 * 0) + 1 + 0) - 1:0):((sig_width == 53)? ((((sig_width >= 11) ? 2 * sig_width - 21 : 0) + 2 * 0) - (((sig_width >= 11) ? sig_width - 10 : 0) + 2 * 0) + 1 + 0) - ((sig_width >= 25) ? sig_width - 23 + 0 : 0):0)];

      I11OIl0O = I010IlI0 * I010IlI0; 
      Ol01O010 = I11OIl0O[(((sig_width >= 25) ? 2 * sig_width - 47 : 0) + 2 * 0):(((sig_width >= 25) ? sig_width - 23 : 0) + 2 * 0 - 0)];
      Ol011lO0 = Il101Il1[((sig_width >= 25) ? sig_width + 3 : 0):(((sig_width >= 25) ? 27 : 0) - 0)];
      I11OOI1O = Ol011lO0 * Ol01O010;
      I110OIOO = I11OOI1O[((sig_width == 53) ? (((((sig_width >= 25) ? 2 * sig_width - 47 : 0) + 2 * 0) - (((sig_width >= 25) ? sig_width - 23 : 0) + 2 * 0 - 0) + 1) + (((sig_width >= 25) ? sig_width + 3 : 0) - (((sig_width >= 25) ? 27 : 0) - 0) + 1)) - 1:0):((sig_width == 53) ? ((sig_width == 53) ? (((((sig_width >= 25) ? 2 * sig_width - 47 : 0) + 2 * 0) - (((sig_width >= 25) ? sig_width - 23 : 0) + 2 * 0 - 0) + 1) + (((sig_width >= 25) ? sig_width + 3 : 0) - (((sig_width >= 25) ? 27 : 0) - 0) + 1)) - 1:0) - (sig_width - 24) + 1:0)];

      IOll10OO = (sig_width >= 25) ? l0I1OOll[((sig_width >= 25) ? sig_width - 11 : 0):((sig_width >= 25) ? 13 : 0)] : 0;
      O0l0O011 = IOll10OO * IOll10OO;
      OOO01OO1 = (sig_width >= 25) ? Il101Il1[((sig_width >= 25) ? sig_width + 3 : 0):((sig_width >= 25) ? 27 : 0)] * O0l0O011[((sig_width >= 25) ? 2 * sig_width - 47 : 0):((sig_width >= 25) ? sig_width - 23 : 0)] : 0;
      O0O1011O = (sig_width >= 25) ? OOO01OO1[((sig_width >= 25) ? 2 * sig_width - 47 : 0):((sig_width >= 25) ? sig_width - 22 : 0)] : 0;
      llOO0II1 = (sig_width >= 25) ? Il101Il1 + O0O1011O : Il101Il1;

      O010I0IO = llOO0II1[sig_width + 3];
      OOOl110I = ((O010I0IO) ? llOO0II1 : {llOO0II1[sig_width + 2:0], 1'b0});

      O00O00O1 = (sig_width == 8) ? IO00O1O1 + 1 : 
               (sig_width < 8)  ? IO00O1O1 + {1'b1, {(((sig_width > 7) ? 0 : 8 - sig_width - 1) + 1){1'b0}}} : 
                                                 0;
      lI100I0I = II11llO0 + 4'b1000;
      I10l01Il = Il101Il1 + 4'b1000;
      O1O0011O = OOOl110I + 4'b1000;

      O1O1O01l = (sig_width == 8) ? IO00O1O1[8:((sig_width > 7) ? 0 : 8 - sig_width - 1) + 1] : 
                   (IO00O1O1[((sig_width > 7) ? 0 : 8 - sig_width - 1)]) ? O00O00O1[8:((sig_width > 7) ? 0 : 8 - sig_width - 1) + 1] : 
                                       IO00O1O1[8:((sig_width > 7) ? 0 : 8 - sig_width - 1) + 1];
      l0I1OI0l = (II11llO0[2]) ? lI100I0I[sig_width + 3:3] : II11llO0[sig_width + 3:3];
      IIOI0lOO = (Il101Il1[2]) ? I10l01Il[sig_width + 3:3] : Il101Il1[sig_width + 3:3];
      O11OOOOl = (OOOl110I[2]) ? O1O0011O[sig_width + 3:3] : OOOl110I[sig_width + 3:3];

      OO1110O0 = (sig_width <= 8) ? O1O1O01l : 
            (sig_width <= 13) ? l0I1OI0l : 
            (sig_width <= 28) ? IIOI0lOO : 
                                            O11OOOOl;

      I01II0I0 = (sig_width <= 8) ? l110l11I: (sig_width <= 14) ? O0O0IIII : (sig_width <= 30) ? O1l11OIO : O010I0IO;
      IOIOI010 = ~IOO101lO & (IIIl11O1 != 0);

      l11Illl0 = {I1O1O11O,{(sig_width + 2){1'b0}}} / lO1O0OI1;
      lO001Ol0 = (OIIlOlO1) ? IOIOI010 : {I1O1O11O,{(sig_width + 2){1'b0}}} % lO1O0OI1;

      IO1l1lO0 = ($signed({1'b0, I11110O0}) - $signed({1'b0, OOO111OO}) + $signed({1'b0, l10OO1I0})) - ($signed({1'b0, I0O0O0OO}) - $signed({1'b0, l000I1O0}) + $signed({1'b0, l1O1Ol0O})) + $signed({1'b0, ((1 << (exp_width-1)) - 1)});
      IOOIlI0I = IO1l1lO0 - $signed(2'b01);

      l10OO10O = (OIIlOlO1) ?
                   ((OlIlOOIO & ~((ieee_compliance == 1) || (ieee_compliance == 3)) ) ? II01O1O0 : ((IOO101lO)?{{sig_width+1-1{1'b0}},1'b1}<<sig_width:OO1110O0)) :
                   ((~l11Illl0[(sig_width + 2)]) ? l11Illl0[(sig_width + 2) - 1:1] : l11Illl0[(sig_width + 2):2]);
      O10110O1 = ~l11Illl0[(sig_width + 2)] ? l11Illl0[1:0] : l11Illl0[2:1];
      IOO1O01O = ~l11Illl0[(sig_width + 2)] ? IOOIlI0I : IO1l1lO0;
      I000lO00 = ((IOO1O01O <= 0) | (IOO1O01O[exp_width + 1] < 0));
      I0OI1lO0 = (OIIlOlO1) ? 
              ((OlIlOOIO | IOO101lO) ? 0 : 1) :
              ((lO001Ol0===0)?1'b0:1'b1); 
      OOIl0010 = (OIIlOlO1)?{l10OO10O,2'b00}:{l11Illl0[(sig_width + 2)+1:2],l11Illl0[1]|I0OI1lO0};
      IOO101lO = (OIIlOlO1) ? (I1O1O11O == lO1O0OI1) : 0;
      O00O1Ol1 = {((exp_width <= 29) ? (((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>65536)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16777216)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>268435456)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>536870912)?30:29):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>67108864)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>134217728)?28:27):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>33554432)?26:25))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>1048576)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4194304)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8388608)?24:23):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2097152)?22:21)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>262144)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>524288)?20:19):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>131072)?18:17)))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>256)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4096)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16384)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>32768)?16:15):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8192)?14:13)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>1024)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2048)?12:11):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>512)?10:9))):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>16)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>64)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>128)?8:7):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>32)?6:5)):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>4)?(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>8)?4:3):(((1 << exp_width) + sig_width + ((1 << (exp_width-1)) - 1) - 1>2)?2:1))))) + 1 : exp_width + ((sig_width>65536)?((sig_width>16777216)?((sig_width>268435456)?((sig_width>536870912)?30:29):((sig_width>67108864)?((sig_width>134217728)?28:27):((sig_width>33554432)?26:25))):((sig_width>1048576)?((sig_width>4194304)?((sig_width>8388608)?24:23):((sig_width>2097152)?22:21)):((sig_width>262144)?((sig_width>524288)?20:19):((sig_width>131072)?18:17)))):((sig_width>256)?((sig_width>4096)?((sig_width>16384)?((sig_width>32768)?16:15):((sig_width>8192)?14:13)):((sig_width>1024)?((sig_width>2048)?12:11):((sig_width>512)?10:9))):((sig_width>16)?((sig_width>64)?((sig_width>128)?8:7):((sig_width>32)?6:5)):((sig_width>4)?((sig_width>8)?4:3):((sig_width>2)?2:1))))) + 2){1'b0}};
      if ( ((ieee_compliance == 1) || (ieee_compliance == 3)) ) begin
        if (IOO1O01O <= 0) begin
          if (IOO101lO) begin
            I0OI1lO0 = 1'b0;
          end
          O00O1Ol1 = 1 - IOO1O01O;
        
          {l10OO10O, IOOl0lII} = {l10OO10O, {(sig_width + 1){1'b0}}} >> O00O1Ol1;

          if (O00O1Ol1 > sig_width + 1) begin
            I0OI1lO0 = 1;
          end

          O10110O1[1] = l10OO10O[0];
          O10110O1[0] = IOOl0lII[sig_width];

          if (IOOl0lII[sig_width - 1:0] != 0) begin
            I0OI1lO0 = 1;
          end
        end
      end

      O011IOO0 = RND_eval(rnd, IOIlII10, O10110O1[1], O10110O1[0], I0OI1lO0);
   
      if (ieee_compliance == 3)
	begin      
          O011IOO0 = RND_eval( {1'b0, rnd[1:0]} , IOIlII10, O10110O1[1], O10110O1[0], I0OI1lO0 );  
        end            
      else  
	begin 
	  O011IOO0 = RND_eval(rnd, IOIlII10, O10110O1[1], O10110O1[0], I0OI1lO0);     
        end 

      OlOO00lO = (OIIlOlO1) ? l10OO10O :
                    (O011IOO0[0] === 1)? (l10OO10O+1):l10OO10O;
      l1OllI0I = (OIIlOlO1) ? (I1O1O11O < lO1O0OI1) : 0;

      if ((IOO1O01O >= ((((1 << (exp_width-1)) - 1) * 2) + 1)) & (IOO1O01O >= 0)) begin
        I101O11O[4] = 1;
        I101O11O[5] = 1;
        if(O011IOO0[2] === 1) begin
          IO10IOO1 = lO011100[sig_width:0];
          lI00O00I = ((((1 << (exp_width-1)) - 1) * 2) + 1);
          I101O11O[1] = 1;
        end
        else begin
          IO10IOO1 = -1;
          lI00O00I = ((((1 << (exp_width-1)) - 1) * 2) + 1) - 1;
        end
      end
  
      else if (IOO1O01O <= 0) begin
        I101O11O[3] = 1'b1;
        if (en_ubr_flag == 1 && faithful_round == 0) begin
          I101O11O[6] = 1'b1;
        end

        if (ieee_compliance == 0) begin
          I101O11O[5] = 1;

          if ((IOO1O01O == 0) && 
              (((l10OO10O == {(sig_width + 1){1'b1}}) && 
                ((rnd == 0) || (rnd == 4))) || 
               ((l10OO10O[sig_width:1] == {sig_width{1'b1}}) && 
                ((I0OI1lO0 == 1'b1) || (l10OO10O[0] == 1'b1))&&
                (((rnd == 2) && (IOIlII10 == 1'b0)) ||
                 ((rnd == 3) && (IOIlII10 == 1'b1)) || 
                 (rnd == 5))))) begin
            IO10IOO1 = 0;
            lI00O00I = 1;
          end
          else begin
            if (O011IOO0[3] === 1) begin
              IO10IOO1 = 0;
              lI00O00I = 0 + 1;
            end
            else begin
              IO10IOO1 = 0;
              lI00O00I = 0;
              I101O11O[0] = 1;
            end
          end
        end
        else begin
          if ((IOO1O01O == 0) && 
              (((OOIl0010 == IO0I1O10) && 
                ((rnd == 0) || (rnd == 4))) || 
               ((OOIl0010 == IO0I1O10) && 
                (((rnd == 2) && (IOIlII10 == 1'b0)) ||
                 ((rnd == 3) && (IOIlII10 == 1'b1)) || 
                 (rnd == 5))))) begin
            I101O11O[3] = 1'b0;
          end
          IO10IOO1 = OlOO00lO;
          lI00O00I = OlOO00lO[sig_width];
        end
      end
      else begin
        IO10IOO1 = (IOO101lO & OIIlOlO1) ? 0 : OlOO00lO;
        lI00O00I = IOO1O01O;
      end

      if ((IO10IOO1[sig_width - 1:0] == 0) & (lI00O00I[exp_width - 1:0] == 0)) begin
        I101O11O[0] = 1;
      end
  
      I101O11O[5] = I101O11O[5] | O011IOO0[1];
   
      lOOOII1l = {IOIlII10,lI00O00I[exp_width-1:0],IO10IOO1[sig_width-1:0]};
    end
  end
   
  assign status = ((^(a ^ a) !== 1'b0) || (^(b ^ b) !== 1'b0) || (^(rnd ^ rnd) !== 1'b0)) ? {8'bx} : I101O11O;
  assign z = ((^(a ^ a) !== 1'b0) || (^(b ^ b) !== 1'b0) || (^(rnd ^ rnd) !== 1'b0)) ? {8'bx} : lOOOII1l;


reg msg_rnd4_emitted_once;
reg msg_rnd5_emitted_once;
initial begin
  msg_rnd4_emitted_once = 1'b0;
  msg_rnd5_emitted_once = 1'b0;
end

generate
  if (ieee_compliance == 3) begin : GEN_IC_EQ_3
    always @ (rnd) begin : warning_alert_PROC
      if ((rnd == 3'b100) && (msg_rnd4_emitted_once !== 1'b1)) begin
        $display("############################################################");
        $display("############################################################");
        $display("##");
        $display("## At time: %d", $stime);
        $display("## Warning! : from %m");
        $display("##");
        $display("##      The rnd input was set to a value of 4 and with");
        $display("##      ieee_compliance set to 3 internal rounding will");
        $display("##      follow the same behavior as if rnd input is being");
        $display("##      set to 0.  That is, the IEEE standard rounding mode");
        $display("##      of 'round to nearest even' is used when rnd input");
        $display("##      is set to a value of 4.");
        $display("##");
        $display("############################################################");
        $display("############################################################");
        $display(" ");
        msg_rnd4_emitted_once = 1'b1;
      end

      if ((rnd == 3'b101) && (msg_rnd5_emitted_once !== 1'b1)) begin
        $display("############################################################");
        $display("############################################################");
        $display("##");
        $display("## At time: %d", $stime);
        $display("## Warning! : from %m");
        $display("##");
        $display("##      The rnd input was set to a value of 5 and with");
        $display("##      ieee_compliance set to 3 internal rounding will");
        $display("##      follow the same behavior as if rnd input is being");
        $display("##      set to 1.  That is, the IEEE standard rounding mode");
        $display("##      of 'round to zero' is used when rnd input is set");
        $display("##      to a value of 5.");
        $display("##");
        $display("############################################################");
        $display("############################################################");
        $display(" ");
        msg_rnd5_emitted_once = 1'b1;
      end
    end
  end  // GEN_IC_EQ_3
endgenerate

// synopsys translate_on

endmodule
/* vcs gen_ip dbg_ip off */
 /* */
  
  
  
