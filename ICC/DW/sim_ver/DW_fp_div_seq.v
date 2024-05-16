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
// AUTHOR:    Kyung-Nam Han, Sep. 25, 2006
//
// VERSION:   Verilog Simulation Model for DW_fp_div_seq
//
// DesignWare_version: 57594ed4
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////

//-----------------------------------------------------------------------------
//
// ABSTRACT: Floating-Point Sequencial Divider
//
//              DW_fp_div_seq calculates the floating-point division
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
//                              1 - IEEE 754 standard compatible
//                                  (NaN and denormal numbers are supported)
//              num_cyc         Number of cycles required for the FP sequential
//                              division operation including input and output
//                              register. Actual number of clock cycle is
//                              num_cyc - (1 - input_mode) - (1 - output_mode)
//                               - early_start + internal_reg
//              rst_mode        Synchronous / Asynchronous reset
//                              0 - Asynchronous reset
//                              1 - Synchronous reset
//              input_mode      Input register setup
//                              0 - No input register
//                              1 - Input registers are implemented
//              output_mode     Output register setup
//                              0 - No output register
//                              1 - Output registers are implemented
//              early_start     Computation start (only when input_mode = 1)
//                              0 - start computation in the 2nd cycle
//                              1 - start computation in the 1st cycle (forwarding)
//                              early_start should be 0 when input_mode = 0
//              internal_reg    Insert a register between an integer sequential divider
//                              and a normalization unit
//                              0 - No internal register
//                              1 - Internal register is implemented
//
//              Input ports     Size & Description
//              ===========     ==================
//              a               (sig_width + exp_width + 1)-bits
//                              Floating-point Number Input
//              b               (sig_width + exp_width + 1)-bits
//                              Floating-point Number Input
//              rnd             3 bits
//                              Rounding Mode Input
//              clk             Clock
//              rst_n           Reset. (active low)
//              start           Start operation
//                              A new operation is started by setting start=1
//                              for 1 clock cycle
//              z               (sig_width + exp_width + 1)-bits
//                              Floating-point Number Output
//              status          8 bits
//                              Status Flags Output
//              complete        Operation completed
//
// Modified:
//   6/05/07 KYUNG (0703-SP3)
//           The legal range of num_cyc parameter widened.
//   3/25/08 KYUNG (0712-SP3)
//           Fixed the reset error (STAR 9000234177)
//   1/29/10 KYUNG (D-2010.03)
//           1. Removed synchronous DFF when rst_mode = 0 (STAR 9000367314)
//           2. Fixed complete signal error at the reset  (STAR 9000371212)
//           3. Fixed divide_by_zero flag error           (STAR 9000371212)
//   2/27/12 RJK (F-2011.09-SP4)
//           Added missing message when input changes during calculation
//           while input_mode=0 (STAR 9000523798)
//   9/22/14 KYUNG (J-2014.09-SP1)
//           Modified for the support of VCS NLP feature
//   9/22/15 RJK (K-2015.06-SP3) Further update for NLP compatibility
//   2/26/16 LMSU
//           Updated to use blocking and non-blocking assigments in
//           the correct way
//   10/2/17 AFT (M-2016.12-SP5-2)
//           Fixed the behavior of the complete output signal to match
//           the synthesis model and the VHDL simulation model. 
//           (STAR 9001121224)
//           Also fixed the issue with the impact of rnd input on the
//           components output 'z'. (STAR 9001251699)
//  07/10/18 AFT - Star 9001366623
//           Signal int_complete_advanced had its declaration changed from
//           'reg' to 'wire'.
//  03/03/21 RJK - Star 3580221.  Issues with assertions in protected region
//           of Verilog sim model.  Adopting standard method used
//           in other sequential math models.
//
//-----------------------------------------------------------------------------

module DW_fp_div_seq (a, b, rnd, clk, rst_n, start, z, status, complete);

  parameter integer sig_width = 23;      // RANGE 2 TO 253
  parameter integer exp_width = 8;       // RANGE 3 TO 31
  parameter integer ieee_compliance = 0; // RANGE 0 TO 1
  parameter integer num_cyc = 4;         // RANGE 4 TO (2 * sig_width + 3)
  parameter integer rst_mode = 0;        // RANGE 0 TO 1
  parameter integer input_mode = 1;      // RANGE 0 TO 1
  parameter integer output_mode = 1;     // RANGE 0 TO 1
  parameter integer early_start = 0;     // RANGE 0 TO 1
  parameter integer internal_reg = 1;    // RANGE 0 TO 1


  localparam TOTAL_WIDTH = (sig_width + exp_width + 1);

//-----------------------------------------------------------------------------

  input [(exp_width + sig_width):0] a;
  input [(exp_width + sig_width):0] b;
  input [2:0] rnd;
  input clk;
  input rst_n;
  input start;

  output [(exp_width + sig_width):0] z;
  output [8    -1:0] status;
  output complete;

// synopsys translate_off

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

  
 
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
    
    if ( (ieee_compliance < 0) || (ieee_compliance > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter ieee_compliance (legal range: 0 to 1)",
	ieee_compliance );
    end
    
    if ( (num_cyc < 4) || (num_cyc > 2*sig_width+3) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter num_cyc (legal range: 4 to 2*sig_width+3)",
	num_cyc );
    end
    
    if ( (rst_mode < 0) || (rst_mode > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter rst_mode (legal range: 0 to 1)",
	rst_mode );
    end
    
    if ( (input_mode < 0) || (input_mode > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter input_mode (legal range: 0 to 1)",
	input_mode );
    end
    
    if ( (output_mode < 0) || (output_mode > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter output_mode (legal range: 0 to 1)",
	output_mode );
    end
    
    if ( (early_start < 0) || (early_start > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter early_start (legal range: 0 to 1)",
	early_start );
    end
    
    if ( (internal_reg < 0) || (internal_reg > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter internal_reg (legal range: 0 to 1)",
	internal_reg );
    end
    
    if ( (input_mode===0 && early_start===1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m : Invalid parameter combination: when input_mode=0, early_start=1 is not possible" );
    end
  
    if ( param_err_flg == 1) begin
      $display(
        "%m :\n  Simulation aborted due to invalid parameter value(s)");
      $finish;
    end

  end // parameter_check 


//-----------------------------------------------------------------------------

  localparam CYC_CONT = num_cyc - 3;
  integer count;
  integer next_count;
  integer cnt_glitch;

  reg  [(exp_width + sig_width):0] ina;
  reg  [(exp_width + sig_width):0] inb;
  reg  [(exp_width + sig_width):0] next_ina;
  reg  [(exp_width + sig_width):0] next_inb;
  reg  [(exp_width + sig_width):0] next_int_z;
  reg  [(exp_width + sig_width):0] int_z;
  reg  [(exp_width + sig_width):0] int_z_d1;
  reg  [(exp_width + sig_width):0] int_z_d2;
  reg  [7:0] next_int_status;
  reg  [7:0] int_status;
  reg  [7:0] int_status_d1;
  reg  [7:0] int_status_d2;
  reg  [2:0] rnd_reg;
  reg  new_input_pre;
  reg  new_input_reg_d1;
  reg  new_input_reg_d2;
  reg  next_int_complete;
  reg  next_complete;
  reg  int_complete;
  wire int_complete_advanced; 

  reg  int_complete_d1;
  reg  int_complete_d2;
  reg  count_reseted;
  reg  next_count_reseted;

  wire [(exp_width + sig_width):0] ina_div;
  wire [(exp_width + sig_width):0] inb_div;
  wire [(exp_width + sig_width):0] z;
  wire [(exp_width + sig_width):0] temp_z;
  wire [7:0] status;
  wire [7:0] temp_status;
  wire [2:0] rnd_div;
  wire clk, rst_n;
  wire complete;
  wire start_in;

  reg  start_clk;
  wire rst_n_rst;
  reg  reset_st;
  reg  [(exp_width + sig_width):0] a_reg;
  reg  [(exp_width + sig_width):0] b_reg;

  localparam [1:0] output_cont = output_mode + internal_reg;


  wire corrupt_data;

generate
  if (input_mode == 0) begin : GEN_IM_EQ_0

    localparam [0:0] NO_OUT_REG = (output_mode == 0)? 1'b1 : 1'b0;
    reg [TOTAL_WIDTH-1:0] ina_hist;
    reg [TOTAL_WIDTH-1:0] inb_hist;
    wire next_corrupt_data;
    reg  corrupt_data_int;
    wire data_input_activity;
    reg  init_complete;
    wire next_alert1;
    integer change_count;

    assign next_alert1 = next_corrupt_data & rst_n & init_complete &
                                    ~start & ~complete;

    if (rst_mode == 0) begin : GEN_A_RM_EQ_0
      always @ (posedge clk or negedge rst_n) begin : ar_hist_regs_PROC
	if (rst_n === 1'b0) begin
	    ina_hist        <= a;
	    inb_hist        <= b;
	    change_count    <= 0;

	  init_complete   <= 1'b0;
	  corrupt_data_int <= 1'b0;
	end else begin
	  if ( rst_n === 1'b1) begin
	      ina_hist        <= a;
	      inb_hist        <= b;
	      change_count    <= (start == 1'b1)? 0 :
	                         (next_alert1 == 1'b1)? change_count + 1 : change_count;
	    init_complete   <= init_complete | start;
	    corrupt_data_int<= next_corrupt_data | (corrupt_data_int & ~start);
	  end else begin
	    ina_hist        <= {TOTAL_WIDTH{1'bx}};
	    inb_hist        <= {TOTAL_WIDTH{1'bx}};
	    change_count    <= -1;
	    init_complete   <= 1'bx;
	    corrupt_data_int <= 1'bX;
	  end
	end
      end
    end else begin : GEN_A_RM_NE_0
      always @ (posedge clk) begin : sr_hist_regs_PROC
	if (rst_n === 1'b0) begin
	    ina_hist        <= a;
	    inb_hist        <= b;
	    change_count    <= 0;
	  init_complete   <= 1'b0;
	  corrupt_data_int <= 1'b0;
	end else begin
	  if ( rst_n === 1'b1) begin
	      ina_hist        <= a;
	      inb_hist        <= b;
	      change_count    <= (start == 1'b1)? 0 :
	                         (next_alert1 == 1'b1)? change_count + 1 : change_count;
	    init_complete   <= init_complete | start;
	    corrupt_data_int<= next_corrupt_data | (corrupt_data_int & ~start);
	  end else begin
	    ina_hist        <= {TOTAL_WIDTH{1'bx}};
	    inb_hist        <= {TOTAL_WIDTH{1'bx}};
	    init_complete    <= 1'bx;
	    corrupt_data_int <= 1'bX;
	    change_count     <= -1;
	  end
	end
      end
    end // GEN_A_RM_NE_0

    assign data_input_activity =  (((a !== ina_hist)?1'b1:1'b0) |
				 ((b !== inb_hist)?1'b1:1'b0)) & rst_n;

    assign next_corrupt_data = (NO_OUT_REG | ~complete) &
                              (data_input_activity & ~start &
					init_complete);

`ifdef UPF_POWER_AWARE
  `protected
W=AE5J(.0-@BW)R=0&B[IJ+^M;fWJe7Za]Gf:EbHOFI5Qa^KFNED,)eGT>faB0Hb
/I+SFKFUP8VX?21)fQ3>MV:Y1<&4dON>[L3>[\(2=A]R/A17L:=H>>b3\RMO:aW[
1KTUbNfC#8<?/dL37?U:0NLJO7VYZ0ec.O4NcWgF6>5bf/-Af.=+R-+/O15M^gK:
\G\Agc@3_JBdLXXfU/1@[gSBHVO2(^:3<Y6-Q3>)[QOPJ8b)6F\Q(dCR:.QDQBc&
X#T7+5G=5R>:gNdSbZSDW;)^Q;O5\\(#(<,M:&M3f,A;-:0\)1VaB315JQP]cR5g
[HP,8H?Z;MQIf\4()Q9YVULL;:BA/E]UAWP)eI#e:)B#AOM2YgZ\+F-/_V?FFbg=
Y3P+0=^@N,NI)Y8=?@+@XCCMX6D:<+(7UF80^VCE48#G1&-RO]9aAZK9>eY/VS-Y
AaOW?-P#aMMeL0BNUgNOCGU5c7:Q5-eg2O@QD?+4#&EQ>1V&_RPcKb_O3IdH/N>D
,gS0GZQR9a60,>EK]6(,2OE2+^AQ(K?7>ENS/NcbE7,eL^eWW;Gca(V0RU8&?]e6
]4#0>8MPO&L0eTGbK9?C\1)>MC_C9BBPV/3X-\bX21Gc&[R+Ne2gNQB-9FO;?HBc
+3OD,7P/-FQPVM04KB?189^4?Vf\;\O;?ZaA#f.,C@d:TV4eG9/dXCWSLeY:^=K8
LD[Y+9\@EeMNP;T745Q;X@G<Mf>W/-D:\1B#WQAe3OdJ8\9ZGZT)>aaOD[gfO<BT
:_D3HQ5.V7T(@Y2R/.5@2#)DEN]c[F5Y:EWfL-]BgAQ9f?M3/;2V(&95QgPQc8OO
A>f?4GL7KNL^[&DK6YM2bC9gNM]BFbbSG1Pgf-I+HF#M_cP6^/G\60+.=c,0[T=a
A894#a3RegB^]4d3:[H-DQD>54FZ#\Q?/C&.FD<-?&ATJQ,f86)bLXbMV:HI.)4Q
<F1fJ(#5:^W\RX][7d.?HbB)(I(4e7?c2/@8bcW#L8AU,MYMD9^cQ2S8<ZT#_bG6
/,CV.eV:U)d[0JYN),b\/]W_9-GDRG^^aU/,J(3SM];Q07f148OF0>4d>cgR[/#d
KEA7[^<T\3A,ePSF(Z-#]9D,(3J)[S=fR-3<>MB17Fc7RL7g[:R..3]e)(XG,bEO
FK:9Ba?0-MS]SB>(^Wd?e[ISd0>_5X7eOD/baR6CRP\T4+48D;N-ed]87-N,NQWX
ECY6T=6YV19S(P,])W+BSIDFW/1D<B635.]9H\B9@+;M\PAU-29,Q+2EXPb=D+2Y
B-6^Sd,YCeCM<94KAQDZFgWKbD8a;KSUCMKIM.#4g>ER9<M=<d=Y74\?_0S5-IZB
40T;EbM19GX4_2eR(G?AFf#U:)e:^a<VG/L>[.IWB7F.-T_/(\DB4EJQQK/19_WL
UNIFCOGK345VU]McIFUc:3\=:d767BAUe.7O@EP,Y[#g8JS,>?P?=f^/f&dN4B.7
\gX(bSf<RCJTH^c6g9GRNbGJ25D#aaRQ6-b@7aNTbM76ZRB]/O;E8IQACfGT9aY2
ZSONT?-JT-PGKg?61ZJ#[_G>#VJPP^Mf6W]TPL;c102ZV.ec9O=I11(5,8H/B9Bc
##5a21ZPR3CZR0CGGBNIaWedc[C_#NZ/T3@29dW6UT1>Qe<=K7Id_3O&WGV7O246
BaK3=NaO^;6,12U-X26T+Z-)II@dUNg<da<B,EU6SCW];Y[S\#O+JZM1caWEdE:U
YC7U/CN.UA?Q&F2@fN#f9J(fIcTbCf3/)2_[EIB?[d;G3)C)bD:YR7Z80O+IQT]/
9P<K7_cfLTP5L2J=gPT?0S+0T+L>FO7.BTgV-_F_>8bGd9=eBc6SO[YQF7>T3#K7
)Q4ZY#IG,E.TA]38g[N3)g5Z)=2MHQYPcE#g<\08<>78WD#X/1\<?>&BT0K6ZWaT
A=[2g[_KW0OcHLW#J7bA=3/#^RG\^g\37\7(N?JccK6F87b-7cEdZTNQVLYA?:N+
S3O1)4,\/4?B]@fF:cXaQ;gO#4XE+YNaD/Q#R+W,4:?f=((OTPP,38Ra4dO9c]4O
a959,1K1OYB9LQ2)&eDKbQA+<L?4FeJIfWY0A+IaXBgLYRS9,09c\S</?Z0?P=Q=
9gOOH-#\W=fM[]fbcL&J/fY.3DTYG>NSO@T8_DS[@47@4)@EeH?BYKGQ^G3K,\)Z
IdK0S[JAU_&#f++3D^]@bR0(;T/C:BLfR1PbV&Z[c1QZF)1)82<QOMcV5F-UZAM5
f?<:7/Q:A/_X1Z5]X&aYE@0UM6;QC8e?5SPU76YT;+IP6E#\D)Z7V=DbPUWCYfD8
#G\3WSD59Yb4L@Q49SOF78,^17=C9C.7A_g+[5d(C6&;]P<-eR#,NHd)PKV(M+AN
]XPgOWR9V4YFY<RQ?[(,^Q+Gb@bHYV44\9UKDX[d(QT=?8badGfLPI#1JJR8WU6-
-[b4Oa39X1(.?[bKV/V]g:dWgF3gg+6F2^d.??ZTbTUCA>#QJH)6\ZC-U6&AU_3\
-7]e4SWW@;.NaLL5OC96Idcf1b#D)e,HYLD,<14A\]OB,R31AWFG2@@;U\WF_TT/
VDJ&_c]A8ZdEcZ4/J\Z8[DdND6?J^N:&Q8L;KLOR+LYb=^X>W,98CBdW(#(dG;+G
SL0#ON=[]++B3L2bWF^(+9dN4$
`endprotected

`else
    always @ (posedge clk) begin : corrupt_alert_PROC
      integer updated_count;

      updated_count = change_count;

      if (next_alert1 == 1'b1) begin
`ifndef DW_SUPPRESS_WARN
          $display ("WARNING: %m:\n at time = %0t: Operand input change on DW_fp_div_seq during calculation (configured without an input register) will cause corrupted results if operation is allowed to complete.", $time);
`endif
	updated_count = updated_count + 1;
      end

      if (((rst_n & init_complete & ~start & ~complete & next_complete) == 1'b1) &&
          (updated_count > 0)) begin
	$display(" ");
	$display("############################################################");
	$display("############################################################");
	$display("##");
	$display("## Error!! : from %m");
	$display("##");
	$display("##    This instance of DW_fp_div_seq has encountered %0d change(s)", updated_count);
	$display("##    on operand input(s) after starting the calculation.");
	$display("##    The instance is configured with no input register.");
	$display("##    So, the result of the operation was corrupted.  This");
	$display("##    message is generated at the point of completion of");
	$display("##    the operation (at time %0d), separate warning(s) were", $time );
`ifndef DW_SUPPRESS_WARN
	$display("##    generated earlier during calculation.");
`else
	$display("##    suppressed earlier during calculation.");
`endif
	$display("##");
	$display("############################################################");
	$display("############################################################");
	$display(" ");
      end
    end
`endif

    assign corrupt_data = corrupt_data_int;

  if (output_mode == 0) begin : GEN_OM_EQ_0
    reg  alert2_issued;
    wire next_alert2;

    assign next_alert2 = next_corrupt_data & rst_n & init_complete &
                                     ~start & complete & ~alert2_issued;

`ifdef UPF_POWER_AWARE
  `protected
X-_EaKHYAUSMFD)GfdF]8[Q+gS7g3H7dSfMbd_TC&ZLdT6:+f=GB1)9KKZ5)_OgR
[K0_-VG9SdN/Te;_KIIPH;@#<@IIW-d_f>P[S#5Xbc1WLCf32]Yd14NW0IYAcDce
^Xe]3.<JV]NATAO-RE&JZ/S.AbQc2(fL[I--3,QR;_C1A)Df5]S]CQ)Ae-=:;K+N
=3EQNbSV4.f56ELG@c1YJ57D9cBD?EWdT=L-VI:([XI.]-\VDQ7J0gTM(e]7MbUV
^V+a+]NE#,P>)^dN(a2fUG8N>H^C6YWg7MKHe+dZ8cJ+fTbSFD,D&I,TNLPF_,eG
JLIY0X?OaQA4VEHMTD(V>+/.Q&3/X,)=DIT1).N831X5MUY?95,5NS2D+?GU:bP8
d1;eVW1NIL_Q9+Q2)ddIDef7#?.AAI.\>gcb;M7=N6V;.:Y,6JZ#6X@:4UadT.8<
[^L/4_g,+[WLO-2S6XAA(>A.<NLVS);Y7_0B]6ZdCKGDA#3KBOQR4<.TK?LZ7+,8
G0=Oe)2T,B]JXc?#@ZcbJM+#(9A<G-CP42)_,HH/WRY3I:&8>EN-&G>_&V//\P8B
O<-cW99>^ceaQ>JJaS10MdM5[,S);X)Eb-b/_.B0Q;ePBc;;Rb<MDTJd=&?W6/^1
+>POU(gMK07da:NMdXgYE<&cW-73,Q9&@$
`endprotected

`else
  `ifndef DW_SUPPRESS_WARN
    always @ (posedge clk) begin : corrupt_alert2_PROC
      if (next_alert2 == 1'b1) begin
        $display( "## Warning from %m: DW_fp_div_seq operand input change near %0d causes output to no longer retain result of previous operation.", $time);
      end
    end
  `endif
`endif

    if (rst_mode == 0) begin : GEN_AI_REG_AR
      always @ (posedge clk or negedge rst_n) begin : ar_alrt2_reg_PROC
        if (rst_n == 1'b0) alert2_issued <= 1'b0;

	  else alert2_issued <= ~start & (alert2_issued | next_alert2);
      end
    end else begin : GEN_AI_REG_SR
      always @ (posedge clk) begin : sr_alrt2_reg_PROC
        if (rst_n == 1'b0) alert2_issued <= 1'b0;

	  else alert2_issued <= ~start & (alert2_issued | next_alert2);
      end
    end

  end  // GEN_OM_EQ_0

  // GEN_IM_EQ_0
  end else begin : GEN_IM_NE_0
    assign corrupt_data = 1'b0;
  end // GEN_IM_NE_0
endgenerate

  assign corrupt_data = (output_cont == 2) ? new_input_reg_d2:
                        (output_cont == 1) ? new_input_reg_d1:
                        new_input_pre;

  assign z = (reset_st) ? 0 :
             (corrupt_data !== 1'b0)? {TOTAL_WIDTH{1'bx}} :
             (output_cont == 2) ? int_z_d2 :
             (output_cont == 1) ? int_z_d1 :
             next_int_z;

  assign status = (reset_st) ? 0 :
                  (corrupt_data !== 1'b0)? {8{1'bx}} :
                  (output_cont == 2) ? int_status_d2 :
                  (output_cont == 1) ? int_status_d1 :
                  next_int_status;

  assign complete = (rst_n == 1'b0 && rst_mode == 0) ? 1'b0:
              (output_cont == 2) ? int_complete_d2:
              (output_cont == 1) ? int_complete_d1:
              int_complete_advanced;

  assign ina_div = (input_mode == 1) ? ina : a;
  assign inb_div = (input_mode == 1) ? inb : b;
  assign rnd_div = (input_mode==1) ? rnd_reg : rnd;

  DW_fp_div #(sig_width, exp_width, ieee_compliance) U1 (
                      .a(ina_div),
                      .b(inb_div),
                      .rnd(rnd_div),
                      .z(temp_z),
                      .status(temp_status)
  );

  generate
  if (rst_mode == 0) begin : GEN_RM_EQ_0_CORRUPT_DATA
  always @(posedge clk or negedge rst_n) begin : a1000_PROC
    if (rst_n == 1'b0) begin
      new_input_reg_d1 <= 1'b0;
      new_input_reg_d2 <=1'b0;
    end else begin
      new_input_reg_d1 <= new_input_pre;
      new_input_reg_d2 <= new_input_reg_d1;
    end
  end
  end else begin : GEN_RM_NEQ_0_CORRUPT_DATA
  always @(posedge clk) begin : a1001_PROC
    if (rst_n == 1'b0) begin
      new_input_reg_d1 <= 1'b0;
      new_input_reg_d2 <=1'b0;
    end else begin
      new_input_reg_d1 <= new_input_pre;
      new_input_reg_d2 <= new_input_reg_d1;
    end
  end 
  end
  endgenerate

  always @(ina_div or inb_div) begin : a1002_PROC
    new_input_pre = (start_in == 1'b0) & (input_mode == 0) & (reset_st == 1'b0);
  end

  generate 
  if (rst_mode == 0) begin : GEN_DATA_DETCT_RM0
  always @(posedge clk or negedge rst_n) begin: DATA_CHANGE_DETECTION_PROC
    if (rst_n == 1'b0) begin
      new_input_pre <= 1'b0;
    end else begin
      if (input_mode == 0 && reset_st == 1'b0 && start_in == 1'b0 && (a_reg != a || b_reg != b)) begin
        new_input_pre <= 1'b1;
      end else begin
        if (start_in == 1'b1) begin
          new_input_pre <= 1'b0;
        end 
      end
    end
  end
  end
  else begin : GEN_DATA_DETCT_RM1
  always @(posedge clk) begin: DATA_CHANGE_DETECTION_PROC
    if (rst_n == 1'b0) begin
      new_input_pre <= 1'b0;
    end else begin
      if (input_mode == 0 && reset_st == 1'b0 && start_in == 1'b0 && (a_reg != a || b_reg != b)) begin
        new_input_pre <= 1'b1;
      end else begin
        if (start_in == 1'b1) begin
          new_input_pre <= 1'b0;
        end 
      end
    end
  end
  end
  endgenerate

  assign start_in = (input_mode & ~early_start) ? start_clk : start;

  always @(start or a or b or ina or inb or count_reseted or next_count) begin : next_comb_PROC
    if (start===1'b1) begin
      next_ina           = a;
      next_inb           = b;
    end
    else if (start===1'b0) begin
      if (next_count >= CYC_CONT) begin
        next_ina           = ina;
        next_inb           = inb;
      end else if (next_count === -1) begin
        next_ina           = {TOTAL_WIDTH{1'bX}};
        next_inb           = {TOTAL_WIDTH{1'bX}};
      end else begin
        next_ina           = ina;
        next_inb           = inb;
      end 
    end
  end

  always @(rst_n or start_in or a or b or ina or inb or count_reseted or next_count or
           temp_z or temp_status or output_cont or count or reset_st) begin : next_state_comb_PROC
    if (start_in===1'b1) begin
      next_count_reseted = 1'b1;
      next_complete      = 1'b0;
      next_int_complete  = 1'b0;
      next_int_z         = {TOTAL_WIDTH{1'bx}};
      next_int_status    = {8{1'bx}};
    end
    else if (start_in===1'b0) begin
      next_count_reseted = 1'b0;
      if (count >= CYC_CONT) begin
        next_int_z         = temp_z & {((exp_width + sig_width) + 1){~(start_in | reset_st)}};
        next_int_status    = temp_status & {8{~(start_in | reset_st)}};
      end
      if (next_count >= CYC_CONT) begin
        next_int_complete  = rst_n;
        next_complete      = 1'b1;
      end else if (next_count === -1) begin
        next_int_complete  = 1'bX;
        next_int_z         = {TOTAL_WIDTH{1'bX}};
        next_int_status    = {8{1'bX}};
        next_complete      = 1'bX;
      end else begin
        next_int_complete  = 0;
        next_int_z         = {TOTAL_WIDTH{1'bX}};
        next_int_status    = {8{1'bX}};
      end 
    end

  end

  always @(start_in or count_reseted or count) begin : a1003_PROC
    if (start_in===1'b1)
      next_count = 0;
    else if(start_in===1'b0) begin
      if (count >= CYC_CONT)
        next_count = count;
      else if (count === -1)
        next_count = -1;
      else
        next_count = count + 1;
    end
  end
 
  assign int_complete_advanced = (internal_reg == 1 || input_mode == 1 || output_mode == 1)?int_complete & (~start_in):int_complete;

  generate
  if (rst_mode == 0) begin : GEN_RM_EQ_0_D
    always @ (posedge clk or negedge rst_n) begin: register_PROC
      if (rst_n === 1'b0) begin
        int_z           <= 0;
        int_status      <= 0;
        int_complete    <= 0;
        count_reseted   <= 0;
        count           <= 0;
        ina             <= 0;
        inb             <= 0;
        int_z_d1        <= 0;
        int_z_d2        <= 0;
        int_status_d1   <= 0;
        int_status_d2   <= 0;
        int_complete_d1 <= 0;
        int_complete_d2 <= 0;
        start_clk       <= 0;
        a_reg           <= 0;
        b_reg           <= 0;
        rnd_reg         <= 3'b000;
      end else if (rst_n === 1'b1) begin
        int_z           <= next_int_z;
        int_status      <= next_int_status;
        int_complete    <= next_int_complete;
        count_reseted   <= next_count_reseted;
        count           <= next_count;
        ina             <= next_ina;
        inb             <= next_inb;
        int_z_d1        <= next_int_z;
        int_z_d2        <= int_z_d1;
        int_status_d1   <= next_int_status;
        int_status_d2   <= int_status_d1;
        int_complete_d1 <= int_complete_advanced;
        int_complete_d2 <= int_complete_d1;
        start_clk       <= start;
        a_reg           <= a;
        b_reg           <= b;
        rnd_reg         <= (start == 1'b1)?rnd:rnd_reg;
      end else begin
        int_z           <= {(exp_width + sig_width){1'bx}};
        int_status      <= {7{1'bx}};
        int_complete    <= 1'bx;
        count_reseted   <= 1'bx;
        count           <= -1;
        ina             <= {TOTAL_WIDTH{1'bx}};
        inb             <= {TOTAL_WIDTH{1'bx}};
        int_z_d1        <= {(exp_width + sig_width){1'bx}};
        int_z_d2        <= {(exp_width + sig_width){1'bx}};
        int_status_d1   <= {8{1'bx}};
        int_status_d2   <= {8{1'bx}};
        int_complete_d1 <= 1'bx;
        int_complete_d2 <= 1'bx;
        start_clk       <= 1'bx;
        a_reg           <= {TOTAL_WIDTH{1'bx}};
        b_reg           <= {TOTAL_WIDTH{1'bx}};
        rnd_reg         <= 3'bxxx;
      end
    end
    always @(posedge clk or negedge rst_n) begin: RST_FSM_PROC
      if (rst_n == 1'b0) begin
        reset_st <= 1'b1;
      end else begin
        if (start == 1'b1) reset_st <= 1'b0;
      end 
    end
  end
  else begin : GEN_RM_NE_0_D
    always @ ( posedge clk) begin: register_PROC
      if (rst_n === 1'b0) begin
        int_z           <= 0;
        int_status      <= 0;
        int_complete    <= 0;
        count_reseted   <= 0;
        count           <= 0;
        ina             <= 0;
        inb             <= 0;
        int_z_d1        <= 0;
        int_z_d2        <= 0;
        int_status_d1   <= 0;
        int_status_d2   <= 0;
        int_complete_d1 <= 0;
        int_complete_d2 <= 0;
        start_clk       <= 0;
        a_reg           <= 0;
        b_reg           <= 0;
        rnd_reg         <= 3'b000;
      end else if (rst_n === 1'b1) begin
        int_z           <= next_int_z;
        int_status      <= next_int_status;
        int_complete    <= next_int_complete;
        count_reseted   <= next_count_reseted;
        count           <= next_count;
        ina             <= next_ina;
        inb             <= next_inb;
        int_z_d1        <= next_int_z;
        int_z_d2        <= int_z_d1;
        int_status_d1   <= next_int_status;
        int_status_d2   <= int_status_d1;
        int_complete_d1 <= int_complete_advanced;
        int_complete_d2 <= int_complete_d1;
        start_clk       <= start;
        a_reg           <= a;
        b_reg           <= b;
        rnd_reg         <= (start==1'b1)?rnd:rnd_reg;
      end else begin
        int_z           <= {(exp_width + sig_width){1'bx}};
        int_status      <= {8{1'bx}};
        int_complete    <= 1'bx;
        count_reseted   <= 1'bx;
        count           <= -1;
        ina             <= {TOTAL_WIDTH{1'bx}};
        inb             <= {TOTAL_WIDTH{1'bx}};
        int_z_d1        <= {(exp_width + sig_width){1'bx}};
        int_z_d2        <= {(exp_width + sig_width){1'bx}};
        int_status_d1   <= {8{1'bx}};
        int_status_d2   <= {8{1'bx}};
        int_complete_d1 <= 1'bx;
        int_complete_d2 <= 1'bx;
        start_clk       <= 1'bx;
        a_reg           <= {TOTAL_WIDTH{1'bx}};
        b_reg           <= {TOTAL_WIDTH{1'bx}};
        rnd_reg         <= 3'bxxx;
      end
    end
    always @(posedge clk) begin: RST_FSM_PROC
      if (rst_n == 1'b0) begin
        reset_st <= 1'b1;
      end else begin
        if (start == 1'b1) reset_st <= 1'b0;
      end 
    end
  end
  endgenerate

  
`ifndef DW_DISABLE_CLK_MONITOR
`ifndef DW_SUPPRESS_WARN
  always @ (clk) begin : P_monitor_clk 
    if ( (clk !== 1'b0) && (clk !== 1'b1) && ($time > 0) )
      $display ("WARNING: %m:\n at time = %0t: Detected unknown value, %b, on clk input.", $time, clk);
    end // P_monitor_clk 
`endif
`endif

// synopsys translate_on

endmodule
