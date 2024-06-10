module FA_16bits_tb();

	reg[15:0]A,B;
	reg Cin;
	wire[15:0]S;
	wire [16:15]Cout;
	integer i;
	
	FA_16bits FA0(A,B,Cin,S,Cout);
	initial begin
		#10
		A=16'd65536/2;
		B=16'd65536/2-1;
		Cin=0;
		for (i=0;i<15;i=i+1)begin
		#10
			Cin=$random%2;
			A={$random}%(65536/2);
			B={$random}%(65536/2);
		end
	
	$stop;
	end

	endmodule