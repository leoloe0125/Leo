module Hazard_Detector(
	input [15:0]Inst,Inst3,
	input LDR_D2,JAL_Label,Branch,JMP,JAL_Rm,JR,
	input RF_wr_en_bubble_check,work_c,Mem_wr_en_bubble_check,
	input clk,rst,
	output Stall,bubble1,bubble2,RF_wr_en_D3,MEM_wr_en_D3
	);
	
	wire Rs30,Rt30;
	reg bubble1_D2;
	
	assign Rs30 = 	~(Inst3[7]^ Inst[10]) & ~(Inst3[6]^ Inst[9]) & ~(Inst3[5]^ Inst[8]);
	assign Rt30 = 	~(Inst3[7]^ Inst[10]) & ~(Inst3[6]^ Inst[9]) & ~(Inst3[5]^ Inst[8]);
	assign Stall = (Rs30|Rt30)&	LDR_D2;

	assign bubble1 = JAL_Label|Branch|JMP|JAL_Rm|JR;
	assign bubble2 = work_c | Stall;
	assign RF_wr_en_D3  = RF_wr_en_bubble_check & ~bubble1_D2 & ~bubble2;
	assign MEM_wr_en_D3 = Mem_wr_en_bubble_check & ~bubble1_D2 & ~bubble2;
	
	always @(posedge clk,negedge rst)begin
		if(!rst)
			bubble1_D2 <= 'd0;
		else
			bubble1_D2 <= bubble1;
	end
	
endmodule
