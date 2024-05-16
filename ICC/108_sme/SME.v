module SME(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output match;
output [4:0] match_index;
output valid; 
reg match;
// reg [4:0] match_index;
// reg valid;
parameter TRIANGLE = 8'd94;
parameter MONEY =  8'd36;
parameter DOT = 8'd46;
parameter STAR =  8'd42;
parameter SPACE = 8'd32;

parameter DIN = 3'd0;
parameter PRE_DATA = 3'd1;
parameter MATCH_COUNT = 3'd2;
parameter MATCH = 3'd3;
parameter PATTERN_EXT = 3'd4;
parameter MATCH_INFINITE = 3'd5;
parameter MATCH_COUNT_INFINITE = 3'd6;
parameter DONE =3'd7;
reg [7:0]string_reg[0:31];
reg [7:0]pattern_reg[0:7];
reg [7:0] chardata_r0,chardata_r1;
reg[2:0]ps,ns;
reg [4:0]global_cnt;
reg [5:0]string_lenth,pattern_lenth;
reg isstring_r0,ispattern_r0,ispattern_r1,isstring_r1;
wire din_done,din_string_done;
wire string_start,string_finish;
wire pattern_start,pattern_finish;
assign din_done = (ispattern_r1&&!ispattern_r0);
assign din_string_done = (isstring_r0&&!isstring);
integer i,j;
reg[5:0] match_count;
reg[4:0] match_index;
reg [4:0]string_index;
reg [2:0]pattern_index;

wire [10:0]string_target_index;
wire [10:0]pattern_target_index;
wire [10:0]index;
reg [10:0]infinite_cnt;
always@(posedge clk)begin
    chardata_r0 <= chardata;
    chardata_r1 <= chardata_r0;
    isstring_r0 <= isstring;
    isstring_r1 <= isstring_r0;
    ispattern_r0 <= ispattern;
    ispattern_r1 <= ispattern_r0;
end

always@(posedge clk,posedge reset)
    if(reset)ps <= DIN;
    else ps <= ns;

always@(*)
    case (ps)
        DIN : if(pattern_finish) ns=PRE_DATA;else ns =DIN;
        PRE_DATA :ns=MATCH_COUNT;
        MATCH_COUNT :if(pattern_index==pattern_target_index)ns=MATCH;
                    else if(infinite_flag||infinite)ns = MATCH_COUNT_INFINITE;
                    else ns = MATCH_COUNT;
        MATCH : if(valid)ns=DIN;else ns = MATCH_COUNT;
        PATTERN_EXT: if(pattern_ext_done) ns= MATCH_INFINITE;else ns = PATTERN_EXT;
        MATCH_COUNT_INFINITE :
                        ns=PATTERN_EXT;
        MATCH_INFINITE :if(infinite_done)ns=MATCH_COUNT;
                        else ns =MATCH_COUNT_INFINITE;
     
        default:;
    endcase

reg [10:0]string_cnt,pattern_cnt;
always@(posedge clk,posedge reset)
    if(reset)
        string_cnt <=0;
    else if(ps == PRE_DATA||string_finish)
        string_cnt <=0;
    else if(isstring_r0)
        string_cnt <=string_cnt+1;

always@(posedge clk,posedge reset)
    if(reset)
        pattern_cnt <=0;
    else if(ps == PRE_DATA||pattern_finish)
        pattern_cnt <=0;
    else if(ispattern_r0)
        pattern_cnt <=pattern_cnt+1;

assign string_start = isstring&&!isstring_r0;
assign string_finish =isstring_r0&&!isstring;
assign pattern_start = ispattern&&!ispattern_r0;
assign pattern_finish =!ispattern_r0&&ispattern_r1;

always@(posedge clk)
    if(ps==DIN)begin
        if(isstring_r0)
            string_reg[string_cnt+1] <= chardata_r0;
    end
    else if(ps == PRE_DATA)
        begin       
            string_reg[0] <= SPACE;
            string_reg[string_lenth-1] <= SPACE;
        end

wire pattern_ext_done;
assign pattern_ext_done = (cnt==1);
reg [10:0]cnt;
always@(posedge clk,posedge reset)
    if(reset)cnt<=0;
    else if(ps==PATTERN_EXT)cnt<=cnt+1;
    else cnt<=0;

always@(posedge clk)
    if(ps==DIN)begin
        if(ispattern_r0)
            pattern_reg[pattern_cnt] <= chardata_r0;
    end
    else if(ps == PRE_DATA)begin
        for(i = 0;i<32;i=i+1)
            if(pattern_reg[i]==MONEY || pattern_reg[i] == TRIANGLE)
                pattern_reg[i] <= SPACE;
    end
    else if(ps==PATTERN_EXT)
        if(cnt==0)begin
            for(i = 0;i<32;i=i+1)
                if(i>pattern_index_reg+1)
                    pattern_reg[i+1] <= pattern_reg[i];
        end
        else
            pattern_reg[pattern_index+infinite_cnt+cnt-1] <= DOT;

//infinite
reg infinite,infinite_flag;
wire infinite_done;
assign infinite_done = string_reg[index]==pattern_reg[pattern_index_reg+infinite_cnt]
                        &&(pattern_index_reg+infinite_cnt==string_target_index);
always@(*)
    if(ps==MATCH_COUNT)
        if(pattern_reg[index]==STAR)infinite =1;
        else infinite =0;
always@(posedge clk,posedge reset)
    if(reset)
        infinite_flag <=0;
    else if(infinite_done)
        infinite_flag <=0;
    else if(infinite)
        infinite_flag <=1;

always@(posedge clk,posedge reset)
    if(reset)
        infinite_cnt <=0;
    else if(infinite_flag&&ps==PATTERN_EXT)
            infinite_cnt <=infinite_cnt+1;
    else if(infinite_done)
        infinite_cnt <=0;

reg [4:0]star_num;
always@(posedge clk)
    if(ps==DIN)
        star_num <= 0;
    else if(ps == PRE_DATA)
        for(i = 0;i<32;i=i+1)
            if(pattern_reg[i]==STAR)
                star_num<= star_num+1;

//lenth
always@(posedge clk)
    if(din_string_done)
        string_lenth <= string_cnt+3;
always@(posedge clk)
    if(din_done)
        pattern_lenth <= pattern_cnt;

assign index =string_index +pattern_index;
assign string_target_index = (string_lenth - pattern_lenth);
assign pattern_target_index = (infinite_flag)?pattern_lenth+infinite_cnt:pattern_lenth-1;
assign valid =(ps==MATCH)&&((string_index==string_target_index)&&(pattern_index==pattern_target_index)||match);

always@(*)

    if(match_count == pattern_lenth)match =1;
    else match =0;

always@(*)
    if(match_count == pattern_lenth)
        if (pattern_reg[0] == SPACE||string_index==0)
            match_index =string_index;
        else 
            match_index =string_index-1;
    else 
        match_index =0;


always@(posedge clk,posedge reset)
    if(reset)
        match_count<=0;
    else if(ps==MATCH)
        if(infinite_flag)
            match_count<=match_count_reg;
        else
            match_count<=star_num;
    else if(ps==MATCH_COUNT)
        if(string_reg[index] == pattern_reg[pattern_index]||pattern_reg[pattern_index]==DOT
            ||pattern_reg[pattern_index]==STAR)
                match_count <= match_count+1;
    else if(ps==MATCH_COUNT_INFINITE)
        if(string_reg[index] == pattern_reg[pattern_index]||pattern_reg[pattern_index]==DOT
            ||pattern_reg[pattern_index]==STAR)
                match_count <= match_count+1;
    else if(ps==MATCH_INFINITE)
        if(string_reg[index] == pattern_reg[pattern_index]||pattern_reg[pattern_index]==DOT
            ||pattern_reg[pattern_index]==STAR)
                match_count <= match_count+1;

reg [10:0]match_count_reg;
always@(posedge clk,posedge reset)
    if(reset)
        match_count_reg<=0;
    else if(ps==MATCH&&infinite)
        match_count_reg<=match_count;

always@(posedge clk,posedge reset)
    if(reset)
        string_index<=0;
    else if(valid)
        string_index <=0;
    else if(ps==MATCH&&!infinite_flag)
        string_index <= string_index+1;

always@(posedge clk,posedge reset)
    if(reset)
        pattern_index<=0;
    else if(ps==MATCH)
        if(infinite_flag)
            pattern_index <= pattern_index;
        else
            pattern_index <=0;       
    else if(ps==MATCH_COUNT&&pattern_index<pattern_target_index)
        pattern_index <= pattern_index+1;

reg [10:0]pattern_index_reg;
always@(posedge clk,posedge reset)
    if(reset)
        pattern_index_reg<=0;
    else if(ps==PATTERN_EXT&&infinite)
        pattern_index_reg<=pattern_index;
/*
always@(*)
begin
    if(ps==MATCH_COUNT)
    begin
        match_index=0;
        match = 0;
        for(i=0;i<32;i=i+1)
            if(i < string_lenth - pattern_lenth)
            begin
                match_count=0;
                for(j=0;j<8;j=j+1)
                    if(j < pattern_lenth)
                        //如果Match MatchCount +1
                        if(pattern_reg[i + j] == 1)
                            match_count = match_count+1;
                        //如果沒有Match
                        else
                            match_count = match_count;
                    else
                        match_count = match_count;

                //Pattern完計算這次是否Match
                if(match_count == pattern_lenth)
                    match_index = match_index +1;
                else
                    match_index = match_index;
            end
        if(match_index>0) match = 1;
        else match = 0;
    end
end*/



endmodule
