module Forwarding_unit (
	input [10:8]Inst0,Inst1,Inst2,
	input [10:2]Inst3,
	input RF_wr_en_D1,RF_wr_en,RF_wr_en_for,
	input STR,LHI,
	output [1:0]Rs_forwarding,Rt_forwarding
	);

//Rs_forwarding
wire Rs32,Rs31,Rs30;
wire Rs31_en,Rs30_en;
	
assign Rs32 = 	RF_wr_en_D1  & (~(Inst3[7]^ Inst2[10]) & ~(Inst3[6]^ Inst2[9]) & ~(Inst3[5]^ Inst2[8]));
assign Rs31 = 	RF_wr_en     & (~(Inst3[7]^ Inst1[10]) & ~(Inst3[6]^ Inst1[9]) & ~(Inst3[5]^ Inst1[8]));
assign Rs30 = 	RF_wr_en_for & (~(Inst3[7]^ Inst0[10]) & ~(Inst3[6]^ Inst0[9]) & ~(Inst3[5]^ Inst0[8]));
	
assign Rs31_en = (~Rs32)&Rs31;
assign Rs30_en = (~Rs32)&(~Rs31)&(Rs30);
	
assign Rs_forwarding[0] =  Rs32    | Rs31_en;
assign Rs_forwarding[1] =  Rs31_en | Rs30_en;


//Rt_forwarding
wire Rt32,Rt31,Rt30;
wire Rt32_common,Rt31_common,Rt30_common;
wire Rt32_specific,Rt31_specific,Rt30_specific;
wire Rt31_en,Rt30_en;
	
assign Rt32_common   = 	RF_wr_en_D1  & (~(Inst3[4]^ Inst2[10]) & ~(Inst3[3]^ Inst2[9]) & ~(Inst3[2]^ Inst2[8]));
assign Rt32_specific =  RF_wr_en_D1  & (~(Inst3[10]^ Inst2[10]) & ~(Inst3[9]^ Inst2[9]) & ~(Inst3[8]^ Inst2[8]));
assign Rt32 = (STR|LHI)?Rt32_specific:Rt32_common;

assign Rt31_common   = 	RF_wr_en     & (~(Inst3[4]^ Inst1[10]) & ~(Inst3[3]^ Inst1[9]) & ~(Inst3[2]^ Inst1[8]));
assign Rt31_specific =  RF_wr_en     & (~(Inst3[10]^ Inst1[10]) & ~(Inst3[9]^ Inst1[9]) & ~(Inst3[8]^ Inst1[8]));
assign Rt31 = (STR|LHI)?Rt31_specific:Rt31_common;

assign Rt30_common   = 	RF_wr_en_for & (~(Inst3[4]^ Inst0[10]) & ~(Inst3[3]^ Inst0[9]) & ~(Inst3[2]^ Inst0[8]));
assign Rt30_specific =  RF_wr_en_for & (~(Inst3[10]^ Inst0[10]) & ~(Inst3[9]^ Inst0[9]) & ~(Inst3[8]^ Inst0[8]));
assign Rt30 = (STR|LHI)?Rt30_specific:Rt30_common;

assign Rt31_en = (~Rt32)&Rt31;
assign Rt30_en = (~Rt32)&(~Rt31)&(Rt30);
	
assign Rt_forwarding[0] =  Rt32    | Rt31_en;
assign Rt_forwarding[1] =  Rt31_en | Rt30_en;

endmodule


