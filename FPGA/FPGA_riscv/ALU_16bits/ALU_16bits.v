module ALU_16bits(
	input [15:0]A,B,
	input op,
	output [15:0]S,
	output N,Z,V,C);

	wire [15:0] B_xor;
	wire [16:15] Cout;
	
	assign B_xor = B^{16{op}};
	
	assign N = S[15];
	assign Z = ~(|S);
	assign V = 	^Cout;
	assign C = Cout[15];
	
	FA_16bits A0(A,B_xor,op,S,Cout);
	endmodule
