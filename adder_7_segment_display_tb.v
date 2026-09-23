`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2026 10:03:50 AM
// Design Name: 
// Module Name: adder_7_segment_display_tb
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


module adder_7_segment_display_tb;
reg [3:0] A; //input
reg [3:0] B; //input
reg CI; //input
reg SEL; //input
wire [6:0] DIS; //output
wire [3:0] AN; //output

// Instantiate original module (named DUT {device under test}) 
adder_7_segment_display uut (A, B, CI, SEL, DIS, AN);

initial begin 
    #10 A=4'b0101;B=4'b0011;CI=0;SEL=0;
    #10 A=4'b0101;B=4'b0011;CI=0;SEL=1;
    #10 A=4'b0000;B=4'b0000;CI=0;SEL=0;
    
    #10 A=4'b0010;B=4'b0001;CI=0;SEL=0;
    #10 A=4'b0010;B=4'b0001;CI=0;SEL=1;
    #10 A=4'b0000;B=4'b0000;CI=0;SEL=0;
    
    #10 A=4'b1111;B=4'b0001;CI=0;SEL=0;
    #10 A=4'b1111;B=4'b0001;CI=0;SEL=1;
    #10 A=4'b0000;B=4'b0000;CI=0;SEL=0;
	#10 $stop;

end 
endmodule