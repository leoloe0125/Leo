module Mux8to1_16bits
	(	input [15:0]Din0,Din1,Din2,Din3,Din4,Din5,Din6,Din7,
		input [2:0]Control,
		output reg [15:0]Dout);
		
always@(*)
	case(Control)
		3'd0: Dout=Din0;
		3'd1: Dout=Din1;
		3'd2: Dout=Din2;
		3'd3: Dout=Din3;
		3'd4: Dout=Din4;
		3'd5: Dout=Din5;
		3'd6: Dout=Din6;
		3'd7: Dout=Din7;
	endcase


endmodule
