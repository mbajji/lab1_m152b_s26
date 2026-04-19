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


module arithmetic_shift_L(
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
    /* not structual
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
*/
    // c0
    buf (c0[15], A[15]); buf (c0[14], A[14]); buf (c0[13], A[13]); buf (c0[12], A[12]); buf (c0[11], A[11]); buf (c0[10], A[10]); buf (c0[9], A[9]); buf (c0[8], A[8]); buf (c0[7], A[7]); buf (c0[6], A[6]); buf (c0[5], A[5]); buf (c0[4], A[4]); buf (c0[3], A[3]); buf (c0[2], A[2]); buf (c0[1], A[1]); buf (c0[0], A[0]);
    
    // c1
    buf (c1[15], A[14]); buf (c1[14], A[13]); buf (c1[13], A[12]); buf (c1[12], A[11]); buf (c1[11], A[10]); buf (c1[10], A[9]); buf (c1[9], A[8]); buf (c1[8], A[7]); buf (c1[7], A[6]); buf (c1[6], A[5]); buf (c1[5], A[4]); buf (c1[4], A[3]); buf (c1[3], A[2]); buf (c1[2], A[1]); buf (c1[1], A[0]); buf (c1[0], 1'b0);
    
    // c2
    buf (c2[15], A[13]); buf (c2[14], A[12]); buf (c2[13], A[11]); buf (c2[12], A[10]); buf (c2[11], A[9]); buf (c2[10], A[8]); buf (c2[9], A[7]); buf (c2[8], A[6]); buf (c2[7], A[5]); buf (c2[6], A[4]); buf (c2[5], A[3]); buf (c2[4], A[2]); buf (c2[3], A[1]); buf (c2[2], A[0]); buf (c2[1], 1'b0); buf (c2[0], 1'b0);
    
    // c3
    buf (c3[15], A[12]); buf (c3[14], A[11]); buf (c3[13], A[10]); buf (c3[12], A[9]); buf (c3[11], A[8]); buf (c3[10], A[7]); buf (c3[9], A[6]); buf (c3[8], A[5]); buf (c3[7], A[4]); buf (c3[6], A[3]); buf (c3[5], A[2]); buf (c3[4], A[1]); buf (c3[3], A[0]); buf (c3[2], 1'b0); buf (c3[1], 1'b0); buf (c3[0], 1'b0);
    
    // c4
    buf (c4[15], A[11]); buf (c4[14], A[10]); buf (c4[13], A[9]); buf (c4[12], A[8]); buf (c4[11], A[7]); buf (c4[10], A[6]); buf (c4[9], A[5]); buf (c4[8], A[4]); buf (c4[7], A[3]); buf (c4[6], A[2]); buf (c4[5], A[1]); buf (c4[4], A[0]); buf (c4[3], 1'b0); buf (c4[2], 1'b0); buf (c4[1], 1'b0); buf (c4[0], 1'b0);
    
    // c5
    buf (c5[15], A[10]); buf (c5[14], A[9]); buf (c5[13], A[8]); buf (c5[12], A[7]); buf (c5[11], A[6]); buf (c5[10], A[5]); buf (c5[9], A[4]); buf (c5[8], A[3]); buf (c5[7], A[2]); buf (c5[6], A[1]); buf (c5[5], A[0]); buf (c5[4], 1'b0); buf (c5[3], 1'b0); buf (c5[2], 1'b0); buf (c5[1], 1'b0); buf (c5[0], 1'b0);
    
    // c6
    buf (c6[15], A[9]); buf (c6[14], A[8]); buf (c6[13], A[7]); buf (c6[12], A[6]); buf (c6[11], A[5]); buf (c6[10], A[4]); buf (c6[9], A[3]); buf (c6[8], A[2]); buf (c6[7], A[1]); buf (c6[6], A[0]); buf (c6[5], 1'b0); buf (c6[4], 1'b0); buf (c6[3], 1'b0); buf (c6[2], 1'b0); buf (c6[1], 1'b0); buf (c6[0], 1'b0);
    
    // c7
    buf (c7[15], A[8]); buf (c7[14], A[7]); buf (c7[13], A[6]); buf (c7[12], A[5]); buf (c7[11], A[4]); buf (c7[10], A[3]); buf (c7[9], A[2]); buf (c7[8], A[1]); buf (c7[7], A[0]); buf (c7[6], 1'b0); buf (c7[5], 1'b0); buf (c7[4], 1'b0); buf (c7[3], 1'b0); buf (c7[2], 1'b0); buf (c7[1], 1'b0); buf (c7[0], 1'b0);
    
    // c8
    buf (c8[15], A[7]); buf (c8[14], A[6]); buf (c8[13], A[5]); buf (c8[12], A[4]); buf (c8[11], A[3]); buf (c8[10], A[2]); buf (c8[9], A[1]); buf (c8[8], A[0]); buf (c8[7], 1'b0); buf (c8[6], 1'b0); buf (c8[5], 1'b0); buf (c8[4], 1'b0); buf (c8[3], 1'b0); buf (c8[2], 1'b0); buf (c8[1], 1'b0); buf (c8[0], 1'b0);
    
    // c9
    buf (c9[15], A[6]); buf (c9[14], A[5]); buf (c9[13], A[4]); buf (c9[12], A[3]); buf (c9[11], A[2]); buf (c9[10], A[1]); buf (c9[9], A[0]); buf (c9[8], 1'b0); buf (c9[7], 1'b0); buf (c9[6], 1'b0); buf (c9[5], 1'b0); buf (c9[4], 1'b0); buf (c9[3], 1'b0); buf (c9[2], 1'b0); buf (c9[1], 1'b0); buf (c9[0], 1'b0);
    
    // c10
    buf (c10[15], A[5]); buf (c10[14], A[4]); buf (c10[13], A[3]); buf (c10[12], A[2]); buf (c10[11], A[1]); buf (c10[10], A[0]); buf (c10[9], 1'b0); buf (c10[8], 1'b0); buf (c10[7], 1'b0); buf (c10[6], 1'b0); buf (c10[5], 1'b0); buf (c10[4], 1'b0); buf (c10[3], 1'b0); buf (c10[2], 1'b0); buf (c10[1], 1'b0); buf (c10[0], 1'b0);
    
    // c11
    buf (c11[15], A[4]); buf (c11[14], A[3]); buf (c11[13], A[2]); buf (c11[12], A[1]); buf (c11[11], A[0]); buf (c11[10], 1'b0); buf (c11[9], 1'b0); buf (c11[8], 1'b0); buf (c11[7], 1'b0); buf (c11[6], 1'b0); buf (c11[5], 1'b0); buf (c11[4], 1'b0); buf (c11[3], 1'b0); buf (c11[2], 1'b0); buf (c11[1], 1'b0); buf (c11[0], 1'b0);
    
    // c12
    buf (c12[15], A[3]); buf (c12[14], A[2]); buf (c12[13], A[1]); buf (c12[12], A[0]); buf (c12[11], 1'b0); buf (c12[10], 1'b0); buf (c12[9], 1'b0); buf (c12[8], 1'b0); buf (c12[7], 1'b0); buf (c12[6], 1'b0); buf (c12[5], 1'b0); buf (c12[4], 1'b0); buf (c12[3], 1'b0); buf (c12[2], 1'b0); buf (c12[1], 1'b0); buf (c12[0], 1'b0);
    
    // c13
    buf (c13[15], A[2]); buf (c13[14], A[1]); buf (c13[13], A[0]); buf (c13[12], 1'b0); buf (c13[11], 1'b0); buf (c13[10], 1'b0); buf (c13[9], 1'b0); buf (c13[8], 1'b0); buf (c13[7], 1'b0); buf (c13[6], 1'b0); buf (c13[5], 1'b0); buf (c13[4], 1'b0); buf (c13[3], 1'b0); buf (c13[2], 1'b0); buf (c13[1], 1'b0); buf (c13[0], 1'b0);
    
    // c14
    buf (c14[15], A[1]); buf (c14[14], A[0]); buf (c14[13], 1'b0); buf (c14[12], 1'b0); buf (c14[11], 1'b0); buf (c14[10], 1'b0); buf (c14[9], 1'b0); buf (c14[8], 1'b0); buf (c14[7], 1'b0); buf (c14[6], 1'b0); buf (c14[5], 1'b0); buf (c14[4], 1'b0); buf (c14[3], 1'b0); buf (c14[2], 1'b0); buf (c14[1], 1'b0); buf (c14[0], 1'b0);
    
    // c15
    buf (c15[15], A[0]); buf (c15[14], 1'b0); buf (c15[13], 1'b0); buf (c15[12], 1'b0); buf (c15[11], 1'b0); buf (c15[10], 1'b0); buf (c15[9], 1'b0); buf (c15[8], 1'b0); buf (c15[7], 1'b0); buf (c15[6], 1'b0); buf (c15[5], 1'b0); buf (c15[4], 1'b0); buf (c15[3], 1'b0); buf (c15[2], 1'b0); buf (c15[1], 1'b0); buf (c15[0], 1'b0);
    
    
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
    xor(overflow, S[15], A[15]);
    //not S and with all 1s 
    //assign zero = ~|S;
    wire or_all;
    or or_g1(or_all, S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7],
          S[8], S[9], S[10], S[11], S[12], S[13], S[14], S[15]);
    not or_g2(zero, or_all);
    
endmodule
