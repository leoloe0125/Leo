module RF8_16bits
	(	input [15:0]wr_data,
		input [2:0]wr_addr,rs_addr,rt_addr,
		input clk,rst,en,
		output  [15:0]rs,rt);
		
wire [15:0]r0,r1,r2,r3,r4,r5,r6,r7;
wire [7:0]wr_addr_enc;

Mux8to1_16bits Rs (r0,r1,r2,r3,r4,r5,r6,r7,
		rs_addr,
		rs);
		
Mux8to1_16bits Rt (r0,r1,r2,r3,r4,r5,r6,r7,
		rt_addr,
		rt);
		
Decoder3to8 D0 (wr_addr,en,wr_addr_enc);
		
DFF_16bits R0(wr_data,clk,wr_addr_enc[0],rst,r0);
DFF_16bits R1(wr_data,clk,wr_addr_enc[1],rst,r1);
DFF_16bits R2(wr_data,clk,wr_addr_enc[2],rst,r2);
DFF_16bits R3(wr_data,clk,wr_addr_enc[3],rst,r3);
DFF_16bits R4(wr_data,clk,wr_addr_enc[4],rst,r4);
DFF_16bits R5(wr_data,clk,wr_addr_enc[5],rst,r5);
DFF_16bits R6(wr_data,clk,wr_addr_enc[6],rst,r6);
DFF_16bits R7(wr_data,clk,wr_addr_enc[7],rst,r7);

endmodule