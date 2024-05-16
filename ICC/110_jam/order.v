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
integer i,j;


parameter IDLE = 3'd0;
parameter DIN = 3'd1;
parameter MIN_COST_CAL = 3'd2;
parameter COMPARE = 3'd3;
parameter SWAP = 3'd4;
parameter RE_ORDER = 3'd5;
parameter DONE = 3'd6;


// COMPARE STATE
always@(*)
begin
    if(state == COMPARE)
    begin
        swap_flag = 0;
        for(i=7 ;i>0 ;i=i-1)
            if((order[i] > order[i-1])&&!swap_flag) 
            begin
                sa_0 = i-1;
                swap_flag = 1;
            end
        sa_1 = sa_0 + 1;
        for(j = sa_1 ;j < 8 ; j = j+1)
            if(order[sa_0] < order[j] && order[j]< order[sa_1])
                sa_1 = j;
            else
                sa_1 = sa_1;
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
        case(sa_0)
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