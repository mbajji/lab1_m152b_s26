//`timescale 1ns/1ps

//module tb_mux2bit;

//    reg [15:0] A;
//    reg [15:0] B;
//    reg         S;
//    wire [15:0] Q;

//    // DUT
//    mux2bit dut (
//        .A(A),
//        .B(B),
//        .S(S),
//        .Q(Q)
//    );

//    initial begin
//      $display("Starting test...");
//           // Test Case 1: Select A (S=0)
//           A = 16'hAAAA;
//           B = 16'hBBBB;
//           S = 0;
//           #10; // Wait 10ns
//           $display("T=%0t | A=%h B=%h S=%b | Q=%h (Expected: A)", $time, A, B, S, Q);
           
//    end

//endmodule

`timescale 1ns/1ps

module tb_mux2bit;

    reg [15:0] A;
    reg [15:0] B;
    reg [15:0] C;
        reg [15:0] D;
    reg         S;
    reg         S0;
    reg         S1;
    wire [15:0] Q;
    wire [15:0] Q4;

    // DUT - Assuming a standard 2-to-1 mux logic: Q = S ? B : A
    mux2bit dut (
        .A(A),
        .B(B),
        .S(S),
        .Q(Q)
    );
    
       mux4bit dut4 (
         .A(A),
         .B(B),
         .C(C),
         .D(D),
         .S0(S0),
         .S1(S1),
         .Q(Q4)
     );

    initial begin
        $display("Starting test...");
        // Test Case 1: Select A (S=0)
        A = 16'hAAAA;
        B = 16'hBBBB;
        C = 16'hCCCC;
        D = 16'hDDDD;
        S = 0;
        S0=0;
        S1=0;
        #10; // Wait 10ns
        $display("T=%0t | A=%h B=%h S=%b | Q=%h (Expected: A)", $time, A, B, S, Q);
        
        // Test Case 2: Select B (S=1)
        S = 1;
        #10;
        $display("T=%0t | A=%h B=%h S=%b | Q=%h (Expected: B)", $time, A, B, S, Q);

        $display("Test finished.");
        
        
        // 2. Test Case: Select A (S1=0, S0=0)
                S1 = 0; S0 = 0;
                #10; // Wait for logic to propagate
                $display("S1S0=%b%b | Q4=%h  (Expected: AAAA)", S1, S0, Q4);
        
                // 3. Test Case: Select B (S1=0, S0=1)
                S1 = 0; S0 = 1;
                #10;
                $display("S1S0=%b%b | Q4=%h  (Expected: BBBB)", S1, S0, Q4);
        
                // 4. Test Case: Select C (S1=1, S0=0)
                S1 = 1; S0 = 0;
                #10;
                $display("S1S0=%b%b | Q4=%h (Expected: CCCC)", S1, S0, Q4);
        
                // 5. Test Case: Select D (S1=1, S0=1)
                S1 = 1; S0 = 1;
                #10;
                $display("S1S0=%b%b | Q4=%h  (Expected: DDDD)", S1, S0,Q4);
        
        
        
        $finish; // End simulation
    end

endmodule
