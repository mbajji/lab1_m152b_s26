`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2026 01:26:42 PM
// Design Name: 
// Module Name: set_on_less_than_or_equal
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


module set_on_less_than_or_equal(
    input wire[15:0] A,
    input wire[15:0] B,
    //    input wire[3:0] ALUCtrl,
    output wire overflow,
    output wire zero,
    output wire[15:0] S
    );
    wire [15:0] diff;
    wire v_out, z_out; 
    wire less_than;
    wire selection;
    subtraction s(.A(A), .B(B), .S(diff), .overflow(v_out), .zero(z_out));
    xor(less_than,diff[15],v_out);
    or(selection,less_than,z_out);
    // A <= B means msb=1 (A<B) OR zero=1 (A==B)
    
    
    mux2bit mux (.A(16'h0000), .B(16'h0001), .S(selection), .Q(S));
    
    assign overflow = 0;
    assign zero = ~|S;


endmodule
