`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/24 21:03:49
// Design Name: 
// Module Name: absval_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module DW01_absval_tb;

// Parameters
parameter width = 16 ;
//Ports
reg [width-1 : 0] A;
wire [width-1 : 0] ABSVAL;

DW01_absval  DW01_absval_inst (
  .A(A),
  .ABSVAL(ABSVAL)
);

//always #5  clk = ! clk ;

integer i;
initial begin
    for (i=0;i<100;i=i+1)begin
        A=$random%10001;
        #5;
    end
end
endmodule
