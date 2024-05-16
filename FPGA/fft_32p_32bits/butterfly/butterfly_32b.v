module butterfly_32b (
    input [31:0] din0_real,
    input [31:0] din0_imag,
    input [31:0] din1_real,
    input [31:0] din1_imag,
    input [31:0] w_real,
    input [31:0] w_imag,
    output [31:0] dout0_real,
    output [31:0] dout0_imag,
    output [31:0] dout1_real,
    output [31:0] dout1_imag
);

wire [31:0]din1_w_real;
wire [31:0]din1_w_imag;

assign din1_w_real = ((din1_real * w_real) ) - ((din1_imag * w_imag) );
assign din1_w_imag = ((din1_real * w_imag) ) + ((din1_imag * w_real) );

assign dout0_real = din0_real + din1_w_real;
assign dout0_imag = din0_imag + din1_w_imag;
assign dout1_real = din0_real - din1_w_real;
assign dout1_imag = din0_imag - din1_w_imag;

endmodule