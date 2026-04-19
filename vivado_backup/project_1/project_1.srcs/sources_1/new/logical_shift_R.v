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


module logical_shift_R(
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
   assign or_value =  |B[15:4]; 
    assign c0  = A;                                // Shift by 0
   assign c1  = {1'b0, A[15:1]};                  // Shift by 1
   assign c2  = {2'b0, A[15:2]};                  // Shift by 2
   assign c3  = {3'b0, A[15:3]};                  // Shift by 3
   assign c4  = {4'b0, A[15:4]};                  // Shift by 4
   assign c5  = {5'b0, A[15:5]};                  // Shift by 5
   assign c6  = {6'b0, A[15:6]};                  // Shift by 6
   assign c7  = {7'b0, A[15:7]};                  // Shift by 7
   assign c8  = {8'b0, A[15:8]};                  // Shift by 8
   assign c9  = {9'b0, A[15:9]};                  // Shift by 9
   assign c10 = {10'b0, A[15:10]};                // Shift by 10
   assign c11 = {11'b0, A[15:11]};                // Shift by 11
   assign c12 = {12'b0, A[15:12]};                // Shift by 12
   assign c13 = {13'b0, A[15:13]};                // Shift by 13
   assign c14 = {14'b0, A[15:14]};                // Shift by 14
   assign c15 = {15'b0, A[15]};
    
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
    assign zero = ~|S;
    
endmodule
