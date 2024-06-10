module Controller(
 input
MOV,ADDI,SUBI,LHI,LLI,LDR,STR,ADD,ADC,SUB,SBB,CMP,BCC,BCS,BNE,BEQ,BAL,JMP,JAL_Label,JAL_Rm,JR,OutR,HLT,
output
RF_rt_addr,RF_wr_en,RF_wr_from,Imm5or8,JAL,ALU_B,ALU_op,ALU_PSW,Memory_wr_en,
output [1:0] ALU_target);

assign RF_rt_addr = LHI | STR | JR;

assign RF_wr_en   = MOV|ADDI|SUBI|LHI|LLI|LDR|ADD|ADC|SUB|SBB|JAL_Label|JAL_Rm;

assign ALU_op   = SUBI|SUB|SBB|CMP;

assign ALU_PSW   = ADDI|SUBI|ADD|ADC|SUB|SBB|SBB|CMP;

assign RF_wr_from   = MOV|ADDI|SUBI|LHI|LLI|ADD|ADC|SUB|SBB;

assign Imm5or8   = ADDI|SUBI|LDR|STR;

assign JAL  = JAL_Label|JAL_Rm;

assign ALU_target[0]  = ADC|SBB|LLI;
assign ALU_target[1]  = LHI|LLI;

assign ALU_B = MOV|ADD|ADC|SUB|SBB|CMP;

assign Memory_wr_en = STR;

endmodule