module Decoder3to8_tb();
		reg [2:0]Din;
		reg en;
		wire [7:0]Dout;

Decoder3to8 D0(.Din(Din),.en(en),.Dout(Dout));

integer i;
initial begin
	Din =0;
	en  =0;
	for(i=0;i<8;i=i+1)begin
	#10
		en=1;
		Din=Din+1;
	end
	
	$stop;
	$finish;
	
end

endmodule