`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2026 12:49:44 PM
// Design Name: 
// Module Name: arithmetic_shift_R
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


module logical_shift_L(
    input wire[15:0] A,
    input wire[15:0] B,
    input wire[3:0] ALUCtrl,
    output wire overflow,
    output wire zero,
    output wire[15:0] S
    );
/*
    or(or_value, B[5],0);
    or(or_value, B[6],or_value);
    or(or_value, B[6],or_value);
     or(or_value, B[7],or_value);
   or(or_value, B[8],or_value);
   or(or_value, B[9],or_value);
   or(or_value, B[10],or_value);
    or(or_value, B[11],or_value);
    or(or_value, B[12],or_value);
    or(or_value, B[13],or_value);
    or(or_value, B[14],or_value);
    or(or_value, B[15],or_value);
   */
   wire [15:0] c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;
   wire or_value;
   //assign or_value =  |B[15:4]; 
   or g1(or_value, B[4], B[5], B[6], B[7], B[8], 
                B[9], B[10], B[11], B[12], B[13], 
                B[14], B[15]);
    //c0 is when b=0
     assign c0 = A;
     //c0 is when b=1
     assign c1 = {A[14:0], 1'b0};
     
     //c0 is when b=2
     assign c2 = {A[13:0], 2'b00};
     assign c3 = {A[12:0], 3'b000};
     assign c4 = {A[11:0], 4'b0000};
     assign c5 = {A[10:0], 5'b00000};
     assign c6 = {A[9:0], 6'b000000};
     assign c7 = {A[8:0], 7'b0000000};
     assign c8 = {A[7:0], 8'b00000000};
     assign c9 = {A[6:0], 9'b000000000};
     assign c10 = {A[5:0], 10'b0000000000};
     assign c11 = {A[4:0], 11'b00000000000};
     assign c12 = {A[3:0], 12'b000000000000};
     assign c13 = {A[2:0], 13'b000000000000};
     assign c14 = {A[1:0], 14'b00000000000000};
     assign c15 = {A[0], 15'b0000000000000000};

    
    wire[15:0] mux_output;
    mux16bit u_mux(
               .A(c0), .B(c1), .C(c2), .D(c3), 
               .E(c4), .F(c5), .G(c6), .H(c7),
               .I(c8), .J(c9), .K(c10), .L(c11),
               .M(c12), .N(c13), .O(c14), .P(c15),
               .S0(B[0]), .S1(B[1]), .S2(B[2]), .S3(B[3]),
               .Q(mux_output)
    );
    mux2bit u_2mux(.A(mux_output),.B(16'h0000),.S(or_value),.Q(S));
    assign overflow = 0;
    //assign zero = ~|S;
    wire or_all;
    or or_g1(or_all, S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7],
          S[8], S[9], S[10], S[11], S[12], S[13], S[14], S[15]);
    not or_g2(zero, or_all);
    
endmodule
