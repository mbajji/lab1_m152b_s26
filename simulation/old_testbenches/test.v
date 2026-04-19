`timescale 1ns/1ps

module tb_top_module;

    // Inputs (Regs/Logic)
    reg [15:0] A, B;
    reg [3:0]  ALUCtrl;
    
    // Outputs (Wires)
    wire [15:0] S;
    wire        overflow, zero;

    // Instantiate Top Module
    top_module dut(
        .A(A),
        .B(B),
        .ALUCtrl(ALUCtrl),
        .overflow(overflow),
        .zero(zero),
        .S(S)
    );

    initial begin
        // Updated label to reflect the actual test being performed
        $display("Starting Top Module Test: OR Operation (ALUCtrl=0010)");
        // Case 1: The Overflow Edge Case (-32768)
               
        // ALUCtrl = 0010 selects the 'C' input (bitwise_or) in your mux
        ALUCtrl = 4'b1001;
        B = 16'h0000;
         A = 16'h8000; 
                       #10;
                       
                       // Case 2: Zero (Tests full ripple carry of the +1)
                       A = 16'h0000; 
                       #10;
               
                       // Case 3: Minus One (FFFF -> 0001)
                       A = 16'hFFFF; 
                       #10;
               
                       // Case 4: Max Positive (7FFF -> 8001)
                       A = 16'h7FFF; 
                       #10;
               
                       // Case 5: One (0001 -> FFFF)
                       A = 16'h0001; 
                       #10;
               
                       // Case 6: Your original test case
                       A = 16'h0FFF; 
                       #10;

        // Test Case 1: All 1s OR All 0s
        A = 16'hFFFF; B = 16'h0000;
        #10;
        // Exp: FFFF (In OR, the 1s dominate)
        $display("T=%0t | A=%h B=%h | S=%h (Exp: FFFF)", $time, A, B, S);

        // Test Case 2: Matching patterns
        A = 16'hAAAA; B = 16'h0001;
        #10;
        // Exp: AAAA
        $display("T=%0t | A=%h B=%h | S=%h (Exp: AAAA)", $time, A, B, S);

        // Test Case 3: Complementary patterns
        A = 16'hF0F0; B = 16'h1111;
        #10;
        // Exp: FFFF (Combined they fill all bit slots)
        $display("T=%0t | A=%h B=%h | S=%h (Exp: FFFF)", $time, A, B, S);
         A = 16'hF0F0; B = 16'h0005;
               #10;
               // Exp: FFFF (Combined they fill all bit slots)
               $display("T=%0t | A=%h B=%h | S=%h (Exp: FFFF)", $time, A, B, S);

        // Test Case 4: Overlapping bits
        A = 16'hFF00; B = 16'hF0F0;
        #10;
        // Exp: FF00 | F0F0 = FFF0
        $display("T=%0t | A=%h B=%h | S=%h (Exp: FFF0)", $time, A, B, S);
                A = 16'hFFFF; B = 16'h0001;
        #10;
        // Exp: FF00 | F0F0 = FFF0
        
         $display("T=%0t | A=%h B=%h | S=%h (Exp: FFF0)", $time, A, B, S);
                       A = 16'hFFFF; B = 16'h000F;
               #10;
               
                $display("T=%0t | A=%h B=%h | S=%h (Exp: FFF0)", $time, A, B, S);
                                     A = 16'hFFFF; B = 16'h0010;
                             #10;
                   $display("T=%0t | A=%h B=%h | S=%h (Exp: FFF0)", $time, A, B, S);
                                                 A = 16'hFFFF; B = 16'h000F;
                                         #10;
                                         
                                          $display("T=%0t | A=%h B=%h | S=%h (Exp: FFF0)", $time, A, B, S);
                                                               A = 16'h7FFF; B = 16'h0004;
                                                       #10;
        $display("T=%0t | A=%h B=%h | S=%h (Exp: FFF0)", $time, A, B, S);
A = 16'h8000; B = 16'h0000;
                #10;
A = 16'h0FFF; B = 16'h0000;
                                #10;
        $display("OR Test Finished.");
        $finish;
    end

endmodule