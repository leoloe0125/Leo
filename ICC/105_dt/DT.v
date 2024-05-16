module DT(
	input 			clk, 
	input			reset,
	output	reg		done ,
	output	reg		sti_rd ,
	output	reg 	[9:0]	sti_addr ,
	input		[15:0]	sti_di,
	output	reg		res_wr ,
	output	reg		res_rd ,
	output	reg 	[13:0]	res_addr ,
	output	reg 	[7:0]	res_do,
	input		[7:0]	res_di
	);

reg[2:0]ps,ns;
parameter FORWARD_GLOBAL_CNT = 3'd0;
parameter FORWARD_PASS = 3'd1;
parameter BACKWARD_GLOBAL_CNT = 3'd2;
parameter BACKWARD_PASS = 3'd3;

reg [13:0]global_cnt;
reg [7:0] px_y;
wire [3:0]global_cnt_4;
wire [9:0]global_cnt_10;
reg [2:0]fb_cnt;
reg back_di;
always@(posedge clk,negedge reset)
	if(!reset)ps <= FORWARD_GLOBAL_CNT;
	else ps <= ns;

//rom > ram
wire forward_done,backward_done,global_cnt_halt;
assign forward_pass_done =(ps==FORWARD_PASS&&fb_cnt==4);
assign backward_pass_done =(ps==BACKWARD_PASS&&fb_cnt == 5);
assign global_cnt_halt = (ps==FORWARD_GLOBAL_CNT)?sti_di[15-global_cnt_4]==1:(res_di>0);
assign forward_done = (ps==FORWARD_GLOBAL_CNT&&global_cnt==16383);//
assign backward_done = (ps==BACKWARD_GLOBAL_CNT&&global_cnt==0);//

/*
wire continue;
assign continue==sti_di_r0 == sti_di;
reg [15:0]sti_di_r0;
always@(posedge clk,posedge reset)
    if(reset) sti_di_r0<=0;
    else sti_di_r0 <= sti_di;*/

always@(*)
    if(backward_done)done=1;
    else done =0;

always@(*)
    case(ps)
        FORWARD_GLOBAL_CNT: 
                if(forward_done)ns = BACKWARD_GLOBAL_CNT;
                else if(global_cnt_halt) ns = FORWARD_PASS; 
                else ns = FORWARD_GLOBAL_CNT;
        FORWARD_PASS: 
                if(forward_pass_done)
                    ns = FORWARD_GLOBAL_CNT;
                else
                    ns = FORWARD_PASS;

        BACKWARD_GLOBAL_CNT: 
                if(backward_done)ns = BACKWARD_GLOBAL_CNT;
                else if(global_cnt_halt) ns = BACKWARD_PASS; 
                else ns = BACKWARD_GLOBAL_CNT;
        BACKWARD_PASS: 
                if(backward_pass_done)
                    ns = BACKWARD_GLOBAL_CNT;
                else
                    ns = BACKWARD_PASS;
		default: ns = FORWARD_GLOBAL_CNT;
    endcase

always@(posedge clk,negedge reset)
	if(!reset)global_cnt <= 0;
	else if(forward_done)
		global_cnt <= global_cnt;
	else if(forward_pass_done)
		global_cnt <= global_cnt+1;
	else if(backward_pass_done)
		global_cnt <= global_cnt-1;
	else if(!global_cnt_halt)
		if(ps==FORWARD_GLOBAL_CNT)
			global_cnt <= global_cnt+1;
		else if(ps==BACKWARD_GLOBAL_CNT)
			global_cnt <= global_cnt-1;//多數一個

//到7為0
always@(posedge clk,negedge reset)
begin
	if(!reset)fb_cnt <= 0;
	else if(fb_cnt == 4&&ps==FORWARD_PASS) fb_cnt <= 0;
	else if(fb_cnt == 5&&ps==BACKWARD_PASS) fb_cnt <= 0;
	else if(ps==FORWARD_PASS||ps==BACKWARD_PASS)fb_cnt <= fb_cnt+1;//多數一個
end

always@(*)
	case(ps)
		FORWARD_GLOBAL_CNT:begin
			sti_rd =1;
			res_rd =0;
			res_wr =1;
		end
		FORWARD_PASS:begin
			sti_rd =0;
			res_rd =1;
			res_wr =0;
			if(fb_cnt==4)begin
				res_wr =1;
				res_rd =0;
			end
			else begin
				res_rd =1;
				res_wr =0;
			end

		end
		BACKWARD_GLOBAL_CNT:begin
			sti_rd =0;
			res_wr =0;
			res_rd =1;
		end
		BACKWARD_PASS:begin
			sti_rd =0;
			res_rd =1;
			res_wr =0;
			if(fb_cnt==5)begin
				res_wr =1;
				res_rd =0;
			end
			else begin
				res_rd =1;
				res_wr =0;
			end
		end
		default: begin
			sti_rd =0;
			res_rd =0;
			res_wr =0;
		end
	endcase

//000
always@(*)begin
	if(ps==FORWARD_GLOBAL_CNT)
		res_do =  global_cnt_halt;
	else if(ps == FORWARD_PASS&& fb_cnt==4)
		res_do = px_y +1;
	else if(ps == BACKWARD_PASS && fb_cnt==5)
		res_do = px_y;
	else
	 	res_do = 0;
end

//------------------------------------------------------------------------------------------------

always @(posedge clk,negedge reset) begin
	if(!reset)
		px_y <=0;
	else if(ps == FORWARD_PASS)begin
		if(fb_cnt==0) px_y <= res_di;
		else if(res_di<=px_y && fb_cnt<4) 
			px_y <= res_di;
		else if(fb_cnt==4)
			px_y <= px_y +1;
	end
	else if(ps == BACKWARD_PASS)begin
		if(fb_cnt==0) px_y <= res_di;
		else if(res_di+1<=px_y && fb_cnt<5) px_y <= res_di+1;
	end
end

assign global_cnt_4 = global_cnt[3:0];
assign global_cnt_10 = global_cnt[13:4];






always @(*)begin
	if(ps == FORWARD_PASS)
		case(fb_cnt)
			0: res_addr = global_cnt-1;
			1: res_addr = global_cnt-129;
			2: res_addr = global_cnt-128;
			3: res_addr = global_cnt-127;
			4: res_addr = global_cnt;
			default : res_addr = global_cnt;
		endcase
	else if(ps == BACKWARD_PASS)
		case(fb_cnt)
			0: res_addr = global_cnt;
			1: res_addr = global_cnt+1;
			2: res_addr = global_cnt+127;
			3: res_addr = global_cnt+128;
			4: res_addr = global_cnt+129;
			default : res_addr = global_cnt;
		endcase
	else res_addr = global_cnt;

	if(ps==FORWARD_GLOBAL_CNT)sti_addr = global_cnt_10;
	else sti_addr = global_cnt_10;
end
//000

	/*
	else if(ps == BACKWARD)begin
		case(fb_cnt)
			4:if(&global_cnt_4) sti_addr= global_cnt_10+1;else sti_addr= global_cnt_10;
			5:if(global_cnt_4==14) sti_addr= global_cnt_10+8-1;else sti_addr= global_cnt_10+8;
			6:sti_addr=global_cnt_10+8;
			7:if(&global_cnt_4) sti_addr= global_cnt_10+8+1;else sti_addr= global_cnt_10+8;
			default : sti_addr=global_cnt_10;
		endcase
		res_addr = global_cnt;
	end
	else
		res_addr = global_cnt;*/


/*always@(*)
	case(forward_cnt)
		4:if(&global_cnt_4) back_di= sti_di[0];else back_di= sti_di[global_cnt_4+1];
		5:if(global_cnt_4==14) back_di= sti_di[13];else back_di= sti_di[global_cnt_4-1];
		6:back_di= sti_di[global_cnt_4];
		7:if(&global_cnt_4) back_di= sti_di[0];else back_di= sti_di[global_cnt_4+1];*/
/*
always@(*)
	case(fb_cnt)
		4:if(&global_cnt_4) back_di= sti_di[15];else back_di= sti_di[15-global_cnt_4-1];
		5:if(global_cnt_4==0) back_di= sti_di[0];else back_di= sti_di[15-global_cnt_4+1];
		6:back_di= sti_di[15-global_cnt_4];
		7:if(&global_cnt_4) back_di= sti_di[15];else back_di= sti_di[15-global_cnt_4-1];
		default: back_di=0;
	endcase
*/
endmodule

