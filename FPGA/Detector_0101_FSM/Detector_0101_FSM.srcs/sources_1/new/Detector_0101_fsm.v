`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/10 14:33:31
// Design Name: 
// Module Name: Detector_0101_fsm
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
module Detector_0101_fsm(
	input in,clk,rst,
	output out);

parameter A=2'b00,B=2'b01,C=2'b10,D=2'b11;
reg [1:0]ps;

always@(posedge clk,negedge rst)
	if(!rst)ps=A; else ps = ns(ps,in);

function [1:0] ns(input[1:0]ps,input x);
reg [1:0] next_state;
begin
		case (ps)
			A : if(!x) next_state = B;else next_state=A;
			B : if(x)  next_state = C;else next_state=B;
			C : if(!x) next_state = D;else next_state=A;
			D : if(x)  next_state = C;else next_state=B;
			default next_state = A;
		endcase
	ns = next_state;
end
 endfunction

assign out =(ps==D && in==1);

endmodule