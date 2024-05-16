module split(a1,a2,sum,index0,index1,clk,reset,ps,M1,M2,M3,M4,M5,M6,H1,H2,H3,H4,H5,H6);

input [5:0] index0,index1;
input [7:0] a1,a2;

output reg [7:0] M1,M2,M3,M4,M5,M6;
output reg [7:0] H1,H2,H3,H4,H5,H6;


always @(posedge clk,posedge reset) 
begin
    if(reset)
    begin
        M1 <= 0;
        M2 <= 0;
        M3 <= 0;
        M4 <= 0;
        M5 <= 0;
        M6 <= 0; 
    end
    else
    if(ps == COMBINE)
    // Mask
        if(index0[0] || index1[0])
            M1 <= (M1 << 1)+1;
        else if(index0[1] || index1[1])
            M2 <= (M2 << 1)+1;
        else if(index0[2] || index1[2])
            M3 <= (M3 << 1)+1;
        else if(index0[3] || index1[3])
            M4 <= (M4 << 1)+1;
        else if(index0[4] || index1[4])
            M5 <= (M5 << 1)+1;
        else if(index0[5] || index1[5])
            M6 <= (M6 << 1)+1;
end

always @(posedge clk,posedge reset) 
begin
    if(reset)
    begin
        H1 <= 0;
        H2 <= 0;
        H3 <= 0;
        H4 <= 0;
        H5 <= 0;
        H6 <= 0; 
    end
    else
    if(ps == COMBINE)
    // 霍夫曼編碼，小的為1
        if(index0[0])
            H1 <= (H1 << 1)+1;
        else if(index0[1])
            H2 <= (H2 << 1)+1;
        else if(index0[2])
            H3 <= (H3 << 1)+1;
        else if(index0[3])
            H4 <= (H4 << 1)+1;
        else if(index0[4])
            H5 <= (H5 << 1)+1;
        else if(index0[5])
            H6 <= (H6 << 1)+1;
    // 霍夫曼編碼，大的為0
        else if(index1[0])
            H1 <= (H1 << 1);
        else if(index1[1])
            H2 <= (H2 << 1);
        else if(index1[2])
            H3 <= (H3 << 1);
        else if(index1[3])
            H4 <= (H4 << 1);
        else if(index1[4])
            H5 <= (H5 << 1);
        else if(index1[5])
            H6 <= (H6 << 1);
end

endmodule
