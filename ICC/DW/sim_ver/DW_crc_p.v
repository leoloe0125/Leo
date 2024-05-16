////////////////////////////////////////////////////////////////////////////////
//
//       This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 2000 - 2023 SYNOPSYS INC.
//                           ALL RIGHTS RESERVED
//
//       The entire notice above must be reproduced on all authorized
//     copies.
//
// AUTHOR:    Jay Zhu, March 25, 2000
//
// VERSION:   Verilog Simulation Model
//
// DesignWare_version: 54da00ec
// DesignWare_release: U-2022.12-DWBB_202212.5
//
////////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------------
//
// ABSTRACT : Generic parallel CRC Generator/Checker 
//
// MODIFIED :
//
//      RJK     09/10/2020      Increased max data_width to 2560 (Enh STAR 3372033)
//                              and adjusted parameter checking for consistency
//
//      LMSU    07/09/2015      Changed for compatibility with VCS Native Low Power
//
//	RJK	04/12/2011 	Recoded parts to clean for lint - STAR 9000444285
//
//-------------------------------------------------------------------------------

module	DW_crc_p(
		data_in,
		crc_in,
		crc_ok,
		crc_out
		);

parameter    integer data_width = 16;
parameter    integer poly_size  = 16;
parameter    integer crc_cfg    = 7;
parameter    integer bit_order  = 3;
parameter    integer poly_coef0 = 4129;
parameter    integer poly_coef1 = 0;
parameter    integer poly_coef2 = 0;
parameter    integer poly_coef3 = 0;

input [data_width-1:0]	data_in;
input [poly_size-1:0]	crc_in;
output			crc_ok;
output [poly_size-1:0]	crc_out;


// synopsys translate_off

`define	DW_max_data_crc_l (data_width>poly_size?data_width:poly_size)


wire [poly_size-1:0]		crc_in_inv;
wire [poly_size-1:0]		crc_reg;
wire [poly_size-1:0]		crc_out_inv;
wire [poly_size-1:0]		crc_chk_crc_in;

`ifdef UPF_POWER_AWARE
  `protected
#ME\(>V6/eFdg7S5V>ga>L]Dd)ZM.6/YQTY?#)1//?9NXcX:Z\Ue4)Y_@(0^\aTS
S;5@:[2FG6#CeX?E@;cH?6JeYS4J24\B9;AY)=I#?S>,TF-6_8U:.LJ5g?>M[4V[
&Z9+^N]VW9&L3?LB6EfQNa4bQ[Y^9J2:F=JdI9F5O@9f=_OQ2:]XTIP?=UJ[N:W7
Db@8#.&(f2=DFdGc[bO4[#PB0e:d9M/;:2\UX7A)MRd@3YG@J-)SZgbCLdX26/+R
/IVYI-6D^7F:dLLZO?g<[(M&b6O8aF,S\@J--ac^-,1&(.L@K.QYLII=AG28UCYb
U#T[ICO(cgKR&B6caC[?83?6HH@V6.U@GaEcFb3QY0\-QBA-T?HKHQ/bLH5JP(6=
;]LdKFM#c_L^/[&4?=R?)2&GS5d0fSSaY4GYV,TM)O]?:M00Vb(BFBAX<D2C[6@9
+_</geHM,eDb[)A\Q79[GVMCC_RQ<-\9MB;8DdCO+dGCdKR>GeR1N^&S]KcJSc-Y
a]fDT;QM0ae:>]DbCU_88G<.5N@Y2]b=FMB39U@KAf1V2)ff4\CeYD8REQSFOVJK
K-HUJIDHFNB6P(2-S<+(E[=0_Z<O4dZ>f9(/T>.1J]@LY/ZK/,(QKV__aSAMR;LG
fBe#b/HJ-daZ69eAIB035=A&69SS1H>Z@-e<X_^^_E6g1HNaZQ\<SE5Q4R>\+RNd
eZ?\KLLKG+H2\W2MCU_H28?CbU(Qd,Kca_ONf/^&/TK#6]7M6N#Z@#YHX+gDZ::]
C]P?5J7BO/ed@.Xb7g[KgcBO55E5W@R_M\M@2AW3F_S_&L->WV&d;2b&+5F^Z_>\
A-BYV-&E[WA2AFLJKMG.d.I/(I[UYY8E(#T8\FBgVL2UX,b?age<7dGF.dfA3b5&
a=:C+@:UWa?UN&\AHNg_(<@PG+,\Y,IQ=g9^?e[)VDDC7FU8>UF&>2[U(:)P:AaV
5B^,^S)6Ld:3FaV24KgPa=18UK38L1AP:EC?O)9FJHF\VgS1^.,)H0b#PVe-#:@Y
4(BeA?YCb2e=&@BSUI5L5ATKO)WENBEP\g5Z8UKKW>80bVe:7_>f_/M<IBd:6bcL
>+e##9)[R)8SdRA<aX38G#CG=:2P),^1\^H07HV2=@XW,G/GI.KGTX#;(TLe1&E,
_<SG?b?#W_\fN5.PF-6LbL=K2b4@dX2>8]\;C/VRZ#AC9[&=9#&:=<+D,CKgTEFS
_SNa2>]e>-19P^^<2CI2SP9Ig]>&_[-1d4@Kbd3/PP7F^(#?ge]#U,Y@Y_F)UM4g
?\Ebe8IS2I?F0a_DbaBYA&@1E-]d\G.7>C=^584.7Z;4O=SR+A^K<RZG5O#JE+LP
I9^/#(Wf3#b6G,HR:LO?XYFTC==7>aG>B-KaR6K?OB18K&,Q7Cg[99e27+QF=UY8
ML)\?J3&T;YS+ef1?&[]BN7d5([1<XMR4UF8fOaAP9UHNRDD#.OcO5)gJT0>ESSI
)@OGN>KRB0gG8G?#/N_,&^\I4OE?1GRYO6K;<&>-N(COfQdCS.=J@18daP;Z?4:@
UT]GIdW.TOB.:]IJPH8^<C[6(N.67FKND=NZ&TAV[Mf0N3)ZL9^e6&ROL=fTE@gQ
EU.f4aRJJ@,UfGTH,)7JB<M&dMHE(a&Z^SDfT43V9KE;H;BADGA;VKROO$
`endprotected

`else
reg [poly_size-1:0]             crc_inv_alt;
reg [poly_size-1:0]             crc_polynomial;
`endif

function [`DW_max_data_crc_l-1:0]	bit_ordering;
    input [`DW_max_data_crc_l-1:0]	input_data;
    input [31:0]		v_width;

    begin : function_bit_ordering

	integer			width;
	integer			byte_idx;
	integer			bit_idx;

	width = v_width;

	case (bit_order) 
	    0 :
	  	bit_ordering = input_data;
	    1 :
		for(bit_idx=0; bit_idx<width; bit_idx=bit_idx+1)
		  bit_ordering[bit_idx] = input_data[width-bit_idx-1];
	    2 :
	  	for(byte_idx=0; byte_idx<width/8; byte_idx=byte_idx+1)
		  for(bit_idx=0;
		      bit_idx<8;
		      bit_idx=bit_idx+1)
	            bit_ordering[bit_idx+byte_idx*8]
		      = input_data[bit_idx+(width/8-byte_idx-1)*8];
	    3 :
		for(byte_idx=0; byte_idx<width/8; byte_idx=byte_idx+1)
		  for(bit_idx=0; bit_idx<8; bit_idx=bit_idx+1)
		    bit_ordering[byte_idx*8+bit_idx]
		          = input_data[(byte_idx+1)*8-1-bit_idx];
	    default : 
		begin 
		    $display("ERROR: %m : Internal Error.  Please report to Synopsys representative."); 
		    $finish; 
		end
	endcase

    end
endfunction // bit_ordering

function [poly_size-1 : 0] bit_order_crc;

    input [poly_size-1 : 0] crc_in;

    begin : function_bit_order_crc

        reg [`DW_max_data_crc_l-1 : 0] input_value;
        reg [`DW_max_data_crc_l-1 : 0] return_value;
	integer i;

	input_value = {`DW_max_data_crc_l{1'b0}};

	for (i=0 ; i < poly_size ; i=i+1)
	  input_value[i] = crc_in[i];

	return_value = bit_ordering(input_value,poly_size);

	bit_order_crc = return_value[poly_size-1 : 0];
    end
endfunction // bit_order_crc


function [data_width-1 : 0] bit_order_data;

    input [data_width-1 : 0] data_in;

    begin : function_bit_order_data

        reg [`DW_max_data_crc_l-1 : 0] input_value;
        reg [`DW_max_data_crc_l-1 : 0] return_value;
	integer i;

	input_value = {`DW_max_data_crc_l{1'b0}};

	for (i=0 ; i < data_width ; i=i+1)
	  input_value[i] = data_in[i];

	return_value = bit_ordering(input_value,data_width);

	bit_order_data = return_value[data_width-1 : 0];
    end
endfunction // bit_order_data


function [poly_size-1:0]	calculate_crc_w_in;

    input [poly_size-1:0]		crc_in;
    input [`DW_max_data_crc_l-1:0]	input_data;
    input [31:0]			width0;

    begin : function_calculate_crc_w_in

	integer			width;
	reg			feedback_bit;
	reg [poly_size-1:0]	feedback_vector;
	integer			bit_idx;

	width = width0;
	calculate_crc_w_in = crc_in;
	for(bit_idx=width-1; bit_idx>=0; bit_idx=bit_idx-1) begin
	    feedback_bit = calculate_crc_w_in[poly_size-1]
				^ input_data[bit_idx];
	    feedback_vector = {poly_size{feedback_bit}};

	    calculate_crc_w_in = {calculate_crc_w_in[poly_size-2:0],1'b0}
	  		^ (crc_polynomial & feedback_vector);
	end

    end
endfunction // calculate_crc_w_in


function [poly_size-1:0]	calculate_crc;
    input [data_width-1:0]	input_data;

    begin : function_calculate_crc

	reg [`DW_max_data_crc_l-1:0]	input_value;
	reg [poly_size-1:0]		crc_tmp;
	integer i;

	input_value = {`DW_max_data_crc_l{1'b0}};

	for (i=0 ; i < data_width ; i=i+1)
	  input_value[i] = input_data[i];

	crc_tmp = {poly_size{(crc_cfg % 2)?1'b1:1'b0}};
	calculate_crc = calculate_crc_w_in(crc_tmp, input_value,
			data_width);
    end
endfunction // calculate_crc_crc


function [poly_size-1:0]	calculate_crc_crc;
    input [poly_size-1:0]	input_crc;
    input [poly_size-1:0]	input_data;

    begin : function_calculate_crc_crc

	reg [`DW_max_data_crc_l-1:0]	input_value;
	reg [poly_size-1:0]		crc_tmp;
	integer i;

	input_value = {`DW_max_data_crc_l{1'b0}};

	for (i=0 ; i < poly_size ; i=i+1)
	  input_value[i] = input_data[i];

	calculate_crc_crc = calculate_crc_w_in(input_crc, input_value,
			poly_size);
    end
endfunction // calculate_crc_crc


    
 
  initial begin : parameter_check
    integer param_err_flg;

    param_err_flg = 0;
    

	
    if ( (data_width < 1) || (data_width > 2560) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter data_width (legal range: 1 to 2560)",
	data_width );
    end
	
    if ( (poly_size < 2) || (poly_size > 64) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter poly_size (legal range: 2 to 64)",
	poly_size );
    end
	
    if ( (crc_cfg < 0) || (crc_cfg > 7) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter crc_cfg (legal range: 0 to 7)",
	crc_cfg );
    end
	
    if ( (bit_order < 0) || (bit_order > 3) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter bit_order (legal range: 0 to 3)",
	bit_order );
    end
	
    if ( (poly_coef0 < 1) || (poly_coef0 > 65535) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter poly_coef0 (legal range: 1 to 65535)",
	poly_coef0 );
    end
	
    if ( (poly_coef1 < 0) || (poly_coef1 > 65535) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter poly_coef1 (legal range: 0 to 65535)",
	poly_coef1 );
    end
	
    if ( (poly_coef2 < 0) || (poly_coef2 > 65535) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter poly_coef2 (legal range: 0 to 65535)",
	poly_coef2 );
    end
	
    if ( (poly_coef3 < 0) || (poly_coef3 > 65535) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m :\n  Invalid value (%d) for parameter poly_coef3 (legal range: 0 to 65535)",
	poly_coef3 );
    end
	
    if ( (poly_coef0 % 2)==0 ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m : Invalid parameter (poly_coef0 value MUST be odd)" );
    end
	
    if ( (bit_order>1) && ((data_width % 8) > 0) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m : Invalid parameter combination (bit_order > 1 is only allowed when data_width is a multiple of 8)" );
    end
	
    if ( (bit_order>1) && ((poly_size % 8) > 0) ) begin
      param_err_flg = 1;
      $display(
	"ERROR: %m : Invalid parameter combination (bit_order > 1 is only allowed when poly_size is a moltiple of 8)" );
    end
    
    if ( param_err_flg == 1) begin
      $display(
        "%m :\n  Simulation aborted due to invalid parameter value(s)");
      $finish;
    end

  end // parameter_check 



`ifndef UPF_POWER_AWARE
    initial begin : initialize_vars

	reg [63:0]	crc_polynomial64;
	reg [15:0]	coef0;
	reg [15:0]	coef1;
	reg [15:0]	coef2;
	reg [15:0]	coef3;
	integer		bit_idx;

	coef0 = poly_coef0;
	coef1 = poly_coef1;
	coef2 = poly_coef2;
	coef3 = poly_coef3;

	crc_polynomial64 = {coef3, coef2, coef1, coef0};
	crc_polynomial = crc_polynomial64[poly_size-1:0];

	case(crc_cfg/2)
	    0 : crc_inv_alt = {poly_size{1'b0}};
	    1 : for(bit_idx=0; bit_idx<poly_size; bit_idx=bit_idx+1)
		crc_inv_alt[bit_idx] = (bit_idx % 2)? 1'b0 : 1'b1;
	    2 : for(bit_idx=0; bit_idx<poly_size; bit_idx=bit_idx+1)
		crc_inv_alt[bit_idx] = (bit_idx % 2)? 1'b1 : 1'b0;
	    3 : crc_inv_alt = {poly_size{1'b1}};
	    default : 
		begin 
		    $display("ERROR: %m : Internal Error.  Please report to Synopsys representative."); 
		    $finish; 
		end
	endcase

    end // initialize_vars


`endif
    assign	crc_in_inv = bit_order_crc(crc_in) ^ crc_inv_alt;

    assign	crc_reg = calculate_crc(bit_order_data(data_in));

    assign	crc_out_inv = crc_reg ^ crc_inv_alt;
    assign	crc_out = bit_order_crc(crc_out_inv);
    assign	crc_chk_crc_in = calculate_crc_crc(crc_reg, crc_in_inv);
    assign	crc_ok = ! (| crc_chk_crc_in);


`undef	DW_max_data_crc_l

// synopsys translate_on

endmodule
