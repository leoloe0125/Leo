module Branch_unit(
	input ALU_PSW,
	input BCC,BCS,BNE,BEQ,
	input C,C_in,Z,Z_in,
	output Branch);
		
	wire C_s,Z_s;
	
	assign C_s = (ALU_PSW)?C_in:C;
	assign Z_s = (ALU_PSW)?Z_in:Z;
	assign Branch = (BCC & (~C_s)) | (BCS & (C_s)) | (BNE & (~Z_s)) | (BEQ & (Z_s));
	
endmodule