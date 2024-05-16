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
// AUTHOR:    "Bruce Dean May 25 2006"     
//
// VERSION:   "Simulation verilog"
//
// DesignWare_version: 71b06b2f
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////
//
//
//  ABSTRACT:  
//
//             Parameters:     Valid Values
//             ==========      ============
//             width           1 to 1024      8
//             clk_ratio       2 to 1024      2
//             reg_data_s      0 to 1         1
//             reg_data_d      0 to 1         1
//             tst_mode        0 to 2         0
//
//
//             Input Ports:    Size    Description
//             ===========     ====    ===========
//             clk_s            1        Source clock
//             rst_s_n          1        Source domain asynch. reset (active low)
//             init_s_n         1        Source domain synch. reset (active low)
//             send_s           1        Source domain send request input
//             data_s           width    Source domain send data input
//             clk_d            1        Destination clock
//             rst_d_n          1        Destination domain asynch. reset (active low)
//             init_d_n         1        Destination domain synch. reset (active low)
//             test             1        Scan test mode select input
//
//
//             Output Ports    Size    Description
//             ============    ====    ===========
//             data_d          width    Destination domain data output
//             data_avail_d    1        Destination domain data update output
//
//
//
//
//
//  MODIFIED:
//
//  10/01/15 RJK  Updated for compatible with VCS NLP flow
//

`ifdef UPF_POWER_AWARE
`protected
#ME\(>V6/eFdg7S5V>ga>L]Dd)ZM.6/YQTY?#)1//?9NXcX:Z\Ue4)Y_@(0^\aTS
=WcG[c3[,b,MY/\P:Wdg)Y:7N6?Cf);SM:660aQ1R:82Se(I#FfcTZEL#IZ)DZcB
X\4<;#G5EgU6cQV4PVS4<eLdKM4=aYA&NPG,&>:42.Q3]+T9fVS#.4RBg:_6=@RA
:THa1fW)W8\][\UO65>X0W4,SeDGcMP^0[;T(/YW,eabGBPKFdUg24?\e#2/.CA:
d?(?U[87SK#Wc50c0S<8I(5&+QH6,7D++_(D\)dW>SJ@H[>#]2OP>/<6,VU3U3V-
OCd_;^6#<^NE\,:Q<#+GQ&&4&N7V2[0c=,7DN.TCC&;+RJb,RSIJ;VQ..AJGDZKY
c5H(M4f4]CR6f\gV\e&7MR-<07VJU.ceG]9=563[]/?,c>C=5L_HTd.DGBU#YaP6
>.Y]_N5XDeONgN4MaB\#ION>DK0,9J:6<0NMb>(<c[6f]\JJ7fCE^C2&ac243FBa
EZT<3,BSZ5b<,eP,4ecSCSD.B<G\M\)-,-<+VgQEdBE^HO^G2GJd3>^4/G4)F.UT
3DC:.Y03Y&<[_:G1P?^E>N>A(G7:6^;-XL^AV=ZX@D?P]/H7(<f(,77?84]e0R3b
RcSSgS,/ef)5bLccX>Jb<b28(-S303deW\d]&S5ecV<)R&_?91T?6H[/15QY,@#a
>4-;8(3N9XS8FTH.@HQ5fX\c_5?HJ_O;f5P4R(fb(O4c<7&.O[[/JE[F7.N)QcT<
d_3+;QQP760f@;fdUCS.X1@cUO>X0IYMB/WVV=RTCBS59/d+?C@_?1+]:7TdO^=G
Z^<R2+YaHV:?)1,NbVFBYgIRF7Y8I8[\4Z)_Y?ITBGdXJJ/Cb92.UA:XH;[#Qa<7
[US4+b7@E2?IXJe<b[SBD]EeV&XZaE[4V=g4SS[(^2T=K1Z6DU9402E;[K#U+JP)
>Y1R.45b_]^I[dJd1Z6E)H#eBN<;F&D-gcQRFSX9DC2L3AJZ#0P9+DTLW(Z>^&GW
JHH[0+PCQ?QTE1(<=BZD/+&\]),G-)HZJ(ZIcSNQI?4E8?b2^#[V6(P@.X74?5B?
H6e2RUP2He+P>.-<MZ/d74+16(/bC>4ccRMDLKE-Zb]fJ(O@J<ce_[<6[O2]DY4S
SD-BZ?aF?ZD3cag7LVFFWH?B>4a1SKH>#_b&Ef1/N;^B]]Z^=43D=4G1gf[B[T9[
bbKZAZY02-PT[eI&d7AYUb?SA+Q1O>?4T0+(JH?RNI0CD<F=-#Y5R;eYX/egHTAE
aPXM@>Q6f<5;Z<C7g9TG1;1+FAC6#^0_A-&eGZU^]XL^c(-;/3f.WR5AS<YgOKa<
/AM2gcX^WV]?ZS(8dG?0.7>-#1H+G[WZY6F4JN;2<7DCZ\8VNg98cNeU2HR6W0>#
CHDZ9P]QV&S6R5dZHHT-@/^TDaD81OSZ7&499U+#01470\FET]Q_4#C4==9NBT8M
M7TX^(AQ+X<aOJ1_S7_bX>YcN@@F.0M5cB3fLZa:X;L;M5;/.ASS\S:D?.((3IF_
=_fdQA3a]bI+>.\bCUFW+18X0NS8,N,V>f56Jab5J,5TE84L)S./-EL/]4VA.g4#
OOX-1ATMP70,#f:(C;TcdQ)L9-.96,B5=[PR;6UT-AEX\eGM6^H,Vf+501geM57@
(6[77=MdDeOXC#<1NYHA0gIBCPdY#0PM]A;7L,S0#UM6J),/3HeL4JI7RbM?fe/Q
8a[+,7=HP&+I0)SGM#DG0-N>_>0(E2CPG@,>4e>DD<P0W+:^\)RVbZ6M2QI;UBSH
WIW32Ug_[?\QZ#_4[73S-EB1DbBcOK4:d5>BXZe8--]C6VZ_3K:VJe+HfMRcP?5_
4aA00J-&aHDD<?)=c?<T).Ib9C@YTJNebE=:7;WF==V03A]>]HfLU_1U,B[;+TgN
_W.QY3^cO-2gJIKK\a^3M(6]>W,NaOYPH7W3a-_=UD]K:CO;&=^^(J>MZC0eH,A\
;S/:UH3T3cLI=/9G[_>[4=&aeT0_#JYEANOA3AU]T#EHMQKa4D>VWR\_U&MYA.H2
E,227OcFg3?J&aI:J);e4#+3?fO3/T\gJaE\0.,]H0+[=J20X=I[,CIZ&V_7&5G)
92/0g6YA8@3X<<VN],ADc.Q,6E@)8cTL)DK+,D0[I[bVM,,]XK@E1.HWbKdP_B_;
WL^HKR9[^4Zg_32E_5Y>1K4&V-Rdf@CMKQ)7ceNIP^SfWP>).KdUAfR],23ISe,)
LGE_F9MA7e)aAZ4.]FPD-4KQB\N661>OFKS;D;SE-bRJ.Wc:.H:F=\+f3W70K92f
0cQ_HaJ8WBFC]^&Ge[\SLdC,R3=L[9TcS1M(S8,#57.Y=;1^;VJG[L4?HH5=S=IL
@OYXVE5D<BF)Ub0He?QK(;FRU.9-8VH(VMAT#AO38a/a_2V?c>?dY#E;7767R\U+
ECgDZ;fM/Y[4d(XL-K)EE#PKXI^@O<&]Y+]G3>f4b=J:9U\OGQ\AP37=FU\e\b?N
#f/Re+Z[f:\5R>)3f,=<YfA?].;>0]V^:9S2;E[FWdf5^7)4H#cfGRWH7_e,L=;&
6?/C;e&8f7/LCNZ)3YWV.>eM]DL0X_TEQDd?Z5=JWZS]TRb96EG2=>Hec2Nb=\-J
<>MOSH3M(YZJ597e?P(#CfXA]NR6O31;NaRF9ORgZDRb/e)3R^X>;)INTGN\6U<R
N^RC,PXff&Ag^+/<=>)P;SE8>_aNDc\cAg3J2X/K[Aa=bZ4-T@5^QI+BAF-GbK_f
.2e8&EPV/e/Q=;3(/2B9NU)c,Gg226K:PEF/KGOHbX:4,X#OS6g>=a6+2OWgLVEc
M=&2-I-WdNBP00/L1aSRCBV<,2I6U-QPHWF/WY[\ebgP2K\LEG,=b<.@8O06N(5f
4]UT[3]?Ia=D@d0042BZ-_<\Gf4RBH1SOLF=]W9YZMV<eZN,E5GWKSeX?)HI_XJ1
[@L]A?H/@b1#\7S;?e6_[#f)S0V5DBI<<YaR-F10#Jb-gG9+#L>NAUGgGGE+&c6H
(8OJZY.@BRV.b5^L<@KU(YR]A+Y+MA[1=^aW?E)I5KYSa^+<DLWCeB3F8af^#5:3
H,Nf0fG#>[9WI=[0(/b&8<7g::(1(2OcEg6\Z872JacWPAXM]>)<P+Z5=CTXQ5HD
c3;MLagU=O_-\NOSa)2\:a7-)9AF][IZ-;YMJ_-_Z.^RJNVCg.dd26,RPEO/AJYZ
C5)45=NA3,/E+0F:C4??I9K[FO7JHN_=)I-9[3HWZ,=Wec1[^(b0^8[DP,f[Ug+;
0I;OJ?]9B^])Yb@8BefAL0gR]+OaN]DFdT5S;f=C8F?@=dO,;1J^BN-QNG7MdMD(
D6:9<MT/E;G^V&VJ1><4B+4Q&MF+])J/7M4WMIM=+f79>V^g0.?3S,Rf+\AYWSD[
eYWe][4@P5PbIE2QCO5a\9HX9LbdV?G#?We.UbdDGY4[Y&ML<F>NP2KIAaF/:1FC
RHKX;3C+b34fCD<+MIXdb5^]7b]<N6Z=fg4.<J?L(M?RAZ6Q34VNR5->ZcMC/ZJR
Q/aB&7=B/YKQ@M(^6b9BLD@QHJWB//W+K9>H-(Id;M=,EQ9JO[cK4IUM#9BHE)KW
S)^?fCRMQP::a7]U4N.JHaGLfUI\73Xe1?C3E)ZE?[;,a0V-=8+WQP_/@)(Dg#7d
OeRU/AeTV#>5:cgL8DTEVTB5M+T+2;O:O7D0^Q6gdR<Q&7QBYZ@,b.V?A>SBQM?G
M0O]@H5H@^Oc[e59I[GPC@24)d<#];c;T-+ZZMX#d^_<+];Ed,a.AS+:C-_]VTed
.a1:<T36aaAW7c<B@/J_Xa+=gJK=K&C?E:LJ@EgfHNg9bHC+D25E:IY^U.be<\eT
HDCb,aD0>b>T=9AG[aPE:IKG\YZUN+&Y2Q-X[A<N\eDf1IPR>]DG\GPT?)E^AKFX
7GM,7@e:/F)[_7.DQ-2QM++OK(MOOc\3e\-^U8K7\G-@U6KfAcbA2e+H(/F2^@//
XS_L0_HZ=5_AaMZ4O<J/R][9\)V&Z<P[7TN99[Bc8dfJ8B0B3?U@:?7ITN^J(S,<
06#EC3<AZP0SPcU=8X2?811]+E<E43Cd9U1>H8ZU;<D8c2&LQc\(DT]V71_d(7(W
^,^M>/&dUA5&]KL<=#Ja:@LWd<g&cFI^5/Q)eY6+T@cN/SaC&<@]^:R]4,f\1-CW
Q=IN]B8SOTbWa)TRQg<\Y[G>83#P3B_ZSP53)VI1Z1HdF<AA?+9_b>N\0(IC3L0B
BWEa9G,SQWD&:NSd\eH??T+81-[QY7--N<,U@F&7O(];1fD8/#[\M^P0WH7#=DH<
&^6.\&aQf9@/2N@J&1),\KS.ZU)@&0-FPLdK#-^D]L.@6WPA,>e-26C7&PK(X-.-
/TRA[<\-a[X\5FW&ED/VFU^#XFU0aD[fD&TAVeg_&E:[)Jg[:L4L7IXX;^\,&Pc?
]CG<Q?HbI<GHK?C4/Ca,U2(cXAJZ(/@^J_CP3\Sb622bEHfg4;FW1^@Le,_@H3Z5
10^3S5S;8C;YgR^251^E2S>HOJ2P9dM]H6&I(0]g?gP;ID6[^S_Q:<D\AJ6ZDVKM
GD,)R#C,1KR(dQ,DPH-;4bBJEY;4[26H#,a:)V>[BXU^f5L4,2_4B,@3?310E?K0
\HYAc<Z:NQ?/6#U462&9c914D,),2Bc>X6I[8>\L^HS2K0A]02;[J.Tf9Oa?A:(#
?H?8_-8+].+>)L_(U=U^Se4)P,I.)8fb0g]L\_@JDQ[KS8Y;Nd6aI]]fQ;4-:@\K
,@U+=>KB-RD3[Ng9_S2:S7A6g7UK#C.<<cK\6NQCY>NPE7YC^B>(6&4?(_;.0\N7
Cg>Db>VDPS,^3M+L_f07#AM5/H_WU?02_f-SCfT6]T.>(1,.^37FNg>0N)XDX>D3
U947P/?-9bTRR8DY(+Y@/UDQ3Z?D;VFASg7/G_,[D/#+Ec>.XR^e/J.#A3\b7DQ#
a33+C5a7H9YC6<162UHAZWYBK7N,8TCZgHPVJA7677AO&[1g5V7@.gPfM_9:&3KF
8TRgG=;G,WL&N+JB_dI2E?LV[LG77R<cOA,2R^9AKX&D@2R?RfOF/0bGfL<RU\>f
&g#LZW;H7U#/LQ>R7<K#W1)6&-LREI#X,R+HGB&/?1WVW[HBgPU;]1G+S[=gc\F.
+[f,YZd400.W46\[^<B==EF?R8BgNUeOgc15MWKUT+D6J1J3+6WG9T_XJMaI,Z;d
568Z^=9aD_,[VgP;9gLZ@ZN\(9M1O(BcO>VgKFf)D67b(egg:6HaK=9HT:6.?^+H
T[HMQ@WI.<0SM4A,6Q.f<7L83A;P:;;TSe-R#CMg9XLB,dCcB\3-:D),2]Ng3[JR
9@]V),947B>X+g)2)7AI7;1;:TJP&VC\aV;9[W\[KC_S7a5WHC/fE4FWX)<,4IPd
,DMdAbA)O9Y[;Taf.5@^[&M@Ja@W7RK.:(bIP+AXMb<g/J)^OAD0MUPZ9g]+b5Ec
[PC96eZg-Q3H/O&):&.2+./1XfFbJ84Vag&K<ObK+E]4g-AF:ZKQ58]G_Z2,C=(8
8G4/R+^D6ZNU++bFA4_Z3fM#??fRNMH[@4(KgYUIN)[(gODS-IHQe>WE&AUBGe?P
:(TX9TCDFb(B)O0C=/+HI;-Y>F\Tf8c]A_^0[O6d01V\H7RHd#fOUM8=)</;J+g:
DdO/gPX\N7>XO9GNE+O[&QKL934b7FY.E,-^c6T+N>.Z;A,BBN,1TMb4337@(PGX
R,PA+OFeQ^1K3cXMW:b?T2+14X4QD^b5S_4=Fc=100Y,a<ce[fgJAga,VIALc10B
JQ,9N-)9.K#6OfEND]8BAY=]WN1.MY(4_-<#YcT4/NZCG+R\:?G(g(NH-dKX>H\7
1J<gR^4RHX5gAF-@8M,)RQ/0L_bCA1dO4QF?SBL4\g0X4732E[CA/=Y;RZK,=J5Q
UCL/)5RNQDM;W;+:Y,CV&NJ+:UV[DID3V5TMLR>=^McJQM7TLc:6^B:)E58SHROW
]dN:HbJWbb05H3R8_:67?2MPF0A(3e14MMIK#7L9+Hgd@61#Y])#H>3G,>WGaA,\
F^<He3dRaLN=[U^D11^e0/OT+5YQ8XAX(54&ZWTJ[GQfId7+6;\[/JO-Kf>JW6SZ
bEN<<CTNA&QK#]gFD/P=MOX_B0;c,0-de6LBPgUG+RY3CLU1T?J5_(_(9=C>MZ:5
a:M8SXYNMcL;_R5S4[,OZ_40WRPR36\S^[_EPD&S=Y3U+#Q1MEK+>75RB_&eE[dI
D@;=SB7GF\FfV:Ng55HT#\F:M2,+1;D\MXKLdGNZ^A]XX99K]FXOFJG4@?BZeRTB
d8K>@;399N;G?FKJOEVae<S\aPX.f3)EZZ&H>99]8,TUa#<[=I;^61EO+^Z2@bU:
W1^&A-cRG,35FCD&PUNA(K4M7/?0YCPDV(LB80@MQZ[aP79)aZ<=L(7#NC&Z(2R<
HTPA2QLL9:.3c1L36^(5g3J30Y.K[=a)9HMHTSK:6HD\(626(O_a9##1^Y=;<+>0
[];&2314SIca=:W+REa@[fe?X^<);8f+C>gPd65eWAEcR+,0BbbW<]Oc7J@&<4+O
J(\Y41N/F[W;TSf-D=;cAF3.?=Y:R@XU^A^H]W-]W]&Lcbf(Ne:>?\B?#AFH6PP4
\5RE8TFdM[N/O6F=DYaE9+cGC3aP#>e&MgN@+ER--K2(@8Fba(;_LNW8/IaX>eAS
I&dXdeI,^aU+X#0&BBHZSDF\UcLYT:7OL-Bf?+P:<VG>#NV18D]19L^Obf9^:=gf
GSg<LaDTc.LVdK\Pcad69S-^AU4@;+5;;fJ&B1g0TfNPZ0VZFW.bQQ3MWLMAeS1L
d#ce/^139MY^PAd_938g\DIdaaY&/>-RV7FE,F8A12XMEK.YB<f+XN9-X#OBL89,
04KTR?U17C@8^8WTa0PZfcE,-6gUeX6gd^?6;0RZK]<fI3>4?ASSEF9-[3#W(aY<
@\GKH@17>PQY:,VadDR/8#^7>^RG,A@&P_dVCg_(8X=Z.,9AQ.FEH5NR2KFV>3>>
YWI)@<,8Q4L9G;[QI\_Y0>-ZI7PgV;YK\&Zg,3>&W3KMMN0;Q+eYddXC;HW[X@EO
cVDT@2Z?<>0XfgD5b_VTGD-@UGCO54(0[;6(GGf#,V;-?;HU3VY62b[LKcf;V:QC
]PR7RR3DL2P\>M+e4;#b.-G@9f4662=OK,NLGdTB)#bK>]<<[+CTWK@)#OBG,4FR
g.IDKD.d<2LJB<./CJAP/N-MbCGcQ=^KW0PR[TUCT&@0a0_66U0(Q_dVF#dNMBQE
B4=U/Qg#MBP+61P,<[K]5bUH2SH6@S=QQ(315E[(H/fAOd:Xdb>BB>/_4+3fV=JN
/N)[<&&4Gf1#[LI>-<]4J]X21WdEKHN]Be,(edKNYNFPF,.A-:\A_BOA9K2gCe/M
d+,]U>LX;U.,)X#FM@@)&=+:,a87J08NSYC>XOdV1(TfS7cV_<g&.ZS#aCQ;RGCN
G>3]/T:1?WWHT[M;)2[BU2TP9:4U/>gITY.,,KB<0+IY,T/@9^2C6N0YTV7_5<T8
OR#IOe@7_(F:1[HGKLg26cW&V1@]VMQO&U8b8^L/\EMEBL?B7Z.H>I5GLB7Sa7XC
AEWT_T[/bbKHM4\\DVC44/6B1@2+5&CJNdI,S_H_X?fU@S2>C4:,.AgRTb\4)1=Z
L8]>=<S^Z#.=UW#>AF1fc+W;C3QBL>#]^_Pdd&([1RH_K9b+Cc+BCE7Od9+#JRA_
6dF6@:L(e0I03KF<SFR@/bIKF)&>I.9EZ4B9JUKaZfX\Ca^2I8R,H@OM5b)4@?CB
Sfecf+gbd24-PW6CG&8NS=Ngb<\b6#Lf^If4<:@=?L>K_?0WU^T/NaL<AW=;ebOQ
^G^&43BPc?;I61J>3gg-?/]BfY1#\4gIf?c<,R:DZ&_:Yd?LM0;^]I\af@&SU,4/
gP>SOO\+4A_XUNJ<fd=AgDADY[\Z=gIBB;REgG,_KH[UC6MfUCFZM@1^IXeGcMS;
<DT_BJBQZ/f<Q;GF^e,M;8JTG9H4)&HM,13IbT@G9:?M@XRX;2\B^]BTY1C477cE
Y[Z]3fSP2B\aG]_CDaD.0G(;T=)AA0d]d_WM6IS.[Q:&1#?AC5I=;WCgJe[8QT&0
CIF/f2KMZ]:DM;ad-FJ0MXO/LETH:0I(ZTM+Q8L>ZaAHQeB#b+NWYW^GHf[ZO4)W
T3M/FX1ET9A_XDM&f7;C365a7<XP69fNcOWYG<-0YB?KWI;fIaYRPPL_e=[cVd&S
?^?O>\NfYXZ)/3\=e=/]X-caZa+b((D^,<Y>;??)M28Q(FI1//NT&?6S;9b,XFfQ
TCbO:A6-OL+KNR-\>,A\WfU0Q0OEE6,YYF)&\eV1/\90T=F]_Yg?8YUM@dE#H.e]
d^F;)G^:TG5b[dN=HbeUQE2^[#@\.EP\ge#F#I36N^VeQDcJN7:3SD@TDS(?I+0&
M(Igf<N-_MVe-^/?Y3VYY-LYWI_#TdZ]\^ePL?(:41Nae@BfC4<?E&-DAE=.G@_?
/XJ/8Q:4AS:>A1f^ST-2#TLgMYM_7B.6372Q9(D-,(g_^d5WB-NVbK]9(#EZVH-O
(-OOPQ6\Ve.1.7UL.3S]@[G_4A5D(SZ>0W-\,b8+T1ecJU>Ra@0FRH/Kf+J</RVT
3VO.-IK\VZQT<eQU,3IFQ)KCWF[F9d#_N7V;@2c5HFOA0XQ-&D@#>9>.(cS1cK1=
.CN718=6,D9DZf)D.-DD?=_bc0\Ec=XcC&[JSP00^Vf3DAf&>/cF3c#>S]RS06R]
^eX,POL?_+:?]<Xb3,U4Y9?E6eE@Ta]6.+9,K&RVLO/YNZHR4B\b@>2,YWTD].Qd
ff??#EY4+R9)#F)E^Q<GIgb[KfG9A+LI02d)(e8XW[OO.>G8?_<(]^6-+aT\EG7-
:]Z]=-+8W@.7geb3f(JSS3D#=M4O4,Q)8LOK;;;AH:Qc::X+7.])eLU@bX8]H&NW
[IZQS<Eg;&:R>VN8PA,gOXWNgGL]BN.f7_X?V7>QIQgdIQ34OW)+?+Z&J8(]1fC+
XZP[XUYbV\R7GGQ8&a^V_DT1eR=6HIgZ\d[PN,f8M0X0S-2WR>=M8=TS8]4da/&L
G\AC_K:U@aFA^R=8Kd=82fa,[N0/5>Z,R]:.F\fb8>0:ZVGQR-bHFH63A@UPXFI[
01#/V->VXPc6PHTF\?A334Cf;Zg)1149a6O:a(>H7-U;^+<a:P51._7W8^e#dL85
\4QNQHBLXBQabF&8fI0PARFM,fL6#ccE6)I/5<SeC0=ZPKC-STW^XW46;e_1aQ4L
W:FSN.WZe>\X>N=WgN-2YZa??Q-Oc</[LZ5:&>gD][SQJ4.(6fPP1Bd=baA/YH#;
KTDUT^]acgEIVY<?>YMG2?^O?R7KG8,U<#f#MVSB-=/ZKdWTNJ\/#,<0Lc8B\d2Y
84gVQ:F6g9PE8<-/.^T=.G2DP0L&#^#=\2#ZB/af)K]68_8@I5J1&ABgd_R\=JC3
TJCS-[B-J7Cd(df(2L_2&H]E;_22#e?4Z2^H1#Q#e]EL?2Y.?;I/I)4aeX+QPGVR
#eCKHJ<CbT^/e-BE?N1F(#/ZJ/2(S+Y>X[_[;0>(6MEDDTfXWM[GA=MDP1M#<BQH
4:AV:-DP2\R-ed=3HD<R@ANK9\EO>)+b;.5.2F7eNDPVHA5()(GV/Z^SSOI9+eDB
PG7WIPNG^8cEN]<]2=T32Hd3f-__EWP]G3a>(e^-_g2KbaVcR<TTgRCHO01+]UHP
B9C)e<M,ER]:MJX_R<JNK@4_4;#Y][+E\-<,8BRE7T<eQ,,PM476YgCE8]14<52J
ZGQ+-99Ng@AbX@A=SdYFf/:f7EC/5R(CB8I<MMc9(d7>+dUQ_:\5CYDg@20b>\bB
6NHa-+K5#H9fA>R_6RCYV>LP@+ffNGTCIJ3T#FfMUSO/)Ab53bCJQRJ/c?NR:Z@B
R>R37Ief\.4A1b89+CPAK&e@18S+Z]P5I9(fP/S)d4BbA=HW9&?(-G2Z=Z8fBFUa
;A<2(1aDM;?&dZB-JUW6V)]JB(H1Y:I.N&V><5(EKH_>(>16IfcYLJ4ePA5bOMBe
Y,J@&6:?0@+Q@FgU&SQR1bQO>8fO6,AP9Q^)J[#W9L=2[NNBBEDH].U^47M;NJ^:
K)JI60=MG8M5d&K&N7LU)Q6X8,8N7bQI/]S^[;@IV6HA_f(EHd,:J0I;R+VIN#UF
cD&C32#J.521X9\Ubg9\LD.),-G^J2V?Y07eLWB@;.RY,+RNA?9QO1K8?NHe^:DU
P)SRP=c(-a]EZ/Df]8->)9_9RF;+TGJ<fNVLeH0J+]6,6]ZeDWRRYH&_GcE9?Y)A
5RE\Z[T:G7FMCOg?VF)ZI_.O[3Td?\5[--W]QeAN.GE]d[[O.,Dg.\AUQ4A>d;1H
ac#Y\JAV+MQPKQ\e+F)f;E,8d6c\I^=#K.gY5S.](fX0b-G,POf<d>/NJU,M6c(:
;cD2>]+W(Jg8>L+&H1JaM9WG^I2A;V\bRWQ_Bc@F55D2dZ/fSG:ZOg=b(.N=FK9F
QF0]Ef<bQE71B59JRY]SI/Y_V3Y)>:2EAZLVL,f44IS:-4EM.6[Y\6d3a]Y3U?Hc
H&4g56<SS8V3V.\5_I)e@@D1L=5&MTT/N7><&B5KIXU_W4U5B3L^XD>Tb@P/[N^9
fM4D<&,]Pfe3RW0Zaf;O[c&]YZ)RJ??8+P9&d3_)FeR:U=^@CT;A8H?X\:2>;;c>
bCbGOd^7O,f9CgV#=SZ.:W(GL9R1a7&]dABDWPc3#K\#6T9Jf,SdXg1X?+OGT49;
>4=Z(Z2FPPUAa6J_?6.H)b<&A?/:+VYW0[5U<X;VG]XbETD#A,B/D#^U8\.MO@F0
M;UT/2^@bfMTW7SPDW#EHC.@,_4;dF<6MXXGUX44B^baDRf#YcD[?OcT81fGX&X.
PF3FAgQXWCPMd1IdFVdB/,;K2#3F/<E@f=SG)(H;cVgF;S=+6UX.eX-J-.K[A\J[
LKNW&;(B<;;bGKDD3EM32C.10&=C0?C<,BXgARc0YZW[B7d57?.d#]&gVZJ.P]5J
IE^ed3@AgBOD_>R/OMG1<HK6Q>/9GbNS581,Jf9MW-(fR]41^c-a?W^<U1J.&L58
U9M\4HPZeJ^?J#fZGO7U0,E,?gJ)@\C^b<GEN078cIZfH$
`endprotected

`else

module DW_data_qsync_hl(
	clk_s,
	rst_s_n,
	init_s_n,
	send_s,
	data_s,
	clk_d,
	rst_d_n,
	init_d_n,
	data_avail_d,
	data_d,
	test
	);

  parameter integer width = 8;
  parameter integer clk_ratio = 2;
  parameter integer tst_mode = 0;

  input  clk_s;
  input  rst_s_n;
  input  init_s_n;
  input  send_s;
  input  [width-1:0] data_s;

  input  clk_d;
  input  rst_d_n;
  input  init_d_n;
  output data_avail_d ;
  output [width-1:0] data_d;

  input  test;
// synopsys translate_off
integer reset ;//        [4 : 0];// :="00001";
integer idle ;//         [4 : 0];// :="00010";
integer update_a ;//     [4 : 0];// :="00100";
integer update_b ;//     [4 : 0];// :="01000";
integer update_hold;//   [4 : 0];// :="10000";

reg    [width-1 : 0]  data_s_reg ; 
wire   [width-1 : 0]  data_s_mux ; 
reg    [4 : 0]  send_state ; 
reg    [4 : 0]  next_state ; 
reg     tmg_ref_data   ;
reg     tmg_ref_reg    ;
wire    tmg_ref_mux    ;
reg     tmg_ref_neg    ;
reg     tmg_ref_pos    ;
reg     tmg_ref_xi     ;
wire    tmg_ref_xo     ;
wire    tmg_ref_fb     ;
wire    tmg_ref_cc;
wire    tmg_ref_ccm;
reg     tmg_ref_l;
reg     data_s_l;
wire    data_avl_out   ;
reg     data_avail_r   ;
reg     data_avail_s   ;
wire    data_s_snd_en  ;
wire    data_s_reg_en  ;
reg    [width-1 : 0]  data_s_snd;
reg     send_s_en      ;
wire    data_m_sel     ;
wire    tmg_ref_fben   ;
reg     data_a_reg;
 
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    
  
    if ( (width < 1) || (width > 1024) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter width (legal range: 1 to 1024)",
	width );
    end
  
    if ( (clk_ratio < 2) || (clk_ratio > 1024) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter clk_ratio (legal range: 2 to 1024)",
	clk_ratio );
    end
  
    if ( (tst_mode < 0) || (tst_mode > 2) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter tst_mode (legal range: 0 to 2)",
	tst_mode );
    end

    if ( param_err_flg == 1) begin
      $display(
        "%m :\n  Simulation aborted due to invalid parameter value(s)");
      $finish;
    end

  end // parameter_check 

  initial begin
    reset       <= 5'b00000;
    idle        <= 5'b00001;
    update_a    <= 5'b00010;
    update_b    <= 5'b00100;
    update_hold <= 5'b01000;
  end
  always @ ( clk_s or rst_s_n) begin : SRC_DM_SEQ_PROC
    if  (rst_s_n === 0) begin  
      data_s_reg   <= 0;
      data_s_snd   <= 0;
      send_state   <= 0;
      data_avail_r <= 0;
      tmg_ref_xi   <= 0;
      tmg_ref_reg  <= 0;
      tmg_ref_pos  <= 0;
      tmg_ref_neg  <= 0;
      data_a_reg   <= 0;
    end else if  (rst_s_n === 1) begin   
      if(clk_s === 1)  begin
        if ( init_s_n === 0) begin  
          data_s_reg   <= 0;
          data_s_snd   <= 0;
          send_state   <= 0;
          data_avail_r <= 0;
          tmg_ref_xi   <= 0;
          tmg_ref_reg  <= 0;
          tmg_ref_pos  <= 0;
          tmg_ref_neg  <= 0;
          data_a_reg   <= 0;
        end else if ( init_s_n === 1)   begin 
	  if(data_s_reg_en === 1)
            data_s_reg   <= data_s;
          if(data_s_snd_en === 1)
            data_s_snd   <= data_s_mux;
          send_state   <= next_state;
	  data_avail_r <= data_avl_out;
          tmg_ref_xi   <= tmg_ref_xo;
          tmg_ref_reg  <= tmg_ref_mux;
          tmg_ref_pos  <= tmg_ref_ccm;
          data_a_reg   <= data_avl_out;
        end else begin
          send_state   <= {width{1'bx}};
          data_s_reg   <= {width{1'bx}};
          data_s_snd   <= {width{1'bx}};
          data_avail_r <= 1'bx;
          tmg_ref_xi   <= 1'bx;
          tmg_ref_reg  <= 1'bx;
          tmg_ref_pos  <= 1'bx;
          tmg_ref_neg  <= 1'bx;
          data_a_reg   <= 1'bx;
	end
      end else if(clk_s === 0)  begin
        if ( init_s_n === 0)  
          tmg_ref_neg  <= 0;
        else if ( init_s_n === 1)   
          tmg_ref_neg  <= tmg_ref_ccm;
        else
          tmg_ref_neg  <= 1'bx;
      end else begin
        send_state   <= {width{1'bx}};
        data_s_reg   <= {width{1'bx}};
        data_s_snd   <= {width{1'bx}};
	data_avail_r <= 1'bx;
        tmg_ref_xi   <= 1'bx;
        tmg_ref_reg  <= 1'bx;
        tmg_ref_pos  <= 1'bx;
        tmg_ref_neg  <= 1'bx;
        data_a_reg   <= 1'bx;
      end
    end else begin
      send_state   <= {width{1'bx}};
      data_s_reg   <= {width{1'bx}};
      data_s_snd   <= {width{1'bx}};
      data_avail_r <= 1'bx;
      tmg_ref_xi   <= 1'bx;
      tmg_ref_reg  <= 1'bx;
      tmg_ref_pos  <= 1'bx;
      tmg_ref_neg  <= 1'bx;
      data_a_reg   <= 1'bx;
    end 
  end  

  always @ ( clk_d or rst_d_n) begin : DST_DM_POS_SEQ_PROC
    if (rst_d_n === 0 ) 
      tmg_ref_data <= 0;
    else if (rst_d_n === 1 ) begin  
      if(clk_d === 0)  begin
	tmg_ref_data <= tmg_ref_data;
      end else if(clk_d === 1) 
        if (init_d_n === 0 ) 
          tmg_ref_data <= 0;
        else if (init_d_n === 1 )
	  if(data_avail_r)  
            tmg_ref_data <= !  tmg_ref_data ;
	  else
	    tmg_ref_data <= tmg_ref_data;
	else
          tmg_ref_data <= 1'bx;
      else
        tmg_ref_data <= 1'bx;
    end else
      tmg_ref_data <= 1'bx;
  end
  
// latch is intentionally infered
// leda S_4C_R off
// leda DFT_021 off
  always @ (clk_s or tmg_ref_cc) begin : frwd_hold_latch_PROC
    if (clk_s == 1'b1) 
      tmg_ref_l <= tmg_ref_cc;
  end // frwd_hold_latch_PROC;
// leda DFT_021 on
// leda S_4C_R on

   always @ (send_state or send_s or tmg_ref_fb or clk_s ) begin : SRC_DM_COMB_PROC
    case (send_state) 
      reset : 
	next_state =  idle;
      idle : 
        if (send_s === 1) 
	  next_state =  update_a;
        else
	  next_state =  idle;
      update_a : 
        if(send_s === 1) 
	  next_state =  update_b;
        else
	  next_state =  update_hold;
      update_b : 
        if(tmg_ref_fb === 1 & send_s === 0) 
	  next_state =  update_hold;
        else
	  next_state =  update_b;
      update_hold : 
        if(send_s === 1 & tmg_ref_fb === 0) 
	  next_state =  update_b;
        else if(send_s === 1 & tmg_ref_fb === 1) 
	  next_state =  update_hold;
        else if(send_s === 0 & tmg_ref_fb ===1) 
	  next_state =  idle;
        else
	  next_state =  update_hold;
      default : next_state = reset;
    endcase
  end 
  assign data_avl_out   = next_state[1] | next_state[2] | next_state[3];
  assign tmg_ref_xo     = tmg_ref_reg ^  tmg_ref_mux;
  assign tmg_ref_fb     = tmg_ref_xo;//not (tmg_ref_xi | tmg_ref_xo) when clk_ratio = 3 else tmg_ref_xo;
  assign tmg_ref_mux    = clk_ratio === 2 ? tmg_ref_neg  : tmg_ref_pos ;
  assign tmg_ref_fben   = next_state[1] | next_state[2] | next_state[3];
  assign data_s_mux     = (data_m_sel === 1) ? data_s : data_s_reg;
  assign data_m_sel     = (send_state[0]  | (send_state[3] & data_s_snd_en)) ;
  assign data_s_reg_en  = (send_state[2] | (send_state[3] & !  tmg_ref_fb)) & send_s;
  assign data_s_snd_en  = (send_state[0] & send_s) | (send_state[2] & tmg_ref_fb) |
                          (send_state[3] & tmg_ref_fb & send_s);
  assign data_d         = data_s_snd;
  assign data_avail_d   = data_a_reg;
  assign tmg_ref_cc     = tmg_ref_data;
  assign tmg_ref_ccm    = ((clk_ratio > 2) & (test == 1'b1)) ?  tmg_ref_l: tmg_ref_cc;
  // synopsys translate_on
endmodule
`endif
