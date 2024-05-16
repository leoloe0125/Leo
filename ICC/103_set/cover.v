module sqrt_dis(din,dout);
input[3:0] din;
output reg[7:0] dout;

parameter SQRT_0 = 8'd0;
parameter SQRT_1 = 8'd1;
parameter SQRT_2 = 8'd4;
parameter SQRT_3 = 8'd9;
parameter SQRT_4 = 8'd16;
parameter SQRT_5 = 8'd25;
parameter SQRT_6 = 8'd36;
parameter SQRT_7 = 8'd49;
parameter SQRT_8 = 8'd81;



always@(*)
begin
case(din)
    4'd0 : dout = SQRT_0;
    4'd1 : dout = SQRT_1;
    4'd2 : dout = SQRT_2;
    4'd3 : dout = SQRT_3;
    4'd4 : dout = SQRT_4;
    4'd5 : dout = SQRT_5;
    4'd6 : dout = SQRT_6;
    4'd7 : dout = SQRT_7;
    4'd8 : dout = SQRT_8;
    default: dout = SQRT_0;
endcase
end

endmodule

module cover(ps,center_x,center_y,clk,rst,radius,table_addr,table_data,cover_done);
input[3:0] ps;
input[3:0] center_x,center_y;
input[3:0] radius;
input clk,rst;
output wire [5:0] table_addr;
output wire table_data;
output cover_done;

parameter IDLE=4'd0;
parameter DONE=4'd14;

reg[2:0] cover_counter_x,cover_counter_y;
wire[3:0] x_dis,y_dis;
wire[7:0] x_dis_sqrt,y_dis_sqrt,radius_sqrt;
wire[8:0] dis;
wire[8:0] x_dis_big,y_dis_big,x_dis_small,y_dis_small;
wire[3:0] x_cnt_bias,y_cnt_bias; 

assign table_addr = {cover_counter_y,cover_counter_x};
assign table_data = (dis<=radius_sqrt);
assign cover_done = (table_addr == 6'd63);

assign x_cnt_bias = cover_counter_x +1 ;
assign y_cnt_bias = cover_counter_y +1 ;

assign x_dis_big = x_cnt_bias - center_x;
assign y_dis_big = y_cnt_bias - center_y;

assign x_dis_small = center_x - x_cnt_bias;
assign y_dis_small = center_y - y_cnt_bias;

assign x_dis = (x_cnt_bias > center_x)?x_dis_big:x_dis_small;
assign y_dis = (y_cnt_bias > center_y)?y_dis_big:y_dis_small;

sqrt_dis sqrt_x(x_dis,x_dis_sqrt);
sqrt_dis sqrt_y(y_dis,y_dis_sqrt);
sqrt_dis sqrt_r(radius,radius_sqrt);
assign dis = x_dis_sqrt + y_dis_sqrt;

always@(posedge clk,posedge rst)
    if(rst)
        cover_counter_x<=0;
    else
        if(ps != IDLE&&ps != DONE)
        begin
            if(cover_counter_x==7)
                cover_counter_x<=0;
            else
                cover_counter_x <= cover_counter_x +1;
        end
        else cover_counter_x<=0;

always@(posedge clk,posedge rst)
    if(rst)
        cover_counter_y<=0;
    else
        if(ps != IDLE && ps != DONE)
        begin
            if(cover_counter_x==7)
            begin
                if(cover_counter_y == 7)
                    cover_counter_y <=0;
                else
                    cover_counter_y <= cover_counter_y +1;
            end
        end
        else cover_counter_y<=0;
endmodule