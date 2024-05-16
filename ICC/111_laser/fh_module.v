//table_pin : 圈到的十個點的table
module sub_com_module (
input [3:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,
input [3:0] y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,
input [3:0] cx,
input [3:0] cy,
output wire [9:0] table_pin
);
wire [3:0] xdis0,xdis1,xdis2,xdis3,xdis4,xdis5,xdis6,xdis7,xdis8,xdis9;
wire [3:0] ydis0,ydis1,ydis2,ydis3,ydis4,ydis5,ydis6,ydis7,ydis8,ydis9;
parameter RADIUS = 3'h4;

//abs
//reg [39:0] dis_table,max_table;
    abs_sub x00(x0,cx,xdis0);
    abs_sub x01(x1,cx,xdis1);
    abs_sub x02(x2,cx,xdis2);
    abs_sub x03(x3,cx,xdis3);
    abs_sub x04(x4,cx,xdis4);
    abs_sub x05(x5,cx,xdis5);
    abs_sub x06(x6,cx,xdis6);
    abs_sub x07(x7,cx,xdis7);
    abs_sub x08(x8,cx,xdis8);
    abs_sub x09(x9,cx,xdis9);

    abs_sub y00(y0,cy,ydis0);
    abs_sub y01(y1,cy,ydis1);
    abs_sub y02(y2,cy,ydis2);
    abs_sub y03(y3,cy,ydis3);
    abs_sub y04(y4,cy,ydis4);
    abs_sub y05(y5,cy,ydis5);
    abs_sub y06(y6,cy,ydis6);
    abs_sub y07(y7,cy,ydis7);
    abs_sub y08(y8,cy,ydis8);
    abs_sub y09(y9,cy,ydis9);

   com_module C0(xdis0,ydis0,table_pin[0]);
   com_module C1(xdis1,ydis1,table_pin[1]);
   com_module C2(xdis2,ydis2,table_pin[2]);
   com_module C3(xdis3,ydis3,table_pin[3]);
   com_module C4(xdis4,ydis4,table_pin[4]);
   com_module C5(xdis5,ydis5,table_pin[5]);
   com_module C6(xdis6,ydis6,table_pin[6]);
   com_module C7(xdis7,ydis7,table_pin[7]);
   com_module C8(xdis8,ydis8,table_pin[8]);
   com_module C9(xdis9,ydis9,table_pin[9]);
endmodule

module abs_sub(
    input[3:0]x,cx,
    output reg[3:0] x_out
);
    reg [4:0] x_reg;
    always@(*)
    begin
        x_reg = x-cx;
        x_out = (x_reg[3:0] ^ {4{x_reg[4]}}) + x_reg[4];
    end
endmodule

module com_module(
input [3:0] xdis,
input [3:0] ydis,
output reg table_pin
);
    always@(*)
        begin
            if((xdis<=0 && ydis<= 4)||(xdis<=2 && ydis<=3)||(xdis<=3 && ydis<=2) || (xdis<=4 && ydis<=0))
                table_pin = 1;
            else
                table_pin = 0;
        end
endmodule

module dis_table_module(
    input [9:0] max_table,
    input [9:0] table_pin,
    input CLK,RST,
    input [2:0]ps,
    input point_done,
    input maxFlag,
    output reg [9:0] output_max_table,
    output reg [7:0] point_num
);
    integer i;
    reg [7:0]point_num_reg;

    
    always@(*)
    begin
    point_num_reg=0;
    for(i=0;i<10;i=i+1)
        if(max_table[i]==0 && table_pin[i]==1)
            point_num_reg = point_num_reg + 1;
        else
            point_num_reg = point_num_reg;
    end

    always@(posedge CLK,posedge RST)
    if (RST)
        point_num<=0;
    else if(ps==5||ps==1)
        point_num<=0;
    else if(ps==6||ps==2)
        point_num<=point_num+point_num_reg;


    always@(*)
    for(i=0;i<10;i=i+1)
        if(table_pin[i]==1)
            output_max_table[i] = 1;
        else
            output_max_table[i] = 0;

endmodule


/*
output_max_table : 最後一次計算的所有點Table
point_num : 每次計算覆蓋到的點數量
*/
module fh_module (
input [3:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,
input [3:0] y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,
input [3:0] cx,
input [3:0] cy,
input CLK,RST,
input [2:0]ps,
input point_done,
input maxFlag,
input [2:0]point_cnt,
output [7:0] point_num
);
reg [39:0]max_table;
wire [9:0] table_pin;
reg [39:0]table_pin_reg;

wire [9:0]max_pin_out;
reg [9:0]max_pin_in;

sub_com_module scm0(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,cx,cy,table_pin);
dis_table_module dtm0(max_pin_in,table_pin,CLK,RST,ps,point_done,maxFlag,max_pin_out,point_num);

always@(*)
    case (point_cnt)
        0:max_pin_in=max_table[9:0];
        1:max_pin_in=max_table[19:10];
        2:max_pin_in=max_table[29:20];
        3:max_pin_in=max_table[39:30];
        default:max_pin_in=0;
    endcase

always@(posedge CLK,posedge RST)
    if(RST)
        table_pin_reg <=0;
    else if(ps==6||ps==2)
        case (point_cnt)
            0:table_pin_reg[9:0] <= table_pin;
            1:table_pin_reg[19:10] <= table_pin;
            2:table_pin_reg[29:20] <= table_pin;
            3:table_pin_reg[39:30] <= table_pin;
        endcase

always@(posedge CLK,posedge RST)
    if(RST)
        max_table <=0;
    else if(maxFlag)
        case (point_cnt)
            0:max_table[9:0] <= max_pin_out;
            1:max_table[19:10] <= max_pin_out;
            2:max_table[29:20] <= max_pin_out;
            3:max_table[39:30] <= max_pin_out;
        endcase
endmodule     