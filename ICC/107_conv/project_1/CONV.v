`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/18 13:42:12
// Design Name: 
// Module Name: CONV
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CONV(
    input clk,
    input reset,
    output busy,
    input ready,
    output reg[11:0] iaddr,
    input signed[19:0] idata,
    output cwr,
    output [11:0] caddr_wr,
    output [19:0] cdata_wr,
    output crd,
    output reg [11:0] caddr_rd,
    input [19:0] cdata_rd,
    output [2:0] csel
    );

 parameter  IDLE          =3'b000;
 parameter  DIN_PAD       =3'b001;
 parameter  CONV_RELU     =3'b010;
 parameter  CONV_RELU_DOUT=3'b011;
 parameter  MAXP          =3'b100;
 parameter  MAXP_DOUT     =3'b101;
 parameter  FLAT          =3'b110;
 parameter  FLAT_DOUT          =3'b111;
 
 reg [11:0]addr_cnt;
 reg clk_1;
 reg signed[19:0] ifmaps;
 reg signed [39:0] psum;
 wire signed[19:0]conv_result,maxp_result,flat_result;
 wire signed [19:0]mp_a,mp_b;
 wire signed [39:0]mp;
 reg [2:0]ps,ns;
 wire [5:0]ifmaps_addr_x,ifmaps_addr_y;
 reg [3:0]ifmaps_cnt; //0~8
 wire din_done;
 
 wire mp_done,conv_done,conv_dout_done;
 wire max_done,maxp_done,maxp_dout_done;
 wire fla_done,flat_done,flat_dout_done;
 reg kernel_sel;
reg zero_pad;

wire signed [19:0]bias;
wire[11:0]left_up,up,right_up;
wire[11:0]left,center,right;
wire[11:0]left_down,down,right_down;


//FSM
always@(posedge clk) //state transfer
    ps <= ns;
always@(*)
    if(reset)ns <= IDLE;
    else case (ps)
        IDLE                         : if(ready)    ns <= DIN_PAD                     ; else ns <= IDLE;
        DIN_PAD                 : if(din_done) ns <= CONV_RELU             ; else ns <= DIN_PAD;
        CONV_RELU            : if(mp_done)  ns <= CONV_RELU_DOUT; else ns <= DIN_PAD;
        CONV_RELU_DOUT: if(conv_dout_done) if(conv_done&&kernel_sel==1)ns <= MAXP;else ns <= DIN_PAD;
                        else ns <= CONV_RELU_DOUT;
                    
        MAXP                     : if(max_done)ns <=  MAXP_DOUT              ; else ns <= MAXP;
        MAXP_DOUT          : if(maxp_dout_done) if(maxp_done&&kernel_sel==1)ns <= FLAT;else ns <= MAXP;
                        else ns <= MAXP_DOUT;
                        
        FLAT                       : if(fla_done) ns <= FLAT_DOUT; else ns <= FLAT;
        FLAT_DOUT            : if(flat_dout_done) if(flat_done&&kernel_sel==1)ns <= IDLE;else ns <= FLAT;
                        else ns <= FLAT_DOUT;
    endcase

//kernel 
//assign kernel0[0]=20'h0A89E;assign kernel0[1]=20'h092D5;assign kernel0[2]=20'h06D43;
//assign kernel0[3]=20'h01004;assign kernel0[4]=20'hF8F71;assign kernel0[5]=20'hF6E54;
//assign kernel0[6]=20'hFA6D7;assign kernel0[7]=20'hFC834;assign kernel0[8]=20'hFAC19;
//assign kernel1[0]=20'hFDB55;assign kernel1[1]=20'h02992;assign kernel1[2]=20'hFC994;
//assign kernel1[3]=20'h050FD;assign kernel1[4]=20'h02F20;assign kernel1[5]=20'h0202D;
//assign kernel1[6]=20'h03BD7;assign kernel1[7]=20'hFD369;assign kernel1[8]=20'h05E68;

reg signed[19:0]kernel_temp;
always@(*)
    if(!kernel_sel)
    case(ifmaps_cnt)
        0:kernel_temp=20'h0A89E; 1:kernel_temp=20'h092D5; 2:kernel_temp=20'h06D43;
        3:kernel_temp=20'h01004; 4:kernel_temp=20'hF8F71; 5:kernel_temp=20'hF6E54;
        6:kernel_temp=20'hFA6D7; 7:kernel_temp=20'hFC834; 8:kernel_temp=20'hFAC19;
        default: kernel_temp=0;endcase
    else
    case(ifmaps_cnt)
        0:kernel_temp=20'hFDB55; 1:kernel_temp=20'h02992; 2:kernel_temp=20'hFC994;
        3:kernel_temp=20'h050FD; 4:kernel_temp=20'h02F20; 5:kernel_temp=20'h0202D;
        6:kernel_temp=20'h03BD7; 7:kernel_temp=20'hFD369; 8:kernel_temp=20'h05E68;
        default: kernel_temp=0;endcase
        
 //general counter => DIN_PAD and CONV_RELU 0~8,MAXP 0~3, FLAT 0~1
always@(posedge clk,posedge reset)//ifmaps_addr_
    if(reset) ifmaps_cnt <= 3'd0;
    else if((ps==CONV_RELU) && ifmaps_cnt<8)//�s1pixel
          ifmaps_cnt <= ifmaps_cnt +1;
    else if(ps==MAXP && ifmaps_cnt<3)
           ifmaps_cnt <= ifmaps_cnt +1;
    else if(ps==CONV_RELU_DOUT||ps==MAXP_DOUT)ifmaps_cnt <= 0;   
    
//dout
assign cdata_wr = (ps==CONV_RELU_DOUT)?conv_result:
                 (ps==MAXP_DOUT)?maxp_result:
                 (ps==FLAT_DOUT)?flat_result:0;
assign cwr = (ps==CONV_RELU_DOUT || ps==MAXP_DOUT || ps==FLAT_DOUT);
assign caddr_wr = (ps==CONV_RELU_DOUT)?addr_cnt:
                               (ps==MAXP_DOUT)?addr_cnt/2:
                               (ps==FLAT_DOUT)?(!kernel_sel)?
                                    addr_cnt*2: addr_cnt*2+1:0;
 always@(posedge clk,posedge reset)
    if(reset) addr_cnt <=0;
    else if(conv_dout_done&&conv_done||(maxp_dout_done&&maxp_done)||(flat_dout_done&&flat_done))
        addr_cnt <=0;
    else if(maxp_dout_done)
        addr_cnt <=addr_cnt+2;
    else if(conv_dout_done||flat_dout_done)
        addr_cnt <=addr_cnt+1;
           
assign csel = (ps==CONV_RELU_DOUT)?((!kernel_sel)?3'b001:3'b010):
                     (ps==MAXP)?((!kernel_sel)?3'b001:3'b010):
                     (ps==MAXP_DOUT)?((!kernel_sel)?3'b011:3'b100):
                     (ps==FLAT)?((!kernel_sel)?3'b011:3'b100):
                     (ps==FLAT_DOUT)?3'b101:3'b000;
                     
always@(posedge clk,posedge reset)
    if(reset)kernel_sel <=0;
    else if((conv_dout_done&&conv_done)||
               (maxp_dout_done&&maxp_done)||
               (flat_dout_done&&flat_done))
                kernel_sel <=~kernel_sel;
    
//din
assign left_up = center-64-1;
assign up = center-64;
assign right_up = center-64+1;
assign left = center-1;
assign center = (ps==FLAT)?(ifmaps_addr_y)*32+ifmaps_addr_x:(ifmaps_addr_y)*64+ifmaps_addr_x;
assign right = center+1;
assign left_down = center+64-1;
assign down = center+64;
assign right_down = center+64+1;
assign din_done =(ps==DIN_PAD);                                                         
always@(*)
        case(ifmaps_cnt)
         0: iaddr = left_up;
         1: iaddr = up;
         2: iaddr = right_up;
         3: iaddr = left;
         4: iaddr = center;
         5: iaddr = right;
         6: iaddr = left_down;
         7: iaddr = down;
         8: iaddr = right_down;
         default: iaddr = 0;endcase
         
assign crd = (ps==DIN_PAD||ps==MAXP||ps==FLAT);     
always@(*)
    if(ps==MAXP)
       case(ifmaps_cnt)
            0: caddr_rd = center;
            1: caddr_rd = right;
            2: caddr_rd = down;
            3: caddr_rd = right_down;
            default: caddr_rd =0;endcase
    else if(ps==FLAT) caddr_rd = center;
    else caddr_rd=0;
 assign ifmaps_addr_x = (ps==FLAT)?addr_cnt[4:0]:addr_cnt[5:0];
 assign ifmaps_addr_y = (ps==FLAT)?addr_cnt[10:5]:(ps==MAXP)?addr_cnt[11:6]<<1:addr_cnt[11:6];               
//ifmaps register
always@(posedge clk,posedge reset)
    if(reset)
        ifmaps <=0;
    else if(ps==DIN_PAD)begin
        if(ifmaps_addr_x==0 && ifmaps_addr_y==0) //left-up corner
            case (ifmaps_cnt)
                0,1,2,3,6: begin ifmaps <= 0;end
                default:  begin ifmaps <= idata;end
            endcase
       else if(ifmaps_addr_x==63 && ifmaps_addr_y==63) //right-down corner
            case (ifmaps_cnt)
                2,5,6,7,8: begin ifmaps <= 0;end
                default:  begin ifmaps <= idata;end
            endcase
        else if(ifmaps_addr_x==63 && ifmaps_addr_y==0) //right-up corner
                        case (ifmaps_cnt)
                            0,1,2,5,8: begin ifmaps <= 0;end
                            default:  begin ifmaps <= idata;end
                        endcase
                   else if(ifmaps_addr_x==0 && ifmaps_addr_y==63) //left-down corner
                        case (ifmaps_cnt)
                            0,3,6,7,8: begin ifmaps <= 0;end
                            default:  begin ifmaps <= idata;end
                        endcase
        else if(ifmaps_addr_x==0) //left border
            case (ifmaps_cnt)
                0,3,6: begin ifmaps <= 0;end
                default:  begin ifmaps <= idata;end
            endcase
       else if(ifmaps_addr_x==63) //right border
            case (ifmaps_cnt)
                2,5,8: begin ifmaps <= 0;end
                default:  begin ifmaps <= idata;end
            endcase
       else if(ifmaps_addr_y==0) //up border
            case (ifmaps_cnt)
                0,1,2: begin ifmaps <= 0;end
                default:  begin ifmaps <= idata;end
            endcase
       else if(ifmaps_addr_y==63) //down border
            case (ifmaps_cnt)
                6,7,8: begin ifmaps <= 0;end
                default:  begin ifmaps <= idata;end
            endcase
        else ifmaps <= idata;end
     else if (ps==MAXP)
        if(ifmaps_cnt==0)ifmaps <= cdata_rd;
        else if (cdata_rd>ifmaps) ifmaps <= cdata_rd;
     else if (ps==FLAT) ifmaps <= cdata_rd;
     
//CONV_RELU_state 
wire signed [19:0]psum_rounded;
assign mp_done   = (ps == CONV_RELU && ifmaps_cnt==8);
assign conv_done = (ps == CONV_RELU_DOUT&&ifmaps_addr_y==63 && ifmaps_addr_x==63);
assign conv_dout_done = (ps == CONV_RELU_DOUT);
assign mp_a = ifmaps;
assign mp_b = kernel_temp;
assign mp = mp_a*mp_b;
assign conv_result = ( psum_rounded+bias>0) ?  psum_rounded+bias:20'd0;//relu
assign psum_rounded = (psum[15]) ? psum[35:16] + 20'd1: psum[35:16];

assign bias = (kernel_sel)?20'hF7295:20'h01310;

always@(posedge clk,posedge reset)
    if(reset)psum<=0;
    else if(ps==CONV_RELU_DOUT) psum<=0;
    else if(ps==CONV_RELU) psum <= psum+ mp;


//MAXP_state 
assign max_done = (ps == MAXP && ifmaps_cnt==3);
assign maxp_done = (ps == MAXP_DOUT&&ifmaps_addr_y==62 && ifmaps_addr_x==62);
assign maxp_dout_done = (ps == MAXP_DOUT);
assign maxp_result = ifmaps;

//FLAT_state
assign fla_done  = (ps == FLAT);
assign flat_done = (ps == FLAT_DOUT&&ifmaps_addr_y==31 && ifmaps_addr_x==31);
assign flat_dout_done = (ps == FLAT_DOUT);
assign flat_result = cdata_rd;
assign busy = !(ps==IDLE);

endmodule
