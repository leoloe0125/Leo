module LASER (
input CLK,
input RST,
input [3:0] X,
input [3:0] Y,
output reg [3:0] C1X,
output reg [3:0] C1Y,
output reg [3:0] C2X,
output reg [3:0] C2Y,
output  DONE);

parameter DIN = 3'd0;
parameter C1_MOVE = 3'd1;
parameter C1_CAL = 3'd2;
parameter C1_DISTABLE = 3'd3;
parameter C1_MAXTABLE = 3'd4;
parameter C2_MOVE = 3'd5;
parameter C2_CAL = 3'd6;
parameter FINISH = 3'd7;
parameter C2_MAXTABLE = 3'd8;

reg [2:0]ps,ns;
reg [8:0]global_cnt;//多一bit用來決定最大的map
reg [2:0]point_cnt;//0~4
reg [3:0]point_map_x[39:0];
reg [3:0]point_map_y[39:0];
wire din_done,c1_done,c2_done,point_done;
wire [3:0]center_x,center_y;


reg [7:0]max_point_num_c1;
reg [7:0]max_point_num_c2;
wire [7:0]max_point_num_total;
reg [7:0]max_point_num_total_reg;


//0~255迭代中，最大的覆蓋量的那一次
reg [7:0]max_i_reg;
wire [3:0]max_center_x,max_center_y;
wire [7:0]point_num;

assign max_center_x = max_i_reg[3:0];
assign max_center_y = max_i_reg[7:4];
//output
always@(posedge CLK,posedge RST)
    if(RST)begin
        C1X <= 0;
        C1Y <= 0;
    end
    else if(c1_done)begin
        C1X <= max_center_x;
        C1Y <= max_center_y;
    end

always@(posedge CLK,posedge RST)
    if(RST)begin
        C2X <= 0;
        C2Y <= 0;
    end
    else if(c2_done)begin
        C2X <= max_center_x;
        C2Y <= max_center_y;
    end


reg [3:0]done_cnt;
always@(posedge CLK,posedge RST)
    if(RST)
        done_cnt <=0;
    else if(c2_done)
        if(max_point_num_total_reg>=max_point_num_total)
            done_cnt <=done_cnt+1;
        else
            done_cnt <=0;

wire convergence;
//assign DONE = (done_cnt==3);
assign DONE =ps==FINISH&&convergence;
//FSM
assign din_done = ps==DIN&&global_cnt==39;
assign point_done = point_cnt==4;
assign c1_done = ps==C1_CAL&&global_cnt[8]&&point_done;
assign c2_done = ps==C2_CAL&&global_cnt[8]&&point_done;
assign convergence = done_cnt==5;
always@(*)
    case (ps)
        DIN         : if(din_done)ns <=C1_MOVE;else ns<= DIN; 
        C1_MOVE     : 
                        ns <= C1_CAL;

        C1_CAL : 
                        if(c1_done)
                            ns <= C2_MOVE;
                        else if(point_done)ns <=C1_MOVE;
                        else ns<= C1_CAL;
        C2_MOVE     :  
                        ns <= C2_CAL;

        C2_CAL : 
                        if(c2_done)
                            ns <= FINISH;
                        else if(point_done)ns <=C2_MOVE;
                        else ns<= C2_CAL;
        FINISH :        if(convergence)
                            ns <= DIN;
                        else
                            ns <= C1_MOVE; 

    default ns <= DIN;
    endcase

always@(posedge CLK,posedge RST)
    if(RST)ps <=DIN;
    else ps <=ns;

always@(posedge CLK,posedge RST)
    if(RST)
    point_cnt <=0;
    else if(din_done||c1_done||c2_done||point_done)
        point_cnt <=0;
    else if(ps==C1_CAL||ps==C2_CAL)
        point_cnt <= point_cnt+1;

always@(posedge CLK,posedge RST)
    if(RST)
    global_cnt <=0;
    else if(din_done||c1_done||c2_done)
        global_cnt <=0;
    else if(ps==DIN||point_done)
        global_cnt <= global_cnt+1;

//DIN
always@(posedge CLK)
    if(ps==DIN)begin
        point_map_x[global_cnt] <= X;
        point_map_y[global_cnt] <= Y;
    end

//C1_MOVE
assign center_x = (global_cnt[8])?max_center_x:global_cnt[3:0];
assign center_y = (global_cnt[8])?max_center_y:global_cnt[7:4];

//C1_CAL

//assign max_i = (point_done&&max_point_num_total<=point_num)? global_cnt:0;

//0~255中，如果某次運算的覆蓋量大於現在存取的最大覆蓋量，就將該運算的覆蓋量取代為最大覆蓋量
always@(posedge CLK,posedge RST)
    if(RST)
        max_i_reg <= 0;
    else if ((ps==C1_CAL&&point_done&&max_point_num_c1<point_num)||
            (ps==C2_CAL&&point_done&&max_point_num_c2<point_num))
        max_i_reg <= global_cnt;

assign max_point_num_total = max_point_num_c1+max_point_num_c2;

always@(posedge CLK,posedge RST)
    if(RST)
        max_point_num_total_reg <= 0;
    else if (ps==FINISH&&max_point_num_total_reg<max_point_num_total)
        max_point_num_total_reg <= max_point_num_total;

always@(posedge CLK,posedge RST)
    if(RST)
        max_point_num_c1 <= 0;
    else if(ps==FINISH)
        max_point_num_c1 <= 0;    
    else if(ps==C1_CAL&&point_done&&max_point_num_c1<point_num)
        max_point_num_c1 <= point_num;

always@(posedge CLK,posedge RST)
    if(RST)
        max_point_num_c2 <= 0;
    else if(ps==FINISH)
        max_point_num_c2 <= 0;
    else if(ps==C2_CAL&&point_done&&max_point_num_c2<point_num)//可能對不上
        max_point_num_c2 <= point_num;


//sub_module port
reg [3:0]point_map_x_0,point_map_x_1,point_map_x_2,point_map_x_3,point_map_x_4,point_map_x_5,
point_map_x_6,point_map_x_7,point_map_x_8,point_map_x_9;
reg [3:0]point_map_y_0,point_map_y_1,point_map_y_2,point_map_y_3,point_map_y_4,point_map_y_5,
point_map_y_6,point_map_y_7,point_map_y_8,point_map_y_9;

always@(*)
    case(point_cnt)
        0:begin
            point_map_x_0 = point_map_x[0];
            point_map_y_0 = point_map_y[0];
            point_map_x_1 = point_map_x[1];
            point_map_y_1 = point_map_y[1];
            point_map_x_2 = point_map_x[2];
            point_map_y_2 = point_map_y[2];
            point_map_x_3 = point_map_x[3];
            point_map_y_3 = point_map_y[3];
            point_map_x_4 = point_map_x[4];
            point_map_y_4 = point_map_y[4];
            point_map_x_5 = point_map_x[5];
            point_map_y_5 = point_map_y[5];
            point_map_x_6 = point_map_x[6];
            point_map_y_6 = point_map_y[6];
            point_map_x_7 = point_map_x[7];
            point_map_y_7 = point_map_y[7];
            point_map_x_8 = point_map_x[8];
            point_map_y_8 = point_map_y[8];
            point_map_x_9 = point_map_x[9];
            point_map_y_9 = point_map_y[9];end
        1:begin
            point_map_x_0 = point_map_x[10];
            point_map_y_0 = point_map_y[10];
            point_map_x_1 = point_map_x[11];
            point_map_y_1 = point_map_y[11];
            point_map_x_2 = point_map_x[12];
            point_map_y_2 = point_map_y[12];
            point_map_x_3 = point_map_x[13];
            point_map_y_3 = point_map_y[13];
            point_map_x_4 = point_map_x[14];
            point_map_y_4 = point_map_y[14];
            point_map_x_5 = point_map_x[15];
            point_map_y_5 = point_map_y[15];
            point_map_x_6 = point_map_x[16];
            point_map_y_6 = point_map_y[16];
            point_map_x_7 = point_map_x[17];
            point_map_y_7 = point_map_y[17];
            point_map_x_8 = point_map_x[18];
            point_map_y_8 = point_map_y[18];
            point_map_x_9 = point_map_x[19];
            point_map_y_9 = point_map_y[19];end
        2:begin
            point_map_x_0 = point_map_x[20];
            point_map_y_0 = point_map_y[20];
            point_map_x_1 = point_map_x[21];
            point_map_y_1 = point_map_y[21];
            point_map_x_2 = point_map_x[22];
            point_map_y_2 = point_map_y[22];
            point_map_x_3 = point_map_x[23];
            point_map_y_3 = point_map_y[23];
            point_map_x_4 = point_map_x[24];
            point_map_y_4 = point_map_y[24];
            point_map_x_5 = point_map_x[25];
            point_map_y_5 = point_map_y[25];
            point_map_x_6 = point_map_x[26];
            point_map_y_6 = point_map_y[26];
            point_map_x_7 = point_map_x[27];
            point_map_y_7 = point_map_y[27];
            point_map_x_8 = point_map_x[28];
            point_map_y_8 = point_map_y[28];
            point_map_x_9 = point_map_x[29];
            point_map_y_9 = point_map_y[29];end
        3:begin
            point_map_x_0 = point_map_x[30];
            point_map_y_0 = point_map_y[30];
            point_map_x_1 = point_map_x[31];
            point_map_y_1 = point_map_y[31];
            point_map_x_2 = point_map_x[32];
            point_map_y_2 = point_map_y[32];
            point_map_x_3 = point_map_x[33];
            point_map_y_3 = point_map_y[33];
            point_map_x_4 = point_map_x[34];
            point_map_y_4 = point_map_y[34];
            point_map_x_5 = point_map_x[35];
            point_map_y_5 = point_map_y[35];
            point_map_x_6 = point_map_x[36];
            point_map_y_6 = point_map_y[36];
            point_map_x_7 = point_map_x[37];
            point_map_y_7 = point_map_y[37];
            point_map_x_8 = point_map_x[38];
            point_map_y_8 = point_map_y[38];
            point_map_x_9 = point_map_x[39];
            point_map_y_9 = point_map_y[39];end
        default:begin
            point_map_x_0 = 0;
            point_map_y_0 = 0;
            point_map_x_1 = 0;
            point_map_y_1 = 0;
            point_map_x_2 = 0;
            point_map_y_2 = 0;
            point_map_x_3 = 0;
            point_map_y_3 = 0;
            point_map_x_4 = 0;
            point_map_y_4 = 0;
            point_map_x_5 = 0;
            point_map_y_5 = 0;
            point_map_x_6 = 0;
            point_map_y_6 = 0;
            point_map_x_7 = 0;
            point_map_y_7 = 0;
            point_map_x_8 = 0;
            point_map_y_8 = 0;
            point_map_x_9 = 0;
            point_map_y_9 = 0;end endcase



fh_module fh0(
    point_map_x_0,point_map_x_1,point_map_x_2,point_map_x_3,point_map_x_4,point_map_x_5,point_map_x_6,point_map_x_7,point_map_x_8,point_map_x_9,
    point_map_y_0,point_map_y_1,point_map_y_2,point_map_y_3,point_map_y_4,point_map_y_5,point_map_y_6,point_map_y_7,point_map_y_8,point_map_y_9,
    center_x,center_y,
    CLK,RST,
    ps,
    point_done,
    global_cnt[8],
    point_cnt,
    point_num
);

//module(state)

endmodule


