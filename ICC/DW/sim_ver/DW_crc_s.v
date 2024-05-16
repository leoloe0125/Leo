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
// AUTHOR:    Nitin Mhamunkar  Sept 1999
//
// VERSION:   Simulation Architecture
//
// DesignWare_version: b7619314
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////
//#include "DW_crc_s.lbls"
//----------------------------------------------------------------------------
// ABSTRACT: Generic CRC 
//
// MODIFIED:
//
//      02/03/2016  Liming SU   Eliminated function calling from sequential
//                              always block in order for NLP tool to correctly
//                              infer FFs
//
//      07/09/2015  Liming SU   Changed for compatibility with VCS Native Low
//                              Power
//
//	09/19/2002  Rick Kelly  Fixed behavior of enable (STAR 147315) as well
//                              as discrepencies in other control logic.  Also
//			        updated to current simulation code guidelines.
//
//----------------------------------------------------------------------------
module DW_crc_s
    (
     clk ,rst_n ,init_n ,enable ,drain ,ld_crc_n ,data_in ,crc_in ,
     draining ,drain_done ,crc_ok ,data_out ,crc_out 
     );

parameter integer data_width = 16;
parameter integer poly_size  = 16;
parameter integer crc_cfg    = 7;
parameter integer bit_order  = 3;
parameter integer poly_coef0 = 4129;
parameter integer poly_coef1 = 0;
parameter integer poly_coef2 = 0;
parameter integer poly_coef3 = 0;
   
input clk, rst_n, init_n, enable, drain, ld_crc_n;
input [data_width-1:0] data_in;
input [poly_size-1:0]  crc_in;
   
output draining, drain_done, crc_ok;
output [data_width-1:0] data_out;
output [poly_size-1:0]  crc_out;
   
//   synopsys translate_off


  wire 			   clk, rst_n, init_n, enable, drain, ld_crc_n;
  wire [data_width-1:0]    data_in;
  wire [poly_size-1:0]     crc_in;
   
  reg			   drain_done_int;
  reg 			   draining_status;
   
  wire [poly_size-1:0]     crc_result;
   
  integer 		   drain_pointer, data_pointer;
  integer 		   drain_pointer_next, data_pointer_next;
  reg 			   draining_status_next;
  reg 			   draining_next;
  reg 			   draining_int;
  reg 			   crc_ok_result;
  wire [data_width-1:0]    insert_data;
  reg [data_width-1:0]     data_out_next;
  reg [data_width-1:0]     data_out_int;
  reg [poly_size-1:0] 	   crc_out_int;
  reg [poly_size-1:0] 	   crc_out_info; 
  reg [poly_size-1:0] 	   crc_out_info_next;
  reg [poly_size-1:0] 	   crc_out_info_temp;
   
  reg [poly_size-1:0] 	   crc_out_next;
  reg [poly_size-1:0] 	   crc_out_temp;
  wire [poly_size-1:0]     insert_crc_info;
  wire [poly_size-1:0]     crc_swaped_info; 
  wire [poly_size-1:0]     crc_out_next_shifted;
  wire [poly_size-1:0]     crc_swaped_shifted;
  reg 			   drain_done_next;
  reg 			   crc_ok_int;
   
`ifdef UPF_POWER_AWARE
  `protected
#ME\(>V6/eFdg7S5V>ga>L]Dd)ZM.6/YQTY?#)1//?9NXcX:Z\Ue4)Y_@(0^\aTS
U)5.,4V;=)S)d5eWD>/Jg^E0Da.W0)W]RQfWOeaE7[.\Y[_^\<eR9F<Y6^B88,L8
>55S039e_FZ^ET46:@T5MFc(^2Pc>TKYYPHCU&f#/T(@aS>YB=,@g>/;EP=b#4T(
FSF6-X^IbEJg85W]>7?3fGH.MWM),@;;B&a9U^D](Of.5K16deGPK9LX1KS)7M<[
B/IbM;gQXe,e)GI4=;_WF6I-2VUeKRVgV=9:T&-b7A>@ANZVHaB=5:WW6TAWXePg
[W=8CE&OHG+Q:)W4;<Ke)AZ3>2I9QMC.[)=6YX<R+8.78,+CZBD]WdQcAQJ[]:)N
F[:(8HGCEIC4C&[^ZEUcIJFc60UY;BaFFL&1:g^4W0&aNOOY^)5QK&9\81WN>#g=
c4_]g^9=^f0;]LX2Ac#Vb\ZL[gU=caH/0=].:#AB@c[#+P,fUVfR,]H#;;G@TV<Q
0\+A^W)P.[WKH\62XHe6T;?\61^;#4Jbf2U)MXNe);Ag=MD0TSEN9&9D,;N7G]K-
E\:6H^R)5(-WNaB?3:[+.1MgUQFEb>[>EH:<3E^SH_WH5Tb8:R0E<9.I_VE1NP7_
bgY,bK;d6;RFONc7=@>FTgT;7VgA6\KUcL1)a<&8)ZB_gb+Q53a=T;e7Q++>=Ibb
MD0^L#c8\98R38]IE/WVD_Zd&IB-7CE_0J<f?+.HOU:3gAXIf_)4:gZM]EL(1?e9
4Z6BRAAU9,BM,D+SQ()?8^CI@ZgO5e7C[c3\T_NcTeU(4JYS-YKD1K.ZIb4.eY1\
7g@(+e6a#>9?[#@M2Y9@A8K4#D:EU<\9]OJ(d?27NgNWM&<S.1>.a=.]SJ5XQ4K9
29E#A7G\<LP\2Y^.?A=FX;HOeSg)b&Gb79N]UE>O7_7g_(2I-\TA]N&\EPLGT:1,
SKVIcY-FK>[K:8]-BGX.PP/:L+]9=JR3VA.9_4:-].;HE3&.NOU2c+TT^cNXRC,O
^#af0S_8XU#I9V3<:VY?+V>J,5Ad0\M?]D3\]I[FaEZeXPPD38@P\)[:cOCOSKO:
S7K/VG6Sd;,CE@3,0b096ZebC#;^bc.KVbW/]3RDQR5Rf>9/C4/+C)+AQ@6_XNUL
2;6YNNZd[WD3Pe4(EA=B)R)C,I#?;M9=.)6IJG)9bWCCXR-\;0<76WUe:d)CWgf/
8]4V:H3L+:OE4U^Eca3>27e,M=T7)a=e3.A=I-C:JZ.N2BFDRbVE37U,^@SUE1-D
ZRNXB_^&eMF\]Wg?aSC\eTI.a@DO06A^7@Cd2Q1Nad8)WT^6Q<K79ZH91CO&b@(.
TOP830c_:6b)=Dca\3bGN5G3V2JT\?fQH]e)F1Jc&K.M:^EZ#TKDQIg+?a/bB_H)
()d?V3VW>Y(M657^D6AX#@](TFZ:IId3\c7P?Re:YaB0<)351HdPH9?eC8[:#=LX
^ZY@#P(3CQFXR1bV06G42Fc<G3<@7Q6FG5G\0.1Q8L):7NQeI\cWGFR3K]N-PO,G
9QO51U0IbGY(:VN#Z0,AC.R61G_CaAO9HG#=e^IIY0TSL/B:YL6&D-)W5:Q-GJTR
2-^SRL9ACbFLO=QI>+_/E.eK[0-SMKH1H[TJ9#?MJ)2;]b,+W\57U>dLf],GW+:C
.?2++VFW5YL6K_N^PITeML7cW@=/,B7@^ZSd9b&6dYK5@;?TgaTIfIKZbFLGPD>e
Q#,D=]WVSL_E2+/Q&+Pe<K_/IZ[P30(T#0fGUK&Nf2NbV5;[?;<=VVe,S_Qb?NF#
.8@aS/[EX-77cLgY[&YGB,_2d\CQR:J/;L)O8\I7a^[FJT(3VUR7=Yg#F0WKcG74
bfccc;LBN:4NdMe8M>J>+5UA_?YeHNcfcJTAAVEa#GCB<gJIDP2YcbX+EcW0X<a0
_e,<5(FX\cLE]@6X[LdcZ[MYe=89^.:FEb:;622@(OAf?BWZ,CCRQEQ>9\YK:)^@
#76fe874EcfH)9Qb&DE)eG3;,?cCS<]Uc0<?@U#J?/6DaA<UcU#H0J#ef<Y?+S;Z
JU3Jb>f@94A^J@P2<:4;[A\;.f&?>6#Q?X0-e:MDNQC]Dd>]gP#M6UF1;7eG/7&[
O#.Y0LeU8]IOF1Z2Y9)D+592W:094#[4N=P]G_>bgOI#4W.Wc.#N:ZYa.@Sd2EA,
X)+UW<O?6.0K?fH8R>)O&c=9dK3(YC//7+MB+FBCGdbPW_7b(d&GINAR^=7f/CAW
?#L]D@Sg?7\-.RdEe^<WCC4I9BDWMK,^FG)aK?bSNRESR9<W_;7MJF_2b3M9N<_V
D=7_/1(CB8NRJ,c/\CK@48&a3EYIOK[WFM.EFRIPa,NK7gF>7?g[f4K:DfTG2;0:
\e5&:T;XZCEN,@NRd99YBVaZ;XOL3@,+QQH-NNd-P_(OgS_6fP^689dPWOS8I::L
A&+19eFeJ^bN-$
`endprotected

`else
  reg [poly_size-1:0]      reset_crc_reg;
  reg [poly_size-1:0]      crc_polynomial;
  reg [poly_size-1:0] 	   crc_xor_constant;
  reg [poly_size-1:0]      crc_ok_info;
`endif
 

  function [poly_size-1:0] fswap_bytes_bits;
    input [poly_size-1:0] swap_bytes_of_word;
    input [1:0] bit_order;
    begin : FUNC_SWAP_INPUT_DATA 
      reg[data_width-1:0] swaped_word;
      integer 	     no_of_bytes;
      integer 	     byte_boundry1;
      integer 	     byte_boundry2;
      integer 	     i, j;
     
      byte_boundry1 = 0;
      byte_boundry2 = 0;
     
      no_of_bytes = data_width/8;
	if(bit_order == 0)
	  swaped_word = swap_bytes_of_word; 
	else if(bit_order == 1) begin
	  for(i=0;i<=(data_width-1);i=i+1) begin
	    swaped_word[(data_width-1)-i] = swap_bytes_of_word[i];
	  end 
	end  
	else if(bit_order == 3) begin
	  for(i=1;i<=no_of_bytes;i=i+1) begin 
	    byte_boundry1 = (i * 8) - 1;
	    byte_boundry2 = (i - 1)* 8;
	    for (j=0;j<8;j=j+1) begin 
	      swaped_word [(byte_boundry2  + j)] = 
		      swap_bytes_of_word [(byte_boundry1  - j)];
	    end
	  end
	end
	else begin
	  for(i=1;i<=no_of_bytes;i=i+1) begin
	    byte_boundry1 = data_width - (i*8);
	    byte_boundry2 = ((i - 1)* 8);
	    for(j=0;j<8;j=j+1) begin 
	      swaped_word [(byte_boundry2 + j)] = 
      	      	      swap_bytes_of_word [(byte_boundry1  + j)];
	    end
	  end
	end
	 
	fswap_bytes_bits = swaped_word;
      end
  endfunction // FUNC_SWAP_INPUT_DATA





  function [poly_size-1:0] fswap_crc;
    input [poly_size-1:0] swap_crc_data;
    begin : FUNC_SWAP_CRC
      reg[data_width-1:0]   swap_data;
      reg [data_width-1:0] swaped_data;
      reg [poly_size-1:0]  swaped_crc;
      integer 	           no_of_words;
      integer 	           data_boundry1;
      integer 	           data_boundry2;
      integer 	           i, j;
     
      no_of_words = poly_size/data_width;
     
      data_boundry1 = (poly_size-1) + data_width;
      while (no_of_words > 0) begin 
	data_boundry1 = data_boundry1 - data_width;
	data_boundry2 = data_boundry1 - (data_width-1);
	j=0;
	for(i=data_boundry2;i<=data_boundry1;i = i + 1) begin
	  swap_data[j] = swap_crc_data[i];
	  j = j + 1;
	end      
	    
	swaped_data = fswap_bytes_bits (swap_data, bit_order);
	    
	j=0;
	for(i=data_boundry2;i<=data_boundry1;i = i + 1) begin
	  swaped_crc[i] = swaped_data[j];
	  j = j + 1;
	end   
	
	no_of_words = (no_of_words  -  1);
      end
     
      fswap_crc = swaped_crc;
    end
  endfunction // FUNC_SWAP_CRC


  function [poly_size-1:0] fcalc_crc;
    input [data_width-1:0] data_in;
    input [poly_size-1:0] crc_temp_data;
    input [poly_size-1:0] crc_polynomial;
    input [1:0]  bit_order;
    begin : FUNC_CAL_CRC
      reg[data_width-1:0] swaped_data_in;
      reg [poly_size-1:0] crc_data;
      reg 		     xor_or_not;
      integer 	     i;
     
     
     
      swaped_data_in = fswap_bytes_bits (data_in ,bit_order);
      crc_data = crc_temp_data ;
      i = 0 ;
      while (i < data_width ) begin 
	xor_or_not = 
	  swaped_data_in[(data_width-1) - i] ^ crc_data[(poly_size-1)];
	crc_data = {crc_data [((poly_size-1)-1):0],1'b0 };
	if(xor_or_not === 1'b1)
	  crc_data = (crc_data ^ crc_polynomial);
	else if(xor_or_not !== 1'b0)
	  crc_data = {data_width{xor_or_not}} ;
	i = i + 1;
      end
      fcalc_crc = crc_data ;
    end
  endfunction // FUNC_CAL_CRC





  function check_crc;
    input [poly_size-1:0] crc_out_int;
    input [poly_size-1:0] crc_ok_info;
    begin : FUNC_CRC_CHECK
      integer i;
      reg 	 crc_ok_func;
      reg [poly_size-1:0] data1;
      reg [poly_size-1:0] data2;
      data1 = crc_out_int ;
      data2 = crc_ok_info ;
     
      i = 0 ;
      while(i < poly_size) begin 
	if(data1[i] === 1'b0  || data1[i] === 1'b1) begin 
	  if(data1[i] === data2 [i]) begin
	    crc_ok_func = 1'b1;
	  end
	  else begin
	    crc_ok_func = 1'b0;
	    i = poly_size;
	  end 
	end
	else begin
	  crc_ok_func = data1 [i];
	  i = poly_size;
	end 
	i = i + 1;
      end
     
      check_crc = crc_ok_func ;
    end
  endfunction // FUNC_CRC_CHECK



   
  always @(drain or
           draining_status or
           drain_done_int or
           data_pointer or
           drain_pointer or
           insert_data or
           crc_out_next_shifted or
           crc_out_info or
           data_in or
           crc_result or
           ld_crc_n or
           crc_in or
           crc_ok_info)
  begin: PROC_DW_crc_s_sim_com

    if(draining_status === 1'b0) begin
      if((drain & ~drain_done_int) === 1'b1) begin
       draining_status_next = 1'b1;
       draining_next = 1'b1;
       drain_pointer_next = drain_pointer + 1;
       data_pointer_next = data_pointer  - 1;
       data_out_next = insert_data;
       crc_out_next = crc_out_next_shifted;
       crc_out_info_next = crc_out_info; 
       drain_done_next = drain_done_int;
      end  
      else if((drain & ~drain_done_int) === 1'b0) begin
       draining_status_next = 1'b0;
       draining_next = 1'b0;
       drain_pointer_next = 0;
       data_pointer_next = (poly_size/data_width) ; 
       data_out_next = data_in ;
       crc_out_next = crc_result;
       crc_out_info_next = crc_result;
       drain_done_next = drain_done_int;
      end  
      else begin
       draining_status_next = 1'bx ;
       draining_next = 1'bx ;
       drain_pointer_next = 0;
       data_pointer_next = 0 ; 
       data_out_next = {data_width {1'bx}};
       crc_out_next = {poly_size {1'bx}};
       crc_out_info_next = {poly_size {1'bx}}; 
       drain_done_next = 1'bx;
      end  
    end
    else if(draining_status === 1'b1) begin 
      if(data_pointer == 0) begin 
       draining_status_next = 1'b0 ;
       draining_next = 1'b0 ;
       drain_pointer_next = 0 ;
       data_pointer_next = 0 ; 
       data_out_next = data_in ;
       crc_out_next = crc_result;
       crc_out_info_next = crc_result; 
       drain_done_next = 1'b1;
      end
      else begin
       draining_status_next = 1'b1 ;
       draining_next = 1'b1 ;
       drain_pointer_next = drain_pointer + 1;
       data_pointer_next = data_pointer  - 1;
       data_out_next = insert_data ;
       crc_out_next = crc_out_next_shifted;
       crc_out_info_next = crc_out_info;
       drain_done_next = drain_done_int;
      end   
    end   // draining_status === 1'b1
    else begin 
      draining_status_next = 1'bx ;
      draining_next = 1'bx ;
      drain_pointer_next = data_pointer ;
      data_pointer_next = drain_pointer;
      data_out_next = {data_width{1'bx}} ;
      crc_out_next = {poly_size{1'bx}}  ;
      crc_out_info_next = {poly_size{1'bx}}  ; 
      drain_done_next = 1'bx ;
    end   

    if(ld_crc_n === 1'b0) begin
      crc_out_temp = crc_in;
      crc_out_info_temp = crc_in;
    end
    else if(ld_crc_n === 1'b1) begin
      crc_out_temp = crc_out_next;
      crc_out_info_temp = crc_out_info_next;
    end
    else begin
      crc_out_temp = {poly_size{1'bx}};
      crc_out_info_temp = {poly_size{1'bx}}; 
    end 

    crc_ok_result = check_crc(crc_out_temp ,crc_ok_info);

  end // PROC_DW_crc_s_sim_com

  always @ (posedge clk or negedge rst_n) begin : DW_crc_s_sim_seq_PROC
        
    if(rst_n === 1'b0) begin
      draining_status <= 1'b0 ;
      draining_int <= 1'b0 ;
      drain_pointer <= 0 ;
      data_pointer <= (poly_size/data_width) ;
      data_out_int <= {data_width{1'b0}} ;
      crc_out_int <= reset_crc_reg ; 
      crc_out_info <= reset_crc_reg ;  
      drain_done_int <= 1'b0 ;
      crc_ok_int <= 1'b0;   
    end else if(rst_n === 1'b1) begin 
      if(init_n === 1'b0) begin
        draining_status <= 1'b0 ;
        draining_int <= 1'b0 ;
        drain_pointer <= 0 ;
        data_pointer <= (poly_size/data_width) ;
        data_out_int <= {data_width{1'b0}} ;
        crc_out_int <= reset_crc_reg ;
        crc_out_info <= reset_crc_reg ; 
        drain_done_int <= 1'b0 ;
        crc_ok_int <= 1'b0;
      end else if(init_n === 1'b1) begin 
        if(enable === 1'b1) begin
          draining_status <= draining_status_next;
          draining_int <= draining_next ;
          drain_pointer <= drain_pointer_next ;
          data_pointer <= data_pointer_next ;
          data_out_int <= data_out_next ;
          crc_out_int <= crc_out_temp ;
          crc_out_info <= crc_out_info_temp ;
          drain_done_int <= drain_done_next ;
          crc_ok_int <= crc_ok_result;
        end else if(enable === 1'b0) begin
           draining_status <= draining_status ;
           draining_int <= draining_int ;
           drain_pointer <= drain_pointer ;
           data_pointer <= data_pointer ;
           data_out_int <= data_out_int ;
           crc_out_int <= crc_out_int ;
           crc_out_info <= crc_out_info ;
           drain_done_int <= drain_done_int ;
           crc_ok_int <= crc_ok_int ;
        end else begin
           draining_status <= 1'bx ;
           draining_int <= 1'bx ;
           drain_pointer <= 0 ;
           data_pointer <= (poly_size/data_width) ;
           data_out_int <= {data_width{1'bx}} ;
           crc_out_int <= {poly_size{1'bx}} ;
           crc_out_info <= {poly_size{1'bx}} ; 
           drain_done_int <= 1'bx ;
           crc_ok_int <= 1'bx ; 
        end
      end else begin 
        draining_status <= 1'bx ;
        draining_int <= 1'bx ;
        drain_pointer <= 0 ;
        data_pointer <= (poly_size/data_width) ;
        data_out_int <= {data_width{1'bx}} ;
        crc_out_int <= {poly_size{1'bx}} ;
        crc_out_info <= {poly_size{1'bx}} ; 
        drain_done_int <= 1'bx ;
        crc_ok_int <= 1'bx ; 
      end      
    end else begin
      draining_status <= 1'bx ;
      draining_int <= 1'bx ;
      drain_pointer <= 0 ;
      data_pointer <= 0 ;
      data_out_int <= {data_width{1'bx}} ;
      crc_out_int <= {poly_size{1'bx}} ;
      crc_out_info <= {poly_size{1'bx}} ; 
      drain_done_int <= 1'bx ;
      crc_ok_int <= 1'bx ;
    end 
       
  end // PROC_DW_crc_s_sim_seq

   assign crc_out_next_shifted = crc_out_int << data_width; 
   assign crc_result = fcalc_crc (data_in ,crc_out_int ,crc_polynomial ,bit_order);
   assign insert_crc_info = (crc_out_info ^ crc_xor_constant);
   assign crc_swaped_info = fswap_crc (insert_crc_info);
   assign crc_swaped_shifted = crc_swaped_info << (drain_pointer*data_width);
   assign insert_data = crc_swaped_shifted[poly_size-1:poly_size-data_width];

   assign crc_out = crc_out_int;
   assign draining = draining_int;
   assign data_out = data_out_int;
   assign crc_ok = crc_ok_int;
   assign drain_done = drain_done_int;
   
   
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    
      
       
    if ( (poly_size < 2) || (poly_size > 64 ) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter poly_size (legal range: 2 to 64 )",
	poly_size );
    end
       
    if ( (data_width < 1) || (data_width > poly_size ) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter data_width (legal range: 1 to poly_size )",
	data_width );
    end
       
    if ( (bit_order < 0) || (bit_order > 3 ) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter bit_order (legal range: 0 to 3 )",
	bit_order );
    end
       
    if ( (crc_cfg < 0) || (crc_cfg > 7 ) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter crc_cfg (legal range: 0 to 7 )",
	crc_cfg );
    end
       
    if ( (poly_coef0 < 0) || (poly_coef0 > 65535 ) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter poly_coef0 (legal range: 0 to 65535 )",
	poly_coef0 );
    end
       
    if ( (poly_coef1 < 0) || (poly_coef1 > 65535 ) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter poly_coef1 (legal range: 0 to 65535 )",
	poly_coef1 );
    end
       
    if ( (poly_coef2 < 0) || (poly_coef2 > 65535 ) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter poly_coef2 (legal range: 0 to 65535 )",
	poly_coef2 );
    end
       
    if ( (poly_coef3 < 0) || (poly_coef3 > 65535 ) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter poly_coef3 (legal range: 0 to 65535 )",
	poly_coef3 );
    end
       
    if ( (poly_coef0 % 2) == 0 ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m : Invalid parameter (poly_coef0 value MUST be an odd number)" );
    end
       
    if ( (poly_size % data_width) > 0 ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m : Invalid parameter combination (poly_size MUST be a multiple of data_width)" );
    end
       
    if ( (data_width % 8) > 0 && (bit_order > 1) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m : Invalid parameter combination (crc_cfg > 1 only allowed when data_width is multiple of 8)" );
    end

   
    if ( param_err_flg == 1) begin
      $display(
        "%m :\n  Simulation aborted due to invalid parameter value(s)");
      $finish;
    end

  end // parameter_check 

      

`ifndef UPF_POWER_AWARE
  initial begin : init_vars
	
    reg [63:0]			con_poly_coeff;
    reg [15:0]			v_poly_coef0;
    reg [15:0]			v_poly_coef1;
    reg [15:0]			v_poly_coef2;
    reg [15:0]			v_poly_coef3; 
    reg [poly_size-1:0 ]	int_ok_calc;
    reg[poly_size-1:0]		x;
    reg				xor_or_not_ok;
    integer			i;
	
    v_poly_coef0 = poly_coef0;
    v_poly_coef1 = poly_coef1;
    v_poly_coef2 = poly_coef2;
    v_poly_coef3 = poly_coef3;
	
    con_poly_coeff = {v_poly_coef3, v_poly_coef2,
			v_poly_coef1, v_poly_coef0 };

    crc_polynomial = con_poly_coeff [poly_size-1:0];
	
    if(crc_cfg % 2 == 0)
      reset_crc_reg = {poly_size{1'b0}};
    else
      reset_crc_reg = {poly_size{1'b1}};
	 
    
    if(crc_cfg == 0 || crc_cfg == 1) begin 
      x = {poly_size{1'b0}};
    end
    else if(crc_cfg == 6 || crc_cfg == 7) begin 
      x = {poly_size{1'b1}};
    end
    else begin
      if(crc_cfg == 2 || crc_cfg == 3) begin 
        x[0] = 1'b1;
      end
      else begin 
        x[0] = 1'b0;
      end 
       
      for(i=1;i<poly_size;i=i+1) begin 
        x[i] = ~x[i-1];
      end
    end
    
    crc_xor_constant = x;

    int_ok_calc = crc_xor_constant;
    i = 0;
    while(i < poly_size) begin 
      xor_or_not_ok = int_ok_calc[(poly_size-1)];
      int_ok_calc = { int_ok_calc[((poly_size-1)-1):0], 1'b0};
      if(xor_or_not_ok === 1'b1)
	int_ok_calc = (int_ok_calc ^ crc_polynomial);
      i = i + 1; 
    end
    crc_ok_info = int_ok_calc;
	
   end  // init_vars
`endif
   
   
`ifndef DW_DISABLE_CLK_MONITOR
`ifndef DW_SUPPRESS_WARN
  always @ (clk) begin : clk_monitor 
    if ( (clk !== 1'b0) && (clk !== 1'b1) && ($time > 0) )
      $display ("WARNING: %m:\n at time = %0t: Detected unknown value, %b, on clk input.", $time, clk);
    end // clk_monitor 
`endif
`endif

 // synopsys translate_on
      
endmodule
