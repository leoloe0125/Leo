module Mux8to1_16bits_tb;
		reg [15:0]Din0,Din1,Din2,Din3,Din4,Din5,Din6,Din7;
		reg [2:0]Control;
		wire [15:0]Dout;

Mux8to1_16bits M0(Din0,Din1,Din2,Din3,Din4,Din5,Din6,Din7,Control,Dout);

integer i;
initial begin
	Din0='d65535;Din1='d11;Din2='d5;Din3='d15155;Din4='d2222;Din5='d8;Din6='d8;Din7='d10;
	Control  =0;
	for(i=0;i<8;i=i+1)begin
	#10
		Control=Control+1;
	end
	
	$stop;
	$finish;
	
end

endmodule