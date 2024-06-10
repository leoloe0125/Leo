module Memory256_16bits_tb();
	reg [7:0]addr;
	reg [15:0]Din;
	reg clk,en;
	wire [15:0]Dout;
	
	Memory256_16bits M0(addr,Din,clk,en,Dout);
	
	integer i;
	
	always #10 clk = ~clk;
	initial begin
		
		addr=0;
		Din=0;
		clk=0;
		en=0;
		
		#5
		for (i=0;i<256;i=i+1)begin
		#20
			if (i==0)begin
				en<=0;
				Din<=i;
				addr<=i;
			end
			
			else begin
				en<=1;
				addr<=i;
				Din<=i;
			end
			
		end
		
		for (i=0;i<256;i=i+1)begin
		#20
			en <=0;
			addr<= i;
		end
		
	$stop;
	end

endmodule
