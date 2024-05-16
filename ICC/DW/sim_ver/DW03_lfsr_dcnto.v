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
// AUTHOR:    Igor Kurilov       07/07/94 03:06am
//
// VERSION:   Simulation Architecture
//
// DesignWare_version: 848ae855
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////
//-----------------------------------------------------------------------------------
//
// ABSTRACT:  LFSR Counter with Dynamic Count-to Flag
//           Programmable wordlength (width in integer range 1 to 50)
//           positive edge-triggering clock: clk
//           asynchronous reset(active low): reset
//           count state : count
//           when reset = '0' , count <= "000...000"
//           counter state 0 to 2**width-2, "111...111" illegal state
//
// MODIFIED:
//
//           RJK Jun. 16th, 2015
//           changed for compatibility with VCS Native Low Power
//
//           GN  Feb. 16th, 1996
//           changed dw03 to DW03
//           remove $generic and $end_generic
//           defined parameter width = 8
//------------------------------------------------------------------------------

module DW03_lfsr_dcnto
 (data, count_to, load, cen, clk, reset, count, tercnt);

  parameter integer width = 8 ;
  input [width-1 : 0] data;
  input [width-1 : 0] count_to;
  input load, cen, clk, reset;
  output [width-1 : 0] count;
  output tercnt;

  // synopsys translate_off

  reg right_xor, shift_right, tc;
  reg [width-1 : 0] q, de, d;

`ifdef UPF_POWER_AWARE
`protected
3CELTfB62EW9)La.FKJcbZL6B3fb;]J#M=eS&PZ<C?L(R+DW?3J94)+Fa(MgBd@K
+O(0I,R<9XbA;Y::^Pa<411DG]+M6Bg\cef/,OWV?RB5b3aT&UZ?CP=AVDd4K).E
aRO6:\F)X0/4@f(H&>@f]Z,.-&d<<<+Ef;L2B1KKaH.AX.W;3I0[1R]346QT,I(,
<.#(B83a&_H\JL=R936539WE:8BU?ZSQeL-&4E1#:Lc.4/a_N,_&/WO/cF37T>,S
Re@9HW/d--N36V/[WK4Q+?3DAG8(;OL:b;)T-[H#JK;?Ee-D=5X(@1[TUdFLEd7Y
e8+>)Kb[,d-_gD-&6A=0R4MRHcF+3JAd\#CCc6M?7[;(Xe39@06K)=ZX5(H@>STO
]//RR6?c<>9A/P)B?KPecQ<&gKc[)8:N49=g9(M;3e@1fJ<71Tf=A.#2S0?BD^6-
ZPT_bS..-dQeO,B1[D:)KA4g?9-AKA<4Ig^-;?5E5BLD#LN83FI)2NT+;G-CZ:,@
\^6<5W<-5HFV3AXEC]L;-M_4_FH:e+@P/;S[OI@TFSUNeC@gTc5RIa9\9DRU@\c>
:D+eESI?c9.HSMW;LMUYDZ,F[/VC>OH)U@X_fJC)4+#:EN:5[9E)^9Xg@eDF=NY/
2SNW0I:6=MO=NV\HZSOgIgCb6b:^&)5+LU;R><T?JP,M^DOUQ&:DY3WQ,g:[5/,I
/3C9B<C6A:E@N>#5.O;#4aT3[>6\GQ3IR??WZSKUA39M_edWV[Q;G#O?RH5M8FEg
@EX-XUG_>f@R)HY?=9W4]&6601#PeV9=UJQ7EPI.d[IQ=HOfg(OK24F__>P#>&^=
=]:W?6RW4^>GG1C-^7QLY;<MAXI&F)Db=5g^Sdf2X:4I):+adM0F#WX7;\R4NQ,e
@Ib-Dc8L/fFeAW]C(&4>A1fda;B4+_HdQBTSM3:LE,(M<\4W^TTIC9GTT/MTK1;?
&LdfLDPOA[&UB8Zb:UH3X32c7I5RLf#JK2AZ_I>F+TRb&<N1?,3PX5]G-BA:HHHL
0AX9Cd]OJf0KeCQZ^H;3fC;6H-^5<_aQ.R@/O20B5fPIbFO,H5?0I>YO2OGW^a?W
T_E2G^..BX8\\L0BE7)6P04>T@_X=3YG3WNEe:,)GgCKWN)6+M1&ZZ24U/VcMcRd
8V9Mc_N;.QfYSReQefMgF;g&&3M&A?R&#@K0B-12LfIKf2g3O3]Y9WYNBB)PQ#T]
DFJ;;(0(^OMeS+fR<b<:HHCSTZ<KYU3dgdJ5@21TSL/+R;[gY&2<SYL]Z7Q#Q,OK
DYZE1490dYM(Y[V,NX(]D?fKCP=()e;E0b1Q;8P.VN4Qa6H\_E2(([L\WW0WTVZC
56#V9P\gR=1F3b9QfO4;Y@84(?E_-SEda6>bL6fTFdB@M;7eGS.1DF_e->QL4Z.7
R:N.KgX(QbK+CNNM(27;@J8?J:O+)-]NNBKZde.=]gd>]e-N7SDI=<M<dFg99WdZ
0EV91g&W__1&;=16D;=18]e6Ud\5X]R9<WKTE(YNa/0ce_gGg48,H&/BD.+UfS#J
bJY.eRK;0WObZWDZ0.>5?KRZ(:A,K1=FIWJ8YVa4F^FAf@e8bL0;&-35D28_)-Z>
CI\S@,)e04,I=,d[[V86C1(09[^517<_WJU,107dS^TZDc^^#@PZ6/-E^0&;_C-Q
8a_R[K6M[#58S=eY)91;HKD@P_Z.I_>K1)aPe?MZ9.ETfC7^-;[1>fZg<&d#Q8/X
b_J1_?DaC&0KfE;d@QW9geBf.SSQE+,IMGad2)GP,16@43Z)Ff0AGZUFQPK4NG<^
,Yb(3Y#^/XYQ:Rf>2J/MPRcXNL9)4:=W3(gIR@If@g=@D$
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

  always @(count_to or q) tc = count_to == q;

  //---------------------------------------------------------------------------
  // Parameter legality check
  //---------------------------------------------------------------------------
  
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    
    
    if ( (width < 1) || (width > 50) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter width (legal range: 1 to 50)",
	width );
    end
  
    if ( param_err_flg == 1) begin
      $display(
        "%m :\n  Simulation aborted due to invalid parameter value(s)");
      $finish;
    end

  end // parameter_check 


  // synopsys translate_on

endmodule // DW03_lfsr_dcnto
