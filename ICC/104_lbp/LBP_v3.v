
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	clk;
input   	reset;
output  reg[13:0] 	gray_addr;
output         	gray_req;
input   	gray_ready;
input   [7:0] 	gray_data;
output  [13:0] 	lbp_addr;
output  	lbp_valid;
output  [7:0] 	lbp_data;
output  	finish;
//====================================================================

reg [2:0]ps,ns;
 parameter  IDLE          =3'b000;
 parameter  GLOBAL_CNT    =3'b001;
 parameter  DIN           =3'b010;
 parameter  DOUT          =3'b011;
 parameter  DONE     =3'b111;


//cnt
//reg [13:0]global_cnt;
wire x_done,y_done;
reg[6:0]x,y;
reg [3:0]din_cnt;
assign x_done =x==7'd126;
assign y_done =y==7'd126;
//FSM
wire din_done,dout_done;
assign din_done  = din_cnt==9;
assign dout_done = x_done&&y_done;
assign finish = din_done&&dout_done;
always@(posedge clk) //state transfer
    ps <= ns;
always@(*)
    if(reset)ns <= IDLE;
    else case (ps)
        IDLE         : if(gray_ready)ns <= DIN ; else ns <= IDLE;
        DIN          : if(din_done)  ns <= GLOBAL_CNT; else ns <= DIN;
        GLOBAL_CNT   :               ns <= DIN;
        default      : ns <= IDLE;
    endcase

//cnt
/*
wire [13:0]global_cnt_plustwo;
assign global_cnt_plustwo = global_cnt+2;
always@(posedge clk,posedge reset)//
    if(reset) global_cnt <= 14'd129;
    else if(ps==GLOBAL_CNT)
        if(global_cnt_plustwo[6:0]==0)//%126
            global_cnt <= global_cnt +3;
        else
            global_cnt <= global_cnt +1;*/

always@(posedge clk,posedge reset)//
    if(reset) x <= 7'd1;
    else if(ps==GLOBAL_CNT&&x_done)x<=1;
    else if(ps==GLOBAL_CNT)x<=x+1;

always@(posedge clk,posedge reset)//
    if(reset) y <= 7'd1;
    else if(ps==GLOBAL_CNT&&x_done)y<=y+1;


always@(posedge clk,posedge reset)//
    if(reset) din_cnt <= 4'd0;
    else if(din_done)din_cnt <= 0;   
    else if(ps==DIN)din_cnt <= din_cnt +1;     



//interface with rom
assign gray_req =(ps==DIN);
wire[6:0]x_f,x_b,y_f,y_b;
assign x_f=x+1;assign x_b=x-1;assign y_f=y+1;assign y_b=y-1;

always@(*)
    case(din_cnt)
        0:gray_addr={y,x}; 
        1:gray_addr={y_b,x_b};
        2:gray_addr={y_b,x};
        3:gray_addr={y_b,x_f};
        4:gray_addr={y,x_b};
        5:gray_addr={y,x_f};
        6:gray_addr={y_f,x_b}; 
        7:gray_addr={y_f,x};
        8:gray_addr={y_f,x_f};
        default: gray_addr=0;endcase

//interface with ram
assign lbp_addr ={y,x};
assign lbp_valid=(din_done);

threshold t0(
    .clk(clk), 
    .reset(reset),
    .din(gray_data),
    .din_cnt(din_cnt),
    .dout(lbp_data));



endmodule

module threshold(clk, reset,din,din_cnt,dout);
input clk,reset;
input [7:0] din;
input [3:0] din_cnt;

output wire [7:0]dout;

wire din_bin;
wire [7:0] din_s;
reg [7:0] center;
reg [7:0] dout_acc;


integer i;

wire signed [8:0]din_signed;
assign din_signed= din - center;
assign din_bin = ~(din_signed[8]);
assign din_s = din_bin << (din_cnt-1);
assign dout = dout_acc + din_s;

always@(posedge clk)
    if(din_cnt==0)
        center <= din;

always@(posedge clk,posedge reset)
    if(reset)
        dout_acc <= 0;
    else if(din_cnt==9)
        dout_acc <=0;
    else if(din_cnt<9&&din_cnt>0)
        dout_acc <= dout_acc + din_s;

endmodule
//====================================================================

