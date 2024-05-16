module JAM (
input CLK,
input RST,
output reg [2:0] W,
output reg [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output reg Valid );

reg [2:0]ps,ns;
reg [2:0]global_cnt;//0~7
reg [2:0]work_id;
reg [3:0]work_cnt;
reg [9:0]cost_reg;
wire [2:0]order[0:7];//0~7 *8
wire din_done,cal_done;
wire swap_flag;
wire [2:0]o_0,o_1,o_2,o_3,o_4,o_5,o_6,o_7;
wire [2:0]sa_0;
parameter IDLE = 3'd0;
parameter DIN = 3'd1;
parameter MIN_COST_CAL = 3'd2;
parameter COMPARE = 3'd3;
parameter SWAP = 3'd4;
parameter RE_ORDER = 3'd5;
parameter DONE = 3'd6;

integer i;
//output

always@(posedge CLK,posedge RST)
    if(RST)
        Valid <=0;
    else if(ps==DONE)
        Valid <= 1;

always@(*)begin
    W = work_id;
    J = order[work_id];
end

always@(posedge CLK,posedge RST)
    if(RST)
        work_id <=0;
    else if (ps==COMPARE)
        work_id <=sa_0;
    else if(ps==MIN_COST_CAL||ps==RE_ORDER)
        work_id <= work_id-1;

always@(posedge CLK,posedge RST)
    if(RST)
        work_cnt <=0;
    else if (cal_done)
        work_cnt <=0;
    else if(ps==MIN_COST_CAL||ps==RE_ORDER)
        work_cnt <= work_cnt+1;

assign order[0] =o_0;
assign order[1] =o_1;
assign order[2] =o_2;
assign order[3] =o_3;
assign order[4] =o_4;
assign order[5] =o_5;
assign order[6] =o_6;
assign order[7] =o_7;


wire [9:0]MinCost_temp;
assign MinCost_temp = MinCost+Cost;
always@(posedge CLK,posedge RST)
    if(RST)
        MinCost <= 10'd1023;
    else if(cal_done&&MinCost>cost_reg+Cost)//慢一點再開始加，cnt==1時加的是cnt==0的值
        MinCost <= cost_reg+Cost;
always@(posedge CLK,posedge RST)
    if(RST)
        MatchCount <= 0;
    else if(cal_done&&MinCost>cost_reg+Cost)//慢一點再開始加，cnt==1時加的是cnt==0的值
        MatchCount <= 1;
    else if(cal_done&&MinCost==cost_reg+Cost)
        MatchCount <= MatchCount+1;


//Calculation
always@(posedge CLK,posedge RST)
    if(RST)
        cost_reg <= 0;
    else if (cal_done)
        cost_reg <= 0;
    else if(ps==MIN_COST_CAL)//慢一點再開始加，cnt==1時加的是cnt==0的值
        cost_reg <= cost_reg+Cost;


//fsm
always@(posedge CLK,posedge RST)
    if(RST)
        ps <=0;
    else
        ps <= ns;


assign cal_done = (ps==MIN_COST_CAL&&work_cnt==8);//因為TB反應慢一個CYCLE，所以多數兩次

always@(*)
    case(ps)
        IDLE : 
            ns =  COMPARE;

        COMPARE:
            if(swap_flag) ns = RE_ORDER;
            else ns = DONE;

        RE_ORDER:
            ns = MIN_COST_CAL;  

        MIN_COST_CAL:
            if(cal_done) ns = COMPARE;
            else ns = MIN_COST_CAL;
        default : ns = IDLE;
    endcase
        
always@(posedge CLK,posedge RST)
    if(RST)
        global_cnt <=0;
    else if (ps==RE_ORDER)
        global_cnt <= 0;
    else if(ps==COMPARE&&!swap_flag)
        global_cnt <= global_cnt+1;



di_order do0(CLK,RST,ps,
o_0,o_1,o_2,o_3,o_4,o_5,o_6,o_7,
sa_0,
swap_flag
);


endmodule

module di_order (
input CLK,
input RST,
input [2:0] state,
output  [2:0] o_0,o_1,o_2,o_3,o_4,o_5,o_6,o_7,
output reg[2:0] sa_0,
output reg swap_flag
);
reg [2:0]order[0:7];
reg [2:0]sa_1;
reg [2:0]sa_00;
integer i,j;


parameter IDLE = 3'd0;
parameter DIN = 3'd1;
parameter MIN_COST_CAL = 3'd2;
parameter COMPARE = 3'd3;
parameter SWAP = 3'd4;
parameter RE_ORDER = 3'd5;
parameter DONE = 3'd6;


reg [2:0]cnt;
always@(posedge CLK)
	sa_00 <=sa_0;
// COMPARE STATE
always@(*)
begin
	if(state == COMPARE)
	begin
		swap_flag = 0;
		cnt=7;
		for(i=7 ;i>0 ;i=i-1)
		begin
		    if((order[i] > order[i-1])&&!swap_flag) 
		    begin
			sa_0 = cnt-1;
			swap_flag = 1;
		    end
		    else
			sa_0 = sa_0;
			cnt=cnt-1;
		end
		sa_1 = sa_0 + 1;
		for(j = 0 ;j < 8 ; j = j+1)
		begin
			if(order[sa_0] < order[j] && order[j]< order[sa_1]&& j>=sa_1)
				sa_1 = j;
			else
				sa_1 = sa_1;
		end
	end
	else
	begin
	sa_0 = 0;
	sa_1 = 0;
	swap_flag=0;
	end
end

always@(posedge CLK or posedge RST)
begin
    if(RST)
    begin
        order[0] <= 0;
        order[1] <= 1;
        order[2] <= 2;
        order[3] <= 3;
        order[4] <= 4;
        order[5] <= 5;
        order[6] <= 6;
        order[7] <= 7;
    end
    else if(state == COMPARE)
    begin
        order[sa_1] <= order[sa_0];
        order[sa_0] <= order[sa_1];
    end
    else if(state == RE_ORDER)
        case(sa_00)
            5:begin 
                order[7] <= order[6];
                order[6] <= order[7];
            end
            4:begin 
                order[7] <= order[5];
                order[5] <= order[7];
            end
            3:begin 
                order[7] <= order[4];
                order[6] <= order[5];
                order[5] <= order[6];
                order[4] <= order[7];
            end
            2:begin 
                order[7] <= order[3];
                order[6] <= order[4];
                order[4] <= order[6];
                order[3] <= order[7];
            end
            1:begin 
                order[7] <= order[2];
                order[6] <= order[3];
                order[5] <= order[4];
                order[4] <= order[5];
                order[3] <= order[6];
                order[2] <= order[7];
            end
            0:begin 
                order[7] <= order[1];
                order[6] <= order[2];
                order[5] <= order[3];
                order[3] <= order[5];
                order[2] <= order[6];
                order[1] <= order[7];
            end
        endcase
end


assign o_0 = order[0];
assign o_1 = order[1];
assign o_2 = order[2];
assign o_3 = order[3];
assign o_4 = order[4];
assign o_5 = order[5];
assign o_6 = order[6];
assign o_7 = order[7];

endmodule




