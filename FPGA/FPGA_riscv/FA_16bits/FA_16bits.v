module FA_16bits(
	input [15:0]A,B,
	input Cin,
	output reg[15:0]S,
	output [16:15]Cout);

	reg [16:0]C,P;
	
	assign Cout[16:15]=C[16:15];
	integer i,j;
	
	always @(*)
	for(i=0;i<17;i=i+1)
		if(i==0)
			C[i]=Cin;
		else
			C[i]=(P[i-1]&C[i-1])|(A[i-1]&B[i-1]);
	
	always@(*)
	for(j=0;j<16;j=j+1)
		P[j]=A[j]^B[j];
	
	always@(*)
	for(j=0;j<16;j=j+1)
		S[j]=C[j]^P[j];
	
	endmodule
