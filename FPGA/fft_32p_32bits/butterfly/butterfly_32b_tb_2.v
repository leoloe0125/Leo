`timescale 1ns / 1ps

module butterfly_32b_tb;

    reg [31:0] din0_real_mem[9:0], din0_imag_mem[9:0], din1_real_mem[9:0], din1_imag_mem[9:0];
    reg [31:0] weight_real_mem[9:0], weight_imag_mem[9:0];
    wire [31:0] dout0_real, dout0_imag, dout1_real, dout1_imag;
    reg [31:0] din0_real, din0_imag, din1_real, din1_imag;
    reg [31:0] weight_real, weight_imag;
    reg [31:0] expected_y0_real[9:0], expected_y0_imag[9:0], expected_y1_real[9:0], expected_y1_imag[9:0];

    // Instantiate the Unit Under Test (UUT)
    butterfly_32b uut (
        .din0_real(din0_real), .din0_imag(din0_imag),
        .din1_real(din1_real), .din1_imag(din1_imag),
        .w_real(weight_real), .w_imag(weight_imag),
        .dout0_real(dout0_real), .dout0_imag(dout0_imag),
        .dout1_real(dout1_real), .dout1_imag(dout1_imag)
    );

    integer i;
    initial begin
            // Wait for some time to let the simulation run
            #100;
            din0_real='ha14e2eba;
            din0_imag=0;
            din1_real='hfba4ee03;
            din1_imag=0;
            weight_real=0;
            weight_imag=0;

            #100;
            // Compare the outputs
            if (dout0_real == expected_y0_real[i] && dout0_imag == expected_y0_imag[i] &&
                dout1_real == expected_y1_real[i] && dout1_imag == expected_y1_imag[i]) begin
                $display("Test %d passed!", i);
            end else begin
                $display("Test %d failed!", i);
                $display("Expected y0_real: %h, got: %h", expected_y0_real[i], dout0_real);
                $display("Expected y0_imag: %h, got: %h", expected_y0_imag[i], dout0_imag);
                $display("Expected y1_real: %h, got: %h", expected_y1_real[i], dout1_real);
                $display("Expected y1_imag: %h, got: %h", expected_y1_imag[i], dout1_imag);
            end
            $finish;
        end

        // Finish the simulation


endmodule