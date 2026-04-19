`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2026 11:44:32 AM
// Design Name: 
// Module Name: 4bitmux
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


module mux4_1bit(
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    input wire  S0,
    input wire  S1,
    output wire Q
    );
    
    wire  Q1, Q2; 
    
    mux2_1bit m1 (.A(A),  .B(B),  .S(S0), .Q(Q1));
    mux2_1bit m2 (.A(C),  .B(D),  .S(S0), .Q(Q2));
    mux2_1bit m3 (.A(Q1), .B(Q2), .S(S1), .Q(Q)); 
    
endmodule
