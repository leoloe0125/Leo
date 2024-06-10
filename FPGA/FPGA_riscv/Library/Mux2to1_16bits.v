module Mux2to1_16bits
	(	input [15:0]Din0,Din1,
		input Control,
		output reg [15:0]Dout);
		
always@(*)
	case(Control)
		1'd0: Dout=Din0;
		1'd1: Dout=Din1;
	endcase
endmodule