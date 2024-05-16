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

        // Open the files
        $readmemh("din0_real.txt", din0_real_mem);
        $readmemh("din0_imag.txt", din0_imag_mem);
        $readmemh("din1_real.txt", din1_real_mem);
        $readmemh("din1_imag.txt", din1_imag_mem);
        $readmemh("weight_real.txt", weight_real_mem);
        $readmemh("weight_imag.txt", weight_imag_mem);

        // Read expected outputs
        $readmemh("expected_y0_real.txt", expected_y0_real);
        $readmemh("expected_y0_imag.txt", expected_y0_imag);
        $readmemh("expected_y1_real.txt", expected_y1_real);
        $readmemh("expected_y1_imag.txt", expected_y1_imag);
    end

    initial begin
        for (i = 0; i < 10; i = i + 1) begin
            // Wait for some time to let the simulation run
            #100;
            din0_real=din0_real_mem[i];
            din0_imag=din0_imag_mem[i];
            din1_real=din1_real_mem[i];
            din1_imag=din1_imag_mem[i];
            weight_real=weight_real_mem[0];
            weight_imag=weight_imag_mem[0];

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
        end

        // Finish the simulation
        $finish;
    end

endmodule