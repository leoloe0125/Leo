module Controller_tb();

reg MOV,ADDI,SUBI,LHI,LLI,LDR,STR,ADD,ADC,SUB,SBB,CMP,BCC,BCS,BNE,BEQ,BAL,JMP,JAL_Label,JAL_Rm,JR,OutR,HLT;

wire RF_rt_addr,RF_wr_en,RF_wr_from,Imm5or8,JAL,ALU_B,ALU_op,ALU_PSW,Memory_wr_en;
wire [1:0] ALU_target;

Controller C0(MOV,ADDI,SUBI,LHI,LLI,LDR,STR,ADD,ADC,SUB,SBB,CMP,BCC,BCS,BNE,BEQ,BAL,JMP,JAL_Label,JAL_Rm,JR,OutR,HLT,
RF_rt_addr,RF_wr_en,RF_wr_from,Imm5or8,JAL,ALU_B,ALU_op,ALU_PSW,Memory_wr_en,
ALU_target
);
initial begin
	
	MOV=0;ADDI=0;SUBI=0;LHI=0;LLI=0;LDR=0;STR=0;ADD=0;ADC=0;SUB=0;SBB=0;CMP=0;BCC=0;BCS=0;BNE=0;BEQ=0;BAL=0;JMP=0;JAL_Label=0;JAL_Rm=0;JR=0;OutR=0;HLT=0;
	
	
	#10
	MOV =1;
	#10
	MOV=0;ADDI=1;
	#10
	ADDI=0;SUBI=1;
	#10
	SUBI=0;LHI=1;
	#10
	LHI=0;LLI=1;
	#10
	LLI=0;LDR=1;
	#10
	LDR=0;STR=1;
	#10
	STR=0;ADD=1;
	#10
	ADD=0;ADC=1;
	#10
	ADC=0;SUB=1;
	#10
	SUB=0;SBB=1;
	#10
	SBB=0;CMP=1;
	#10
	CMP=0;BCC=1;
	#10
	BCC=0;BCS=1;
	#10
	BCS=0;BNE=1;
	#10
	BNE=0;BEQ=1;
	#10
	BEQ=0;BAL=1;
	#10
	BAL=0;JMP=1;
	#10
	JMP=0;JAL_Label=1;
	#10
	JAL_Label=0;JAL_Rm=1;
	#10
	JAL_Rm=0;JR=1;
	#10
	JR=0;OutR=1;
	#10
	OutR=0;HLT=1;
	#10
	HLT=0; end
	endmodule