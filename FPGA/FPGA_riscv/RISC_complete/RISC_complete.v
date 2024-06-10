module RISC_complete (clk,rst,test_normal,done,ext_inst_we,ext_data_we,ext_data,ext_addr,mem_out,OutR);

input clk,rst;
input test_normal;
input ext_inst_we,ext_data_we;
input [15:0] ext_data,ext_addr;
output reg[15:0]mem_out;
output[15:0]OutR;
output reg done;

//-------------------------------Wire and reg declaration---------------------------------------
//input block
wire clk_op,ext_we,work_c;
wire rst_D4,rst_D3,rst_D2;
reg ext_we_D2;
reg work;

//output block
reg [15:0]Rs_forward_D0;
reg OutR_s;

//Instuction Fetch
wire [15:0]Present_inst_addr,Present_inst_addr_plus1;
wire [15:0]Next_inst_addr,Specific_inst_addr;
wire [15:0]addr_ALU_A,addr_ALU_B;
wire [15:0]Mem_addr;
wire [15:0]Inst5;

//Instuction Decoder
wire [15:0]Inst,PC_D3,Rs_D3,Rt_D3,Imm5_ext,Imm8_ext,Imm_D3;
wire MOV_D3, ADDI_D3, SUBI_D3, LHI_D3, LLI_D3, LDR_D3, STR_D3, ADD_D3, ADC_D3, SUB_D3, SBB_D3, CMP_D3;
wire BCC_D3, BCS_D3, BNE_D3, BEQ_D3, BAL_D3, JMP_D3, JAL_Label_D3, JAL_Rm_D3, JR_D3, OutR_D3, HLT_D3;
wire RF_rt_addr_D3, RF_wr_en_D3, RF_wr_from_D3, Imm5or8_D3, JAL_D3, ALU_B_D3, ALU_op_D3, ALU_PSW_D3, Memory_wr_en_D3;
wire RF_wr_en_bubble_check,Mem_wr_en_bubble_check;
wire Branch,Stall;
wire [1:0] ALU_target_D3;
wire [2:0] rs_rd_addr,rt_rd_addr;
wire bubble1,bubble2;

//Execution or address calculation
reg RF_wr_en_D2,RF_wr_from_D2,JAL_D2,ALU_B_D2,ALU_op_D2,ALU_PSW_D2,Memory_wr_en_D2;
reg [1:0]ALU_target_D2;
reg LHI_D2,MOV_D2,LDR_D2,STR_D2,OutR_D2,HLT_D2;
wire [15:0] ALU_A_target,ALU_B_target,ALU_B_common,Rs_forward_D2,Rt_forward_D2;
wire [15:0] ALU_sum,ALU_sum_D2,Imm_D2;
wire [1:0] Rs_forward,Rt_forward;
reg N,Z,V,C;
wire N_ALU,Z_ALU,V_ALU,C_ALU;
wire [15:0] PC_D2,Inst3,Rs_D2,Rt_D2;

//--------------------Memory access-----------------------------------
reg RF_wr_en_D1,RF_wr_from_D1,Memory_wr_en_D1,JAL_D1,LDR_D1,OutR_D1,HLT_D1;
reg  [15:0]Rs_forward_D1;
wire [15:0] PC_D1,Inst2,ALU_sum_D1,Rt_D1;
wire [15:0] Mem_wr_data,Mem_wr_addr;
wire [15:0] Mem_dout;
wire [15:0] wr_data_D1;

//--------------------Write_back-----------------------------------
reg RF_wr_en,JAL,LDR;
wire [15:0] PC,Inst1;
wire [15:0] wr_data;

//--------------------Forwarding_stage-----------------------------
wire [15:0] wr_data_for,Inst0;
wire RF_wr_en_for;



//-----------------------------------------circuit-----------------------------------------------
//input block
assign clk_op = (done)?'d0:clk;
assign work_c = ~work;
assign ext_we = ext_inst_we |  ext_data_we;

always@(posedge clk_op,negedge rst_D4)
	if(!rst_D4)
		ext_we_D2 <= 'd0;
	else
		ext_we_D2 <= ext_we;	
always@(posedge clk_op,negedge rst_D4)	
	if(!rst_D4)
		work <= 'd0;
	else if(ext_we_D2 & ~ext_we)
		work <= ~work;
		
//output block
assign OutR = (OutR_s)?Rs_forward_D0:'d0;
always @(posedge clk,negedge rst)
	if(!rst)
		OutR_s  <= 'd0;
	else 
		OutR_s  <= OutR_D1;
always @(posedge clk,negedge rst)
	if(!rst)
		done    <= 'd0;
	else
		done    <= HLT_D1;
always @(posedge clk,negedge rst)
	if(!rst)
		Rs_forward_D0 <= 'd0;
	else
		Rs_forward_D0 <= Rs_forward_D1;
		
//-------------------------------Instuction Fetch---------------------------------------
//----PC----
DFF_16bits PC_DFF (Next_inst_addr,clk_op,work,rst,Present_inst_addr);

//----PC_next_inst_calculation
assign Present_inst_addr_plus1 = Present_inst_addr+1;
assign Next_inst_addr          = (bubble1)? Specific_inst_addr:Present_inst_addr_plus1;
assign Specific_inst_addr      = addr_ALU_A+addr_ALU_B;
assign addr_ALU_A =(JAL_Rm_D3)?Rs_D3:(JMP_D3)?{PC_D3[15:11],Inst[10:0]}:(JR_D3)?(Rt_D3):(PC_D3);
assign addr_ALU_B = (JAL_Label_D3|Branch)?0:Imm_D3[15:0];
assign rst_D4 = bubble1 | rst;

//----Inst_Mem_testing----
Mux2to1_16bits Testing(Present_inst_addr,ext_addr,ext_inst_we,Mem_addr);

//----Inst_Mem----	
Memory256_16bits Inst_Mem(
			.addr(Mem_addr[7:0]),
			.Din(ext_data),
			.clk(clk_op),
			.en(ext_inst_we),
			.Dout(Inst5)); //ext_inst_data and ext_inst_we are input
		
//-------------------------------------------------------------Instuction Decoder-------------------------------------------------------------
DFF_16bits D4_Inst(Inst5,clk_op,1,rst_D4,Inst);
DFF_16bits D4_PC  (Present_inst_addr,clk_op,1,rst_D4,PC_D3);

assign rt_rd_addr = (RF_rt_addr_D3)?Inst[10:8]:Inst[4:2];
assign rs_rd_addr = Inst[7:5];
assign rst_D3 = rst | bubble2;
assign Imm5_ext = Inst[4:0];
assign Imm8_ext = Inst[7:0];
assign Imm_D3 = (Imm5or8_D3)?Imm5_ext:Imm8_ext;

//----Controll unit----	
Instruction_Decoder ID0( Inst,
	MOV_D3, ADDI_D3, SUBI_D3, LHI_D3, LLI_D3, LDR_D3, STR_D3, ADD_D3, ADC_D3, SUB_D3, SBB_D3, CMP_D3, BCC_D3, BCS_D3, BNE_D3, BEQ_D3, BAL_D3, JMP_D3, JAL_Label_D3, JAL_Rm_D3, JR_D3, OutR_D3, HLT_D3);

Controller C0(
	MOV_D3, ADDI_D3, SUBI_D3, LHI_D3, LLI_D3, LDR_D3, STR_D3, ADD_D3, ADC_D3, SUB_D3, SBB_D3, CMP_D3, BCC_D3, BCS_D3, BNE_D3, BEQ_D3, BAL_D3, JMP_D3, JAL_Label_D3, JAL_Rm_D3, JR_D3, OutR_D3, HLT_D3,
	RF_rt_addr_D3, RF_wr_en_bubble_check, RF_wr_from_D3, Imm5or8_D3, JAL_D3, ALU_B_D3, ALU_op_D3, ALU_PSW_D3, Mem_wr_en_bubble_check, ALU_target_D3);
	
//----Branch unit----
Branch_unit BU0(
	.ALU_PSW(ALU_PSW_D2),
	.BCC(BCC_D3),.BCS(BCS_D3),.BNE(BNE_D3),.BEQ(BEQ_D3),
	.C(C),.C_in(C_ALU),.Z(Z),.Z_in(Z_ALU),
	.Branch(Branch));
		
	
RF8_16bits RF0(	
	.en(RF_wr_en),
	.wr_data(wr_data),
	.wr_addr(Inst1[10:8]),
	.rs_addr(rs_rd_addr),
	.rt_addr(rt_rd_addr),
	.clk(clk_op),
	.rst(1),
	.rs(Rs_D3),
	.rt(Rt_D3));		

Hazard_Detector HD0(
	.Inst(Inst),.Inst3(Inst3),
	.LDR_D2(LDR_D2),.JAL_Label(JAL_Label_D3),.Branch(Branch),.JMP(JMP_D3),.JAL_Rm(JAL_Rm_D3),.JR(JR_D3),
	.RF_wr_en_bubble_check(RF_wr_en_bubble_check),
	.Mem_wr_en_bubble_check(Mem_wr_en_bubble_check),
	.work_c(work_c),
	.clk(clk),.rst(1),
	.Stall(Stall),
	.bubble1(bubble1),.bubble2(bubble2),
	.RF_wr_en_D3(RF_wr_en_D3),
	.MEM_wr_en_D3(Memory_wr_en_D3)
	);
	
//-------------------Execution or address calculation-----------------------------------

assign ALU_B_common = (ALU_B_D2)?Rt_forward_D2:Imm_D2;

//Control_signal_bus
always @(posedge clk_op,negedge rst_D3)begin
	if(!rst_D3)begin
		RF_wr_en_D2     <= 'd0;  //Hazard detection
		RF_wr_from_D2   <= 'd0; 
		JAL_D2          <= 'd0; 
		ALU_B_D2        <= 'd0; 
		ALU_op_D2	    <= 'd0; 
		ALU_PSW_D2	    <= 'd0; 
		Memory_wr_en_D2 <= 'd0; 
		ALU_target_D2   <= 'd0;
		LHI_D2          <= 'd0;
		MOV_D2          <= 'd0;
		LDR_D2          <= 'd0;
		STR_D2          <= 'd0;
		OutR_D2         <= 'd0;
		HLT_D2          <= 'd0;
	end
	else begin
		RF_wr_en_D2     <= RF_wr_en_D3;   //Hazard detection
		RF_wr_from_D2   <= RF_wr_from_D3;
		JAL_D2          <= JAL_D3;
		ALU_B_D2        <= ALU_B_D3;
		ALU_op_D2	    <= ALU_op_D3;
		ALU_PSW_D2	    <= ALU_PSW_D3;
		Memory_wr_en_D2 <= Memory_wr_en_D3;
		ALU_target_D2   <= ALU_target_D3;
		LHI_D2          <= LHI_D3;
		MOV_D2          <= MOV_D3;
		LDR_D2          <= LDR_D3;
		STR_D2          <= STR_D3;
		OutR_D2         <= OutR_D3;
		HLT_D2          <= HLT_D3;
	end
end

//Stage3_DFF_
DFF_16bits D3_Rs    (Rs_D3,clk_op,1,rst_D3,Rs_D2);
DFF_16bits D3_Rt    (Rt_D3,clk_op,1,rst_D3,Rt_D2);
DFF_16bits D3_Imm   (Imm_D3,clk_op,1,rst_D3,Imm_D2);
DFF_16bits D3_Inst  (Inst,clk_op,1,rst_D3,Inst3);
DFF_16bits D3_PC    (PC_D3,clk_op,1,rst_D3,PC_D2);

//Mux_for_A
Mux4to1_16bits Rs_forwarding(
		.Din0(Rs_D3),
		.Din1(wr_data_for),
		.Din2(wr_data),
		.Din3(wr_data_D1),
		.Control(Rs_forward),
		.Dout(Rs_forward_D2));
Mux4to1_16bits Mux_ALU_A_target(
		.Din0(Rs_forward_D2),
		.Din1(Rs_forward_D2),
		.Din2({8'd0,Imm_D2[7:0]}),
		.Din3('d0),
		.Control(ALU_target_D2),
		.Dout(ALU_A_target));

//Mux_for_B
Mux4to1_16bits Rt_forwarding(
		.Din0(Rt_D3),
		.Din1(wr_data_for),
		.Din2(wr_data),
		.Din3(wr_data_D1),
		.Control(Rt_forward),
		.Dout(Rt_forward_D2));		
Mux4to1_16bits Mux_ALU_B_target(
		.Din0(ALU_B_common),
		.Din1(ALU_B_common+({6{C}}^ALU_op_D2)),
		.Din2(ALU_B_common[{Imm_D2[7:0],8'd0}]),
		.Din3(ALU_B_common),
		.Control(ALU_target_D2),
		.Dout(ALU_B_target));

//Fowarding_unit
Forwarding_unit For0(
	.Inst0(Inst0[10:8]),.Inst1(Inst1[10:8]),.Inst2(Inst2[10:8]),
	.Inst3(Inst3[10:2]),
	.RF_wr_en_D1(RF_wr_en_D1),.RF_wr_en(RF_wr_en),.RF_wr_en_for(RF_wr_en_for),
	.STR(STR_D2),.LHI(LHI_D2),
	.Rs_forwarding(Rs_forward),.Rt_forwarding(Rt_forward)
	);
		
//ALU	
ALU_16bits ALU0(
	.A(ALU_A_target),
	.B(ALU_B_target),
	.op(ALU_op_D2),
	.S(ALU_sum),
	.N(N_ALU),.Z(Z_ALU),.V(V_ALU),.C(C_ALU));		

//PSW
always @(posedge clk_op,negedge rst)begin
	if(!rst) begin
		N <= 'd0;
		Z <= 'd0;
		V <= 'd0;
		C <= 'd0;
	end
	
	else if(ALU_PSW_D2) begin
		N <= N_ALU;
		Z <= Z_ALU;
		V <= V_ALU;
		C <= C_ALU;
	end
end

assign ALU_sum_D2 = (MOV_D2)? Rs_forward_D2:ALU_sum;

//--------------------Memory access-----------------------------------
assign rst_D2 = rst;
//Control_signal_bus
always @(posedge clk_op,negedge rst_D2)begin
	if(!rst_D2)begin
		RF_wr_en_D1     <= 'd0;  
		RF_wr_from_D1   <= 'd0; 
		JAL_D1          <= 'd0; 
		Memory_wr_en_D1 <= 'd0; 
		LDR_D1        	 <= 'd0;
		OutR_D1         <= 'd0;
		HLT_D1          <= 'd0;
		Rs_forward_D1   <= 'd0;
		
	end
	else begin
		RF_wr_en_D1     <= RF_wr_en_D2;
		RF_wr_from_D1   <= RF_wr_from_D2;
		JAL_D1          <= JAL_D2;
		Memory_wr_en_D1 <= Memory_wr_en_D2;
		LDR_D1          <= LDR_D2;
		OutR_D1         <= OutR_D2;
		HLT_D1          <= HLT_D2;
		Rs_forward_D1   <= Rs_forward_D2;
	end
end

//Stage2_DFF_
DFF_16bits D2_sum   (ALU_sum_D2,clk_op,1,rst,ALU_sum_D1);
DFF_16bits D2_Rt    (Rt_D2,clk_op,1,rst,Rt_D1);
DFF_16bits D2_Inst  (Inst3,clk_op,1,rst,Inst2);
DFF_16bits D2_PC    (PC_D2,clk_op,1,rst,PC_D1);


//Mem_testing
assign Mem_wr_addr = (ext_we)?ext_addr:ALU_sum_D1;
assign Mem_wr_data = (ext_we)?ext_data:Rt_forward_D2;
assign wr_data_D1 = (JAL_D1)?PC_D1:(RF_wr_from_D1)?ALU_sum_D1:Mem_dout;

//Mem
Memory256_16bits Mem_data(
	.addr(Mem_wr_addr[7:0]),
	.Din (Mem_wr_data),
	.clk(clk_op),.en(Memory_wr_en_D1),
	.Dout(Mem_dout));
	

//--------------------Write_back-----------------------------------
//Stage1_DFF_

always @(posedge clk_op,negedge rst)begin
	if(!rst)begin
		RF_wr_en     <= 'd0;
		JAL          <= 'd0;
	end
	else begin
		RF_wr_en     <= RF_wr_en_D1;
		JAL          <= JAL_D1;	
	end
end

DFF_16bits D1_wr_data(wr_data_D1,clk_op,1,rst,wr_data);
DFF_16bits D1_Inst  (Inst2,clk_op,1,rst,Inst1);
DFF_16bits D1_PC    (PC_D1,clk_op,1,rst,PC);

//--------------------Forwarding_stage-----------------------------

DFF_16bits Dfor_RF_wr_en(RF_wr_en,clk_op,1,rst,RF_wr_en_for);
DFF_16bits Dfor_wr_data(wr_data,clk_op,1,rst,wr_data_for);
DFF_16bits Dfor_Inst(Inst1,clk_op,1,rst,Inst0);	

///module Branch_unit(
//	input ALU_PSW,
//	input BCC,BCS,BNE,BEQ,
//	input C,C_in,Z,Z_in,
//	output Branch);
//		
//	wire C_s,Z_s;
//	
//	assign C_s = (ALU_PSW)?C_in:C;
//	assign Z_s = (ALU_PSW)?Z_in:Z;
//	assign Branch = (BCC & (~C_s)) | (BCS & (C_s)) | (BNE & (~Z_s)) | (BEQ & (Z_s));
//	
//endmodule
	

	
//			module RF8_16bits
//	(	input [15:0]wr_data,
//		input [2:0]wr_addr,rs_addr,rt_addr,
//		input clk_op,rst,en,
//		output  [15:0]rs,rt);
//		
//module Mux8to1_16bits
//	(	input [15:0]Din0,Din1,Din2,Din3,Din4,Din5,Din6,Din7,
//		input [2:0]Control,
//		output reg [15:0]Dout);	
//
//	
//module Memory256_16bits(
//	input [7:0]addr,
//	input [15:0]Din,
//	input clk_op,en,
//	output [15:0]Dout);
//	
//module Instruction_Decoder( 
//  input [15:0]Inst,
// output MOV,ADDI,SUBI,LHI,LLI,LDR,STR,ADD,ADC,SUB,SBB,CMP,BCC,BCS,BNE,BEQ,BAL,JMP,JAL_Label,JAL_Rm,JR,OutR,HLT);
// 
// module FA_16bits(
//	input [15:0]A,B,
//	input Cin,
//	output reg[15:0]S,
//	output [16:15]Cout);
//	
//module DFF_16bits
//	(input [15:0]Din,
//		input clk_op,en,rst,
//		output reg[15:0]Dout);
//		
//module Decoder3to8
//	(input [2:0]Din,
//		input en,
//		output reg [7:0]Dout);
//
//module Controller(
// input
//MOV,ADDI,SUBI,LHI,LLI,LDR,STR,ADD,ADC,SUB,SBB,CMP,BCC,BCS,BNE,BEQ,BAL,JMP,JAL_Label,JAL_Rm,JR,OutR,HLT,
//output
//RF_rt_addr,RF_wr_en,RF_wr_from,Imm5or8,JAL,ALU_B,ALU_op,ALU_PSW,Memory_wr_en,
//output [1:0] ALU_target);
//
//
//module Mux2to1_16bits
//	(	input [15:0]Din0,Din1;
//		input Control,
//		output reg [15:0]Dout);

//module ALU_16bits(
//	input [15:0]A,B,
//	input op,
//	output [15:0]S,
//	output N,Z,V,C);

//module Forwarding_unit (
//	input [10:8]Inst0,Inst1,Inst2,
//	input [10:2]Inst3,
//	input RF_wr_en_D1,RF_wr_en,RF_wr_en_for,
//	input STR,LHI,
//	output [1:0]Rs_forwarding,Rt_forwarding
//	);

//module Hazard_Detector(
//	input [15:0]Inst,Inst3,
//	input LDR_D2,JAL_Label,Branch,JMP,JAL_Rm,JRm,
//	input RF_wr_en_bubble_check,bubble1_D3,work_c,Mem_wr_en_bubble_check,
//	input clk_op,rst,
//	output Stall,bubble1,bubble2,RF_wr_en_D3,MEM_wr_en_D3
//	);
		
endmodule

