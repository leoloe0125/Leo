`include "butterfly/butterfly_32b.v"
`timescale 1ns / 1ps
module fft_32p_32bits (
    input clk, reset,
    input [31:0] din0, din1, din2, din3, din4, din5, din6, din7, din8, din9, din10, din11, din12, din13, din14, din15, din16, din17, din18, din19, din20, din21, din22, din23, din24, din25, din26, din27, din28, din29, din30, din31,
    input [2:0]test_mode,
    output reg[31:0] dout0_real, dout0_imag, dout1_real, dout1_imag, dout2_real, dout2_imag, dout3_real, dout3_imag, dout4_real, dout4_imag, dout5_real, dout5_imag, dout6_real, dout6_imag, dout7_real, dout7_imag, dout8_real, dout8_imag, dout9_real, dout9_imag, dout10_real, dout10_imag, dout11_real, dout11_imag, dout12_real, dout12_imag, dout13_real, dout13_imag, dout14_real, dout14_imag, dout15_real, dout15_imag, dout16_real, dout16_imag, dout17_real, dout17_imag, dout18_real, dout18_imag, dout19_real, dout19_imag, dout20_real, dout20_imag, dout21_real, dout21_imag, dout22_real, dout22_imag, dout23_real, dout23_imag, dout24_real, dout24_imag, dout25_real, dout25_imag, dout26_real, dout26_imag, dout27_real, dout27_imag, dout28_real, dout28_imag, dout29_real, dout29_imag, dout30_real, dout30_imag, dout31_real, dout31_imag
);
wire [31:0] din[0:31];
assign din[0] = din0;
assign din[1] = din1;
assign din[2] = din2;
assign din[3] = din3;
assign din[4] = din4;
assign din[5] = din5;
assign din[6] = din6;
assign din[7] = din7;
assign din[8] = din8;
assign din[9] = din9;
assign din[10] = din10;
assign din[11] = din11;
assign din[12] = din12;
assign din[13] = din13;
assign din[14] = din14;
assign din[15] = din15;
assign din[16] = din16;
assign din[17] = din17;
assign din[18] = din18;
assign din[19] = din19;
assign din[20] = din20;
assign din[21] = din21;
assign din[22] = din22;
assign din[23] = din23;
assign din[24] = din24;
assign din[25] = din25;
assign din[26] = din26;
assign din[26] = din26;
assign din[27] = din27;
assign din[28] = din28;
assign din[29] = din29;
assign din[30] = din30;
assign din[31] = din31;


wire [31:0]a_real[0:31];
wire [31:0]a_imag[0:31];

wire [31:0]b_real[0:31];
wire [31:0]b_imag[0:31];

wire [31:0]c_real[0:31];
wire [31:0]c_imag[0:31];

wire [31:0]d_real[0:31];
wire [31:0]d_imag[0:31];

wire [31:0]e_real[0:31];
wire [31:0]e_imag[0:31];



always @(posedge clk ) begin
        dout0_real <= e_real[0]; dout0_imag <= e_imag[0];
        dout1_real <= e_real[1]; dout1_imag <= e_imag[1];
        dout2_real <= e_real[2]; dout2_imag <= e_imag[2];
        dout3_real <= e_real[3]; dout3_imag <= e_imag[3];
        dout4_real <= e_real[4]; dout4_imag <= e_imag[4];
        dout5_real <= e_real[5]; dout5_imag <= e_imag[5];
        dout6_real <= e_real[6]; dout6_imag <= e_imag[6];
        dout7_real <= e_real[7]; dout7_imag <= e_imag[7];
        dout8_real <= e_real[8]; dout8_imag <= e_imag[8];
        dout9_real <= e_real[9]; dout9_imag <= e_imag[9];
        dout10_real <= e_real[10]; dout10_imag <= e_imag[10];
        dout11_real <= e_real[11]; dout11_imag <= e_imag[11];
        dout12_real <= e_real[12]; dout12_imag <= e_imag[12];
        dout13_real <= e_real[13]; dout13_imag <= e_imag[13];
        dout14_real <= e_real[14]; dout14_imag <= e_imag[14];
        dout15_real <= e_real[15]; dout15_imag <= e_imag[15];
        dout16_real <= e_real[16]; dout16_imag <= e_imag[16];
        dout17_real <= e_real[17]; dout17_imag <= e_imag[17];
        dout18_real <= e_real[18]; dout18_imag <= e_imag[18];
        dout19_real <= e_real[19]; dout19_imag <= e_imag[19];
        dout20_real <= e_real[20]; dout20_imag <= e_imag[20];
        dout21_real <= e_real[21]; dout21_imag <= e_imag[21];
        dout22_real <= e_real[22]; dout22_imag <= e_imag[22];
        dout23_real <= e_real[23]; dout23_imag <= e_imag[23];
        dout24_real <= e_real[24]; dout24_imag <= e_imag[24];
        dout25_real <= e_real[25]; dout25_imag <= e_imag[25];
        dout26_real <= e_real[26]; dout26_imag <= e_imag[26];
        dout27_real <= e_real[27]; dout27_imag <= e_imag[27];
        dout28_real <= e_real[28]; dout28_imag <= e_imag[28];
        dout29_real <= e_real[29]; dout29_imag <= e_imag[29];
        dout30_real <= e_real[30]; dout30_imag <= e_imag[30];
	dout31_real <= e_real[31]; dout31_imag <= e_imag[31];

end

// Read the weights into the memory array
wire [31:0] weights_real_mem [0:15];
wire [31:0] weights_imag_mem [0:15];
// Read the weights into the memory array
/*
initial begin
    $readmemh("weight_real.hex", weights_real_mem);
    $readmemh("weight_imag.hex", weights_imag_mem);
end*/
// 使用 assign 語句初始化 weights_real_mem
    assign weights_real_mem[0]  = 32'h00010000;
    assign weights_real_mem[1]  = 32'h0000FB15;
    assign weights_real_mem[2]  = 32'h0000EC83;
    assign weights_real_mem[3]  = 32'h0000D4DB;
    assign weights_real_mem[4]  = 32'h0000B505;
    assign weights_real_mem[5]  = 32'h00008E3A;
    assign weights_real_mem[6]  = 32'h000061F8;
    assign weights_real_mem[7]  = 32'h000031F1;
    assign weights_real_mem[8]  = 32'h00000000;
    assign weights_real_mem[9]  = 32'hFFFFCE0E;
    assign weights_real_mem[10] = 32'hFFFF9E08;
    assign weights_real_mem[11] = 32'hFFFF71C6;
    assign weights_real_mem[12] = 32'hFFFF4AFB;
    assign weights_real_mem[13] = 32'hFFFF2B24;
    assign weights_real_mem[14] = 32'hFFFF137C;
    assign weights_real_mem[15] = 32'hFFFF04EB;

    // 使用 assign 語句初始化 weights_imag_mem
    assign weights_imag_mem[0]  = 32'h00000000;
    assign weights_imag_mem[1]  = 32'hFFFFCE0E;
    assign weights_imag_mem[2]  = 32'hFFFF9E08;
    assign weights_imag_mem[3]  = 32'hFFFF71C6;
    assign weights_imag_mem[4]  = 32'hFFFF4AFB;
    assign weights_imag_mem[5]  = 32'hFFFF2B24;
    assign weights_imag_mem[6]  = 32'hFFFF137C;
    assign weights_imag_mem[7]  = 32'hFFFF04EB;
    assign weights_imag_mem[8]  = 32'hFFFF0000;
    assign weights_imag_mem[9]  = 32'hFFFF04EB;
    assign weights_imag_mem[10] = 32'hFFFF137C;
    assign weights_imag_mem[11] = 32'hFFFF2B24;
    assign weights_imag_mem[12] = 32'hFFFF4AFB;
    assign weights_imag_mem[13] = 32'hFFFF71C6;
    assign weights_imag_mem[14] = 32'hFFFF9E08;
    assign weights_imag_mem[15] = 32'hFFFFCE0E;

integer a;
/* 
always@(*)
    case(test_mode)
        test_stage0:
            begin
                $display("Stage 0");
                for (a=0;a<32;a=a+1) begin
                    dout_imag[a] = a_imag[a];
                    dout_real[a] = a_real[a];
                end
            end
        test_stage1:
            begin
                $display("Stage 1");
                for (a=0;a<32;a=a+1) begin
                    dout_imag[a] = b_imag[a];
                    dout_real[a] = b_real[a];
                end
            end
        test_stage2:
            begin
                $display("Stage 2");
                for (a=0;a<32;a=a+1) begin
                    dout_imag[a] = c_imag[a];
                    dout_real[a] = c_real[a];
                end
            end
        test_stage3:
            begin
                $display("Stage 3");
                for (a=0;a<32;a=a+1) begin
                    dout_imag[a] = d_imag[a];
                    dout_real[a] = d_real[a];
                end
            end
        test_stage4:
            begin
                $display("Stage 4");
                for (a=0;a<32;a=a+1) begin
                    dout_imag[a] = e_imag[a];
                    dout_real[a] = e_real[a];
                end
            end
    endcase

initial begin
    $display("weights_real_mem[0]=%h,w_imag(weights_imag_mem[0]=%h)",weights_real_mem[0],weights_imag_mem[0]);
    #10
    $display("din0=%h",din[8]);
    $display("din1=%h",din[26]);
    $display("a_real,a_imag[0]=%h",a_real[0],a_imag[0]);
    $display("a_real,a_imag[16]=%h",a_real[16],a_imag[16]);
end*/
generate
    genvar i,m;
    for (m=0;m<5;m=m+1) begin : stagefive
        for (i = 0; i < 16; i = i + 1) begin : stage
            case (m)
                0://1 weights butterfly
                butterfly_32b stage0_butterfly_weight0 (
                    .din0_real(din[2*i]),
                    .din0_imag(32'b0),
                    .din1_real(din[2*i+1]),
                    .din1_imag(32'b0),
                    .w_real(weights_real_mem[0]),
                    .w_imag(weights_imag_mem[0]),
                    .dout0_real(a_real[2*i]),
                    .dout0_imag(a_imag[2*i]),
                    .dout1_real(a_real[2*i+1]),
                    .dout1_imag(a_imag[2*i+1])
                );
                1:begin//2 weights butterfly
                    if(i<8)begin
                    butterfly_32b stage1_butterfly_weight0 (
                        .din0_real(a_real[4*i]),
                        .din0_imag(a_imag[4*i]),
                        .din1_real(a_real[4*i+2]),
                        .din1_imag(a_imag[4*i+2]),
                        .w_real(weights_real_mem[0]),
                        .w_imag(weights_imag_mem[0]),
                        .dout0_real(b_real[4*i]),
                        .dout0_imag(b_imag[4*i]),
                        .dout1_real(b_real[4*i+2]),
                        .dout1_imag(b_imag[4*i+2])
                    );
                    butterfly_32b stage1_butterfly_weight8 (
                        .din0_real(a_real[4*i+1]),
                        .din0_imag(a_imag[4*i+1]),
                        .din1_real(a_real[4*i+1+2]),
                        .din1_imag(a_imag[4*i+1+2]),
                        .w_real(weights_real_mem[8]),
                        .w_imag(weights_imag_mem[8]),
                        .dout0_real(b_real[4*i+1]),
                        .dout0_imag(b_imag[4*i+1]),
                        .dout1_real(b_real[4*i+1+2]),
                        .dout1_imag(b_imag[4*i+1+2])
                    );
                    end
                end
                2://4 weights butterfly
                    if(i<4)begin
                        butterfly_32b stage2_butterfly_weight0 (
                            .din0_real(b_real[8*i]),
                            .din0_imag(b_imag[8*i]),
                            .din1_real(b_real[8*i+4]),
                            .din1_imag(b_imag[8*i+4]),
                            .w_real(weights_real_mem[0]),
                            .w_imag(weights_imag_mem[0]),
                            .dout0_real(c_real[8*i]),
                            .dout0_imag(c_imag[8*i]),
                            .dout1_real(c_real[8*i+4]),
                            .dout1_imag(c_imag[8*i+4])
                        );
                        butterfly_32b stage2_butterfly_weight4 (
                            .din0_real(b_real[8*i+1]),
                            .din0_imag(b_imag[8*i+1]),
                            .din1_real(b_real[8*i+1+4]),
                            .din1_imag(b_imag[8*i+1+4]),
                            .w_real(weights_real_mem[4]),
                            .w_imag(weights_imag_mem[4]),
                            .dout0_real(c_real[8*i+1]),
                            .dout0_imag(c_imag[8*i+1]),
                            .dout1_real(c_real[8*i+1+4]),
                            .dout1_imag(c_imag[8*i+1+4])
                        );
                        butterfly_32b stage2_butterfly_weight8 (
                            .din0_real(b_real[8*i+2]),
                            .din0_imag(b_imag[8*i+2]),
                            .din1_real(b_real[8*i+2+4]),
                            .din1_imag(b_imag[8*i+2+4]),
                            .w_real(weights_real_mem[8]),
                            .w_imag(weights_imag_mem[8]),
                            .dout0_real(c_real[8*i+2]),
                            .dout0_imag(c_imag[8*i+2]),
                            .dout1_real(c_real[8*i+2+4]),
                            .dout1_imag(c_imag[8*i+2+4])
                        );
                        butterfly_32b stage2_butterfly_weight12 (
                            .din0_real(b_real[8*i+3]),
                            .din0_imag(b_imag[8*i+3]),
                            .din1_real(b_real[8*i+3+4]),
                            .din1_imag(b_imag[8*i+3+4]),
                            .w_real(weights_real_mem[12]),
                            .w_imag(weights_imag_mem[12]),
                            .dout0_real(c_real[8*i+3]),
                            .dout0_imag(c_imag[8*i+3]),
                            .dout1_real(c_real[8*i+3+4]),
                            .dout1_imag(c_imag[8*i+3+4])
                        );
                    end
                3:
                    if(i<2)begin
                        butterfly_32b stage3_butterfly_weight0 (
                            .din0_real(c_real[16*i]),
                            .din0_imag(c_imag[16*i]),
                            .din1_real(c_real[16*i+8]),
                            .din1_imag(c_imag[16*i+8]),
                            .w_real(weights_real_mem[0]),
                            .w_imag(weights_imag_mem[0]),
                            .dout0_real(d_real[16*i]),
                            .dout0_imag(d_imag[16*i]),
                            .dout1_real(d_real[16*i+8]),
                            .dout1_imag(d_imag[16*i+8])
                        );
                        butterfly_32b stage3_butterfly_weight2 (
                            .din0_real(c_real[16*i+1]),
                            .din0_imag(c_imag[16*i+1]),
                            .din1_real(c_real[16*i+1+8]),
                            .din1_imag(c_imag[16*i+1+8]),
                            .w_real(weights_real_mem[2]),
                            .w_imag(weights_imag_mem[2]),
                            .dout0_real(d_real[16*i+1]),
                            .dout0_imag(d_imag[16*i+1]),
                            .dout1_real(d_real[16*i+1+8]),
                            .dout1_imag(d_imag[16*i+1+8])
                        );
                        butterfly_32b stage3_butterfly_weight4 (
                            .din0_real(c_real[16*i+2]),
                            .din0_imag(c_imag[16*i+2]),
                            .din1_real(c_real[16*i+2+8]),
                            .din1_imag(c_imag[16*i+2+8]),
                            .w_real(weights_real_mem[4]),
                            .w_imag(weights_imag_mem[4]),
                            .dout0_real(d_real[16*i+2]),
                            .dout0_imag(d_imag[16*i+2]),
                            .dout1_real(d_real[16*i+2+8]),
                            .dout1_imag(d_imag[16*i+2+8])
                        );
                        butterfly_32b stage3_butterfly_weight6 (
                            .din0_real(c_real[16*i+3]),
                            .din0_imag(c_imag[16*i+3]),
                            .din1_real(c_real[16*i+3+8]),
                            .din1_imag(c_imag[16*i+3+8]),
                            .w_real(weights_real_mem[6]),
                            .w_imag(weights_imag_mem[6]),
                            .dout0_real(d_real[16*i+3]),
                            .dout0_imag(d_imag[16*i+3]),
                            .dout1_real(d_real[16*i+3+8]),
                            .dout1_imag(d_imag[16*i+3+8])
                        );
                        butterfly_32b stage3_butterfly_weight8 (
                            .din0_real(c_real[16*i+4]),
                            .din0_imag(c_imag[16*i+4]),
                            .din1_real(c_real[16*i+4+8]),
                            .din1_imag(c_imag[16*i+4+8]),
                            .w_real(weights_real_mem[8]),
                            .w_imag(weights_imag_mem[8]),
                            .dout0_real(d_real[16*i+4]),
                            .dout0_imag(d_imag[16*i+4]),
                            .dout1_real(d_real[16*i+4+8]),
                            .dout1_imag(d_imag[16*i+4+8])
                        );
                        butterfly_32b stage3_butterfly_weight10 (
                            .din0_real(c_real[16*i+5]),
                            .din0_imag(c_imag[16*i+5]),
                            .din1_real(c_real[16*i+5+8]),
                            .din1_imag(c_imag[16*i+5+8]),
                            .w_real(weights_real_mem[10]),
                            .w_imag(weights_imag_mem[10]),
                            .dout0_real(d_real[16*i+5]),
                            .dout0_imag(d_imag[16*i+5]),
                            .dout1_real(d_real[16*i+5+8]),
                            .dout1_imag(d_imag[16*i+5+8])
                        );
                        butterfly_32b stage3_butterfly_weight12 (
                            .din0_real(c_real[16*i+6]),
                            .din0_imag(c_imag[16*i+6]),
                            .din1_real(c_real[16*i+6+8]),
                            .din1_imag(c_imag[16*i+6+8]),
                            .w_real(weights_real_mem[12]),
                            .w_imag(weights_imag_mem[12]),
                            .dout0_real(d_real[16*i+6]),
                            .dout0_imag(d_imag[16*i+6]),
                            .dout1_real(d_real[16*i+6+8]),
                            .dout1_imag(d_imag[16*i+6+8])
                        );
                        butterfly_32b stage3_butterfly_weight14 (
                            .din0_real(c_real[16*i+7]),
                            .din0_imag(c_imag[16*i+7]),
                            .din1_real(c_real[16*i+7+8]),
                            .din1_imag(c_imag[16*i+7+8]),
                            .w_real(weights_real_mem[14]),
                            .w_imag(weights_imag_mem[14]),
                            .dout0_real(d_real[16*i+7]),
                            .dout0_imag(d_imag[16*i+7]),
                            .dout1_real(d_real[16*i+7+8]),
                            .dout1_imag(d_imag[16*i+7+8])
                        );
                    end
                              
                4:
                    butterfly_32b stage4_butterfly (
                            .din0_real(d_real[i]),
                            .din0_imag(d_imag[i]),
                            .din1_real(d_real[i+16]),
                            .din1_imag(d_imag[i+16]),
                            .w_real(weights_real_mem[i]),
                            .w_imag(weights_imag_mem[i]),
                            .dout0_real(e_real[i]),
                            .dout0_imag(e_imag[i]),
                            .dout1_real(e_real[i+16]),
                            .dout1_imag(e_imag[i+16])
                    );

            endcase
        end
    end
endgenerate
endmodule
