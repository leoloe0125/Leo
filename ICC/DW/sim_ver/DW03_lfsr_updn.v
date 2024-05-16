////////////////////////////////////////////////////////////////////////////////
//
//       This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 1994 - 2023 SYNOPSYS INC.
//                           ALL RIGHTS RESERVED
//
//       The entire notice above must be reproduced on all authorized
//     copies.
//
// AUTHOR:    Igor Kurilov       07/09/94 02:08am
//
// VERSION:   Simulation Architecture
//
// DesignWare_version: f4092d46
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------
//
// ABSTRACT:  LFSR Up/Down Counter
//           Programmable wordlength (width in integer range 1 to 50)
//           positive edge-triggering clock: clk
//           asynchronous reset(active low): reset
//           updn = '1' count up, updn = '0' count down
//           count state : count
//           when reset = '0' , count <= "000...000"
//           counter state 0 to 2**width-2, "111...111" illegal state
//
// MODIFIED:
//
//           07/16/2015  Liming Su   Changed for compatibility with VCS Native
//                                   Low Power
//
//           07/14/94 06:26am
//           GN Feb. 16th, 1996
//           changed dw03 to DW03
//           remove $generic
//           define parameter width=8
//-------------------------------------------------------------------------

module DW03_lfsr_updn
 (updn, cen, clk, reset, count, tercnt);


  parameter integer width = 8;
  input updn, cen, clk, reset;
  output [width-1 : 0] count;
  output tercnt;

  // synopsys translate_off

  reg shift_right, shift_left, right_xor, left_xor, tc;
  reg [width-1 : 0] q, de, d;

`ifdef UPF_POWER_AWARE
`protected
W=AE5J(.0-@BW)R=0&B[IJ+^M;fWJe7Za]Gf:EbHOFI5Qa^KFNED,)eGT>faB0Hb
)]?SeaZ0S;2cWdI9/bdBd(Q3\[5Q.),+X:7#T\XUU&=-GN2(W\;XMLMBTDUKcGNY
ZXPVR&d38^L,JK8?VG\MMOe8f?+U7#ScB=N,E]Y64c+OWNM<9@^4[5/a.^QAHQT_
X?5<LTe0+BQO]HTY/RV/X02-Y/W#&6T=Z7N0:CeCN8\Oc3\[@UKBeL9EXEV#Vd<+
gR91G91GaNbR)=9_\Y5+44#aI++;@+bI5C+aIc?22C--W]TLJ7=4@\E,8,U9d&/^
Q+M]9f5cO7D?+;2LXIE;3a.WM<>#E,9M+NUXDNWWd3[?3&+P=@Kc?fA#NN(L)-#M
gMg+T9eNM_DFN9Ga@.03Ta=Y6/7H^KB>.GbS@N9I:?HU&&DFGc=bEWe_WH;e+2+V
ZABA_<4Y/Q6B?e<&>bG6+ffR1Zd2E,<eHGRZM=F,^-.E)J3<^)>,U-DNZaTbY7:V
LJXZK:YeL:PVIQY\YF<MX9<8PCIDTgP=H];L2VPbIZg7cPd@d-3/&SI]O?R#ZID.
-<OU((G+a\92^:(CME^LL)W4#[IIF&fUKMGMa\0WB]N&b=HaA?dR#PS_/OTIBAD0
e.)A(9Q-,#QBSXRT_8U+])E]If7E0AS4aE(N<QBV-WOSdNBP:A+6U-)\&[S[?Wac
W&[24&cP]F#?#fA8-PWN-=.OVS&Re\=;JIK-0.BVUX1F?N8TJ,;X.f@PVP2FQ4Gb
XINBYV.GE32OHIV:+PP/[C42Y=70^>?TW6OQ9\>X#,(39Ua?(QW3HM[,RKV&aQ&<
/c+5M3B)Cb?df^[M0:#[ZSb_I_X/E@R=<7]2b\OQG-KAcI9FJ?7.8dI;dJb9R=\8
FI[7OT,=^7cb7N<W8BI=P3c,&KfCN@W1)SEM^96g0#R3=H[HRC-]bV)+gD5[2YDb
GXFg(GeHOe=#6YQ@SHf]IgaN7L/?,I>CQ>c;J>cYV?XOg\d6=31YFTBaJ2KK/L4>
aIO_?FHEJNZ&BH8R0CeE\K8bVZf4N3W?Zf\_UAVFWS_6c:g0<[Y)0KK,(af6AI/T
HEf;-JF35J.Z@Z35\9)>A&@/A<6[eeCc4Hd+GN@E38\+&FFA;T2,GK>^W=BgFe=>
5>\L2Se(-D,^IJNNcbATKdLc-[7dUcZ<dO1&-;[Sf501388),7ROV[XT-(EFa[7A
24f0bNT>8edP4,2_E-Y4-IU+2TL.&J1,U]0)/XTWWNON>C2\)B#.YKM]1(,6VC9Q
d<[]8(R=BCG64d;+8-_R48eF74/LE8Wb3,@NLHUVNgeaD><CDKc/]0>P(,e<+7K@
Mcb8Tge93SALX#QC,=dISEU(SP>[+XTHE_9NJcCWE#gT/N)V63L,(855NacA^(ZD
K7_(deS[-LI6+:CY^P.7f_N#O;#X\:7)B>)KZ0<0EU;CWd#S1UL1&604eWC,XTLA
?T=YP0-K3AP0C.72N^<-5.[6@;.)98A#)g)HZEeA-Uf,+[=B/G_4ZRHF7;(d&4VB
g<?X7OS58\c)f?],c8(TP_gFC;;U<2[fF>eCA2eWae]7+2K3RRYeFO;dMc/1MO&1
M?a2/O6X[a/H?-:>8\LAeA0:,#(<cF1@G.@-e10cB[C;R(4<aBL53_R\a=N80>=<
&]Y<.d9BZH#\5d42/TRgNb2g4O4Be6FSF<eO5#W5=AJ\))#Y7dW=4&UeXf5]Y+/I
Sa0(THZ?K4Z<&LaXd5[,9?IYGBI=^5c9+,?TTV)&Z;Cb&GN--H@MgPT^?S?1CTYb
X;/F4(\O,-R\]1;)EKJ,0A++79_YKWS6-XT<&7<OJ0K+_=Fc]4Kag.UeUU=UB.-7Q$
`endprotected

`else
  reg [width-1 : 0] pr, pl;
`endif

  function [width-1 : 0] shr;
    input [width-1 : 0] a;
    input msb;
    reg [width-1 : 0] b;
    begin
      b = a >> 1;
      b[width-1] = msb;
      shr = b;
    end
  endfunction

  function [width-1 : 0] shl;
    input [width-1 : 0] a;
    input lsb;
    reg [width-1 : 0] b;
    begin
      b = a << 1;
      b[0] = lsb;
      shl = b;
    end
  endfunction

  assign count  = q;
  assign tercnt = tc;

`ifndef UPF_POWER_AWARE
  initial
    begin
    case (width)
      1: pr = 1'b1;
      2,3,4,6,7,15,22: pr = 'b011;
      5,11,21,29,35: pr = 'b0101;
      10,17,20,25,28,31,41: pr = 'b01001;
      9,39: pr = 'b010001;
      23,47: pr = 'b0100001;
      18: pr = 'b010000001;
      49: pr = 'b01000000001;
      36: pr = 'b0100000000001;
      33: pr = 'b010000000000001;
      8,38,43: pr = 'b01100011;
      12: pr = 'b010011001;
      13,45: pr = 'b011011;
      14: pr = 'b01100000000011;
      16: pr = 'b0101101;
      19: pr = 'b01100011;
      24: pr = 'b011011;
      26,27: pr = 'b0110000011;
      30: pr = 'b011000000000000011;
      32,48: pr = 'b011000000000000000000000000011;
      34: pr = 'b01100000000000011;
      37: pr = 'b01010000000101;
      40: pr = 'b01010000000000000000101;
      42: pr = 'b0110000000000000000000011;
      44,50: pr = 'b01100000000000000000000000011;
      46: pr = 'b01100000000000000000011;
      default pr = 'bx;
    endcase
    pl = shr(pr,1'b1);
    end
`endif

  always
    begin: proc_shr
      right_xor = (width == 1) ? ~ q[0] : ^ (q & pr);
      shift_right = ~ right_xor;
      @q;
    end // proc_shr

  always
    begin: proc_shl
      left_xor = (width == 1) ? ~ q[width-1] : ^ (q & pl);
      shift_left = ~ left_xor;
      @q;
    end // proc_shl

  always
    @(updn or cen or q or shift_right or shift_left)
    begin
      de = updn ? shr(q,shift_right) : shl(q,shift_left);
      d = cen ? de : q;
    end


  always @(posedge clk or negedge reset)
    begin
    if (reset === 1'b0)
      q <= {width{1'b0}};

    else
      q <= d;
    end

  always @ (q or updn)
    begin
    if (updn === 1'bx)
      tc = 1'bx;
	  
    else
      begin
      if (updn === 1'b0)
		begin
		if (q === {1'b1, {width-1{1'b0}}})
		  tc = 1'b1;
	     
		else
		  tc = 1'b0;
		end
	     
      else
		begin
		if (q === {{width-1{1'b0}}, 1'b1})
		   tc = 1'b1;
	     
		else
		   tc = 1'b0;
		end
      end
    end

  // synopsys translate_on

endmodule // DW03_lfsr_updn
