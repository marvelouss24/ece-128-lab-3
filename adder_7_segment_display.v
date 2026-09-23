`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 09:28:12 PM
// Design Name: 
// Module Name: adder_7_segment_display
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

module BCD_to_7_segment_display(
    input [3:0] A,
    output reg [6:0] SEG
    );
    
    always @(*)
    begin
        case(A)
            4'd0 : SEG = 7'b0000001;
            4'd1 : SEG = 7'b1001111;
            4'd2 : SEG = 7'b0010010;
            4'd3 : SEG = 7'b0000110;
            4'd4 : SEG = 7'b1001100;
            4'd5 : SEG = 7'b0100100;
            4'd6 : SEG = 7'b0100000;
            4'd7 : SEG = 7'b0001111;
            4'd8 : SEG = 7'b0000000;
            4'd9 : SEG = 7'b0000100;
            default : SEG = 7'b1111111;
        endcase
    end
endmodule    

module full_adder(
    input A,
    input B,
    input CI,
    output SUM,
    output CO
);

wire a1, a2, a3;

and (a1, B, CI);
and (a2, A, CI);
and (a3, A, B);

xor (SUM, A, B, CI);
or (CO, a1, a2, a3);

endmodule

module ripple_carry_adder(
    input [3:0] A,
    input [3:0] B,
    input CI,
    output [3:0] SUM,
    output CO
);

wire c1, c2, c3;
full_adder bit0(A[0], B[0], CI, SUM[0], c1);
full_adder bit1(A[1], B[1], c1, SUM[1], c2);
full_adder bit2(A[2], B[2], c2, SUM[2], c3);
full_adder bit3(A[3], B[3], c3, SUM[3], CO);
    
endmodule

module mux_2to1(
input [3:0] I0,
input [3:0] I1,
input S,
output [3:0] B
);

assign B = S ? I1: I0;

endmodule

module adder_7_segment_display(
input [3:0] A,
input [3:0] B,
input CI,
input SEL,
output [6:0] DIS,
output [3:0] AN
);

wire [3:0] SUM;
wire CO;

ripple_carry_adder RCA(A, B, CI, SUM, CO);

wire [3:0] CO_ext;
wire [3:0] BCD_in;
assign CO_ext = {3'b000, CO};
mux_2to1 mux(SUM, CO_ext, SEL, BCD_in);

BCD_to_7_segment_display display(BCD_in, DIS);

assign AN = 4'b1110;

endmodule
