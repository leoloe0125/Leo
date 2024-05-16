module fir(rst,clk,data_valid,data,fir_d,fir_valid);
input clk,rst;
input [15:0] data;
input data_valid;
output [15:0] fir_d;
output fir_valid;

parameter STATENUM = 3;
reg[STATENUM-1:0]ps,ns;

reg [4:0] fir_sel;
reg signed [19:0] coe;
reg [4:0] n_sub_k;
wire[15:0] y_data;

//FF
reg [15:0] x_reg[0:31];
reg [15:0] y_reg[0:31];
reg [4:0] k_cnt,n_cnt,reg_cnt,conv_cnt;
wire[15:0] mul_conv_add;

parameter IDLE = 'd0;
parameter DIN = 'd1;
parameter CONV = 'd2;
parameter CONV_DONE = 'd3;
parameter OUTPUT = 'd4;

parameter OP_ADD = 2'b00;
parameter OP_Mul = 2'b10;
//FIR_coefficient
parameter signed [19:0] FIR_C00 = 20'hFFF9E ;  //The FIR_coefficient value 0: -1.495361e-003
parameter signed [19:0] FIR_C01 = 20'hFFF86 ;  //The FIR_coefficient value 1: -1.861572e-003
parameter signed [19:0] FIR_C02 = 20'hFFFA7 ;  //The FIR_coefficient value 2: -1.358032e-003
parameter signed [19:0] FIR_C03 = 20'h0003B ;  //The FIR_coefficient value 3: 9.002686e-004
parameter signed [19:0] FIR_C04 = 20'h0014B ;  //The FIR_coefficient value 4: 5.050659e-003
parameter signed [19:0] FIR_C05 = 20'h0024A ;  //The FIR_coefficient value 5: 8.941650e-003
parameter signed [19:0] FIR_C06 = 20'h00222 ;  //The FIR_coefficient value 6: 8.331299e-003
parameter signed [19:0] FIR_C07 = 20'hFFFE4 ;  //The FIR_coefficient value 7: -4.272461e-004
parameter signed [19:0] FIR_C08 = 20'hFFBC5 ;  //The FIR_coefficient value 8: -1.652527e-002
parameter signed [19:0] FIR_C09 = 20'hFF7CA ;  //The FIR_coefficient value 9: -3.207397e-002
parameter signed [19:0] FIR_C10 = 20'hFF74E ;  //The FIR_coefficient value 10: -3.396606e-002
parameter signed [19:0] FIR_C11 = 20'hFFD74 ;  //The FIR_coefficient value 11: -9.948730e-003
parameter signed [19:0] FIR_C12 = 20'h00B1A ;  //The FIR_coefficient value 12: 4.336548e-002
parameter signed [19:0] FIR_C13 = 20'h01DAC ;  //The FIR_coefficient value 13: 1.159058e-001
parameter signed [19:0] FIR_C14 = 20'h02F9E ;  //The FIR_coefficient value 14: 1.860046e-001
parameter signed [19:0] FIR_C15 = 20'h03AA9 ;  //The FIR_coefficient value 15: 2.291412e-001
parameter signed [19:0] FIR_C16 = 20'h03AA9 ;  //The FIR_coefficient value 16: 2.291412e-001
parameter signed [19:0] FIR_C17 = 20'h02F9E ;  //The FIR_coefficient value 17: 1.860046e-001
parameter signed [19:0] FIR_C18 = 20'h01DAC ;  //The FIR_coefficient value 18: 1.159058e-001
parameter signed [19:0] FIR_C19 = 20'h00B1A ;  //The FIR_coefficient value 19: 4.336548e-002
parameter signed [19:0] FIR_C20 = 20'hFFD74 ;  //The FIR_coefficient value 20: -9.948730e-003
parameter signed [19:0] FIR_C21 = 20'hFF74E ;  //The FIR_coefficient value 21: -3.396606e-002
parameter signed [19:0] FIR_C22 = 20'hFF7CA ;  //The FIR_coefficient value 22: -3.207397e-002
parameter signed [19:0] FIR_C23 = 20'hFFBC5 ;  //The FIR_coefficient value 23: -1.652527e-002
parameter signed [19:0] FIR_C24 = 20'hFFFE4 ;  //The FIR_coefficient value 24: -4.272461e-004
parameter signed [19:0] FIR_C25 = 20'h00222 ;  //The FIR_coefficient value 25: 8.331299e-003
parameter signed [19:0] FIR_C26 = 20'h0024A ;  //The FIR_coefficient value 26: 8.941650e-003
parameter signed [19:0] FIR_C27 = 20'h0014B ;  //The FIR_coefficient value 27: 5.050659e-003
parameter signed [19:0] FIR_C28 = 20'h0003B ;  //The FIR_coefficient value 28: 9.002686e-004
parameter signed [19:0] FIR_C29 = 20'hFFFA7 ;  //The FIR_coefficient value 29: -1.358032e-003
parameter signed [19:0] FIR_C30 = 20'hFFF86 ;  //The FIR_coefficient value 30: -1.861572e-003
parameter signed [19:0] FIR_C31 = 20'hFFF9E ;  //The FIR_coefficient value 31: -1.495361e-003

integer i;

//fsm-----------------------------------------------------------------------
always @(*) begin
    case(ps)
        IDLE: if(data_valid) ns = DIN;else ns = IDLE;
        DIN: if(reg_cnt == 31) ns = CONV;else ns = DIN;
        CONV : if(k_cnt == 31) ns = CONV_DONE;else ns = CONV;
        CONV_DONE : if(n_cnt == 31) ns = OUTPUT;else ns = CONV; 
        OUTPUT : if(reg_cnt == 31) ns = IDLE;else ns = OUTPUT;
    endcase
end
always @(posedge rst,posedge clk) begin
    if(rst) ps <= IDLE;
    else ps <= ns;
end
//counter-------------------------------------------------------------------
//reg_cnt
always @(posedge clk,posedge rst)begin
    if(rst) reg_cnt<=0;
    else if(ps == DIN||ps == OUTPUT)
        reg_cnt<=reg_cnt+1;
    else if(ps == CONV_DONE || ps == IDLE)
        reg_cnt <= 0;
end

//k_cnt
always @(posedge clk,posedge rst) begin
    if(rst) k_cnt<=0;
    else if(ps==CONV) k_cnt<=k_cnt+1;
    else if(ps==CONV_DONE) k_cnt<=0;
end
//n_cnt
always @(posedge clk,posedge rst) begin
    if(rst) n_cnt<=0;
    else if(ps==IDLE) n_cnt<=0;
    else if(ps==CONV_DONE) n_cnt<=n_cnt+1;
end
//conv_cnt
always @(posedge clk,posedge rst) begin
    if(rst) conv_cnt <= 0;
    else if(ps==CONV) conv_cnt<=conv_cnt+1;
    else if(ps==CONV_DONE) conv_cnt<=0;
end
//mem--------------------------------------------------------------------------
//x data input
always @(posedge clk) begin
    if(ps==DIN)
        x_reg[reg_cnt]<=data;
end

//y data output
always @(posedge clk or posedge rst) begin
    if(rst)
        for(i=0;i<32;i=i+1)
            y_reg[i]<=0;
    else if(ps==CONV)
        y_reg[n_cnt]<=mul_conv_add;
end

//Combination-------------------------------------------------------------------------
//fir_sel > coe
always @(*) begin
    case (fir_sel)
        0 : coe = FIR_C00;
        1 : coe = FIR_C01;
        2 : coe = FIR_C02;
        3 : coe = FIR_C03;
        4 : coe = FIR_C04;
        5 : coe = FIR_C05;
        6 : coe = FIR_C06;
        7 : coe = FIR_C07;
        8 : coe = FIR_C08;
        9 : coe = FIR_C09;
        10 : coe = FIR_C10;
        11 : coe = FIR_C11;
        12 : coe = FIR_C12;
        13 : coe = FIR_C13;
        14 : coe = FIR_C14;
        15 : coe = FIR_C15;
        16 : coe = FIR_C16;
        17 : coe = FIR_C17;
        18 : coe = FIR_C18;
        19 : coe = FIR_C19;
        20 : coe = FIR_C20;
        21 : coe = FIR_C21;
        22 : coe = FIR_C22;
        23 : coe = FIR_C23;
        24 : coe = FIR_C24;
        25 : coe = FIR_C25;
        26 : coe = FIR_C26;
        27 : coe = FIR_C27;
        28 : coe = FIR_C28;
        29 : coe = FIR_C29;
        30 : coe = FIR_C30;
        31 : coe = FIR_C31;
        default: coe = 20'h00000;
    endcase
end


always @(*) begin
    if(n_cnt>k_cnt) n_sub_k = n_cnt-k_cnt;
    else n_sub_k = k_cnt-n_cnt;
    fir_sel = k_cnt;
end

fixed_point_operation multiple(x_reg[n_sub_k],{coe[19],{4{coe[19]}},coe[18:16],coe[15:8]},OP_Mul,y_data);
fixed_point_operation ADD(y_reg[n_cnt],y_data,OP_ADD,mul_conv_add);

assign fir_d = y_reg[reg_cnt];
assign fir_valid = (ps==OUTPUT);
endmodule