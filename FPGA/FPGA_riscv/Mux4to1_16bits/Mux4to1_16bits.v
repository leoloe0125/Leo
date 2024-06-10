module Mux4to1_16bits
	(	input [15:0]Din0,Din1,Din2,Din3,
		input [1:0]Control,
		output reg [15:0]Dout);
		
always@(*)
	case(Control)
		2'd0: Dout=Din0;
		2'd1: Dout=Din1;
		2'd2: Dout=Din2;
		2'd3: Dout=Din3;
	endcase
endmodule
