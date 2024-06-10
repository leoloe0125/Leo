module DFF_16bits_tb();
	reg[15:0]Din;
	reg clk,en,rst;
	wire[15:0]Dout;
	
DFF_16bits D0(Din,clk,en,rst,Dout);

always #10 clk <= ~clk;

integer i;
initial begin
	clk=0;en=0;rst=0;
	Din=10;
	
	#10
	en=0;rst=1;Din=15;
	
	for (i=0;i<7;i=i+1)begin
	#10
	en=1;
		Din=i+65530;
	end

$stop;
end
endmodule