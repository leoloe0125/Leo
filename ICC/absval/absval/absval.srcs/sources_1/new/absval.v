
module DW01_absval (A, ABSVAL);

parameter integer width = 16;

input  [width-1 : 0] A;
 
output [width-1 : 0] ABSVAL;
 
// include modeling functions
`include "DW01_absval_function.inc"  

// synopsys translate_off
    
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

  if ( param_err_flg == 1) begin
    $display(
      "%m :\n  Simulation aborted due to invalid parameter value(s)");
    $finish;
  end

end // parameter_check 


assign ABSVAL = ((^(A ^ A) !== 1'b0)) ? {width{1'bx}} : DWF_absval(A);

// synopsys translate_on

endmodule // DW01_absval
