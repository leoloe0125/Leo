////////////////////////////////////////////////////////////////////////////////
//
//       This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 2000  - 2023 SYNOPSYS INC.
//                           ALL RIGHTS RESERVED
//
//       The entire notice above must be reproduced on all authorized
//     copies.
//
// AUTHOR:    Rick Kelly        07/28/2000
//
// VERSION:   Verilog Simulation Model for DW02_tree
//
// DesignWare_version: a49cfff2
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////

//-----------------------------------------------------------------------------------
//
// ABSTRACT:  Wallace Tree Summer with Carry Save output
//
// MODIFIED:
//            Aamir Farooqui 7/11/02
//            Corrected parameter checking, simplied sim model, and X_processing
//
//            Alex Tenca  6/20/2011
//            Introduced a new parameter (verif_en) that allows the use of random 
//            CS output values, instead of the fixed CS representation used in 
//            the original model. By "fixed" we mean: the CS output is always the
//            the same for the same input values. By using a randomization process,
//            the CS output for a given input value will change with time. The CS
//            output takes one of the possible CS representations that correspond
//            to the binary output of the DW02_tree. For example: for binary (0110)
//            sometimes the output is (0101,0001), sometimes (0110,0000), sometimes
//            (1100,1010), etc. These are all valid CS representations of 6.
//            Options for the CS output behavior are (based on verif_en parameter):
//              0 - old behavior (fixed CS representation)
//              1 - fully random CS output
//
//            RJK 9/22/2021
//            Corrected coding of conditional suppression of warnings to
//            avoid semantic error when DW_SUPPRESS_WARN Verilog macro
//            is defined.  STAR 3884129
//
//            RJK 2/3/2023
//            Revert warning message for verif_en parameter value not
//            aggresive enough so that it can't be disabled (STAR 4360627)
//------------------------------------------------------------------------------
//

module DW02_tree( INPUT, OUT0, OUT1 );

// parameters
parameter integer num_inputs = 8;
parameter integer input_width = 8;
parameter integer verif_en = 1;


//-----------------------------------------------------------------------------
// ports
input [num_inputs*input_width-1 : 0]	INPUT;
output [input_width-1:0]		OUT0, OUT1;

//-----------------------------------------------------------------------------
// synopsys translate_off
reg    [input_width-1:0]		OII0OOOI, O001l0I0;
wire   [input_width-1:0]                out0_rnd_cs_full, out1_rnd_cs_full;
wire   [input_width-1:0]                out_fixed_cs,out_rnd_cs_full;

//-----------------------------------------------------------------------------
  
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    
    
    if (num_inputs < 1) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter num_inputs (lower bound: 1)",
	num_inputs );
    end
    
    if (input_width < 1) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter input_width (lower bound: 1)",
	input_width );
    end
    
    if ( (verif_en < 0) || (verif_en > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter verif_en (legal range: 0 to 1)",
	verif_en );
    end
  
    if ( param_err_flg == 1) begin
      $display(
        "%m :\n  Simulation aborted due to invalid parameter value(s)");
      $finish;
    end

  end // parameter_check 


initial begin : verif_en_warning
  if (verif_en < 1) begin
    $display( "" );
    $display("Warning: from DW02_tree at %m");
    $display("    The parameter 'verif_en' controls the output randomness. The designer has\n    a better simulation environment to discover design problems related\n    to incorrect carry-save manipulation when using a recommended value\n    1.\n\n  Value of verif_en set on this instance is currently, %0d", verif_en );
    $display( "" );
    $display( "    For more information on this, see the 'Simulation Using Random\n    Carry-save Representation' section of the data sheet in the synthesis\n    release at $SYNOPSYS/dw/doc/datasheets/dw02_tree.pdf" );
    $display( "" );
  end
end // verif_en_warning

//-----------------------------------------------------------------------------


`protected
^(#^DC(9)+4G/NGV_B0cQ):JK73\3P?IJK#(:SbZBXUL>b+d8a@_()S13U-71Q-I
5cYK;[)B?Id#/F?IO<\NRCd2.d-<Gc<Y]<=\O>:cN^KV,c_]7gag9fW=U7<bf14H
#((R:Y?aGG3U<)6P/NYg6,+bMVBZ>/8[df6Y5C406;,ZP@5Jg9/LAL#_Q@AEJ74^
=#:VW91>>24>]BNH61+>_^+_E[g&=/KFJD?6P#EFZE&]_IKGf+811?XTZ.d^;LYL
;^4[?RE7>CF;;E\ScKR[682(.:4+MJQfY>1VBPC[&;CYI.\C0KRdYLcHT:1P>P#^
<)QPeVWFYR@Kc+^SCROY1bWQ2<=1#7/#PO06@KK6L_-PGcS#VM1C<5b4]Ab:15J8
Z9_a9S/+GWI,1-D_N.C[Y#(B(W/ON7KG-DBW4HK:=NgAb_._+RBCEK?ZJ.X.?N?N
TNV+,g0ZfISZ-,BE=PB]NZ:64#)F5@dO1YUY#<e/HA=7-+@PEF(;FS]537@4,HBM
LTbDD6@0)P?,=-d53.PADW1W+cK\Y=(fA0U8UKf-6?O-D)L3JQG>4acafdPcM/,c
S#C>ZHb02agIa@>UWTPI8Jca8^T.SUW\7&0B+UDf=RH2]5>.dWYVJ>UKZTB@:&)>
8JHXMEYESOZ]R0cbX1H0TZTPdNeD(/N5?[8,8_Q;<#A+c9<:[bTEJV2981TMYWP<
@a6@U-5^eCG+).CJDE29LSIa)aFJ5,U2_]fdKM>]HcMbNHF_X\A\c?W3T5^6[a61
U<@OF.+39MFPQE8FN)g<47O=IA1cI6?E0H)D::2QS7[IEK<Y3Wfc?.2bA=<>GOeC
301X&75=[A?9TTV2Z(^#(=JR4M2-L/J-(?YZ(QR:6L=/4f\];V[XRBYK2+;1)SFd
C7(B0);I@cE4fW6@0.DL/.QeTbVA75fN+@LU+;7,/1bV4TL#V8QZPP22TN:EN-^)
&;L6X&?T:^-7JL5\2O[.4M,aT(GQ[Oc=9Ia0M<@O)QbJBR\I/,3F12Nb,Q#-);&M
Efc:[,579Ea<?>f2]+^cMd9W)XN:bM=>U46M#DTd04c^P=^FVL.>4#(:cK0R+Hae
GVTN6;V&.a[;3&AVY3)bVU,S<aPXg>IT8QIdWNB[?8^fdfQ::[L-[RI=af#HK#V,
GRJ(&\X4P29>(]F=Zb6;RCb3B#a6\L\IFJf;+YeZ4=d6UW2e6?S0V;&GI#=^G57H
B)DTRd^_JT^NWI+Y&K(T.GJ#;5\Z8D5_b-@&7TR+g-5[XeOb,1<YCM6-88#ad)4_
:3^45EO[K;QGdJ(X?&P_V#X53K&e;-;_AV<PWEA@11/adOFcJN>77(UIcC\N/FcC
;1&T4aL8b6:\I4,7WGP<GNB11MU0_AI+[D)g\Y1(U111^L=d8_ZF1ab9HaKTNMQL
4TEUF;8Je(K:]:C1HA2T457=>/OL;b_,UAd6QO+c=9<HY8(/0@2>3?;28KEf,#CZ
+aHWM-(_JJ696-+.-JDV04@IWS+d=A#4?5UGF)g\IO>40:KTIacW&GRO49+[GgU/
3AE8AK1O71-ATB._U@bTb33#S#LdY9?2B-_9A98#2TYc/1gE,[OJ(UKg8S.5Xbb-
<81-;NGB^bIed7cLL1(RE&Lc=77I;QdQ,cR<-X#G5#KDO6dd/6Z?,UIXR(Fd01MY
++=eAcY4^\fE:?S#)1+5<Ze7-c8PJIbUD,/=N,@L\P5O=N<,D?(S@aZ;8DWW;<WP
:1RJfT@_[4.5;9COU.PZeFK)5IV5<S3G[@I]b):#,7,MQ+YA?P4\K&cWKE)4#F,7
X_48G2=U[8:TPS&LY^0/=?SfAWJf]-c+@S_.OM9B?fD;VX?E#N?2-K[+#[W+fMeY
?X[(+B?40:B6G^\Xb/dOJ/E4)Oc]4AAagL51]2NYfb2=M(,@HV5]b+I(24e.JK7\
JA-g:[d,G(W<-R1PTKY;.J_H0X_d>ZR.#:;5;ACG>-7EUde;O;<X2Q-?^4?+#a.]
\,7LN>RLC@L3(H#;7XQ=:c3ZD]>c<KA&&P@VfK(9EBQ<HV([\)-U6aS8NHM\Wc(N
F^;Vb](4+-/A2N86fg<ZP_S_89PMc:CfM^<Zg3=)[B<1/L4M&QP3>_^<Ce-If+A.
8b,Hb8>2W]0O+F-M6[PE:4GG=<^7KcKL_,8]F@P&Sd,R1C&1^D[PR:Pc_=YJ\B1&
?O\V,C<KF]BCWBXZaG(M@ae/)8e3X1-/)#YYfaW:Q<8D)dR-d]:H[^T9I=699e\I
eZ+0V02PbEEWJYVL&8bA0OR\02Z1Jg\_#LFG,CG.&?F=-f[=OUG.YbCB(CGR),V=
e>C]XAB)eg3MY?d2HQFSIHaF@U/L4DP_[QM(6f<B0O4BU_7IXgdRJY1W\<\1@#B/
WZ+IHbZc/F,Vb^G^85NU0[@EXe4<C_E4QDCSB&N552\95[C\=,-?dcgbgQ/4)VYI
3OL2Q+.WSTG:4bbL&)Qg(]:Jg/_a^A5]/,>HN3DR4;0)52A<SSR-#N]f[J<)1?5g
W#PR/F8UW7N9_WG3I.X2UOBAY3Pe,bOFY?3((&HFW#F3F]BVbJA?J^b@E<=G]X0X
F>6gKfPJ(_9aY@XNWB7Y\EPV).F1)_FV@0AGI[YOO0T,=fJ-eI<K3b<;>K)I-c3>
)Kc3,\U+;QcEF+E3?bI=)>]>]@WTN:+DcH6\?:A?:L36HGJTDK(Z-+D);AeN=e^(
)BY?9Q0#?STNGgJb<dC=LJTBe?_3/>4M+;XGRa9F2J]B&GOB=B9C10,bUf-4;J6Y
Z_OYFUA[FW:f@3TR;Y^#FASfR10eHC:@GeC9RM)P>\SV3V-Kf&a_g58cUaCQ_(dD
8EG<\WOPB9L)F0O;4<^]JYBL/2.49O[ENeX/UOeIT#T<IabPeaF=DP>963M0/L^_
.SI<)K_M?HCW()fO7)[VSK2\cS2,b,^89.R,b-1(+KSF,RCT9bb(g95J-R?@\8L7
(::YOT0V#eO[U-O1e4ESP#=24c6c67=,?SHGD1O;)eN:f8Y;@Wd:.)Bg^PgY(6FR
X2K)E45A0K1Oa+f?cdQU;b;#<ADYE[g\1+UeIJXQAg1e&HV1U8F-O0CNL#\E#WUI
EKA]M:20L5GVI)K^5VP=.N:V<H1,5?.,NYJB1P/XbA,\)O\M1BJW(RX4:c>C7UU+
K-;cIaU,[V:N6KR;YeX<=;fg5#/#OW(6>gXe/V-8>773K[e+5HJ&\P999CKAY#&g
Ye.]FQK7AIX.a=E[?]/.0^7K#)g4Y(PC&cZDT:E\Y]DI(HH-(;@._9-;AW8HEfO&
65Ha+Udg?8M+cI5cV#_gFZ<^65X/^U;6f[IM]:1S;:8^Q>TSCONO<D5P4=F>)Y[(
cR1KK<OPOdDPL4RJ\^P/.,0eFTU/<IIA=.;G&Oa^N&Te[9DVJU/dUK6I8DYF:e=1
d.<d^GAXSEeK66GRc46WWJ6X<:[ZcJ#7WS]YQ1^LR^3]=&:W?662NaGG^IO_N?gB
7+/>#/aU^:=;IFKGZRM@aI>&GJE)QPXME;NUSF<#C5DaK+aDHbVN,M_c>]fM<DEK
]V:bW8/<N-Rf9JIZGB3X=;U.R?]F]92ZRE,1<G__KJ33ZZ]1S8Tb_//,)7Z:N9>\
afH+ccY8GWI&-@S9A:4JL635/PeM;54/=DNF^1[;HMW3A+@Y;5.A>G>eH<+HdeTU
Z=6Wdc7XAX&=Q0/1+TD.@4EWMWK4Q++FVLHZ;f@9EO#E=Y1dG.a/>QK5NF_I7g\;
Cf65X\HACT89CNd:1UfN^552PR<1<J<H,O&NM:0F8H<QcYfH?/-SP@P3P4ZT<>A)
F[@TZ3)UGB@^,A2CN&GE&?]GF]+@H294;CS\XCG_P17I8>TIc8I2+MX+SDd0Cc&X
=5fbV\VC4OH(;;)?X=Jebaa&.ZH4c\3fe@cODM^Qc.F@=L:/8=GP>&&ZBMg8NKYV
H_4&=GV>>L)K_>Z.RI^49NI#=R<bgKY[Dc=3):2WJYV6,2\=gK&YUZ3(>?SF=]QI
/UH:5(&-D<_I>Qf2&>8FR]DX.S3#(0&+6T;R&4e^UX2U[3OL_K.BS-^0:S/^b&6#
g6^U2S:DdXP>>.W?<^_+VW65/KPR@U]^.:I0A9G<4e?E2d/3^gaL3+XaF8#a4V,g
5,L<<MaM^,Z64=1-4+B\57C_Y@c#G#W96UZB_Le6];D@dH5dK]MKLQc\CD..S)&T
Q+^(\Ge9R:S-QU)OLN?cG51:YM)CLgfRD#C1&Yf\#bD-^QP#G&W8KIc61cH+XE)@
,QA)HI:I4ZfC#a,[]GIH1Z1JP0CA9U^X;GFU[/\J.g8\XKZ)RRcWE_f,aS1f6V52
60^d@P88N@c/b;T:+I]gG58BM+/DdT()>+>dZW9BWHGAb6.c,-/1Fc>=KKXG<VBX
C#bZ:A8YN&,cLU^N@NU.e\E6A3^P5U;ZHE2I+2Gb7IEd1A)JJc2U_>I&C6Y;ZE6?
37=OgG-9AGKXZ-;HfR@a=(F837G+OQ?gBc(/MW0_#0.FTG/UF&gLLJT2Le?b+N#]
86@UF_a=OTXbV(fddcIPW6<aB#;T\?XTC43e,])8WAa<ZHBW5,HN,L;=2H[WP(-J
N.Z=A<^e>_c:?O=<W_WTg6<a8$
`endprotected


// synopsys translate_on

endmodule
