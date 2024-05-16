


module  FAS (data_valid, data, clk, rst, fir_d, fir_valid, fft_valid, done, freq,
 fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8,
 fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0);
input clk, rst;
input data_valid;
input [15:0] data; 

output fir_valid, fft_valid;
output [15:0] fir_d;
output [31:0] fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8;
output [31:0] fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0;
output done;
output [3:0] freq;

//`include "./dat/FIR_coefficient.dat"
//*********************************************************************************************************
parameter IDLE = 'd0;
parameter DIN = 'd1;
parameter DIN_REG_RESET = 'd2;
parameter FIR_DIN = 'd3;
parameter FIR = 'd4;
parameter FFT_DIN = 'd5;
parameter FFT ='d6;

parameter STATE_NUM = 3;
reg[STATE_NUM-1:0]ps,ns;
reg[3:0] data_cnt;
reg[5:0] data_team_cnt;
reg data_input_cnt;
reg[15:0] data_reg[0:1023];
wire fir_done,din_done;
wire[15:0] fir_input;
assign fir_valid = fir_done;
//fsm--------------------------------------------------------------
always @(*) begin
    case(ps)
        DIN: if({data_team_cnt,data_cnt}==10'd1023) ns = DIN_REG_RESET;else ns = DIN;
        DIN_REG_RESET : ns = FIR_DIN;
        FIR_DIN : if(data_cnt==15 && data_input_cnt) ns=FIR;else ns= FIR_DIN;
        FIR : if(fir_done) ns = FFT_DIN;else ns = FIR;
        FFT : ns = FFT_DIN; 
    endcase
end
always @(posedge rst,posedge clk) begin
    if(rst) ps <= DIN;
    else ps <= ns;
end
//Data Counter-----------------------------------------------------
always @(posedge rst,posedge clk) begin
    if(rst) data_cnt<=0;
    else if(ps==IDLE || ps==DIN_REG_RESET) data_cnt<=0;  
    else if(ps==DIN || FIR_DIN) begin
        if(data_cnt == 15) data_cnt<=0;
        else if(data_valid)data_cnt<=data_cnt+1;
    end
end
always @(posedge rst,posedge clk) begin
    if(rst) data_team_cnt<=0;
    else if(ps==IDLE || ps==DIN_REG_RESET) data_team_cnt<=0;  
    else if(ps==DIN || FIR_DIN)begin
        if(data_cnt==15&& data_team_cnt==64)
            data_team_cnt<=0;
        else if(data_cnt==15)
            data_team_cnt <= data_team_cnt+1;
    end
end
always @(posedge rst,posedge clk) begin
    if(rst) data_team_cnt<=0;
    else if(FIR_DIN)begin
        if(data_cnt==15)
            data_input_cnt <= ~data_input_cnt;
    end
end
always @(posedge clk) begin
    if(ps==DIN)
        data_reg[{data_team_cnt,data_cnt}]<=data;
end
assign fir_input = data_reg[{data_team_cnt,data_cnt}];
assign din_done = (ps==DIN_REG_RESET);
assign fir_valid = (ps==FFT_DIN);
fir  fir_inst (
    .clk(clk),
    .rst(rst),
    .data(fir_input),
    .data_valid(din_done),
    .fir_d(fir_d),
    .fir_valid(fir_done)
  );
endmodule




module twos_addsuber(
    input a_sign,b_sign,
    input [7:0]din_a,din_b,//{sign1,value8}
    input [1:0]cin,
    input op,
    output reg[8:0]dout,//{sign1,value8}
    output reg cout
);
    wire signed[8:0]din_a_com  =din_a^{9{op}}+op;
    wire signed[8:0]din_b_com  =din_b^{9{op}}+op;
    wire [9:0]din_a_com_ext = (cin==1)?{~a_sign,din_a_com}:din_a_com;
    wire [9:0]din_b_com_ext = (cin==1)?{~b_sign,din_b_com}:din_b_com;
    always@(*)
            {cout,dout} =(op)?din_a_com_ext-din_b_com_ext: din_a_com_ext+din_b_com_ext;
endmodule



module fixed_point_operation(
    input signed [15:0]din_a,din_b,
    input signed [1:0]op,
    output reg [15:0]dout);

    parameter add = 0;
    parameter sub = 1;
    parameter mul = 2'b10;

    wire signed [16:0]dout_add=din_a+din_b;
    wire signed [16:0]dout_sub=din_a-din_b;
    wire signed [31:0]dout_mul=din_a*din_b;

    always@(*)begin
        case(op)
            add:dout={dout_add[16],dout_add[15:1]};
            sub:dout={dout_sub[16],dout_sub[15:0]};
            mul:dout={dout_mul[31],dout_mul[22:8]};
            default:dout=0;
        endcase
    end
endmodule

//design ware
/*
module fft_fft(
    input [15:0] fir_d,
    input clk,rst,
    input fir_valid,
    output [31:0] fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8,
    output [31:0] fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0,
    output dout_valid
);

    reg [15:0]x[0:15];
    wire [15:0]xa[0:15];

    wire [15:0]xb_r[0:15];
    wire [15:0]xb_i[0:15];

    wire [15:0]xc_r[0:15];
    wire [15:0]xc_i[0:15];

    wire [15:0]xd_r[0:15];
    wire [15:0]xd_i[0:15];

    wire [15:0]xe_r[0:15];
    wire [15:0]xe_i[0:15];

    wire [15:0]xf_r[0:15];
    wire [15:0]xf_i[0:15];

    wire [15:0]xg_r[0:15];
    wire [15:0]xg_i[0:15];


    reg [3:0]din_cnt;
    
assign dout_valid = din_cnt==15;
always@(posedge clk,negedge rst)
    if(rst)din_cnt <=0;
    else if(fir_valid)din_cnt<=din_cnt+1;

always@(posedge clk)
    if(fir_valid) x[din_cnt]<=fir_d;


reg [15:0] w_r [0:7];
initial $readmemh("D:/projects/ICC/102_fas/dat/Real_Value_Ref.dat", w_r);

reg [15:0] w_i [0:7];
initial $readmemh("D:/projects/ICC/102_fas/dat/Imag_Value_Ref.dat", w_i);

//xa
genvar i;
generate for ( i=0 ;i<16 ;i=i+1 ) begin:xa_op
    if(i<8)
        fixed_point_operation fpo_a(x[i],x[i+8],2'b00,xa[i]);
    else
        fixed_point_operation fpo_a(x[i],x[i+8],2'b01,xa[i]);
end
endgenerate

//xb
generate for ( i=0 ;i<16 ;i=i+1 ) begin:xb_op
    if(i>8)begin
        fixed_point_operation fpo_b_real(xa[i],w_r[i],2'b10,xb_r[i]);
        fixed_point_operation fpo_b_imag(xa[i],w_i[i],2'b10,xb_i[i]);
    end
    else begin
        assign xb_r[i] = xa[i];
        assign xb_i[i] = 0;
    end

end
endgenerate


/*
fixed_point_operation fpo_b_real_m_real(xb[i],b[i+4],2'b00,xc_r[i]);
                    fixed_point_operation fpo_b_imag_m_imag(xb[i],b[i+4],2'b00,xc_i[i]);
                    fixed_point_operation fpo_c_real(xc_r[i],xc_i[i],2'b00,xc_r[i]);

//xc
generate for ( i=0 ;i<16 ;i=i+1 ) begin:xc_op
    if(i<8)
        if(i<5)begin
            fixed_point_operation fpo_c_add_real(xb_r[i],xb_r[i+4],2'b00,xc_r[i]);
            fixed_point_operation fpo_c_add_imag(xb_i[i],xb_i[i+4],2'b00,xc_i[i]);
        end
        else begin
            fixed_point_operation fpo_c_sub_real(xb_r[i],xb_r[i+4],2'b01,xc_r[i]);
            fixed_point_operation fpo_c_sub_imag(xb_i[i],xb_i[i+4],2'b01,xc_i[i]);
        end
    else
        if(i<12)begin
            fixed_point_operation fpo_c_add_real(xb_r[i],xb_r[i+4],2'b01,xc_r[i]);
            fixed_point_operation fpo_c_add_imag(xb_i[i],xb_i[i+4],2'b01,xc_i[i]);
        end
        else begin
            fixed_point_operation fpo_c_sub_real(xb_r[i],xb_r[i+4],2'b00,xc_r[i]);
            fixed_point_operation fpo_c_sub_imag(xb_i[i],xb_i[i+4],2'b00,xc_i[i]);
        end
end
endgenerate

//xd
generate for ( i=0 ;i<16 ;i=i+1 ) begin:xd_op
    if(i==4||i==12)begin
        //real part
        fixed_point_operation fpo_d_real_m_real(xc_r[i],w_r[0],2'b10,xd_r[i]);
        fixed_point_operation fpo_d_imag_m_imag(xc_i[i],w_i[0],2'b10,xd_i[i]);
        fixed_point_operation fpo_d_real(xd_r[i],xd_i[i],2'b00,xd_r[i]);
        //imag part
        fixed_point_operation fpo_d_real_m_imag(xc_r[i],w_i[0],2'b10,xd_r[i]);
        fixed_point_operation fpo_d_imag_m_real(xc_i[i],w_r[0],2'b10,xd_i[i]);
        fixed_point_operation fpo_d_imag(xd_r[i],xd_i[i],2'b00,xd_i[i]);
    end

    else if(i==5||i==13)begin
        //real part
        fixed_point_operation fpo_d_real_m_real(xc_r[i],w_r[1],2'b10,xd_r[i]);
        fixed_point_operation fpo_d_imag_m_imag(xc_i[i],w_i[1],2'b10,xd_i[i]);
        fixed_point_operation fpo_d_real(xd_r[i],xd_i[i],2'b00,xd_r[i]);
        //imag part
        fixed_point_operation fpo_d_real_m_imag(xc_r[i],w_i[1],2'b10,xd_r[i]);
        fixed_point_operation fpo_d_imag_m_real(xc_i[i],w_r[1],2'b10,xd_i[i]);
        fixed_point_operation fpo_d_imag(xd_r[i],xd_i[i],2'b00,xd_i[i]);
    end

    else if(i==6||i==14)begin
        //real part
        fixed_point_operation fpo_d_real_m_real(xc_r[i],w_r[2],2'b10,xd_r[i]);
        fixed_point_operation fpo_d_imag_m_imag(xc_i[i],w_i[2],2'b10,xd_i[i]);
        fixed_point_operation fpo_d_real(xd_r[i],xd_i[i],2'b00,xd_r[i]);
        //imag part
        fixed_point_operation fpo_d_real_m_imag(xc_r[i],w_i[2],2'b10,xd_r[i]);
        fixed_point_operation fpo_d_imag_m_real(xc_i[i],w_r[2],2'b10,xd_i[i]);
        fixed_point_operation fpo_d_imag(xd_r[i],xd_i[i],2'b00,xd_i[i]);
    end
    else if(i==7||i==15)begin
       // fixed_point_operation fpo(xc[i],w[3],2'b10,xd[i]);
        //real part
        fixed_point_operation fpo_d_real_m_real(xc_r[i],w_r[3],2'b10,xd_r[i]);
        fixed_point_operation fpo_d_imag_m_imag(xc_i[i],w_i[3],2'b10,xd_i[i]);
        fixed_point_operation fpo_d_real(xd_r[i],xd_i[i],2'b00,xd_r[i]);
        //imag part
        fixed_point_operation fpo_d_real_m_imag(xc_r[i],w_i[3],2'b10,xd_r[i]);
        fixed_point_operation fpo_d_imag_m_real(xc_i[i],w_r[3],2'b10,xd_i[i]);
        fixed_point_operation fpo_d_imag(xd_r[i],xd_i[i],2'b00,xd_i[i]);
    end

    else begin
        assign xd_r[i]=xc_r[i];
        assign xd_i[i]=xc_i[i];
    end
end
endgenerate

//xe
generate for ( i=0 ;i<16 ;i=i+1 ) begin:xe_op
    if(i%4==0||(i%4==1))begin
        fixed_point_operation fpo_e_real(xd_r[i],xd_r[i+2],2'b00,xe_r[i]);
        fixed_point_operation fpo_e_imag(xd_i[i],xd_i[i+2],2'b00,xe_i[i]);
    end
    else begin
        //fixed_point_operation fpo_e_real(xd[i],xd[i+2],2'b01,xe[i]);
        fixed_point_operation fpo_e_real(xd_r[i],xd_r[i+2],2'b01,xe_r[i]);
        fixed_point_operation fpo_e_imag(xd_i[i],xd_i[i+2],2'b01,xe_i[i]);
    end
       
end
endgenerate

//xf
generate for ( i=0 ;i<16 ;i=i+1 ) begin:xf_op
    if(i%4==0||(i%4==1))begin
        assign xf_r[i]=xe_r[i];
        assign xf_i[i]=xe_i[i];
    end
    else if(i%4==2)begin
        //fixed_point_operation fpo_f_real(xe[i],w[0],2'b10,xf[i]);
        //real part
        fixed_point_operation fpo_f_real_m_real(xe_r[i],w_r[0],2'b10,xf_r[i]);
        fixed_point_operation fpo_f_imag_m_imag(xe_i[i],w_i[0],2'b10,xf_i[i]);
        fixed_point_operation fpo_f_real(xf_r[i],xf_i[i],2'b00,xf_r[i]);
        //imag part
        fixed_point_operation fpo_f_real_m_imag(xe_r[i],w_i[0],2'b10,xf_r[i]);
        fixed_point_operation fpo_f_imag_m_real(xe_i[i],w_r[0],2'b10,xf_i[i]);
        fixed_point_operation fpo_f_imag(xf_r[i],xf_i[i],2'b00,xf_i[i]);

    end
    else if(i%4==3)begin
        //fixed_point_operation fpo(xe[i],w[4],2'b10,xf[i]);
        //real part
        fixed_point_operation fpo_f_real_m_real(xe_r[i],w_r[4],2'b10,xf_r[i]);
        fixed_point_operation fpo_f_imag_m_imag(xe_i[i],w_i[4],2'b10,xf_i[i]);
        fixed_point_operation fpo_f_real(xf_r[i],xf_i[i],2'b00,xf_r[i]);
        //imag part
        fixed_point_operation fpo_f_real_m_imag(xe_r[i],w_i[4],2'b10,xf_r[i]);
        fixed_point_operation fpo_f_imag_m_real(xe_i[i],w_r[4],2'b10,xf_i[i]);
        fixed_point_operation fpo_f_imag(xf_r[i],xf_i[i],2'b00,xf_i[i]);
    end
       
end
endgenerate

//xg
generate for ( i=0 ;i<16 ;i=i+1 ) begin:xg_op
    fixed_point_operation fpo_g_real(xf_r[i],xf_r[i+1],2'b01,xg_r[i]);
    fixed_point_operation fpo_g_imag(xf_i[i],xf_i[i+1],2'b01,xg_i[i]);
end
endgenerate

assign fft_d0 = {xg_r[0],xg_i[0]};
assign fft_d1 = {xg_r[8],xg_i[8]};
assign fft_d2 = {xg_r[4],xg_i[4]};
assign fft_d3 = {xg_r[12],xg_i[12]};
assign fft_d4 = {xg_r[2],xg_i[2]};
assign fft_d5 = {xg_r[10],xg_i[10]};
assign fft_d6 = {xg_r[6],xg_i[6]};
assign fft_d7 = {xg_r[14],xg_i[14]};
assign fft_d8 = {xg_r[1],xg_i[1]};
assign fft_d9 = {xg_r[9],xg_i[9]};
assign fft_d10 = {xg_r[5],xg_i[5]};
assign fft_d11 = {xg_r[13],xg_i[13]};
assign fft_d12 = {xg_r[3],xg_i[3]};
assign fft_d13 = {xg_r[11],xg_i[11]};
assign fft_d14 = {xg_r[7],xg_i[7]};
assign fft_d15 = {xg_r[15],xg_i[15]};

endmodule

module analysis(
    input clk,rst,analysis_start,
    input [31:0] fft_d0, fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8,
    input [31:0] fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15,
    output reg[3:0]freq,
    output freq_valid
);

    reg [3:0] compare_cnt;
    reg [63:0]big_value;
    wire [63:0]real_square,imag_square;
    wire [64:0]value;
    reg [31:0] fft_r,fft_i;

    
    always@(posedge clk,posedge rst)
        if(rst)compare_cnt<=0;
        else if(compare_cnt<15)compare_cnt<=compare_cnt+1;

    always@(posedge clk,posedge rst)
        if(rst)begin
            big_value<=0;
            freq <=0;
        end
        else if(analysis_start)
            if(big_value<value) begin
                big_value<=value;
                freq <=compare_cnt;
            end

    assign real_square=fft_r*fft_r;
    assign imag_square=fft_i*fft_i;
    assign value=real_square+imag_square;
    always@(*)
            case(compare_cnt)
                0:begin fft_r = fft_d0[14:0];fft_i = fft_d0[30:16];end
                1:begin fft_r = fft_d1[14:0];fft_i = fft_d1[30:16];end
                2:begin fft_r = fft_d2[14:0];fft_i = fft_d2[30:16];end
                3:begin fft_r = fft_d3[14:0];fft_i = fft_d3[30:16];end
                4:begin fft_r = fft_d4[14:0];fft_i = fft_d4[30:16];end
                5:begin fft_r = fft_d5[14:0];fft_i = fft_d5[30:16];end
                6:begin fft_r = fft_d6[14:0];fft_i = fft_d6[30:16];end
                7:begin fft_r = fft_d7[14:0];fft_i = fft_d7[30:16];end
                8:begin fft_r = fft_d8[14:0];fft_i = fft_d8[30:16];end
                9:begin fft_r = fft_d9[14:0];fft_i = fft_d9[30:16];end
                10:begin fft_r = fft_d10[14:0];fft_i = fft_d10[30:16];end
                11:begin fft_r = fft_d11[14:0];fft_i = fft_d11[30:16];end
                12:begin fft_r = fft_d12[14:0];fft_i = fft_d12[30:16];end
                13:begin fft_r = fft_d13[14:0];fft_i = fft_d13[30:16];end
                14:begin fft_r = fft_d14[14:0];fft_i = fft_d14[30:16];end
                15:begin fft_r = fft_d15[14:0];fft_i = fft_d15[30:16];end
            endcase

    assign freq_valid =compare_cnt==15;

endmodule

//design ware
*/