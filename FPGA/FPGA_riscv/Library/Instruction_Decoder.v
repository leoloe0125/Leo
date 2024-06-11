module Instruction_Decoder( 
  input [15:0]Inst,
 output MOV,ADDI,SUBI,LHI,LLI,LDR,STR,ADD,ADC,SUB,SBB,CMP,BCC,BCS,BNE,BEQ,BAL,JMP,JAL_Label,JAL_Rm,JR,OutR,HLT);

assign MOV = (~Inst[15])&Inst[14]&(~Inst[13])&Inst[12]&Inst[11];
assign ADDI = (~Inst[15])&(~Inst[14])&Inst[13]&Inst[12]&Inst[11];
assign SUBI = (~Inst[15])&Inst[14]&(~Inst[13])&(~Inst[12])&(~Inst[11]);
assign LHI = (~Inst[15])&(~Inst[14])&(~Inst[13])&(~Inst[12])&Inst[11];
assign LLI  = (~Inst[15])&(~Inst[14])&(~Inst[13])&Inst[12]&(~Inst[11]);

assign LDR= (~Inst[15])&(~Inst[14])&(~Inst[13])&Inst[12]&Inst[11];
assign STR = (~Inst[15])&(~Inst[14])&Inst[13]&(~Inst[12])&Inst[11];

assign ADD = (~Inst[15])&(~Inst[14])&(~Inst[13])&(~Inst[12])&(~Inst[11])&(~Inst[1])&(~Inst[0]);
assign ADC = (~Inst[15])&(~Inst[14])&(~Inst[13])&(~Inst[12])&(~Inst[11])&(~Inst[1])&Inst[0];
assign SUB = (~Inst[15])&(~Inst[14])&(~Inst[13])&(~Inst[12])&(~Inst[11])&Inst[1]&(~Inst[0]);
assign SBB = (~Inst[15])&(~Inst[14])&(~Inst[13])&(~Inst[12])&(~Inst[11])&Inst[1]&Inst[0];
assign CMP= (~Inst[15])&(~Inst[14])&Inst[13]&Inst[12]&(~Inst[11])&(~Inst[1])&Inst[0];

assign BCC = Inst[15]&Inst[14]&(~Inst[13])&(~Inst[12])&(~Inst[11])&(~Inst[10])&Inst[9]&Inst[8];
assign BCS = Inst[15]&Inst[14]&(~Inst[13])&(~Inst[12])&(~Inst[11])&(~Inst[10])&Inst[9]&(~Inst[8]);
assign BNE = Inst[15]&Inst[14]&(~Inst[13])&(~Inst[12])&(~Inst[11])&(~Inst[10])&(~Inst[9])&Inst[8];
assign BEQ = Inst[15]&Inst[14]&(~Inst[13])&(~Inst[12])&(~Inst[11])&(~Inst[10])&(~Inst[9])&(~Inst[8]);
assign BAL = Inst[15]&Inst[14]&(~Inst[13])&(~Inst[12])&Inst[11]&Inst[10]&Inst[9]&(~Inst[8]);

assign JMP = Inst[15]&(~Inst[14])&(~Inst[13])&(~Inst[12])&(~Inst[11]);
assign JAL_Label = Inst[15]&(~Inst[14])&(~Inst[13])&(~Inst[12])&Inst[11];
assign JAL_Rm = Inst[15]&(~Inst[14])&(~Inst[13])&Inst[12]&(~Inst[11]);
assign JR = Inst[15]&(~Inst[14])&(~Inst[13])&Inst[12]&Inst[11];

assign OutR = Inst[15]&Inst[14]&Inst[13]&(~Inst[12])&(~Inst[11])&(~Inst[1])&(~Inst[0]);

assign HLT = Inst[15]&Inst[14]&Inst[13]&(~Inst[12])&(~Inst[11])&(~Inst[1])&Inst[0];


endmodule