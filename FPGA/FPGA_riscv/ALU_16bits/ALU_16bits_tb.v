module ALU_16bits_tb();

	reg[15:0]A,B;
	reg op;
	wire[15:0]S;
	wire N,Z,V,C;
	integer i;
	
	
	ALU_16bits FA0(A,B,op,S,N,Z,V,C);
	initial begin
		#10
		A=16'd65536/2;
		B=16'd65536/2-1;
		op=0;
		for (i=0;i<15;i=i+1)begin
		#10
			op=$random%2;
			A={$random}%(65536/2);
			B={$random}%(65536/2);
		end
	
	$stop;
	end

	endmodule