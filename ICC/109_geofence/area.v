
//done 結束GV State計算進入GV_CAL
//gv_cnt 0~5做6次計算(繞一圈)，做完會切done
//第一次 x0 x1, 第二次 x1,X2,..., 第六次 X5,x0;
module geo_area (x0,y0,x1,y1,global_cnt,ps,clk,reset,geo_area,gv_done);
input [9:0] x0,y0;
input [9:0] x1,y1;
input [2:0]global_cnt;
input [3:0]ps;
input clk,reset;
output reg [25:0] geo_area;
output reg gv_done;

reg signed[20:0] gv [5:0];
integer i;


parameter GV = 3'd4;
parameter GV_CAL = 3'd5;

// GV State 計算外積向量
always@(posedge clk)
    if(ps == GV)
        gv[global_cnt] <= x0*y1 - x1*y0;

// Done跳出GV State 
always@(*)
begin
    if(ps==GV&&global_cnt == 5)//
        gv_done = 1;
    else
        gv_done = 0;
end

// GV_CAL State計算面積，可能要弄出去做
always@(posedge clk)
begin
    if(ps == GV_CAL)
        geo_area <= (gv[0] + gv[1] + gv[2] + gv[3] + gv[4] + gv[5])>>1;

end
endmodule

module tri_area(r0,r1,x0,y0,x1,y1,global_cnt,ps,clk,reset,dis_sqrt_done,s_a_sqrt_done,s_b_sqrt_done,dis_done,tri_area_total);
input [10:0] r0,r1;
input [9:0] x0,x1;
input [9:0] y0,y1;
input [2:0]global_cnt;
input [3:0]ps;
input clk,reset;
output reg dis_sqrt_done,s_a_sqrt_done,s_b_sqrt_done;
output reg dis_done;
output reg[25:0] tri_area_total;

parameter DIN =4'd0;
parameter SORT=4'd1;
parameter SORT_FIND_NEAR=4'd2;
parameter SORT_EXCHANGE = 4'd3;
parameter GV = 4'd4;
parameter GV_CAL = 4'd5;
parameter TRI_GV_DISPOW = 4'd6;
parameter TRI_GV_DIS = 4'd7;
parameter TRI_PER = 4'd8;
parameter TRI_PER_A = 4'd9;
parameter TRI_PER_B = 4'd10;
parameter TRI_AREA = 4'd11;
parameter TRI_PER_B_PRE = 4'd12;

reg unsigned [20:0] gv_dispow;
reg[10:0] gv_dis_sqrt;
reg dispow_done,s_a_done,s_b_done;
reg [9 : 0]gv_dis[5:0];

reg signed [10:0] gv_X,gv_Y;
integer i;

reg sqrt_start;
wire sqrt_finish;
reg [20:0] sqrt_input;
wire [11:0] sqrt_output;
reg [10:0] s_reg;
reg [11:0]s;
reg [10:0] s_a;
reg [20:0] s_a_mul,s_b_mul;
reg [11:0] s_a_sqrt,s_b_sqrt;
reg [11:0] s_a_sqrt_reg,s_b_sqrt_reg;
reg [25:0] tri_area;
reg [25:0] tri_area_reg;



/*---------------------
-----------------------*/
always@(*)
begin
    if(ps == TRI_AREA && global_cnt==6)
        tri_area_total = tri_area_reg;
    else
        tri_area_total = 0;
end
always@(*)
begin
    //TRI_PER
    s = (r0 + r1 + gv_dis[global_cnt])>>1;
    s_a = s - gv_dis[global_cnt];
    s_a_mul = s * s_a;
    // TRI_PER_B_PRE
    s_b_mul = (s-r0)*(s-r1);
    //TRI_AREA
    tri_area = s_a_sqrt_reg * s_b_sqrt_reg;
end
always@(*)
begin
    if(ps == TRI_PER)
        s_a_done = 1;
    else
        s_a_done = 0;     
end

always@(*)
begin
    if(ps == TRI_PER_B_PRE)
        s_b_done = 1;
    else
        s_b_done = 0;   
end
always@(posedge clk)
begin
    if(ps == TRI_PER)
        s_reg <= s;
end
//SQRT_IP選擇器
always@(*)
begin
    if(ps == TRI_GV_DIS || ps == TRI_GV_DISPOW)
    begin
        sqrt_start = dispow_done;
        sqrt_input = gv_dispow;
        dis_sqrt_done = sqrt_finish;
        gv_dis_sqrt = sqrt_output;
    end
    else if(ps == TRI_PER)
    begin
        sqrt_start = s_a_done;
        sqrt_input = s_a_mul;
        s_a_sqrt_done = 0;
        s_a_sqrt = 0;
    end
    else if (ps==TRI_PER_A)
    begin
        sqrt_start = 0;
        sqrt_input = 0;
        s_a_sqrt_done = sqrt_finish;
        s_a_sqrt = sqrt_output;
    end
    else if(ps == TRI_PER_B_PRE)
    begin
        sqrt_start = s_b_done;
        sqrt_input = s_b_mul;
        s_b_sqrt_done = 0;
        s_b_sqrt = 0;
    end
    else if (ps==TRI_PER_B)
    begin
        sqrt_start = 0;
        sqrt_input = 0;
        s_b_sqrt_done = sqrt_finish;
        s_b_sqrt = sqrt_output;
    end
    else
    begin
        sqrt_start = 0;
        sqrt_input = 0;
        s_a_sqrt_done = 0;
        s_a_sqrt = 0;
    end
end
always@(posedge clk)
begin
    if(s_a_sqrt_done && ps == TRI_PER_A)
        s_a_sqrt_reg <= s_a_sqrt;
    else if(s_b_sqrt_done && ps == TRI_PER_B)
        s_b_sqrt_reg <= s_b_sqrt;
end
always@(posedge clk,posedge reset)
begin
    if(reset)
        tri_area_reg <=0;
    else if(ps==DIN)
        tri_area_reg <=0;
    else if(ps == TRI_AREA && global_cnt<6)
        tri_area_reg <= tri_area + tri_area_reg;
    //global_cnt+1,if global_cnt<6 回到TRI_PER
end
/*---------------------
-----------------------*/

always@(*)
begin
    gv_X = x1 - x0;
    gv_Y = y1 - y0;
    gv_dispow = gv_Y * gv_Y + gv_X * gv_X;
end


always@(posedge clk)
begin
    if(gv_dis_sqrt && ps == TRI_GV_DIS)
        gv_dis[global_cnt] <= gv_dis_sqrt[10:0];
end


// dispow_Done跳出dispow State 
always@(*)
begin
    if(ps == TRI_GV_DISPOW&&!dis_done)//
        dispow_done = 1;
    else
        dispow_done = 0;   
end

always@(posedge clk or posedge reset)
if(reset)
    dis_done <= 0;
else if(ps == TRI_GV_DIS && dis_sqrt_done && global_cnt==5)
    dis_done <= 1;
else
    dis_done <= 0;


sqrt_ip sqrt0 (
  .aclk(clk),                                        // input wire aclk
  .s_axis_cartesian_tvalid(sqrt_start),               // input wire s_axis_cartesian_tvalid
  .s_axis_cartesian_tdata(sqrt_input),    // input wire [23 : 0] s_axis_cartesian_tdata
  .m_axis_dout_tvalid(sqrt_finish),            // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(sqrt_output)              // output wire [15 : 0] m_axis_dout_tdata
);

endmodule

