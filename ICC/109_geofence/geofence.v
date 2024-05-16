

module geofence ( clk,reset,X,Y,R,valid,is_inside);
input clk;
input reset;
input [9:0] X;
input [9:0] Y;
input [10:0] R;
output valid;
output is_inside;
//reg valid;
//reg is_inside;

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


reg [3:0]ps,ns;

reg [2:0]global_cnt;

reg [9:0]fence_x[5:0];
reg [9:0]fence_y[5:0];
reg [10:0]fence_r[5:0];

wire din_done,sort_done,vector_six_done,sort_find_near_done,gv_done;
wire dispow_done,dis_sqrt_done,dis_done;
wire s_a_sqrt_done,s_b_sqrt_done;
wire [25:0] tri_area_total;
wire [25:0] geo_area;


reg [2:0]nonclockwise_cnt;
reg [2:0]vector_cnt;
reg [2:0]point_one;
reg [9:0]point_x_exchange,point_y_exchange;
wire clockwise;//1==順時鐘，0==逆時鐘

//output
assign valid = (global_cnt==6&&ps==TRI_AREA);
assign is_inside = (tri_area_total<=geo_area);

//fsm
assign din_done = (ps==DIN&&global_cnt==5);
assign sort_done = (ps==SORT_EXCHANGE&&global_cnt==4);
assign vector_six_done = (ps==SORT_FIND_NEAR&&vector_cnt==6);//多一CLOCK
assign sort_find_near_done = (vector_six_done&&nonclockwise_cnt==6);//多一CLOCK
assign dispow_done =(ps==TRI_GV_DISPOW&&global_cnt==5);

always@(posedge clk,posedge reset)
    if(reset)ps <=0;
    else ps <= ns;

always@(*)
    case (ps)
        DIN : if(din_done) ns = SORT_FIND_NEAR;else ns = DIN;
        SORT_FIND_NEAR: if(sort_find_near_done)ns = SORT_EXCHANGE; else ns = SORT_FIND_NEAR;
        SORT_EXCHANGE : if(sort_done) ns = GV; else ns = SORT_FIND_NEAR;
        GV : if(gv_done) ns = GV_CAL; else ns = GV;
        GV_CAL : ns = TRI_GV_DISPOW;
        TRI_GV_DISPOW : if(dis_done)ns = TRI_PER;else ns =TRI_GV_DIS;
        TRI_GV_DIS : if(dis_sqrt_done)ns = TRI_GV_DISPOW; else ns =TRI_GV_DIS;
        TRI_PER : ns = TRI_PER_A;
        TRI_PER_A : if(s_a_sqrt_done) ns = TRI_PER_B_PRE;else ns = TRI_PER_A;
        TRI_PER_B_PRE : ns =TRI_PER_B;
        TRI_PER_B : if(s_b_sqrt_done) ns = TRI_AREA;else ns = TRI_PER_B;
        TRI_AREA : if(valid) ns = DIN; else ns  =TRI_PER;
        
    endcase

//fence
always@(posedge clk)
    if(ps==DIN)begin
        fence_x[global_cnt] <= X;
        fence_y[global_cnt] <= Y;
        fence_r[global_cnt] <= R;
    end
    else if (ps==SORT_EXCHANGE)begin
        fence_x[global_cnt+1] <= fence_x[point_one];
        fence_y[global_cnt+1] <= fence_y[point_one];
        fence_r[global_cnt+1] <= fence_r[point_one];
        fence_x[point_one] <= fence_x[global_cnt+1];
        fence_y[point_one] <= fence_y[global_cnt+1];
        fence_r[point_one] <= fence_r[global_cnt+1];
    end
//din
always@(posedge clk,posedge reset)
    if(reset)
        global_cnt <= 0;
    else if(din_done||sort_done||gv_done||dis_done||valid)
        global_cnt <= 0;
    else if(ps==DIN||ps==SORT_EXCHANGE||ps==GV||dis_sqrt_done||ps==TRI_AREA)
        global_cnt <= global_cnt+1;

//sort_find_near
always@(posedge clk,posedge reset)
    if(reset)
        nonclockwise_cnt <=0;
    else if (sort_find_near_done||vector_six_done)
        nonclockwise_cnt <=0;
    else if (ps==SORT_FIND_NEAR&&!clockwise)
        nonclockwise_cnt <= nonclockwise_cnt+1;

always@(posedge clk,posedge reset)
    if(reset)
        vector_cnt <=0;
    else if (vector_six_done)
        vector_cnt <=0;
    else if (ps==SORT_FIND_NEAR)
        vector_cnt <= vector_cnt+1;

always@(posedge clk,posedge reset)
    if(reset)
        point_one <=1;
    else if (ps==SORT_EXCHANGE)
        point_one <=global_cnt+2;
    else if (vector_six_done&&!sort_find_near_done)
        point_one <= point_one+1;

/*#always@(posedge clk,posedge reset)
    if(reset)
        point_x_exchange <= 0;
    else if (sort_find_near_done)
        point_x_exchange <= x1;

always@(posedge clk,posedge reset)
    if(reset)
        point_y_exchange <= 0;
    else if (sort_find_near_done)
        point_y_exchange <= y1;

//sort_exchange
always@(posedge clk,posedge reset)
    if(reset)
        point_y_exchange <= 0;
    else if (sort_find_near_done)
        point_y_exchange <= y1;*/

//gv
       
wire [9:0]x0,y0,x1,y1,x2,y2;
wire [10:0]r0,r1;

assign r0 = fence_r[global_cnt];
assign r1 = fence_r[(global_cnt==5)?0:global_cnt+1];
assign x0 = fence_x[global_cnt];
assign y0 = fence_y[global_cnt];
assign x1 = (ps==SORT_FIND_NEAR)?fence_x[point_one]:fence_x[(global_cnt==5)?0:global_cnt+1];
assign y1 = (ps==SORT_FIND_NEAR)?fence_y[point_one]:fence_y[(global_cnt==5)?0:global_cnt+1];
assign x2 = fence_x[vector_cnt];
assign y2 = fence_y[vector_cnt];//討論


cross_product cw(x0,y0,x1,y1,x2,y2,clockwise);
geo_area g0(x0,y0,x1,y1,global_cnt,ps,clk,reset,geo_area,gv_done);
tri_area a0(r0,r1,x0,y0,x1,y1,global_cnt,ps,clk,reset,
dis_sqrt_done,s_a_sqrt_done,s_b_sqrt_done,dis_done,tri_area_total);

endmodule

//clockwise==1 代表20在10的順時鐘方向

module cross_product(x0,y0,x1,y1,x2,y2,clockwise);

input [9:0] x0,y0,x1,y1,x2,y2;
output clockwise;

wire signed[10:0]Ax,Ay;//小心有號 //筆記
wire signed[10:0]Bx,By;//小心有號
wire [20:0]cross_product;//有可能出錯


assign Ax=x1-x0;
assign Ay=y1-y0;
assign Bx=x2-x0;
assign By=y2-y0;

assign cross_product = Ax*By-Bx*Ay;
assign clockwise = (cross_product[20]);

endmodule