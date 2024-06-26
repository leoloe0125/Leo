
//------> /usr/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

module ccs_in_wait_v1 (idat, rdy, ivld, dat, irdy, vld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  output             rdy;
  output             ivld;
  input  [width-1:0] dat;
  input              irdy;
  input              vld;

  wire   [width-1:0] idat;
  wire               rdy;
  wire               ivld;

  localparam stallOff = 0; 
  wire                  stall_ctrl;
  assign stall_ctrl = stallOff;

  assign idat = dat;
  assign rdy = irdy && !stall_ctrl;
  assign ivld = vld && !stall_ctrl;

endmodule


//------> /usr/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_out_wait_v1 (dat, irdy, vld, idat, rdy, ivld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] dat;
  output             irdy;
  output             vld;
  input  [width-1:0] idat;
  input              rdy;
  input              ivld;

  wire   [width-1:0] dat;
  wire               irdy;
  wire               vld;

  localparam stallOff = 0; 
  wire stall_ctrl;
  assign stall_ctrl = stallOff;

  assign dat = idat;
  assign irdy = rdy && !stall_ctrl;
  assign vld = ivld && !stall_ctrl;

endmodule



//------> /usr/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module mgc_io_sync_v2 (ld, lz);
    parameter valid = 0;

    input  ld;
    output lz;

    wire   lz;

    assign lz = ld;

endmodule


//------> /usr/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_v1 (idat, dat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  input  [width-1:0] dat;

  wire   [width-1:0] idat;

  assign idat = dat;

endmodule


//------> /usr/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_out_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

module ccs_out_v1 (dat, idat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output   [width-1:0] dat;
  input    [width-1:0] idat;

  wire     [width-1:0] dat;

  assign dat = idat;

endmodule




//------> ../EdgeDetect_IP_EdgeDetect_MagAng.v1/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.2/1059873 Production Release
//  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
// 
//  Generated by:   m11102154@cad27
//  Generated date: Sat Apr  6 14:37:50 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm (
  clk, rst, arst_n, run_wen, fsm_output, MCOL_C_0_tr0, MROW_C_0_tr0
);
  input clk;
  input rst;
  input arst_n;
  input run_wen;
  output [3:0] fsm_output;
  reg [3:0] fsm_output;
  input MCOL_C_0_tr0;
  input MROW_C_0_tr0;


  // FSM State Type Declaration for EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    MCOL_C_0 = 2'd1,
    MROW_C_0 = 2'd2,
    main_C_1 = 2'd3;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_1
    case (state_var)
      MCOL_C_0 : begin
        fsm_output = 4'b0010;
        if ( MCOL_C_0_tr0 ) begin
          state_var_NS = MROW_C_0;
        end
        else begin
          state_var_NS = MCOL_C_0;
        end
      end
      MROW_C_0 : begin
        fsm_output = 4'b0100;
        if ( MROW_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = MCOL_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 4'b1000;//'b1000
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 4'b0001;
        state_var_NS = MCOL_C_0;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= main_C_0;
    end
    else if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_staller
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_staller (
  clk, rst, arst_n, run_wen, run_wten, dx_in_rsci_wen_comp, dy_in_rsci_wen_comp,
      pix_chan2_rsci_wen_comp, dat_out_rsci_wen_comp
);
  input clk;
  input rst;
  input arst_n;
  output run_wen;
  output run_wten;
  reg run_wten;
  input dx_in_rsci_wen_comp;
  input dy_in_rsci_wen_comp;
  input pix_chan2_rsci_wen_comp;
  input dat_out_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = dx_in_rsci_wen_comp & dy_in_rsci_wen_comp & pix_chan2_rsci_wen_comp
      & dat_out_rsci_wen_comp;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      run_wten <= 1'b0;
    end
    else if ( rst ) begin
      run_wten <= 1'b0;
    end
    else begin
      run_wten <= ~ run_wen;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl
    (
  run_wten, crc32_dat_out_triosy_obj_iswt0, crc32_dat_out_triosy_obj_biwt
);
  input run_wten;
  input crc32_dat_out_triosy_obj_iswt0;
  output crc32_dat_out_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign crc32_dat_out_triosy_obj_biwt = (~ run_wten) & crc32_dat_out_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl
    (
  run_wten, crc32_pix_in_triosy_obj_iswt0, crc32_pix_in_triosy_obj_biwt
);
  input run_wten;
  input crc32_pix_in_triosy_obj_iswt0;
  output crc32_pix_in_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign crc32_pix_in_triosy_obj_biwt = (~ run_wten) & crc32_pix_in_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_sw_in_triosy_obj_sw_in_triosy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_sw_in_triosy_obj_sw_in_triosy_wait_ctrl
    (
  run_wten, sw_in_triosy_obj_iswt0, sw_in_triosy_obj_biwt
);
  input run_wten;
  input sw_in_triosy_obj_iswt0;
  output sw_in_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign sw_in_triosy_obj_biwt = (~ run_wten) & sw_in_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_heightIn_triosy_obj_heightIn_triosy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_heightIn_triosy_obj_heightIn_triosy_wait_ctrl
    (
  run_wten, heightIn_triosy_obj_iswt0, heightIn_triosy_obj_biwt
);
  input run_wten;
  input heightIn_triosy_obj_iswt0;
  output heightIn_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign heightIn_triosy_obj_biwt = (~ run_wten) & heightIn_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_widthIn_triosy_obj_widthIn_triosy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_widthIn_triosy_obj_widthIn_triosy_wait_ctrl
    (
  run_wten, widthIn_triosy_obj_iswt0, widthIn_triosy_obj_biwt
);
  input run_wten;
  input widthIn_triosy_obj_iswt0;
  output widthIn_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign widthIn_triosy_obj_biwt = (~ run_wten) & widthIn_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp (
  clk, rst, arst_n, dat_out_rsci_oswt, dat_out_rsci_wen_comp, dat_out_rsci_biwt,
      dat_out_rsci_bdwt, dat_out_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input dat_out_rsci_biwt;
  input dat_out_rsci_bdwt;
  output dat_out_rsci_bcwt;
  reg dat_out_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_wen_comp = (~ dat_out_rsci_oswt) | dat_out_rsci_biwt | dat_out_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else begin
      dat_out_rsci_bcwt <= ~((~(dat_out_rsci_bcwt | dat_out_rsci_biwt)) | dat_out_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl (
  run_wen, dat_out_rsci_oswt, dat_out_rsci_biwt, dat_out_rsci_bdwt, dat_out_rsci_bcwt,
      dat_out_rsci_irdy, dat_out_rsci_ivld_run_sct
);
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_biwt;
  output dat_out_rsci_bdwt;
  input dat_out_rsci_bcwt;
  input dat_out_rsci_irdy;
  output dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dat_out_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_bdwt = dat_out_rsci_oswt & run_wen;
  assign dat_out_rsci_biwt = dat_out_rsci_ogwt & dat_out_rsci_irdy;
  assign dat_out_rsci_ogwt = dat_out_rsci_oswt & (~ dat_out_rsci_bcwt);
  assign dat_out_rsci_ivld_run_sct = dat_out_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci_pix_chan2_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci_pix_chan2_wait_dp (
  clk, rst, arst_n, pix_chan2_rsci_oswt, pix_chan2_rsci_wen_comp, pix_chan2_rsci_biwt,
      pix_chan2_rsci_bdwt, pix_chan2_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input pix_chan2_rsci_oswt;
  output pix_chan2_rsci_wen_comp;
  input pix_chan2_rsci_biwt;
  input pix_chan2_rsci_bdwt;
  output pix_chan2_rsci_bcwt;
  reg pix_chan2_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign pix_chan2_rsci_wen_comp = (~ pix_chan2_rsci_oswt) | pix_chan2_rsci_biwt
      | pix_chan2_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      pix_chan2_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      pix_chan2_rsci_bcwt <= 1'b0;
    end
    else begin
      pix_chan2_rsci_bcwt <= ~((~(pix_chan2_rsci_bcwt | pix_chan2_rsci_biwt)) | pix_chan2_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci_pix_chan2_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci_pix_chan2_wait_ctrl (
  run_wen, pix_chan2_rsci_oswt, pix_chan2_rsci_biwt, pix_chan2_rsci_bdwt, pix_chan2_rsci_bcwt,
      pix_chan2_rsci_irdy_run_sct, pix_chan2_rsci_ivld
);
  input run_wen;
  input pix_chan2_rsci_oswt;
  output pix_chan2_rsci_biwt;
  output pix_chan2_rsci_bdwt;
  input pix_chan2_rsci_bcwt;
  output pix_chan2_rsci_irdy_run_sct;
  input pix_chan2_rsci_ivld;


  // Interconnect Declarations
  wire pix_chan2_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign pix_chan2_rsci_bdwt = pix_chan2_rsci_oswt & run_wen;
  assign pix_chan2_rsci_biwt = pix_chan2_rsci_ogwt & pix_chan2_rsci_ivld;
  assign pix_chan2_rsci_ogwt = pix_chan2_rsci_oswt & (~ pix_chan2_rsci_bcwt);
  assign pix_chan2_rsci_irdy_run_sct = pix_chan2_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_dp (
  clk, rst, arst_n, dy_in_rsci_oswt, dy_in_rsci_wen_comp, dy_in_rsci_idat_mxwt, dy_in_rsci_biwt,
      dy_in_rsci_bdwt, dy_in_rsci_bcwt, dy_in_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  input dy_in_rsci_oswt;
  output dy_in_rsci_wen_comp;
  output [35:0] dy_in_rsci_idat_mxwt;
  input dy_in_rsci_biwt;
  input dy_in_rsci_bdwt;
  output dy_in_rsci_bcwt;
  reg dy_in_rsci_bcwt;
  input [35:0] dy_in_rsci_idat;


  // Interconnect Declarations
  reg [35:0] dy_in_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign dy_in_rsci_wen_comp = (~ dy_in_rsci_oswt) | dy_in_rsci_biwt | dy_in_rsci_bcwt;
  assign dy_in_rsci_idat_mxwt = MUX_v_36_2_2(dy_in_rsci_idat, dy_in_rsci_idat_bfwt,
      dy_in_rsci_bcwt);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dy_in_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dy_in_rsci_bcwt <= 1'b0;
    end
    else begin
      dy_in_rsci_bcwt <= ~((~(dy_in_rsci_bcwt | dy_in_rsci_biwt)) | dy_in_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( dy_in_rsci_biwt ) begin
      dy_in_rsci_idat_bfwt <= dy_in_rsci_idat;
    end
  end

  function automatic [35:0] MUX_v_36_2_2;
    input [35:0] input_0;
    input [35:0] input_1;
    input  sel;
    reg [35:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_36_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl (
  run_wen, dy_in_rsci_oswt, dy_in_rsci_biwt, dy_in_rsci_bdwt, dy_in_rsci_bcwt, dy_in_rsci_irdy_run_sct,
      dy_in_rsci_ivld
);
  input run_wen;
  input dy_in_rsci_oswt;
  output dy_in_rsci_biwt;
  output dy_in_rsci_bdwt;
  input dy_in_rsci_bcwt;
  output dy_in_rsci_irdy_run_sct;
  input dy_in_rsci_ivld;


  // Interconnect Declarations
  wire dy_in_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dy_in_rsci_bdwt = dy_in_rsci_oswt & run_wen;
  assign dy_in_rsci_biwt = dy_in_rsci_ogwt & dy_in_rsci_ivld;
  assign dy_in_rsci_ogwt = dy_in_rsci_oswt & (~ dy_in_rsci_bcwt);
  assign dy_in_rsci_irdy_run_sct = dy_in_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_dp (
  clk, rst, arst_n, dx_in_rsci_oswt, dx_in_rsci_wen_comp, dx_in_rsci_idat_mxwt, dx_in_rsci_biwt,
      dx_in_rsci_bdwt, dx_in_rsci_bcwt, dx_in_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  input dx_in_rsci_oswt;
  output dx_in_rsci_wen_comp;
  output [35:0] dx_in_rsci_idat_mxwt;
  input dx_in_rsci_biwt;
  input dx_in_rsci_bdwt;
  output dx_in_rsci_bcwt;
  reg dx_in_rsci_bcwt;
  input [35:0] dx_in_rsci_idat;


  // Interconnect Declarations
  reg [35:0] dx_in_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign dx_in_rsci_wen_comp = (~ dx_in_rsci_oswt) | dx_in_rsci_biwt | dx_in_rsci_bcwt;
  assign dx_in_rsci_idat_mxwt = MUX_v_36_2_2(dx_in_rsci_idat, dx_in_rsci_idat_bfwt,
      dx_in_rsci_bcwt);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dx_in_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dx_in_rsci_bcwt <= 1'b0;
    end
    else begin
      dx_in_rsci_bcwt <= ~((~(dx_in_rsci_bcwt | dx_in_rsci_biwt)) | dx_in_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( dx_in_rsci_biwt ) begin
      dx_in_rsci_idat_bfwt <= dx_in_rsci_idat;
    end
  end

  function automatic [35:0] MUX_v_36_2_2;
    input [35:0] input_0;
    input [35:0] input_1;
    input  sel;
    reg [35:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_36_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl (
  run_wen, dx_in_rsci_oswt, dx_in_rsci_biwt, dx_in_rsci_bdwt, dx_in_rsci_bcwt, dx_in_rsci_irdy_run_sct,
      dx_in_rsci_ivld
);
  input run_wen;
  input dx_in_rsci_oswt;
  output dx_in_rsci_biwt;
  output dx_in_rsci_bdwt;
  input dx_in_rsci_bcwt;
  output dx_in_rsci_irdy_run_sct;
  input dx_in_rsci_ivld;


  // Interconnect Declarations
  wire dx_in_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dx_in_rsci_bdwt = dx_in_rsci_oswt & run_wen;
  assign dx_in_rsci_biwt = dx_in_rsci_ogwt & dx_in_rsci_ivld;
  assign dx_in_rsci_ogwt = dx_in_rsci_oswt & (~ dx_in_rsci_bcwt);
  assign dx_in_rsci_irdy_run_sct = dx_in_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj (
  crc32_dat_out_triosy_lz, run_wten, crc32_dat_out_triosy_obj_iswt0
);
  output crc32_dat_out_triosy_lz;
  input run_wten;
  input crc32_dat_out_triosy_obj_iswt0;


  // Interconnect Declarations
  wire crc32_dat_out_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) crc32_dat_out_triosy_obj (
      .ld(crc32_dat_out_triosy_obj_biwt),
      .lz(crc32_dat_out_triosy_lz)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl
      EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .crc32_dat_out_triosy_obj_iswt0(crc32_dat_out_triosy_obj_iswt0),
      .crc32_dat_out_triosy_obj_biwt(crc32_dat_out_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj (
  crc32_pix_in_triosy_lz, run_wten, crc32_pix_in_triosy_obj_iswt0
);
  output crc32_pix_in_triosy_lz;
  input run_wten;
  input crc32_pix_in_triosy_obj_iswt0;


  // Interconnect Declarations
  wire crc32_pix_in_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) crc32_pix_in_triosy_obj (
      .ld(crc32_pix_in_triosy_obj_biwt),
      .lz(crc32_pix_in_triosy_lz)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl
      EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .crc32_pix_in_triosy_obj_iswt0(crc32_pix_in_triosy_obj_iswt0),
      .crc32_pix_in_triosy_obj_biwt(crc32_pix_in_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_sw_in_triosy_obj
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_sw_in_triosy_obj (
  sw_in_triosy_lz, run_wten, sw_in_triosy_obj_iswt0
);
  output sw_in_triosy_lz;
  input run_wten;
  input sw_in_triosy_obj_iswt0;


  // Interconnect Declarations
  wire sw_in_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) sw_in_triosy_obj (
      .ld(sw_in_triosy_obj_biwt),
      .lz(sw_in_triosy_lz)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_sw_in_triosy_obj_sw_in_triosy_wait_ctrl EdgeDetect_IP_EdgeDetect_MagAng_run_sw_in_triosy_obj_sw_in_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .sw_in_triosy_obj_iswt0(sw_in_triosy_obj_iswt0),
      .sw_in_triosy_obj_biwt(sw_in_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_heightIn_triosy_obj
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_heightIn_triosy_obj (
  heightIn_triosy_lz, run_wten, heightIn_triosy_obj_iswt0
);
  output heightIn_triosy_lz;
  input run_wten;
  input heightIn_triosy_obj_iswt0;


  // Interconnect Declarations
  wire heightIn_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) heightIn_triosy_obj (
      .ld(heightIn_triosy_obj_biwt),
      .lz(heightIn_triosy_lz)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_heightIn_triosy_obj_heightIn_triosy_wait_ctrl
      EdgeDetect_IP_EdgeDetect_MagAng_run_heightIn_triosy_obj_heightIn_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .heightIn_triosy_obj_iswt0(heightIn_triosy_obj_iswt0),
      .heightIn_triosy_obj_biwt(heightIn_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_widthIn_triosy_obj
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_widthIn_triosy_obj (
  widthIn_triosy_lz, run_wten, widthIn_triosy_obj_iswt0
);
  output widthIn_triosy_lz;
  input run_wten;
  input widthIn_triosy_obj_iswt0;


  // Interconnect Declarations
  wire widthIn_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) widthIn_triosy_obj (
      .ld(widthIn_triosy_obj_biwt),
      .lz(widthIn_triosy_lz)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_widthIn_triosy_obj_widthIn_triosy_wait_ctrl
      EdgeDetect_IP_EdgeDetect_MagAng_run_widthIn_triosy_obj_widthIn_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .widthIn_triosy_obj_iswt0(widthIn_triosy_obj_iswt0),
      .widthIn_triosy_obj_biwt(widthIn_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci (
  clk, rst, arst_n, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, run_wen, dat_out_rsci_oswt,
      dat_out_rsci_wen_comp, dat_out_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input [33:0] dat_out_rsci_idat;


  // Interconnect Declarations
  wire dat_out_rsci_biwt;
  wire dat_out_rsci_bdwt;
  wire dat_out_rsci_bcwt;
  wire dat_out_rsci_irdy;
  wire dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd9),
  .width(32'sd34)) dat_out_rsci (
      .irdy(dat_out_rsci_irdy),
      .ivld(dat_out_rsci_ivld_run_sct),
      .idat(dat_out_rsci_idat),
      .rdy(dat_out_rsc_rdy),
      .vld(dat_out_rsc_vld),
      .dat(dat_out_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt),
      .dat_out_rsci_irdy(dat_out_rsci_irdy),
      .dat_out_rsci_ivld_run_sct(dat_out_rsci_ivld_run_sct)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci (
  clk, rst, arst_n, pix_chan2_rsc_dat, pix_chan2_rsc_vld, pix_chan2_rsc_rdy, run_wen,
      pix_chan2_rsci_oswt, pix_chan2_rsci_wen_comp
);
  input clk;
  input rst;
  input arst_n;
  input [33:0] pix_chan2_rsc_dat;
  input pix_chan2_rsc_vld;
  output pix_chan2_rsc_rdy;
  input run_wen;
  input pix_chan2_rsci_oswt;
  output pix_chan2_rsci_wen_comp;


  // Interconnect Declarations
  wire pix_chan2_rsci_biwt;
  wire pix_chan2_rsci_bdwt;
  wire pix_chan2_rsci_bcwt;
  wire pix_chan2_rsci_irdy_run_sct;
  wire pix_chan2_rsci_ivld;
  wire [33:0] pix_chan2_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd3),
  .width(32'sd34)) pix_chan2_rsci (
      .rdy(pix_chan2_rsc_rdy),
      .vld(pix_chan2_rsc_vld),
      .dat(pix_chan2_rsc_dat),
      .irdy(pix_chan2_rsci_irdy_run_sct),
      .ivld(pix_chan2_rsci_ivld),
      .idat(pix_chan2_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci_pix_chan2_wait_ctrl EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci_pix_chan2_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .pix_chan2_rsci_oswt(pix_chan2_rsci_oswt),
      .pix_chan2_rsci_biwt(pix_chan2_rsci_biwt),
      .pix_chan2_rsci_bdwt(pix_chan2_rsci_bdwt),
      .pix_chan2_rsci_bcwt(pix_chan2_rsci_bcwt),
      .pix_chan2_rsci_irdy_run_sct(pix_chan2_rsci_irdy_run_sct),
      .pix_chan2_rsci_ivld(pix_chan2_rsci_ivld)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci_pix_chan2_wait_dp EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci_pix_chan2_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .pix_chan2_rsci_oswt(pix_chan2_rsci_oswt),
      .pix_chan2_rsci_wen_comp(pix_chan2_rsci_wen_comp),
      .pix_chan2_rsci_biwt(pix_chan2_rsci_biwt),
      .pix_chan2_rsci_bdwt(pix_chan2_rsci_bdwt),
      .pix_chan2_rsci_bcwt(pix_chan2_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci (
  clk, rst, arst_n, dy_in_rsc_dat, dy_in_rsc_vld, dy_in_rsc_rdy, run_wen, dy_in_rsci_oswt,
      dy_in_rsci_wen_comp, dy_in_rsci_idat_mxwt
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input run_wen;
  input dy_in_rsci_oswt;
  output dy_in_rsci_wen_comp;
  output [35:0] dy_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dy_in_rsci_biwt;
  wire dy_in_rsci_bdwt;
  wire dy_in_rsci_bcwt;
  wire dy_in_rsci_irdy_run_sct;
  wire dy_in_rsci_ivld;
  wire [35:0] dy_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd2),
  .width(32'sd36)) dy_in_rsci (
      .rdy(dy_in_rsc_rdy),
      .vld(dy_in_rsc_vld),
      .dat(dy_in_rsc_dat),
      .irdy(dy_in_rsci_irdy_run_sct),
      .ivld(dy_in_rsci_ivld),
      .idat(dy_in_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dy_in_rsci_oswt(dy_in_rsci_oswt),
      .dy_in_rsci_biwt(dy_in_rsci_biwt),
      .dy_in_rsci_bdwt(dy_in_rsci_bdwt),
      .dy_in_rsci_bcwt(dy_in_rsci_bcwt),
      .dy_in_rsci_irdy_run_sct(dy_in_rsci_irdy_run_sct),
      .dy_in_rsci_ivld(dy_in_rsci_ivld)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_dp EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dy_in_rsci_oswt(dy_in_rsci_oswt),
      .dy_in_rsci_wen_comp(dy_in_rsci_wen_comp),
      .dy_in_rsci_idat_mxwt(dy_in_rsci_idat_mxwt),
      .dy_in_rsci_biwt(dy_in_rsci_biwt),
      .dy_in_rsci_bdwt(dy_in_rsci_bdwt),
      .dy_in_rsci_bcwt(dy_in_rsci_bcwt),
      .dy_in_rsci_idat(dy_in_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci (
  clk, rst, arst_n, dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, run_wen, dx_in_rsci_oswt,
      dx_in_rsci_wen_comp, dx_in_rsci_idat_mxwt
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input run_wen;
  input dx_in_rsci_oswt;
  output dx_in_rsci_wen_comp;
  output [35:0] dx_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dx_in_rsci_biwt;
  wire dx_in_rsci_bdwt;
  wire dx_in_rsci_bcwt;
  wire dx_in_rsci_irdy_run_sct;
  wire dx_in_rsci_ivld;
  wire [35:0] dx_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd1),
  .width(32'sd36)) dx_in_rsci (
      .rdy(dx_in_rsc_rdy),
      .vld(dx_in_rsc_vld),
      .dat(dx_in_rsc_dat),
      .irdy(dx_in_rsci_irdy_run_sct),
      .ivld(dx_in_rsci_ivld),
      .idat(dx_in_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dx_in_rsci_oswt(dx_in_rsci_oswt),
      .dx_in_rsci_biwt(dx_in_rsci_biwt),
      .dx_in_rsci_bdwt(dx_in_rsci_bdwt),
      .dx_in_rsci_bcwt(dx_in_rsci_bcwt),
      .dx_in_rsci_irdy_run_sct(dx_in_rsci_irdy_run_sct),
      .dx_in_rsci_ivld(dx_in_rsci_ivld)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_dp EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsci_oswt(dx_in_rsci_oswt),
      .dx_in_rsci_wen_comp(dx_in_rsci_wen_comp),
      .dx_in_rsci_idat_mxwt(dx_in_rsci_idat_mxwt),
      .dx_in_rsci_biwt(dx_in_rsci_biwt),
      .dx_in_rsci_bdwt(dx_in_rsci_bdwt),
      .dx_in_rsci_bcwt(dx_in_rsci_bcwt),
      .dx_in_rsci_idat(dx_in_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run (
  clk, rst, arst_n, dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, dy_in_rsc_dat, dy_in_rsc_vld,
      dy_in_rsc_rdy, pix_chan2_rsc_dat, pix_chan2_rsc_vld, pix_chan2_rsc_rdy, widthIn_rsc_dat,
      widthIn_triosy_lz, heightIn_rsc_dat, heightIn_triosy_lz, sw_in_triosy_lz, crc32_pix_in_rsc_dat,
      crc32_pix_in_triosy_lz, crc32_dat_out_rsc_dat, crc32_dat_out_triosy_lz, dat_out_rsc_dat,
      dat_out_rsc_vld, dat_out_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input [33:0] pix_chan2_rsc_dat;
  input pix_chan2_rsc_vld;
  output pix_chan2_rsc_rdy;
  input [9:0] widthIn_rsc_dat;
  output widthIn_triosy_lz;
  input [8:0] heightIn_rsc_dat;
  output heightIn_triosy_lz;
  output sw_in_triosy_lz;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_triosy_lz;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;


  // Interconnect Declarations
  wire run_wen;
  wire run_wten;
  wire dx_in_rsci_wen_comp;
  wire [35:0] dx_in_rsci_idat_mxwt;
  wire dy_in_rsci_wen_comp;
  wire [35:0] dy_in_rsci_idat_mxwt;
  wire pix_chan2_rsci_wen_comp;
  wire [9:0] widthIn_rsci_idat;
  wire [8:0] heightIn_rsci_idat;
  wire dat_out_rsci_wen_comp;
  reg dat_out_rsci_idat_33;
  reg dat_out_rsci_idat_32;
  reg [7:0] dat_out_rsci_idat_31_24;
  reg [7:0] dat_out_rsci_idat_23_16;
  reg [7:0] dat_out_rsci_idat_15_8;
  reg [7:0] dat_out_rsci_idat_7_0;
  wire [3:0] fsm_output;
  wire MROW_equal_tmp;
  wire MCOL_equal_2_tmp;
  wire [2:0] MCOL_for_acc_2_tmp;
  wire [3:0] nl_MCOL_for_acc_2_tmp;
  wire or_dcpl;
  wire or_dcpl_2;
  wire or_dcpl_6;
  wire and_dcpl_12;
  wire or_dcpl_18;
  wire or_dcpl_19;
  wire or_dcpl_20;
  wire or_dcpl_21;
  wire or_dcpl_22;
  wire or_dcpl_28;
  reg [1:0] MCOL_for_i_2_0_lpi_3_1_0;
  reg exitL_exit_MCOL_for_sva;
  reg MCOL_stage_0;
  reg MCOL_stage_0_2;
  reg MCOL_for_i_slc_MCOL_for_i_2_0_2_itm_1;
  reg [1:0] MCOL_for_i_2_0_lpi_3_dfm_1_1_0;
  reg MCOL_for_asn_4_itm_1;
  reg MCOL_asn_12_itm_1;
  wire [8:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_din_1_sva_1;
  wire [8:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_din_sva_1;
  wire MCOL_and_cse;
  reg reg_dx_in_rsci_oswt_cse;
  reg reg_pix_chan2_rsci_oswt_cse;
  reg reg_dat_out_rsci_oswt_cse;
  reg reg_widthIn_triosy_obj_iswt0_cse;
  wire asum_and_cse;
  wire [9:0] z_out;
  wire [10:0] nl_z_out;
  wire [8:0] z_out_1;
  wire [9:0] nl_z_out_1;
  reg [8:0] MROW_y_sva;
  reg [35:0] dx_lpi_3;
  reg [35:0] dy_lpi_3;
  reg [7:0] asum_1_lpi_3;
  reg [7:0] asum_2_lpi_3;
  reg [7:0] asum_0_lpi_3;
  reg [7:0] asum_3_lpi_3;
  reg [9:0] MCOL_x_sva;
  reg MCOL_equal_itm_1;
  reg MCOL_MCOL_nor_itm_1;
  wire dat_out_rsci_idat_7_0_mx0c1;
  wire dat_out_rsci_idat_15_8_mx0c1;
  wire dat_out_rsci_idat_31_24_mx0c1;
  wire dat_out_rsci_idat_23_16_mx0c1;
  wire [1:0] MCOL_for_i_2_0_lpi_3_dfm_1_0_1;
  wire [7:0] MCOL_for_acc_1_ctmp_sva_1;
  wire [8:0] nl_MCOL_for_acc_1_ctmp_sva_1;
  wire [35:0] dy_lpi_3_dfm_mx0;
  wire [35:0] dx_lpi_3_dfm_mx0;
  wire MCOL_and_6_cse;
  wire MCOL_and_7_cse;
  wire MROW_y_or_cse;
  wire dy_and_cse;

  wire MROW_y_not_1_nl;
  wire not_40_nl;
  wire[7:0] operator_10_false_acc_nl;
  wire[8:0] nl_operator_10_false_acc_nl;
  wire MCOL_for_not_6_nl;
  wire[7:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_nl;
  wire[7:0] operator_9_true_operator_9_true_operator_9_true_acc_nl;
  wire[8:0] nl_operator_9_true_operator_9_true_operator_9_true_acc_nl;
  wire[9:0] operator_9_true_acc_nl;
  wire[10:0] nl_operator_9_true_acc_nl;
  wire[7:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_nl;
  wire[7:0] operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl;
  wire[8:0] nl_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl;
  wire[9:0] operator_9_true_1_acc_nl;
  wire[10:0] nl_operator_9_true_1_acc_nl;
  wire MROW_MROW_and_1_nl;
  wire[8:0] MROW_mux_2_nl;
  wire operator_11_true_operator_11_true_and_1_nl;
  wire[7:0] operator_11_true_mux_2_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [33:0] nl_EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_inst_dat_out_rsci_idat;
  assign nl_EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_inst_dat_out_rsci_idat
      = {dat_out_rsci_idat_33 , dat_out_rsci_idat_32 , dat_out_rsci_idat_31_24 ,
      dat_out_rsci_idat_23_16 , dat_out_rsci_idat_15_8 , dat_out_rsci_idat_7_0};
  wire  nl_EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_inst_MCOL_C_0_tr0;
  assign nl_EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_inst_MCOL_C_0_tr0 = ~(MCOL_stage_0_2
      | MCOL_stage_0);
  ccs_in_v1 #(.rscid(32'sd4),
  .width(32'sd10)) widthIn_rsci (
      .dat(widthIn_rsc_dat),
      .idat(widthIn_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd5),
  .width(32'sd9)) heightIn_rsci (
      .dat(heightIn_rsc_dat),
      .idat(heightIn_rsci_idat)
    );
  ccs_out_v1 #(.rscid(32'sd7),
  .width(32'sd32)) crc32_pix_in_rsci (
      .idat(32'b00000000000000000000000000000000),
      .dat(crc32_pix_in_rsc_dat)
    );
  ccs_out_v1 #(.rscid(32'sd8),
  .width(32'sd32)) crc32_dat_out_rsci (
      .idat(32'b00000000000000000000000000000000),
      .dat(crc32_dat_out_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsc_dat(dx_in_rsc_dat),
      .dx_in_rsc_vld(dx_in_rsc_vld),
      .dx_in_rsc_rdy(dx_in_rsc_rdy),
      .run_wen(run_wen),
      .dx_in_rsci_oswt(reg_dx_in_rsci_oswt_cse),
      .dx_in_rsci_wen_comp(dx_in_rsci_wen_comp),
      .dx_in_rsci_idat_mxwt(dx_in_rsci_idat_mxwt)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dy_in_rsc_dat(dy_in_rsc_dat),
      .dy_in_rsc_vld(dy_in_rsc_vld),
      .dy_in_rsc_rdy(dy_in_rsc_rdy),
      .run_wen(run_wen),
      .dy_in_rsci_oswt(reg_dx_in_rsci_oswt_cse),
      .dy_in_rsci_wen_comp(dy_in_rsci_wen_comp),
      .dy_in_rsci_idat_mxwt(dy_in_rsci_idat_mxwt)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci EdgeDetect_IP_EdgeDetect_MagAng_run_pix_chan2_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .pix_chan2_rsc_dat(pix_chan2_rsc_dat),
      .pix_chan2_rsc_vld(pix_chan2_rsc_vld),
      .pix_chan2_rsc_rdy(pix_chan2_rsc_rdy),
      .run_wen(run_wen),
      .pix_chan2_rsci_oswt(reg_pix_chan2_rsci_oswt_cse),
      .pix_chan2_rsci_wen_comp(pix_chan2_rsci_wen_comp)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .run_wen(run_wen),
      .dat_out_rsci_oswt(reg_dat_out_rsci_oswt_cse),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_idat(nl_EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_inst_dat_out_rsci_idat[33:0])
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_widthIn_triosy_obj EdgeDetect_IP_EdgeDetect_MagAng_run_widthIn_triosy_obj_inst
      (
      .widthIn_triosy_lz(widthIn_triosy_lz),
      .run_wten(run_wten),
      .widthIn_triosy_obj_iswt0(reg_widthIn_triosy_obj_iswt0_cse)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_heightIn_triosy_obj EdgeDetect_IP_EdgeDetect_MagAng_run_heightIn_triosy_obj_inst
      (
      .heightIn_triosy_lz(heightIn_triosy_lz),
      .run_wten(run_wten),
      .heightIn_triosy_obj_iswt0(reg_widthIn_triosy_obj_iswt0_cse)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_sw_in_triosy_obj EdgeDetect_IP_EdgeDetect_MagAng_run_sw_in_triosy_obj_inst
      (
      .sw_in_triosy_lz(sw_in_triosy_lz),
      .run_wten(run_wten),
      .sw_in_triosy_obj_iswt0(reg_widthIn_triosy_obj_iswt0_cse)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_inst
      (
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz),
      .run_wten(run_wten),
      .crc32_pix_in_triosy_obj_iswt0(reg_widthIn_triosy_obj_iswt0_cse)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_inst
      (
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz),
      .run_wten(run_wten),
      .crc32_dat_out_triosy_obj_iswt0(reg_widthIn_triosy_obj_iswt0_cse)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_staller EdgeDetect_IP_EdgeDetect_MagAng_run_staller_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .run_wten(run_wten),
      .dx_in_rsci_wen_comp(dx_in_rsci_wen_comp),
      .dy_in_rsci_wen_comp(dy_in_rsci_wen_comp),
      .pix_chan2_rsci_wen_comp(pix_chan2_rsci_wen_comp),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .MCOL_C_0_tr0(nl_EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_inst_MCOL_C_0_tr0),
      .MROW_C_0_tr0(MROW_equal_tmp)
    );
  assign MCOL_and_cse = run_wen & (fsm_output[1]) & MCOL_stage_0_2 & MCOL_for_i_slc_MCOL_for_i_2_0_2_itm_1;
  assign MCOL_and_6_cse = run_wen & MCOL_stage_0;
  assign dy_and_cse = run_wen & MCOL_stage_0 & (~ exitL_exit_MCOL_for_sva) & (~(or_dcpl_22
      | (~ MCOL_for_asn_4_itm_1)));
  assign MROW_y_or_cse = (fsm_output[0]) | (fsm_output[2]);
  assign MCOL_and_7_cse = run_wen & (MCOL_for_acc_2_tmp[2]) & MCOL_stage_0;
  assign asum_and_cse = run_wen & (fsm_output[1]);
  assign MCOL_for_not_6_nl = ~ exitL_exit_MCOL_for_sva;
  assign MCOL_for_i_2_0_lpi_3_dfm_1_0_1 = MUX_v_2_2_2(2'b00, MCOL_for_i_2_0_lpi_3_1_0,
      MCOL_for_not_6_nl);
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_din_sva_1 = MUX_v_9_4_2((dx_lpi_3_dfm_mx0[8:0]),
      (dx_lpi_3_dfm_mx0[17:9]), (dx_lpi_3_dfm_mx0[26:18]), (dx_lpi_3_dfm_mx0[35:27]),
      MCOL_for_i_2_0_lpi_3_dfm_1_1_0);
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_din_1_sva_1 = MUX_v_9_4_2((dy_lpi_3_dfm_mx0[8:0]),
      (dy_lpi_3_dfm_mx0[17:9]), (dy_lpi_3_dfm_mx0[26:18]), (dy_lpi_3_dfm_mx0[35:27]),
      MCOL_for_i_2_0_lpi_3_dfm_1_1_0);
  assign nl_operator_9_true_operator_9_true_operator_9_true_acc_nl =  -(EdgeDetect_IP_EdgeDetect_MagAng_abs_din_sva_1[7:0]);
  assign operator_9_true_operator_9_true_operator_9_true_acc_nl = nl_operator_9_true_operator_9_true_operator_9_true_acc_nl[7:0];
  assign nl_operator_9_true_acc_nl =  -conv_s2s_9_10(EdgeDetect_IP_EdgeDetect_MagAng_abs_din_sva_1);
  assign operator_9_true_acc_nl = nl_operator_9_true_acc_nl[9:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_nl = MUX_v_8_2_2(operator_9_true_operator_9_true_operator_9_true_acc_nl,
      (EdgeDetect_IP_EdgeDetect_MagAng_abs_din_sva_1[7:0]), readslicef_10_1_9(operator_9_true_acc_nl));
  assign nl_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl =  -(EdgeDetect_IP_EdgeDetect_MagAng_abs_din_1_sva_1[7:0]);
  assign operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl = nl_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl[7:0];
  assign nl_operator_9_true_1_acc_nl =  -conv_s2s_9_10(EdgeDetect_IP_EdgeDetect_MagAng_abs_din_1_sva_1);
  assign operator_9_true_1_acc_nl = nl_operator_9_true_1_acc_nl[9:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_nl = MUX_v_8_2_2(operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl,
      (EdgeDetect_IP_EdgeDetect_MagAng_abs_din_1_sva_1[7:0]), readslicef_10_1_9(operator_9_true_1_acc_nl));
  assign nl_MCOL_for_acc_1_ctmp_sva_1 = EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_nl
      + EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_nl;
  assign MCOL_for_acc_1_ctmp_sva_1 = nl_MCOL_for_acc_1_ctmp_sva_1[7:0];
  assign dy_lpi_3_dfm_mx0 = MUX_v_36_2_2(dy_lpi_3, dy_in_rsci_idat_mxwt, MCOL_for_asn_4_itm_1);
  assign dx_lpi_3_dfm_mx0 = MUX_v_36_2_2(dx_lpi_3, dx_in_rsci_idat_mxwt, MCOL_for_asn_4_itm_1);
  assign MCOL_equal_2_tmp = MCOL_x_sva == ({{1{z_out_1[8]}}, z_out_1});
  assign nl_MCOL_for_acc_2_tmp = conv_u2s_2_3(MCOL_for_i_2_0_lpi_3_dfm_1_0_1) + 3'b001;
  assign MCOL_for_acc_2_tmp = nl_MCOL_for_acc_2_tmp[2:0];
  assign MROW_equal_tmp = MROW_y_sva == (z_out_1);
  assign or_dcpl = exitL_exit_MCOL_for_sva | (~ (MCOL_for_i_2_0_lpi_3_1_0[1]));
  assign or_dcpl_2 = (MCOL_for_acc_2_tmp[2:1]!=2'b01);
  assign or_dcpl_6 = (MCOL_for_acc_2_tmp[2:1]!=2'b00);
  assign and_dcpl_12 = MCOL_stage_0_2 & MCOL_for_i_slc_MCOL_for_i_2_0_2_itm_1;
  assign or_dcpl_18 = (MCOL_for_i_2_0_lpi_3_dfm_1_1_0!=2'b00);
  assign or_dcpl_19 = (MCOL_for_i_2_0_lpi_3_dfm_1_1_0!=2'b01);
  assign or_dcpl_20 = ~((MCOL_for_i_2_0_lpi_3_dfm_1_1_0==2'b11));
  assign or_dcpl_21 = (MCOL_for_i_2_0_lpi_3_dfm_1_1_0!=2'b10);
  assign or_dcpl_22 = (~ MCOL_stage_0_2) | MCOL_asn_12_itm_1;
  assign or_dcpl_28 = ~((~(MCOL_asn_12_itm_1 & MCOL_stage_0)) & MCOL_stage_0_2);
  assign dat_out_rsci_idat_7_0_mx0c1 = and_dcpl_12 & or_dcpl_18 & (fsm_output[1]);
  assign dat_out_rsci_idat_15_8_mx0c1 = and_dcpl_12 & or_dcpl_19 & (fsm_output[1]);
  assign dat_out_rsci_idat_31_24_mx0c1 = and_dcpl_12 & or_dcpl_20 & (fsm_output[1]);
  assign dat_out_rsci_idat_23_16_mx0c1 = and_dcpl_12 & or_dcpl_21 & (fsm_output[1]);
  always @(posedge clk) begin
    if ( MCOL_and_cse ) begin
      dat_out_rsci_idat_33 <= MCOL_equal_itm_1;
      dat_out_rsci_idat_32 <= MCOL_MCOL_nor_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((and_dcpl_12 & (MCOL_for_i_2_0_lpi_3_dfm_1_1_0==2'b00) & (fsm_output[1]))
        | dat_out_rsci_idat_7_0_mx0c1) ) begin
      dat_out_rsci_idat_7_0 <= MUX_v_8_2_2(MCOL_for_acc_1_ctmp_sva_1, asum_0_lpi_3,
          dat_out_rsci_idat_7_0_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((and_dcpl_12 & (MCOL_for_i_2_0_lpi_3_dfm_1_1_0==2'b01) & (fsm_output[1]))
        | dat_out_rsci_idat_15_8_mx0c1) ) begin
      dat_out_rsci_idat_15_8 <= MUX_v_8_2_2(MCOL_for_acc_1_ctmp_sva_1, asum_1_lpi_3,
          dat_out_rsci_idat_15_8_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((and_dcpl_12 & (MCOL_for_i_2_0_lpi_3_dfm_1_1_0==2'b11) & (fsm_output[1]))
        | dat_out_rsci_idat_31_24_mx0c1) ) begin
      dat_out_rsci_idat_31_24 <= MUX_v_8_2_2(MCOL_for_acc_1_ctmp_sva_1, asum_3_lpi_3,
          dat_out_rsci_idat_31_24_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((and_dcpl_12 & (MCOL_for_i_2_0_lpi_3_dfm_1_1_0==2'b10) & (fsm_output[1]))
        | dat_out_rsci_idat_23_16_mx0c1) ) begin
      dat_out_rsci_idat_23_16 <= MUX_v_8_2_2(MCOL_for_acc_1_ctmp_sva_1, asum_2_lpi_3,
          dat_out_rsci_idat_23_16_mx0c1);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      MCOL_asn_12_itm_1 <= 1'b0;
      MCOL_for_i_slc_MCOL_for_i_2_0_2_itm_1 <= 1'b0;
      MCOL_for_i_2_0_lpi_3_dfm_1_1_0 <= 2'b00;
      MCOL_for_asn_4_itm_1 <= 1'b0;
    end
    else if ( rst ) begin
      MCOL_asn_12_itm_1 <= 1'b0;
      MCOL_for_i_slc_MCOL_for_i_2_0_2_itm_1 <= 1'b0;
      MCOL_for_i_2_0_lpi_3_dfm_1_1_0 <= 2'b00;
      MCOL_for_asn_4_itm_1 <= 1'b0;
    end
    else if ( MCOL_and_6_cse ) begin
      MCOL_asn_12_itm_1 <= MCOL_equal_2_tmp & (MCOL_for_acc_2_tmp[2]);
      MCOL_for_i_slc_MCOL_for_i_2_0_2_itm_1 <= MCOL_for_acc_2_tmp[2];
      MCOL_for_i_2_0_lpi_3_dfm_1_1_0 <= MCOL_for_i_2_0_lpi_3_dfm_1_0_1;
      MCOL_for_asn_4_itm_1 <= exitL_exit_MCOL_for_sva;
    end
  end
  always @(posedge clk) begin
    if ( dy_and_cse ) begin
      dy_lpi_3 <= dy_in_rsci_idat_mxwt;
      dx_lpi_3 <= dx_in_rsci_idat_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( run_wen & MROW_y_or_cse ) begin
      MROW_y_sva <= MUX_v_9_2_2(9'b000000000, (z_out[8:0]), MROW_y_not_1_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      MCOL_stage_0 <= 1'b0;
      exitL_exit_MCOL_for_sva <= 1'b0;
      MCOL_stage_0_2 <= 1'b0;
      reg_dx_in_rsci_oswt_cse <= 1'b0;
      reg_pix_chan2_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
      reg_widthIn_triosy_obj_iswt0_cse <= 1'b0;
    end
    else if ( rst ) begin
      MCOL_stage_0 <= 1'b0;
      exitL_exit_MCOL_for_sva <= 1'b0;
      MCOL_stage_0_2 <= 1'b0;
      reg_dx_in_rsci_oswt_cse <= 1'b0;
      reg_pix_chan2_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
      reg_widthIn_triosy_obj_iswt0_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      MCOL_stage_0 <= (MCOL_stage_0 & (~((MCOL_for_acc_2_tmp[2]) & MCOL_equal_2_tmp)))
          | MROW_y_or_cse;
      exitL_exit_MCOL_for_sva <= (~(MCOL_equal_2_tmp | (~ (MCOL_for_acc_2_tmp[2]))))
          | MROW_y_or_cse;
      MCOL_stage_0_2 <= MCOL_stage_0 & (~ MROW_y_or_cse);
      reg_dx_in_rsci_oswt_cse <= MCOL_stage_0 & exitL_exit_MCOL_for_sva & (fsm_output[1]);
      reg_pix_chan2_rsci_oswt_cse <= MCOL_stage_0 & (MCOL_for_acc_2_tmp[2]) & (fsm_output[1]);
      reg_dat_out_rsci_oswt_cse <= and_dcpl_12 & (fsm_output[1]);
      reg_widthIn_triosy_obj_iswt0_cse <= MROW_equal_tmp & (fsm_output[2]);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((MCOL_for_acc_2_tmp[2]) | MROW_y_or_cse) ) begin
      MCOL_x_sva <= MUX_v_10_2_2(10'b0000000000, z_out, not_40_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      MCOL_for_i_2_0_lpi_3_1_0 <= 2'b00;
    end
    else if ( rst ) begin
      MCOL_for_i_2_0_lpi_3_1_0 <= 2'b00;
    end
    else if ( run_wen & (~ (MCOL_for_acc_2_tmp[2])) & MCOL_stage_0 ) begin
      MCOL_for_i_2_0_lpi_3_1_0 <= MCOL_for_acc_2_tmp[1:0];
    end
  end
  always @(posedge clk) begin
    if ( MCOL_and_7_cse ) begin
      MCOL_equal_itm_1 <= MCOL_x_sva == ({operator_10_false_acc_nl , (widthIn_rsci_idat[1:0])});
      MCOL_MCOL_nor_itm_1 <= ~((MROW_y_sva!=9'b000000000) | (MCOL_x_sva!=10'b0000000000));
    end
  end
  always @(posedge clk) begin
    if ( asum_and_cse & (~((~((or_dcpl_2 | (~ (MCOL_for_acc_2_tmp[0]))) & (or_dcpl
        | (~ (MCOL_for_i_2_0_lpi_3_1_0[0]))))) & MCOL_stage_0)) & (~(or_dcpl_28 |
        or_dcpl_20)) ) begin
      asum_3_lpi_3 <= MCOL_for_acc_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( run_wen & (or_dcpl_6 | (MCOL_for_acc_2_tmp[0])) & MCOL_stage_0 & (~((~((MCOL_for_i_2_0_lpi_3_1_0!=2'b00)))
        | exitL_exit_MCOL_for_sva)) & (~(or_dcpl_22 | or_dcpl_18)) ) begin
      asum_0_lpi_3 <= MCOL_for_acc_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( asum_and_cse & (~((~((or_dcpl_2 | (MCOL_for_acc_2_tmp[0])) & (or_dcpl |
        (MCOL_for_i_2_0_lpi_3_1_0[0])))) & MCOL_stage_0)) & (~(or_dcpl_28 | or_dcpl_21))
        ) begin
      asum_2_lpi_3 <= MCOL_for_acc_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( asum_and_cse & (~((~((or_dcpl_6 | (~ (MCOL_for_acc_2_tmp[0]))) & (exitL_exit_MCOL_for_sva
        | (MCOL_for_i_2_0_lpi_3_1_0!=2'b01)))) & MCOL_stage_0)) & (~(or_dcpl_28 |
        or_dcpl_19)) ) begin
      asum_1_lpi_3 <= MCOL_for_acc_1_ctmp_sva_1;
    end
  end
  assign MROW_y_not_1_nl = ~ (fsm_output[0]);
  assign not_40_nl = ~ MROW_y_or_cse;
  assign nl_operator_10_false_acc_nl = (widthIn_rsci_idat[9:2]) + 8'b11111111;
  assign operator_10_false_acc_nl = nl_operator_10_false_acc_nl[7:0];
  assign MROW_MROW_and_1_nl = (MCOL_x_sva[9]) & (fsm_output[1]);
  assign MROW_mux_2_nl = MUX_v_9_2_2(MROW_y_sva, (MCOL_x_sva[8:0]), fsm_output[1]);
  assign nl_z_out = ({MROW_MROW_and_1_nl , MROW_mux_2_nl}) + 10'b0000000001;
  assign z_out = nl_z_out[9:0];
  assign operator_11_true_operator_11_true_and_1_nl = (heightIn_rsci_idat[8]) & (fsm_output[2]);
  assign operator_11_true_mux_2_nl = MUX_v_8_2_2((widthIn_rsci_idat[9:2]), (heightIn_rsci_idat[7:0]),
      fsm_output[2]);
  assign nl_z_out_1 = ({operator_11_true_operator_11_true_and_1_nl , operator_11_true_mux_2_nl})
      + 9'b111111111;
  assign z_out_1 = nl_z_out_1[8:0];

  function automatic [9:0] MUX_v_10_2_2;
    input [9:0] input_0;
    input [9:0] input_1;
    input  sel;
    reg [9:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_10_2_2 = result;
  end
  endfunction


  function automatic [1:0] MUX_v_2_2_2;
    input [1:0] input_0;
    input [1:0] input_1;
    input  sel;
    reg [1:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_2_2_2 = result;
  end
  endfunction


  function automatic [35:0] MUX_v_36_2_2;
    input [35:0] input_0;
    input [35:0] input_1;
    input  sel;
    reg [35:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_36_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_2_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input  sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_4_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input [8:0] input_2;
    input [8:0] input_3;
    input [1:0] sel;
    reg [8:0] result;
  begin
    case (sel)
      2'b00 : begin
        result = input_0;
      end
      2'b01 : begin
        result = input_1;
      end
      2'b10 : begin
        result = input_2;
      end
      default : begin
        result = input_3;
      end
    endcase
    MUX_v_9_4_2 = result;
  end
  endfunction


  function automatic [0:0] readslicef_10_1_9;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 9;
    readslicef_10_1_9 = tmp[0:0];
  end
  endfunction


  function automatic [9:0] conv_s2s_9_10 ;
    input [8:0]  vector ;
  begin
    conv_s2s_9_10 = {vector[8], vector};
  end
  endfunction


  function automatic [2:0] conv_u2s_2_3 ;
    input [1:0]  vector ;
  begin
    conv_u2s_2_3 =  {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_struct
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_struct (
  clk, rst, arst_n, dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, dy_in_rsc_dat, dy_in_rsc_vld,
      dy_in_rsc_rdy, pix_chan2_rsc_dat_eol, pix_chan2_rsc_dat_sof, pix_chan2_rsc_dat_pix,
      pix_chan2_rsc_vld, pix_chan2_rsc_rdy, widthIn_rsc_dat, widthIn_triosy_lz, heightIn_rsc_dat,
      heightIn_triosy_lz, sw_in_rsc_dat, sw_in_triosy_lz, crc32_pix_in_rsc_dat, crc32_pix_in_triosy_lz,
      crc32_dat_out_rsc_dat, crc32_dat_out_triosy_lz, dat_out_rsc_dat_eol, dat_out_rsc_dat_sof,
      dat_out_rsc_dat_pix, dat_out_rsc_vld, dat_out_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input pix_chan2_rsc_dat_eol;
  input pix_chan2_rsc_dat_sof;
  input [31:0] pix_chan2_rsc_dat_pix;
  input pix_chan2_rsc_vld;
  output pix_chan2_rsc_rdy;
  input [9:0] widthIn_rsc_dat;
  output widthIn_triosy_lz;
  input [8:0] heightIn_rsc_dat;
  output heightIn_triosy_lz;
  input sw_in_rsc_dat;
  output sw_in_triosy_lz;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_triosy_lz;
  output dat_out_rsc_dat_eol;
  output dat_out_rsc_dat_sof;
  output [31:0] dat_out_rsc_dat_pix;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;


  // Interconnect Declarations
  wire [33:0] dat_out_rsc_dat;


  // Interconnect Declarations for Component Instantiations 
  wire [33:0] nl_EdgeDetect_IP_EdgeDetect_MagAng_run_inst_pix_chan2_rsc_dat;
  assign nl_EdgeDetect_IP_EdgeDetect_MagAng_run_inst_pix_chan2_rsc_dat = {pix_chan2_rsc_dat_eol
      , pix_chan2_rsc_dat_sof , pix_chan2_rsc_dat_pix};
  EdgeDetect_IP_EdgeDetect_MagAng_run EdgeDetect_IP_EdgeDetect_MagAng_run_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsc_dat(dx_in_rsc_dat),
      .dx_in_rsc_vld(dx_in_rsc_vld),
      .dx_in_rsc_rdy(dx_in_rsc_rdy),
      .dy_in_rsc_dat(dy_in_rsc_dat),
      .dy_in_rsc_vld(dy_in_rsc_vld),
      .dy_in_rsc_rdy(dy_in_rsc_rdy),
      .pix_chan2_rsc_dat(nl_EdgeDetect_IP_EdgeDetect_MagAng_run_inst_pix_chan2_rsc_dat[33:0]),
      .pix_chan2_rsc_vld(pix_chan2_rsc_vld),
      .pix_chan2_rsc_rdy(pix_chan2_rsc_rdy),
      .widthIn_rsc_dat(widthIn_rsc_dat),
      .widthIn_triosy_lz(widthIn_triosy_lz),
      .heightIn_rsc_dat(heightIn_rsc_dat),
      .heightIn_triosy_lz(heightIn_triosy_lz),
      .sw_in_triosy_lz(sw_in_triosy_lz),
      .crc32_pix_in_rsc_dat(crc32_pix_in_rsc_dat),
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz),
      .crc32_dat_out_rsc_dat(crc32_dat_out_rsc_dat),
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy)
    );
  assign dat_out_rsc_dat_pix = dat_out_rsc_dat[31:0];
  assign dat_out_rsc_dat_sof = dat_out_rsc_dat[32];
  assign dat_out_rsc_dat_eol = dat_out_rsc_dat[33];
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng (
  clk, rst, arst_n, dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, dy_in_rsc_dat, dy_in_rsc_vld,
      dy_in_rsc_rdy, pix_chan2_rsc_dat, pix_chan2_rsc_vld, pix_chan2_rsc_rdy, widthIn_rsc_dat,
      widthIn_triosy_lz, heightIn_rsc_dat, heightIn_triosy_lz, sw_in, sw_in_triosy_lz,
      crc32_pix_in_rsc_zout, crc32_pix_in_triosy_lz, crc32_dat_out_rsc_zout, crc32_dat_out_triosy_lz,
      dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input [33:0] pix_chan2_rsc_dat;
  input pix_chan2_rsc_vld;
  output pix_chan2_rsc_rdy;
  input [9:0] widthIn_rsc_dat;
  output widthIn_triosy_lz;
  input [8:0] heightIn_rsc_dat;
  output heightIn_triosy_lz;
  input sw_in;
  output sw_in_triosy_lz;
  output [31:0] crc32_pix_in_rsc_zout;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_zout;
  output crc32_dat_out_triosy_lz;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;


  // Interconnect Declarations
  wire dat_out_rsc_dat_eol;
  wire dat_out_rsc_dat_sof;
  wire [31:0] dat_out_rsc_dat_pix;


  // Interconnect Declarations for Component Instantiations 
  wire  nl_EdgeDetect_IP_EdgeDetect_MagAng_struct_inst_pix_chan2_rsc_dat_eol;
  assign nl_EdgeDetect_IP_EdgeDetect_MagAng_struct_inst_pix_chan2_rsc_dat_eol = pix_chan2_rsc_dat[33];
  wire  nl_EdgeDetect_IP_EdgeDetect_MagAng_struct_inst_pix_chan2_rsc_dat_sof;
  assign nl_EdgeDetect_IP_EdgeDetect_MagAng_struct_inst_pix_chan2_rsc_dat_sof = pix_chan2_rsc_dat[32];
  wire [31:0] nl_EdgeDetect_IP_EdgeDetect_MagAng_struct_inst_pix_chan2_rsc_dat_pix;
  assign nl_EdgeDetect_IP_EdgeDetect_MagAng_struct_inst_pix_chan2_rsc_dat_pix = pix_chan2_rsc_dat[31:0];
  EdgeDetect_IP_EdgeDetect_MagAng_struct EdgeDetect_IP_EdgeDetect_MagAng_struct_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsc_dat(dx_in_rsc_dat),
      .dx_in_rsc_vld(dx_in_rsc_vld),
      .dx_in_rsc_rdy(dx_in_rsc_rdy),
      .dy_in_rsc_dat(dy_in_rsc_dat),
      .dy_in_rsc_vld(dy_in_rsc_vld),
      .dy_in_rsc_rdy(dy_in_rsc_rdy),
      .pix_chan2_rsc_dat_eol(nl_EdgeDetect_IP_EdgeDetect_MagAng_struct_inst_pix_chan2_rsc_dat_eol),
      .pix_chan2_rsc_dat_sof(nl_EdgeDetect_IP_EdgeDetect_MagAng_struct_inst_pix_chan2_rsc_dat_sof),
      .pix_chan2_rsc_dat_pix(nl_EdgeDetect_IP_EdgeDetect_MagAng_struct_inst_pix_chan2_rsc_dat_pix[31:0]),
      .pix_chan2_rsc_vld(pix_chan2_rsc_vld),
      .pix_chan2_rsc_rdy(pix_chan2_rsc_rdy),
      .widthIn_rsc_dat(widthIn_rsc_dat),
      .widthIn_triosy_lz(widthIn_triosy_lz),
      .heightIn_rsc_dat(heightIn_rsc_dat),
      .heightIn_triosy_lz(heightIn_triosy_lz),
      .sw_in_rsc_dat(1'b0),
      .sw_in_triosy_lz(sw_in_triosy_lz),
      .crc32_pix_in_rsc_dat(crc32_pix_in_rsc_dat),
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz),
      .crc32_dat_out_rsc_dat(crc32_dat_out_rsc_dat),
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz),
      .dat_out_rsc_dat_eol(dat_out_rsc_dat_eol),
      .dat_out_rsc_dat_sof(dat_out_rsc_dat_sof),
      .dat_out_rsc_dat_pix(dat_out_rsc_dat_pix),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy)
    );
  assign dat_out_rsc_dat = {dat_out_rsc_dat_eol , dat_out_rsc_dat_sof , dat_out_rsc_dat_pix};
endmodule




//------> /usr/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_wait_coupled_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_wait_coupled_v1 (idat, rdy, ivld, dat, irdy, vld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  output             rdy;
  output             ivld;
  input  [width-1:0] dat;
  input              irdy;
  input              vld;

  wire   [width-1:0] idat;
  wire               rdy;
  wire               ivld;

  assign idat = dat;
  assign rdy = irdy;
  assign ivld = vld;

endmodule


//------> ../EdgeDetect_IP_EdgeDetect_HorDer.v1/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.2/1059873 Production Release
//  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
// 
//  Generated by:   m11102154@cad27
//  Generated date: Sat Apr  6 14:36:54 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm (
  clk, rst, arst_n, run_wen, fsm_output, HCOL_C_0_tr0, HROW_C_0_tr0
);
  input clk;
  input rst;
  input arst_n;
  input run_wen;
  output [3:0] fsm_output;
  reg [3:0] fsm_output;
  input HCOL_C_0_tr0;
  input HROW_C_0_tr0;


  // FSM State Type Declaration for EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    HCOL_C_0 = 2'd1,
    HROW_C_0 = 2'd2,
    main_C_1 = 2'd3;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_1
    case (state_var)
      HCOL_C_0 : begin
        fsm_output = 4'b0010;
        if ( HCOL_C_0_tr0 ) begin
          state_var_NS = HROW_C_0;
        end
        else begin
          state_var_NS = HCOL_C_0;
        end
      end
      HROW_C_0 : begin
        fsm_output = 4'b0100;
        if ( HROW_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = HCOL_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 4'b1000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 4'b0001;
        state_var_NS = HCOL_C_0;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= main_C_0;
    end
    else if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_staller
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_staller (
  run_wen, dat_in_rsci_wen_comp, dat_out_rsci_wen_comp, dx_rsci_wen_comp
);
  output run_wen;
  input dat_in_rsci_wen_comp;
  input dat_out_rsci_wen_comp;
  input dx_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = dat_in_rsci_wen_comp & dat_out_rsci_wen_comp & dx_rsci_wen_comp;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp (
  clk, rst, arst_n, dx_rsci_oswt, dx_rsci_wen_comp, dx_rsci_biwt, dx_rsci_bdwt, dx_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dx_rsci_oswt;
  output dx_rsci_wen_comp;
  input dx_rsci_biwt;
  input dx_rsci_bdwt;
  output dx_rsci_bcwt;
  reg dx_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dx_rsci_wen_comp = (~ dx_rsci_oswt) | dx_rsci_biwt | dx_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dx_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dx_rsci_bcwt <= 1'b0;
    end
    else begin
      dx_rsci_bcwt <= ~((~(dx_rsci_bcwt | dx_rsci_biwt)) | dx_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl (
  run_wen, dx_rsci_oswt, dx_rsci_biwt, dx_rsci_bdwt, dx_rsci_bcwt, dx_rsci_irdy,
      dx_rsci_ivld_run_sct
);
  input run_wen;
  input dx_rsci_oswt;
  output dx_rsci_biwt;
  output dx_rsci_bdwt;
  input dx_rsci_bcwt;
  input dx_rsci_irdy;
  output dx_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dx_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dx_rsci_bdwt = dx_rsci_oswt & run_wen;
  assign dx_rsci_biwt = dx_rsci_ogwt & dx_rsci_irdy;
  assign dx_rsci_ogwt = dx_rsci_oswt & (~ dx_rsci_bcwt);
  assign dx_rsci_ivld_run_sct = dx_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_dp (
  clk, rst, arst_n, dat_out_rsci_oswt, dat_out_rsci_wen_comp, dat_out_rsci_biwt,
      dat_out_rsci_bdwt, dat_out_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input dat_out_rsci_biwt;
  input dat_out_rsci_bdwt;
  output dat_out_rsci_bcwt;
  reg dat_out_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_wen_comp = (~ dat_out_rsci_oswt) | dat_out_rsci_biwt | dat_out_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else begin
      dat_out_rsci_bcwt <= ~((~(dat_out_rsci_bcwt | dat_out_rsci_biwt)) | dat_out_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_ctrl (
  run_wen, dat_out_rsci_oswt, dat_out_rsci_biwt, dat_out_rsci_bdwt, dat_out_rsci_bcwt,
      dat_out_rsci_irdy, dat_out_rsci_ivld_run_sct
);
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_biwt;
  output dat_out_rsci_bdwt;
  input dat_out_rsci_bcwt;
  input dat_out_rsci_irdy;
  output dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dat_out_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_bdwt = dat_out_rsci_oswt & run_wen;
  assign dat_out_rsci_biwt = dat_out_rsci_ogwt & dat_out_rsci_irdy;
  assign dat_out_rsci_ogwt = dat_out_rsci_oswt & (~ dat_out_rsci_bcwt);
  assign dat_out_rsci_ivld_run_sct = dat_out_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci_dat_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci_dat_in_wait_ctrl (
  run_wen, dat_in_rsci_iswt0, dat_in_rsci_irdy_run_sct
);
  input run_wen;
  input dat_in_rsci_iswt0;
  output dat_in_rsci_irdy_run_sct;



  // Interconnect Declarations for Component Instantiations 
  assign dat_in_rsci_irdy_run_sct = dat_in_rsci_iswt0 & run_wen;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci (
  clk, rst, arst_n, dx_rsc_dat, dx_rsc_vld, dx_rsc_rdy, run_wen, dx_rsci_oswt, dx_rsci_wen_comp,
      dx_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [35:0] dx_rsc_dat;
  output dx_rsc_vld;
  input dx_rsc_rdy;
  input run_wen;
  input dx_rsci_oswt;
  output dx_rsci_wen_comp;
  input [35:0] dx_rsci_idat;


  // Interconnect Declarations
  wire dx_rsci_biwt;
  wire dx_rsci_bdwt;
  wire dx_rsci_bcwt;
  wire dx_rsci_irdy;
  wire dx_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd5),
  .width(32'sd36)) dx_rsci (
      .irdy(dx_rsci_irdy),
      .ivld(dx_rsci_ivld_run_sct),
      .idat(dx_rsci_idat),
      .rdy(dx_rsc_rdy),
      .vld(dx_rsc_vld),
      .dat(dx_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dx_rsci_oswt(dx_rsci_oswt),
      .dx_rsci_biwt(dx_rsci_biwt),
      .dx_rsci_bdwt(dx_rsci_bdwt),
      .dx_rsci_bcwt(dx_rsci_bcwt),
      .dx_rsci_irdy(dx_rsci_irdy),
      .dx_rsci_ivld_run_sct(dx_rsci_ivld_run_sct)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_rsci_oswt(dx_rsci_oswt),
      .dx_rsci_wen_comp(dx_rsci_wen_comp),
      .dx_rsci_biwt(dx_rsci_biwt),
      .dx_rsci_bdwt(dx_rsci_bdwt),
      .dx_rsci_bcwt(dx_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci (
  clk, rst, arst_n, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, run_wen, dat_out_rsci_oswt,
      dat_out_rsci_wen_comp, dat_out_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input [33:0] dat_out_rsci_idat;


  // Interconnect Declarations
  wire dat_out_rsci_biwt;
  wire dat_out_rsci_bdwt;
  wire dat_out_rsci_bcwt;
  wire dat_out_rsci_irdy;
  wire dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd4),
  .width(32'sd34)) dat_out_rsci (
      .irdy(dat_out_rsci_irdy),
      .ivld(dat_out_rsci_ivld_run_sct),
      .idat(dat_out_rsci_idat),
      .rdy(dat_out_rsc_rdy),
      .vld(dat_out_rsc_vld),
      .dat(dat_out_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_ctrl EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt),
      .dat_out_rsci_irdy(dat_out_rsci_irdy),
      .dat_out_rsci_ivld_run_sct(dat_out_rsci_ivld_run_sct)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_dp EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci (
  dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, run_wen, dat_in_rsci_oswt, dat_in_rsci_wen_comp,
      dat_in_rsci_idat_mxwt
);
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input run_wen;
  input dat_in_rsci_oswt;
  output dat_in_rsci_wen_comp;
  output [33:0] dat_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dat_in_rsci_irdy_run_sct;
  wire dat_in_rsci_ivld;
  wire [33:0] dat_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_coupled_v1 #(.rscid(32'sd1),
  .width(32'sd34)) dat_in_rsci (
      .rdy(dat_in_rsc_rdy),
      .vld(dat_in_rsc_vld),
      .dat(dat_in_rsc_dat),
      .irdy(dat_in_rsci_irdy_run_sct),
      .ivld(dat_in_rsci_ivld),
      .idat(dat_in_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci_dat_in_wait_ctrl EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci_dat_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_in_rsci_iswt0(dat_in_rsci_oswt),
      .dat_in_rsci_irdy_run_sct(dat_in_rsci_irdy_run_sct)
    );
  assign dat_in_rsci_idat_mxwt = dat_in_rsci_idat;
  assign dat_in_rsci_wen_comp = (~ dat_in_rsci_oswt) | dat_in_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, dx_rsc_dat, dx_rsc_vld,
      dx_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dx_rsc_dat;
  output dx_rsc_vld;
  input dx_rsc_rdy;


  // Interconnect Declarations
  wire run_wen;
  wire dat_in_rsci_wen_comp;
  wire [33:0] dat_in_rsci_idat_mxwt;
  wire dat_out_rsci_wen_comp;
  wire dx_rsci_wen_comp;
  reg dat_out_rsci_idat_33;
  reg dat_out_rsci_idat_32;
  reg [31:0] dat_out_rsci_idat_31_0;
  reg [8:0] dx_rsci_idat_35_27;
  reg [8:0] dx_rsci_idat_26_18;
  reg [8:0] dx_rsci_idat_17_9;
  wire [9:0] nl_dx_rsci_idat_17_9;
  reg [8:0] dx_rsci_idat_8_0;
  wire [3:0] fsm_output;
  wire HCOL_if_4_equal_tmp;
  wire HCOL_else_1_if_equal_tmp;
  wire HCOL_else_1_HCOL_else_1_if_and_tmp;
  wire or_dcpl_5;
  wire or_dcpl_7;
  wire or_dcpl_9;
  wire or_dcpl_29;
  wire or_dcpl_32;
  wire mux_tmp;
  wire or_tmp_13;
  wire HCOL_else_1_if_nor_itm_1;
  reg HCOL_unequal_tmp_1;
  reg [9:0] HCOL_x_sva;
  reg HCOL_stage_0;
  reg HCOL_asn_15_itm_1;
  reg HCOL_stage_0_2;
  reg [9:0] HCOL_asn_11_itm_1;
  reg HCOL_else_1_if_nor_itm_1_1;
  reg HCOL_asn_15_itm_2;
  reg HCOL_stage_0_3;
  reg HCOL_if_slc_HCOL_acc_10_svs_1;
  wire HCOL_if_2_and_cse;
  wire HCOL_if_2_and_1_cse;
  wire HCOL_if_2_and_4_cse;
  reg reg_dat_in_rsci_oswt_cse;
  reg reg_dat_out_rsci_oswt_cse;
  wire and_45_m1c;
  reg [33:0] dat_in_crt_lpi_3;
  wire [8:0] z_out;
  wire [9:0] nl_z_out;
  wire [9:0] z_out_1;
  wire [10:0] nl_z_out_1;
  wire [8:0] z_out_4;
  reg [8:0] HROW_y_sva;
  reg [31:0] pix_buf0_pix_lpi_3;
  reg pix_buf0_sof_lpi_3;
  reg pix_buf0_eol_lpi_3;
  reg [8:0] HCOL_else_1_else_ac_int_cctor_3_lpi_3;
  reg [8:0] HCOL_else_1_else_ac_int_cctor_3_lpi_3_dfm_1;
  reg [7:0] HCOL_else_1_if_slc_HCOL_x_7_0_itm_1;
  wire [23:0] pix_buf0_pix_lpi_3_mx0_23_0;
  wire [7:0] pix_buf0_pix_lpi_3_mx1_31_24;
  wire [15:0] dat_in_crt_lpi_3_dfm_mx0_15_0;
  wire HCOL_or_1_rgt;
  wire HCOL_else_1_if_and_cse;
  wire HCOL_and_4_cse;
  wire HROW_y_or_cse;
  wire nand_cse;
  wire pix_buf0_eol_and_cse;
  wire and_115_cse;
  wire HCOL_else_1_if_HCOL_else_1_if_or_1_cse;
  wire HCOL_else_1_if_or_cse;
  wire operator_11_true_acc_itm_10_1;

  wire[9:0] acc_2_nl;
  wire[10:0] nl_acc_2_nl;
  wire[7:0] HCOL_else_1_if_mux_6_nl;
  wire[7:0] HCOL_else_1_if_mux_7_nl;
  wire[9:0] acc_3_nl;
  wire[10:0] nl_acc_3_nl;
  wire[7:0] HCOL_else_1_if_mux_8_nl;
  wire[7:0] HCOL_else_1_if_mux_9_nl;
  wire HROW_y_not_1_nl;
  wire not_52_nl;
  wire[10:0] operator_11_true_acc_nl;
  wire[11:0] nl_operator_11_true_acc_nl;
  wire HROW_HROW_or_1_nl;
  wire[7:0] HROW_mux_2_nl;
  wire HCOL_HCOL_and_4_nl;
  wire[8:0] HCOL_mux_8_nl;
  wire[9:0] acc_4_nl;
  wire[10:0] nl_acc_4_nl;
  wire[7:0] operator_8_false_2_mux_3_nl;
  wire and_125_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [33:0] nl_EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_inst_dat_out_rsci_idat;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_inst_dat_out_rsci_idat
      = {dat_out_rsci_idat_33 , dat_out_rsci_idat_32 , dat_out_rsci_idat_31_0};
  wire [35:0] nl_EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_inst_dx_rsci_idat;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_inst_dx_rsci_idat = {dx_rsci_idat_35_27
      , dx_rsci_idat_26_18 , dx_rsci_idat_17_9 , dx_rsci_idat_8_0};
  wire  nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HCOL_C_0_tr0;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HCOL_C_0_tr0 = ~(HCOL_stage_0_2
      | HCOL_stage_0);
  wire  nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HROW_C_0_tr0;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HROW_C_0_tr0 = HROW_y_sva
      == (z_out_1[8:0]);
  EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci_inst
      (
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .run_wen(run_wen),
      .dat_in_rsci_oswt(reg_dat_in_rsci_oswt_cse),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_in_rsci_idat_mxwt(dat_in_rsci_idat_mxwt)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .run_wen(run_wen),
      .dat_out_rsci_oswt(reg_dat_out_rsci_oswt_cse),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_idat(nl_EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_inst_dat_out_rsci_idat[33:0])
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_rsc_dat(dx_rsc_dat),
      .dx_rsc_vld(dx_rsc_vld),
      .dx_rsc_rdy(dx_rsc_rdy),
      .run_wen(run_wen),
      .dx_rsci_oswt(reg_dat_out_rsci_oswt_cse),
      .dx_rsci_wen_comp(dx_rsci_wen_comp),
      .dx_rsci_idat(nl_EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_inst_dx_rsci_idat[35:0])
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_staller EdgeDetect_IP_EdgeDetect_HorDer_run_staller_inst
      (
      .run_wen(run_wen),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dx_rsci_wen_comp(dx_rsci_wen_comp)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .HCOL_C_0_tr0(nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HCOL_C_0_tr0),
      .HROW_C_0_tr0(nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HROW_C_0_tr0)
    );
  assign HCOL_if_2_and_cse = run_wen & ((or_dcpl_29 & HCOL_else_1_HCOL_else_1_if_and_tmp
      & HCOL_stage_0_2 & (fsm_output[1])) | (or_dcpl_29 & nand_cse & HCOL_stage_0_2
      & (fsm_output[1])));
  assign HCOL_if_2_and_1_cse = run_wen & (fsm_output[1]) & (~((HCOL_asn_11_itm_1==10'b0000000000)))
      & HCOL_stage_0_2;
  assign HCOL_if_2_and_4_cse = run_wen & ((or_dcpl_29 & HCOL_stage_0_2 & (~ HCOL_asn_15_itm_2)
      & HCOL_stage_0_3 & (fsm_output[1])) | or_tmp_13);
  assign HCOL_else_1_if_and_cse = run_wen & or_dcpl_9 & HCOL_stage_0;
  assign HCOL_and_4_cse = run_wen & HCOL_stage_0;
  assign HROW_y_or_cse = (fsm_output[0]) | (fsm_output[2]);
  assign pix_buf0_eol_and_cse = run_wen & or_dcpl_9 & ((~ HCOL_stage_0_2) | HCOL_asn_15_itm_1)
      & HCOL_stage_0 & (~ or_dcpl_32);
  assign and_45_m1c = HCOL_stage_0_2 & (~ HCOL_asn_15_itm_1) & HCOL_stage_0;
  assign HCOL_or_1_rgt = ((mux_tmp | (~ HCOL_unequal_tmp_1)) & HCOL_stage_0_2 & (~
      HCOL_stage_0)) | (HCOL_else_1_HCOL_else_1_if_and_tmp & HCOL_unequal_tmp_1 &
      and_45_m1c);
  assign HCOL_else_1_if_nor_itm_1 = ~((HCOL_x_sva[9:8]!=2'b00));
  assign HCOL_if_4_equal_tmp = (HCOL_x_sva[7:0]) == (widthIn[9:2]);
  assign pix_buf0_pix_lpi_3_mx0_23_0 = MUX_v_24_2_2((dat_in_crt_lpi_3[23:0]), (pix_buf0_pix_lpi_3[23:0]),
      or_dcpl_32);
  assign pix_buf0_pix_lpi_3_mx1_31_24 = MUX_v_8_2_2((dat_in_crt_lpi_3[31:24]), (pix_buf0_pix_lpi_3[31:24]),
      or_dcpl_32);
  assign nl_operator_11_true_acc_nl = ({3'b100 , (widthIn[9:2])}) + conv_u2s_10_11(~
      HCOL_x_sva);
  assign operator_11_true_acc_nl = nl_operator_11_true_acc_nl[10:0];
  assign operator_11_true_acc_itm_10_1 = readslicef_11_1_10(operator_11_true_acc_nl);
  assign dat_in_crt_lpi_3_dfm_mx0_15_0 = MUX_v_16_2_2((dat_in_rsci_idat_mxwt[15:0]),
      (dat_in_crt_lpi_3[15:0]), HCOL_if_slc_HCOL_acc_10_svs_1);
  assign HCOL_else_1_if_equal_tmp = HCOL_else_1_if_slc_HCOL_x_7_0_itm_1 == (widthIn[9:2]);
  assign HCOL_else_1_HCOL_else_1_if_and_tmp = HCOL_else_1_if_equal_tmp & HCOL_else_1_if_nor_itm_1_1;
  assign or_dcpl_5 = (HCOL_x_sva[6:5]!=2'b00);
  assign or_dcpl_7 = (HCOL_x_sva[9:7]!=3'b000);
  assign or_dcpl_9 = or_dcpl_7 | or_dcpl_5 | (HCOL_x_sva[4:0]!=5'b00000);
  assign or_dcpl_29 = (HCOL_asn_11_itm_1!=10'b0000000000);
  assign or_dcpl_32 = HCOL_asn_15_itm_2 | (~ HCOL_stage_0_3);
  assign mux_tmp = HCOL_else_1_HCOL_else_1_if_and_tmp & or_dcpl_29;
  assign nand_cse = ~(HCOL_else_1_if_nor_itm_1_1 & HCOL_else_1_if_equal_tmp);
  assign or_tmp_13 = or_dcpl_29 & or_dcpl_32 & HCOL_stage_0_2 & (fsm_output[1]);
  assign and_115_cse = nand_cse & (fsm_output[1]);
  assign HCOL_else_1_if_HCOL_else_1_if_or_1_cse = (z_out[8]) | and_115_cse;
  assign HCOL_else_1_if_or_cse = ~(HCOL_else_1_HCOL_else_1_if_and_tmp & (fsm_output[1]));
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      HCOL_asn_15_itm_2 <= 1'b0;
    end
    else if ( rst ) begin
      HCOL_asn_15_itm_2 <= 1'b0;
    end
    else if ( run_wen & HCOL_stage_0_2 ) begin
      HCOL_asn_15_itm_2 <= HCOL_asn_15_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( HCOL_if_2_and_cse ) begin
      dx_rsci_idat_35_27 <= readslicef_10_9_1(acc_2_nl);
      dx_rsci_idat_26_18 <= readslicef_10_9_1(acc_3_nl);
    end
  end
  always @(posedge clk) begin
    if ( HCOL_if_2_and_1_cse ) begin
      dx_rsci_idat_8_0 <= HCOL_else_1_else_ac_int_cctor_3_lpi_3_dfm_1;
      dx_rsci_idat_17_9 <= nl_dx_rsci_idat_17_9[8:0];
    end
  end
  always @(posedge clk) begin
    if ( HCOL_if_2_and_4_cse ) begin
      dat_out_rsci_idat_33 <= MUX_s_1_2_2((dat_in_crt_lpi_3[33]), pix_buf0_eol_lpi_3,
          or_tmp_13);
      dat_out_rsci_idat_31_0 <= MUX_v_32_2_2((dat_in_crt_lpi_3[31:0]), pix_buf0_pix_lpi_3,
          or_tmp_13);
      dat_out_rsci_idat_32 <= MUX_s_1_2_2((dat_in_crt_lpi_3[32]), pix_buf0_sof_lpi_3,
          or_tmp_13);
    end
  end
  always @(posedge clk) begin
    if ( HCOL_else_1_if_and_cse ) begin
      HCOL_else_1_if_slc_HCOL_x_7_0_itm_1 <= HCOL_x_sva[7:0];
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      HCOL_else_1_if_nor_itm_1_1 <= 1'b0;
    end
    else if ( rst ) begin
      HCOL_else_1_if_nor_itm_1_1 <= 1'b0;
    end
    else if ( HCOL_else_1_if_and_cse ) begin
      HCOL_else_1_if_nor_itm_1_1 <= HCOL_else_1_if_nor_itm_1;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      HCOL_asn_15_itm_1 <= 1'b0;
      HCOL_asn_11_itm_1 <= 10'b0000000000;
      HCOL_if_slc_HCOL_acc_10_svs_1 <= 1'b0;
      HCOL_unequal_tmp_1 <= 1'b0;
    end
    else if ( rst ) begin
      HCOL_asn_15_itm_1 <= 1'b0;
      HCOL_asn_11_itm_1 <= 10'b0000000000;
      HCOL_if_slc_HCOL_acc_10_svs_1 <= 1'b0;
      HCOL_unequal_tmp_1 <= 1'b0;
    end
    else if ( HCOL_and_4_cse ) begin
      HCOL_asn_15_itm_1 <= HCOL_if_4_equal_tmp & HCOL_else_1_if_nor_itm_1;
      HCOL_asn_11_itm_1 <= HCOL_x_sva;
      HCOL_if_slc_HCOL_acc_10_svs_1 <= operator_11_true_acc_itm_10_1;
      HCOL_unequal_tmp_1 <= (HCOL_x_sva!=10'b0000000000);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & HROW_y_or_cse ) begin
      HROW_y_sva <= MUX_v_9_2_2(9'b000000000, z_out, HROW_y_not_1_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      HCOL_stage_0 <= 1'b0;
      HCOL_x_sva <= 10'b0000000000;
      HCOL_stage_0_2 <= 1'b0;
      HCOL_stage_0_3 <= 1'b0;
      reg_dat_in_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
    end
    else if ( rst ) begin
      HCOL_stage_0 <= 1'b0;
      HCOL_x_sva <= 10'b0000000000;
      HCOL_stage_0_2 <= 1'b0;
      HCOL_stage_0_3 <= 1'b0;
      reg_dat_in_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      HCOL_stage_0 <= (HCOL_stage_0 & ((HCOL_x_sva[9:8]!=2'b00) | (~ HCOL_if_4_equal_tmp)))
          | HROW_y_or_cse;
      HCOL_x_sva <= MUX_v_10_2_2(10'b0000000000, z_out_1, not_52_nl);
      HCOL_stage_0_2 <= HCOL_stage_0 & (~ HROW_y_or_cse);
      HCOL_stage_0_3 <= HCOL_stage_0_2 & (~ HROW_y_or_cse);
      reg_dat_in_rsci_oswt_cse <= (~ operator_11_true_acc_itm_10_1) & HCOL_stage_0
          & (fsm_output[1]);
      reg_dat_out_rsci_oswt_cse <= or_dcpl_29 & HCOL_stage_0_2 & (fsm_output[1]);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & (fsm_output[1]) & ((or_dcpl_9 & HCOL_stage_0_2 & (~ HCOL_asn_15_itm_1))
        | operator_11_true_acc_itm_10_1 | (~ HCOL_stage_0)) & (~((HCOL_asn_15_itm_1
        & HCOL_stage_0) | (~ HCOL_stage_0_2) | HCOL_if_slc_HCOL_acc_10_svs_1)) )
        begin
      dat_in_crt_lpi_3 <= dat_in_rsci_idat_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( pix_buf0_eol_and_cse ) begin
      pix_buf0_eol_lpi_3 <= dat_in_crt_lpi_3[33];
      pix_buf0_sof_lpi_3 <= dat_in_crt_lpi_3[32];
      pix_buf0_pix_lpi_3 <= dat_in_crt_lpi_3[31:0];
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((~(mux_tmp | (~(HCOL_unequal_tmp_1 & HCOL_stage_0_2)) | HCOL_asn_15_itm_1))
        | HROW_y_or_cse) ) begin
      HCOL_else_1_else_ac_int_cctor_3_lpi_3 <= MUX_v_9_2_2(z_out_4, HCOL_else_1_else_ac_int_cctor_3_lpi_3_dfm_1,
          HROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & (fsm_output[3:2]==2'b00) & (or_dcpl_7 | or_dcpl_5 | (HCOL_x_sva[4:0]!=5'b00000)
        | (~ HCOL_stage_0)) & (((~ mux_tmp) & HCOL_unequal_tmp_1 & HCOL_stage_0_2
        & (~ HCOL_stage_0)) | ((~ HCOL_else_1_HCOL_else_1_if_and_tmp) & HCOL_unequal_tmp_1
        & and_45_m1c) | HCOL_or_1_rgt | ((~ HCOL_unequal_tmp_1) & and_45_m1c)) )
        begin
      HCOL_else_1_else_ac_int_cctor_3_lpi_3_dfm_1 <= MUX_v_9_2_2(z_out_4, HCOL_else_1_else_ac_int_cctor_3_lpi_3,
          HCOL_or_1_rgt);
    end
  end
  assign HCOL_else_1_if_mux_6_nl = MUX_v_8_2_2((z_out[7:0]), (pix_buf0_pix_lpi_3_mx0_23_0[23:16]),
      and_115_cse);
  assign HCOL_else_1_if_mux_7_nl = MUX_v_8_2_2((pix_buf0_pix_lpi_3_mx0_23_0[23:16]),
      (~ (dat_in_crt_lpi_3_dfm_mx0_15_0[7:0])), and_115_cse);
  assign nl_acc_2_nl = ({HCOL_else_1_if_HCOL_else_1_if_or_1_cse , HCOL_else_1_if_mux_6_nl
      , HCOL_else_1_if_or_cse}) + conv_u2u_9_10({HCOL_else_1_if_mux_7_nl , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[9:0];
  assign HCOL_else_1_if_mux_8_nl = MUX_v_8_2_2((z_out[7:0]), (pix_buf0_pix_lpi_3_mx0_23_0[15:8]),
      and_115_cse);
  assign HCOL_else_1_if_mux_9_nl = MUX_v_8_2_2((pix_buf0_pix_lpi_3_mx0_23_0[15:8]),
      (~ pix_buf0_pix_lpi_3_mx1_31_24), and_115_cse);
  assign nl_acc_3_nl = ({HCOL_else_1_if_HCOL_else_1_if_or_1_cse , HCOL_else_1_if_mux_8_nl
      , HCOL_else_1_if_or_cse}) + conv_u2u_9_10({HCOL_else_1_if_mux_9_nl , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[9:0];
  assign nl_dx_rsci_idat_17_9  = ({1'b1 , (pix_buf0_pix_lpi_3_mx0_23_0[7:0])}) +
      conv_u2s_8_9(~ (pix_buf0_pix_lpi_3_mx0_23_0[23:16])) + 9'b000000001;
  assign HROW_y_not_1_nl = ~ (fsm_output[0]);
  assign not_52_nl = ~ HROW_y_or_cse;
  assign HROW_HROW_or_1_nl = (HROW_y_sva[8]) | (fsm_output[1]);
  assign HROW_mux_2_nl = MUX_v_8_2_2((HROW_y_sva[7:0]), (~ pix_buf0_pix_lpi_3_mx1_31_24),
      fsm_output[1]);
  assign nl_z_out = ({HROW_HROW_or_1_nl , HROW_mux_2_nl}) + 9'b000000001;
  assign z_out = nl_z_out[8:0];
  assign HCOL_HCOL_and_4_nl = (HCOL_x_sva[9]) & (~ (fsm_output[2]));
  assign HCOL_mux_8_nl = MUX_v_9_2_2((HCOL_x_sva[8:0]), heightIn, fsm_output[2]);
  assign nl_z_out_1 = ({HCOL_HCOL_and_4_nl , HCOL_mux_8_nl}) + conv_s2u_2_10({(fsm_output[2])
      , 1'b1});
  assign z_out_1 = nl_z_out_1[9:0];
  assign and_125_nl = HCOL_unequal_tmp_1 & (fsm_output[1]);
  assign operator_8_false_2_mux_3_nl = MUX_v_8_2_2((dat_in_crt_lpi_3_dfm_mx0_15_0[7:0]),
      pix_buf0_pix_lpi_3_mx1_31_24, and_125_nl);
  assign nl_acc_4_nl = ({1'b1 , operator_8_false_2_mux_3_nl , 1'b1}) + conv_u2u_9_10({(~
      (dat_in_crt_lpi_3_dfm_mx0_15_0[15:8])) , 1'b1});
  assign acc_4_nl = nl_acc_4_nl[9:0];
  assign z_out_4 = readslicef_10_9_1(acc_4_nl);

  function automatic  MUX_s_1_2_2;
    input  input_0;
    input  input_1;
    input  sel;
    reg  result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function automatic [9:0] MUX_v_10_2_2;
    input [9:0] input_0;
    input [9:0] input_1;
    input  sel;
    reg [9:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_10_2_2 = result;
  end
  endfunction


  function automatic [15:0] MUX_v_16_2_2;
    input [15:0] input_0;
    input [15:0] input_1;
    input  sel;
    reg [15:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_16_2_2 = result;
  end
  endfunction


  function automatic [23:0] MUX_v_24_2_2;
    input [23:0] input_0;
    input [23:0] input_1;
    input  sel;
    reg [23:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_24_2_2 = result;
  end
  endfunction


  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input  sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_2_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input  sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function automatic [8:0] readslicef_10_9_1;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_10_9_1 = tmp[8:0];
  end
  endfunction


  function automatic [0:0] readslicef_11_1_10;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 10;
    readslicef_11_1_10 = tmp[0:0];
  end
  endfunction


  function automatic [9:0] conv_s2u_2_10 ;
    input [1:0]  vector ;
  begin
    conv_s2u_2_10 = {{8{vector[1]}}, vector};
  end
  endfunction


  function automatic [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 =  {1'b0, vector};
  end
  endfunction


  function automatic [10:0] conv_u2s_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2s_10_11 =  {1'b0, vector};
  end
  endfunction


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_struct
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_struct (
  clk, rst, arst_n, dat_in_rsc_dat_eol, dat_in_rsc_dat_sof, dat_in_rsc_dat_pix, dat_in_rsc_vld,
      dat_in_rsc_rdy, widthIn, heightIn, dat_out_rsc_dat_eol, dat_out_rsc_dat_sof,
      dat_out_rsc_dat_pix, dat_out_rsc_vld, dat_out_rsc_rdy, dx_rsc_dat, dx_rsc_vld,
      dx_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input dat_in_rsc_dat_eol;
  input dat_in_rsc_dat_sof;
  input [31:0] dat_in_rsc_dat_pix;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output dat_out_rsc_dat_eol;
  output dat_out_rsc_dat_sof;
  output [31:0] dat_out_rsc_dat_pix;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dx_rsc_dat;
  output dx_rsc_vld;
  input dx_rsc_rdy;


  // Interconnect Declarations
  wire [33:0] dat_out_rsc_dat;


  // Interconnect Declarations for Component Instantiations 
  wire [33:0] nl_EdgeDetect_IP_EdgeDetect_HorDer_run_inst_dat_in_rsc_dat;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_run_inst_dat_in_rsc_dat = {dat_in_rsc_dat_eol
      , dat_in_rsc_dat_sof , dat_in_rsc_dat_pix};
  EdgeDetect_IP_EdgeDetect_HorDer_run EdgeDetect_IP_EdgeDetect_HorDer_run_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(nl_EdgeDetect_IP_EdgeDetect_HorDer_run_inst_dat_in_rsc_dat[33:0]),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .dx_rsc_dat(dx_rsc_dat),
      .dx_rsc_vld(dx_rsc_vld),
      .dx_rsc_rdy(dx_rsc_rdy)
    );
  assign dat_out_rsc_dat_pix = dat_out_rsc_dat[31:0];
  assign dat_out_rsc_dat_sof = dat_out_rsc_dat[32];
  assign dat_out_rsc_dat_eol = dat_out_rsc_dat[33];
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, dx_rsc_dat, dx_rsc_vld,
      dx_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dx_rsc_dat;
  output dx_rsc_vld;
  input dx_rsc_rdy;


  // Interconnect Declarations
  wire dat_out_rsc_dat_eol;
  wire dat_out_rsc_dat_sof;
  wire [31:0] dat_out_rsc_dat_pix;


  // Interconnect Declarations for Component Instantiations 
  wire  nl_EdgeDetect_IP_EdgeDetect_HorDer_struct_inst_dat_in_rsc_dat_eol;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_struct_inst_dat_in_rsc_dat_eol = dat_in_rsc_dat[33];
  wire  nl_EdgeDetect_IP_EdgeDetect_HorDer_struct_inst_dat_in_rsc_dat_sof;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_struct_inst_dat_in_rsc_dat_sof = dat_in_rsc_dat[32];
  wire [31:0] nl_EdgeDetect_IP_EdgeDetect_HorDer_struct_inst_dat_in_rsc_dat_pix;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_struct_inst_dat_in_rsc_dat_pix = dat_in_rsc_dat[31:0];
  EdgeDetect_IP_EdgeDetect_HorDer_struct EdgeDetect_IP_EdgeDetect_HorDer_struct_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat_eol(nl_EdgeDetect_IP_EdgeDetect_HorDer_struct_inst_dat_in_rsc_dat_eol),
      .dat_in_rsc_dat_sof(nl_EdgeDetect_IP_EdgeDetect_HorDer_struct_inst_dat_in_rsc_dat_sof),
      .dat_in_rsc_dat_pix(nl_EdgeDetect_IP_EdgeDetect_HorDer_struct_inst_dat_in_rsc_dat_pix[31:0]),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat_eol(dat_out_rsc_dat_eol),
      .dat_out_rsc_dat_sof(dat_out_rsc_dat_sof),
      .dat_out_rsc_dat_pix(dat_out_rsc_dat_pix),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .dx_rsc_dat(dx_rsc_dat),
      .dx_rsc_vld(dx_rsc_vld),
      .dx_rsc_rdy(dx_rsc_rdy)
    );
  assign dat_out_rsc_dat = {dat_out_rsc_dat_eol , dat_out_rsc_dat_sof , dat_out_rsc_dat_pix};
endmodule




//------> ../EdgeDetect_IP_EdgeDetect_VerDer.v1/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.2/1059873 Production Release
//  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
// 
//  Generated by:   m11102154@cad27
//  Generated date: Sat Apr  6 14:36:04 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_7_64_9_320_320_64_5_gen
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_7_64_9_320_320_64_5_gen
    (
  en, q, we, d, adr, adr_d, d_d, en_d, we_d, q_d, port_0_rw_ram_ir_internal_RMASK_B_d,
      port_0_rw_ram_ir_internal_WMASK_B_d
);
  output en;
  input [63:0] q;
  output we;
  output [63:0] d;
  output [8:0] adr;
  input [8:0] adr_d;
  input [63:0] d_d;
  input en_d;
  input we_d;
  output [63:0] q_d;
  input port_0_rw_ram_ir_internal_RMASK_B_d;
  input port_0_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign en = (en_d);
  assign q_d = q;
  assign we = (port_0_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_6_64_9_320_320_64_5_gen
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_6_64_9_320_320_64_5_gen
    (
  en, q, we, d, adr, adr_d, d_d, en_d, we_d, q_d, port_0_rw_ram_ir_internal_RMASK_B_d,
      port_0_rw_ram_ir_internal_WMASK_B_d
);
  output en;
  input [63:0] q;
  output we;
  output [63:0] d;
  output [8:0] adr;
  input [8:0] adr_d;
  input [63:0] d_d;
  input en_d;
  input we_d;
  output [63:0] q_d;
  input port_0_rw_ram_ir_internal_RMASK_B_d;
  input port_0_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign en = (en_d);
  assign q_d = q;
  assign we = (port_0_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm (
  clk, rst, arst_n, run_wen, fsm_output, VCOL_C_0_tr0, VROW_C_0_tr0
);
  input clk;
  input rst;
  input arst_n;
  input run_wen;
  output [3:0] fsm_output;
  reg [3:0] fsm_output;
  input VCOL_C_0_tr0;
  input VROW_C_0_tr0;


  // FSM State Type Declaration for EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    VCOL_C_0 = 2'd1,
    VROW_C_0 = 2'd2,
    main_C_1 = 2'd3;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_1
    case (state_var)
      VCOL_C_0 : begin
        fsm_output = 4'b0010;
        if ( VCOL_C_0_tr0 ) begin
          state_var_NS = VROW_C_0;
        end
        else begin
          state_var_NS = VCOL_C_0;
        end
      end
      VROW_C_0 : begin
        fsm_output = 4'b0100;
        if ( VROW_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = VCOL_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 4'b1000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 4'b0001;
        state_var_NS = VCOL_C_0;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= main_C_0;
    end
    else if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_staller
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_staller (
  run_wen, dat_in_rsci_wen_comp, dat_out_rsci_wen_comp, dy_rsci_wen_comp
);
  output run_wen;
  input dat_in_rsci_wen_comp;
  input dat_out_rsci_wen_comp;
  input dy_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = dat_in_rsci_wen_comp & dat_out_rsci_wen_comp & dy_rsci_wen_comp;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_wait_dp (
  line_buf0_rsci_en_d, run_wen, line_buf0_rsci_cgo, line_buf0_rsci_cgo_ir_unreg
);
  output line_buf0_rsci_en_d;
  input run_wen;
  input line_buf0_rsci_cgo;
  input line_buf0_rsci_cgo_ir_unreg;



  // Interconnect Declarations for Component Instantiations 
  assign line_buf0_rsci_en_d = run_wen & (line_buf0_rsci_cgo | line_buf0_rsci_cgo_ir_unreg);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp (
  clk, rst, arst_n, dy_rsci_oswt, dy_rsci_wen_comp, dy_rsci_biwt, dy_rsci_bdwt, dy_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dy_rsci_oswt;
  output dy_rsci_wen_comp;
  input dy_rsci_biwt;
  input dy_rsci_bdwt;
  output dy_rsci_bcwt;
  reg dy_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dy_rsci_wen_comp = (~ dy_rsci_oswt) | dy_rsci_biwt | dy_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dy_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dy_rsci_bcwt <= 1'b0;
    end
    else begin
      dy_rsci_bcwt <= ~((~(dy_rsci_bcwt | dy_rsci_biwt)) | dy_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl (
  run_wen, dy_rsci_oswt, dy_rsci_biwt, dy_rsci_bdwt, dy_rsci_bcwt, dy_rsci_irdy,
      dy_rsci_ivld_run_sct
);
  input run_wen;
  input dy_rsci_oswt;
  output dy_rsci_biwt;
  output dy_rsci_bdwt;
  input dy_rsci_bcwt;
  input dy_rsci_irdy;
  output dy_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dy_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dy_rsci_bdwt = dy_rsci_oswt & run_wen;
  assign dy_rsci_biwt = dy_rsci_ogwt & dy_rsci_irdy;
  assign dy_rsci_ogwt = dy_rsci_oswt & (~ dy_rsci_bcwt);
  assign dy_rsci_ivld_run_sct = dy_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_dp (
  clk, rst, arst_n, dat_out_rsci_oswt, dat_out_rsci_wen_comp, dat_out_rsci_biwt,
      dat_out_rsci_bdwt, dat_out_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input dat_out_rsci_biwt;
  input dat_out_rsci_bdwt;
  output dat_out_rsci_bcwt;
  reg dat_out_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_wen_comp = (~ dat_out_rsci_oswt) | dat_out_rsci_biwt | dat_out_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else begin
      dat_out_rsci_bcwt <= ~((~(dat_out_rsci_bcwt | dat_out_rsci_biwt)) | dat_out_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_ctrl (
  run_wen, dat_out_rsci_oswt, dat_out_rsci_biwt, dat_out_rsci_bdwt, dat_out_rsci_bcwt,
      dat_out_rsci_irdy, dat_out_rsci_ivld_run_sct
);
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_biwt;
  output dat_out_rsci_bdwt;
  input dat_out_rsci_bcwt;
  input dat_out_rsci_irdy;
  output dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dat_out_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_bdwt = dat_out_rsci_oswt & run_wen;
  assign dat_out_rsci_biwt = dat_out_rsci_ogwt & dat_out_rsci_irdy;
  assign dat_out_rsci_ogwt = dat_out_rsci_oswt & (~ dat_out_rsci_bcwt);
  assign dat_out_rsci_ivld_run_sct = dat_out_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl (
  run_wen, dat_in_rsci_iswt0, dat_in_rsci_irdy_run_sct
);
  input run_wen;
  input dat_in_rsci_iswt0;
  output dat_in_rsci_irdy_run_sct;



  // Interconnect Declarations for Component Instantiations 
  assign dat_in_rsci_irdy_run_sct = dat_in_rsci_iswt0 & run_wen;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci (
  clk, rst, arst_n, dy_rsc_dat, dy_rsc_vld, dy_rsc_rdy, run_wen, dy_rsci_oswt, dy_rsci_wen_comp,
      dy_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  input run_wen;
  input dy_rsci_oswt;
  output dy_rsci_wen_comp;
  input [35:0] dy_rsci_idat;


  // Interconnect Declarations
  wire dy_rsci_biwt;
  wire dy_rsci_bdwt;
  wire dy_rsci_bcwt;
  wire dy_rsci_irdy;
  wire dy_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd5),
  .width(32'sd36)) dy_rsci (
      .irdy(dy_rsci_irdy),
      .ivld(dy_rsci_ivld_run_sct),
      .idat(dy_rsci_idat),
      .rdy(dy_rsc_rdy),
      .vld(dy_rsc_vld),
      .dat(dy_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dy_rsci_oswt(dy_rsci_oswt),
      .dy_rsci_biwt(dy_rsci_biwt),
      .dy_rsci_bdwt(dy_rsci_bdwt),
      .dy_rsci_bcwt(dy_rsci_bcwt),
      .dy_rsci_irdy(dy_rsci_irdy),
      .dy_rsci_ivld_run_sct(dy_rsci_ivld_run_sct)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dy_rsci_oswt(dy_rsci_oswt),
      .dy_rsci_wen_comp(dy_rsci_wen_comp),
      .dy_rsci_biwt(dy_rsci_biwt),
      .dy_rsci_bdwt(dy_rsci_bdwt),
      .dy_rsci_bcwt(dy_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci (
  clk, rst, arst_n, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, run_wen, dat_out_rsci_oswt,
      dat_out_rsci_wen_comp, dat_out_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input [33:0] dat_out_rsci_idat;


  // Interconnect Declarations
  wire dat_out_rsci_biwt;
  wire dat_out_rsci_bdwt;
  wire dat_out_rsci_bcwt;
  wire dat_out_rsci_irdy;
  wire dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  wire [33:0] nl_dat_out_rsci_idat;
  assign nl_dat_out_rsci_idat = {2'b00 , (dat_out_rsci_idat[31:0])};
  ccs_out_wait_v1 #(.rscid(32'sd4),
  .width(32'sd34)) dat_out_rsci (
      .irdy(dat_out_rsci_irdy),
      .ivld(dat_out_rsci_ivld_run_sct),
      .idat(nl_dat_out_rsci_idat[33:0]),
      .rdy(dat_out_rsc_rdy),
      .vld(dat_out_rsc_vld),
      .dat(dat_out_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_ctrl EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt),
      .dat_out_rsci_irdy(dat_out_rsci_irdy),
      .dat_out_rsci_ivld_run_sct(dat_out_rsci_ivld_run_sct)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_dp EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci (
  dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, run_wen, dat_in_rsci_oswt, dat_in_rsci_wen_comp,
      dat_in_rsci_idat_mxwt
);
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input run_wen;
  input dat_in_rsci_oswt;
  output dat_in_rsci_wen_comp;
  output [31:0] dat_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dat_in_rsci_irdy_run_sct;
  wire dat_in_rsci_ivld;
  wire [33:0] dat_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_coupled_v1 #(.rscid(32'sd1),
  .width(32'sd34)) dat_in_rsci (
      .rdy(dat_in_rsc_rdy),
      .vld(dat_in_rsc_vld),
      .dat(dat_in_rsc_dat),
      .irdy(dat_in_rsci_irdy_run_sct),
      .ivld(dat_in_rsci_ivld),
      .idat(dat_in_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_in_rsci_iswt0(dat_in_rsci_oswt),
      .dat_in_rsci_irdy_run_sct(dat_in_rsci_irdy_run_sct)
    );
  assign dat_in_rsci_idat_mxwt = dat_in_rsci_idat[31:0];
  assign dat_in_rsci_wen_comp = (~ dat_in_rsci_oswt) | dat_in_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, dy_rsc_dat, dy_rsc_vld,
      dy_rsc_rdy, line_buf0_rsci_d_d, line_buf0_rsci_en_d, line_buf0_rsci_q_d, line_buf1_rsci_d_d,
      line_buf1_rsci_q_d, line_buf0_rsci_adr_d_pff, line_buf0_rsci_we_d_pff, line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff
);
  input clk;
  input rst;
  input arst_n;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  output [63:0] line_buf0_rsci_d_d;
  output line_buf0_rsci_en_d;
  input [63:0] line_buf0_rsci_q_d;
  output [63:0] line_buf1_rsci_d_d;
  input [63:0] line_buf1_rsci_q_d;
  output [8:0] line_buf0_rsci_adr_d_pff;
  output line_buf0_rsci_we_d_pff;
  output line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff;


  // Interconnect Declarations
  wire run_wen;
  wire dat_in_rsci_wen_comp;
  wire [31:0] dat_in_rsci_idat_mxwt;
  wire dat_out_rsci_wen_comp;
  wire dy_rsci_wen_comp;
  reg [31:0] dat_out_rsci_idat_31_0;
  reg [8:0] dy_rsci_idat_35_27;
  reg [8:0] dy_rsci_idat_26_18;
  reg [8:0] dy_rsci_idat_17_9;
  reg [8:0] dy_rsci_idat_8_0;
  wire [3:0] fsm_output;
  wire VROW_equal_tmp;
  wire [2:0] VCOL_for_acc_5_tmp;
  wire [3:0] nl_VCOL_for_acc_5_tmp;
  wire or_tmp;
  wire nor_tmp;
  wire and_dcpl;
  wire or_dcpl_6;
  wire and_dcpl_17;
  wire and_dcpl_18;
  wire or_dcpl_15;
  wire and_dcpl_33;
  wire or_dcpl_20;
  wire or_dcpl_31;
  wire and_dcpl_62;
  wire and_dcpl_63;
  wire or_dcpl_34;
  wire or_dcpl_38;
  wire or_dcpl_46;
  wire or_dcpl_47;
  wire and_dcpl_64;
  wire or_dcpl_49;
  wire or_dcpl_51;
  wire or_dcpl_55;
  wire or_dcpl_57;
  wire or_dcpl_58;
  wire or_dcpl_62;
  wire or_dcpl_71;
  wire or_dcpl_72;
  wire or_dcpl_73;
  wire or_dcpl_74;
  wire and_dcpl_88;
  wire or_dcpl_75;
  wire or_dcpl_76;
  wire VCOL_for_for_acc_tmp_2;
  wire and_184_cse;
  wire lfst_exit_VCOL_for_lpi_3_dfm_1_mx0w0;
  reg lfst_exit_VCOL_for_lpi_3;
  reg VCOL_for_asn_16_itm_1;
  reg VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1;
  reg VCOL_for_for_j_1_0_lpi_3_dfm_1_0;
  wire VCOL_VCOL_nand_tmp_1;
  reg exitL_exit_VCOL_for_sva;
  reg [8:0] VROW_y_sva;
  reg VCOL_nor_1_itm_1;
  wire VCOL_for_VCOL_for_and_1_seb_1;
  reg [1:0] VCOL_for_i_2_0_lpi_3_dfm_1_1_1_0;
  reg VCOL_stage_0_3;
  reg VCOL_stage_0_2;
  reg VCOL_stage_0_1;
  reg VCOL_if_slc_operator_9_false_acc_9_svs_1;
  reg [1:0] VCOL_for_i_2_0_lpi_3_dfm_1_1_0;
  reg operator_10_false_operator_10_false_slc_VCOL_x_0_2_itm_1;
  reg [9:0] VCOL_x_sva;
  reg [1:0] VCOL_for_i_2_0_lpi_3_dfm_2_1_0;
  reg VCOL_for_for_slc_VCOL_for_for_acc_2_svs_2;
  reg [8:0] VCOL_asn_12_itm_2;
  reg exit_VCOL_for_lpi_3_dfm_2_st_2;
  reg VCOL_for_for_and_24_itm_1;
  reg VCOL_for_for_and_stg_2_3_sva_2;
  reg VCOL_for_for_j_1_0_lpi_3_dfm_2_1;
  reg VCOL_asn_14_itm_1;
  reg VCOL_for_for_j_1_0_lpi_3_dfm_2_0;
  reg VCOL_for_for_and_stg_2_1_sva_1;
  reg VCOL_for_for_and_stg_2_2_sva_2;
  reg VCOL_for_and_5_itm_1;
  reg operator_10_false_operator_10_false_slc_VCOL_x_0_itm_1;
  wire [1:0] VCOL_for_i_2_0_lpi_3_dfm_1_0_1;
  wire VCOL_for_for_j_1_0_lpi_3_dfm_0_1;
  reg VCOL_for_for_j_1_0_lpi_3_dfm_2_1_1;
  reg VCOL_for_for_j_1_0_lpi_3_1;
  reg VCOL_for_for_j_1_0_lpi_3_dfm_2_1_0;
  reg VCOL_for_for_j_1_0_lpi_3_0;
  wire exitL_exit_VCOL_for_sva_mx1;
  wire VCOL_for_for_j_and_cse;
  reg reg_dat_in_rsci_oswt_cse;
  reg reg_dat_out_rsci_oswt_cse;
  reg reg_line_buf0_rsci_cgo_cse;
  wire nor_1_cse;
  wire mux_12_cse;
  wire VCOL_for_VCOL_for_and_3_cse;
  wire or_104_tmp;
  wire VCOL_for_for_j_1_0_sva_2_1;
  wire VCOL_VCOL_and_cse;
  wire dat_in_pix_and_cse;
  wire operator_8_false_nor_cse;
  wire operator_8_false_and_8_cse;
  wire operator_8_false_and_9_cse;
  wire operator_8_false_and_10_cse;
  wire VCOL_for_for_j_1_0_lpi_3_dfm_1_1;
  wire and_165_rmff;
  wire [31:0] pix_pix_0_lpi_3_dfm_mx1;
  reg [31:0] wrbuf0_pix_31_0_lpi_4;
  wire [63:0] rdbuf0_pix_mux_itm;
  wire [9:0] z_out;
  wire [10:0] nl_z_out;
  reg [31:0] pix_pix_0_lpi_3;
  reg [63:0] rdbuf0_pix_lpi_3;
  reg [31:0] pix_pix_2_lpi_3;
  reg [31:0] VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3;
  reg [7:0] pix_list_0_3_lpi_3;
  reg [7:0] pix_list_2_0_lpi_3;
  reg [7:0] pix_list_0_2_lpi_3;
  reg [7:0] pix_list_2_1_lpi_3;
  reg [7:0] pix_list_0_1_lpi_3;
  reg [7:0] pix_list_2_2_lpi_3;
  reg [7:0] pix_list_0_0_lpi_3;
  reg [7:0] pix_list_2_3_lpi_3;
  reg [8:0] gradian_list_1_lpi_3;
  reg [8:0] gradian_list_2_lpi_3;
  reg [8:0] gradian_list_0_lpi_3;
  reg [8:0] gradian_list_3_lpi_3;
  reg [63:0] rdbuf0_pix_lpi_3_dfm_1;
  reg [7:0] pix_list_0_3_sva_1;
  reg [7:0] pix_list_2_0_sva_1;
  reg [7:0] pix_list_0_2_sva_1;
  reg [7:0] pix_list_2_1_sva_1;
  reg [7:0] pix_list_2_2_sva_1;
  reg [7:0] pix_list_2_3_sva_1;
  reg VCOL_VCOL_nand_tmp_1_1;
  reg VCOL_if_slc_operator_9_false_acc_9_svs_2;
  reg VCOL_for_for_and_stg_2_3_sva_1;
  reg VCOL_for_for_and_stg_2_2_sva_1;
  reg [31:0] VCOL_if_dat_in_pix_slc_dat_in_crt_31_0_2_itm_1;
  reg VCOL_and_itm_1;
  reg VCOL_and_1_itm_1;
  reg [8:0] VCOL_asn_12_itm_1;
  reg [31:0] rdbuf1_pix_lpi_3_63_32;
  reg VCOL_for_for_j_1_0_lpi_3_dfm_1_1_1;
  wire dy_rsci_idat_35_27_mx0c1;
  wire dy_rsci_idat_8_0_mx0c1;
  wire dy_rsci_idat_26_18_mx0c1;
  wire dy_rsci_idat_17_9_mx0c1;
  wire dat_out_rsci_idat_31_0_mx0c1;
  wire VCOL_for_for_j_1_0_lpi_3_dfm_2_1_mx2w0;
  wire lfst_exit_VCOL_for_lpi_3_mx0c1;
  wire [31:0] pix_pix_0_lpi_3_mx1;
  wire [31:0] pix_pix_0_lpi_3_dfm_2_mx1w1;
  wire [31:0] pix_pix_2_lpi_3_dfm_2_mx0w0;
  wire VCOL_for_for_and_stg_2_3_sva_1_1;
  wire [31:0] VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_mx0;
  wire [8:0] operator_8_false_acc_ctmp_sva_1;
  wire [9:0] nl_operator_8_false_acc_ctmp_sva_1;
  wire [31:0] VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_1_mx0;
  wire [7:0] VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1;
  wire VCOL_for_and_3_m1c_1;
  wire and_80_rgt;
  wire and_82_rgt;
  wire and_84_rgt;
  wire and_89_rgt;
  wire and_96_rgt;
  wire and_99_rgt;
  wire and_101_rgt;
  wire and_103_rgt;
  wire VCOL_and_3_cse;
  wire VCOL_for_for_j_and_4_cse;
  wire operator_10_false_and_cse;
  wire VROW_y_or_cse;
  wire VCOL_for_for_j_and_2_cse;
  wire and_239_cse;
  wire and_258_cse;
  wire and_255_cse;
  wire rdbuf0_pix_and_itm;
  wire operator_9_false_acc_itm_9_1;
  wire VCOL_if_5_acc_itm_10;

  wire VROW_y_not_2_nl;
  wire not_165_nl;
  wire mux_17_nl;
  wire mux_16_nl;
  wire or_170_nl;
  wire mux_15_nl;
  wire mux_14_nl;
  wire mux_18_nl;
  wire nor_26_nl;
  wire nor_27_nl;
  wire mux_3_nl;
  wire nand_4_nl;
  wire mux_2_nl;
  wire or_5_nl;
  wire mux_5_nl;
  wire or_11_nl;
  wire mux_4_nl;
  wire or_9_nl;
  wire mux_7_nl;
  wire or_16_nl;
  wire mux_6_nl;
  wire or_13_nl;
  wire mux_9_nl;
  wire or_20_nl;
  wire mux_8_nl;
  wire or_17_nl;
  wire and_199_nl;
  wire and_87_nl;
  wire and_94_nl;
  wire rdbuf0_pix_and_1_nl;
  wire VCOL_for_nand_nl;
  wire VCOL_for_and_7_nl;
  wire VCOL_for_and_4_nl;
  wire[9:0] operator_9_false_acc_nl;
  wire[10:0] nl_operator_9_false_acc_nl;
  wire VCOL_for_for_j_mux_1_nl;
  wire VCOL_for_for_j_mux_4_nl;
  wire VCOL_for_not_22_nl;
  wire[7:0] operator_8_false_operator_8_false_mux1h_nl;
  wire operator_8_false_operator_8_false_nand_nl;
  wire operator_8_false_and_4_nl;
  wire operator_8_false_and_5_nl;
  wire operator_8_false_and_6_nl;
  wire operator_8_false_and_7_nl;
  wire[7:0] operator_8_false_2_operator_8_false_2_operator_8_false_2_mux1h_nl;
  wire operator_8_false_2_operator_8_false_2_nand_nl;
  wire operator_8_false_2_and_4_nl;
  wire operator_8_false_2_and_5_nl;
  wire operator_8_false_2_and_6_nl;
  wire operator_8_false_2_and_7_nl;
  wire VCOL_for_mux_nl;
  wire[10:0] VCOL_if_5_acc_nl;
  wire[11:0] nl_VCOL_if_5_acc_nl;
  wire[8:0] operator_11_true_acc_nl;
  wire[9:0] nl_operator_11_true_acc_nl;
  wire VROW_VROW_and_1_nl;
  wire[8:0] VROW_mux_2_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [33:0] nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_inst_dat_out_rsci_idat;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_inst_dat_out_rsci_idat
      = {2'b00 , dat_out_rsci_idat_31_0};
  wire [35:0] nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_inst_dy_rsci_idat;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_inst_dy_rsci_idat = {dy_rsci_idat_35_27
      , dy_rsci_idat_26_18 , dy_rsci_idat_17_9 , dy_rsci_idat_8_0};
  wire  nl_EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_inst_VCOL_C_0_tr0;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_inst_VCOL_C_0_tr0 = ~(VCOL_stage_0_3
      | VCOL_stage_0_2 | VCOL_stage_0_1);
  EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci_inst
      (
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .run_wen(run_wen),
      .dat_in_rsci_oswt(reg_dat_in_rsci_oswt_cse),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_in_rsci_idat_mxwt(dat_in_rsci_idat_mxwt)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .run_wen(run_wen),
      .dat_out_rsci_oswt(reg_dat_out_rsci_oswt_cse),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_idat(nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_inst_dat_out_rsci_idat[33:0])
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dy_rsc_dat(dy_rsc_dat),
      .dy_rsc_vld(dy_rsc_vld),
      .dy_rsc_rdy(dy_rsc_rdy),
      .run_wen(run_wen),
      .dy_rsci_oswt(reg_dat_out_rsci_oswt_cse),
      .dy_rsci_wen_comp(dy_rsci_wen_comp),
      .dy_rsci_idat(nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_inst_dy_rsci_idat[35:0])
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_wait_dp EdgeDetect_IP_EdgeDetect_VerDer_run_wait_dp_inst
      (
      .line_buf0_rsci_en_d(line_buf0_rsci_en_d),
      .run_wen(run_wen),
      .line_buf0_rsci_cgo(reg_line_buf0_rsci_cgo_cse),
      .line_buf0_rsci_cgo_ir_unreg(and_165_rmff)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_staller EdgeDetect_IP_EdgeDetect_VerDer_run_staller_inst
      (
      .run_wen(run_wen),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dy_rsci_wen_comp(dy_rsci_wen_comp)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .VCOL_C_0_tr0(nl_EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_inst_VCOL_C_0_tr0),
      .VROW_C_0_tr0(VROW_equal_tmp)
    );
  assign VROW_y_or_cse = (fsm_output[0]) | (fsm_output[2]);
  assign VCOL_for_VCOL_for_and_3_cse = (~ VCOL_if_5_acc_itm_10) & lfst_exit_VCOL_for_lpi_3;
  assign VCOL_and_3_cse = run_wen & VCOL_stage_0_2;
  assign VCOL_for_for_j_and_cse = run_wen & (fsm_output[1]);
  assign and_239_cse = (~ VCOL_for_for_acc_tmp_2) & (VCOL_for_acc_5_tmp[2]);
  assign VCOL_for_for_j_and_2_cse = VCOL_for_for_j_and_cse & ((lfst_exit_VCOL_for_lpi_3
      & (~ VCOL_if_5_acc_itm_10) & VCOL_stage_0_2) | and_239_cse) & (~(VCOL_for_VCOL_for_and_3_cse
      & VCOL_stage_0_2)) & VCOL_stage_0_1;
  assign operator_10_false_and_cse = run_wen & mux_12_cse & VCOL_stage_0_1;
  assign VCOL_for_for_j_and_4_cse = run_wen & VCOL_VCOL_and_cse;
  assign and_258_cse = lfst_exit_VCOL_for_lpi_3 & VCOL_if_5_acc_itm_10;
  assign and_165_rmff = (nor_tmp | (VCOL_stage_0_3 & VCOL_for_asn_16_itm_1)) & (fsm_output[1]);
  assign dat_in_pix_and_cse = run_wen & (~ and_184_cse);
  assign nor_1_cse = ~(VCOL_for_for_acc_tmp_2 | (~ VCOL_stage_0_1));
  assign and_80_rgt = or_tmp & VCOL_stage_0_3 & (~ VCOL_asn_14_itm_1) & VCOL_for_asn_16_itm_1;
  assign and_82_rgt = and_dcpl_62 & (~ VCOL_stage_0_1) & VCOL_for_and_5_itm_1;
  assign and_84_rgt = and_dcpl_62 & (~(VCOL_stage_0_1 | VCOL_for_and_5_itm_1));
  assign and_255_cse = (~ VCOL_VCOL_nand_tmp_1_1) & VCOL_for_asn_16_itm_1;
  assign rdbuf0_pix_and_itm = dat_in_pix_and_cse & and_dcpl & VCOL_stage_0_3;
  assign and_89_rgt = or_dcpl_71 & VCOL_stage_0_3;
  assign and_96_rgt = or_dcpl_73 & VCOL_stage_0_3;
  assign and_99_rgt = or_dcpl_74 & VCOL_stage_0_3;
  assign and_101_rgt = or_dcpl_75 & VCOL_stage_0_3;
  assign and_103_rgt = or_dcpl_76 & VCOL_stage_0_3;
  assign VCOL_for_for_j_1_0_lpi_3_dfm_2_1_mx2w0 = VCOL_for_for_j_1_0_sva_2_1 & (VCOL_for_acc_5_tmp[2]);
  assign lfst_exit_VCOL_for_lpi_3_dfm_1_mx0w0 = ~(VCOL_if_5_acc_itm_10 & lfst_exit_VCOL_for_lpi_3);
  assign exitL_exit_VCOL_for_sva_mx1 = MUX_s_1_2_2(exitL_exit_VCOL_for_sva, (~ lfst_exit_VCOL_for_lpi_3_dfm_1_mx0w0),
      VCOL_stage_0_2);
  assign VCOL_VCOL_and_cse = VCOL_stage_0_1 & or_dcpl_6;
  assign mux_12_cse = MUX_s_1_2_2(exitL_exit_VCOL_for_sva, and_258_cse, VCOL_stage_0_2);
  assign pix_pix_0_lpi_3_dfm_mx1 = MUX_v_32_2_2(dat_in_rsci_idat_mxwt, pix_pix_0_lpi_3_mx1,
      VCOL_if_slc_operator_9_false_acc_9_svs_1);
  assign rdbuf0_pix_and_1_nl = VCOL_for_and_5_itm_1 & (~ or_dcpl_31);
  assign rdbuf0_pix_mux_itm = MUX_v_64_2_2(rdbuf0_pix_lpi_3, line_buf0_rsci_q_d,
      rdbuf0_pix_and_1_nl);
  assign pix_pix_0_lpi_3_mx1 = MUX_v_32_2_2(pix_pix_0_lpi_3_dfm_2_mx1w1, pix_pix_0_lpi_3,
      or_dcpl_31);
  assign VCOL_for_nand_nl = ~(VCOL_for_asn_16_itm_1 & (~(VCOL_if_slc_operator_9_false_acc_9_svs_2
      & VCOL_for_and_3_m1c_1)));
  assign VCOL_for_and_7_nl = (~ VCOL_if_slc_operator_9_false_acc_9_svs_2) & VCOL_for_and_3_m1c_1;
  assign VCOL_for_and_4_nl = VROW_equal_tmp & VCOL_for_asn_16_itm_1;
  assign pix_pix_0_lpi_3_dfm_2_mx1w1 = MUX1HOT_v_32_3_2(pix_pix_0_lpi_3, VCOL_if_dat_in_pix_slc_dat_in_crt_31_0_2_itm_1,
      VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_mx0, {VCOL_for_nand_nl , VCOL_for_and_7_nl
      , VCOL_for_and_4_nl});
  assign pix_pix_2_lpi_3_dfm_2_mx0w0 = MUX1HOT_v_32_4_2(pix_pix_2_lpi_3, VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_mx0,
      (line_buf1_rsci_q_d[31:0]), rdbuf1_pix_lpi_3_63_32, {(~ VCOL_for_asn_16_itm_1)
      , and_255_cse , VCOL_and_itm_1 , VCOL_and_1_itm_1});
  assign VCOL_VCOL_nand_tmp_1 = ~((VROW_y_sva[0]) & VCOL_nor_1_itm_1);
  assign nl_operator_9_false_acc_nl = ({1'b1 , heightIn}) + conv_u2s_9_10(~ VROW_y_sva);
  assign operator_9_false_acc_nl = nl_operator_9_false_acc_nl[9:0];
  assign operator_9_false_acc_itm_9_1 = readslicef_10_1_9(operator_9_false_acc_nl);
  assign VCOL_for_for_acc_tmp_2 = ~(VCOL_for_for_j_1_0_lpi_3_dfm_0_1 ^ VCOL_for_for_j_1_0_sva_2_1);
  assign VCOL_for_for_and_stg_2_3_sva_1_1 = (VCOL_for_i_2_0_lpi_3_dfm_1_0_1==2'b11)
      & (~ VCOL_for_for_j_1_0_lpi_3_dfm_0_1);
  assign VCOL_for_for_j_mux_1_nl = MUX_s_1_2_2(VCOL_for_for_j_1_0_lpi_3_1, VCOL_for_for_j_1_0_lpi_3_dfm_2_1_1,
      VCOL_stage_0_2);
  assign VCOL_for_for_j_1_0_lpi_3_dfm_1_1 = VCOL_for_for_j_mux_1_nl & VCOL_for_VCOL_for_and_1_seb_1;
  assign VCOL_for_for_j_mux_4_nl = MUX_s_1_2_2(VCOL_for_for_j_1_0_lpi_3_0, VCOL_for_for_j_1_0_lpi_3_dfm_2_1_0,
      VCOL_stage_0_2);
  assign VCOL_for_for_j_1_0_lpi_3_dfm_0_1 = VCOL_for_for_j_mux_4_nl & VCOL_for_VCOL_for_and_1_seb_1;
  assign VCOL_for_not_22_nl = ~ exitL_exit_VCOL_for_sva_mx1;
  assign VCOL_for_i_2_0_lpi_3_dfm_1_0_1 = MUX_v_2_2_2(2'b00, VCOL_for_i_2_0_lpi_3_dfm_1_1_1_0,
      VCOL_for_not_22_nl);
  assign VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_mx0 = MUX_v_32_2_2((line_buf0_rsci_q_d[31:0]),
      (rdbuf0_pix_lpi_3[63:32]), operator_10_false_operator_10_false_slc_VCOL_x_0_itm_1);
  assign VROW_equal_tmp = VROW_y_sva == heightIn;
  assign or_104_tmp = or_dcpl_51 | VCOL_for_for_j_1_0_lpi_3_dfm_2_0 | VCOL_for_for_j_1_0_lpi_3_dfm_2_1;
  assign operator_8_false_nor_cse = ~((VCOL_for_i_2_0_lpi_3_dfm_2_1_0!=2'b00));
  assign operator_8_false_and_8_cse = (VCOL_for_i_2_0_lpi_3_dfm_2_1_0==2'b01);
  assign operator_8_false_and_9_cse = (VCOL_for_i_2_0_lpi_3_dfm_2_1_0==2'b10);
  assign operator_8_false_and_10_cse = (VCOL_for_i_2_0_lpi_3_dfm_2_1_0==2'b11);
  assign operator_8_false_operator_8_false_nand_nl = ~(or_104_tmp & (~((~ or_dcpl_49)
      & operator_8_false_and_8_cse)) & (~((~ or_dcpl_73) & operator_8_false_and_9_cse))
      & (~((~ or_dcpl_71) & operator_8_false_and_10_cse)));
  assign operator_8_false_and_4_nl = or_104_tmp & operator_8_false_nor_cse;
  assign operator_8_false_and_5_nl = or_dcpl_49 & operator_8_false_and_8_cse;
  assign operator_8_false_and_6_nl = or_dcpl_73 & operator_8_false_and_9_cse;
  assign operator_8_false_and_7_nl = or_dcpl_71 & operator_8_false_and_10_cse;
  assign operator_8_false_operator_8_false_mux1h_nl = MUX1HOT_v_8_5_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
      pix_list_0_0_lpi_3, pix_list_0_1_lpi_3, pix_list_0_2_lpi_3, pix_list_0_3_lpi_3,
      {operator_8_false_operator_8_false_nand_nl , operator_8_false_and_4_nl , operator_8_false_and_5_nl
      , operator_8_false_and_6_nl , operator_8_false_and_7_nl});
  assign operator_8_false_2_operator_8_false_2_nand_nl = ~(or_dcpl_72 & (~((~ or_dcpl_74)
      & operator_8_false_and_8_cse)) & (~((~ or_dcpl_75) & operator_8_false_and_9_cse))
      & (~((~ or_dcpl_76) & operator_8_false_and_10_cse)));
  assign operator_8_false_2_and_4_nl = or_dcpl_72 & operator_8_false_nor_cse;
  assign operator_8_false_2_and_5_nl = or_dcpl_74 & operator_8_false_and_8_cse;
  assign operator_8_false_2_and_6_nl = or_dcpl_75 & operator_8_false_and_9_cse;
  assign operator_8_false_2_and_7_nl = or_dcpl_76 & operator_8_false_and_10_cse;
  assign operator_8_false_2_operator_8_false_2_operator_8_false_2_mux1h_nl = MUX1HOT_v_8_5_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
      pix_list_2_0_lpi_3, pix_list_2_1_lpi_3, pix_list_2_2_lpi_3, pix_list_2_3_lpi_3,
      {operator_8_false_2_operator_8_false_2_nand_nl , operator_8_false_2_and_4_nl
      , operator_8_false_2_and_5_nl , operator_8_false_2_and_6_nl , operator_8_false_2_and_7_nl});
  assign nl_operator_8_false_acc_ctmp_sva_1 = ({1'b1 , (~ operator_8_false_operator_8_false_mux1h_nl)})
      + conv_u2s_8_9(operator_8_false_2_operator_8_false_2_operator_8_false_2_mux1h_nl)
      + 9'b000000001;
  assign operator_8_false_acc_ctmp_sva_1 = nl_operator_8_false_acc_ctmp_sva_1[8:0];
  assign VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_1_mx0 = MUX_v_32_2_2(VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3,
      VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_mx0, VCOL_for_asn_16_itm_1);
  assign VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1 = MUX_v_8_12_2((pix_pix_0_lpi_3_dfm_2_mx1w1[7:0]),
      (pix_pix_0_lpi_3_dfm_2_mx1w1[15:8]), (pix_pix_0_lpi_3_dfm_2_mx1w1[23:16]),
      (pix_pix_0_lpi_3_dfm_2_mx1w1[31:24]), (VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_1_mx0[7:0]),
      (VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_1_mx0[15:8]), (VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_1_mx0[23:16]),
      (VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_1_mx0[31:24]), (pix_pix_2_lpi_3_dfm_2_mx0w0[7:0]),
      (pix_pix_2_lpi_3_dfm_2_mx0w0[15:8]), (pix_pix_2_lpi_3_dfm_2_mx0w0[23:16]),
      (pix_pix_2_lpi_3_dfm_2_mx0w0[31:24]), {VCOL_for_for_j_1_0_lpi_3_dfm_2_1 , VCOL_for_for_j_1_0_lpi_3_dfm_2_0
      , VCOL_for_i_2_0_lpi_3_dfm_2_1_0});
  assign VCOL_for_and_3_m1c_1 = (~ VROW_equal_tmp) & VCOL_for_asn_16_itm_1;
  assign nl_VCOL_for_acc_5_tmp = conv_u2s_2_3(VCOL_for_i_2_0_lpi_3_dfm_1_0_1) + 3'b001;
  assign VCOL_for_acc_5_tmp = nl_VCOL_for_acc_5_tmp[2:0];
  assign VCOL_for_for_j_1_0_sva_2_1 = VCOL_for_for_j_1_0_lpi_3_dfm_0_1 ^ VCOL_for_for_j_1_0_lpi_3_dfm_1_1;
  assign VCOL_for_mux_nl = MUX_s_1_2_2(lfst_exit_VCOL_for_lpi_3, lfst_exit_VCOL_for_lpi_3_dfm_1_mx0w0,
      VCOL_stage_0_2);
  assign VCOL_for_VCOL_for_and_1_seb_1 = VCOL_for_mux_nl & (~ exitL_exit_VCOL_for_sva_mx1);
  assign nl_operator_11_true_acc_nl = conv_u2s_8_9(widthIn[9:2]) + 9'b111111111;
  assign operator_11_true_acc_nl = nl_operator_11_true_acc_nl[8:0];
  assign nl_VCOL_if_5_acc_nl = ({1'b1 , VCOL_x_sva}) + conv_u2u_10_11(signext_10_9(~
      operator_11_true_acc_nl)) + 11'b00000000001;
  assign VCOL_if_5_acc_nl = nl_VCOL_if_5_acc_nl[10:0];
  assign VCOL_if_5_acc_itm_10 = readslicef_11_1_10(VCOL_if_5_acc_nl);
  assign or_tmp = VCOL_stage_0_1 | VCOL_stage_0_2;
  assign nor_tmp = VCOL_stage_0_2 & exitL_exit_VCOL_for_sva;
  assign and_dcpl = ~(VCOL_stage_0_2 | VCOL_stage_0_1);
  assign or_dcpl_6 = (~ lfst_exit_VCOL_for_lpi_3) | VCOL_if_5_acc_itm_10 | (~ VCOL_stage_0_2);
  assign and_dcpl_17 = (~ VCOL_for_for_slc_VCOL_for_for_acc_2_svs_2) & (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[1]);
  assign and_dcpl_18 = VCOL_stage_0_3 & exit_VCOL_for_lpi_3_dfm_2_st_2;
  assign or_dcpl_15 = (VCOL_asn_12_itm_2!=9'b000000000);
  assign and_dcpl_33 = and_dcpl_18 & (~ (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[0]));
  assign or_dcpl_20 = (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[0]) | VCOL_for_for_slc_VCOL_for_for_acc_2_svs_2;
  assign or_dcpl_31 = (~ VCOL_stage_0_3) | VCOL_asn_14_itm_1;
  assign and_dcpl_62 = VCOL_stage_0_3 & (~ VCOL_stage_0_2);
  assign and_dcpl_63 = or_tmp & VCOL_asn_14_itm_1;
  assign or_dcpl_34 = VCOL_for_for_slc_VCOL_for_for_acc_2_svs_2 | (~ (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[1]));
  assign or_dcpl_38 = (~ VCOL_stage_0_3) | (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[0]);
  assign or_dcpl_46 = (~ VCOL_for_for_and_stg_2_3_sva_2) | VCOL_asn_14_itm_1;
  assign or_dcpl_47 = ~(VCOL_stage_0_3 & VCOL_for_for_j_1_0_lpi_3_dfm_2_1);
  assign and_dcpl_64 = VCOL_stage_0_3 & (~ VCOL_for_for_j_1_0_lpi_3_dfm_2_1);
  assign or_dcpl_49 = VCOL_for_for_j_1_0_lpi_3_dfm_2_1 | (~ VCOL_for_for_and_stg_2_1_sva_1);
  assign or_dcpl_51 = (VCOL_for_i_2_0_lpi_3_dfm_2_1_0!=2'b00);
  assign or_dcpl_55 = (~ VCOL_for_for_and_stg_2_2_sva_2) | VCOL_asn_14_itm_1;
  assign or_dcpl_57 = (~ VCOL_for_for_and_stg_2_1_sva_1) | VCOL_asn_14_itm_1;
  assign or_dcpl_58 = (~ VCOL_stage_0_3) | VCOL_for_for_j_1_0_lpi_3_dfm_2_1;
  assign or_dcpl_62 = VCOL_for_for_j_1_0_lpi_3_dfm_2_0 | (~ VCOL_for_for_j_1_0_lpi_3_dfm_2_1);
  assign or_dcpl_71 = VCOL_for_for_j_1_0_lpi_3_dfm_2_1 | (~ VCOL_for_for_and_stg_2_3_sva_2);
  assign or_dcpl_72 = or_dcpl_51 | or_dcpl_62;
  assign or_dcpl_73 = VCOL_for_for_j_1_0_lpi_3_dfm_2_1 | (~ VCOL_for_for_and_stg_2_2_sva_2);
  assign or_dcpl_74 = ~(VCOL_for_for_j_1_0_lpi_3_dfm_2_1 & VCOL_for_for_and_stg_2_1_sva_1);
  assign and_dcpl_88 = VCOL_stage_0_3 & VCOL_for_for_j_1_0_lpi_3_dfm_2_1;
  assign or_dcpl_75 = ~(VCOL_for_for_j_1_0_lpi_3_dfm_2_1 & VCOL_for_for_and_stg_2_2_sva_2);
  assign or_dcpl_76 = ~(VCOL_for_for_j_1_0_lpi_3_dfm_2_1 & VCOL_for_for_and_stg_2_3_sva_2);
  assign and_184_cse = (fsm_output[3:2]!=2'b00);
  assign dy_rsci_idat_35_27_mx0c1 = or_dcpl_15 & ((~ (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[0]))
      | VCOL_for_for_slc_VCOL_for_for_acc_2_svs_2 | (~ (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[1])))
      & and_dcpl_18 & (fsm_output[1]);
  assign dy_rsci_idat_8_0_mx0c1 = or_dcpl_15 & (or_dcpl_20 | (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[1]))
      & and_dcpl_18 & (fsm_output[1]);
  assign dy_rsci_idat_26_18_mx0c1 = or_dcpl_15 & (or_dcpl_20 | (~ (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[1])))
      & and_dcpl_18 & (fsm_output[1]);
  assign dy_rsci_idat_17_9_mx0c1 = or_dcpl_15 & and_dcpl_18 & (~ VCOL_for_for_and_24_itm_1)
      & (fsm_output[1]);
  assign dat_out_rsci_idat_31_0_mx0c1 = or_dcpl_15 & and_dcpl_18 & (~ VCOL_for_asn_16_itm_1)
      & (fsm_output[1]);
  assign lfst_exit_VCOL_for_lpi_3_mx0c1 = or_dcpl_6 & VCOL_stage_0_1 & (fsm_output[1]);
  assign line_buf0_rsci_adr_d_pff = VCOL_x_sva[9:1];
  assign line_buf0_rsci_d_d = {pix_pix_0_lpi_3_dfm_mx1 , wrbuf0_pix_31_0_lpi_4};
  assign line_buf0_rsci_we_d_pff = nor_tmp & operator_10_false_operator_10_false_slc_VCOL_x_0_2_itm_1
      & (fsm_output[1]);
  assign line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff = nor_tmp & (~ operator_10_false_operator_10_false_slc_VCOL_x_0_2_itm_1)
      & (fsm_output[1]);
  assign line_buf1_rsci_d_d = rdbuf0_pix_mux_itm;
  always @(posedge clk) begin
    if ( run_wen & ((or_dcpl_15 & and_dcpl_18 & (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[0])
        & and_dcpl_17 & (fsm_output[1])) | dy_rsci_idat_35_27_mx0c1) ) begin
      dy_rsci_idat_35_27 <= MUX_v_9_2_2(operator_8_false_acc_ctmp_sva_1, gradian_list_3_lpi_3,
          dy_rsci_idat_35_27_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((or_dcpl_15 & and_dcpl_33 & (~(VCOL_for_for_slc_VCOL_for_for_acc_2_svs_2
        | (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[1]))) & (fsm_output[1])) | dy_rsci_idat_8_0_mx0c1)
        ) begin
      dy_rsci_idat_8_0 <= MUX_v_9_2_2(operator_8_false_acc_ctmp_sva_1, gradian_list_0_lpi_3,
          dy_rsci_idat_8_0_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((or_dcpl_15 & and_dcpl_33 & and_dcpl_17 & (fsm_output[1])) |
        dy_rsci_idat_26_18_mx0c1) ) begin
      dy_rsci_idat_26_18 <= MUX_v_9_2_2(operator_8_false_acc_ctmp_sva_1, gradian_list_2_lpi_3,
          dy_rsci_idat_26_18_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((or_dcpl_15 & and_dcpl_18 & VCOL_for_for_and_24_itm_1 & (fsm_output[1]))
        | dy_rsci_idat_17_9_mx0c1) ) begin
      dy_rsci_idat_17_9 <= MUX_v_9_2_2(operator_8_false_acc_ctmp_sva_1, gradian_list_1_lpi_3,
          dy_rsci_idat_17_9_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((or_dcpl_15 & and_dcpl_18 & VCOL_for_asn_16_itm_1 & (fsm_output[1]))
        | dat_out_rsci_idat_31_0_mx0c1) ) begin
      dat_out_rsci_idat_31_0 <= MUX_v_32_2_2(VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_mx0,
          VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3, dat_out_rsci_idat_31_0_mx0c1);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VROW_y_sva <= 9'b000000000;
    end
    else if ( rst ) begin
      VROW_y_sva <= 9'b000000000;
    end
    else if ( run_wen & VROW_y_or_cse ) begin
      VROW_y_sva <= MUX_v_9_2_2(9'b000000000, (z_out[8:0]), VROW_y_not_2_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_asn_12_itm_2 <= 9'b000000000;
    end
    else if ( rst ) begin
      VCOL_asn_12_itm_2 <= 9'b000000000;
    end
    else if ( run_wen & lfst_exit_VCOL_for_lpi_3 & VCOL_stage_0_2 ) begin
      VCOL_asn_12_itm_2 <= VCOL_asn_12_itm_1;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_asn_14_itm_1 <= 1'b0;
      exit_VCOL_for_lpi_3_dfm_2_st_2 <= 1'b0;
      VCOL_for_i_2_0_lpi_3_dfm_2_1_0 <= 2'b00;
      VCOL_for_for_slc_VCOL_for_for_acc_2_svs_2 <= 1'b0;
      VCOL_for_for_and_24_itm_1 <= 1'b0;
      VCOL_for_for_and_stg_2_3_sva_2 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_dfm_2_1 <= 1'b0;
      VCOL_for_for_and_stg_2_2_sva_2 <= 1'b0;
      VCOL_for_for_and_stg_2_1_sva_1 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_dfm_2_0 <= 1'b0;
      VCOL_for_asn_16_itm_1 <= 1'b0;
      VCOL_VCOL_nand_tmp_1_1 <= 1'b0;
      VCOL_and_itm_1 <= 1'b0;
      VCOL_and_1_itm_1 <= 1'b0;
      VCOL_if_slc_operator_9_false_acc_9_svs_2 <= 1'b0;
      VCOL_for_and_5_itm_1 <= 1'b0;
    end
    else if ( rst ) begin
      VCOL_asn_14_itm_1 <= 1'b0;
      exit_VCOL_for_lpi_3_dfm_2_st_2 <= 1'b0;
      VCOL_for_i_2_0_lpi_3_dfm_2_1_0 <= 2'b00;
      VCOL_for_for_slc_VCOL_for_for_acc_2_svs_2 <= 1'b0;
      VCOL_for_for_and_24_itm_1 <= 1'b0;
      VCOL_for_for_and_stg_2_3_sva_2 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_dfm_2_1 <= 1'b0;
      VCOL_for_for_and_stg_2_2_sva_2 <= 1'b0;
      VCOL_for_for_and_stg_2_1_sva_1 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_dfm_2_0 <= 1'b0;
      VCOL_for_asn_16_itm_1 <= 1'b0;
      VCOL_VCOL_nand_tmp_1_1 <= 1'b0;
      VCOL_and_itm_1 <= 1'b0;
      VCOL_and_1_itm_1 <= 1'b0;
      VCOL_if_slc_operator_9_false_acc_9_svs_2 <= 1'b0;
      VCOL_for_and_5_itm_1 <= 1'b0;
    end
    else if ( VCOL_and_3_cse ) begin
      VCOL_asn_14_itm_1 <= VCOL_for_VCOL_for_and_3_cse;
      exit_VCOL_for_lpi_3_dfm_2_st_2 <= lfst_exit_VCOL_for_lpi_3;
      VCOL_for_i_2_0_lpi_3_dfm_2_1_0 <= VCOL_for_i_2_0_lpi_3_dfm_1_1_0;
      VCOL_for_for_slc_VCOL_for_for_acc_2_svs_2 <= VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1;
      VCOL_for_for_and_24_itm_1 <= (VCOL_for_i_2_0_lpi_3_dfm_1_1_0==2'b01) & (~ VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1);
      VCOL_for_for_and_stg_2_3_sva_2 <= VCOL_for_for_and_stg_2_3_sva_1;
      VCOL_for_for_j_1_0_lpi_3_dfm_2_1 <= VCOL_for_for_j_1_0_lpi_3_dfm_1_1_1;
      VCOL_for_for_and_stg_2_2_sva_2 <= VCOL_for_for_and_stg_2_2_sva_1;
      VCOL_for_for_and_stg_2_1_sva_1 <= (VCOL_for_i_2_0_lpi_3_dfm_1_1_0==2'b01) &
          (~ VCOL_for_for_j_1_0_lpi_3_dfm_1_0);
      VCOL_for_for_j_1_0_lpi_3_dfm_2_0 <= VCOL_for_for_j_1_0_lpi_3_dfm_1_0;
      VCOL_for_asn_16_itm_1 <= exitL_exit_VCOL_for_sva;
      VCOL_VCOL_nand_tmp_1_1 <= VCOL_VCOL_nand_tmp_1;
      VCOL_and_itm_1 <= (~ (VCOL_x_sva[0])) & VCOL_VCOL_nand_tmp_1 & exitL_exit_VCOL_for_sva;
      VCOL_and_1_itm_1 <= (VCOL_x_sva[0]) & VCOL_VCOL_nand_tmp_1 & exitL_exit_VCOL_for_sva;
      VCOL_if_slc_operator_9_false_acc_9_svs_2 <= VCOL_if_slc_operator_9_false_acc_9_svs_1;
      VCOL_for_and_5_itm_1 <= (~ (VCOL_x_sva[0])) & exitL_exit_VCOL_for_sva;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_for_for_j_1_0_lpi_3_1 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_0 <= 1'b0;
    end
    else if ( rst ) begin
      VCOL_for_for_j_1_0_lpi_3_1 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_0 <= 1'b0;
    end
    else if ( VCOL_for_for_j_and_2_cse ) begin
      VCOL_for_for_j_1_0_lpi_3_1 <= VCOL_for_for_j_1_0_lpi_3_dfm_2_1_mx2w0;
      VCOL_for_for_j_1_0_lpi_3_0 <= VCOL_for_for_and_stg_2_3_sva_1_1;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      lfst_exit_VCOL_for_lpi_3 <= 1'b0;
    end
    else if ( rst ) begin
      lfst_exit_VCOL_for_lpi_3 <= 1'b0;
    end
    else if ( run_wen & (((VCOL_for_VCOL_for_and_3_cse | (~ VCOL_stage_0_1)) & VCOL_stage_0_2
        & (fsm_output[1])) | lfst_exit_VCOL_for_lpi_3_mx0c1) ) begin
      lfst_exit_VCOL_for_lpi_3 <= MUX_s_1_2_2(lfst_exit_VCOL_for_lpi_3_dfm_1_mx0w0,
          and_239_cse, lfst_exit_VCOL_for_lpi_3_mx0c1);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      exitL_exit_VCOL_for_sva <= 1'b0;
      VCOL_stage_0_1 <= 1'b0;
      VCOL_stage_0_2 <= 1'b0;
      VCOL_stage_0_3 <= 1'b0;
      reg_dat_in_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
      reg_line_buf0_rsci_cgo_cse <= 1'b0;
    end
    else if ( rst ) begin
      exitL_exit_VCOL_for_sva <= 1'b0;
      VCOL_stage_0_1 <= 1'b0;
      VCOL_stage_0_2 <= 1'b0;
      VCOL_stage_0_3 <= 1'b0;
      reg_dat_in_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
      reg_line_buf0_rsci_cgo_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      exitL_exit_VCOL_for_sva <= exitL_exit_VCOL_for_sva_mx1 | VROW_y_or_cse;
      VCOL_stage_0_1 <= VCOL_VCOL_and_cse | VROW_y_or_cse;
      VCOL_stage_0_2 <= VCOL_VCOL_and_cse & (~ VROW_y_or_cse);
      VCOL_stage_0_3 <= VCOL_stage_0_2 & (~ VROW_y_or_cse);
      reg_dat_in_rsci_oswt_cse <= mux_12_cse & VCOL_stage_0_1 & (~ operator_9_false_acc_itm_9_1)
          & (fsm_output[1]);
      reg_dat_out_rsci_oswt_cse <= or_dcpl_15 & and_dcpl_18 & (fsm_output[1]);
      reg_line_buf0_rsci_cgo_cse <= and_165_rmff;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_x_sva <= 10'b0000000000;
    end
    else if ( rst ) begin
      VCOL_x_sva <= 10'b0000000000;
    end
    else if ( run_wen & ((lfst_exit_VCOL_for_lpi_3 & VCOL_stage_0_2) | VROW_y_or_cse)
        ) begin
      VCOL_x_sva <= MUX_v_10_2_2(10'b0000000000, z_out, not_165_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      operator_10_false_operator_10_false_slc_VCOL_x_0_2_itm_1 <= 1'b0;
      VCOL_nor_1_itm_1 <= 1'b0;
    end
    else if ( rst ) begin
      operator_10_false_operator_10_false_slc_VCOL_x_0_2_itm_1 <= 1'b0;
      VCOL_nor_1_itm_1 <= 1'b0;
    end
    else if ( operator_10_false_and_cse ) begin
      operator_10_false_operator_10_false_slc_VCOL_x_0_2_itm_1 <= MUX_s_1_2_2((VCOL_x_sva[0]),
          (z_out[0]), VCOL_stage_0_2);
      VCOL_nor_1_itm_1 <= ~((VROW_y_sva[8:1]!=8'b00000000));
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_for_for_j_1_0_lpi_3_dfm_2_1_1 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_dfm_2_1_0 <= 1'b0;
      VCOL_if_slc_operator_9_false_acc_9_svs_1 <= 1'b0;
      VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1 <= 1'b0;
      VCOL_for_for_and_stg_2_2_sva_1 <= 1'b0;
      VCOL_for_for_and_stg_2_3_sva_1 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_dfm_1_1_1 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_dfm_1_0 <= 1'b0;
      VCOL_for_i_2_0_lpi_3_dfm_1_1_0 <= 2'b00;
    end
    else if ( rst ) begin
      VCOL_for_for_j_1_0_lpi_3_dfm_2_1_1 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_dfm_2_1_0 <= 1'b0;
      VCOL_if_slc_operator_9_false_acc_9_svs_1 <= 1'b0;
      VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1 <= 1'b0;
      VCOL_for_for_and_stg_2_2_sva_1 <= 1'b0;
      VCOL_for_for_and_stg_2_3_sva_1 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_dfm_1_1_1 <= 1'b0;
      VCOL_for_for_j_1_0_lpi_3_dfm_1_0 <= 1'b0;
      VCOL_for_i_2_0_lpi_3_dfm_1_1_0 <= 2'b00;
    end
    else if ( VCOL_for_for_j_and_4_cse ) begin
      VCOL_for_for_j_1_0_lpi_3_dfm_2_1_1 <= MUX_s_1_2_2(VCOL_for_for_j_1_0_lpi_3_dfm_2_1_mx2w0,
          VCOL_for_for_j_1_0_sva_2_1, VCOL_for_for_acc_tmp_2);
      VCOL_for_for_j_1_0_lpi_3_dfm_2_1_0 <= MUX_s_1_2_2(VCOL_for_for_and_stg_2_3_sva_1_1,
          (~ VCOL_for_for_j_1_0_lpi_3_dfm_0_1), VCOL_for_for_acc_tmp_2);
      VCOL_if_slc_operator_9_false_acc_9_svs_1 <= operator_9_false_acc_itm_9_1;
      VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1 <= VCOL_for_for_acc_tmp_2;
      VCOL_for_for_and_stg_2_2_sva_1 <= (VCOL_for_i_2_0_lpi_3_dfm_1_0_1==2'b10) &
          (~ VCOL_for_for_j_1_0_lpi_3_dfm_0_1);
      VCOL_for_for_and_stg_2_3_sva_1 <= VCOL_for_for_and_stg_2_3_sva_1_1;
      VCOL_for_for_j_1_0_lpi_3_dfm_1_1_1 <= VCOL_for_for_j_1_0_lpi_3_dfm_1_1;
      VCOL_for_for_j_1_0_lpi_3_dfm_1_0 <= VCOL_for_for_j_1_0_lpi_3_dfm_0_1;
      VCOL_for_i_2_0_lpi_3_dfm_1_1_0 <= VCOL_for_i_2_0_lpi_3_dfm_1_0_1;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_for_i_2_0_lpi_3_dfm_1_1_1_0 <= 2'b00;
    end
    else if ( rst ) begin
      VCOL_for_i_2_0_lpi_3_dfm_1_1_1_0 <= 2'b00;
    end
    else if ( mux_17_nl & run_wen & VCOL_stage_0_1 ) begin
      VCOL_for_i_2_0_lpi_3_dfm_1_1_1_0 <= MUX_v_2_2_2((VCOL_for_acc_5_tmp[1:0]),
          VCOL_for_i_2_0_lpi_3_dfm_1_0_1, VCOL_for_for_acc_tmp_2);
    end
  end
  always @(posedge clk) begin
    if ( (((~ VCOL_asn_14_itm_1) & VCOL_for_asn_16_itm_1 & VCOL_stage_0_3 & (VROW_equal_tmp
        | (~ VCOL_if_slc_operator_9_false_acc_9_svs_2))) | (fsm_output[2]) | (fsm_output[0]))
        & run_wen ) begin
      pix_pix_0_lpi_3 <= MUX_v_32_2_2(pix_pix_0_lpi_3_mx1, VCOL_if_dat_in_pix_slc_dat_in_crt_31_0_2_itm_1,
          VROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( ((VCOL_stage_0_3 & (~ VCOL_asn_14_itm_1) & VCOL_for_and_5_itm_1) | (fsm_output[2])
        | (fsm_output[0])) & run_wen ) begin
      rdbuf0_pix_lpi_3 <= MUX_v_64_2_2(rdbuf0_pix_mux_itm, rdbuf0_pix_lpi_3_dfm_1,
          VROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( mux_18_nl & (fsm_output[3:2]==2'b00) & run_wen ) begin
      VCOL_if_dat_in_pix_slc_dat_in_crt_31_0_2_itm_1 <= MUX_v_32_2_2(dat_in_rsci_idat_mxwt,
          pix_pix_0_lpi_3_dfm_2_mx1w1, and_dcpl_62);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      operator_10_false_operator_10_false_slc_VCOL_x_0_itm_1 <= 1'b0;
    end
    else if ( rst ) begin
      operator_10_false_operator_10_false_slc_VCOL_x_0_itm_1 <= 1'b0;
    end
    else if ( run_wen & nor_tmp ) begin
      operator_10_false_operator_10_false_slc_VCOL_x_0_itm_1 <= VCOL_x_sva[0];
    end
  end
  always @(posedge clk) begin
    if ( VCOL_for_for_j_and_cse & mux_3_nl & (~((~(VCOL_stage_0_3 & (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[0])))
        | or_dcpl_34 | and_dcpl_63)) ) begin
      gradian_list_3_lpi_3 <= operator_8_false_acc_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( VCOL_for_for_j_and_cse & mux_5_nl & (~(or_dcpl_38 | or_dcpl_34 | and_dcpl_63))
        ) begin
      gradian_list_2_lpi_3 <= operator_8_false_acc_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( VCOL_for_for_j_and_cse & mux_7_nl & (~(and_dcpl_63 | (~(VCOL_stage_0_3 &
        VCOL_for_for_and_24_itm_1)))) ) begin
      gradian_list_1_lpi_3 <= operator_8_false_acc_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( VCOL_for_for_j_and_cse & mux_9_nl & (~(or_dcpl_38 | VCOL_for_for_slc_VCOL_for_for_acc_2_svs_2
        | (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[1]) | and_dcpl_63)) ) begin
      gradian_list_0_lpi_3 <= operator_8_false_acc_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((~(or_dcpl_47 | or_dcpl_46)) | VROW_y_or_cse) ) begin
      pix_list_2_3_lpi_3 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_2_3_sva_1, VROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & (~(and_184_cse | ((~((~((or_dcpl_51 | VCOL_for_for_j_1_0_lpi_3_dfm_2_0
        | VCOL_for_for_j_1_0_lpi_3_dfm_2_1 | VCOL_asn_14_itm_1) & or_tmp)) & VCOL_stage_0_3))
        & (fsm_output[1])))) ) begin
      pix_list_0_0_lpi_3 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_0_1_lpi_3, and_199_nl);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((~(or_dcpl_47 | or_dcpl_55)) | VROW_y_or_cse) ) begin
      pix_list_2_2_lpi_3 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_2_2_sva_1, VROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((~(or_dcpl_58 | or_dcpl_57)) | VROW_y_or_cse) ) begin
      pix_list_0_1_lpi_3 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_0_0_lpi_3, VROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((~(or_dcpl_47 | or_dcpl_57)) | VROW_y_or_cse) ) begin
      pix_list_2_1_lpi_3 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_2_1_sva_1, VROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((~(or_dcpl_58 | or_dcpl_55)) | VROW_y_or_cse) ) begin
      pix_list_0_2_lpi_3 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_0_2_sva_1, VROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((~(or_dcpl_38 | (VCOL_for_i_2_0_lpi_3_dfm_2_1_0[1]) | or_dcpl_62
        | VCOL_asn_14_itm_1)) | VROW_y_or_cse) ) begin
      pix_list_2_0_lpi_3 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_2_0_sva_1, VROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((~(or_dcpl_58 | or_dcpl_46)) | VROW_y_or_cse) ) begin
      pix_list_0_3_lpi_3 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_0_3_sva_1, VROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( dat_in_pix_and_cse & (and_dcpl | (~ exitL_exit_VCOL_for_sva)) & (and_80_rgt
        | and_82_rgt | and_84_rgt) ) begin
      VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3 <= MUX1HOT_v_32_3_2(VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3_dfm_mx0,
          (line_buf1_rsci_q_d[63:32]), rdbuf1_pix_lpi_3_63_32, {and_80_rgt , and_82_rgt
          , and_84_rgt});
    end
  end
  always @(posedge clk) begin
    if ( (~((~(and_255_cse | VCOL_and_itm_1 | VCOL_and_1_itm_1)) | VCOL_asn_14_itm_1))
        & VCOL_stage_0_3 & (~ exitL_exit_VCOL_for_sva) & run_wen & or_tmp ) begin
      pix_pix_2_lpi_3 <= pix_pix_2_lpi_3_dfm_2_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( run_wen & ((~(or_dcpl_31 | (~ VCOL_for_and_5_itm_1))) | VROW_y_or_cse) )
        begin
      rdbuf1_pix_lpi_3_63_32 <= MUX_v_32_2_2((line_buf1_rsci_q_d[63:32]), VCOL_if_1_slc_rdbuf0_pix_31_0_pmx_lpi_3,
          VROW_y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & (~((~((z_out[0]) & VCOL_if_5_acc_itm_10)) & lfst_exit_VCOL_for_lpi_3))
        & VCOL_stage_0_2 & VCOL_stage_0_1 & (~((~ exitL_exit_VCOL_for_sva) | (VCOL_x_sva[0])))
        ) begin
      wrbuf0_pix_31_0_lpi_4 <= pix_pix_0_lpi_3_dfm_mx1;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_asn_12_itm_1 <= 9'b000000000;
    end
    else if ( rst ) begin
      VCOL_asn_12_itm_1 <= 9'b000000000;
    end
    else if ( run_wen & or_dcpl_6 & VCOL_stage_0_1 & (~ VCOL_for_for_acc_tmp_2) &
        (VCOL_for_acc_5_tmp[2]) ) begin
      VCOL_asn_12_itm_1 <= VROW_y_sva;
    end
  end
  always @(posedge clk) begin
    if ( rdbuf0_pix_and_itm ) begin
      rdbuf0_pix_lpi_3_dfm_1 <= MUX_v_64_2_2(line_buf0_rsci_q_d, rdbuf0_pix_lpi_3,
          and_87_nl);
      pix_list_2_0_sva_1 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_2_0_lpi_3, and_94_nl);
    end
  end
  always @(posedge clk) begin
    if ( dat_in_pix_and_cse & and_dcpl & ((and_dcpl_64 & VCOL_for_for_and_stg_2_3_sva_2)
        | and_89_rgt) ) begin
      pix_list_0_3_sva_1 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_0_3_lpi_3, and_89_rgt);
    end
  end
  always @(posedge clk) begin
    if ( dat_in_pix_and_cse & and_dcpl & ((and_dcpl_64 & VCOL_for_for_and_stg_2_2_sva_2)
        | and_96_rgt) ) begin
      pix_list_0_2_sva_1 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_0_2_lpi_3, and_96_rgt);
    end
  end
  always @(posedge clk) begin
    if ( dat_in_pix_and_cse & and_dcpl & ((and_dcpl_88 & VCOL_for_for_and_stg_2_1_sva_1)
        | and_99_rgt) ) begin
      pix_list_2_1_sva_1 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_2_1_lpi_3, and_99_rgt);
    end
  end
  always @(posedge clk) begin
    if ( dat_in_pix_and_cse & and_dcpl & ((and_dcpl_88 & VCOL_for_for_and_stg_2_2_sva_2)
        | and_101_rgt) ) begin
      pix_list_2_2_sva_1 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_2_2_lpi_3, and_101_rgt);
    end
  end
  always @(posedge clk) begin
    if ( dat_in_pix_and_cse & and_dcpl & ((and_dcpl_88 & VCOL_for_for_and_stg_2_3_sva_2)
        | and_103_rgt) ) begin
      pix_list_2_3_sva_1 <= MUX_v_8_2_2(VCOL_for_for_VCOL_for_for_rshift_1_ctmp_sva_1,
          pix_list_2_3_lpi_3, and_103_rgt);
    end
  end
  assign VROW_y_not_2_nl = ~ (fsm_output[0]);
  assign not_165_nl = ~ VROW_y_or_cse;
  assign or_170_nl = exitL_exit_VCOL_for_sva | (~((~ lfst_exit_VCOL_for_lpi_3) |
      (VCOL_for_acc_5_tmp[2])));
  assign mux_16_nl = MUX_s_1_2_2(exitL_exit_VCOL_for_sva, or_170_nl, VCOL_for_for_j_1_0_lpi_3_1);
  assign mux_14_nl = MUX_s_1_2_2((~ (VCOL_for_acc_5_tmp[2])), VCOL_if_5_acc_itm_10,
      lfst_exit_VCOL_for_lpi_3);
  assign mux_15_nl = MUX_s_1_2_2(and_258_cse, mux_14_nl, VCOL_for_for_j_1_0_lpi_3_dfm_2_1_1);
  assign mux_17_nl = MUX_s_1_2_2(mux_16_nl, mux_15_nl, VCOL_stage_0_2);
  assign nor_26_nl = ~((~((~ VCOL_for_asn_16_itm_1) | VCOL_if_slc_operator_9_false_acc_9_svs_2
      | VROW_equal_tmp)) | VCOL_stage_0_1 | (~ VCOL_stage_0_3));
  assign nor_27_nl = ~(VCOL_if_slc_operator_9_false_acc_9_svs_1 | (~ exitL_exit_VCOL_for_sva));
  assign mux_18_nl = MUX_s_1_2_2(nor_26_nl, nor_27_nl, VCOL_stage_0_2);
  assign nand_4_nl = ~(VCOL_stage_0_2 & (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[1]) & (~
      VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1) & (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[0]));
  assign or_5_nl = (~ (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[1])) | VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1
      | (~ (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[0]));
  assign mux_2_nl = MUX_s_1_2_2(exitL_exit_VCOL_for_sva, or_5_nl, VCOL_stage_0_2);
  assign mux_3_nl = MUX_s_1_2_2(nand_4_nl, mux_2_nl, nor_1_cse);
  assign or_11_nl = (~ VCOL_stage_0_2) | (~ (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[1]))
      | VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1 | (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[0]);
  assign or_9_nl = (~ (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[1])) | VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1
      | (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[0]);
  assign mux_4_nl = MUX_s_1_2_2(exitL_exit_VCOL_for_sva, or_9_nl, VCOL_stage_0_2);
  assign mux_5_nl = MUX_s_1_2_2(or_11_nl, mux_4_nl, nor_1_cse);
  assign or_16_nl = (~ VCOL_stage_0_2) | (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[1]) | VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1
      | (~ (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[0]));
  assign or_13_nl = (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[1]) | VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1
      | (~ (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[0]));
  assign mux_6_nl = MUX_s_1_2_2(exitL_exit_VCOL_for_sva, or_13_nl, VCOL_stage_0_2);
  assign mux_7_nl = MUX_s_1_2_2(or_16_nl, mux_6_nl, nor_1_cse);
  assign or_20_nl = (~ VCOL_stage_0_2) | (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[1]) | VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1
      | (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[0]);
  assign or_17_nl = (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[1]) | VCOL_for_for_slc_VCOL_for_for_acc_2_svs_st_1
      | (VCOL_for_i_2_0_lpi_3_dfm_1_1_0[0]);
  assign mux_8_nl = MUX_s_1_2_2((~ exitL_exit_VCOL_for_sva), or_17_nl, VCOL_stage_0_2);
  assign mux_9_nl = MUX_s_1_2_2(or_20_nl, mux_8_nl, nor_1_cse);
  assign and_199_nl = or_dcpl_49 & VCOL_stage_0_3 & and_dcpl & (fsm_output[1]);
  assign and_87_nl = VCOL_stage_0_3 & (~ VCOL_for_and_5_itm_1);
  assign and_94_nl = or_dcpl_72 & VCOL_stage_0_3;
  assign VROW_VROW_and_1_nl = (VCOL_x_sva[9]) & (fsm_output[1]);
  assign VROW_mux_2_nl = MUX_v_9_2_2(VROW_y_sva, (VCOL_x_sva[8:0]), fsm_output[1]);
  assign nl_z_out = ({VROW_VROW_and_1_nl , VROW_mux_2_nl}) + 10'b0000000001;
  assign z_out = nl_z_out[9:0];

  function automatic [31:0] MUX1HOT_v_32_3_2;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [2:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | (input_1 & {32{sel[1]}});
    result = result | (input_2 & {32{sel[2]}});
    MUX1HOT_v_32_3_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_4_2;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [3:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | (input_1 & {32{sel[1]}});
    result = result | (input_2 & {32{sel[2]}});
    result = result | (input_3 & {32{sel[3]}});
    MUX1HOT_v_32_4_2 = result;
  end
  endfunction


  function automatic [7:0] MUX1HOT_v_8_5_2;
    input [7:0] input_4;
    input [7:0] input_3;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [4:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | (input_1 & {8{sel[1]}});
    result = result | (input_2 & {8{sel[2]}});
    result = result | (input_3 & {8{sel[3]}});
    result = result | (input_4 & {8{sel[4]}});
    MUX1HOT_v_8_5_2 = result;
  end
  endfunction


  function automatic  MUX_s_1_2_2;
    input  input_0;
    input  input_1;
    input  sel;
    reg  result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function automatic [9:0] MUX_v_10_2_2;
    input [9:0] input_0;
    input [9:0] input_1;
    input  sel;
    reg [9:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_10_2_2 = result;
  end
  endfunction


  function automatic [1:0] MUX_v_2_2_2;
    input [1:0] input_0;
    input [1:0] input_1;
    input  sel;
    reg [1:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_2_2_2 = result;
  end
  endfunction


  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input  sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction


  function automatic [63:0] MUX_v_64_2_2;
    input [63:0] input_0;
    input [63:0] input_1;
    input  sel;
    reg [63:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_64_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_12_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input [7:0] input_2;
    input [7:0] input_3;
    input [7:0] input_4;
    input [7:0] input_5;
    input [7:0] input_6;
    input [7:0] input_7;
    input [7:0] input_8;
    input [7:0] input_9;
    input [7:0] input_10;
    input [7:0] input_11;
    input [3:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      4'b0000 : begin
        result = input_0;
      end
      4'b0001 : begin
        result = input_1;
      end
      4'b0010 : begin
        result = input_2;
      end
      4'b0011 : begin
        result = input_3;
      end
      4'b0100 : begin
        result = input_4;
      end
      4'b0101 : begin
        result = input_5;
      end
      4'b0110 : begin
        result = input_6;
      end
      4'b0111 : begin
        result = input_7;
      end
      4'b1000 : begin
        result = input_8;
      end
      4'b1001 : begin
        result = input_9;
      end
      4'b1010 : begin
        result = input_10;
      end
      default : begin
        result = input_11;
      end
    endcase
    MUX_v_8_12_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_2_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input  sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function automatic [0:0] readslicef_10_1_9;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 9;
    readslicef_10_1_9 = tmp[0:0];
  end
  endfunction


  function automatic [0:0] readslicef_11_1_10;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 10;
    readslicef_11_1_10 = tmp[0:0];
  end
  endfunction


  function automatic [9:0] signext_10_9;
    input [8:0] vector;
  begin
    signext_10_9= {{1{vector[8]}}, vector};
  end
  endfunction


  function automatic [2:0] conv_u2s_2_3 ;
    input [1:0]  vector ;
  begin
    conv_u2s_2_3 =  {1'b0, vector};
  end
  endfunction


  function automatic [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 =  {1'b0, vector};
  end
  endfunction


  function automatic [9:0] conv_u2s_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2s_9_10 =  {1'b0, vector};
  end
  endfunction


  function automatic [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_struct
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_struct (
  clk, rst, arst_n, dat_in_rsc_dat_eol, dat_in_rsc_dat_sof, dat_in_rsc_dat_pix, dat_in_rsc_vld,
      dat_in_rsc_rdy, widthIn, heightIn, dat_out_rsc_dat_eol, dat_out_rsc_dat_sof,
      dat_out_rsc_dat_pix, dat_out_rsc_vld, dat_out_rsc_rdy, dy_rsc_dat, dy_rsc_vld,
      dy_rsc_rdy, line_buf0_rsc_en, line_buf0_rsc_q, line_buf0_rsc_we, line_buf0_rsc_d,
      line_buf0_rsc_adr, line_buf1_rsc_en, line_buf1_rsc_q, line_buf1_rsc_we, line_buf1_rsc_d,
      line_buf1_rsc_adr
);
  input clk;
  input rst;
  input arst_n;
  input dat_in_rsc_dat_eol;
  input dat_in_rsc_dat_sof;
  input [31:0] dat_in_rsc_dat_pix;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output dat_out_rsc_dat_eol;
  output dat_out_rsc_dat_sof;
  output [31:0] dat_out_rsc_dat_pix;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  output line_buf0_rsc_en;
  input [63:0] line_buf0_rsc_q;
  output line_buf0_rsc_we;
  output [63:0] line_buf0_rsc_d;
  output [8:0] line_buf0_rsc_adr;
  output line_buf1_rsc_en;
  input [63:0] line_buf1_rsc_q;
  output line_buf1_rsc_we;
  output [63:0] line_buf1_rsc_d;
  output [8:0] line_buf1_rsc_adr;


  // Interconnect Declarations
  wire [63:0] line_buf0_rsci_d_d;
  wire line_buf0_rsci_en_d;
  wire [63:0] line_buf0_rsci_q_d;
  wire [63:0] line_buf1_rsci_d_d;
  wire [63:0] line_buf1_rsci_q_d;
  wire [33:0] dat_out_rsc_dat;
  wire [8:0] line_buf0_rsci_adr_d_iff;
  wire line_buf0_rsci_we_d_iff;
  wire line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [33:0] nl_EdgeDetect_IP_EdgeDetect_VerDer_run_inst_dat_in_rsc_dat;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_run_inst_dat_in_rsc_dat = {dat_in_rsc_dat_eol
      , dat_in_rsc_dat_sof , dat_in_rsc_dat_pix};
  EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_6_64_9_320_320_64_5_gen
      line_buf0_rsci (
      .en(line_buf0_rsc_en),
      .q(line_buf0_rsc_q),
      .we(line_buf0_rsc_we),
      .d(line_buf0_rsc_d),
      .adr(line_buf0_rsc_adr),
      .adr_d(line_buf0_rsci_adr_d_iff),
      .d_d(line_buf0_rsci_d_d),
      .en_d(line_buf0_rsci_en_d),
      .we_d(line_buf0_rsci_we_d_iff),
      .q_d(line_buf0_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff),
      .port_0_rw_ram_ir_internal_WMASK_B_d(line_buf0_rsci_we_d_iff)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_7_64_9_320_320_64_5_gen
      line_buf1_rsci (
      .en(line_buf1_rsc_en),
      .q(line_buf1_rsc_q),
      .we(line_buf1_rsc_we),
      .d(line_buf1_rsc_d),
      .adr(line_buf1_rsc_adr),
      .adr_d(line_buf0_rsci_adr_d_iff),
      .d_d(line_buf1_rsci_d_d),
      .en_d(line_buf0_rsci_en_d),
      .we_d(line_buf0_rsci_we_d_iff),
      .q_d(line_buf1_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff),
      .port_0_rw_ram_ir_internal_WMASK_B_d(line_buf0_rsci_we_d_iff)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run EdgeDetect_IP_EdgeDetect_VerDer_run_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(nl_EdgeDetect_IP_EdgeDetect_VerDer_run_inst_dat_in_rsc_dat[33:0]),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .dy_rsc_dat(dy_rsc_dat),
      .dy_rsc_vld(dy_rsc_vld),
      .dy_rsc_rdy(dy_rsc_rdy),
      .line_buf0_rsci_d_d(line_buf0_rsci_d_d),
      .line_buf0_rsci_en_d(line_buf0_rsci_en_d),
      .line_buf0_rsci_q_d(line_buf0_rsci_q_d),
      .line_buf1_rsci_d_d(line_buf1_rsci_d_d),
      .line_buf1_rsci_q_d(line_buf1_rsci_q_d),
      .line_buf0_rsci_adr_d_pff(line_buf0_rsci_adr_d_iff),
      .line_buf0_rsci_we_d_pff(line_buf0_rsci_we_d_iff),
      .line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff(line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff)
    );
  assign dat_out_rsc_dat_pix = dat_out_rsc_dat[31:0];
  assign dat_out_rsc_dat_sof = dat_out_rsc_dat[32];
  assign dat_out_rsc_dat_eol = dat_out_rsc_dat[33];
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, dy_rsc_dat, dy_rsc_vld,
      dy_rsc_rdy, line_buf0_rsc_en, line_buf0_rsc_q, line_buf0_rsc_we, line_buf0_rsc_d,
      line_buf0_rsc_adr, line_buf1_rsc_en, line_buf1_rsc_q, line_buf1_rsc_we, line_buf1_rsc_d,
      line_buf1_rsc_adr
);
  input clk;
  input rst;
  input arst_n;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  output line_buf0_rsc_en;
  input [63:0] line_buf0_rsc_q;
  output line_buf0_rsc_we;
  output [63:0] line_buf0_rsc_d;
  output [8:0] line_buf0_rsc_adr;
  output line_buf1_rsc_en;
  input [63:0] line_buf1_rsc_q;
  output line_buf1_rsc_we;
  output [63:0] line_buf1_rsc_d;
  output [8:0] line_buf1_rsc_adr;


  // Interconnect Declarations
  wire dat_out_rsc_dat_eol;
  wire dat_out_rsc_dat_sof;
  wire [31:0] dat_out_rsc_dat_pix;


  // Interconnect Declarations for Component Instantiations 
  wire  nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_eol;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_eol = dat_in_rsc_dat[33];
  wire  nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_sof;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_sof = dat_in_rsc_dat[32];
  wire [31:0] nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_pix;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_pix = dat_in_rsc_dat[31:0];
  EdgeDetect_IP_EdgeDetect_VerDer_struct EdgeDetect_IP_EdgeDetect_VerDer_struct_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat_eol(nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_eol),
      .dat_in_rsc_dat_sof(nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_sof),
      .dat_in_rsc_dat_pix(nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_pix[31:0]),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat_eol(dat_out_rsc_dat_eol),
      .dat_out_rsc_dat_sof(dat_out_rsc_dat_sof),
      .dat_out_rsc_dat_pix(dat_out_rsc_dat_pix),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .dy_rsc_dat(dy_rsc_dat),
      .dy_rsc_vld(dy_rsc_vld),
      .dy_rsc_rdy(dy_rsc_rdy),
      .line_buf0_rsc_en(line_buf0_rsc_en),
      .line_buf0_rsc_q(line_buf0_rsc_q),
      .line_buf0_rsc_we(line_buf0_rsc_we),
      .line_buf0_rsc_d(line_buf0_rsc_d),
      .line_buf0_rsc_adr(line_buf0_rsc_adr),
      .line_buf1_rsc_en(line_buf1_rsc_en),
      .line_buf1_rsc_q(line_buf1_rsc_q),
      .line_buf1_rsc_we(line_buf1_rsc_we),
      .line_buf1_rsc_d(line_buf1_rsc_d),
      .line_buf1_rsc_adr(line_buf1_rsc_adr)
    );
  assign dat_out_rsc_dat = {dat_out_rsc_dat_eol , dat_out_rsc_dat_sof , dat_out_rsc_dat_pix};
endmodule




//------> /usr/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_genreg_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

module ccs_genreg_v1 (clk, en, arst, srst, d, z);
    parameter integer width   = 1;
    parameter integer ph_clk  = 1;
    parameter integer ph_en   = 1;
    parameter integer ph_arst = 0;
    parameter integer ph_srst = 1;
    parameter         has_en  = 1'b1;

    input clk;
    input en;
    input arst;
    input srst;
    input      [width-1:0] d;
    output reg [width-1:0] z;

    //  Generate parameters
    //  ph_clk | ph_arst | has_en     Label:
    //    1        1          1       GEN_CLK1_ARST1_EN1
    //    1        1          0       GEN_CLK1_ARST1_EN0
    //    1        0          1       GEN_CLK1_ARST0_EN1
    //    1        0          0       GEN_CLK1_ARST0_EN0
    //    0        1          1       GEN_CLK0_ARST1_EN1
    //    0        1          0       GEN_CLK0_ARST1_EN0
    //    0        0          1       GEN_CLK0_ARST0_EN1
    //    0        0          0       GEN_CLK0_ARST0_EN0
    
    generate 
      // Pos edge clock, pos edge async reset, has enable
      if (ph_clk == 1 & ph_arst == 1 & has_en == 1)
      begin: GEN_CLK1_ARST1_EN1
        always @(posedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK1_ARST1_EN1

      // Pos edge clock, pos edge async reset, no enable
      else if (ph_clk == 1 & ph_arst == 1 & has_en == 0)
      begin: GEN_CLK1_ARST1_EN0
        always @(posedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK1_ARST1_EN0

      // Pos edge clock, neg edge async reset, has enable
      else if (ph_clk == 1 & ph_arst == 0 & has_en == 1)
      begin: GEN_CLK1_ARST0_EN1
        always @(posedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK1_ARST0_EN1

      // Pos edge clock, neg edge async reset, no enable
      else if (ph_clk == 1 & ph_arst == 0 & has_en == 0)
      begin: GEN_CLK1_ARST0_EN0
        always @(posedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK1_ARST0_EN0


      // Neg edge clock, pos edge async reset, has enable
      if (ph_clk == 0 & ph_arst == 1 & has_en == 1)
      begin: GEN_CLK0_ARST1_EN1
        always @(negedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK0_ARST1_EN1

      // Neg edge clock, pos edge async reset, no enable
      else if (ph_clk == 0 & ph_arst == 1 & has_en == 0)
      begin: GEN_CLK0_ARST1_EN0
        always @(negedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK0_ARST1_EN0

      // Neg edge clock, neg edge async reset, has enable
      else if (ph_clk == 0 & ph_arst == 0 & has_en == 1)
      begin: GEN_CLK0_ARST0_EN1
        always @(negedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK0_ARST0_EN1

      // Neg edge clock, neg edge async reset, no enable
      else if (ph_clk == 0 & ph_arst == 0 & has_en == 0)
      begin: GEN_CLK0_ARST0_EN0
        always @(negedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK0_ARST0_EN0
    endgenerate
endmodule


//------> /usr/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_fifo_wait_core_v5.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

/*
 *            _________________________________________________
 * WRITER    |                                                 |   READER
 *           |               ccs_fifo_wait_core                |
 *           |             _____________________               |
 *        --<|  din_rdy --<|  ---------------- <|--- dout_rdy <|---
 *           |             |       FIFO         |              |
 *        ---|> din_vld ---|> ----------------  |>-- dout_vld  |>--
 *        ---|>     din ---|> ----------------  |>-- dout      |>--
 *           |             |____________________|              |
 *           |_________________________________________________|
 *
 *    rdy    - can be considered as a notFULL signal
 *    vld    - can be considered as a notEMPTY signal
 *    is_idle - clk can be safely gated
 *
 * Change History:
 *    2019-01-24 - Add assertion to verify rdy signal behavior under reset.
 *                 Fix bug in that behavior.
 */

module ccs_fifo_wait_core_v5 (clk, en, arst, srst, din_vld, din_rdy, din, dout_vld, dout_rdy, dout, sd, is_idle);

    parameter integer rscid    = 0;     // resource ID
    parameter integer width    = 8;     // fifo width
    parameter integer sz_width = 8;     // size of port for elements in fifo
    parameter integer fifo_sz  = 8;     // fifo depth
    parameter integer ph_clk   = 1;     // clock polarity 1=rising edge, 0=falling edge
    parameter integer ph_en    = 1;     // clock enable polarity
    parameter integer ph_arst  = 1;     // async reset polarity
    parameter integer ph_srst  = 1;     // sync reset polarity
    parameter integer ph_log2  = 3;     // log2(fifo_sz)

    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 din_vld;    // writer has valid data
    output                din_rdy;    // fifo ready for data (not full)
    input  [width-1:0]    din;
    output                dout_vld;   // fifo has valid data (not empty)
    input                 dout_rdy;   // reader ready for data
    output [width-1:0]    dout;
    output [sz_width-1:0] sd;
    output                is_idle;

    localparam integer fifo_b  = width * fifo_sz;
    localparam integer fifo_mx = (fifo_sz > 0) ? (fifo_sz-1) : 0 ;
    localparam integer fifo_mx_over_8 = fifo_mx / 8 ;

    reg      [fifo_mx:0] stat_pre;
    wire     [fifo_mx:0] stat;
    reg      [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff_pre;
    wire     [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff;
    reg      [fifo_mx:0] en_l;
    reg      [fifo_mx_over_8:0] en_l_s;

    reg      [width-1:0] buff_nxt;

    reg                  stat_nxt;
    reg                  stat_behind;
    reg                  stat_ahead;
    reg                  stat_tail;
    reg                  en_l_var;

    integer              i;
    genvar               eni;

    wire [32:0]          size_t;
    reg  [31:0]          count;
    reg  [31:0]          count_t;
    reg  [32:0]          n_elem;
    wire                 din_rdy_drv;
    wire                 dout_vld_drv;
    wire                 din_vld_int;
    wire                 hs_init;
    wire                 active;
    wire                 is_idle_drv;

    // synopsys translate_off
    reg  [31:0]          peak;
    initial
    begin
      peak  = 32'b0;
    end
    // synopsys translate_on

    assign din_rdy = din_rdy_drv;
    assign dout_vld = dout_vld_drv;
    assign is_idle = is_idle_drv;

    generate
    if ( fifo_sz > 0 )
    begin: FIFO_REG
      assign din_vld_int = din_vld & hs_init;
      assign din_rdy_drv = (dout_rdy | (~stat[0])) & hs_init;
      assign dout_vld_drv = din_vld_int | stat[fifo_sz-1];

      assign active = (din_vld_int & din_rdy_drv) | (dout_rdy & dout_vld_drv);
      assign is_idle_drv = (~active) & hs_init;

      assign size_t = (count - {31'b0, (dout_rdy & stat[fifo_sz-1])}) + {31'b0, din_vld_int};
      assign sd = size_t[sz_width-1:0];

      assign dout = (stat[fifo_sz-1]) ? buff[fifo_b-1:width*(fifo_sz-1)] : din;

      always @(*)
      begin: FIFOPROC
        n_elem = 33'b0;
        for (i = fifo_sz-1; i >= 0; i = i - 1)
        begin
          stat_behind = (i != 0) ? stat[i-1] : 1'b0;
          stat_ahead  = (i != (fifo_sz-1)) ? stat[i+1] : 1'b1;

          // Determine if this buffer element will have data
          stat_nxt = stat_ahead &                       // valid element ahead of this one (or head)
                       (stat_behind                     // valid element behind this one
                         | (stat[i] & (~dout_rdy))      // valid element and output not ready (in use and not shifted)
                         | (stat[i] & din_vld_int)      // valid element and input has data
                         | (din_vld_int & (~dout_rdy))  // input has data and output not ready
                       );
          stat_pre[i] = stat_nxt;

          // First empty elem when not shifting or last valid elem after shifting (assumes stat_behind == 0)
          stat_tail = stat_ahead & (((~stat[i]) & (~dout_rdy)) | (stat[i] & dout_rdy));

          if (dout_rdy & stat_behind)
          begin
            // shift valid element
            buff_nxt[0+:width] = buff[width*(i-1)+:width];
            en_l_var = 1'b1;
          end
          else if (din_vld_int & stat_tail)
          begin
            // update tail with input data
            buff_nxt = din;
            en_l_var = 1'b1;
          end
          else
          begin
            // no-op, disable register
            buff_nxt = din; // Don't care input to disabled flop
            en_l_var = 1'b0;
          end
          buff_pre[width*i+:width] = buff_nxt[0+:width];

          if (ph_en != 0)
            en_l[i] = en & en_l_var;
          else
            en_l[i] = en | ~en_l_var;

          if ((stat_ahead == 1'b1) & (stat[i] == 1'b0))
            //found tail, update the number of elements for count
            n_elem = ($unsigned(fifo_sz) - 1) - $unsigned(i);
        end //for loop

        // Enable for stat registers (partitioned into banks of eight)
        // Take care of the head first
        if (ph_en != 0)
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = en & active;
        else
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = en | ~active;

        // Now every eight
        for (i = fifo_sz-1; i >= 7; i = i - 1)
        begin
          if (($unsigned(i) % 32'd8) == 0)
          begin
            if (ph_en != 0)
              en_l_s[(i/8)-1] = en & (stat[i]) & (active);
            else
              en_l_s[(i/8)-1] = (en) | (~stat[i]) | (~active);
          end
        end

        // Update count and peak
        if ( stat[fifo_sz-1] == 1'b0 )
          count_t = 32'b0;
        else if ( stat[0] == 1'b1 )
          count_t = fifo_sz;
        else
          count_t = n_elem[31:0];
        count = count_t;
        // synopsys translate_off
        peak = (peak < count) ? count : peak;
        // synopsys translate_on
      end //FIFOPROC

      // Handshake valid after reset
      ccs_genreg_v1
      #(
        .width   (1),
        .ph_clk  (ph_clk),
        .ph_en   (1),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .has_en  (1'b0)
      )
      HS_INIT_REG
      (
        .clk     (clk),
        .en      (1'b1),
        .arst    (arst),
        .srst    (srst),
        .d       (1'b1),
        .z       (hs_init)
      );

      // Buffer and status registers
      for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
      begin: GEN_REGS
        ccs_genreg_v1
        #(
          .width   (1),
          .ph_clk  (ph_clk),
          .ph_en   (ph_en),
          .ph_arst (ph_arst),
          .ph_srst (ph_srst),
          .has_en  (1'b1)
        )
        STATREG
        (
          .clk     (clk),
          .en      (en_l_s[eni/8]),
          .arst    (arst),
          .srst    (srst),
          .d       (stat_pre[eni]),
          .z       (stat[eni])
        );

        ccs_genreg_v1
        #(
          .width   (width),
          .ph_clk  (ph_clk),
          .ph_en   (ph_en),
          .ph_arst (ph_arst),
          .ph_srst (ph_srst),
          .has_en  (1'b1)
        )
        BUFREG
        (
          .clk     (clk),
          .en      (en_l[eni]),
          .arst    (arst),
          .srst    (srst),
          .d       (buff_pre[width*eni+:width]),
          .z       (buff[width*eni+:width])
        );
      end

    end
    else
    begin: FEED_THRU
      assign din_rdy_drv  = dout_rdy;
      assign dout_vld_drv = din_vld;
      assign dout     = din;
      // non-blocking is not II=1 when fifo_sz=0
      assign sd = {{(sz_width-1){1'b0}}, (din_vld & ~dout_rdy)};
      assign is_idle_drv = ~(din_vld & dout_rdy);
    end
    endgenerate

`ifdef RDY_ASRT
    generate
    if (ph_clk==1)
    begin: POS_CLK_ASSERT

       property rdyAsrt ;
         @(posedge clk) (srst==ph_srst) |=> (din_rdy==0);
       endproperty
       a1Pos: assert property(rdyAsrt);

       property rdyAsrtASync ;
         @(posedge clk) (arst==ph_arst) |-> (din_rdy==0);
       endproperty
       a2Pos: assert property(rdyAsrtASync);

    end else if (ph_clk==0)
    begin: NEG_CLK_ASSERT

       property rdyAsrt ;
         @(negedge clk) ((srst==ph_srst) || (arst==ph_arst)) |=> (din_rdy==0);
       endproperty
       a1Neg: assert property(rdyAsrt);

       property rdyAsrtASync ;
         @(negedge clk) (arst==ph_arst) |-> (din_rdy==0);
       endproperty
       a2Neg: assert property(rdyAsrtASync);

    end
    endgenerate
`endif

endmodule

//------> /usr/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_pipe_v6.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------
/*
 *
 *            _______________________________________________
 * WRITER    |                                              |          READER
 *           |                 ccs_pipe                     |
 *           |            ______________________            |
 *        --<| din_rdy --<|  ---------------- <|---dout_rdy<|---
 *           |            |       FIFO         |            |
 *        ---|>din_vld ---|> ----------------  |>--dout_vld |>--
 *        ---|>din -------|> ----------------  |> -----dout |>--
 *           |            |____________________|            |
 *           |______________________________________________|
 *
 *    din_rdy     - can be considered as a notFULL signal
 *    dout_vld    - can be considered as a notEMPTY signal
 *    write_stall - an internal debug signal formed from din_vld & !din_rdy
 *    read_stall  - an internal debug signal formed from dout_rdy & !dout_vld
 *    is_idle     - indicates the clock can be safely gated
 *    stall_ctrl  - Stall the pipe(fifo).  Used by STALL_FLAG_SV directive
 */

module ccs_pipe_v6 (clk, en, arst, srst, din_rdy, din_vld, din, dout_rdy, dout_vld, dout, 
                    sz, sz_req, is_idle);

    parameter integer rscid    = 0; // resource ID
    parameter integer width    = 8; // fifo width
    parameter integer sz_width = 8; // width of size of elements in fifo
    parameter integer fifo_sz  = 8; // fifo depth
    parameter integer log2_sz  = 3; // log2(fifo_sz)
    parameter integer ph_clk   = 1; // clock polarity 1=rising edge, 0=falling edge
    parameter integer ph_en    = 1; // clock enable polarity
    parameter integer ph_arst  = 1; // async reset polarity
    parameter integer ph_srst  = 1; // sync reset polarity

    // clock 
    input              clk;
    input              en;
    input              arst;
    input              srst;

    // writer
    output             din_rdy;
    input              din_vld;
    input  [width-1:0] din;

    // reader
    input              dout_rdy;
    output             dout_vld;
    output [width-1:0] dout;

    // size
    output [sz_width-1:0] sz;
    input                 sz_req;
    output                is_idle;

    localparam stallOff = 0; 
    wire                  stall_ctrl;
    assign stall_ctrl = stallOff;
   
    // synopsys translate_off
    wire   write_stall;
    wire   read_stall;
    assign write_stall = (din_vld & !din_rdy) | stall_ctrl;
    assign read_stall  = (dout_rdy & !dout_vld) | stall_ctrl;
    // synopsys translate_on

    wire    tmp_din_rdy;
    assign  din_rdy = tmp_din_rdy & !stall_ctrl;
    wire    tmp_dout_vld;
    assign  dout_vld = tmp_dout_vld & !stall_ctrl;
   
    ccs_fifo_wait_core_v5
    #(
        .rscid    (rscid),
        .width    (width),
        .sz_width (sz_width),
        .fifo_sz  (fifo_sz),
        .ph_clk   (ph_clk),
        .ph_en    (ph_en),
        .ph_arst  (ph_arst),
        .ph_srst  (ph_srst),
        .ph_log2  (log2_sz)
    )
    FIFO
    (
        .clk      (clk),
        .en       (en),
        .arst     (arst),
        .srst     (srst),
        .din_vld  (din_vld & !stall_ctrl),
        .din_rdy  (tmp_din_rdy),
        .din      (din),
        .dout_vld (tmp_dout_vld),
        .dout_rdy (dout_rdy & !stall_ctrl),
        .dout     (dout),
        .sd       (sz),
        .is_idle  (is_idle)
    );

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.2/1059873 Production Release
//  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
// 
//  Generated by:   m11102154@cad27
//  Generated date: Sat Apr  6 14:38:35 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_Top
// ------------------------------------------------------------------


module EdgeDetect_Top_b (
  clk, rst, arst_n, widthIn, heightIn, sw_in, sw_in_triosy_lz, crc32_pix_in_rsc_dat,
      crc32_pix_in_rsc_lzout, crc32_pix_in_triosy_lz, crc32_dat_out_rsc_dat,
      crc32_dat_out_rsc_lzout, crc32_dat_out_triosy_lz, dat_in_rsc_dat,
      dat_in_rsc_vld, dat_in_rsc_rdy, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy,
      line_buf0_rsc_en, line_buf0_rsc_q, line_buf0_rsc_we, line_buf0_rsc_d, line_buf0_rsc_adr,
      line_buf1_rsc_en, line_buf1_rsc_q, line_buf1_rsc_we, line_buf1_rsc_d, line_buf1_rsc_adr
);
  input clk;
  input rst;
  input arst_n;
  input [9:0] widthIn;
  input [8:0] heightIn;
  input sw_in;
  output sw_in_triosy_lz;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_rsc_lzout;
  wire  [31:0] crc32_pix_in_rsc_zin;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_rsc_lzout;
  wire [31:0] crc32_dat_out_rsc_zin;
  output crc32_dat_out_triosy_lz;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  output [33:0] dat_out_rsc_dat;//
  assign dat_out_rsc_dat=0;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output line_buf0_rsc_en;
  input [63:0] line_buf0_rsc_q;
  output line_buf0_rsc_we;
  output [63:0] line_buf0_rsc_d;
  output [8:0] line_buf0_rsc_adr;
  output line_buf1_rsc_en;
  input [63:0] line_buf1_rsc_q;
  output line_buf1_rsc_we;
  output [63:0] line_buf1_rsc_d;
  output [8:0] line_buf1_rsc_adr;


  // Interconnect Declarations
  wire [33:0] dat_out_rsc_dat_n_VerDer_inst;
  wire [35:0] dy_rsc_dat_n_VerDer_inst;
  wire dy_rsc_rdy_n_VerDer_inst;
  wire line_buf0_rsc_en_n_VerDer_inst;
  wire [63:0] line_buf0_rsc_d_n_VerDer_inst;
  wire [8:0] line_buf0_rsc_adr_n_VerDer_inst;
  wire line_buf1_rsc_en_n_VerDer_inst;
  wire [63:0] line_buf1_rsc_d_n_VerDer_inst;
  wire [8:0] line_buf1_rsc_adr_n_VerDer_inst;
  wire [33:0] dat_out_rsc_dat_n_HorDer_inst;
  wire [35:0] dx_rsc_dat_n_HorDer_inst;
  wire [35:0] dy_in_rsc_dat_n_MagAng_inst;
  wire dy_in_rsc_vld_n_MagAng_inst;
  wire [31:0] crc32_pix_in_rsc_zout_n_MagAng_inst;
  wire [31:0] crc32_dat_out_rsc_zout_n_MagAng_inst;
  wire [33:0] dat_out_rsc_dat_n_MagAng_inst;
  wire dat_in_rsc_rdy_n_VerDer_inst_bud;
  wire dat_out_rsc_vld_n_VerDer_inst_bud;
  wire dat_in_rsc_rdy_n_HorDer_inst_bud;
  wire dy_rsc_vld_n_VerDer_inst_bud;
  wire dy_in_rsc_rdy_n_MagAng_inst_bud;
  wire line_buf0_rsc_we_n_VerDer_inst_bud;
  wire line_buf1_rsc_we_n_VerDer_inst_bud;
  wire dat_out_rsc_vld_n_HorDer_inst_bud;
  wire pix_chan2_rsc_rdy_n_MagAng_inst_bud;
  wire dx_rsc_vld_n_HorDer_inst_bud;
  wire dx_in_rsc_rdy_n_MagAng_inst_bud;
  wire dat_out_rsc_vld_n_MagAng_inst_bud;
  wire widthIn_triosy_lz_n_MagAng_inst_bud;
  wire heightIn_triosy_lz_n_MagAng_inst_bud;
  wire sw_in_triosy_lz_n_MagAng_inst_bud;
  wire crc32_pix_in_rsc_lzout_n_MagAng_inst_bud;
  wire crc32_pix_in_triosy_lz_n_MagAng_inst_bud;
  wire crc32_dat_out_rsc_lzout_n_MagAng_inst_bud;
  wire crc32_dat_out_triosy_lz_n_MagAng_inst_bud;
  wire dy_chan_unc_1;
  wire dy_chan_idle;

  // Interconnect Declarations for Component Instantiations 
  ccs_pipe_v6 #(.rscid(32'sd35),
  .width(32'sd36),
  .sz_width(32'sd1),
  .fifo_sz(32'sd2),
  .log2_sz(32'sd1),
  .ph_clk(32'sd1),
  .ph_en(32'sd0),
  .ph_arst(32'sd0),
  .ph_srst(32'sd1)) dy_chan_cns_pipe (
      .clk(clk),
      .en(1'b0),
      .arst(arst_n),
      .srst(rst),
      .din_rdy(dy_rsc_rdy_n_VerDer_inst),
      .din_vld(dy_rsc_vld_n_VerDer_inst_bud),
      .din(dy_rsc_dat_n_VerDer_inst),
      .dout_rdy(dy_in_rsc_rdy_n_MagAng_inst_bud),
      .dout_vld(dy_in_rsc_vld_n_MagAng_inst),
      .dout(dy_in_rsc_dat_n_MagAng_inst),
      .sz(dy_chan_unc_1),
      .sz_req(1'b0),
      .is_idle(dy_chan_idle)
    );
  EdgeDetect_IP_EdgeDetect_VerDer VerDer_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy_n_VerDer_inst_bud),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat(dat_out_rsc_dat_n_VerDer_inst),
      .dat_out_rsc_vld(dat_out_rsc_vld_n_VerDer_inst_bud),
      .dat_out_rsc_rdy(dat_in_rsc_rdy_n_HorDer_inst_bud),
      .dy_rsc_dat(dy_rsc_dat_n_VerDer_inst),
      .dy_rsc_vld(dy_rsc_vld_n_VerDer_inst_bud),
      .dy_rsc_rdy(dy_rsc_rdy_n_VerDer_inst),
      .line_buf0_rsc_en(line_buf0_rsc_en_n_VerDer_inst),
      .line_buf0_rsc_q(line_buf0_rsc_q),
      .line_buf0_rsc_we(line_buf0_rsc_we_n_VerDer_inst_bud),
      .line_buf0_rsc_d(line_buf0_rsc_d_n_VerDer_inst),
      .line_buf0_rsc_adr(line_buf0_rsc_adr_n_VerDer_inst),
      .line_buf1_rsc_en(line_buf1_rsc_en_n_VerDer_inst),
      .line_buf1_rsc_q(line_buf1_rsc_q),
      .line_buf1_rsc_we(line_buf1_rsc_we_n_VerDer_inst_bud),
      .line_buf1_rsc_d(line_buf1_rsc_d_n_VerDer_inst),
      .line_buf1_rsc_adr(line_buf1_rsc_adr_n_VerDer_inst)
    );
  EdgeDetect_IP_EdgeDetect_HorDer HorDer_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(dat_out_rsc_dat_n_VerDer_inst),
      .dat_in_rsc_vld(dat_out_rsc_vld_n_VerDer_inst_bud),
      .dat_in_rsc_rdy(dat_in_rsc_rdy_n_HorDer_inst_bud),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat(dat_out_rsc_dat_n_HorDer_inst),
      .dat_out_rsc_vld(dat_out_rsc_vld_n_HorDer_inst_bud),
      .dat_out_rsc_rdy(pix_chan2_rsc_rdy_n_MagAng_inst_bud),
      .dx_rsc_dat(dx_rsc_dat_n_HorDer_inst),
      .dx_rsc_vld(dx_rsc_vld_n_HorDer_inst_bud),
      .dx_rsc_rdy(dx_in_rsc_rdy_n_MagAng_inst_bud)
    );
  EdgeDetect_IP_EdgeDetect_MagAng MagAng_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsc_dat(dx_rsc_dat_n_HorDer_inst),
      .dx_in_rsc_vld(dx_rsc_vld_n_HorDer_inst_bud),
      .dx_in_rsc_rdy(dx_in_rsc_rdy_n_MagAng_inst_bud),
      .dy_in_rsc_dat(dy_in_rsc_dat_n_MagAng_inst),
      .dy_in_rsc_vld(dy_in_rsc_vld_n_MagAng_inst),
      .dy_in_rsc_rdy(dy_in_rsc_rdy_n_MagAng_inst_bud),
      .pix_chan2_rsc_dat(dat_out_rsc_dat_n_HorDer_inst),
      .pix_chan2_rsc_vld(dat_out_rsc_vld_n_HorDer_inst_bud),
      .pix_chan2_rsc_rdy(pix_chan2_rsc_rdy_n_MagAng_inst_bud),
      .widthIn_rsc_dat(10'b0000000000),
      .widthIn_triosy_lz(widthIn_triosy_lz_n_MagAng_inst_bud),
      .heightIn_rsc_dat(9'b000000000),
      .heightIn_triosy_lz(heightIn_triosy_lz_n_MagAng_inst_bud),
      .sw_in(sw_in_rsc_dat),
      .sw_in_triosy_lz(sw_in_triosy_lz_n_MagAng_inst_bud),
      .crc32_pix_in_rsc_zout(crc32_pix_in_rsc_zout_n_MagAng_inst),
      //.crc32_pix_in_rsc_lzout(crc32_pix_in_rsc_lzout_n_MagAng_inst_bud),
      //.crc32_pix_in_rsc_zin(crc32_pix_in_rsc_zin),
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz_n_MagAng_inst_bud),
      .crc32_dat_out_rsc_zout(crc32_dat_out_rsc_zout_n_MagAng_inst),
      //.crc32_dat_out_rsc_lzout(crc32_dat_out_rsc_lzout_n_MagAng_inst_bud),
      //.crc32_dat_out_rsc_zin(crc32_dat_out_rsc_zin),
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz_n_MagAng_inst_bud),
      .dat_out_rsc_dat(dat_out_rsc_dat_n_MagAng_inst),
      .dat_out_rsc_vld(dat_out_rsc_vld_n_MagAng_inst_bud),
      .dat_out_rsc_rdy(dat_out_rsc_rdy)
    );
  assign dat_in_rsc_rdy = dat_in_rsc_rdy_n_VerDer_inst_bud;
  assign line_buf0_rsc_en = line_buf0_rsc_en_n_VerDer_inst;
  assign line_buf0_rsc_we = line_buf0_rsc_we_n_VerDer_inst_bud;
  assign line_buf0_rsc_d = line_buf0_rsc_d_n_VerDer_inst;
  assign line_buf0_rsc_adr = line_buf0_rsc_adr_n_VerDer_inst;
  assign line_buf1_rsc_en = line_buf1_rsc_en_n_VerDer_inst;
  assign line_buf1_rsc_we = line_buf1_rsc_we_n_VerDer_inst_bud;
  assign line_buf1_rsc_d = line_buf1_rsc_d_n_VerDer_inst;
  assign line_buf1_rsc_adr = line_buf1_rsc_adr_n_VerDer_inst;
  assign dat_out_rsc_vld = dat_out_rsc_vld_n_MagAng_inst_bud;
  assign dat_out_rsc_dat = dat_out_rsc_dat_n_MagAng_inst;
  assign sw_in_triosy_lz = sw_in_triosy_lz_n_MagAng_inst_bud;
  assign crc32_pix_in_rsc_lzout = crc32_pix_in_rsc_lzout_n_MagAng_inst_bud;
  assign crc32_pix_in_rsc_zout = crc32_pix_in_rsc_zout_n_MagAng_inst;
  assign crc32_pix_in_triosy_lz = crc32_pix_in_triosy_lz_n_MagAng_inst_bud;
  assign crc32_dat_out_rsc_lzout = crc32_dat_out_rsc_lzout_n_MagAng_inst_bud;
  assign crc32_dat_out_rsc_zout = crc32_dat_out_rsc_zout_n_MagAng_inst;
  assign crc32_dat_out_triosy_lz = crc32_dat_out_triosy_lz_n_MagAng_inst_bud;

  assign crc32_pix_in_rsc_zin=dat_in_rsc_dat;
  assign crc32_dat_out_rsc_zin=dat_out_rsc_dat_n_HorDer_inst;
endmodule