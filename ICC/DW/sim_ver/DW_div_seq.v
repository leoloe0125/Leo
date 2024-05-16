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
// AUTHOR:    Aamir Farooqui                February 20, 2002
//
// VERSION:   Verilog Simulation Model for DW_div_seq
//
// DesignWare_version: 39791efe
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////

//------------------------------------------------------------------------------
//ABSTRACT:  Sequential Divider 
//  Uses modeling functions from DW_Foundation.
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
//             during the first cycle of calculation (related to STAR 9000506285)
// 1/4/12 RJK Change behavior when inputs change during calculation with
//          input_mode = 0 to corrupt output (STAR 9000506285)
// 3/19/08 KYUNG fixed the reset error of the sim model (STAR 9000233070)
// 5/02/08 KYUNG fixed the divide_by_0 error (STAR 9000241241)
// 1/08/09 KYUNG fixed the divide_by_0 error (STAR 9000286268)
// 8/01/17 AFT fixes to sequential behavior to make the simulation model
//             match the synthesis model. 
// 01/17/18 AFT Star 9001296230 
//              Fixed error in NLP VCS, related to upadtes to next_complete
//              inside always blocks that define registers. NLP forces the
//              code to be synthesizable, forcing the code of this simulation
//              model to be changed.
//------------------------------------------------------------------------------

module DW_div_seq ( clk, rst_n, hold, start, a,  b, complete, divide_by_0, quotient, remainder);


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
  output [a_width-1 : 0] quotient;
  output [b_width-1 : 0] remainder;
  output divide_by_0;

//-----------------------------------------------------------------------------
// synopsys translate_off

localparam signed [31:0] CYC_CONT = (input_mode==1 & output_mode==1 & early_start==0)? 3 :
                                    (input_mode==early_start & output_mode==0)? 1 : 2;

//------------------------------------------------------------------------------
  // include modeling functions
`include "DW_div_function.inc"
 

//-------------------Integers-----------------------
  integer count;
  integer next_count;
 

//-----------------------------------------------------------------------------
// wire and registers 

  wire [a_width-1:0] a;
  wire [b_width-1:0] b;
  wire [b_width-1:0] in2_c;
  wire [a_width-1:0] quotient;
  wire [a_width-1:0] temp_quotient;
  wire [b_width-1:0] remainder;
  wire [b_width-1:0] temp_remainder;
  wire clk, rst_n;
  wire hold, start;
  wire divide_by_0;
  wire complete;
  wire temp_div_0;
  wire start_n;
  wire start_rst;
  wire int_complete;
  wire hold_n;

  reg [a_width-1:0] next_in1;
  reg [b_width-1:0] next_in2;
  reg [a_width-1:0] in1;
  reg [b_width-1:0] in2;
  reg [b_width-1:0] ext_remainder;
  reg [b_width-1:0] next_remainder;
  reg [a_width-1:0] ext_quotient;
  reg [a_width-1:0] next_quotient;
  reg run_set;
  reg ext_div_0;
  reg next_div_0;
  reg start_r;
  reg ext_complete;
  reg next_complete;
  reg temp_div_0_ff;

  wire [b_width-1:0] b_mux;
  reg [b_width-1:0] b_reg;
  reg pr_state;
  reg rst_n_clk;
  reg nxt_complete;
  wire reset_st;
  wire nx_state;

//-----------------------------------------------------------------------------
  
  
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    
    
    if (a_width < 3) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter a_width (lower bound: 3)",
	a_width );
    end
    
    if ( (b_width < 3) || (b_width > a_width) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter b_width (legal range: 3 to a_width)",
	b_width );
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
  assign complete     = ext_complete & (~start_r);
  assign in2_c        =  input_mode == 0 ? in2 : ( int_complete == 1 ? in2 : {b_width{1'b1}});
  assign temp_quotient  = (tc_mode)? DWF_div_tc(in1, in2_c) : DWF_div_uns(in1, in2_c);
  assign temp_remainder = (tc_mode)? DWF_rem_tc(in1, in2_c) : DWF_rem_uns(in1, in2_c);
  assign int_complete = (! start && run_set) || start_rst;
  assign start_rst    = ! start && start_r;
  assign reset_st = nx_state;

  assign temp_div_0 = (b_mux == 0) ? 1'b1 : 1'b0;

  assign b_mux = ((input_mode == 1) && (start == 1'b0)) ? b_reg : b;

  always @(posedge clk) begin : a1000_PROC
    if (start == 1) begin
      b_reg <= b;
    end 
  end

// Begin combinational next state assignments
  always @ (start or hold or count or a or b or in1 or in2 or
            temp_div_0 or temp_quotient or temp_remainder or
            ext_div_0 or ext_quotient or ext_remainder or ext_complete) begin
    if (start === 1'b1) begin                       // Start operation
      next_in1       = a;
      next_in2       = b;
      next_count     = 0;
      nxt_complete   = 1'b0;
      next_div_0     = temp_div_0;
      next_quotient  = {a_width{1'bX}};
      next_remainder = {b_width{1'bX}};
    end else if (start === 1'b0) begin              // Normal operation
      if (hold === 1'b0) begin
        if (count >= (num_cyc+CYC_CONT-4)) begin
          next_in1       = in1;
          next_in2       = in2;
          next_count     = count; 
          nxt_complete   = 1'b1;
          if (run_set == 1) begin
            next_div_0     = temp_div_0;
            next_quotient  = temp_quotient;
            next_remainder = temp_remainder;
          end else begin
            next_div_0     = 0;
            next_quotient  = 0;
            next_remainder = 0;
          end
        end else if (count === -1) begin
          next_in1       = {a_width{1'bX}};
          next_in2       = {b_width{1'bX}};
          next_count     = -1; 
          nxt_complete   = 1'bX;
          next_div_0     = 1'bX;
          next_quotient  = {a_width{1'bX}};
          next_remainder = {b_width{1'bX}};
        end else begin
          next_in1       = in1;
          next_in2       = in2;
          next_count     = count+1; 
          nxt_complete   = 1'b0;
          next_div_0     = temp_div_0;
          next_quotient  = {a_width{1'bX}};
          next_remainder = {b_width{1'bX}};
        end
      end else if (hold === 1'b1) begin             // Hold operation
        next_in1       = in1;
        next_in2       = in2;
        next_count     = count; 
        nxt_complete   = ext_complete;
        next_div_0     = ext_div_0;
        next_quotient  = ext_quotient;
        next_remainder = ext_remainder;
      end else begin                                // hold = X
        next_in1       = {a_width{1'bX}};
        next_in2       = {b_width{1'bX}};
        next_count     = -1;
        nxt_complete   = 1'bX;
        next_div_0     = 1'bX;
        next_quotient  = {a_width{1'bX}};
        next_remainder = {b_width{1'bX}};
      end
    end else begin                                  // start = X 
      next_in1       = {a_width{1'bX}};
      next_in2       = {b_width{1'bX}};
      next_count     = -1;
      nxt_complete   = 1'bX;
      next_div_0     = 1'bX;
      next_quotient  = {a_width{1'bX}};
      next_remainder = {b_width{1'bX}};
    end
  end
// end combinational next state assignments
  
generate
  if (rst_mode == 0) begin : GEN_RM_EQ_0

    assign nx_state = ~rst_n | (~start_r & pr_state);

  // Begin sequential assignments   
    always @ ( posedge clk or negedge rst_n ) begin : ar_register_PROC
      if (rst_n === 1'b0) begin
        count           <= 0;
        if(input_mode == 1) begin
          in1           <= 0;
          in2           <= 0;
        end else if (input_mode == 0) begin
          in1           <= a;
          in2           <= b;
        end 
        ext_complete    <= 0;
        ext_div_0       <= 0;
        start_r         <= 0;
        run_set         <= 0;
        pr_state        <= 1;
        ext_quotient    <= 0;
        ext_remainder   <= 0;
        temp_div_0_ff   <= 0;
        rst_n_clk       <= 1'b0;
      end else if (rst_n === 1'b1) begin
        count           <= next_count;
        in1             <= next_in1;
        in2             <= next_in2;
        ext_complete    <= nxt_complete & start_n;
        ext_div_0       <= next_div_0;
        ext_quotient    <= next_quotient;
        ext_remainder   <= next_remainder;
        start_r         <= start;
        pr_state        <= nx_state;
        run_set         <= 1;
        if (start == 1'b1)
          temp_div_0_ff   <= temp_div_0;
        rst_n_clk       <= rst_n;
      end else begin                                // If nothing is activated then put 'X'
        count           <= -1;
        in1             <= {a_width{1'bX}};
        in2             <= {b_width{1'bX}};
        ext_complete    <= 1'bX;
        ext_div_0       <= 1'bX;
        ext_quotient    <= {a_width{1'bX}};
        ext_remainder   <= {b_width{1'bX}};
        temp_div_0_ff   <= 1'bX;
        rst_n_clk       <= 1'bX;
      end 
    end                                             // ar_register_PROC

  end else begin : GEN_RM_NE_0

    assign nx_state = ~rst_n_clk | (~start_r & pr_state);

  // Begin sequential assignments   
    always @ ( posedge clk ) begin : sr_register_PROC
      if (rst_n === 1'b0) begin
        count           <= 0;
        if(input_mode == 1) begin
          in1           <= 0;
          in2           <= 0;
        end else if (input_mode == 0) begin
          in1           <= a;
          in2           <= b;
        end 
        ext_complete    <= 0;
        ext_div_0       <= 0;
        start_r         <= 0;
        run_set         <= 0;
        pr_state        <= 1;
        ext_quotient    <= 0;
        ext_remainder   <= 0;
        temp_div_0_ff   <= 0;
        rst_n_clk       <= 1'b0;
      end else if (rst_n === 1'b1) begin
        count           <= next_count;
        in1             <= next_in1;
        in2             <= next_in2;
        ext_complete    <= nxt_complete & start_n;
        ext_div_0       <= next_div_0;
        ext_quotient    <= next_quotient;
        ext_remainder   <= next_remainder;
        start_r         <= start;
        pr_state        <= nx_state;
        run_set         <= 1;
        if (start == 1'b1)
          temp_div_0_ff   <= temp_div_0;
        rst_n_clk       <= rst_n;
      end else begin                                // If nothing is activated then put 'X'
        count           <= -1;
        in1             <= {a_width{1'bX}};
        in2             <= {b_width{1'bX}};
        ext_complete    <= 1'bX;
        ext_div_0       <= 1'bX;
        ext_quotient    <= {a_width{1'bX}};
        ext_remainder   <= {b_width{1'bX}};
        temp_div_0_ff   <= 1'bX;
        rst_n_clk       <= 1'bX;
      end 
   end // sr_register_PROC

  end
endgenerate

  always @ (posedge clk) begin: nxt_complete_sync_PROC
    next_complete <= nxt_complete;
  end // complete_reg_PROC

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
C.LY(eEIU+)/<d2bKV.afIY#THIWHW&.RbLN1dTfQ^<Z<:\dc#38[_WV:3UB>C-/
b5eZ>(<RM<)=VZH.=dcV(TJ21R(>3b4M?R;#QV+<&#C(M6PY-Y3/X>P1;]JTNC[#
UaU-DB)?1-DQ?@+S9ZB=,S15,;C3A>2d^+B:DX(#)_@;:LVgMO5+TU0J,ESVAHXa
Z/eODS#,bS0T7Sf2:3M@a&+E@XJUA?@[Hc5)S](V&K<?_Hg>.C:,Z9_KZ37ERC#^
WMNdL+8761-=M>VA81Q-W^bQ.d9)B^<b\[?<S7-<)5Cgb?._\GE,^(b@L9/SHPQ?
:d-BdJ#2CR\N1-IRgC#0-8W_RTa4HCVcLLZHC&09IV[P@PGGB/QVZTFUZR:<QfY+
g?f^6bdT2]G4U&U^cL?F.2_?2,@DECHIC_+Wb\0TQe0V#K]d>@1a@:Wd\/9((.M(
&U4;CR,\FF.GH>WKQ&-T3,#6fQ2^A@7Z&W7@bJXNTNQbN;KLA6.CMEK7AKFdKWdN
d)ac28&4.N-FH&.N2Lb?J0J=c>/5,X=7W0L.F(#])A_JbGFJO<\aEgATdLS/P9e#
ffV(8;D[5?(bX_:=f,cAK^ZEd).INaZ,gL([B,,:=9[\f)+<CC3#_JOO95WW:A3I
H2:Ud95[af0MT/JC(8I.X1WQBA.4ZTa=CeeK@S#/[P^@cSYR+5)8L10_(3R1AQ9K
\.CeJ)e^.6abXT4H@GZ19#0/HK[W7>QCU5T&0,7\&@ON3F\=)bE3_<Z]&_QeI].X
=:<Ob+/cJ6:1aK;9;1JRT:Gbd,E5I6^Ie6ELdVKJ?ZYNCB];bRA#C5g+?^>XB.?A
)aI^O/F;TcPS8AdHBHHTXeX/[R?RG&0Ce9La31b<,QVOA4FX-<9a\=[6@SG5]eRZ
Ge3:[6W;^C[WdL)0X>NBeB(/>(C+62f,cN014;3LgDC@eeg(K3O&SD6..Z:VB,()
d?a=(5^8f;eUSA150?eH8X8UJ-^XBDE2DW@L^I:L&XYI(1M#gfVJ+<,2H76U?&OH
0^>#^fR.cVcV^8>eg9:=51Fc4fWJ5G[X7;:QJ:4QR[9U739ZX?W,FN?ECab+O-C/
0&&0-RI9ebNART3_=[(aG+2;3HX6aeF^SS+T)Vb69e0]@G+?8SDLAdK_#f??e?:)
73._=NY8I)0c?3eGO0c5B/Q;NWfJLJ.)cU,5>,S,;ZM\;gIMPQL2HANAe,:+C_g2
&GX8_,V>_M]I[66f:Y0K9U/F0(66+eATN[?JDG>d?:eR84(LgEFDDYUR0E0-]g6g
28AeCLD>Y>3U=/W.d0\J5O7TAE692&aVY.)K6XUC^@+>XTH3dF2>[(P)83.>O:65
5B<6-ec3/R@Ge0>WNEd=Rgb\6GRdW5F3J7-8?-Q7R0I23(a@FV[.+f<[Ga&WS1I[
P<(4bY=bY_DK#(NfU&KVfEbM]g,?&J,),5JC>=a/,:dU(3HfG];I3D?SEGf-c9D_
dfBK6W/EN&(II.Q+AMfa2-V\GEbUZT/H#_;aJ,.H-aa\6/Y1PR)3g\8e^M6#U.D&
Y0YD45ZfB>[+d96#]@XI:&_UI\[6c6SP]OG6bB3Cd7?fd@QgR_.SIXc8&SIeT9J+
AH,J/g1;RDTdKe8(OfO6^g:TSZJG+fRD>+09GMV[/b]VbY,A0MN,Wa4f>71ZV_UP
9L=U^I2:HQ2)/LUb^[dXMH>1/TGZIDaBW22I=G_Kbb,Ng4f.BA<.:VW,8e.(&X,(
+^SW&O\IQ_eASYZ:E2<.=C5[2E,XU;38-7@f3F,PC3f+.ZZ[N)NGHg:Z(Da[G_M,
:^(X>/Gf,[TObb;(;QT0QWaY-(=:S3F8<+/U0I\K@^=6S27\IVgX-^YHAX4G+D6C
9U3AZgI,.A,U:Q<]RfS:OLGF.X56K<_&4./]ZCXX//acEST<PH3:]I,I0ET2BKBV
gg+fXVZ\8:.@7UUa^<9.^6JM/gGX+D^3;]M40CD:[b;2Gd_9.)(UCSB;^@>L8.d.
@QL:Gf(f=fJ37e>)V9Y/+:GWS,MMb:_>?3Rd2,3QWgaP#&5GDb6<3De_HD1SF@S\
KMMdDReCFg\GZYg00e&C]QS=LM_WDRM:)&6Q^@aH@(gI]2_E_CX8ga)L]J,BTNf&
<GT#]A\])H7V0>&;e5JWd1f??\;,Z3T7c8;e\EA+NC,d]3)OccV3Y8B&PIVF:Q3L
[S^JbV6:#+UQ@H=/cc3_KY#^d)OfPbaQLT?CD-)QMd3QV,O9eG&O/8_[70(X=?,L
J/d:Y<TKS9RIN)LHEHD,HJWDgX?Q#^NS/99U^VdHd,>a=31EG2V3c-=QTQV44dOY
GbG^,TSPX[OeK;Z9a\JME]O0W+W_#b<-c0Y#JT&SX+5QM)H?/QL->5#T:H#(+ZI7
IZ-Qa9I2S37C&,5_N59)MgSRM:X1U;dW&1J@QGEIQ74\bb?8U^[.?KLNe6;&d1cc
Rc1BY]MD?9Y,?@=:10S]A,CH_RJ_eGP6,?D8a+6@EDMPb0KOc9@V<IS1_?<fT)DR
3fa@QX3+d4/@)CVBF#I(Z-2^;&D9B2?JGZL]Id8@YP,F>UPPb\)@H;5(Z?#8GH1,
HD_9FYK5dEY@.$
`endprotected

`else
    always @ (posedge clk) begin : corrupt_alert_PROC
      integer updated_count;

      updated_count = change_count;

      if (next_alert1 == 1'b1) begin
`ifndef DW_SUPPRESS_WARN
          $display ("WARNING: %m:\n at time = %0t: Operand input change on DW_div_seq during calculation (configured without an input register) will cause corrupted results if operation is allowed to complete.", $time);
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
	$display("##    This instance of DW_div_seq has encountered %0d change(s)", updated_count);
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
_2]VeG4#DL[61OKGgb&+AFeNgCX=-K(dL?HKL[TX+R\f_^S?W6TUPB?8>/HFRQG^
199FG@)S+e^@2@[QZ3a9QMUOW(WHQJJ:908d<9K7>)D1[fJZ(;-E17PG84WIDS2;
INDIS.Mb5H@E,_(D2/7_3J8<#1?4dK(:BR[VM=TZ,[T>;+d:,eWdW14;G(W6CP7U
bZcI.IE/WOEYB/fB\M:HX]X4VA/YUY.=US?)EbFGc^9(^#FD:UDO,5;1(Q(7=f91
5:&=ZYN9GR/@@M(+d_P;;\NWQZ&G.=N//WXQ7HIKYPH=#[+YJcS.YfbK@];?4BQD
FR_I.;^DJ?<R^_<4HKC\0IEPA=K0.7SeUF;d\)I8S+7XbBHEIV(T-^\.=9X]I&[S
1WSLVe#HY>(E=QGMMO#:]_53455VM126Fc1_8A<@L7YN?X^(4G\(W>gBPI9V??Z0
[(fWQ&_+ZVTa72E&-;EeF^=13G35^4aD]&+9<T0/HOQBfQBC?6gR1D-^[KJ=0OA+
F8O8P=\XQ9OBQ?c9+bI:);03.XMTWX[ALDde.21S^Kdf\JT)fa=)1JHDD.?K^:e_
:P_293bZ/D4)XH+_3V3N9;IOJZa]?Md4=$
`endprotected

`else
  `ifndef DW_SUPPRESS_WARN
    always @ (posedge clk) begin : corrupt_alert2_PROC
      if (next_alert2 == 1'b1) begin
        $display( "## Warning from %m: DW_div_seq operand input change near %0d causes output to no longer retain result of previous operation.", $time);
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
    

  assign quotient     = (reset_st == 1) ? {a_width{1'b0}} :
                        ((((input_mode==0)&&(output_mode==0))||(early_start==1)) & start == 1'b1) ? {a_width{1'bX}} :
                        (corrupt_data !== 1'b0)? {a_width{1'bX}} : ext_quotient;
  assign remainder    = (reset_st == 1) ? {b_width{1'b0}} :
                        ((((input_mode==0)&&(output_mode==0))||(early_start==1)) & start == 1'b1) ? {b_width{1'bX}} :
                        (corrupt_data !== 1'b0)? {b_width{1'bX}} : ext_remainder;
  assign divide_by_0  = (reset_st == 1) ? 1'b0 :
                        (input_mode == 1 && output_mode == 0 && early_start == 0) ? ext_div_0 :
                        (output_mode == 1 && early_start == 0) ? temp_div_0_ff :
                        temp_div_0_ff;

 
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
