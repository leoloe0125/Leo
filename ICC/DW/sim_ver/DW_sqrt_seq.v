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
// VERSION:   Verilog Simulation Model for DW_sqrt_seq
//
// DesignWare_version: 6993deb4
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////

//------------------------------------------------------------------------------
//
//ABSTRACT:  Sequential Square Root 
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
//             during the first cycle of calculation (related to STAR 9000506330)
// 1/5/12 RJK Change behavior when input changes during calculation with
//          input_mode = 0 to corrupt output (STAR 9000506330)
//
//------------------------------------------------------------------------------

module DW_sqrt_seq ( clk, rst_n, hold, start, a, complete, root);


// parameters 

  parameter  integer width       = 6; 
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
  input [width-1:0] a;

  output complete;
  output [(width+1)/2-1:0] root;

//-----------------------------------------------------------------------------
// synopsys translate_off

//------------------------------------------------------------------------------
localparam signed [31:0] CYC_CONT = (input_mode==1 & output_mode==1 & early_start==0)? 3 :
                                    (input_mode==early_start & output_mode==0)? 1 : 2;

//------------------------------------------------------------------------------
  // include modeling functions
`include "DW_sqrt_function.inc"
 
//-------------------Integers-----------------------
  integer count;
  integer next_count;
 

//-----------------------------------------------------------------------------
// wire and registers 

  wire clk, rst_n;
  wire hold, start;
  wire [width-1:0] a;
  wire complete;
  wire [(width+1)/2-1:0] root;

  wire [(width+1)/2-1:0] temp_root;
  reg [(width+1)/2-1:0] ext_root;
  reg [(width+1)/2-1:0] next_root;
 
  reg [width-1:0]   in1;
  reg [width-1:0]   next_in1;

  wire start_n;
  wire hold_n;
  reg ext_complete;
  reg next_complete;
 


//-----------------------------------------------------------------------------
  
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    
    
    if (width < 6) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter width (lower bound: 6)",
	width );
    end
    
    if ( (num_cyc < 3) || (num_cyc > (width+1)/2) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter num_cyc (legal range: 3 to (width+1)/2)",
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
  assign temp_root    = (tc_mode)? DWF_sqrt_tc (in1): DWF_sqrt_uns (in1); 

// Begin combinational next state assignments
  always @ (start or hold or a or count or in1 or temp_root or ext_root or ext_complete) begin : a1000_PROC
    if (start === 1'b1) begin                   // Start operation
      next_in1      = a;
      next_count    = 0;
      next_complete = 1'b0;
      next_root     = {(width+1)/2{1'bX}};
    end else if (start === 1'b0) begin          // Normal operation
      if (hold===1'b0) begin
        if (count >= (num_cyc+CYC_CONT-4)) begin
          next_in1      = in1;
          next_count    = count; 
          next_complete = 1'b1;
          next_root     = temp_root;
        end else if (count === -1) begin
          next_in1      = {width{1'bX}};
          next_count    = -1; 
          next_complete = 1'bX;
          next_root     = {(width+1)/2{1'bX}};
        end else begin
          next_in1      = in1;
          next_count    = count+1; 
          next_complete = 1'b0;
          next_root     = {(width+1)/2{1'bX}} ;
        end
      end else if (hold === 1'b1) begin         // Hold operation
        next_in1      = in1;
        next_count    = count; 
        next_complete = ext_complete;
        next_root     = ext_root;
      end else begin                            // hold == X
        next_in1      = {width{1'bX}};
        next_count    = -1;
        next_complete = 1'bX;
        next_root     = {(width+1)/2{1'bX}};
      end
    end else begin                              // start == X
      next_in1      = {width{1'bX}};
      next_count    = -1;
      next_complete = 1'bX;
      next_root     = {(width+1)/2{1'bX}};
    end
  end
// end combinational next state assignments

generate
  if (rst_mode == 0) begin : GEN_RM_EQ_0

  // Begin sequential assignments   
    always @ ( posedge clk or negedge rst_n ) begin: ar_register_PROC
      if (rst_n === 1'b0) begin                 // initialize everything asyn reset
        count        <= 0;
        in1          <= 0;
        ext_root     <= 0;
        ext_complete <= 0;
      end else if (rst_n === 1'b1) begin        // rst_n == 1
        count        <= next_count;
        in1          <= next_in1;
        ext_root     <= next_root;
        ext_complete <= next_complete & start_n;
      end else begin                            // rst_n == X
        count        <= -1;
        in1          <= {width{1'bX}};
        ext_root     <= {(width+1)/2{1'bX}};
        ext_complete <= 1'bX;
      end 
   end // ar_register_PROC

  end else begin : GEN_RM_NE_0

  // Begin sequential assignments   
    always @ ( posedge clk ) begin: sr_register_PROC 
      if (rst_n === 1'b0) begin                 // initialize everything syn reset
        count        <= 0;
        in1          <= 0;
        ext_root     <= 0;
        ext_complete <= 0;
      end else if (rst_n === 1'b1) begin        // rst_n == 1
        count        <= next_count;
        in1          <= next_in1;
        ext_root     <= next_root;
        ext_complete <= next_complete & start_n;
      end else begin                            // rst_n == X
        count        <= -1;
        in1          <= {width{1'bX}};
        ext_root     <= {(width+1)/2{1'bX}};
        ext_complete <= 1'bX;
      end 
    end // sr_register_PROC

  end
endgenerate

  wire corrupt_data;

generate
  if (input_mode == 0) begin : GEN_IM_EQ_0

    localparam [0:0] NO_OUT_REG = (output_mode == 0)? 1'b1 : 1'b0;
    reg [width-1:0] ina_hist;
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
	    change_count    <= 0;

	  init_complete   <= 1'b0;
	  corrupt_data_int <= 1'b0;
	end else begin
	  if ( rst_n === 1'b1) begin
	    if ((hold != 1'b1) || (start == 1'b1)) begin
	      ina_hist        <= a;
	      change_count    <= (start == 1'b1)? 0 :
	                         (next_alert1 == 1'b1)? change_count + 1 : change_count;
	    end

	    init_complete   <= init_complete | start;
	    corrupt_data_int<= next_corrupt_data | (corrupt_data_int & ~start);
	  end else begin
	    ina_hist        <= {width{1'bx}};
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
	    change_count    <= 0;
	  init_complete   <= 1'b0;
	  corrupt_data_int <= 1'b0;
	end else begin
	  if ( rst_n === 1'b1) begin
	    if ((hold != 1'b1) || (start == 1'b1)) begin
	      ina_hist        <= a;
	      change_count    <= (start == 1'b1)? 0 :
	                         (next_alert1 == 1'b1)? change_count + 1 : change_count;
	    end

	    init_complete   <= init_complete | start;
	    corrupt_data_int<= next_corrupt_data | (corrupt_data_int & ~start);
	  end else begin
	    ina_hist        <= {width{1'bx}};
	    init_complete    <= 1'bx;
	    corrupt_data_int <= 1'bX;
	    change_count     <= -1;
	  end
	end
      end
    end // GEN_A_RM_NE_0

    assign data_input_activity =  ((a !== ina_hist)?1'b1:1'b0) & rst_n;

    assign next_corrupt_data = (NO_OUT_REG | ~complete) &
                              (data_input_activity & ~start &
					~hold & init_complete);

`ifdef UPF_POWER_AWARE
  `protected
3CELTfB62EW9)La.FKJcbZL6B3fb;]J#M=eS&PZ<C?L(R+DW?3J94)+Fa(MgBd@K
(U;OR;=YU\-H,=6>YEY8cLFQG8VV\G1Z\6XgW:\d(K<Ha]c5eOZ^^gJMWZG^KN?a
>;Y^Y)AVWDI;V#/<.6L0D--FT)^NcdI0:T^<b;Y@/F:4cD9&VCIVQ7C,@;RS3)a?
3N+>:5_S<6H[)W[e?,ZI3Ve8=2(6;FB,SK1L-U,[&=(<WbONW>(4_#-_:=U0;SG+
7d.e)3Y(#KH;f:d\I?1]1\XgKQ=6P:L]5HQaDe<N7a]P#2=\;4)JS:52eF,X34BY
NbHO/JGI=5J&C>46LH],PeJYBQ2\#>FYLF\^dB-eb)T=;,6MLK?^bOFT9Y6VP]T0
M6UWcC5NEVG9S^T[\3RBeeD<2;;PTLY<.JLQ^8])PF0FSO[YU,=3SS153)2\gQb&
>SMbOg<Dc#-aVcSJR8g5EG7/S(TCJ8VO:+QQ95;I@9?a16FB>J,4YafHMHH^&:=D
/1Q,A&E2NR[I\Z#UWM,/aV6U)RFgP1GA0[a_N@5a4GIRO+H?J#bbSX_3G>4a^]0]
ReYQI-ZP7Fee28a:=KALb9&NONb<KeP[JBX,1<>^IP1Q]WeCW#\P8TbTM<]A9X^,
@/=>fEJ-H94B?Q.L@7;W9KJ3F/PHe(e1)PQ)X=4MRg+WVCP(8L+H^c)Ed+H=L1df
cQBZJ@AD\(DeQ2EPR?I^Aed)^f)MVLA49DL]V8J&:Y\J,4D^NB^>P)EbYYZ)Of]R
X4CT#aOEW8]1&fFWNC1Z-GS98C=H6;VV9/g22/O_L=WVUJ1]/;FR^?>;VJJ:J,_O
cM4JN;B7/M2<0Y]d[32E<0LAOf6_YB(8&&9.#J\+?Z--^(44\-=#FP?MN?1c.:b-
_R<;W<3:F=JgO<G2D7JS21&S9&TXE8T[A?DC<+>/9XKHV18^=_1^O_UBJJZEXC:b
/;SKHHUPN(aY#.1K/BL>5cS&e]KA0B9T_JC_U[MA&(^f\_8]^LGQN9_fcZ0)SCG9
9GNBEX6;)7J7b2?LIgDH<V-6KeV&-+7I_d0&3R943bJe,c)J0e:YbCH0,HYa-f:I
gU2??DVD+27WLSPSPFe-30HEP.I?cB0KKB>#1H-749D/A;HX+?9PaREb.3\_X],1
5TGW&Z\X@9S=7bG9XA_+T__)DbZL5K5EZ.OKaU@.Jb))GfZAQ3TU^3X=PXH.fDZV
\3X(A0Z^d/]-Z:d+c[+Y.^]YMD.2^>MRO\>_BZW4<AH?2AY\G3cI6d[YC0f;c)bU
<THUJ#N,=W#5RL^&0/C0H<_bNd8\2@[=e)X&?FR6]_e@5O:B/;Y2DJMTI\+<+?f<
Z,&TVFW&F][(<FZB_gU<W(&<\4=cA0F^0//\KRTWVXXP3_MU<DH\DZ#M;PE:O2;+
WcGBXME<\]04K\MBGeWX32Y<9-ee+N8K@FZ<BN./a.7E8?6H),e&A\@^N/0RE13D
,5+cOS?ZANQ.-9QWW?_Z(OePNbQ_-c,?6<YT,MgJ4La77][E=(R?/cFG?M+BXFJ\
aP2;E1-^K^,4Y6DFM\P8_-^T@bT7ZH8,BVU7E3R787((H242@4U5/N+a[LW62GN\
Q7,GX.GO7+IB@X/&D[fNDdZL,FB;6eL)2I3+D9)E8OOO=9O]Y0>6M6<C55@]0I)Q
).cLDEc+;Q8TE2bPE1;#PY_FLWLMTOJN;@c[PM-39B<T<EMP8.([KZY>2OJY.85T
1)+OH9E7I-Ec1Ff/DHH=VJU^g4/VVA,g]Mbf<BK8-_B):/B0G4Bc9ERE?01MUS&+
d8=BN0E[;Be@]\IX]JWXX3d?:8T4#N2&TC<[JN=QXVCVf/R]:eRS/HU:B&?U@4C#
eM)_[KH?HG/K#[RU83Z_/\[L0?OUHDIbM/7A^Aa^8M;K?1.HK#==-3K.c]@[ED,A
B]:@#/2cPedXJ_27?L[[P_6#b#;6CXN9[97(D^3(c\QfgZM_VR]H.+>(FK/d8,\+
E&18])T5Ge9M>9MGP&H;;6APDS(:Vb:QNBON=Q>.[5\G#3R>;c5DTS0M>GU9:dcQ
EE//.EI2+=#3_T_>\6bA8E=#Q+cc(IZ1>4TMGSGgE40X1Z^J3dKdgP?[b>?J[1ZR
I&BCHI)f3e_:YMD5X#9T,cKX[([Y)M?5__&A0gCN]3=WSe#aWDGCOIC9Q2GfS##D
]:7g_2K[SCDVc>CBQ:(2STMXLUPT2XF6V@KGdRCMK]X<[X=9-CD@BEXNYDZPA7:+
UU4HQ?<def+<BR<\G6[I;;bAcD]Z,Q>cPSV4@S,V9#A=ZfBdJ[L8g9(g)=1./T#^
]7/<_O4QC,5#ORaO\H5\EUK&,S5][]^IA;0\eSUe))_(;JY-fG;_LEP>Rb:O:YV.
^^dY[Ef)^KY(:S.a))dF&O^g;J@XR.e7R]9,R]PD/5dJbY72J\d,J38=JE;)LA3<
f1JG<-dW8^3@U-fJ_1I-F6&3g:UTYF.B18=2IAE^BQ=FWK7X9OcdRGEC6;>fU,4U
R2H&\_OAT3R\JY:8S>a.-:LGgYD&HFZ=f)YN[S(bQ>5/^\3f>AJ.f2.EU<g88O[]
X752Ke)WB@HFD8(dPB2Z&7(M,])A/5V]@BBOX/_6<@DMJ\C\<ABd00<\DKH_HNB9
75;eeB>a.)KF0$
`endprotected

`else
    always @ (posedge clk) begin : corrupt_alert_PROC
      integer updated_count;

      updated_count = change_count;

      if (next_alert1 == 1'b1) begin
`ifndef DW_SUPPRESS_WARN
          $display ("WARNING: %m:\n at time = %0t: Operand input change on DW_sqrt_seq during calculation (configured without an input register) will cause corrupted results if operation is allowed to complete.", $time);
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
	$display("##    This instance of DW_sqrt_seq has encountered %0d change(s)", updated_count);
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
T7a&<I?-]NPg2N<X-bRb9FBZHN,:73f=SOgaRNb9G13-Z+6<fbfe7)N18DH[?=e4
:IL[AGD-,60cRLA\UJUWI5\a4A:dUe>,V9dZU2WIOXUG</L<^aIU/@\=a62ZM5PA
Uc:-T+DKUegC95VXTaG.AUW>eP;6#E88eV=.?\@FYE4,XT6,GDZ#g6@fWJR[IOP&
N7L199@R&(gC8P3FCQV(2]>]O@Q3ebL>^SX1BGL922_C0E32Q/?[.67P[JFgc#OW
^g:YgM,7\>\5UVL28:8.#.,RC3f>2GLfVN@9^57aUZ_E0)F#Ed+5Y&\7de+.0(X\
WD3\daLYVgX3d\MU+6=L(6Y3d?&4(8>f>U9](]1FOL&g(<QQXZ[a-;1I&cY)_UK=
/#eFMR13\CY7JZRAYVQ0#DD9?@-AHIP55-:\M.3S&efRM@,MPL&7FO9(Cg3c+J=P
?6H34@)U\7L3,3(P[]BP&bF<VA]WFR?fUU#TR#,Q_RUHXGG#cKQ]Z9=X?HT;8(F,
R+CVc+JOWD9+4+K5_d]+2V.0fE#5_gX&QHX.@FMS)HEWYAC?Xg&U-(I>Q?_W#b,4
3abV)^&Q#YGHcREU-DE-Y88MSJX&Z.]dY=^;=g;W^V)_P5J4a27K9=6,HASU7T?)
PH9Z#A0#@#)WZE+bPcVCcSU&?W>3[VD0>$
`endprotected

`else
  `ifndef DW_SUPPRESS_WARN
    always @ (posedge clk) begin : corrupt_alert2_PROC
      if (next_alert2 == 1'b1) begin
        $display( "## Warning from %m: DW_sqrt_seq operand input change near %0d causes output to no longer retain result of previous operation.", $time);
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

  assign root         = ((((input_mode==0)&&(output_mode==0))||(early_start==1)) & start == 1'b1) ?
			     {(width+1)/2{1'bX}} :
                             (corrupt_data === 1'b0)? ext_root : {(width+1)/2{1'bX}} ;

 
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




