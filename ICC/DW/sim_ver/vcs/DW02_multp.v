////////////////////////////////////////////////////////////////////////////////
//
//       This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 1998  - 2023 SYNOPSYS INC.
//                           ALL RIGHTS RESERVED
//
//       The entire notice above must be reproduced on all authorized
//     copies.
//
// AUTHOR:    Rick Kelly               November 3, 1998
//
// VERSION:   Verilog Simulation Model for DW02_multp
//
// DesignWare_version: 0af73802
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////

//-----------------------------------------------------------------------------
//
// ABSTRACT:  Multiplier, partial products
//
//    **** >>>>  NOTE:	This model is architecturally different
//			from the 'wall' implementation of DW02_multp
//			but will generate exactly the same result
//			once the two partial product outputs are
//			added together
//
// MODIFIED:
//
//              Aamir Farooqui 7/11/02
//              Corrected parameter simplied sim model, checking, and X_processing 
//              Alex Tenca  6/3/2011
//              Introduced a new parameter (verif_en) that allows the use of random 
//              CS output values, instead of the fixed CS representation used in 
//              the original model. By "fixed" we mean: the CS output is always the
//              the same for the same input values. By using a randomization process, 
//              the CS output for a given input value will change with time. The CS
//              output takes one of the possible CS representations that correspond 
//              to the product of the input values. For example: 3*2=6 may generate
//              sometimes the output (0101,0001), sometimes (0110,0000), sometimes
//              (1100,1010), etc. These are all valid CS representations of 6.
//              Options for the CS output behavior are (based on verif_en parameter):
//              0 - old behavior (fixed CS representation)
//              1 - partially random CS output. MSB of out0 is always '0'
//                  This behavior is similar to the old behavior, in the sense that
//                  the MSB of the old behavior has a constant bit. It differs from
//                  the old behavior because the other bits are random. The patterns
//                  are such that allow simple sign extension.
//              2 - partially random CS output. MSB of either out0 or out1 always
//                  have a '0'. The patterns allow simple sign extension.
//              3 - fully random CS output
//              Alex Tenca  12/08/2016
//              Tones down the warning message for the verif_en parameter
//              by recommending other values only when verif_en is 0 or 1
//              RJK 2/3/2023
//              Revert warning message for verif_en parameter value not
//              aggresive enough so that it can't be disabled (STAR 4360627)
//------------------------------------------------------------------------------


module DW02_multp( a, b, tc, out0, out1 );


// parameters
parameter integer a_width = 8;
parameter integer b_width = 8;
parameter integer out_width = 18;
parameter integer verif_en = 2;

// ports
input [a_width-1 : 0]	a;
input [b_width-1 : 0]	b;
input			tc;
output [out_width-1:0]	out0, out1;


//-----------------------------------------------------------------------------

  
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    
    
    if (a_width < 1) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter a_width (lower bound: 1)",
	a_width );
    end
    
    if (b_width < 1) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter b_width (lower bound: 1)",
	b_width );
    end
    
    if (out_width < (a_width+b_width+2)) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter out_width (lower bound: (a_width+b_width+2))",
	out_width );
    end
    
    if ( (verif_en < 0) || (verif_en > 3) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter verif_en (legal range: 0 to 3)",
	verif_en );
    end
  
    if ( param_err_flg == 1) begin
      $display(
        "%m :\n  Simulation aborted due to invalid parameter value(s)");
      $finish;
    end

  end // parameter_check 



initial begin : verif_en_warning
  if (verif_en < 2) begin
    $display( "" );
    $display("Warning: from DW02_multp at %m");
    $display("    The parameter 'verif_en' controls the output randomness. The designer has\n    a better simulation environment to discover design problems related\n    to incorrect carry-save manipulation when using a recommended value\n    2 or 3.\n\n  Value of verif_en set on this instance is currently, %0d", verif_en );
    $display( "" );
    $display( "    For more information on this, see the 'Simulation Using Random\n    Carry-save Representation' section of the data sheet in the synthesis\n    release at $SYNOPSYS/dw/doc/datasheets/dw02_multp.pdf" );
    $display( "" );
  end
end // verif_en_warning   


//-----------------------------------------------------------------------------
// synopsys translate_off

`protected
Ta#&VU)I@3+RH#\_Jb-BW4;6]:Y:S-FK)CYD18d,cLVbcG4RR#FD.)R&88M/aQXA
<GMXTG(6B=.6eYX\7gHW/H>JOg+90=_Y[MFBYV_=9+0WeP><cD?/a7<;:P/(VMdd
4K_UZ^=RKEAD)#JH/cGe>7#+086R4e,N>6aW36U+N;S+;ZO(JbX?9Sef\HQQAFF_
Q=b=TD_8g4/+Q)EC>E)GFXB<f]bQ5G-dVgcS]X2gB<f4U[KT,T,NV>ZfZL)05^69
4(QgW=EU<,EKX1EX8^V6PHbYO@Vc3WVE>Pd3KE#1=_g]L#Ud&N0U9;.eF)M^b3FL
^A1D?HaN#g5:e7D>]0>be^W==0X7BZCO?#8RfDEAYgY?>+HHV8e0LX7U(aB@cLX#
=G40QY^89bfUg5:81Eb;YU@3;#AT/&1\2Of^X?c+Oc,41LZ)\D5eT_cbR<2<g+_\
TAf29=(\OH=XNUZ8TDP.#Id1c8=<.M4-c82TJCO&120PC:H>46+YM=.eUP?8=SPA
A4(;@4[&,U\:g:aQ\8-[1a=PbA2=f+F]3Z#.3AK4(:]T)dF\_e69aPN?f^FZPP2B
R/4+NSPHT#,0[Vff;A/<Ya7K+^0)C4[F@M,VL79/K+8fDF^?M.cfHMAd#(C[+KGb
2gDVK35#4@V&B_1c/Z@^02ASD^B)16.X:>QP=NUA5@^/.WF5c(LDMLE6F@RBH2)U
8Q[U+VQT/J)S:S,BU<6KJ/;0Y\&1RQf]+C,&Q7GYNLc=>((BTZ)I#6;/X,C[#WH/
4^gPC:ITS\USY]2:;::.Sc:13A4BN1O.b_?#MRZ/QK/.O5.0a=e\_AG&O=1MVJ<0
]CP=5GN2518YQGSZbVE;71a2D9^MC+6)F7),/TV[M_;QWd]MIQ9?fT5;H)=MKC9?
IO23/D=@:e(MECY>9\H_4&e1[S8Dd]05I+RHN6PZ,-_f#^8]N/fOa=(YaQX#;g^9
-SVE8V<3ce2Vb\f]]Xda]@HZc@@#\GG5W-Y(;3KM]8eY2S5.cG.BBHG2-X[0eCZ]
f<3[0J3LAOFG=B.\5]NMXYB,ae.095>A)N)d[S<HZ2@[,Cfc1LbZ7#LUY]/2-EP<
K2723G\AR@^)NE:#8J,QJ0#-[VTZ?>,;J>bI5>JKgLY[-:)UTI&+-9>W8O;4Xf3g
-W5Z?BG7])X[0g92<TJ1><AJO^V&)Z17L]&U;:a+&YO5+Z1:G\RAX80)ZYS_AdM-
P]]^0>a[TTO-_[?Mc21_D#>P\MJ=WRF46F?SLWDWRX0&GWASgR):A_@EcU-2Q4QS
==5JFJ5^9_-M>0;,G7<P^@N2g>Q#1.(6TgcU4g1RC,5?Y6S-3b42KfaK3ZJ\O;>X
9[8U\c2XAV1KMJbT#@ZO?fI5#[b@F,O@O-NZ0/dWW7#FSODaTU=OD7G^M#Y/W>3T
4L(^]TC7^P+:;?e:;SS;Q&QE\?_4M.XE4YDeU@5e_U=>P2YNN/KP&0(::94eB65]
8X:5;K<9ZgO)L1c[OC2GcSc<V7K-6UZc#W8A9d^e+ReSJ;4(\N))TU?g]+-cHe.2
9fD[B+204N_5J.2e<[I<J.JX5\[4#,bBN3R\XM3OUL7,>43#>L^>H/Y7VS#7LM0f
@FWDS1;WTY]JXgKLVJE8&g\^8<eZ+c,g<?XD=D/ef\K@XHT.Y[L8@&GOT[c?6>L/
Ib#c5VK6R(NTXZ/WKN>aT@>f7:@\+-SJ/-O.1F2HaAaX#O_(24^_SEd9:GYI9QTH
L7&5B+\>+CJK2APIc6GDXC&,c=3D7^+P1^7PZ=^56MMNKGU/Od=4TE?#WQ#_Te3b
e5WA,-@Q>]QOdE,;86>AOGe>d]a;(=NVcR;bP_9Q[N-;,K3J(cBBLO[U#e+e)PXG
J31EGa\eI.^Hac#;9_W5Y31+G.AY;6P_RGPeEZ?gdQQ>76IZR;We.e;G^WdaL&)#
73::G:VB/aKeK:I/8DFPaC^&W\fgTP]WYR#/V61,a88AcAP&TKcEf_gF:3(P5E3a
I6N;+CKYaW8,<8CK(CJB916&D582LC1cZ2L;U&?^]adTeU4.1-Kb56<K;WeZEQa;
,E^IJ1[O?72\6^H@W3WJ4O\P,+1Z37;F-&8<<>]@5fX9Q-Q##SJ-X0Mac\adX],D
FXL>5JB0++?H180+Z2&JNR0ZSIQ\J[fU)E;K>E??b6cc8bJ-S&:EVb<a+_]K?UJ8
(aJ:/,K(^(.O/25JN(;J=GQCfc;,ZJe2#<e)H2(\-H):5HX_Z4Z=V0eAL/P,R+&9
/^P<7WA(\,F(gU-S52\gA>#c:N]:D6O?&b@#M7:3_ebQ)=;JVAMBNbb0GbX;Ta\e
9C4,1(=LIO=SU82Gd@&M0:00Ogc]ZY01Nf?6E&3[,/SP7Y;4B2CI=3FQGYUSbW)L
BQ@YLT25ZS19X/BJecS,<DQ;H1d=KHWRN>H27V3>BSLZc5<FCB[L3AE:/<T]90I+
<ET:e\^32T)8Y/?dg99WMdTbR5#:Gf_.A&UaDF6g5EfT>-K#MR@-0>.Q<U@a#/fB
F?&S35;fWOB_?G:1IUEa+5==TDMCf/a&JB>B<<GPK<7V7a?BELT0;[c+S-;JV?D+
Oe+&09UMQd<YZc9CK2NVXUZfOS7ZD9dJa8BQ.Q-ca@9\6D]Ke@02[WRBZ;ORD1I2
Jgf/9NYbd<E3T7ZKY7/fKR/gJ@11C/#X?HY6X^eSb/[TI7R]R+?a<cag9/D25,Jf
c[TK)3)aIBMeSQ?#(@gdYU^aEZc[:&&W6)YCb<3Vb0fVC7D^3L#aRA9bbU[NQ.X4
19a>dg=LL7SL;XZ=-IT]e04d2)TO#TUGV1L?ae<]XP9.KD?P^2],+RRW:MC[C1=D
O0TP,TA[YGf(Z#=#2:UQ4;cC=^.cZPZXDR294d^<HWET>1E.N&Q][OIZ,;fg/\7(
P/VP\GeS?DSN(69ZR:VYYD>fN0EK@W.1<]VJVC\<FHJ^R<74[N&M=1L-CcWRAV5c
VCZURB34.Q.K;(&-[E=XG]fbKYW=7#AK/ZG1KL[.\B,+b_X&C-^B=EFJU]2O?U,]
W6\.IZf+-=?6K,aXecW[:+-gVA.?&):,R/>/FJf^J;ID22a?c<?[P->T8B#<P,Ub
f_bX3Y_Re\F4=XP,TELHa:E7=C6^5)WU#AfFH2O:PN;Y,V2@9H4S<b[dL&@b38aF
@-bP_E:=I)]D3(#FQId_U9@D&7<1XG1ND6K..)39&CXL(TV=4N3EW,\((+7IbHb+
7W+O(Z#TJ8;RDH6WH&;J9G]cR4?89,CdI;cgKBBH1L(J_f/E4b3X3[J(MJ[DZ7\/
@AD3Y0:)_40SGSdV/8AXJ2d);_d#HI)A:FP4:WB0_^M]<@NN9K>IW+Y3,G5FISVG
bIg0XD72gTc(cGPAEVAJ[ISRID30^A#)6;)FA0@UD_CI;4-L7S]+O\Rg(]FfAY)T
,+^c6<_+TW=R0UOEQKJWTGRd3J+QgCE7bDScA_(E/PH1GCG)IT/\Z;>8c=\N8(Je
<S[XMFe:BX:GW<ZXU[VgE9CTKG,<0#,>U_@0;RDPPL7TC2;E?>f]E)b)@Meb_V9;
A5?_]\DegTYF<^7,<WT/V(6;2H=)6[\@,HfGUUb_1D?.H8>[_Xe.0d5YAF(^V+eB
dK(IW)RgV^[KR<2OT(G_#)&@,:aE-WUMJ&J;IDMP:Tg(2^\PZ.N24E3V73IbR>1e
cVbDF2O,)6#Z)ZKCP)AQLd]RJ57:_W-JKPEHe25J09K#/XJLV8D1QM1R8aC&VI;J
N72/HU)D;9OJ=]eaf2KJ4GbA(bV\<B..]eSMFDU4+WGR5>2.?@5B:/d7ZB2FVID9
g2EU-GeO.@]EZe<)#(\A):M2_a(0gJPegJWFJN-V_20(---^WG.?FN<g69^<Pe71
YT[d+Y4fg6@\(b?I.E\ITM3b@D&:+IE:Q7&FaN(8[eKAM<fZ<O9D](-1+EA3bBK1
Da&IU8dR19Z]0,.K,&90S,J9F@_G5G8?cc\gS9?DFZY3;,(XPfRLI#1W/&<29K[Y
]_N+I#55T1,==Vg^Vc96.c\6I\ZEQNL4H]&EV]&dR-_\@#(dIX\+IPO&5QV3d42X
4IO4-GLW,\+,M2?-5H-R9.&HOJ5S?47&EQO(Q+_OC=&.VA;I98APIZ\^N^N,_>M\
a921AY+<=;\E(Ga(7OAFHKfPD@-GLBVbY^b2/EV(H=XIeg5PD8g7S]Q2OcG2.I;.
Sa,C^W61Ac)G3\E./Z==>A?(V5Ed4?).I9fRUT)KQ:dKa2#H/&XX#X9EEL&W@RS7
W9D=ZAYZ.:QAa3KaeI2,+HV&e1GONYf)<]3Y,8_KL<(?HIB;;&,[:7dE<^KB=CG+
)ff^<N[]_74X,Hb/PW1].EL^c-7UJ-AbBQI9cfJ\.V_eFdBSS1OEPVM)e0+c(CUX
9A9-8X]J3XT-&.SH\H1D?@,g0K50JC85W^/eMH),\7_8YDGeMW/3eB(5[YANM<WC
2[PbWI>55]04[(IdA),9:gGbE=1GdKXLTX;a#ZUZfP1baB+-Y\D,UA@I/H:2,RZ9
VO:F3)YCaB_\D4)a=A8,J?>5/<2?9(D,3ed>cGAH8_cQ^#(_1bHLbgET+D4bfEDC
)>Ag(-BcUdG,L^I7U(RU&eTbV&BD]NgQ6;=N,\2<A)E&ZJK0BHE;&LH-MN+<6MS-
27AW:S,^.D/Pe\<UGU-QJN_FYH=5c74I-LXY&Q^Y<=f>09DDYcM&<SID.7S;De=)
@\UKEQRVQE7/7A1<X(+Ld)E6]O=+PVUc0+]\XOM]_;EN^0J(Q9bGXDe0&RAKgC65
OW:EITOd;ag27K&0F^5C^?&.O=gFdA5JG:W2C2K5d9N&Y8M@15\XQ]?ZGXLbbKe3
;E#3V.5CB3dJ[YJ<56[RE>W1Ua,[C6MTGIcD1I)BPeQJ^T;QHW_N5b@XX4QYZ::9
R&CHO^e1KI=T>AObBEWKbA>Y6O^SSKJf6gOL)P#38)gS<BTAZEI1;E&QfS4YLFdI
6KNR6ER=6=-a:Z.M50CePdL)U49)ZOL-@]2R,9b3:A-R+I(<XOYRD/#NdV\3SH[W
_@A7XDFYJa&=X\FEA:DQP&P6?60g^IDZ-_TIG.&U\QG8L[EO3Iad/^,^Sf3JNFJZ
>5>Sf-N;+9.bL:K>Z#e1VST:WD=CV_?(aQ95+&Q0b@+_I,<M.JYT66.#cR9&^6;6
9H;@YH,4231NY@(=^]5)TWg2#ZAFU(_RJFGRa5ETV<L>@)-TY_Pg.&4_4YB2,f\a
(bROLN2f+F@GX7K8f2+Y/4^B9A[57g#\[)-1IIH3X_I/:e2_gLBS8OP^;b&I-/[c
03R;T\_6JJ8g@VBZ5D,G-<5L0E<g.E_S.R&((:gXD:_L7&Xd8AH]V]/_4PdQDb+e
?K#D[/?#<eF<aPRW(-5+?-K)a(e0;XBP:XGMHZ+W60[J6M2\ZVe^2Q2?QB43cSYO
:<.eDJSb_@c.;3+.>M\=,KL/g[N?0QP71aa_cF070K7T:N\Y()RS5fE7?]F2d::b
EBd&49&g)INYM3VFP36g?c@TTK@<L#7.Y6B+:?fB&)=-7\7EESKH9TQ)bcXEXTWE
TN]\S]RCgKH_cdW=TB0OTg-<=IfBF@)2VLZ]N]Od9Q+:(7E-P[W#7Q:3UFB5L+=M
S9I-JA<795Ff2)JD0FP:Ec&R,#eXaE&MWNENS5OTM5F#NQc3#.G.1U>E86ebbL4\
@B:TLXJ5U[NdbU.K[F0M@_]g-f_0-@C==:+fb9R.6aLB51O9^D1_D:Z1-2,:9:Zd
TbU.MS9/d.D5>fJ\]HB.HaR<Lfb03FID6XF[-DJQRL=TMc-T_.&-,XDMNXX#W0Ue
B=R6J0NLR+7<_9WJ;M,IE[TaC<5U&](]4>]C]F5MHGBW(/NWCMf1:>:b8KILU\5H
bRK=a<L[SR/7:>2(Y@T;RRCe5J46E.cW\N=ELRWb#ZS&aC.e3+]\UZc0.T]\_8E)
V)K1+,-).FO)g41;&EZg.1#;Q+.PHZ-aJaGQ(L:8f<;<##8[)QdL5>TJ9+?+Q?&T
^6RLC]5TV[GgR\IX<9NV3RMfH1eBOQ,5V1Z765:W9_^595XdS:+<@4Q(O7DC.(]4
A;NB;R_A3UD?V[DH7]-RJF^_E]aCFELBReD>?34WX8JIP^+(Tfe>(SAc),_K:?DJ
CSHd+T[.324Y,UQFH,0I]a:_8NYZ8L9/g/(<R4^_:3IO^OS1Y/>DgAANC=413K[^
5N]6,.7N778TB\^a(PU+--Z=6DU:R[d[ZVD:Pc]WS39(;#Y0O++PQ:&K@Wb@J=EU
^-057EgSR=B<#g8P^^TL86^_9eV.1>33_J6_aEZ]b[9eY2J:MCAK1N,R2NY(QP9P
eWK[R=<2a&F,_^eB/1(0RW4MA:<Sa04:5&Wa=AIf9.RY9&]5=CXQF?cH85W[6OU1
Q.[RB&d/PGL+\(\&WH_O9FBNV4B?TQ40:a_\N=5E?P<<\6-C<e3cEP7aU3ZBe.76
^V+U=0[0>0/L=ZDH6^Zd#&f;d\GY]SMeAW.I[_@-O<Z2=-1gNb9QJI/W#<b-8W1.
MX\+)J_2L)Z_AD+V(OU2g@GL0#3Jc2U]&>N#;gK)>:D,)4([OR>NAJWc0<C^bg)M
YEL;9M87,I\5RW>-Jb0G:D\4+70O6:>I]5fXZ=P0JJKg]/N<SA.@F(.Jb>NFC_d\
Z]fc#IGLca=6PgZTcfJYIQ#XDDOUU;^=Va1\U_M@?+0>gcY75+?(Y:+3OFQEYe0K
>?&VSN?MJ<6=P;b+BLQ@I59[D@9eZIQdR;M=GLA0408WG<2dN4?W<+db:4[T-YW4
QX8BIP-WN;fB^BITVL)g;M5IL5)V0I9&eVdNU>@AD-UP=)eZK&:R^?PbC.6Hf2Z#
_+?gRV3168+_bC/_B0GRT_5A(3g692_L:GSe7aOX5bM51HL+WYE-M1A86X@Y-.6.
B_8:d?:+^+^KOfPN#bY8XbFgGM=^g6gBKX&93CM1Kg1L_I;eC0+,e>?TI]d0QD(N
L,MW2DH\O..RE-=/2@T0,=8ONQ+C#N13L#/M8L0IDCHaXY.396O#_F]]FHMe[fE]
P+SQV)BZCZDT4cF1:,@9F(ee\6aGRM4TXC//Be/TRH8MLZB6?B&4GJDa;3=A6f\f
UcLX+AV34H+Ud0R.ZJJ/-TT@^b=J:BKX(dB:)3@cfWGQ=#.\JXXET-DCg+B&Cc_\
8D2X?2=,BR#=4]M\3\Ba@81@^&a_cX>VRBN;#O9P+E4]Q-BY7<bI)@VcJ.0(TfCK
-2V6bC9&2cG512#F43QF.9f:RS?JI-&?G1RHDBBGST^F+QHDR4-L4A:Z\8:)U(-L
0HFJS.2G[3-BMJ;U9f4\<Eb)<EF)UP)5WTH?<gc=J2c.R\T>Z(@>:1.9(0R7Q/2+
e1G0aS[=a_52JcO<-?I@:9<+d],;Ma@24Z5;[+1dU2bfOV0\0B-g\K71B(YVUg)5
.QX85[PU@<RGAF;[[1V\^dLaa1=@eO8M<JRCFT+2[_L>2B6YMYeFeF(CE:gA?Y:;
ZK(?FQ=RC4I(PI3NEBMIMEK&F_)KVW:>e-fNT:7P8gVN6VPLC/Z::2\eD03>+dE_
4EO4a[P:J;1(1N7HWC>W=\-;;]d6/=?,O=DJSN23Kc7gPFRD2;VBee_Z1X7&^fB\
2XX-#cI/_N_;.WN.#2+(CZ_O]3WUH87]A9=Ag+>@X;I#Ze4POR6@#UUY1-YBb@#F
FM244C:KQP7KIM)6W3BL_:BB[>Cg;6?9Z^NOOQL8g2+?F:3]1O:ZK]ZQ+.QaL309
PT251bK4LR3[L(Y)#dHB=\D7R1f64K]YMF;fc(H1G.^7f)S4S)5)7;W?eX>&]47F
XT:W[BS3a7NK:&L#8g]+,CP&TPMXQfCaFX:CE22Q:AG02&RA:6acFb#B,=aEcQV0
b61Kb:3HM7,_VPeBX=CFY7Q21LSB,PCc?]dM9+g0#_(K\886(#EcVGFB=_LC2(TH
X&eC?06T9W\]T76e\f74Y,PaDY@@)(f2-^-3(8[J^7=71aUe_9EVLV=6EZ7JK2UI
TZB:-@.]KHUG_[Q:<K.S464E<&eK8@SfDENKXdC[EPcI5Ggd(_eLB8(+Pa#ScNQE
<B6[DRY?75UHDN(K;d(1C-.=Y-Q2DDHC6AE&?TBP]93/>)N_?T1LXGR>]T@?N79]
#\CLZC=IX]8NaB&cO,/3:L=,M[aH_=6:2N@RG;/O.-[L-JC)c_Xf\P\FaCAe]DJQ
cd26P^LT)^fA;D&BEAQB[^gJE/0=f70YB9C3]S&_WVPgbE=BO\<CB(P6_f+-+8VE
.8bYCf-6?V,d>W8^ABY7M9ITLVQFYA?,C6S7&BWQJT@M/W=^^)dD@]??:A4#PRbT
c?/Q=Be\D:^.FL9J20>N9^?Q60CXI;\DaQ>U6MdF.8.bG.9X=g_[Cc_OA9I:)IJ)
L#@EZ7+D,HZZF3T=a^:>VafDM^90+90ARgg_NA\c=6<A+WY8S>UGBS+AZI-Of?A5
=g19gFa6/Oe)H90TA)AIGBPH>BML/R?P4(d,bZTV4\U(H]3VPQbV;>(CS@>-UU2M
_K[ABQO7gS36Hb5P0d.\CM^b86F.eR5PI(=1AS(P4\2&d3](aQJKffTW-84MGc&a
a3[.>&TK3gO>Xe&XD;P]S\-:+?KKfF6D;4828B114N;O11,?V0,F&:>#G1>(W1,A
Ied>_QL3D5L^XJ,PE1/.SA-:1$
`endprotected


// synopsys translate_on

endmodule
