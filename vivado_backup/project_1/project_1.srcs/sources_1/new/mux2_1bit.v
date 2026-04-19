`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2026 11:44:32 AM
// Design Name: 
// Module Name: 2bitmux
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


module mux2_1bit(
    input  wire A,
    input wire B,
    input wire  S,
    output wire Q
    );
    wire Snot;
    wire Q1,Q2;
    
    not(Snot, S);
    and a0  (Q1, A, Snot);
        
    // Verilog automatically applies the scalar 'S' to every bit of 'B'
    and a1  (Q2, B, S);

    // 3. Final OR gate to combine the 16-bit results
    or  o1  (Q, Q1, Q2);

endmodule
