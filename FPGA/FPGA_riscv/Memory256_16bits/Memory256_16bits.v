
module Memory256_16bits(
	input [7:0]addr,
	input [15:0]Din,
	input clk,en,
	output [15:0]Dout);
	
	wire [7:0] addr_dec;
	wire [7:0] q00,q01,q10,q11,q20,q21,q30,q31,q40,q41,q50,q51,q60,q61,q70,q71;
	
	
	Decoder3to8 D0 (addr[7:5],en,addr_dec);
	
	Mux8to1_16bits  Mu0({q01,q00},{q11,q10},{q21,q20},{q31,q30},{q41,q40},{q51,q50},{q61,q60},{q71,q70},
		addr[7:5],
		Dout);
		
	Memory32_8bits M00(addr[4:0],clk,Din[7:0],addr_dec[0],q00);
	Memory32_8bits M01(addr[4:0],clk,Din[15:8],addr_dec[0],q01);
	
	Memory32_8bits M10(addr[4:0],clk,Din[7:0],addr_dec[1],q10);
	Memory32_8bits M11(addr[4:0],clk,Din[15:8],addr_dec[1],q11);
	
	Memory32_8bits M20(addr[4:0],clk,Din[7:0],addr_dec[2],q20);
	Memory32_8bits M21(addr[4:0],clk,Din[7:0],addr_dec[2],q21);
	
	Memory32_8bits M30(addr[4:0],clk,Din[7:0],addr_dec[3],q30);
	Memory32_8bits M31(addr[4:0],clk,Din[15:8],addr_dec[3],q31);
	
	Memory32_8bits M40(addr[4:0],clk,Din[7:0],addr_dec[4],q40);
	Memory32_8bits M41(addr[4:0],clk,Din[15:8],addr_dec[4],q41);

	Memory32_8bits M50(addr[4:0],clk,Din[7:0],addr_dec[5],q50);
	Memory32_8bits M51(addr[4:0],clk,Din[15:8],addr_dec[5],q51);

	Memory32_8bits M60(addr[4:0],clk,Din[7:0],addr_dec[6],q60);
	Memory32_8bits M61(addr[4:0],clk,Din[15:8],addr_dec[6],q61);
	
	Memory32_8bits M70(addr[4:0],clk,Din[7:0],addr_dec[7],q70);
	Memory32_8bits M71(addr[4:0],clk,Din[15:8],addr_dec[7],q71);

	endmodule
	
module Memory32_8bits(
	input [4:0]addr,
	input clk,
	input [7:0]Din,
	input en,
	output [7:0]Dout);
	
	reg [7:0]Mem[31:0];
	
	assign Dout = Mem[addr][7:0];
	
	always@(posedge clk)
		if(en)
			Mem[addr][7:0] <= Din;

	endmodule