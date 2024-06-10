// a test bench for the RISC_complete module
`timescale 1ns / 1ps
module RISC_complete_tb;
// internal signals declarations
parameter clk_period = 30;
parameter delay_factor = 2;
reg clk, reset_n;
reg ext_inst_we, ext_data_we, test_normal;
reg [15:0 ] ext_addr, ext_data;
wire [15:0 ] mem_out, OutR;
wire done;
integer i;

// Unit Under Test port map
RISC_complete uut (
. clk(clk) , .rst(reset_n) ,
.test_normal(test_normal) , .done(done) ,
.ext_inst_we(ext_inst_we), .ext_data_we(ext_data_we),
.ext_data(ext_data) , .ext_addr(ext_addr) ,
.mem_out(mem_out) , .OutR(OutR ) ) ;

// generate the clock signal
always begin
#(clk_period/ 2 ) clk <= 1 'b0;
#(clk_period/ 2 ) clk <= 1 'b1;
end

initial begin
ext_inst_we=0;
ext_data_we=0;
reset_n <=1'b0; test_normal = 1 'b0;
repeat (20 ) @(posedge clk)
#(clk_period/delay_factor) reset_n <= 1 'b0;

//------------------------------------Reference test----------------------------------------
	write_mem_inst(16 'h0,16 'b0001_0000_0010_0101 ) ; // LLI R0,#25
	write_mem_inst(16 'h1,16 'b0000_1000_0110_0011 ) ; // LHI R0,#63
	write_mem_inst(16 'h2,16 'b1110_0000_0000_0000 ) ; // OUT R0 (6325H)
	write_mem_inst(16 'h3,16 'b0001_1001_0000_0000 ) ; // LDR R1,R0,#0
	write_mem_inst(16 'h4,16 'b0001_1010_0000_0001 ) ; // LDR R2,R0,#1
	write_mem_inst(16 'h5,16 'b1110_0000_0010_0000 ) ; // OUT R1 (47H)	
	
	write_mem_inst(16 'h7,16 'b0000_0011_0010_1000 ) ; // ADD R3,R1,R2
	write_mem_inst(16 'h8,16 'b1110_0000_0110_0000 ) ; // OUT R3 (D0H)
	write_mem_inst(16 'h9,16 'b0000_0011_0010_1010 ) ; // SUB R3,R1,R2
	write_mem_inst(16 'hA,16 'b1110_0000_0110_0000 ) ; // OUT R3 (FFBEH)
	write_mem_inst(16 'hB,16 'b1110_0000_0000_0001 ) ; // HLT
	write_mem_data(16 'h25,16 'h47 ) ; // data (25h, 47h)
	write_mem_data(16 'h26,16 'h89 ) ; // data (26h, 89h)

//------------------------------Forwarding test--------------------------------------------
////Case 1 ADDI -> ADDI
//	write_mem_inst(16 'h0,16 'b0001_0000_0010_0101 ) ; // LLI R0,#25

//	write_mem_inst(16 'h1,16 'b00111_000_000_00001 ) ; // ADDI R0,R0,1    //Forwarding rm 01
//	write_mem_inst(16 'h2,16 'b1110_0000_0000_0000 ) ; // OUT R0 (26)     //Forwarding rm 01
////Case 2 ADD -> OutR -> SUB
//	write_mem_inst(16 'h3,16 'b0001_0000_0010_0101 ) ; // LLI R0,#25
//	write_mem_inst(16 'h4,16 'b0000_1000_0110_0011 ) ; // LHI R0,#63
//	write_mem_inst(16 'h5,16 'b1110_0000_0000_0000 ) ; // OUT R0 (6325H)
//	write_mem_inst(16 'h6,16 'b0001_1001_0000_0000 ) ; // LDR R1,R0,#0
//	write_mem_inst(16 'h7,16 'b0001_1010_0000_0001 ) ; // LDR R2,R0,#1
//	write_mem_inst(16 'h8,16 'b1110_0000_0010_0000 ) ; // OUT R1 (47H)
//	
//	write_mem_inst(16 'h9,16 'b0000_0011_0010_1000 ) ; // ADD R3,R1,R2   //Forwarding rm 11 rn 10
//	write_mem_inst(16 'ha,16 'b1110_0000_0110_0000 ) ; // OUT R3 (D0H)   //Forwarding rm 01
//	write_mem_inst(16 'hb,16 'b0000_0011_0010_1010 ) ; // SUB R3,R1,R2

//	write_mem_inst(16 'hc,16 'b1110_0000_0110_0000 ) ; // OUT R3 (FFBEH)	//Forwarding rm 01
////Case 3 MOV -> OutR -> OutR -> MOV
//	write_mem_inst(16 'hd,16 'b00010_111_00000110 ) ; // LLI R7,#6
//	write_mem_inst(16 'he,16 'b1110_0000_0000_0000 ) ; // OUT R0 (6325H)
//	write_mem_inst(16 'hf,16 'b1110_0000_0000_0000 ) ; // OUT R0 (6325H)
//	write_mem_inst(16 'h10,16 'b0101_1110_1110_0000 ) ; // MOV R6,R7
//	write_mem_inst(16 'h11,16 'b1110_0000_1100_0000 ) ; // OUT R6 (6)
//	
////Special case 1 STR,LHI
//	write_mem_inst(16 'h12,16 'b00010_100_00000110 ) ;  // LLI R4,#6
//	write_mem_inst(16 'h13,16 'b00101_100_101_00001 ) ; // STR R4 [R5=0,+1]
//	write_mem_inst(16 'h14,16 'b0000_1100_0110_0011 ) ;  // LHI R4,#63
//	write_mem_inst(16 'h15,16 'b1110_0000_1000_0000 ) ; // OUT R4 (6306)
////Special case 2 LTR
//	write_mem_inst(16 'h16,16 'b0001_1101_0000_0000 ) ; // LDR R5,R0,#0
//	write_mem_inst(16 'h17,16 'b0000_0101_1011_0100 ) ; // ADD R5,R5,R5
//	write_mem_inst(16 'h18,16 'b1110_0000_1010_0000 ) ; // OUT R5 (8e)
//	write_mem_inst(16 'h19,16 'b1110_0000_0000_0001 ) ; // HLT
//
//   write_mem_data(16 'h25,16 'h47 ) ; // data (25h, 47h)
//   write_mem_data(16 'h26,16 'h89 ) ; // data (26h, 89h)

//------------------------------Jump and Link test--------------------------------------------
////JAL Rm
//	write_mem_inst(16'd0,16 'b0001_0000_0000_1010 ) ; // LLI R0,#10
//	write_mem_inst(16'd1,16 'b0001_0001_0000_0000 ) ; // LLI R1,#0
//	write_mem_inst(16'd2,16'b10010_010_000_00000 ) ; // JAL R2 (R0)
//	
//	write_mem_inst(16 'd9,16 'b1110_0010_0000_0000 ) ; // JR R2
//	
//	write_mem_inst(16 'd10,16 'b1110_0000_0000_0000 ) ; // OUT R0 (10)
//	write_mem_inst(16'd11,16 'b00111_001_001_00001 ) ; // ADDI R1,R1,1
//	write_mem_inst(16'd12,16'b00110_011_001_000_01 ) ;  // CMP R1,R0
//	write_mem_inst(16'd13,16'b1100_0001_11111100 ) ;   // BNE -4
//	
////JAL Label
//	write_mem_inst(16'd14,16 'b0001_0000_0001_0100 ) ; // LLI R0,#20
//	write_mem_inst(16'd15,16 'b0001_0001_0000_0000 ) ; // LLI R1,#0
//	write_mem_inst(16'd16,16 'b10001_010_000_11000 ) ; // JAL R2 (24)
//	
//	write_mem_inst(16 'd39,16 'b1110_0010_0000_0000 ) ; // JR R2
//	
//	write_mem_inst(16 'd40,16 'b1110_0000_0000_0000 ) ; // OUT R0 (10)
//	write_mem_inst(16'd41,16 'b00111_001_001_00001 ) ; // ADDI R1,R1,1
//	write_mem_inst(16'd42,16'b00110_011_001_000_01 ) ;  // CMP R1,R0
//	write_mem_inst(16'd43,16'b1100_0001_11111100 ) ;   // BNE -4
////JMP
//	write_mem_inst(16'd44,16 'b1000_0000_0000_0000 ) ; // JMP 0

//----------------1. Find the minimum and maximum from two numbers in memory.--------------
//	write_mem_inst(16 'h0,16 'b0001_0000_0010_0101 ) ; // LLI R0,#25
//	write_mem_inst(16 'h1,16 'b0000_1000_0110_0011 ) ; // LHI R0,#63
//	write_mem_inst(16 'h2,16 'b1110_0000_0000_0000 ) ; // OUT R0 (6325H)
//	write_mem_inst(16 'h3,16 'b0001_1001_0000_0000 ) ; // LDR R1,R0,#0
//	write_mem_inst(16 'h4,16 'b0001_1010_0000_0001 ) ; // LDR R2,R0,#1
//	write_mem_inst(16 'h5,16 'b1110_0000_0010_0000 ) ; // OUT R1 (47H)
//	write_mem_inst(16 'h6,16 'b1110_0000_0100_0000 ) ; // OUT R2 (89H)
//	
//	write_mem_inst(16'h7,16'b00110_011_010_001_01 ) ;  // CMP R2,R1
//	write_mem_inst(16'h8,16'b1100_0010_0000_0110 ) ;   // BCS +6
//	write_mem_inst(16'h9,16'b01011_011_001_00000 ) ;   // MOV R3,R1
//	write_mem_inst(16'hA,16'b01011_100_010_00000 ) ;   // MOV R4,R2
//	write_mem_inst(16'hB,16 'b11100_000_011_00000 ) ;  // OUT R3 ()
//	write_mem_inst(16'hC,16 'b11100_000_100_00000 ) ;  // OUT R4 ()
//	write_mem_inst(16'hD,16'b1110_0000_0000_0001 ) ;   // HLT
//	write_mem_inst(16'hE,16'b01011_011_010_00000 ) ;   // MOV R3,R2
//	write_mem_inst(16'hF,16'b01011_100_001_00000 ) ;   // MOV R4,R1
//	write_mem_inst(16'h10,16 'b11100_000_011_00000 ) ; // OUT R3 ()
//	write_mem_inst(16'h11,16 'b11100_000_100_00000 ) ; // OUT R4 ()
//	write_mem_inst(16'h12,16'b1110_0000_0000_0001 ) ;  // HLT
//
// write_mem_data(16 'h25,16 'h8 ) ; // data (25h, 8h)
// write_mem_data(16 'h26,16 'h288 ) ; // data (26h, 288h)

//---2. Add two numbers in memory and store the result in another memory location.---------
//	write_mem_inst(16 'h0,16 'b0001_0000_0010_0101 ) ; // LLI R0,#25
//	write_mem_inst(16 'h1,16 'b0000_1000_0110_0011 ) ; // LHI R0,#63
//	write_mem_inst(16 'h2,16 'b1110_0000_0000_0000 ) ; // OUT R0 (6325H)
//	write_mem_inst(16 'h3,16 'b0001_1001_0000_0000 ) ; // LDR R1,R0,#0
//	write_mem_inst(16 'h4,16 'b0001_1010_0000_0001 ) ; // LDR R2,R0,#1
//	write_mem_inst(16 'h5,16 'b1110_0000_0010_0000 ) ; // OUT R1 (47H)	
//	write_mem_inst(16 'h6,16 'b1110_0000_0100_0000 ) ; // OUT R2 (89H)
//	
//	write_mem_inst(16 'h7,16 'b00111_011_001_00011 ) ; // ADDI R3,R1,3
//	write_mem_inst(16 'h8,16 'b1110_0000_0110_0000 ) ; // OUT R3 (4AH)
//	write_mem_inst(16 'h9,16 'b00101_011_101_00101 ) ; // STR R3 [(R5=0)+5]
//	
//	write_mem_inst(16 'hA,16 'b01000_100_010_01001 ) ; // SUBI R4,R2,9
//	write_mem_inst(16 'hB,16 'b1110_0000_1000_0000 ) ; // OUT R4 (80H)
//	write_mem_inst(16 'hC,16 'b00101_100_101_00110 ) ; // STR R4 [(R5=0)+6]
//	write_mem_inst(16 'hD,16 'b1110_0000_0000_0001 ) ; // HLT
//	
//	write_mem_data(16 'h25,16 'h47 ) ; // data (25h, 47h)
//	write_mem_data(16 'h26,16 'h89 ) ; // data (26h, 89h)

//---3. Add ten numbers in consecutive memory locations.-----------------------------------
//	write_mem_inst(16'h0,16 'b0001_0000_0000_1010 ) ; // LLI R0,#10
//	write_mem_inst(16'h1,16 'b00101_001_001_00000 ) ; // STR R1 [(R1)+0]
//	write_mem_inst(16'h2,16 'b00111_001_001_00001 ) ; // ADDI R1,R1,1
//	write_mem_inst(16'h3,16'b00110_011_001_000_01 ) ;  // CMP R1,R0
//	write_mem_inst(16'h4,16'b1100_0001_1111_1101 ) ;   // BNE -3
//	write_mem_inst(16'h5,16 'b1110_0000_0000_0001 ) ; // HLT

//---4. Mov a memory block of N words from one place to another.---------------------------
//	write_mem_inst(16'h0,16 'b0001_0000_0000_1010 ) ; // LLI R0,#10
//	write_mem_inst(16 'h1,16 'b0001_0110_0010_0101 ) ; // LLI R6,#25
//	write_mem_inst(16 'h2,16 'b00011_111_110_00000 ) ; // LDR R7,[R6,+0]
//	write_mem_inst(16 'h3,16 'b00101_111_001_00000 ) ; // STR R7 [R1,+0]
//	
//	write_mem_inst(16 'h4,16 'b00111_110_110_00001 ) ; // ADDI R6,R6,1
//	write_mem_inst(16 'h5,16 'b00111_001_001_00001 ) ; // ADDI R1,R1,1
//	write_mem_inst(16'h6,16'b00110_011_000_001_01 ) ;  // CMP R0,R1
//	write_mem_inst(16'h7,16'b1100_0001_1111_1011 ) ;   // BNE -5
//	write_mem_inst(16'h8,16 'b1110_0000_0000_0001 ) ;  // HLT
//	
//	write_mem_data(16 'h25,16 'd25 ) ; // data (25h, 25h)
//	write_mem_data(16 'h26,16 'd35 ) ; // data (26h, 35h)
//	write_mem_data(16 'h27,16 'd45 ) ; // data (27h, 45h)
//	write_mem_data(16 'h28,16 'd55 ) ; // data (28h, 55h)
//	write_mem_data(16 'h29,16 'd65 ) ; // data (29h, 65h)
//	write_mem_data(16 'h2a,16 'd75 ) ; // data (2ah, 75h)
//	write_mem_data(16 'h2b,16 'd85 ) ; // data (2bh, 85h)
//	write_mem_data(16 'h2c,16 'd95 ) ; // data (2ch, 95h)
//	write_mem_data(16 'h2d,16 'd105 ) ; // data (2dh, 105h)
//	write_mem_data(16 'h2e,16 'd115 ) ; // data (2eh, 115h)
//

//	write_mem_inst(16 'h5,16 'b0101_1010_0000_0000 ) ; // MOV R2,R0
//	write_mem_inst(16 'h6,16 'b0101_1011_0000_0000 ) ; // MOV R3,R0
//	write_mem_inst(16 'h7,16 'b0101_1100_0000_0000 ) ; // MOV R4,R0

// delay one clock to ensure the proper write to memory
@(posedge clk) #(clk_period/delay_factor) begin
ext_inst_we = 1 'b0;
ext_data_we = 1 'b0;
end
// read data from the dual-port memory
test_normal = 1 'b1;
for (i = 0; i < 200; i = i + 1)
@(posedge clk) #(clk_period/delay_factor) ext_addr = i;
test_normal = 1 'b0;
// start the cpu to execute the program in memory
reset_n = 1 'b1;
repeat (9 ) @(posedge clk)
#(clk_period/delay_factor) reset_n = 1 'b0;
reset_n = 1 'b1;
wait (done ) ;end

always@(done)begin
if(done)begin
ext_data_we=1;
i=0;
end end

task write_mem_inst;
input [15:0 ] addr, data;
begin
@(posedge clk) #(clk_period/delay_factor) begin
test_normal = 1 'b1;
ext_inst_we = 1 'b1; ext_addr = addr;
ext_data = data;
end
end
endtask

task write_mem_data;
input [15:0 ] addr, data;
begin
@(posedge clk) #(clk_period/delay_factor) begin
test_normal = 1 'b1;
ext_data_we = 1 'b1; ext_addr = addr;
ext_data = data;
end
end

endtask

initial #10000 $finish ;
initial begin
$monitor ( $realtime ,"ns %h %h %h %h %h %h %h %h %h \n" ,
clk, reset_n, ext_inst_we, ext_data_we, test_normal, ext_addr,
ext_data, mem_out, OutR, done ) ;

end
endmodule