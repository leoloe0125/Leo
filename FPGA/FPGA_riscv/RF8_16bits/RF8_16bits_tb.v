module RF8_16bits_tb();

	reg[15:0]wr_data;
	reg[2:0]wr_addr,rs_addr,rt_addr;
	reg clk,rst,en;
	wire [15:0]rs,rt;
		
always #10 clk =~clk;

RF8_16bits R0(wr_data,wr_addr,rs_addr,rt_addr,clk,rst,en,rs,rt);


integer i;
initial begin
wr_data =0;wr_addr=0;rs_addr=0;rt_addr=7;clk=0;rst=1;en=0;

#20
for(i=0;i<8;i=i+1)begin	
	en=1;
	#20 wr_data = wr_data+50;
	wr_addr = wr_addr +1;
end

for(i=0;i<8;i=i+1)begin	
	en=1;
	#20 rs_addr = rs_addr+1;
	rt_addr = rt_addr-1;
end

$stop;
end
endmodule
