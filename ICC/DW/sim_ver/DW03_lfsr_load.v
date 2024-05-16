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
// AUTHOR:    Igor Kurilov       07/08/94 03:41am
//
// VERSION:   Simulation Architecture
//
// DesignWare_version: b22fcb2d
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////
//-----------------------------------------------------------------------------------
//
// ABSTRACT:  LFSR Counter with Loadable Data Input
//           Programmable wordlength (width in integer range 1 to 50)
//           positive edge-triggering clock: clk
//           asynchronous reset(active low): reset
//           loadable (active low): load
//           when load = '0' load data and xor previous count
//           when load = '1' regular lfsr up counter
//           count state : count
//           when reset = '0', count <= "000...000"
//           counter state 0 to 2**width-2, "111...111" illegal state
//
// MODIFIED:
//
//           07/15/2015  Liming Su   Changed for compatibility with VCS Native
//                                   Low Power
//           07/14/94 06:14am
//           GN  Feb. 16th, 1996
//           changed DW03 to DW03
//           remove $generic and $end_generic
//           define paramter = 8
//------------------------------------------------------------------------------

module DW03_lfsr_load
  (data, load, cen, clk, reset, count);

  parameter integer width = 8 ;
  input [width-1 : 0] data;
  input load, cen, clk, reset;
  output [width-1 : 0] count;

  // synopsys translate_off

  reg right_xor, shift_right;
  reg [width-1 : 0] q, d, de, datax;

`ifdef UPF_POWER_AWARE
`protected
W=AE5J(.0-@BW)R=0&B[IJ+^M;fWJe7Za]Gf:EbHOFI5Qa^KFNED,)eGT>faB0Hb
W1U\Hg;XZ)a3T[dQ13d4+?g(#YL=6g#DKE4]4Ob+U+XKd02e&HS/[\d@.+FOVH8?
6\X3I6MRD>A8=1I^NL6MaJEOX]SMT-6=2N,HK0;0Ve6D]NOd/88[/g1C7b)Pf:L[
KO,C[C_;bH.R,;L4CS)bNc(P_HA@DZP\QgFaSDL5SZaX\J+FVK8P3C4;83d46<(G
?^P.NgCJUU@g7A->/EVK/^9;OKa+@B)WTYdL8TS82W6b?6A2?4g^#aX3gBL,=E,)
6@Y9T;2L3IeBQ9-2CEFLKJ,LG;ZOGOTf^XE:ARQI]Q3Q.MNUTJNb/QaG4eG]2:GH
AJ7R6.C[2L9+a(:Y[Ued0X0JC=GG][(D_-Qb??R+>35N8&<f\985K@6=VSQJ2TaD
+LNB=-Y,F36Y#SMf4LYBAJfK(&=\855?H#O9=V8&gI#N^P#E>?ZJL;fI/g>Lb,C2
EV&0561]OPP5>:KQ-B5?dE@A<aWF4]5L][ZJGF1CLQNX.A8^2[B((8KASPO5;_-]
RJ8,1<LANSK?]WfM@9gb5;B##=()<Q.O.?YLQ06J9b(?U\5)7f#W1A?^5).VgNCQ
6E9FeV^@@/&,WV1BTfLU<MeZg?)Ge5Y;IL=PQXQQS=e64(YdUD7=JbTL:GD3WFN/
M+&:EgLa;VWc2V@Zc:U5b^CUD^/dA;)+5Ccd7T#B]&UeQ;P>(<KOgE@SEH??f0Pe
5(:B(W_e\\R0dO[P+&LP+MS,+TY,GR_(6(/5:&J,MdMH7Z?8_AVE[?.ZS-M.R_ZY
=Tg?.I6KCC)R&^FQb17Lc70#IU3abMM>^/:#9EK(B6F&:;c=Q[XFcK=/:9-+ZeIX
I]UM,KL-B3BeSa&LSOG]<@(;,B1T9f]-H7UXMPe39>B-3GH\\gSbW,#F@X0[+OHS
1eb:2O[\/UbL@8A[KNeOaIW)UF?,QU]ZHUDB\A630LHgaE,X@TD<,2?TSA/DP^)H
b#O];BTf01a>-V9Ffg2fQ<#3DY0d4L+G)7RLB9P\,P]\M+\NA.>Lb42+b^+H8]V:
;&)@_09>3(EIFdQP/AUIC(S>P.W^PEGR7>cLEG#1@WJ#1F+[Q2TWW._c,O;WfE.3
GQP6Db)J(<PH6EVT8J([e=7fbU-#8SLZA6R(b/F16AN?Ud/>]@a0&Y[+(J#1D]+6
Y83eL@\Db(SFO<UNERQg1\2:2251@-U9KV)YgJJN;9=T8b((>QRO9=#0&Nf,>7Y4
L:/46V+ULP6YD-gH-_>93MPYOgHY:(<GEC,2/>OHM+dQ-Y[+4Nf_D?CXR6Z:ZOGV
5g4QKN6L6(_)B3-@=0\/3#YFOZ-L##+f/,B@\;TA#::2TYIOR1E]>T99R8#J3f9(
3IQ:5FU]O72Hf=2-[U>0-^.cLf)Z+A&=0c8\F@,NaO(d0\O#>O-17S.HBO/)9_5)
=A3A+BgTEQ>S\aV)b)TWL&]3F:a9:J\N\Y5LT\e-(=EQ[MN)0.#CJdaPNX0K(?N/
50FYO_LCL5SW<Ub+C,A7YI)U4/^8=_&^WF\4K;S([BRGT3XYYGVD3399NFf>X1^X
c\-[bZ>#@LB(C5LO[E&f)d>-\XN=P2dM]_=7@cRT;g6bPSI>R(K0=3P4eB#7LY)f
b(Qd]DE#[UA7a_J@X[3-70BJL:VYGdG2d)&fcd[S_(FcYCAP2KdOVV_aL>]-_XB,
BE18W@AR@=g_M5]bRd&V3/3N=bggG3WVU?6O26R8>1Q)fQV<Bc3/)KPOVY2A?M,CT$
`endprotected

`else
  reg [width-1 : 0] p;
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

  assign count = q;

`ifndef UPF_POWER_AWARE
  initial
    begin
    case (width)
      1: p = 1'b1;
      2,3,4,6,7,15,22: p = 'b011;
      5,11,21,29,35: p = 'b0101;
      10,17,20,25,28,31,41: p = 'b01001;
      9,39: p = 'b010001;
      23,47: p = 'b0100001;
      18: p = 'b010000001;
      49: p = 'b01000000001;
      36: p = 'b0100000000001;
      33: p = 'b010000000000001;
      8,38,43: p = 'b01100011;
      12: p = 'b010011001;
      13,45: p = 'b011011;
      14: p = 'b01100000000011;
      16: p = 'b0101101;
      19: p = 'b01100011;
      24: p = 'b011011;
      26,27: p = 'b0110000011;
      30: p = 'b011000000000000011;
      32,48: p = 'b011000000000000000000000000011;
      34: p = 'b01100000000000011;
      37: p = 'b01010000000101;
      40: p = 'b01010000000000000000101;
      42: p = 'b0110000000000000000000011;
      44,50: p = 'b01100000000000000000000000011;
      46: p = 'b01100000000000000000011;
      default p = 'bx;
    endcase
    end
`endif

  always
    begin: proc_shr
      right_xor = (width == 1) ? ~ q[0] : ^ (q & p);
      shift_right = ~ right_xor;
      @q;
    end // proc_shr

  always
    @(load or cen or shift_right or q or data)
    begin
      datax = data ^ shr(q,shift_right);
      de = load ? shr(q,shift_right) : datax;
      d = cen ? de : q;
    end

  always @(posedge clk or negedge reset)
    begin
      if (reset === 1'b0)
        begin
          q <= 0;
        end
      else
        begin
          q <= d;
        end
    end

  // synopsys translate_on

endmodule // DW03_lfsr_load
