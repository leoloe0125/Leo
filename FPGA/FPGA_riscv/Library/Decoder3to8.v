module Decoder3to8
	(input [2:0]Din,
		input en,
		output reg [7:0]Dout);
		
always@(*)
	if(!en)
		Dout = 8'd0;
	else
		Dout = 8'd1<<Din;

endmodule
