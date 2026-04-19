`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2026 12:33:03 PM
// Design Name: 
// Module Name: invert
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


module invert(
    input wire[15:0] A,
    input wire[15:0] B,
    //    input wire[3:0] ALUCtrl,
    output wire overflow,
    output wire zero,
    output wire[15:0] S
    );
    wire[15:0] S1;
    wire adder_ovfl;
    xor x1 [15:0] (S1, A, 16'hffff); //invert all bits 
    addition a_inst (
            .A(S1),
            .B(16'h0001),
            .Cin(1'b0),        // Carry in is 0
            
            .overflow(adder_ovfl),
            .zero(zero),
            .S(S)
        );
           wire or_value;
        //assign or_value = |A[14:0];
        or g1(or_value, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7],
              A[8], A[9], A[10], A[11], A[12], A[13], A[14]);

        //overflow if A is 8000
        wire Snot,Q1,Q2,Q;
        not(Snot, or_value);
            and(Q1, A[15], Snot);
            and(Q2, 1'b0, or_value);
            or (overflow, Q1, Q2);
          //mux2bit u_2mux(.A(A[15]),.B(1'b0),.S(or_value),.Q(overflow));

endmodule
