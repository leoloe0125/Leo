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
// AUTHOR:    Igor Kurilov       07/09/94 01:44am
//
// VERSION:   Simulation Architecture
//
// DesignWare_version: 83242b32
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////
//-----------------------------------------------------------------------------------
//
// ABSTRACT:  LFSR Counter with Static Count-to Flag
//           Programmable wordlength (width in integer range 1 to 50)
//           positive edge-triggering clock: clk
//           asynchronous reset(active low): reset
//           count state : count
//           when reset = '0' , count <= "000...000"
//           counter state 0 to 2**width-2, "111...111" illegal state
//
// MODIFIED:
//
//           07/16/2015  Liming Su   Changed for compatibility with VCS Native
//                                   Low Power
//           07/14/94 06:20am
//
//------------------------------------------------------------------------------

module DW03_lfsr_scnto
 (data, load, cen, clk, reset, count, tercnt);
parameter   integer width = 8;
parameter   integer count_to = 5;

  input [width-1 : 0] data;
  input load, cen, clk, reset;
  output [width-1 : 0] count;
  output tercnt;

  // synopsys translate_off

  reg right_xor, shift_right, tc;
  reg [width-1 : 0] q, de, d;

`ifdef UPF_POWER_AWARE
`protected
W=AE5J(.0-@BW)R=0&B[IJ+^M;fWJe7Za]Gf:EbHOFI5Qa^KFNED,)eGT>faB0Hb
3S/\6(1bbDMC+;FXQUG#N\HdZEW?B7NcC,R&?4OBFTHNRCC^Xa]#JM.X.DbBA32L
fBgE)XJWVBAgRb][edTNLMNR_SaTc&OG_GTQ(:g72fJJ@0JES::LB6a0PZ@08F>W
X[B-PTAH;>26aDf4^7JJ1Z:K8gNU/WS/VfG0CX#=2.^C[QI+EB_LdQV#<?3E\91,
(f2/VbSELcQ:__M:+cV-_1W&B<<98@,M+9LJ407(bZFU3&E1:P0fd::/#4eD=I<0
T/>ZR=a/=JH6N,5#U0=N?Ve^.fa2)/0#Y]X.gMVgJ4V^b)3,+):1T8-d90Kf6FWH
Mg;JV3IN]<H]QZ54Y@Rb,#CVW_C<FD5.(E1Tb2F5VU]L/(I5T6IYHP&\1X#39@1b
,CX[DHca\Ge+GfEf_XbT,AOAdSDY=\OR9S:0J]H+=#SBTCIR583P(bVQ5#Y(\XXT
XCaNV\N_>@d:T?d=;LR&BMKcS3b>53CET(-[Z&R\IY9XXW?9=I-^\Acbc;gf88A+
V3A,+:EF,9XN(3f7JFD?9TK8#N7<(;g,+\3O;(9I,>A^[#@@Bc#M;KIP^/=bO;]6
3ebQ=]]#GM2=Gc#N)dQ>Maf1-e&+cgbLg-3G@0-]I:S?dPYdK,O]<K4JA-1L-NeP
>F:K9GAO?D\&P]bX)N#EaaN>VCBA.<SSZCFJ\GPKE\c]ZA:-@W#P?e548Qb0aEN\
NSGQ<:U@Y6Z04Q(d_7,<Wfd=gc[5WMb>GAH)S&)5-E^7P?],^FMS1:5C[F:R]13I
WD4EF.50#,H+e\[/#025V^CP4,d6&4T&T>76#?,a\CR6+6b^Pgf.0KX&0V1^eP(:
be,LIAF::c+\[Z-\BTOCH1KHP@2]@;@V9agT8Pf4G+8WF9JZQJO\_PXYJ]=S-8YY
4E\[b.7;9RCW<c7;[aFL)7+73834:VQ(Z)Zb?&&VNH^3fUX:]6I,Z#\BW74B)c0.
DM7&E]UGO9:O\L#f@LDCG_.Lg0P[T3L1J9g7fd=7W2HGMM[ag-A\(6XLY9AI=.?F
B5#7L/GG:T<@0&2LHc6Eg6G=cICDF(N3OEF>]TegRRDIb&O^F5f(/P55T.E-+cdC
@T#:DPB_7IH4#;^,-_:)P)ad)<QJ.QIU3d=,2H1]9BYS@NgO;D^2QTLW>]d7O4PO
]ZUPK@BW^C+IAeFHA;B;13bdLIb>,OZ3f^WBBI8+^2fGC1V1VUaAH&dAK6Sdd+W@
3/e+S&PXTU7^ME)ObX).H;L\BTQF7>N6<G&AM#,ECbO1<FWX4GgJbRe@7#/UGfT>
FXQYJ+DdB?9O.g1fL#Jb1I>##LUM0/-\gd4<T]VW7X]g2FY#5fTaSbN/EA.F0]HB
2+QX9]QcL8_SK[<DdWbD@:-4[,X(\ME?Pe1FJD_/8^0E:C3[8g;(U7?=57F71AZg
bY5GF4&3U2d7^7J=03;Kg?Nfb:P)9]UN::c;H,QS_,]<>Y84f\8U?FJ6cfB[##TH
4F3g+SQ9/a55PFQES>QQ>eLQZT8g[FO\?/PVe09,KEXg3/LP]HU=R1(2B0R:P[,=
:/3\f+@B:d^=:LP)5#:1+.+-R/M&/A4K6W^CN=RA#QbL(;Z@;bA5<>^KAd[EU8]7
\a+K_QLER@R;P08HP\b<-aYS9S-;&O;5(>(<3XW#IR]A,ZT-OUP,0NWFfQHG7HKB
#NK+?&;3DQe,cW0>C8W=L3OOJ.Y;g=7#45G,OM7VBSUA8\&IC[J)PI[MEKE+0U_&T$
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
  assign tercnt = tc;

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
      de = load ? shr(q,shift_right) : data;
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

  always @(q) tc = count_to == q;

  // synopsys translate_on

endmodule // dw03_lfsr_scnto
