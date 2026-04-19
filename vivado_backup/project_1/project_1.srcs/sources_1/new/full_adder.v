`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2026 10:25:18 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
input  wire A,
input  wire B,
input wire Cin,
//    input wire[3:0] ALUCtrl,
//    output wire overflow,
//    output wire zero,
    output wire S,
    output wire Cout

    );
    wire S0, S1, S2;
    
    xor(S0, A, B);
    and(S1, Cin, S0);
    and (S2, A, B);
    xor(S, Cin, S0);
    or(Cout, S1, S2);
endmodule
