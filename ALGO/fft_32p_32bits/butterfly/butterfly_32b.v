`timescale 1ns / 1ps
module butterfly_32b (
    input signed [31:0] din0_real,
    input signed [31:0] din0_imag,
    input signed [31:0] din1_real,
    input signed [31:0] din1_imag,
    input signed [31:0] w_real,
    input signed [31:0] w_imag,
    output signed [31:0] dout0_real,
    output signed [31:0] dout0_imag,
    output signed [31:0] dout1_real,
    output signed [31:0] dout1_imag
);

wire signed[64:0] din1_w_real_full;
wire signed[64:0] din1_w_imag_full;

wire [31:0] dout0_real_temp;
wire [31:0] dout0_imag_temp;

wire signed[31:0] din1_w_real;
wire signed[31:0] din1_w_imag;

assign din1_w_real_full = ((din1_real * w_real) ) - ((din1_imag * w_imag) );
assign din1_w_imag_full = ((din1_real * w_imag) ) + ((din1_imag * w_real) );

assign din1_w_real = din1_w_real_full[47:16] + (din1_w_real_full[15:0] >= 16'd16384 ? 1 : 0);
assign din1_w_imag = din1_w_imag_full[47:16] + (din1_w_imag_full[15:0] >= 16'd16384 ? 1 : 0);

assign dout0_real = din0_real + din1_w_real;
assign dout0_imag = din0_imag + din1_w_imag;
assign dout1_real = din0_real - din1_w_real;
assign dout1_imag = din0_imag - din1_w_imag;

endmodule

