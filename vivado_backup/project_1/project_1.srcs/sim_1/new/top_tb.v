`timescale 1ns/1ps

module top_tb_module;

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
    
   
        //sub
        ALUCtrl = 4'b0000;
        //A-0 should be A
        A = 16'hFFEA; 
        B = 16'h0000;
        #10;
        
        //A-A should be 0
        A = 16'hFFEA; 
        B = 16'hFFEA;
        #10;
        
         //9-4 should be 5
        A = 16'h0009; 
        B = 16'h0004;
        #10;
        
        //0-0 should be 5
        A = 16'h0000; 
        B = 16'h0000;
        #10;
        
       //-1-(+1) = -2
        A = 16'hffff; 
        B = 16'h0001;
        #10;
        
        //underflow
        A = 16'h8000; 
        B = 16'h0001;
        #10;
        A = 16'h8000; 
        B = 16'h8000;
        #10;
        
         A = 16'h7FFF; 
        B = 16'h7FFF;
        #10;
         //overflow
        A = 16'h7fff; 
        B = 16'hffff;
        #10;
        
        
        A = 16'h8000; 
        B = 16'h7FFF;
        #10;
        
        A = 16'h7fff; 
        B = 16'h8000;
        #10;
        
       
        A = 16'h0000; 
        B = 16'h0000;
        #10
        
        
        
        
        
        
        
        
         //add
         ALUCtrl = 4'b0001;
        // 3 + 5 = 8
        A = 16'h0003; 
        B = 16'h0005;
        #10;
        
         //0 + 0 = 0
        A = 16'h0000; 
        B = 16'h0000;
        #10;
        
        // positive overflow int_max+1
        A = 16'h7FFF; 
        B = 16'h0001;
        #10;
        // -1 + 1 = 0
        A = 16'hFFFF; 
        B = 16'h0001;
        #10;
        
       // negative overflow int min 
        A = 16'h8000; 
        B = 16'hFFFF;
        #10;
        
        // -1 + 1 = 0
        A = 16'hFFFF; 
        B = 16'h0001;
        #10;
        
         //overflow
          // -1 + -2 = -3
        A = 16'hFFFF; 
        B = 16'hFFFE;
        #10;
        A = 16'h7FFF; 
        B = 16'h7FFF;
        #10;
        
         A = 16'h8000; 
        B = 16'h8000;
        #10;
        
         A = 16'h8000; 
        B = 16'h7FFF;
        #10;
        
          A = 16'h0000; 
        B = 16'h0000;
        #10;
        
        
         //or
         ALUCtrl = 4'b0010;
         
         // mixed bits
         A = 16'h1234;
         B = 16'h00F0;
         #10;
        
        // all zeros
         A = 16'h0000;
         B = 16'h0000;
         #10;
        
        
        // all 1s for A -> should become all ones
         A = 16'hFFFF;
         B = 16'h0000;
         #10;
        
        
        // complementary patterns -> should become all 1s
         A = 16'hAAAA;
         B = 16'h5555;
         #10;
        
        
        // bits far apart
         A = 16'h8000;
         B = 16'h0001;
         #10;
          // all zeros
         A = 16'h0000;
         B = 16'h0000;
         #10;

         //and
        ALUCtrl = 4'b0011;
            // only one value is kept 
        A = 16'h1234; 
        B = 16'h00F0;
        #10;
        
         //all 0s
        A = 16'h0000; 
        B = 16'hFFFF;
        #10;
        
        // all shown 
        A = 16'hFFFF; 
        B = 16'habcd;
        #10;

        // all shown
        A = 16'habcd; 
        B = 16'hffff;
        #10;
        
       // alternating bits  
        A = 16'hAAAA; 
        B = 16'h5555;
        #10;
        
        // isolated 1st bit
        A = 16'h8001; 
        B = 16'h8000;
        #10;
        
         
        A = 16'h0000; 
        B = 16'h0000;
        #10;

         //Decrement (-1)
         
         ALUCtrl = 4'b0100;
         
        // simple decrement (with random B to prove B does not affect A)
        A = 16'h0005;
        B = 16'hFFFF;
        #10;
        
        
        // 1 - 1 = 0
        A = 16'h0001;
        B = 16'h0000;
        #10;
        
        
        // 0 - 1 = -1
        A = 16'h0000;
        B = 16'h0000;
        #10;
        
        
        // underflow case
        A = 16'h8000;
        B = 16'h5555;
        #10;
        
        
        // int_max - 1
        A = 16'h7FFF;
        B = 16'h0000;
        #10;
    
    
         //+1
        ALUCtrl = 4'b0101;
         // simple increment (with random B to prove B does not affect A)
        A = 16'h0005;
        B = 16'hFFFF;
        #10;
        
        
        // -1 + 1 = 0
        A = 16'hFFFF;
        B = 16'h0000;
        #10;
        
        
        // int_max + 1 -> overflow
        A = 16'h7FFF;
        B = 16'h0000;
        #10;
        
        
        // int_min + 1
        A = 16'h8000;
        B = 16'h5555;
        #10;
        
        
        // 0 + 1
        A = 16'h0000;
        B = 16'h0000;
        #10;

         
         //2s comp
         ALUCtrl = 4'b0110;
         
                 
        // simple invert (with random B to prove B does not affect A)
        A = 16'h0005;
        B = 16'hFFFF;
        #10;
        
        
        // ~0 = 0
        A = 16'h0000;
        B = 16'h0000;
        #10;
        
        
        // ~(-1) = 1 -> overflow
        A = 16'hFFFF;
        B = 16'h0000;
        #10;
        
        
        // ~(int_min) -> overflow
        A = 16'h8000;
        B = 16'h5555;
        #10;
        
        
        // ~(int_max) -> no overflow
        A = 16'h7FFF;
        B = 16'h0000;
        #10;
        
        
        // 0101...
        A = 16'h5555;
        B = 16'h0000;
        #10;
             
         
         //arithmetic_shift left
         ALUCtrl = 4'b1100;
        // simple left shift
        A = 16'h0003;
        B = 16'h0002;
        #10;
        
        
        // shift by 0
        A = 16'h0001;
        B = 16'h0000;
        #10;
        
        
        // sign changes (MSB 0 to 1), and shoulf overflow
        A = 16'h4000;
        B = 16'h0001;
        #10;
        
        
        // sign changes (MSB 1 to 0), and should  overflow
        A = 16'h9000;
        B = 16'h0001;
        #10;
        
        
        // MSB shifted out -> all 0s
        A = 16'h8000;
        B = 16'h0001;
        #10;
        
        
        // max shift amount
        A = 16'hFFFF;
        B = 16'h000F;
        #10;
        
        
        // greater than max shift amount by 1
        A = 16'hFFFF;
        B = 16'h0010;
        #10;
        
        
        // even greater max shift amount
        A = 16'hFFFF;
        B = 16'h00FF;
        #10;
        

        
        
         //arith shift right
        ALUCtrl = 4'b1110;
        A = 16'hFFF8;
        B = 16'h0001;
         #10;
        
        //should end up with all 1s 
        A = 16'hFFFF;
        B = 16'h000F;
         #10;
        
        //becomes 0 
        A = 16'h0001;
        B = 16'h0001;
         #10;
        
        //becomes 1100 
        A = 16'h1001;
        B = 16'h0001;
         #10;
        
        //becomes 
        A = 16'hABCD;
        B = 16'h0006;
         #10;
        
        // A = -2 (16'hFFFE), shift by 1. Should stay -1 (16'hFFFF)
        A = 16'hFFFE; 
        B = 16'h0001; 
        #10;
        
        // A = -32768 (16'h8000), shift by 4. Should become 16'hF800
        A = 16'h8000;
        B = 16'h0004;
        #10;
        
        // Result should remain 16'h8001
        A = 16'h8001;
        B = 16'h0000;
        #10;
        
        // Positive saturation: Result becomes 16'h0000
        A = 16'h7FFF;
        B = 16'h0010; // Shift by 16
        #10;
        
        // Positive saturation: Result becomes 16'h1111
        A = 16'hFFFF;
        B = 16'h0010; // Shift by 16
        #10;
        
        // Negative saturation: Result becomes 16'hFFFF
        A = 16'h8000;
        B = 16'h000F; // Shift by 15
        #10;
        
        // A = 1010... (16'hAAAA), shift by 1. 
        // Should become 16'hD555 (since MSB was 1, it pads with 1)
        A = 16'hAAAA;
        B = 16'h0001;
        #10;
        
        // A = 0101... (16'h5555), shift by 1. 
        // Should become 16'h2AAA (since MSB was 0, it pads with 0)
        A = 16'h5555;
        B = 16'h0001;
        #10;
        
           A = 16'h0000;
        B = 16'h0000;
        #10;
         
         
         
         
         //logical_shift left
        ALUCtrl = 4'b1000;
        // simple left shift
        A = 16'h0003;
        B = 16'h0002;
        #10;
        
        
        // shift by 0
        A = 16'h0001;
        B = 16'h0000;
        #10;
        
        
        // shifted to MSB
        A = 16'h0001;
        B = 16'h000F;
        #10;
        
        
        // MSB shifted out -> all 0s
        A = 16'h8000;
        B = 16'h0001;
        #10;
        
        
        // max shift amount
        A = 16'hFFFF;
        B = 16'h000F;
        #10;
        
        
        // greater than max shift amount by 1
        A = 16'hFFFF;
        B = 16'h0010;
        #10;
        
        
        // even greater max shift amount
        A = 16'hFFFF;
        B = 16'h00FF;
        #10;



         //log shift right
         ALUCtrl = 4'b1010;
      // simple right shift
        A = 16'h0010;
        B = 16'h0002;
        #10;
        
        
        // shift by 0
        A = 16'h0001;
        B = 16'h0000;
        #10;
        
        
        // MSB shifted down to LSB
        A = 16'h8000;
        B = 16'h000F;
        #10;
        
        
        // max shift amount
        A = 16'hFFFF;
        B = 16'h000F;
        #10;
        
        
        // greater than max shift amount by 1
        A = 16'hFFFF;
        B = 16'h0010;
        #10;
        
        
        // even greater max shift amount
        A = 16'hFFFF;
        B = 16'h00FF;
        #10;
        
        
        // one shifted out by 1
        A = 16'h0001;
        B = 16'h0001;
        #10;
   
         //leq
         ALUCtrl = 4'b1001;
         //3<7
         A = 16'h0003; 
         B = 16'h0007;
         #10;
        //9 is not < 4
         A = 16'h0009; 
         B = 16'h0004;
         #10;
        
        //-1>-2 so False(0)
         A = 16'hFFFF; 
         B = 16'hFFFE;
         #10;
        
        //-6<-2 so True(1)
         A = 16'hFFFA; 
         B = 16'hFFFE;
         #10;
        
        //equal case
         A = 16'h0109; 
         B = 16'h0109;
         #10;
        //int min and int max case (true)
         A = 16'h8000; 
         B = 16'h7fff;
         #10;
        //int max and int min case (false)
        
        A = 16'h7fff;
        B = 16'h8000;
         #10;
         
         
          A = 16'hffff;
        B = 16'h0001;
         #10;
         
          A = 16'h0001;
        B = 16'hFFFF;
         #10;

              
                       
   
    end

endmodule