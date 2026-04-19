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


module subtraction(
    input wire[15:0] A,
    input wire[15:0] B,
    input wire[3:0] ALUCtrl,
    output wire overflow,
    output wire zero,
    output wire[15:0] S
    );
    wire [15:0] S1;
    wire o1, z1, carry_out;
    wire sign_diff;        
    wire result_wrong;     
    
    invert invert_i(.S(S1), .A(B), .B(A), .overflow(o1), .zero(z1));
    addition addition_a(.S(S), .A(A), .B(S1), .Cin(1'b0), .overflow(carry_out), .zero(zero)); 
    
    xor u_sign_check (sign_diff, A[15], B[15]);
    
    xor u_result_check (result_wrong, A[15], S[15]);

    and u_final_ov (overflow, sign_diff, result_wrong);
    
endmodule
