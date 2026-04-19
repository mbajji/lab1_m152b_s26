`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2026 11:47:21 AM
// Design Name: 
// Module Name: increment
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


module increment(
    input wire[15:0] A,
    input wire[15:0] B,
    //input wire[3:0] ALUCtrl,
    output wire overflow,
    output wire zero,
    output wire[15:0] S
    );
    
    addition a(.A(A), .B(16'h0001), .Cin(0),.overflow(overflow), .zero(zero), .S(S));
    
endmodule
