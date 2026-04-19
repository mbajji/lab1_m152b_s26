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


module addition(
    input wire[15:0] A,
    input wire[15:0] B,
    input wire Cin,
   // input wire[3:0] ALUCtrl,
    output wire overflow,
    output wire zero,
    output wire[15:0] S
    );
        
        wire C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14,C15;
        //wire S0, S1, S2, S3, S4, S5, S6, S7, S8,  S9, S10, S11, S12, S13, S14; 

    
        full_adder fa0 (.S(S[0]),  .Cout(C0), .A(A[0]),  .B(B[0]),  .Cin(Cin));
        
       
        full_adder fa1 (.S(S[1]),  .Cout(C1), .A(A[1]),  .B(B[1]),  .Cin(C0));
        full_adder fa2 (.S(S[2]),  .Cout(C2), .A(A[2]),  .B(B[2]),  .Cin(C1));
        full_adder fa3 (.S(S[3]),  .Cout(C3), .A(A[3]),  .B(B[3]),  .Cin(C2));
    
   
        full_adder fa4 (.S(S[4]),  .Cout(C4), .A(A[4]),  .B(B[4]),  .Cin(C3));
        full_adder fa5 (.S(S[5]),  .Cout(C5), .A(A[5]),  .B(B[5]),  .Cin(C4));
        full_adder fa6 (.S(S[6]),  .Cout(C6), .A(A[6]),  .B(B[6]),  .Cin(C5));
        full_adder fa7 (.S(S[7]),  .Cout(C7), .A(A[7]),  .B(B[7]),  .Cin(C6));

        full_adder fa8 (.S(S[8]),  .Cout(C8), .A(A[8]),  .B(B[8]),  .Cin(C7));
        full_adder fa9 (.S(S[9]),  .Cout(C9), .A(A[9]),  .B(B[9]),  .Cin(C8));
        full_adder fa10(.S(S[10]), .Cout(C10),.A(A[10]), .B(B[10]), .Cin(C9));
        full_adder fa11(.S(S[11]), .Cout(C11),.A(A[11]), .B(B[11]), .Cin(C10));
    

        full_adder fa12(.S(S[12]), .Cout(C12),.A(A[12]), .B(B[12]), .Cin(C11));
        full_adder fa13(.S(S[13]), .Cout(C13),.A(A[13]), .B(B[13]), .Cin(C12));
        full_adder fa14(.S(S[14]), .Cout(C14),.A(A[14]), .B(B[14]), .Cin(C13));
        

        full_adder fa15(.S(S[15]),   .Cout(C15), .A(A[15]), .B(B[15]), .Cin(C14));
        assign zero = ~|S;
        xor(overflow,C14 ,C15);

endmodule
