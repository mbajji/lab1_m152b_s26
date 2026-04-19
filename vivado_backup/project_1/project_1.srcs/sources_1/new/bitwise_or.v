`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2026 11:06:12 AM
// Design Name: 
// Module Name: bitwise_or
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


module bitwise_or(
    input wire[15:0] A,
    input wire[15:0] B,
//    input wire[3:0] ALUCtrl,
    output wire overflow,
    output wire zero,
    output wire[15:0] S
    );
    
    or o1 [15:0] (S, A, B);
    assign overflow = 0;
    wire or_all;
    or g1(or_all, S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7],
          S[8], S[9], S[10], S[11], S[12], S[13], S[14], S[15]);
    not g2(zero, or_all);
endmodule
