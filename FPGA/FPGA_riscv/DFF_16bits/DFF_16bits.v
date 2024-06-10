module DFF_16bits
	(input [15:0]Din,
		input clk,en,rst,
		output reg[15:0]Dout);
always@(posedge clk,negedge rst)
	if(!rst)
		Dout <= 'd0;
	else if(en)
		Dout <= Din;

endmodule