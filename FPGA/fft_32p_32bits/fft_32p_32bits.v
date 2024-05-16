`include "butterfly/butterfly_32b.v"

module fft_32p_32bits (
    input [31:0] din0, din1, din2, din3, din4, din5, din6, din7, din8, din9, din10, din11, din12, din13, din14, din15, din16, din17, din18, din19, din20, din21, din22, din23, din24, din25, din26, din27, din28, din29, din30, din31,
    output [31:0] dout0_real, dout0_imag, dout1_real, dout1_imag, dout2_real, dout2_imag, dout3_real, dout3_imag, dout4_real, dout4_imag, dout5_real, dout5_imag, dout6_real, dout6_imag, dout7_real, dout7_imag, dout8_real, dout8_imag, dout9_real, dout9_imag, dout10_real, dout10_imag, dout11_real, dout11_imag, dout12_real, dout12_imag, dout13_real, dout13_imag, dout14_real, dout14_imag, dout15_real, dout15_imag, dout16_real, dout16_imag, dout17_real, dout17_imag, dout18_real, dout18_imag, dout19_real, dout19_imag, dout20_real, dout20_imag, dout21_real, dout21_imag, dout22_real, dout22_imag, dout23_real, dout23_imag, dout24_real, dout24_imag, dout25_real, dout25_imag, dout26_real, dout26_imag, dout27_real, dout27_imag, dout28_real, dout28_imag, dout29_real, dout29_imag, dout30_real, dout30_imag, dout31_real, dout31_imag
);

parameter test_stage0 = 3'b000;
parameter test_stage1 = 3'b001;
parameter test_stage2 = 3'b010;
parameter test_stage3 = 3'b011;
parameter test_stage4 = 3'b100;

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

wire [31:0] dout_real[0:31];
assign dout0_real = dout_real[0];
assign dout1_real = dout_real[1];
assign dout2_real = dout_real[2];
assign dout3_real = dout_real[3];
assign dout4_real = dout_real[4];
assign dout5_real = dout_real[5];
assign dout6_real = dout_real[6];
assign dout7_real = dout_real[7];
assign dout8_real = dout_real[8];
assign dout9_real = dout_real[9];
assign dout10_real = dout_real[10];
assign dout11_real = dout_real[11];
assign dout12_real = dout_real[12];
assign dout13_real = dout_real[13];
assign dout14_real = dout_real[14];
assign dout15_real = dout_real[15];
assign dout16_real = dout_real[16];
assign dout17_real = dout_real[17];
assign dout18_real = dout_real[18];
assign dout19_real = dout_real[19];
assign dout20_real = dout_real[20];
assign dout21_real = dout_real[21];
assign dout22_real = dout_real[22];
assign dout23_real = dout_real[23];
assign dout24_real = dout_real[24];
assign dout25_real = dout_real[25];
assign dout26_real = dout_real[26];
assign dout27_real = dout_real[27];
assign dout28_real = dout_real[28];
assign dout29_real = dout_real[29];
assign dout30_real = dout_real[30];
assign dout31_real = dout_real[31];

wire [31:0] dout_imag[0:31];
assign dout0_imag = dout_imag[0];
assign dout1_imag = dout_imag[1];
assign dout2_imag = dout_imag[2];
assign dout3_imag = dout_imag[3];
assign dout4_imag = dout_imag[4];
assign dout5_imag = dout_imag[5];
assign dout6_imag = dout_imag[6];
assign dout7_imag = dout_imag[7];
assign dout8_imag = dout_imag[8];
assign dout9_imag = dout_imag[9];
assign dout10_imag = dout_imag[10];
assign dout11_imag = dout_imag[11];
assign dout12_imag = dout_imag[12];
assign dout13_imag = dout_imag[13];
assign dout14_imag = dout_imag[14];
assign dout15_imag = dout_imag[15];
assign dout16_imag = dout_imag[16];
assign dout17_imag = dout_imag[17];
assign dout18_imag = dout_imag[18];
assign dout19_imag = dout_imag[19];
assign dout20_imag = dout_imag[20];
assign dout21_imag = dout_imag[21];
assign dout22_imag = dout_imag[22];
assign dout23_imag = dout_imag[23];
assign dout24_imag = dout_imag[24];
assign dout25_imag = dout_imag[25];
assign dout26_imag = dout_imag[26];
assign dout27_imag = dout_imag[27];
assign dout28_imag = dout_imag[28];
assign dout29_imag = dout_imag[29];
assign dout30_imag = dout_imag[30];
assign dout31_imag = dout_imag[31];

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

reg [31:0] weights_real_mem [0:15];
reg [31:0] weights_imag_mem [0:15];
// Read the weights into the memory array
initial begin
    $readmemh("output/weights_real.txt", weights_real_mem);
    $readmemh("output/weights_imag.txt", weights_imag_mem);
end

generate
    genvar i,m;
    for (m=0;m<5;m=m+1) begin
        for (i = 0; i < 16; i = i + 1) begin : butterfly
            case (m)
                0://1 weights butterfly
                    butterfly_32b stage0_butterfly_weight0 (
                        .din0_real(din[i]),
                        .din0_imag(32'b0),
                        .din1_real(din[i+16]),
                        .din1_imag(32'b0),
                        .w_real(weights_real_mem[m]),
                        .w_imag(weights_imag_mem[m]),
                        .dout0_real(a_real[i]),
                        .dout0_imag(a_imag[i]),
                        .dout1_real(a_real[i+16]),
                        .dout1_imag(a_imag[i+16])
                    );
                    
                1://2 weights butterfly
                    if(i<8)
                        butterfly_32b stage1_butterfly_weight8 (
                            .din0_real(a_real[i]),
                            .din0_imag(a_imag[i]),
                            .din1_real(a_real[i+8]),
                            .din1_imag(a_imag[i+8]),
                            .w_real(weights_real_mem[8]),
                            .w_imag(weights_imag_mem[8]),
                            .dout0_real(b_real[i]),
                            .dout0_imag(b_imag[i]),
                            .dout1_real(b_real[i+8]),
                            .dout1_imag(b_imag[i+8])
                        );
                    else
                        butterfly_32b stage1_butterfly_weight0 (
                            .din0_real(a_real[i+8]),
                            .din0_imag(a_imag[i+8]),
                            .din1_real(a_real[i+16]),
                            .din1_imag(a_imag[i+16]),
                            .w_real(weights_real_mem[0]),
                            .w_imag(weights_imag_mem[0]),
                            .dout0_real(b_real[i+8]),
                            .dout0_imag(b_imag[i+8]),
                            .dout1_real(b_real[i+16]),
                            .dout1_imag(b_imag[i+16])
                        );
                2://4 weights butterfly
                    if(i<4)
                        butterfly_32b stage2_butterfly_weight12 (
                            .din0_real(b_real[i]),
                            .din0_imag(b_imag[i]),
                            .din1_real(b_real[i+4]),
                            .din1_imag(b_imag[i+4]),
                            .w_real(weights_real_mem[12]),
                            .w_imag(weights_imag_mem[12]),
                            .dout0_real(c_real[i]),
                            .dout0_imag(c_imag[i]),
                            .dout1_real(c_real[i+4]),
                            .dout1_imag(c_imag[i+4])
                        );
                    else if(i<8)
                        butterfly_32b stage2_butterfly_weight8 (
                            .din0_real(b_real[i+4]),
                            .din0_imag(b_imag[i+4]),
                            .din1_real(b_real[i+8]),
                            .din1_imag(b_imag[i+8]),
                            .w_real(weights_real_mem[8]),
                            .w_imag(weights_imag_mem[8]),
                            .dout0_real(c_real[i+4]),
                            .dout0_imag(c_imag[i+4]),
                            .dout1_real(c_real[i+8]),
                            .dout1_imag(c_imag[i+8])
                        );
                    else if(i<12)
                        butterfly_32b stage2_butterfly_weight4 (
                            .din0_real(b_real[i+8]),
                            .din0_imag(b_imag[i+8]),
                            .din1_real(b_real[i+12]),
                            .din1_imag(b_imag[i+12]),
                            .w_real(weights_real_mem[4]),
                            .w_imag(weights_imag_mem[4]),
                            .dout0_real(c_real[i+8]),
                            .dout0_imag(c_imag[i+8]),
                            .dout1_real(c_real[i+12]),
                            .dout1_imag(c_imag[i+12])
                        );
                    else
                        butterfly_32b stage2_butterfly_weight0 (
                            .din0_real(b_real[i+12]),
                            .din0_imag(b_imag[i+12]),
                            .din1_real(b_real[i+16]),
                            .din1_imag(b_imag[i+16]),
                            .w_real(weights_real_mem[0]),
                            .w_imag(weights_imag_mem[0]),
                            .dout0_real(c_real[i+12]),
                            .dout0_imag(c_imag[i+12]),
                            .dout1_real(c_real[i+16]),
                            .dout1_imag(c_imag[i+16])
                        );
                3:
                    if(i<2)
                        butterfly_32b stage3_butterfly_weight14 (
                            .din0_real(c_real[i]),
                            .din0_imag(c_imag[i]),
                            .din1_real(c_real[i+2]),
                            .din1_imag(c_imag[i+2]),
                            .w_real(weights_real_mem[14]),
                            .w_imag(weights_imag_mem[14]),
                            .dout0_real(d_real[i]),
                            .dout0_imag(d_imag[i]),
                            .dout1_real(d_real[i+2]),
                            .dout1_imag(d_imag[i+2])
                        );
                    else if(i<4)
                        butterfly_32b stage3_butterfly_weight12 (
                            .din0_real(c_real[i+2]),
                            .din0_imag(c_imag[i+2]),
                            .din1_real(c_real[i+4]),
                            .din1_imag(c_imag[i+4]),
                            .w_real(weights_real_mem[12]),
                            .w_imag(weights_imag_mem[12]),
                            .dout0_real(d_real[i+2]),
                            .dout0_imag(d_imag[i+2]),
                            .dout1_real(d_real[i+4]),
                            .dout1_imag(d_imag[i+4])
                        );
                    else if(i<6)
                        butterfly_32b stage3_butterfly_weight10 (
                            .din0_real(c_real[i+4]),
                            .din0_imag(c_imag[i+4]),
                            .din1_real(c_real[i+6]),
                            .din1_imag(c_imag[i+6]),
                            .w_real(weights_real_mem[10]),
                            .w_imag(weights_imag_mem[10]),
                            .dout0_real(d_real[i+4]),
                            .dout0_imag(d_imag[i+4]),
                            .dout1_real(d_real[i+6]),
                            .dout1_imag(d_imag[i+6])
                        );
                    else if(i<8)
                        butterfly_32b stage3_butterfly_weight8 (
                            .din0_real(c_real[i+6]),
                            .din0_imag(c_imag[i+6]),
                            .din1_real(c_real[i+8]),
                            .din1_imag(c_imag[i+8]),
                            .w_real(weights_real_mem[8]),
                            .w_imag(weights_imag_mem[8]),
                            .dout0_real(d_real[i+6]),
                            .dout0_imag(d_imag[i+6]),
                            .dout1_real(d_real[i+8]),
                            .dout1_imag(d_imag[i+8])
                        );
                    else if(i<10)
                        butterfly_32b stage3_butterfly_weight6 (
                            .din0_real(c_real[i+8]),
                            .din0_imag(c_imag[i+8]),
                            .din1_real(c_real[i+10]),
                            .din1_imag(c_imag[i+10]),
                            .w_real(weights_real_mem[6]),
                            .w_imag(weights_imag_mem[6]),
                            .dout0_real(d_real[i+8]),
                            .dout0_imag(d_imag[i+8]),
                            .dout1_real(d_real[i+10]),
                            .dout1_imag(d_imag[i+10])
                        );
                    else if(i<12)
                        butterfly_32b stage3_butterfly_weight4 (
                            .din0_real(c_real[i+10]),
                            .din0_imag(c_imag[i+10]),
                            .din1_real(c_real[i+12]),
                            .din1_imag(c_imag[i+12]),
                            .w_real(weights_real_mem[4]),
                            .w_imag(weights_imag_mem[4]),
                            .dout0_real(d_real[i+10]),
                            .dout0_imag(d_imag[i+10]),
                            .dout1_real(d_real[i+12]),
                            .dout1_imag(d_imag[i+12])
                        );
                    else if(i<14)
                        butterfly_32b stage3_butterfly_weight2 (
                            .din0_real(c_real[i+12]),
                            .din0_imag(c_imag[i+12]),
                            .din1_real(c_real[i+14]),
                            .din1_imag(c_imag[i+14]),
                            .w_real(weights_real_mem[2]),
                            .w_imag(weights_imag_mem[2]),
                            .dout0_real(d_real[i+12]),
                            .dout0_imag(d_imag[i+12]),
                            .dout1_real(d_real[i+14]),
                            .dout1_imag(d_imag[i+14])
                        );
                    else 
                        butterfly_32b stage3_butterfly_weight0 (
                            .din0_real(c_real[i+14]),
                            .din0_imag(c_imag[i+14]),
                            .din1_real(c_real[i+16]),
                            .din1_imag(c_imag[i+16]),
                            .w_real(weights_real_mem[0]),
                            .w_imag(weights_imag_mem[0]),
                            .dout0_real(d_real[i+14]),
                            .dout0_imag(d_imag[i+14]),
                            .dout1_real(d_real[i+16]),
                            .dout1_imag(d_imag[i+16])
                        );
                4:
                    butterfly_32b stage4_butterfly_weight (
                        .din0_real(d_real[2*i]),
                        .din0_imag(d_imag[2*i]),
                        .din1_real(d_real[2*i+1]),
                        .din1_imag(d_imag[2*i+1]),
                        .w_real(weights_real_mem[15-i]),
                        .w_imag(weights_imag_mem[15-i]),
                        .dout0_real(dout_real[2*i+1]),
                        .dout0_imag(dout_imag[2*i+1]),
                        .dout1_real(dout_real[2*i]),
                        .dout1_imag(dout_imag[2*i])
                    );
            endcase
        end
    end
endgenerate
endmodule