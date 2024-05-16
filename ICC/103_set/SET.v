module SET ( clk , rst, en, central, radius, mode, busy, valid, candidate );

input clk, rst;
input en;
input [23:0] central;
input [11:0] radius;
input [1:0] mode;
output busy;
output valid;
output [7:0] candidate;

reg [3:0]ps,ns;
parameter IDLE=4'd0;
parameter m0_cA=4'd1;//A
parameter m1_cA=4'd2;//A
parameter m1_andcB=4'd3;//A and B

parameter m2_cA=4'd4;//A
parameter m2_orcB=4'd5;//AorB
parameter m2_minusandcAcB=4'd6;//AorB-AandB

parameter m3_cAandcB=4'd8;//AandB
parameter m3_pluscAandcC=4'd9;//AandB + AandC
parameter m3_pluscBandcC=4'd10;//AandB + AandC + BandC
parameter m3_minuscAandcBandcC=4'd11;//BandC+AandC+BandC-AandBandC

parameter CAL=4'd13;
parameter DONE=4'd14;

wire c0_table_data;
wire c1_table_data;
wire c2_table_data;
wire c0_cover_done;
wire c1_cover_done;
wire c2_cover_done;
wire cal_done;
reg [3:0]c0_cover_radius;
reg [3:0]c1_cover_radius;
reg [3:0]c2_cover_radius;
reg [3:0]c0_center_x,c0_center_y;
reg [3:0]c1_center_x,c1_center_y;
reg [3:0]c2_center_x,c2_center_y;
reg [63:0] table_pin_reg;
wire [5:0]c0_table_addr,c1_table_addr,c2_table_addr;

reg[23:0] central_reg;
reg[11:0] radius_reg;

assign busy = (ps!=IDLE);
assign valid = (ps==DONE);


always@(posedge clk)
    if(ps==IDLE)begin
        central_reg<=central;
        radius_reg<=radius;
    end


always@(posedge clk,posedge rst)
    if(rst)ps<=IDLE;
    else ps <=ns;

always@(*)
    case(ps)
        IDLE:if(en)
            case (mode)
                0:ns=m0_cA;
                1:ns=m1_cA;
                2:ns=m2_cA;
                3:ns=m3_cAandcB;
                default:ns=IDLE;
            endcase
            else ns=IDLE;
        m0_cA:            if(c0_cover_done)ns=CAL;else ns=m0_cA;

        m1_cA:            if(c0_cover_done)ns=m1_andcB;else ns=m1_cA;
        m1_andcB:         if(c0_cover_done)ns=CAL;else ns=m1_andcB;

        m2_cA:            if(c0_cover_done)ns=m2_orcB;else ns=m2_cA;
        m2_orcB:          if(c0_cover_done)ns=m2_minusandcAcB;else ns=m2_orcB;
        m2_minusandcAcB:  if(c0_cover_done)ns=CAL;else ns=m2_minusandcAcB;

        m3_cAandcB:            if(c0_cover_done)ns=m3_pluscAandcC;else ns=m3_cAandcB;
        m3_pluscAandcC:         if(c0_cover_done)ns=m3_pluscBandcC;else ns=m3_pluscAandcC;
        m3_pluscBandcC:         if(c0_cover_done)ns=m3_minuscAandcBandcC;else ns=m3_pluscBandcC;
        m3_minuscAandcBandcC: if(c0_cover_done)ns=CAL;else ns=m3_minuscAandcBandcC;

        CAL            :  if(c0_cover_done)ns=DONE;else ns=CAL;
        DONE:             ns=IDLE;
        default: ns=IDLE;
    endcase

//c0
always@(*)
    case(ps)
        m0_cA,m1_cA,m2_cA,m2_minusandcAcB,m3_cAandcB,m3_pluscAandcC,m3_minuscAandcBandcC:begin
            c0_center_x = central_reg[23:20];
            c0_center_y = central_reg[19:16];
            c0_cover_radius = radius_reg[11:8];
        end
        m1_andcB,m2_orcB,m3_pluscBandcC:begin
            c0_center_x = central_reg[15:12];
            c0_center_y = central_reg[11:8];
            c0_cover_radius = radius_reg[7:4];
        end
        default:begin
            c0_center_x = 0;
            c0_center_y = 0;
            c0_cover_radius = 0;
        end
    endcase
//c1
always@(*)
    case(ps)
        m2_minusandcAcB,m3_cAandcB,m3_minuscAandcBandcC:begin
            c1_center_x = central_reg[15:12];
            c1_center_y = central_reg[11:8];
            c1_cover_radius = radius_reg[7:4];
        end
        m3_pluscAandcC,m3_pluscBandcC:begin
            c1_center_x = central_reg[7:4];
            c1_center_y = central_reg[3:0];
            c1_cover_radius = radius_reg[3:0];
        end
        default:begin
            c1_center_x = 0;
            c1_center_y = 0;
            c1_cover_radius = 0;
        end
    endcase
//c2
always@(*)
case(ps)
    m3_minuscAandcBandcC:begin
        c2_center_x = central_reg[7:4];
        c2_center_y = central_reg[3:0];
        c2_cover_radius = radius_reg[3:0];
    end
    default:begin
        c2_center_x = 0;
        c2_center_y = 0;
        c2_cover_radius = 0;
    end
endcase

always@(posedge clk)
    case(ps)
        m0_cA:               table_pin_reg[c0_table_addr] <=c0_table_data;

        m1_cA:               table_pin_reg[c0_table_addr] <=c0_table_data;
        m1_andcB:            table_pin_reg[c0_table_addr] <=table_pin_reg[c0_table_addr]&c0_table_data;

        m2_cA:               table_pin_reg[c0_table_addr] <=c0_table_data;
        m2_orcB:             table_pin_reg[c0_table_addr] <=table_pin_reg[c0_table_addr]|c0_table_data;
        m2_minusandcAcB:     table_pin_reg[c0_table_addr] <=table_pin_reg[c0_table_addr]^(c0_table_data&c1_table_data);

        m3_cAandcB:                table_pin_reg[c0_table_addr] <=c0_table_data & c1_table_data;
        m3_pluscAandcC:            table_pin_reg[c0_table_addr] <=table_pin_reg[c0_table_addr]|(c0_table_data&c1_table_data);
        m3_pluscBandcC:            table_pin_reg[c0_table_addr] <=table_pin_reg[c0_table_addr]|(c0_table_data&c1_table_data);
        m3_minuscAandcBandcC:      table_pin_reg[c0_table_addr] <=table_pin_reg[c0_table_addr] ^ ((c0_table_data&c1_table_data)&c2_table_data);
    endcase

cover c0(
    .ps(ps),
    .center_x(c0_center_x),
    .center_y(c0_center_y),
    .clk(clk),
    .rst(rst),
    .radius(c0_cover_radius),
    .table_addr(c0_table_addr),
    .table_data(c0_table_data),
    .cover_done(c0_cover_done));

cover c1(
    .ps(ps),
    .center_x(c1_center_x),
    .center_y(c1_center_y),
    .clk(clk),
    .rst(rst),
    .radius(c1_cover_radius),
    .table_addr(c1_table_addr),
    .table_data(c1_table_data),
    .cover_done(c1_cover_done));
cover c2(
    .ps(ps),
    .center_x(c2_center_x),
    .center_y(c2_center_y),
    .clk(clk),
    .rst(rst),
    .radius(c2_cover_radius),
    .table_addr(c2_table_addr),
    .table_data(c2_table_data),
    .cover_done(c2_cover_done));

reg[5:0] candidate_reg;
assign candidate = candidate_reg;
always@(posedge clk,posedge rst)
    if(rst)
        candidate_reg <= 0;
    else
        if(ps==CAL)
            candidate_reg <= candidate + table_pin_reg[c0_table_addr];
        else if(ps == DONE)
            candidate_reg <= 0;

endmodule

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