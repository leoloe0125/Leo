`timescale 1ns / 1ps

module fft_testbench;

    reg [31:0] din [0:31];
    wire [31:0] dout_real [0:31];
    wire [31:0] dout_imag [0:31];
    reg [31:0]expected_real[0:31];reg [31:0]expected_imag[0:31];
    reg [2:0]test_mode;
reg clk,reset;
    // Instantiate the FFT module
    fft_32p_32bits fft (
        .clk(clk), .reset(reset),
        .din0(din[0]), .din1(din[16]), .din2(din[8]), .din3(din[24]), .din4(din[4]), .din5(din[20]), .din6(din[12]), .din7(din[28]),
        .din8(din[2]), .din9(din[18]), .din10(din[10]), .din11(din[26]), .din12(din[6]), .din13(din[22]), .din14(din[14]), .din15(din[30]),
        .din16(din[1]), .din17(din[17]), .din18(din[9]), .din19(din[25]), .din20(din[5]), .din21(din[21]), .din22(din[13]), .din23(din[29]),
        .din24(din[3]), .din25(din[19]), .din26(din[11]), .din27(din[27]), .din28(din[7]), .din29(din[23]), .din30(din[15]), .din31(din[31]),
        .test_mode(test_mode),
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

    function [31:0] abs;
    input [31:0] x;
    begin
        if (x[31] == 1'b1) 
            abs = -x;
        else 
            abs = x;
    end
    endfunction

    integer i;
    integer pass = 1;
    integer file;
    integer file_real;
    integer file_imag;
    parameter ERROR_TOLERANCE = 100; 
    real total_error_real = 0;
    real total_error_imag = 0;
    real average_error_real;
    real average_error_imag;

integer test_time =400;
always #(test_time/2) clk = ~clk;
initial begin
	$readmemh("input.hex", din);
end
    initial begin
        clk = 0;

        // Load the input signal
        test_mode=0;
        // Wait for the FFT to complet
#test_time

    	file_real = $fopen("tb_output_real.txt", "w");
        file_imag = $fopen("tb_output_imag.txt", "w");
        $display("test_mode= %d",test_mode);
        // Check the output
        $readmemh("stage_5_real.hex", expected_real);
        $readmemh("stage_5_imag.hex", expected_imag);
        for (i = 0; i < 32; i = i + 1) begin
            //total_error_real = total_error_real + abs($signed(dout_real[i]) - $signed(expected_real[i]));
            //total_error_imag = total_error_imag + abs($signed(dout_imag[i]) - $signed(expected_imag[i]));
            $fwrite(file_real, "%h\n", dout_real[i]);
            $fwrite(file_imag, "%h\n", dout_imag[i]);
            if (($signed(dout_real[i]) - $signed(expected_real[i]) > ERROR_TOLERANCE) || 
                ($signed(expected_real[i]) - $signed(dout_real[i]) > ERROR_TOLERANCE) ||
                ($signed(dout_imag[i]) - $signed(expected_imag[i]) > ERROR_TOLERANCE) ||
                ($signed(expected_imag[i]) - $signed(dout_imag[i]) > ERROR_TOLERANCE)) begin
                $display("Mismatch in stage5 at index %d: expected (%h, %h), got (%h, %h)",
                    i, expected_real[i], expected_imag[i], dout_real[i], dout_imag[i]);
                pass = 0;
            end
            else begin
                $display("Match in stage5 at index %d: expected (%h, %h), got (%h, %h)",
                    i, expected_real[i], expected_imag[i], dout_real[i], dout_imag[i]);
            end
        end

        if(pass == 1) begin
            $display("PASS");
        end
        else begin
            $display("FAIL");
        end
        //$display("Average error for real part: %f", average_error_real);
        //$display("Average error for imaginary part: %f", average_error_imag);
$finish;

    end

endmodule
