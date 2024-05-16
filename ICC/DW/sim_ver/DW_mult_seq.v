////////////////////////////////////////////////////////////////////////////////
//
//       This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 2002 - 2023 SYNOPSYS INC.
//                           ALL RIGHTS RESERVED
//
//       The entire notice above must be reproduced on all authorized
//     copies.
//
// AUTHOR:    Aamir Farooqui                February 12, 2002
//
// VERSION:   Verilog Simulation Model for DW_mult_seq
//
// DesignWare_version: e7c3a965
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////

//------------------------------------------------------------------------------
//
//ABSTRACT:  Sequential Multiplier 
// Uses modeling functions from DW_Foundation.
//
//MODIFIED:
// 2/26/16 LMSU Updated to use blocking and non-blocking assigments in
//              the correct way
// 8/06/15 RJK Update to support VCS-NLP
// 2/06/15 RJK  Updated input change monitor for input_mode=0 configurations to better
//             inform designers of severity of protocol violations (STAR 9000851903)
// 5/20/14 RJK  Extended corruption of output until next start for configurations
//             with input_mode = 0 (STAR 9000741261)
// 9/25/12 RJK  Corrected data corruption detection to catch input changes
//             during the first cycle of calculation (related to STAR 9000505348)
// 1/5/12 RJK Change behavior when inputs change during calculation with
//          input_mode = 0 to corrupt output (STAR 9000505348)
//
//------------------------------------------------------------------------------

module DW_mult_seq ( clk, rst_n, hold, start, a,  b, complete, product);


// parameters 

  parameter  integer a_width     = 3; 
  parameter  integer b_width     = 3;
  parameter  integer tc_mode     = 0;
  parameter  integer num_cyc     = 3;
  parameter  integer rst_mode    = 0;
  parameter  integer input_mode  = 1;
  parameter  integer output_mode = 1;
  parameter  integer early_start = 0;
 
//-----------------------------------------------------------------------------

// ports 
  input clk, rst_n;
  input hold, start;
  input [a_width-1:0] a;
  input [b_width-1:0] b;

  output complete;
  output [a_width+b_width-1:0] product;

//-----------------------------------------------------------------------------
// synopsys translate_off

localparam signed [31:0] CYC_CONT = (input_mode==1 & output_mode==1 & early_start==0)? 3 :
                                    (input_mode==early_start & output_mode==0)? 1 : 2;

//-------------------Integers-----------------------
  integer count;
  integer next_count;
 

//-----------------------------------------------------------------------------
// wire and registers 

  wire clk, rst_n;
  wire hold, start;
  wire [a_width-1:0] a;
  wire [b_width-1:0] b;
  wire complete;
  wire [a_width+b_width-1:0] product;

  wire [a_width+b_width-1:0] temp_product;
  reg [a_width+b_width-1:0] ext_product;
  reg [a_width+b_width-1:0] next_product;
  wire [a_width+b_width-2:0] long_temp1,long_temp2;
  reg [a_width-1:0]   in1;
  reg [b_width-1:0]   in2;
  reg [a_width-1:0]   next_in1;
  reg [b_width-1:0]   next_in2;
 
  wire [a_width-1:0]   temp_a;
  wire [b_width-1:0]   temp_b;

  wire start_n;
  wire hold_n;
  reg ext_complete;
  reg next_complete;
 


//-----------------------------------------------------------------------------
  
  
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    
    
    if (b_width < 3) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter b_width (lower bound: 3)",
	b_width );
    end
    
    if ( (a_width < 3) || (a_width > b_width) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter a_width (legal range: 3 to b_width)",
	a_width );
    end
    
    if ( (num_cyc < 3) || (num_cyc > a_width) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter num_cyc (legal range: 3 to a_width)",
	num_cyc );
    end
    
    if ( (tc_mode < 0) || (tc_mode > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter tc_mode (legal range: 0 to 1)",
	tc_mode );
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


//------------------------------------------------------------------------------

  assign start_n      = ~start;
  assign complete     = ext_complete & start_n;

  assign temp_a       = (in1[a_width-1])? (~in1 + 1'b1) : in1;
  assign temp_b       = (in2[b_width-1])? (~in2 + 1'b1) : in2;
  assign long_temp1   = temp_a*temp_b;
  assign long_temp2   = ~(long_temp1 - 1'b1);
  assign temp_product = (tc_mode)? (((in1[a_width-1] ^ in2[b_width-1]) && (|long_temp1))?
                                {1'b1,long_temp2} : {1'b0,long_temp1}) : in1*in2;

// Begin combinational next state assignments
  always @ (start or hold or a or b or count or in1 or in2 or
            temp_product or ext_product or ext_complete) begin
    if (start === 1'b1) begin                     // Start operation
      next_in1      = a;
      next_in2      = b;
      next_count    = 0;
      next_complete = 1'b0;
      next_product  = {a_width+b_width{1'bX}};
    end else if (start === 1'b0) begin            // Normal operation
      if (hold === 1'b0) begin
        if (count >= (num_cyc+CYC_CONT-4)) begin
          next_in1      = in1;
          next_in2      = in2;
          next_count    = count; 
          next_complete = 1'b1;
          next_product  = temp_product;
        end else if (count === -1) begin
          next_in1      = {a_width{1'bX}};
          next_in2      = {b_width{1'bX}};
          next_count    = -1; 
          next_complete = 1'bX;
          next_product  = {a_width+b_width{1'bX}};
        end else begin
          next_in1      = in1;
          next_in2      = in2;
          next_count    = count+1; 
          next_complete = 1'b0;
          next_product  = {a_width+b_width{1'bX}};
        end
      end else if (hold === 1'b1) begin           // Hold operation
        next_in1      = in1;
        next_in2      = in2;
        next_count    = count; 
        next_complete = ext_complete;
        next_product  = ext_product;
      end else begin                              // hold == x
        next_in1      = {a_width{1'bX}};
        next_in2      = {b_width{1'bX}};
        next_count    = -1;
        next_complete = 1'bX;
        next_product  = {a_width+b_width{1'bX}};
      end
    end else begin                                // start == x
      next_in1      = {a_width{1'bX}};
      next_in2      = {b_width{1'bX}};
      next_count    = -1;
      next_complete = 1'bX;
      next_product  = {a_width+b_width{1'bX}};
    end
  end
// end combinational next state assignments

generate
  if (rst_mode == 0) begin : GEN_RM_EQ_0

  // Begin sequential assignments
    always @ ( posedge clk or negedge rst_n ) begin: ar_register_PROC
      if (rst_n === 1'b0) begin                   // initialize everything asyn reset
        count        <= 0;
        in1          <= 0;
        in2          <= 0;
        ext_product  <= 0;
        ext_complete <= 0;
      end else if (rst_n === 1'b1) begin          // rst_n == 1
        count        <= next_count;
        in1          <= next_in1;
        in2          <= next_in2;
        ext_product  <= next_product;
        ext_complete <= next_complete & start_n;
      end else begin                              // rst_n == X
        in1          <= {a_width{1'bX}};
        in2          <= {b_width{1'bX}};
        count        <= -1;
        ext_product  <= {a_width+b_width{1'bX}};
        ext_complete <= 1'bX;
      end 
   end // ar_register_PROC

  end else  begin : GEN_RM_NE_0

  // Begin sequential assignments
    always @ ( posedge clk ) begin: sr_register_PROC 
      if (rst_n === 1'b0) begin                   // initialize everything asyn reset
        count        <= 0;
        in1          <= 0;
        in2          <= 0;
        ext_product  <= 0;
        ext_complete <= 0;
      end else if (rst_n === 1'b1) begin          // rst_n == 1
        count        <= next_count;
        in1          <= next_in1;
        in2          <= next_in2;
        ext_product  <= next_product;
        ext_complete <= next_complete & start_n;
      end else begin                              // rst_n == X
        in1          <= {a_width{1'bX}};
        in2          <= {b_width{1'bX}};
        count        <= -1;
        ext_product  <= {a_width+b_width{1'bX}};
        ext_complete <= 1'bX;
      end 
   end // ar_register_PROC

  end
endgenerate

  wire corrupt_data;

generate
  if (input_mode == 0) begin : GEN_IM_EQ_0

    localparam [0:0] NO_OUT_REG = (output_mode == 0)? 1'b1 : 1'b0;
    reg [a_width-1:0] ina_hist;
    reg [b_width-1:0] inb_hist;
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
	    if ((hold != 1'b1) || (start == 1'b1)) begin
	      ina_hist        <= a;
	      inb_hist        <= b;
	      change_count    <= (start == 1'b1)? 0 :
	                         (next_alert1 == 1'b1)? change_count + 1 : change_count;
	    end

	    init_complete   <= init_complete | start;
	    corrupt_data_int<= next_corrupt_data | (corrupt_data_int & ~start);
	  end else begin
	    ina_hist        <= {a_width{1'bx}};
	    inb_hist        <= {b_width{1'bx}};
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
	    if ((hold != 1'b1) || (start == 1'b1)) begin
	      ina_hist        <= a;
	      inb_hist        <= b;
	      change_count    <= (start == 1'b1)? 0 :
	                         (next_alert1 == 1'b1)? change_count + 1 : change_count;
	    end

	    init_complete   <= init_complete | start;
	    corrupt_data_int<= next_corrupt_data | (corrupt_data_int & ~start);
	  end else begin
	    ina_hist        <= {a_width{1'bx}};
	    inb_hist        <= {b_width{1'bx}};
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
					~hold & init_complete);

`ifdef UPF_POWER_AWARE
  `protected
_Oe9Z&Qf^.bfKL@MA7[U66]deg(O:@GT7]L<LQ+\]f]/g?@JC^J5()<,44J^\_WT
d2DK6K5aUQ_#Q4[acA+;S5#7B37?UUDC6WR;I>C,MYE;W31a[@EV8/<7WX/X5fV4
#B:E0@CK6PM(E3UJ:Ce3_>KTBVS^D5MbJRNAY+U:;db(:[ZE=Jg5GBRRZ+>]Q#WK
AE;dgg6>00\YAWI^N^J>B?e:O-2>22&:eI\[&gbCUdL\8>>a0@X9Q[<Bf@9Ad71S
&B@/]63)=1.@##e#E^5\9(<E_LSG3QP^a)>IOL;/g5=A_@ZEc&X)RIB#N8PLDX.O
GNC[/b0[B[1E+[4&3<VIIb(D;VZT9<9V+6)a1]=4Z9(#^Y>YJLLNW+1[MZ(?9X?C
]\BINO)Z&D\f7e4]c48K3A1^9)6EPeOV)7)?5:G4A:g2COd/WW]fUF)V2^=OS9,b
#f4SKUe&AY01R&<:C)DL;dV5QA7dSU_6bQFX+U-D(I_GR5g=aB_8]_#[Y,e\K0T=
/N8bAG0DJN(I0;dXPUW@__gF-Q(H7bW9WN1Y>BP;Qa4]V4b#;dD;E=GbW5&V[J=8
:])G70fY93CCAEL5H]2Q,;--G+9L,V/bA5/T:g/U?N#S#@7KZ-/?_J_Y1Ze+@AH#
JUFg[,8Q7KF12L4,T)G-9N+cR,=UUONX,@@dSUIY3eY]gG3<3(Jc70OWc.JAUEA6
N;KgO,R,dgfM-))5-V=\NO(W(cM1-<M:E<ZY5TXB&G60V)XSGEP6>=J.7=G?87P.
OLHJ;&],c(A6B#UA4(\f^?9>0MRN:-d.8-NdS1+7EXdP=+;)Z:S1FU.E?\(50)bQ
WO62_NI8H>;:?-cf7G#a/?GAZ9<Y:4F_()VY;Fg]0Sg<a]Y2:NUN([-+VT84U]GC
NSMc#9@(;4QgEeN?03OD_6W-Q]g^QK#^gH(gf+]GVb)Y/EN+H=+-[;(:YM588CBR
]S,7.N(?C\&H)ce;99-2cE_Hb3Y#FG,(\Z<3IUVTOEXI685ZOefUfC43^4^,?SeK
#6D3O)CJTgH.8(61-\ONf5eG\6b:&FEd[+.P_]gAW#9e5#/R]\b-V.,VZVHXRJ2[
5ZdK[eY)=][L3cE]aL;(L?9/B^?4CU4f86g-HKHG<J#c:gI/67,<Z,<=<M:\Q[R4
F2BW?<PQ)SOR00@JEXT50f_0V,:)((U4]WCZ>S<]78EN.\YL:,+ISd6Y<_[6_BJ2
3SGaf]QI]0U+3:SG5MV4-O^e;+S3_c;#bfU.1CBTB0YKT69AfN9XJ@A8B&AfYDJ7
VTg-ES>&7Z\K,^CXeDLQGQAMZ;)g/)\A4-9-Ebe&&MQ5)U1GXY>gB=53/EF+L#:;
IOcSUb<gNNQ3e@GKHQ.#EKL3SN6Q#eSI@W@?(F^2E<:([Z8ZeHaLDba3,GaVGRIM
+UN4S;cJ&d_._KDJWLc>VZ/?LW,\0@<&VD\AM54gBa.:&81=+=K]JQ[XT8d+XUeR
7A9NCT+ED8/[OadNN>#,E5QQCF4,.XO_V6XS#B2D<X2P-A2f0bGB/@Nd_L]N5DR#
.fG74b<=dASdCf<P6_#\[OFWBC8#>#=;CB4+?M:>T+7d/I668XY5F:cL7T>f82c.
\>1Ee=MCU5ZF)=^N>+MDe=K28M#VdYKc4H+]8&-#1.,E0UCbP7)g87[HM7I.f9UW
b]A0E.=4FK(:cK2Y]SB(BDe?5faBIFDKO/bGX.I3M4F)CfC/DHHS+KIE(TL<QZK.
P;Q^1DT6fCdHSdA<4B5A<@db6NHC])2e;C\ZFSF/RMa\;a51/)I7)BF,V;_c@GJ;
DJV^J@)#Z)fWOT+I:ZO:B#)OKW>YMG8@?Y.>12f8SXaZ#(]c]^YU6?07QT5cf+8Q
H)M>M9f#TJ(W^\)?28H98XJ3T>W&&](3JPN(A(6X(#=_#:JYbQCZA7b/;ESR<9CR
X?=V_^ETeIG>0[H=;+&=aJ@NGV-7YdQ[.-<J6Y)QXV)b85L@(UD#6Q@Ae.G&f;&B
0f18XE2T-&5_UWIQ.;0C1;#^RV^L[\[3F@V;A#^g^5DKQ-:<R)+-,Q;6<BP8?N8:
J8P0@_02c_(DBd+]HSGZ<O4I2S^1XL&D<NU:?6\WQG;eA^-2CD.P)a?M9bY=DD.H
XgU2:g?.RF@1,,&J-/1c889RI<3;Bc;5#eN2/:U-=AK6@b5dZb.PbUQ4#.9BW5gV
U,@2X^^ebRYKZf<I@U_R:=<5V(?Z,Y)Z?+ND/d6_aVWMK(>c78gMcJ:ICSE#^RGD
@a/-B?\XZ#g,)cf:eU1.(&/>6<G-DLb>&C26OU_Lb:R/^E224.TGA.\I7NR5;=Hc
1B&_=bCH[BV_MPJ78+&Y(PIOL8-F[]=S3fQKP5V6RK)(;Q.D.KJ)?&\Ua8\J.(=&
+<7dGFZF1\N2Te@b];O3HBY&(U5O^_5])N7,+<:VeW>DOZg2?\2<V5AHWY8]f7?Y
4;Yc[C^:KL>H;a9U=#EB>=>EDb9=d7_16=D5B@eY2-N8-P6cPJLX&3,3_,&.<^F?
>77\9;I^VfdW9B&7GS.a>0B]1/EQ9dbF2F^0/@IG2LA62:N=L3F7=Ma@X;JXBJM3
2-?bLB_V3J>d[Qg+4+NYcgd?T&@;TS:3_cB]\/XN#\ARR=V:4B26_^Ug;A(c2K)_
PQ(G9F0IcWCd0$
`endprotected

`else
    always @ (posedge clk) begin : corrupt_alert_PROC
      integer updated_count;

      updated_count = change_count;

      if (next_alert1 == 1'b1) begin
`ifndef DW_SUPPRESS_WARN
          $display ("WARNING: %m:\n at time = %0t: Operand input change on DW_mult_seq during calculation (configured without an input register) will cause corrupted results if operation is allowed to complete.", $time);
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
	$display("##    This instance of DW_mult_seq has encountered %0d change(s)", updated_count);
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
gUYbML,=;W@UPCLXA7KT0=Z3Q?CbL+)6-/5W7e,ECPe)KW,bCW8L.)\YGa+<>L@.
/]4D1J#[[L.UOA6=@5@KNP,]#<SE]PNUA[B[EISM(9<8^T3PPDCV.T/A-M-SUS1>
X8CLIAAP7agIad:YZ:YKNE)=:P.=JBK#=T;G7,1>@+:X4a)ZKZ&DG8LSF=@1)D;O
cQRGJbdYBDYU#4T?Y;C=BNLSdOYA5:,[7X>FI)U92;<[1.^\U4@/#?TQbWLeO5TC
TEbc_MG;U(#=J0OA2eISPRJ?L<6+&R1PA4NC>O<b:XU[L[;F,ec@g[9bcL2[_AXK
RZ5=]gS2O^d)YO/KNAaNd?,5-Z,6(GAd&)GV<KBQ)O5?f-?;e5]BC;L3C]WJ\cbH
<F_bUf,)/+AG-NPQ,D<4cJP@Zb_(,d)ZaXXdbV5]aTf]cgD]_e930?cQA52#8[2f
H^#Y./CX<2_fN)aYb5PB<1H0U]eJ1LSE<eg[4WR;EYNFL<4QL\\IL?(MVeUNY0AY
GDH7S.c7]ZIS&?Q4dBB3IX+@V[XCML)f7H;5cg09+HOOdQ./We+J0(GeFGE0>/62
g=-^b7@Z9,)V6[dD>,eb:&J>N=NJWJCP[MZ0^5,L&7e;<1<.[bF+LS<D3DC,XF->
KYAHeg/FIM,(.7\,T7R^A><#<RL,^5.A>$
`endprotected

`else
  `ifndef DW_SUPPRESS_WARN
    always @ (posedge clk) begin : corrupt_alert2_PROC
      if (next_alert2 == 1'b1) begin
        $display( "## Warning from %m: DW_mult_seq operand input change near %0d causes output to no longer retain result of previous operation.", $time);
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

  assign product      = ((((input_mode==0)&&(output_mode==0)) || (early_start == 1)) && start == 1'b1) ?
			  {a_width+b_width{1'bX}} :
                          (corrupt_data === 1'b0)? ext_product : {a_width+b_width{1'bX}};


 
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




