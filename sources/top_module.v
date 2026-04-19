`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2026 10:57:02 AM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input wire[15:0] A,
    input wire[15:0] B,
    input wire[3:0] ALUCtrl,//change back tp 3
    output wire overflow,
    output wire zero,
    output wire[15:0] S

    );
    
    //mux16bit(A, B, ALUCtrl, S);
   
    // ALUCtrl = 0011 //and
    wire[15:0] output_and;
    wire[15:0] output_or;
    wire[15:0] output_invert;
    wire[15:0] output_logical_left;
    wire[15:0] output_logical_right;
    wire[15:0] output_arithmetic_left;
    wire[15:0] output_arithmetic_right;
    wire[15:0] output_increment;
    wire[15:0] output_addition;
    wire[15:0] output_subtraction;
    wire[15:0] output_decrement;
    wire[15:0] output_setleq;
    
    wire overflow_subtraction,overflow_addition, overflow_or, overflow_and,overflow_decrement,overflow_increment,overflow_invert,overflow_arithmetic_shift_left,overflow_arithmetic_shift_right,overflow_logical_shift_left,overflow_logical_shift_right,overflow_setleq;
    wire zero_subtraction,zero_addition, zero_or, zero_and,zero_decrement,zero_increment,zero_invert,zero_arithmetic_shift_left,zero_arithmetic_shift_right,zero_logical_shift_left,zero_logical_shift_right,zero_setleq;
   
   subtraction u_subtraction(.A(A), .B(B), .S(output_subtraction), .overflow(overflow_subtraction), .zero(zero_subtraction));
   addition u_addition(.A(A), .B(B), .S(output_addition), .Cin(0),.overflow(overflow_addition), .zero(zero_addition));
   bitwise_or u_or(.A(A),.B(B),.S(output_or),.overflow(overflow_or),.zero(zero_or));
   bitwise_and u_and(.A(A),.B(B),.S(output_and),.overflow(overflow_and),.zero(zero_and));
   decrement u_decrement(.A(A), .B(B), .S(output_decrement), .overflow(overflow_decrement), .zero(zero_decrement));
   increment u_increment(.A(A), .B(B), .S(output_increment), .overflow(overflow_increment), .zero(zero_increment));
   invert u_invert(.A(A),.B(B),.S(output_invert),.overflow(overflow_invert),.zero(zero_invert));
   arithmetic_shift_L u_arleft(.A(A),.B(B),.S(output_arithmetic_left),.overflow(overflow_arithmetic_shift_left),.zero(zero_arithmetic_shift_left));
   arithmetic_shift_R u_arright(.A(A),.B(B),.S(output_arithmetic_right), .overflow(overflow_arithmetic_shift_right), .zero(zero_arithmetic_shift_right));
   logical_shift_L u_logleft(.A(A),.B(B),.S(output_logical_left), .overflow(overflow_logical_shift_left), .zero(zero_logical_shift_left));
   logical_shift_R u_logright(.A(A),.B(B),.S(output_logical_right), .overflow(overflow_logical_shift_right), .zero(zero_logical_shift_right));
   set_on_less_than_or_equal u_setleq(.A(A), .B(B), .S(output_setleq), .overflow(overflow_setleq), .zero(zero_setleq));
   
   
       // Output
      
   
       // DUT Instance
       mux16bit u_mux(
           .A(output_subtraction), .B(output_addition), .C(output_or), .D(output_and), 
           .E(output_decrement), .F(output_increment), .G(output_invert), .H(A),
           .I(output_logical_left), .J(output_setleq), .K(output_logical_right), .L(A),
           .M(output_arithmetic_left), .N(A), .O(output_arithmetic_right), .P(A),
           .S0(ALUCtrl[0]), .S1(ALUCtrl[1]), .S2(ALUCtrl[2]), .S3(ALUCtrl[3]),
           .Q(S)
       );
       
       mux16_1bit u_mux_o(
           .A(overflow_subtraction), .B(overflow_addition), .C(overflow_or), .D(overflow_and), 
           .E(overflow_decrement), .F(overflow_increment), .G(overflow_invert), .H(1'b0),
           .I(overflow_logical_shift_left), .J(overflow_setleq), .K(overflow_logical_shift_right), .L(1'b0),
           .M(overflow_arithmetic_shift_left), .N(A), .O(overflow_arithmetic_shift_right), .P(1'b0),
           .S0(ALUCtrl[0]), .S1(ALUCtrl[1]), .S2(ALUCtrl[2]), .S3(ALUCtrl[3]),
           .Q(overflow)
       );
       
       mux16_1bit u_mux_z(
           .A(zero_subtraction), .B(zero_addition), .C(zero_or), .D(zero_and), 
           .E(zero_decrement), .F(zero_increment), .G(zero_invert), .H(1'b0),
           .I(zero_logical_shift_left), .J(zero_setleq), .K(zero_logical_shift_right), .L(1'b0),
           .M(zero_arithmetic_shift_left), .N(A), .O(zero_arithmetic_shift_right), .P(1'b0),
           .S0(ALUCtrl[0]), .S1(ALUCtrl[1]), .S2(ALUCtrl[2]), .S3(ALUCtrl[3]),
           .Q(zero)
       );
endmodule
