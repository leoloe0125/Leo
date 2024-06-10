module Instruction_Decoder_tb();
  reg [15:0]Inst;
 wire MOV,ADDI,SUBI,LHI,LLI,LDR,STR,ADD,ADC,SUB,SBB,CMP,BCC,BCS,BNE,BEQ,BAL,JMP,JAL_Label,JAL_Rm,JR,OutR,HLT;
 
Instruction_Decoder I0(Inst,MOV,ADDI,SUBI,LHI,LLI,LDR,STR,ADD,ADC,SUB,SBB,CMP,BCC,BCS,BNE,BEQ,BAL,JMP,JAL_Label,JAL_Rm,JR,OutR,HLT);
 initial begin
	Inst='d0;
# 10
Inst=16'b01011xxxxxxxxxxx; //MOV
# 10
Inst=16'b00111xxxxxxxxxxx; //ADDI
# 10
Inst=16'b01000xxxxxxxxxxx; //SUBI
# 10
Inst=16'b00001xxxxxxxxxxx; //LHI
# 10
Inst=16'b00010xxxxxxxxxxx; //LLI
# 10
Inst=16'b00011xxxxxxxxxxx; //LDR
# 10
Inst=16'b00101xxxxxxxxxxx; //STR
# 10
Inst=16'b00000xxxxxxxxx00; //ADD
# 10
Inst=16'b00000xxxxxxxxx01; //ADC
# 10
Inst=16'b00000xxxxxxxxx10; //SUB
# 10
Inst=16'b00000xxxxxxxxx11; //SBB
# 10
Inst=16'b00110xxxxxxxxx01; //CMP


# 10
Inst=16'b11000011xxxXXXXX; //BCC
# 10
Inst=16'b11000010xxxxxxxx; //BCS
# 10
Inst=16'b11000001xxxXXXXX; //BNE
# 10
Inst=16'b11000000xxxxxxxx; //BEQ
# 10
Inst=16'b11001110xxxxxxxx; //BAL
# 10
Inst=16'b10000xxxxxxxXXXX; //JMP
# 10
Inst=16'b10001xxxxxxxxxxx; //JAL_label
# 10
Inst=16'b10010xxxxxxXXXXX; //JAL_Rm
# 10
Inst=16'b10011xxxxxxXXXXX; //JR
# 10
Inst=16'b11100xxxxxxxxx00; //Out R
# 10
Inst=16'b11100xxxxxxxxx01; //HLT
#10
$stop;
end

endmodule
