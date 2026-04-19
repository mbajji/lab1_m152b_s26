`timescale 1ns/1ps

module tb_mux16bit;

    // Inputs (Regs/Logic)
    reg [15:0] A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;
    reg        S0, S1, S2, S3;
    
    // Output
    wire [15:0] Q_out;

    // DUT Instance
    mux16bit dut_16 (
        .A(A), .B(B), .C(C), .D(D), 
        .E(E), .F(F), .G(G), .H(H),
        .I(I), .J(J), .K(K), .L(L),
        .M(M), .N(N), .O(O), .P(P),
        .S0(S0), .S1(S1), .S2(S2), .S3(S3),
        .Q(Q_out)
    );

    initial begin
        $display("Starting 16-bit Mux Test...");
        
        // 1. Set unique test patterns for all 16 inputs
        A=16'h0000; B=16'h0001; C=16'h0010; D=16'h0011;
        E=16'h0100; F=16'h0101; G=16'h0110; H=16'h0111;
        I=16'h1000; J=16'h1001; K=16'h1010; L=16'h1011;
        M=16'h1100; N=16'h1101; O=16'h1110; P=16'h1111;

        // 2. Test Case: Select A (0000)
        {S3, S2, S1, S0} = 4'b0000; #10;
        $display("Sel=0000 | Q=%h (Exp: 0000)", Q_out);

        // 3. Test Case: Select F (0101) - 6th input
        {S3, S2, S1, S0} = 4'b0001; #10;
        $display("Sel=0101 | Q=%h (Exp: 0001)", Q_out);

// 4. Test Case: Select C (0010)
        {S3, S2, S1, S0} = 4'b0010; #10;
        $display("Sel=0010 | Q=%h (Exp: 0010)", Q_out);

        // 5. Test Case: Select D (0011)
        {S3, S2, S1, S0} = 4'b0011; #10;
        $display("Sel=0011 | Q=%h (Exp: 0011)", Q_out);

        // 6. Test Case: Select E (0100)
        {S3, S2, S1, S0} = 4'b0100; #10;
        $display("Sel=0100 | Q=%h (Exp: 0100)", Q_out);

        // 7. Test Case: Select F (0101)
        {S3, S2, S1, S0} = 4'b0101; #10;
        $display("Sel=0101 | Q=%h (Exp: 0101)", Q_out);

        // 8. Test Case: Select G (0110)
        {S3, S2, S1, S0} = 4'b0110; #10;
        $display("Sel=0110 | Q=%h (Exp: 0110)", Q_out);

        // 9. Test Case: Select H (0111)
        {S3, S2, S1, S0} = 4'b0111; #10;
        $display("Sel=0111 | Q=%h (Exp: 0111)", Q_out);

        // 10. Test Case: Select I (1000)
        {S3, S2, S1, S0} = 4'b1000; #10;
        $display("Sel=1000 | Q=%h (Exp: 1000)", Q_out);

        // 11. Test Case: Select J (1001)
        {S3, S2, S1, S0} = 4'b1001; #10;
        $display("Sel=1001 | Q=%h (Exp: 1001)", Q_out);

        // 12. Test Case: Select K (1010)
        {S3, S2, S1, S0} = 4'b1010; #10;
        $display("Sel=1010 | Q=%h (Exp: 1010)", Q_out);

        // 13. Test Case: Select L (1011)
        {S3, S2, S1, S0} = 4'b1011; #10;
        $display("Sel=1011 | Q=%h (Exp: 1011)", Q_out);

        // 14. Test Case: Select M (1100)
        {S3, S2, S1, S0} = 4'b1100; #10;
        $display("Sel=1100 | Q=%h (Exp: 1100)", Q_out);

        // 15. Test Case: Select N (1101)
        {S3, S2, S1, S0} = 4'b1101; #10;
        $display("Sel=1101 | Q=%h (Exp: 1101)", Q_out);

        // 16. Test Case: Select O (1110)
        {S3, S2, S1, S0} = 4'b1110; #10;
        $display("Sel=1110 | Q=%h (Exp: 1110)", Q_out);

        // 17. Test Case: Select P (1111)
        {S3, S2, S1, S0} = 4'b1111; #10;
        $display("Sel=1111 | Q=%h (Exp: 1111)", Q_out);

        $display("16-bit Mux Test Finished.");
        $finish;
    end

endmodule
