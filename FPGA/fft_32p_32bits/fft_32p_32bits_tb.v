`timescale 1ns / 1ps

module fft_testbench;

    reg [31:0] din [0:31];
    wire [31:0] dout_real [0:31];
    wire [31:0] dout_imag [0:31];
    reg [31:0]expected_real[0:31];reg [31:0]expected_imag[0:31];
    // Instantiate the FFT module
    fft_32p_32bits fft (
        .din0(din[0]), .din1(din[1]), .din2(din[2]), .din3(din[3]), .din4(din[4]), .din5(din[5]), .din6(din[6]), .din7(din[7]),
        .din8(din[8]), .din9(din[9]), .din10(din[10]), .din11(din[11]), .din12(din[12]), .din13(din[13]), .din14(din[14]), .din15(din[15]),
        .din16(din[16]), .din17(din[17]), .din18(din[18]), .din19(din[19]), .din20(din[20]), .din21(din[21]), .din22(din[22]), .din23(din[23]),
        .din24(din[24]), .din25(din[25]), .din26(din[26]), .din27(din[27]), .din28(din[28]), .din29(din[29]), .din30(din[30]), .din31(din[31]),
        .dout0_real(dout_real[0]), .dout0_imag(dout_imag[0]), .dout1_real(dout_real[1]), .dout1_imag(dout_imag[1]),
        .dout2_real(dout_real[2]), .dout2_imag(dout_imag[2]), .dout3_real(dout_real[3]), .dout3_imag(dout_imag[3]),
        .dout4_real(dout_real[4]), .dout4_imag(dout_imag[4]), .dout5_real(dout_real[5]), .dout5_imag(dout_imag[5]),
        .dout6_real(dout_real[6]), .dout6_imag(dout_imag[6]), .dout7_real(dout_real[7]), .dout7_imag(dout_imag[7]),
        .dout8_real(dout_real[8]), .dout8_imag(dout_imag[8]), .dout9_real(dout_real[9]), .dout9_imag(dout_imag[9]),
        .dout10_real(dout_real[10]), .dout10_imag(dout_imag[10]), .dout11_real(dout_real[11]), .dout11_imag(dout_imag[11]),
        .dout12_real(dout_real[12]), .dout12_imag(dout_imag[12]), .dout13_real(dout_real[13]), .dout13_imag(dout_imag[13]),
        .dout14_real(dout_real[14]), .dout14_imag(dout_imag[14]), .dout15_real(dout_real[15]), .dout15_imag(dout_imag[15]),
        .dout16_real(dout_real[16]), .dout16_imag(dout_imag[16]), .dout17_real(dout_real[17]), .dout17_imag(dout_imag[17]),
        .dout18_real(dout_real[18]), .dout18_imag(dout_imag[18]), .dout19_real(dout_real[19]), .dout19_imag(dout_imag[19]),
        .dout20_real(dout_real[20]), .dout20_imag(dout_imag[20]), .dout21_real(dout_real[21]), .dout21_imag(dout_imag[21]),
        .dout22_real(dout_real[22]), .dout22_imag(dout_imag[22]), .dout23_real(dout_real[23]), .dout23_imag(dout_imag[23]),
        .dout24_real(dout_real[24]), .dout24_imag(dout_imag[24]), .dout25_real(dout_real[25]), .dout25_imag(dout_imag[25]),
        .dout26_real(dout_real[26]), .dout26_imag(dout_imag[26]), .dout27_real(dout_real[27]), .dout27_imag(dout_imag[27]),
        .dout28_real(dout_real[28]), .dout28_imag(dout_imag[28]), .dout29_real(dout_real[29]), .dout29_imag(dout_imag[29]),
        .dout30_real(dout_real[30]), .dout30_imag(dout_imag[30]), .dout31_real(dout_real[31]), .dout31_imag(dout_imag[31])
    );
integer i;
    // Test vectors
    initial begin
        // Load the input signal
        $readmemh("output/input.txt", din);
        // Wait for the FFT to complete
        #1000;
    
        // Check the output
        $readmemh("output/final_real.txt", expected_real);
        $readmemh("output/final_imag.txt", expected_imag);

        for (i = 0; i < 32; i = i + 1) begin
            if (dout_real[i] !== expected_real[i] || dout_imag[i] !== expected_imag[i]) begin
                $display("Mismatch at index %d: expected (%h, %h), got (%h, %h)",
                    i, expected_real[i], expected_imag[i], dout_real[i], dout_imag[i]);
            end
        end
        $display("Comparison complete");
        $finish;
    end
    
    endmodule