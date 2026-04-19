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


module arithmetic_shift_R(
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
   
   wire sign;
    buf sign_buf(sign, A[15]);
    
   /*Realized this is not structural verilog so rewrite using buf 
   assign c0  = A;                                // Shift by 0
   assign c1  = {sign, A[15:1]};                  // Shift by 1
   assign c2  = {sign, sign, A[15:2]};                  // Shift by 2
   assign c3  = {sign, sign, sign, A[15:3]};                  // Shift by 3
   assign c4  = {sign, sign, sign, sign, A[15:4]};                  // Shift by 4
   assign c5  = {sign, sign, sign, sign, sign, A[15:5]};                  // Shift by 5
   assign c6  = {sign, sign, sign, sign, sign, sign, A[15:6]};                  // Shift by 6
   assign c7  = {sign, sign, sign, sign, sign, sign, sign, A[15:7]};                  // Shift by 7
   assign c8  = {sign, sign, sign, sign, sign, sign, sign, sign, A[15:8]};                  // Shift by 8
   assign c9  = {sign, sign, sign, sign, sign, sign, sign, sign, sign, A[15:9]};                  // Shift by 9
   assign c10 = {sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, A[15:10]};                // Shift by 10
   assign c11 = {sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, A[15:11]};                // Shift by 11
   assign c12 = {sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, A[15:12]};                // Shift by 12
   assign c13 = {sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, A[15:13]};                // Shift by 13
   assign c14 = {sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, A[15:14]};                // Shift by 14
   assign c15 = {sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, sign, A[15]};
    */
    
    // c0 = A (shift by 0)
    buf c0_15(c0[15],sign); buf c0_14(c0[14], A[14]); buf c0_13(c0[13], A[13]); buf c0_12(c0[12], A[12]);
    buf c0_11(c0[11], A[11]); buf c0_10(c0[10], A[10]); buf c0_9(c0[9], A[9]);   buf c0_8(c0[8], A[8]);
    buf c0_7(c0[7], A[7]);   buf c0_6(c0[6], A[6]);   buf c0_5(c0[5], A[5]);   buf c0_4(c0[4], A[4]);
    buf c0_3(c0[3], A[3]);   buf c0_2(c0[2], A[2]);   buf c0_1(c0[1], A[1]);   buf c0_0(c0[0], A[0]);
    
    // c1 = {sign, A[15:1]} (shift by 1)
    buf c1_15(c1[15], sign);  buf c1_14(c1[14], A[15]); buf c1_13(c1[13], A[14]); buf c1_12(c1[12], A[13]);
    buf c1_11(c1[11], A[12]); buf c1_10(c1[10], A[11]); buf c1_9(c1[9], A[10]);  buf c1_8(c1[8], A[9]);
    buf c1_7(c1[7], A[8]);   buf c1_6(c1[6], A[7]);   buf c1_5(c1[5], A[6]);   buf c1_4(c1[4], A[5]);
    buf c1_3(c1[3], A[4]);   buf c1_2(c1[2], A[3]);   buf c1_1(c1[1], A[2]);   buf c1_0(c1[0], A[1]);
    
    // c2 = {sign, sign, A[15:2]} (shift by 2)
    buf c2_15(c2[15], sign);  buf c2_14(c2[14], sign);  buf c2_13(c2[13], A[15]); buf c2_12(c2[12], A[14]);
    buf c2_11(c2[11], A[13]); buf c2_10(c2[10], A[12]); buf c2_9(c2[9], A[11]);  buf c2_8(c2[8], A[10]);
    buf c2_7(c2[7], A[9]);   buf c2_6(c2[6], A[8]);   buf c2_5(c2[5], A[7]);   buf c2_4(c2[4], A[6]);
    buf c2_3(c2[3], A[5]);   buf c2_2(c2[2], A[4]);   buf c2_1(c2[1], A[3]);   buf c2_0(c2[0], A[2]);
    
    // c3 = {sign, sign, sign, A[15:3]} (shift by 3)
    buf c3_15(c3[15], sign);  buf c3_14(c3[14], sign);  buf c3_13(c3[13], sign);  buf c3_12(c3[12], A[15]);
    buf c3_11(c3[11], A[14]); buf c3_10(c3[10], A[13]); buf c3_9(c3[9], A[12]);  buf c3_8(c3[8], A[11]);
    buf c3_7(c3[7], A[10]);  buf c3_6(c3[6], A[9]);   buf c3_5(c3[5], A[8]);   buf c3_4(c3[4], A[7]);
    buf c3_3(c3[3], A[6]);   buf c3_2(c3[2], A[5]);   buf c3_1(c3[1], A[4]);   buf c3_0(c3[0], A[3]);
    
    // c4 = {sign x4, A[15:4]} (shift by 4)
    buf c4_15(c4[15], sign);  buf c4_14(c4[14], sign);  buf c4_13(c4[13], sign);  buf c4_12(c4[12], sign);
    buf c4_11(c4[11], A[15]); buf c4_10(c4[10], A[14]); buf c4_9(c4[9], A[13]);  buf c4_8(c4[8], A[12]);
    buf c4_7(c4[7], A[11]);  buf c4_6(c4[6], A[10]);  buf c4_5(c4[5], A[9]);   buf c4_4(c4[4], A[8]);
    buf c4_3(c4[3], A[7]);   buf c4_2(c4[2], A[6]);   buf c4_1(c4[1], A[5]);   buf c4_0(c4[0], A[4]);
    
    // c5 = {sign x5, A[15:5]} (shift by 5)
    buf c5_15(c5[15], sign);  buf c5_14(c5[14], sign);  buf c5_13(c5[13], sign);  buf c5_12(c5[12], sign);
    buf c5_11(c5[11], sign);  buf c5_10(c5[10], A[15]); buf c5_9(c5[9], A[14]);  buf c5_8(c5[8], A[13]);
    buf c5_7(c5[7], A[12]);  buf c5_6(c5[6], A[11]);  buf c5_5(c5[5], A[10]);  buf c5_4(c5[4], A[9]);
    buf c5_3(c5[3], A[8]);   buf c5_2(c5[2], A[7]);   buf c5_1(c5[1], A[6]);   buf c5_0(c5[0], A[5]);
    
    // c6 = {sign x6, A[15:6]} (shift by 6)
    buf c6_15(c6[15], sign);  buf c6_14(c6[14], sign);  buf c6_13(c6[13], sign);  buf c6_12(c6[12], sign);
    buf c6_11(c6[11], sign);  buf c6_10(c6[10], sign);  buf c6_9(c6[9], A[15]);  buf c6_8(c6[8], A[14]);
    buf c6_7(c6[7], A[13]);  buf c6_6(c6[6], A[12]);  buf c6_5(c6[5], A[11]);  buf c6_4(c6[4], A[10]);
    buf c6_3(c6[3], A[9]);   buf c6_2(c6[2], A[8]);   buf c6_1(c6[1], A[7]);   buf c6_0(c6[0], A[6]);
    
    // c7 = {sign x7, A[15:7]} (shift by 7)
    buf c7_15(c7[15], sign);  buf c7_14(c7[14], sign);  buf c7_13(c7[13], sign);  buf c7_12(c7[12], sign);
    buf c7_11(c7[11], sign);  buf c7_10(c7[10], sign);  buf c7_9(c7[9], sign);   buf c7_8(c7[8], A[15]);
    buf c7_7(c7[7], A[14]);  buf c7_6(c7[6], A[13]);  buf c7_5(c7[5], A[12]);  buf c7_4(c7[4], A[11]);
    buf c7_3(c7[3], A[10]);  buf c7_2(c7[2], A[9]);   buf c7_1(c7[1], A[8]);   buf c7_0(c7[0], A[7]);
    
    // c8 = {sign x8, A[15:8]} (shift by 8)
    buf c8_15(c8[15], sign);  buf c8_14(c8[14], sign);  buf c8_13(c8[13], sign);  buf c8_12(c8[12], sign);
    buf c8_11(c8[11], sign);  buf c8_10(c8[10], sign);  buf c8_9(c8[9], sign);   buf c8_8(c8[8], sign);
    buf c8_7(c8[7], A[15]);  buf c8_6(c8[6], A[14]);  buf c8_5(c8[5], A[13]);  buf c8_4(c8[4], A[12]);
    buf c8_3(c8[3], A[11]);  buf c8_2(c8[2], A[10]);  buf c8_1(c8[1], A[9]);   buf c8_0(c8[0], A[8]);
    
    // c9 = {sign x9, A[15:9]} (shift by 9)
    buf c9_15(c9[15], sign);  buf c9_14(c9[14], sign);  buf c9_13(c9[13], sign);  buf c9_12(c9[12], sign);
    buf c9_11(c9[11], sign);  buf c9_10(c9[10], sign);  buf c9_9(c9[9], sign);   buf c9_8(c9[8], sign);
    buf c9_7(c9[7], sign);   buf c9_6(c9[6], A[15]);  buf c9_5(c9[5], A[14]);  buf c9_4(c9[4], A[13]);
    buf c9_3(c9[3], A[12]);  buf c9_2(c9[2], A[11]);  buf c9_1(c9[1], A[10]);  buf c9_0(c9[0], A[9]);
    
    // c10 = {sign x10, A[15:10]} (shift by 10)
    buf c10_15(c10[15], sign); buf c10_14(c10[14], sign); buf c10_13(c10[13], sign); buf c10_12(c10[12], sign);
    buf c10_11(c10[11], sign); buf c10_10(c10[10], sign); buf c10_9(c10[9], sign);  buf c10_8(c10[8], sign);
    buf c10_7(c10[7], sign);  buf c10_6(c10[6], sign);  buf c10_5(c10[5], A[15]); buf c10_4(c10[4], A[14]);
    buf c10_3(c10[3], A[13]); buf c10_2(c10[2], A[12]); buf c10_1(c10[1], A[11]); buf c10_0(c10[0], A[10]);
    
    // c11 = {sign x11, A[15:11]} (shift by 11)
    buf c11_15(c11[15], sign); buf c11_14(c11[14], sign); buf c11_13(c11[13], sign); buf c11_12(c11[12], sign);
    buf c11_11(c11[11], sign); buf c11_10(c11[10], sign); buf c11_9(c11[9], sign);  buf c11_8(c11[8], sign);
    buf c11_7(c11[7], sign);  buf c11_6(c11[6], sign);  buf c11_5(c11[5], sign);  buf c11_4(c11[4], A[15]);
    buf c11_3(c11[3], A[14]); buf c11_2(c11[2], A[13]); buf c11_1(c11[1], A[12]); buf c11_0(c11[0], A[11]);
    
    // c12 = {sign x12, A[15:12]} (shift by 12)
    buf c12_15(c12[15], sign); buf c12_14(c12[14], sign); buf c12_13(c12[13], sign); buf c12_12(c12[12], sign);
    buf c12_11(c12[11], sign); buf c12_10(c12[10], sign); buf c12_9(c12[9], sign);  buf c12_8(c12[8], sign);
    buf c12_7(c12[7], sign);  buf c12_6(c12[6], sign);  buf c12_5(c12[5], sign);  buf c12_4(c12[4], sign);
    buf c12_3(c12[3], A[15]); buf c12_2(c12[2], A[14]); buf c12_1(c12[1], A[13]); buf c12_0(c12[0], A[12]);
    
    // c13 = {sign x13, A[15:13]} (shift by 13)
    buf c13_15(c13[15], sign); buf c13_14(c13[14], sign); buf c13_13(c13[13], sign); buf c13_12(c13[12], sign);
    buf c13_11(c13[11], sign); buf c13_10(c13[10], sign); buf c13_9(c13[9], sign);  buf c13_8(c13[8], sign);
    buf c13_7(c13[7], sign);  buf c13_6(c13[6], sign);  buf c13_5(c13[5], sign);  buf c13_4(c13[4], sign);
    buf c13_3(c13[3], sign);  buf c13_2(c13[2], A[15]); buf c13_1(c13[1], A[14]); buf c13_0(c13[0], A[13]);
    
    // c14 = {sign x14, A[15:14]} (shift by 14)
    buf c14_15(c14[15], sign); buf c14_14(c14[14], sign); buf c14_13(c14[13], sign); buf c14_12(c14[12], sign);
    buf c14_11(c14[11], sign); buf c14_10(c14[10], sign); buf c14_9(c14[9], sign);  buf c14_8(c14[8], sign);
    buf c14_7(c14[7], sign);  buf c14_6(c14[6], sign);  buf c14_5(c14[5], sign);  buf c14_4(c14[4], sign);
    buf c14_3(c14[3], sign);  buf c14_2(c14[2], sign);  buf c14_1(c14[1], A[15]); buf c14_0(c14[0], A[14]);
    
    // c15 = {sign x15, A[15]} (shift by 15)
    buf c15_15(c15[15], sign); buf c15_14(c15[14], sign); buf c15_13(c15[13], sign); buf c15_12(c15[12], sign);
    buf c15_11(c15[11], sign); buf c15_10(c15[10], sign); buf c15_9(c15[9], sign);  buf c15_8(c15[8], sign);
    buf c15_7(c15[7], sign);  buf c15_6(c15[6], sign);  buf c15_5(c15[5], sign);  buf c15_4(c15[4], sign);
    buf c15_3(c15[3], sign);  buf c15_2(c15[2], sign);  buf c15_1(c15[1], sign);  buf c15_0(c15[0], A[15]);
        
        
    
    wire[15:0] mux_output;
    mux16bit u_mux(
               .A(c0), .B(c1), .C(c2), .D(c3), 
               .E(c4), .F(c5), .G(c6), .H(c7),
               .I(c8), .J(c9), .K(c10), .L(c11),
               .M(c12), .N(c13), .O(c14), .P(c15),
               .S0(B[0]), .S1(B[1]), .S2(B[2]), .S3(B[3]),
               .Q(mux_output)
    );
    
    
    wire [15:0] all_sign;
buf as0(all_sign[0], sign);   buf as1(all_sign[1], sign);
buf as2(all_sign[2], sign);   buf as3(all_sign[3], sign);
buf as4(all_sign[4], sign);   buf as5(all_sign[5], sign);
buf as6(all_sign[6], sign);   buf as7(all_sign[7], sign);
buf as8(all_sign[8], sign);   buf as9(all_sign[9], sign);
buf as10(all_sign[10], sign); buf as11(all_sign[11], sign);
buf as12(all_sign[12], sign); buf as13(all_sign[13], sign);
buf as14(all_sign[14], sign); buf as15(all_sign[15], sign);


    mux2bit u_2mux(.A(mux_output),.B(all_sign),.S(or_value),.Q(S));
    assign overflow = 0;
    //assign zero = ~|S;
    wire or_all;
    or or_g1(or_all, S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7],
          S[8], S[9], S[10], S[11], S[12], S[13], S[14], S[15]);
    not or_g2(zero, or_all);
endmodule
