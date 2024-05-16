/*module threshold(clk, reset,din0,din1,din2,din3,din4,din5,din6,din7,din8,dout);
input clk,reset;
input [7:0] din0,din1,din2,din3,din4,din5,din6,din7,din8;
output wire [7:0]dout;

wire [7:0] s_bin;
reg [7:0] lbp_index[0:7];

integer i;

assign s_bin[0] = (din0 - din1>=0) ? 1:0;
assign s_bin[1] = (din0 - din2>=0) ? 1:0;
assign s_bin[2] = (din0 - din3>=0) ? 1:0;
assign s_bin[3] = (din0 - din4>=0) ? 1:0;
assign s_bin[4] = (din0 - din5>=0) ? 1:0;
assign s_bin[5] = (din0 - din6>=0) ? 1:0;
assign s_bin[6] = (din0 - din7>=0) ? 1:0;
assign s_bin[7] = (din0 - din8>=0) ? 1:0;

always@(*)
    for(i=0;i<8;i=i+1)
        if(s_bin[i]==1)
            lbp_index[i] = s_bin[i] <<i;
        else
            lbp_index[i] = 0;

generate
    genvar j;
    for(j=0;j<8;j=j+1)begin: lbp_acc
        assign dout = dout + lbp_index[j];
    end
endgenerate
endmodule
*/

module threshold(clk, reset,din,din_cnt,dout);
input clk,reset;
input [7:0] din;
input [3:0] din_cnt;

output wire [7:0]dout;

wire din_bin;
wire [7:0] din_s;
reg [7:0] center;
reg [7:0] dout_acc;

integer i;

assign din_bin = (din - center >= 0)?1:0;
assign din_s = din_bin << din_cnt;
assign dout = dout_acc + din_s;

always@(posedge clk)
    if(din_cnt==0)
        center <= din;

always@(posedge clk,posedge reset)
    if(reset)
        dout_acc <= 0;
    else if(din_cnt<8)
        dout_acc <= dout_acc + din_cnt;

endmodule

//1. 1個運算單元算9次
//2. 9個運算單元算1次
//3. 3個運算單元算3次