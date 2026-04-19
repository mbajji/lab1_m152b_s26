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
    assign zero = ~|S;
endmodule
