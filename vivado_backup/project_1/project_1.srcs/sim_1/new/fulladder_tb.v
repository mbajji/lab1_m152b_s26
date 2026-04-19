`timescale 1ns / 1ps

module ripple_carry_adder_tb();

    // Inputs (16-bit vectors)
    reg [15:0] A;
    reg [15:0] B;
    reg Cin;

    // Outputs
    wire [15:0] S;
    wire overflow; // This is the Cout of the 15th bit

    // Instantiate the Unit Under Test (UUT)
    // Ensure the module name matches your top-level 16-bit adder name
    addition uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .S(S), 
        .overflow(overflow)
    );

    initial begin
        // Monitor setup
        $monitor("Time=%0t | A=%h B=%h Cin=%b | S=%h overflow=%b", $time, A, B, Cin, S, overflow);

        // --- Test Cases ---

        // Case 1: All Zeros
        A = 16'h0000; B = 16'h0000; Cin = 0;
        
        // Case 2: Simple addition without carries
        #10 A = 16'h1234; B = 16'h1111; Cin = 0;
        
        // Case 3: Addition with Cin
        #10 A = 16'h0001; B = 16'h0001; Cin = 1; // 1 + 1 + 1 = 3
        
        // Case 4: Testing the Ripple (The "Worst Case" delay)
        // 0xFFFF + 1 causes a carry to ripple through every single stage
        #10 A = 16'hFFFF; B = 16'h0000; Cin = 1;
        
        // Case 5: Maximum values (causing overflow/Cout)
        #10 A = 16'hFFFF; B = 16'hFFFF; Cin = 1;
        
        // Case 6: Alternating bits
        #10 A = 16'hAAAA; B = 16'h5555; Cin = 0; // Result should be FFFF
        
        #10 A = 16'hAAAA; B = 16'h5555; Cin = 1; // Result should be 0000 with overflow=1

        #10 $finish;
    end
      
endmodule