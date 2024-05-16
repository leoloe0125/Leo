////////////////////////////////////////////////////////////////////////////////
//
//       This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 1999 - 2023 SYNOPSYS INC.
//                           ALL RIGHTS RESERVED
//
//       The entire notice above must be reproduced on all authorized
//     copies.
//
// AUTHOR:    Rick Kelly        5/17/99
//
// VERSION:   Verilog Simulation Architecture
//
// DesignWare_version: 23fb42c5
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////
//-----------------------------------------------------------------------------------
//
// ABSTRACT:  Integer Squarer, parital products
//
//    **** >>>>  NOTE:	This model is architecturally different
//			from the 'wall' implementation of DW_squarep
//			but will generate exactly the same result
//			once the two partial product outputs are
//			added together
//
// MODIFIED:
//              RPH         10/16/2002
//              Added parameter Chceking and added DC directives
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
//                  are such that allow simple sign extension when tc=1
//              2 - partially random CS output. MSB of either out0 or out1 always
//                  have a '0'. The patterns allow simple sign extension when tc=1.
//              3 - fully random CS output
//              Alex Tenca  12/08/2016
//              Tones down the warning message for the verif_en parameter
//              by recommending other values only when verif_en is 0 or 1
//
//		RJK 9/22/2021
//		Corrected coding of conditional suppression of warnings to
//		avoid semantic error when DW_SUPPRESS_WARN Verilog macro
//		is defined.  STAR 3884129
//
//              RJK 2/3/2023
//              Revert warning message for verif_en parameter value not
//              aggresive enough so that it can't be disabled (STAR 4360627)
//------------------------------------------------------------------------------
//
module DW_squarep(a, tc, out0, out1);

   parameter integer width = 8;
   parameter integer verif_en = 2;

   input [width-1 : 0] a;
   input 	       tc;
   output [2*width-1 : 0] out0, out1;
  // synopsys translate_off
   

   wire  signed [width : 0] a_signed;
   wire  signed [(2*width)-1:0] square;
   wire  signed [(2*width)+1:0] square_ext;
   wire  [(2*width)-1:0]   out0_rnd_cs_l1, out1_rnd_cs_l1;
   wire  [(2*width)-1:0]   out0_rnd_cs_l2, out1_rnd_cs_l2;
   wire  [(2*width)-1:0]   out0_rnd_cs_full, out1_rnd_cs_full;
   wire  [(2*width)-1:0]   out_fixed_cs,out_rnd_cs_l1,out_rnd_cs_l2,out_rnd_cs_full;
   wire                    special_msb_pattern;


  //-------------------------------------------------------------------------
  // Parameter legality check
  //-------------------------------------------------------------------------

   
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    
     
    if (width < 1) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter width (lower bound: 1)",
	width );
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
       $display("Warning: from DW_squarep at %m");
       $display("    The parameter 'verif_en' controls the output randomness. The designer has\n    a better simulation environment to discover design problems related\n    to incorrect carry-save manipulation when using a recommended value\n    2 or 3.\n\n  Value of verif_en set on this instance is currently, %0d", verif_en );
       $display( "" );
       $display( "    For more information on this, see the 'Simulation Using Random\n    Carry-save Representation' section of the data sheet in the synthesis\n    release at $SYNOPSYS/dw/doc/datasheets/dw_squarep.pdf" );
       $display( "" );
     end
   end // verif_en_warning

  //-----------------------------------------------------------------------------

`protected
Ta#&VU)I@3+RH#\_Jb-BW4;6]:Y:S-FK)CYD18d,cLVbcG4RR#FD.)R&88M/aQXA
S;WO?L2CJMSeF+\^H&UIAH.#1_8\/?.3eC-GX_c[_O;H7I6d;APU&AH_.JA2VA7g
ZLeP.:K5gHBO77-e,MD;OXSZR.Y00bQ@PbdPb/7R#Q[B8+6P9gPPRf<2ZP2:c8bN
)J7YgVDf1Q=SH1#N[D1/1M\eK9.H6I&FE6,P^]Q8=d&43a7L1\U[/]1E)>N9c2RU
<=LSDEQ#AZBY[KVT/>7VRbPK(D?RD/cXAa[^EHRdCcN<_#IafIH:8VT_YUD0f+:K
e<::A3@G9BR5I6a1Jb<HSAG-@]8Sg^?1A24L[2LKO&M-K74#,@AaD4HG/,JS8(Od
[AGMV)dD3CS=0.G)NSN_W<10:[bM1L6c<EUUI3X>L2<RBAR[fX&[aU_UX7Ya5&B)
TH4@TTaZ.\Rf2,6_U\?]_-PIMb+:\d-ENS462cI,.DN)<=Dd(2ZVEgD-+978B7R1
A([7-Qag.5Ug(]FP5N<7[I<1TP7C?(/A854ED8b7;E,U(),R7(fXe[bO9EH4>b1?
_X[#Na=KW2fI\bX+#9DHU12]&LOf[RI[[/TeAOdg7WIEO\b&YZ_)K(U;:^g(cWAC
:5S\B]KYOgUNMUe(dXA>Rge.G95?93,_6V4J3,OT,_8XCa(a^]F:.=X>@d,NIKNc
PFKDfJaSYG:MM[A#<]]D&?TgD@Q=<<T9g/DV-7&5L&C:SR\KZ@FZ+ZN0X74:-=<=
C=-#:PM:\:/B4NYB8658VC:bL4[]N;WdaL=ZDZFf#3c.E8SDP6/2_RM7SdH:/eg@
aId:-DdV4P)M,[;ICd]8V>c_3@YOAO)F/JEGS5/4Nb0M;X[&SBZ.PJE+Ze3D^=/4
LS/6YebY8&J+,\.Q#1@ITG2N&7,>WIB94S24MdH=CGDE2R6b@\dfZMC-N)X4_(1&
7:VRMPQ5WRfM/Q88d>4NaY-M;_#1-@,-[YfQEa1:\U9+AVQ/Z?MI2R.Ag0UEUc9^
<V,>Y?V(R5S<LKdQ=>H8g4)7CT8)/]]=OBDeW.4gf#80-R>#J2,Yc]QBGVRLP55F
[).NKb\b6JXQ^]KQdddcced./b;5a_:>\Gc@81@]I=>C6@[_2=@LEMAg955VE<G@
QD:/e=VL&:_9e)N?eXY1ebg77HJXa7Db#Qf[;:dBONdb=@FHNHgO]8@>BPYLAVEa
/P5.LLAD<7IgfTI#=::_1B5XVY;:#8UaF-HZ>g7V8].N6ScB3.c7IANT7:J+[c@g
>15,EdQ;&Y8NXM3.:e/d&EZ6E^#aLZG_/#00HPLC<d0M0YF,7:4@BUL1YT2IRL9=
W6XeX<b;^03\G,=R7H5AJT.LR6_fb(aSRA:&+gQcA\2E-;\b=1/eKMSF2,Z4a.GR
+G0A,gY/ZA-AVOfYL+15b?D/b[&VNT/b<[X>^bW\;)RTcZ_C-NI3U(8].:7bgV:Y
#S>0@5I^Oa4UD[FDC^-#@OWe]S2,HSWV;O(&b:BHVHN0TB-L45-fIDCaQBe_6>6B
[fEP]G[]S;ZX=&H?TF?PC\WF\G:3X,@2.C[aZ[<Y@W]3)0EF((1dB+NM>D7=,Ge+
(4C9MbW_O(M((8>L>\5-8>#\)023-57<),P:\HFO0:&=1CR)T_7HDR>FKD:FB\AN
,cR+d#P])+R^.=0FF:_&=S=.0EQ,P:H&3?;(@+dGZHEXD[\Yd3ISY^JAfI1=;eEN
N19SPNgQ8fa9]#3VT9,UD1?W@PaCROYCAOP7D7db6734+0KHL6Ib=1Wge+G9^IZ5
W5IBEO98IVSY:MPBa5#H^+9/I#\e27^U-<G9\^ZAe^N:@7>&R_^FF+C\Q)VGX3A<
e:c_9Q[WJ2Je4^_d/4@M[J-HPcb(S8#IbK=XO=^E4G<6SHbFbIFV#3DH/AS:d)#8
;,DF@LTD+15S#)b,#cOe3Y5HPF+[Kg4RRDdXd^(#IgdQa.>NBY9(U:68XSfdJNb@
FFXHcY=c4P08#>S?\XCC3&0N_.1/CA2G7Nc;U3P=ONb7GFYa@H1a<J3,EQ-NR6^f
[8g,BH9DIO8ZTBW5[1/DDc-W&\b,,XT3G35a9@AX5N9,Y.:C5PJ[)XYAP5RR>DgA
ecRTL5Q9IFWBYVCB9aKIKPM@)<Ie4[fb([.CNK14O1Z0L];JNd:@9U0V<=]-@QV#
0,+e(8IY89JFE:)0Ybb)W6G4CaXO;?GR@?IN18K6S+I],c?8\D].;H1R=[PUPX]K
)ZIEN1ITd?G9cfIUb8EQ+=S_(2aD0D-@gOSNJKDGg0aWW=^>/?[(<c:X8aXbJ@Hb
+d3UdT)7YMGA[=eD]QJ>[]bJ4e3f#AeJ7b+9Ub7@UP#gX:OB8CSHfS?.+[\.66HF
;EW[)OZD]=OT(VRfL30dbG9,A10(048.g-ORI=DT<4U]<,FgT?[TKe?f,8-X)FGI
[0Efg@B@#-)WRRH)LC9D=HC_4-/;S]WbH0[aP:R)g^>70+HB/69EP5b3UU=XWA6)
41c,2T[>a7]PDDSP27H_f8.SRO>^)/+KeTZ1>c8^5.a#VY=W-[-^YYW^JIWb(H[(
W2AKBDfRc7(H6W\I<W8-]>C86FKbUO+XZC8W?+WASUFc?WOVRF>?B+GdR??.&I.(
+Z9V^edB^,5agXMTa+b]g8+geU.UU15+;3TT5_4+^1a=V57+U]:\KD//MU9R[>/0
:JVb714T7T<#9e69C_ZbM(F\G/JgGS:+]UcWO-(:E#T6CE/IKSQWZAYZQ36]f_N=
GTO[NW8;T(L-EP9F_?Mc3]6Qg^BAgB]46e/Be,F,)Y/ONZKAN)0WcdTH#V#Wfd8V
b4,81PG)fC,=;F\@0(+4@[02@J).\3H?KHY91F=BPdIZKb/L?41_gP;\.H\8a(9I
HM--Q-Da/^NZeQ.7]QCN:6bC?VTcZ?[D\9K/<T+YabZZB2-=1I;5>T(JKAdWb&2&
AG;6/<c#X-?@4W+@3#0#VC42D#J&RYg(8bb\T^4DV1GH(Td@R1O:>cg/Z_,6Pd,R
OZB#-MD;+ZW09HVafV:47S)MO,2-#]+(eQ\06/RC_SBYZ)P/+KV@8VG+YOCS0.8/
M2XbK/G1>WNGQ(aK5<YQ>PH]CX7.T0c05@cZ&F<^E,fGf-]b0)\gW;F(gTDT>:O<
5fKTVPgTZGaS0<BD>)64OU\,B)DacU@TH4>SQ(f2.N4SHU9=#[Z#e/bZ[Ue<TC(J
Xe,XIBN)/f59YGW.4>7fE1>:._H^1/=4H5P6&Nb\He;R4=2JMK2WA_FM]<dHL+5C
a@QTM<@gR.E::=HV+f:[1QZ9Td^JGMCV[\HK+UFST@8ddF&>ZWF@cUV_^LIYU+9O
IX6Rf@R-]IM/?L)d^]K>>IdAdCXd_1U)OKb1SaRU;S89._4^._=&egB5bec)g1GX
B+OCg[TFg;:5/:UaLcCE13M,3HJMDM,X+K.K]O3U(15cL8G1E/+T9.?S(^CG7bAd
c8?HV/Sa[3T77Z[VJ3Z(7ZC[)O:U;UWT]2f]UAEDV6Me(I?MgB-B0@Y2[R-<C-B9
^BXZ+T44;8bb&+U78<LU:=(K<>M6J=^UER_HC#BTWEc\PXT0PdFUYDBbXb?S[#RI
:]K2,\MHO_:6,YP]O\908M&,EFHT>ALVa-JfcC^+9bRJ=[CM5(]K2B#\+fWgbBTG
RU)FVIfW8[2Mb/SJ+QbDdFNHQ82fQ/>aA?/&_f\TR@P+,Q[ER2J]Y9[3+;??Z5Q\
?J;GBQ59UI=-5#7QG6^#EXBG,Z2?1Le5>FMPZU33eQd4^P^30:><NBe>eYPd<Ef^
WV\Y:5b;7<UE.YI2VK48+bDMBHTZVBb9bRW=&<G2HV2J8_:5FPf]B?K91R&ZTEWg
HCe6W5MG.QLP]XX;(gXD0PWFF\Cf=&DT0G[^S,.//26YNYF#E4d]SEE-INWQ&W[W
)4ZOZ##:BGJO525M\/RPa>N\c/.egf.0[0I3#LOOD:G\2e]K9M;dfHd_V:3&,c;9
QW5C-6O/ZM0VJaVQaZ0;e+SR13N7cZ_A\;P0]>L@+TV+2cg)d,1VVbBWaI<Y4c<+
JC^<./g,/1]ZNW/S.gODCW<F@SW[X9YZ2R,bFCD[)L@4aJ9MA1OG>X(c]YNJ6(>Z
#>YJdAMR185629I(+_6,VfII5_6TgL8<(IB,<WUTG/(:G36,/(F0LD^U8CEM#3fB
efIBd[S8V^M.<dH#CcID;R.[\53CE\(U_&AFE[P,.Y1LBcNCM=4F^CZ[172H=OBQ
cRdH\f[c]<Pgc\MCM<Z+Q=/aCX,MZZ-40F].ZQ#@R?Y?b,bXD.b9=Q&29..(6&E9
AQcB8Z?ES&AHE5NgG_TP@:@X\USV.gWS5a+@LI]c@QAA4P=P9HZFF#e8+_Z+K/O^
?2M(5fe/YeG?[9PYA06KY.g-<F9,9]=XeA#W7/5&WfMSQLX[gPY^=Med.N#<\+B>
FN;4CBf#e\OUUED-P:N2@+a\A>,>eD^&^/PYY.3bfO&Z2gRG2NV>ZF;.BEdA)PEZ
\/Dc0Nb3<c=T6_VAT51R75[G1D_3bX7d<b&S=BdRA--T;7-=C9T28THH]TO:@ONY
Q8\RD[a=D-5:<B8C<V)60RWc;[NU9G@WU.YTKA7eD(5]1B+LF94&f0\B-2^Q2adM
ZE,J8e1Y_<X_:dbTCC]T,dSVTM_Y\L@]e1-L>0L&(1I/.Y^eVT)IJETRPdB,,&)M
C\[GeL.<E&J]AGHLZ>b4ELO:>1&c5VO[.HNNHc2fKJ9\dENaGZBOW2WaD[/VbT56
f,XbENO?UO_M1C@Z7FWd-=E<Z7c32Q[@ARG):5Q(\^+FMF9W,G))?7d[5^eLDOBM
g16/KM1A>SQY:9VTggG+]#2P&_6.gH6KfWLa=,L#ZJK8-E5^MVb3G#0BT#XTcGT\
1_H8V5[fDH;OFgL))1<21EedgWL-,PfCTQ?B[f=HX6]bH:C99B/Sc8EA.Tc;,>4e
/:/3^.eg4#Q8C/:C]a#f>DD@-/@?0#dNc,1g:N.__9gZF[,We9P?-=(I;1_9JF51
/T[WKT=W>gX0=YCTb-=Y3A2CQPTb.-3#g.\5_[fgPR_d02]fEfdOMOO/X:T#Gb:3
2WX3Z]J^Fd([6G)f>(1U,NWb1_9@[b0f7>eg9XH>a]V:.A3\R]U]@c\(G0S+:\GJ
0GP]f,gbB#B;97U01\SNV;CI:8CJ>)WQ_G<H4E(HfKG;=&FU^BF<[0fA5]c[(Y6V
IU>HfU:/&]S_UM_/3@d#.6JJ)],])JSI9KeJ>CVMf\#^74ReVcWG[K]f<eX6@dK-
Q/g@)1\)1K#\68/8&5GSK4gDA)<)HR4H59g-<6ECP3E<RDbbWTA&Y7&I?2#O90=+
[RKN#AbQgJ]^:S@g&VM4e6Y,XJ]LCb5fUB/&AYAVR\2WP/MG]40@J3RCF92WQ<53
H;(+CEG_+/;NNKaU.Y3QdY>@B-T530geO3?V&OaRObU+<666/O13CKQVCfMMJ&^?
OJ/fO#(dPX-ONHT<75L_5A:C1AKaeL.=JI?D>D+/60^&Gd74/bS2AJ?&;D7@^1g1
M87M0R@fdQB&;G)H.7bR:=P5e?fEeY.??Cec(_3RZ5dH&DG/6^XY(G=O7\WVgQ+-
7Of,fJb]UQCXL\a2(DGN;8X0fJV+HZ&_L-W\A4HI#77X^bSS(.IA4FLXDd?>TQ?P
_G_A?f^:;,aB_7Q;]:Y]5;<;E9AU2cX,_DMa.S1gDCX<-TO?+=/9(@Y<;d[c7N4?
-@f&0JDAH&g4TL/)BB\3Gg7F[TBa\8@]G/Q:9:Ye#.d4)OU1fDC\4:84+::S+eW(
Da>P#CL:_?#<b&58+L\?+7IR;U?15/BU[L&O&&6DF^dM,YFe+U)>0?90B5R-@CE+
93)>)e[#cTHTaZ_N&9C+D>&NI791U//AeFL(D<=-@&K[]695;P>(IcW>Z:U1-\1\
),GFI?Fb=[FHF5-;6>4\?a3DP9I\[8[Z;:f@EAdU,^Xff[T)5PMeQbQ<[B,XZ\(S
6_BZ1=c4S#Ub\AeEYU;&J2,TfO+/.C9Ad3eS#U#_?^?6Wge^g=GgQ\MbS3g@^I:>
QK4R_=.LcUa=B,UT=X/)KCY_.^UXNf2<S/f^34,H?I0@dP-4c#FCgc&a2\)cBDFQ
[Q-;(c5.11>Z]&I5gW4FeDZU[M.aP:;JOY(:Eg=#&D+ga;98gc5F/_.<&&&HN&[J
)\<E,8S?YD^5I64;)9K,b\K]#f[8T_QgC5P6;7,_86N([\CR-W&C6JPLB:GT[.FQ
0Xc[M7da\RMI4D.^8d[cPL:35_ZXVQN@_>]V6d5^L@b_fE/&\99Z]1:6-BNUeU9>
AQa\PDQ619FZ\&[D3J1>47(J#_5T6EQP#H61gg[O=B[M7TIS7KCgc(J4)C7VEdX5
_VbG#6Ob=61?8[>e;,GAB1]D-e8>DY1S5+gT<LQGB-K.66/_;JC+@L3(6>J=OQBN
g?Oa>A70A\_JY;Y5cBg>UZcE:a)LV,SF2=5CfWEGPOMX4++02K/1EGT?]^Q>D_>+
d^/5=,P.N)0/&:(BGT\KT2RBdG?EWC/6[J=C5<D,=@E:+b5e=.W),5KbB:]]_QdU
:^D^C&#gX)UUb30_7S0WDUS5/O44>.:Uc.2E)&/D,ID#Tf4_H0G>Qc7NN@EbKVRG
-X\.<4G0<<dPLafgXF=WbUOYY5b[B&L95M1_]#]GN))?KVFd#eCX5[Y=ILg>=QUT
)0#2:^[)(gL/]T2:S4BY\(MJ(CERLSRCOU@7^(\Z^1FH((>71bBFa0CQR+T+>)2M
D6EZZS1;AUH(J=Bbf@gC[gJBd(<MB6D3H?M&/J:NP&X<-5/^8(3J25PJ5B4Z;O3_
#K=NgZK5O=S99cTZa^-,fRdRGIO2QQ#M99[>f87:0Tg^5=HeLWB]@ZOB]Ze(X?6f
CYg3^?1.FgfVgK,&]S3QGYT4USYDKTf9Q](YH,/(ega;@D66WM]VW-AQaa97U@7:
JO05ZV17_bQB2PKRA6,.Vbg9:<]B#X0<7];\^_OS]5b&Rd(?2WTR0GI,cO0abFA^
fe.NgXJ]@Vg\SGKL)Ib:@E-0f4_7aFEd08(E7K)A,RV,GVPIB)dS)B980-7b;U<U
EIA2T_E2LH;^IH9B5[VU9\=^U6@KVJW+)7VAe3SPZ4LULO[853:50\_a348QW8TF
3UR4N>aV221,_(9,9)+5-LO5^+&<G3\BPYd3G+ZR5N/XJ1^N5TU#B66=^f:CE\Q]
5E8=<eXM=5S#gC(fBaI]:C8?,APQIV+YeFWJ@+O72:V6@-0;M@[-GH[EJ^J;1:XF
PA&M?YE^;7AXY2K@=Ugb#WO_8#g2E_=10P2)TH41;CT:<@NN>GVY,O5^T;Ce_3?C
]]be)Hc?f<EJRUd&@.g3dEZ)?/Q-R0[^>&9GY35?Sd/HE\((Z+X@Q#0Q[ab;HbfD
W_/Y.d^a)M4,O6W7U/:TABQ:1GQ[Ad.X><Y/UcE4@7L/C,ZfWU/FB3-W[:W/1<]f
2VgL\+&#bgJdG4Uf_bMJCOaD7T?F<&(]cd46#PE]3T9fI-D-/,R@N2Q831\8IO@e
NT@,DF\<<MI(2d-I[9K5E4Ic02]8eKcJP)+]AG<0bP1g2HO.^FJ,?.Q7?1:J9Le.
_D\N,O\8C0H_0_LSDU1Cfd10QR51B+Y5a+U\5CSb?5#_H>Q(51_BTNA=Z)4f<^QQ
=9cM45921>]3KFK#D-[O[-D:N\Z^)cHB4&bC+<7O?Bdg?Y@=AMCIe+5KFM#>]S99
+@T\C2L.-GgbU_UXbG\Y6FH7IH,Y],(cR0J_)PC>C)YV=dNZ[4V(>G:MCDc,RZE.
[T_\WS[>b\<[e?U7\;\[C.40X:;:6b]E6_?;;(VDBf-ZG?gVO(_C3)]#UO2,P3M7
09\H,A#M/G&8:46BS==,QaZ=Ob9CbS<.@\_,c@:>5Mb5-A5G)H3E(cW,B2,B4L[D
4(eEcYXeAM=7>X]AI-K+IM[+)E3GFRf;/:DF)2;TS&OIFO,7>+UTLS))^ICHc)+7
VY)WRR^G9Y@e19(^@Q)&KQa90.[;R@P=LTCHc=L]5DKUTdKN+(:WKOFAH>B?fML>
;N#CTc\H#S4@<8f-JNSB=)CIeNW0&5Ld8YOZD;Y2S0=D71LdR>]R-Qce4Y1Lg;^0
DO(Ve7.-\0abT;^UVP+6?WB\D&/9N0[KTQ@c-4U)QV]OB-c3a.\bKR9c)75g2<;A
H@+^>04Td_1UK#[)\U+-:R-(X]N(aMA,L:]MUV6>;[?/4E?]Ife7S:@9F2I8+55f
];4Z@B(V;]WJ_-aPYa.bb\KC<([(N3P/ATP6;#&(I/?.=bEO5@=OLc,L>#H]/:G=
6W2C;SEW9RQbB<ER<COdfT?O2&9d[c+Y\50,64J\CK^5##PP9ZURX1+eP#&=?3N<
0[b?U@2Y?JABK9[?Y,d(D<_5I2bV?33?T-_cBEI9_(Vf[+HS]VV4:OF3^AJ]eS].
?a6K&#gUW;WL.[A3BPKf_HT/e6Y3LT-U,S\2YPdSN^1RV+58@CY_,9fK-S5C_a_[
,BMPc3MVT)T[?BZ7(V=TQ+;N_e;1LJ&cV.Va0d8CXB(BZY[JQ3C&&f@3:FNS1\<=Q$
`endprotected


   // synopsys translate_on

endmodule

