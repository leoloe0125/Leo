module huffman(clk, reset, gray_valid,gray_data, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,
    code_valid, HC1, HC2, HC3, HC4, HC5, HC6,M1, M2, M3, M4, M5, M6);

input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output CNT_valid;
output [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output code_valid;
output [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output [7:0] M1, M2, M3, M4, M5, M6;

parameter IDLE =0;parameter CNT_INIT=1;
parameter REORDER_DIN = 2;parameter REORDER=3;
parameter REORDER_DOUT=4;parameter COMBINE=5;
parameter DONE=6;
reg [2:0]ps,ns;

//sub module
wire [2:0]re_order_num;
wire [5:0]re_order_index_dout;
wire [7:0]re_order_dout;
wire re_order_din_done;
wire re_order_done;
wire re_order_dout_done;
wire combine_done;
reg [7:0]global_cnt;
reg [7:0]ai_cnt[1:6];
reg [5:0]index[1:6];
reg [5:0]cnt;

wire din_done;
assign din_done = global_cnt==100;

assign CNT_valid = (ps==REORDER_DIN)&&cnt==0;assign CNT1 =ai_cnt[1];assign CNT2 =ai_cnt[2];assign CNT3 =ai_cnt[3];assign CNT4 =ai_cnt[4];assign CNT5 =ai_cnt[5];assign CNT6=ai_cnt[6];
assign combine_done =(ps==COMBINE&&cnt==5);
assign code_valid =combine_done;

always@(posedge clk,posedge reset)
    if(reset)ps<=CNT_INIT;
    else ps <= ns;
always@(*)
    case (ps)
        CNT_INIT:   if(din_done)ns=REORDER_DIN;else ns=CNT_INIT;
        REORDER_DIN:if(re_order_din_done)ns=REORDER;else ns=REORDER_DIN;
        REORDER:if(re_order_done)ns=REORDER_DOUT;else ns=REORDER;
        REORDER_DOUT:if(re_order_dout_done)ns=COMBINE;else ns=REORDER_DOUT;
        COMBINE:if(combine_done)ns = DONE;else ns = REORDER_DIN;
        DONE:ns =CNT_INIT;
        default: ns=CNT_INIT;
    endcase

always@(posedge clk,posedge reset)
    if(reset)begin
        global_cnt <=1;cnt <= 0;
        ai_cnt[1] <=0;ai_cnt[2] <=0;ai_cnt[3] <=0;ai_cnt[4] <=0;ai_cnt[5] <=0;ai_cnt[6] <=0;
    end
    else if(ps==CNT_INIT)begin
        if(gray_valid)
            if(global_cnt<100)
                global_cnt <= global_cnt+1;
            else
                global_cnt <= 1;
            case(gray_data)
                1:ai_cnt[1] <= ai_cnt[1]+1;
                2:ai_cnt[2] <= ai_cnt[2]+1;
                3:ai_cnt[3] <= ai_cnt[3]+1;
                4:ai_cnt[4] <= ai_cnt[4]+1;
                5:ai_cnt[5] <= ai_cnt[5]+1;
                6:ai_cnt[6] <= ai_cnt[6]+1;
            endcase
    end
    else if(ps==REORDER_DIN)begin
        if(global_cnt<6)
            global_cnt <= global_cnt+1;
        else
            global_cnt <= 1;
    end
    else if(ps==REORDER)begin
        global_cnt <= 1;
    end
    else if(ps==REORDER_DOUT)begin
        if(global_cnt<7)
            global_cnt <= global_cnt+1;
        else
            global_cnt <= 1;
        if(global_cnt>1)begin
        case(global_cnt)
                2:index[1] <= re_order_index_dout;
                3:index[2] <= re_order_index_dout;
                4:index[3] <= re_order_index_dout;
                5:index[4] <= re_order_index_dout;
                6:index[5] <= re_order_index_dout;
                7:index[6] <= re_order_index_dout;
        endcase
        case(global_cnt)
                2:ai_cnt[1] <= re_order_dout;
                3:ai_cnt[2] <= re_order_dout;
                4:ai_cnt[3] <= re_order_dout;
                5:ai_cnt[4] <= re_order_dout;
                6:ai_cnt[5] <= re_order_dout;
                7:ai_cnt[6] <= re_order_dout;
        endcase 
        end
    end
    else if(ps == COMBINE)begin
        cnt<= cnt+1;
        index[1] <= index[1] + index[2];
        index[2] <= index[3];
        index[3] <= index[4];
        index[4] <= index[5];
        index[5] <= index[6];
        index[6] <= index[6];
        ai_cnt[1] <= ai_cnt[1]+ai_cnt[2];
        ai_cnt[2] <= ai_cnt[3];
        ai_cnt[3] <= ai_cnt[4];
        ai_cnt[4] <= ai_cnt[5];
        ai_cnt[5] <= ai_cnt[6];
        ai_cnt[6] <= 101;
    end 


reg [5:0]index_decode;

always@(*)
    case(global_cnt)
        1:index_decode = 6'b000001;
        2:index_decode = 6'b000010;
        3:index_decode = 6'b000100;
        4:index_decode = 6'b001000;
        5:index_decode = 6'b010000;
        6:index_decode = 6'b100000;
        default: index_decode = 6'b000000;
    endcase
re_order reo(
    clk,reset,ps,
    re_order_num,//有幾筆數字要reorder
    (cnt==0)?index_decode:index[global_cnt],//re_order_index_din
    ai_cnt[global_cnt],//input [7:0]re_order_din,   
    re_order_index_dout,
    re_order_dout,
    re_order_din_done,
    re_order_done,
    re_order_dout_done);

split s0(
    ai_cnt[1],ai_cnt[2],//a1,a2
    index[1],index[2],//index0,index1,
    clk,reset,ps,cnt,
    M1,M2,M3,M4,M5,M6,HC1, HC2, HC3, HC4, HC5, HC6);

endmodule

//-------------------------------------------------------------------
module re_order(
    input clk,reset,
    input [2:0]ps,
    input [2:0]re_order_num,//有幾筆數字要reorder
    input [5:0]re_order_index_din,
    input [7:0]re_order_din,   

    output [5:0]re_order_index_dout,
    output [7:0]re_order_dout,

    output re_order_din_done,
    output re_order_done,
    output re_order_dout_done);

reg [5:0]re_order_cnt,compare_cnt;
reg [7:0]re_order_reg[1:6];
reg [5:0]re_order_index_reg[1:6];
reg swap;

parameter REORDER_DIN = 2;
parameter REORDER=3;
parameter REORDER_DOUT=4;

assign re_order_din_done = ps==REORDER_DIN&&re_order_cnt==7;
assign re_order_done =(compare_cnt==6);
assign re_order_dout_done =ps==REORDER_DOUT&&re_order_cnt==7;
assign re_order_dout=re_order_reg[re_order_cnt];
assign re_order_index_dout = re_order_index_reg[re_order_cnt];
integer i,j;
reg [5:0]popcount0;

always@(*)
    if(ps==REORDER)begin
        popcount0=0;
        for(i=1;i<6;i=i+1)
            if(re_order_index_reg[re_order_cnt][i]==1)
                popcount0=popcount0+1;
            else popcount0=popcount0;
    end
    else popcount0=0;
always@(*)
    if(ps==REORDER)begin
        if(re_order_reg[re_order_cnt] >re_order_reg[re_order_cnt+1])
            swap =1;
        else if(re_order_reg[re_order_cnt] ==re_order_reg[re_order_cnt+1])begin
            if(popcount0>1)
                swap=0;
            else if(re_order_index_reg[re_order_cnt] <re_order_index_reg[re_order_cnt+1])
                swap =1;
            else swap =0;
        end
        else 
            swap =0;
    end
    else swap=0;

always@(posedge clk)
    if(ps==REORDER_DIN&&!re_order_din_done)
        re_order_reg[re_order_cnt] <=re_order_din;
    else if(ps==REORDER&&swap)begin
        re_order_reg[re_order_cnt] <=re_order_reg[re_order_cnt+1];
        re_order_reg[re_order_cnt+1] <=re_order_reg[re_order_cnt];
    end
    
always@(posedge clk)
    if(ps==REORDER_DIN&&!re_order_din_done)
        re_order_index_reg[re_order_cnt]<=re_order_index_din;
    else if(ps==REORDER&&swap)begin
        re_order_index_reg[re_order_cnt]<=re_order_index_reg[re_order_cnt+1];
        re_order_index_reg[re_order_cnt+1] <=re_order_index_reg[re_order_cnt];
    end

always@(posedge clk,posedge reset)
    if(reset)re_order_cnt <=1;
    else if(ps==REORDER_DIN)
        if(re_order_din_done)re_order_cnt <=0;
        else re_order_cnt <=re_order_cnt+1;
    else if(ps==REORDER)
        if(re_order_cnt==(6-compare_cnt))re_order_cnt <=0;
        else re_order_cnt <=re_order_cnt+1;
    else if(ps==REORDER_DOUT)
        if(re_order_dout_done)re_order_cnt <=0;
        else re_order_cnt <=re_order_cnt+1;

always@(posedge clk,posedge reset)
    if(reset)compare_cnt <=0;
    else if(ps==REORDER)begin
        if(re_order_cnt==(6-compare_cnt))compare_cnt <=compare_cnt+1;
    end
    else
        compare_cnt <=0;
endmodule
//-------------------------------------------------------------------

module split(a1,a2,index0,index1,clk,reset,ps,cnt,M1,M2,M3,M4,M5,M6,HC1, HC2, HC3, HC4, HC5, HC6);

input clk,reset;
input [2:0]ps;
input [5:0] index0,index1;
input [7:0] a1,a2;
input [5:0]cnt;
output reg [7:0] M1,M2,M3,M4,M5,M6;
output reg [7:0] HC1, HC2, HC3, HC4, HC5, HC6;

parameter IDLE =0;
parameter CNT_INIT=1;
parameter REORDER_DIN = 2;
parameter REORDER=3;
parameter REORDER_DOUT=4;
parameter COMBINE=5;

always @(posedge clk,posedge reset) 
begin
    if(reset)
    begin
        M1 <= 0;M2 <= 0;M3 <= 0;M4 <= 0;M5 <= 0; M6 <= 0; 
    end 
    else
    if(ps == COMBINE)begin
    // Mask  
        if(index0[0] || index1[0])
            M1 <= {M1[6:0],1'b1};
        if(index0[1] || index1[1])
            M2 <= {M2[6:0],1'b1};
        if(index0[2] || index1[2])
            M3 <= {M3[6:0],1'b1};
        if(index0[3] || index1[3])
            M4 <= {M4[6:0],1'b1};
        if(index0[4] || index1[4])
            M5 <= {M5[6:0],1'b1};
        if(index0[5] || index1[5])
            M6 <= {M6[6:0],1'b1};
    end
end


always @(posedge clk,posedge reset) 
begin
    if(reset)
    begin
        HC1 <= 0;HC2 <= 0;HC3 <= 0;HC4 <= 0;HC5 <= 0;HC6 <= 0; 
    end
    else
    if(ps == COMBINE)begin
    // 霍夫曼編碼，小的為1
        if(index0[0])
            HC1 <= M1 + 1 + HC1;
        if(index0[1])
            HC2 <= M2 + 1 + HC2;
        if(index0[2])
            HC3 <= M3 + 1 + HC3;
        if(index0[3])
            HC4 <= M4 + 1 + HC4;
        if(index0[4])
            HC5 <= M5 + 1 + HC5;
        if(index0[5])
            HC6 <= M6 + 1 + HC6;
    end
end

endmodule