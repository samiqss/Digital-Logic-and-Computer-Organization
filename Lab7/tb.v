//================================================================--
// Design Unit  : cew testbench for lab7
//
// File Name    : tb.cew
//
// Purpose      : design verification
//
// Author       : Peter Walsh, Vancouver Island University
//
// System       : icarus (Linux)
//
//------------------------------------------------------------------
// Revision List
// Version      Author  Date    Changes
// 1.0          PW      Sep 10  New version
//================================================================--















module test_bench();

   integer cew_Test_Count=0;
          integer cew_Error_Count=0;

   wire t_Z_BAR;
   reg t_reset, t_clk, t_X;
   wire [0:2] t_s;

   // state  encoding
   localparam t_S0 = 3'b001, t_S1 = 3'b101, t_S2 = 3'b111;
   localparam t_S3 = 3'b010, t_S4 = 3'b011, t_S5 = 3'b000;

   lab7 #(t_S0, t_S1, t_S2, t_S3, t_S4, t_S5) cut(t_Z_BAR, t_s, t_clk, t_X, t_reset);

   task clockTick; 
      begin // nasty syntax
         t_clk<=0; #3; 
         t_clk<=1; #6;
         t_clk<=0; #3;
      end
   endtask

   task setState;

      input [0:2]  x;

      begin

         t_reset<=1;#1;t_reset<=0;#1; t_reset<=1;#1;
         case (x)
            t_S0: begin
            end
            t_S1: begin
              t_X<=1;clockTick(); 
            end
            t_S2: begin
              t_X<=1;clockTick(); 
              t_X<=1;clockTick(); 
            end
            t_S3: begin
              t_X<=1;clockTick(); 
              t_X<=1;clockTick(); 
              t_X<=0;clockTick(); 
            end
            t_S4: begin
              t_X<=1;clockTick(); 
              t_X<=0;clockTick(); 
            end
            t_S5: begin
              t_X<=1;clockTick(); 
              t_X<=1;clockTick(); 
              t_X<=0;clockTick(); 
              t_X<=0;clockTick(); 
            end
         endcase
      end
 
   endtask

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      // State t_S0
      cew_Test_Count=cew_Test_Count+1;
          setState(t_S0);
          if ((t_s) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 84");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 85");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 86");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S0 );
          end


      cew_Test_Count=cew_Test_Count+1;
          setState(t_S0);t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 88");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 89");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S1 );
          end


      // State t_S1
      cew_Test_Count=cew_Test_Count+1;
          setState(t_S1);
          if ((t_s) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 92");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 93");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S4)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 94");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S4 );
          end


      cew_Test_Count=cew_Test_Count+1;
          setState(t_S1);t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 96");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 97");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S2 );
          end


      // State t_S2
      cew_Test_Count=cew_Test_Count+1;
          setState(t_S2);
          if ((t_s) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 100");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 101");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S3)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 102");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S3 );
          end


      cew_Test_Count=cew_Test_Count+1;
          setState(t_S2);t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 104");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 105");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S2 );
          end


      // State t_S3
      cew_Test_Count=cew_Test_Count+1;
          setState(t_S3);
          if ((t_s) !== (t_S3)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 108");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S3 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 109");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S5)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 110");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S5 );
          end


      cew_Test_Count=cew_Test_Count+1;
          setState(t_S3);t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 112");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 113");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S1 );
          end


      // State t_S4
      cew_Test_Count=cew_Test_Count+1;
          setState(t_S4);
          if ((t_s) !== (t_S4)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 116");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S4 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 117");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S5)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 118");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S5 );
          end


      cew_Test_Count=cew_Test_Count+1;
          setState(t_S4);t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 120");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 121");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S1 );
          end


      // State t_S5
      cew_Test_Count=cew_Test_Count+1;
          setState(t_S5);
          if ((t_s) !== (t_S5)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 124");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S5 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 125");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 126");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S0 );
          end


      cew_Test_Count=cew_Test_Count+1;
          setState(t_S5);t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 128");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 129");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S1 );
          end


      // test case sequence used in lab

      cew_Test_Count=cew_Test_Count+1;
          setState(t_S0);t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 133");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 134");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 135");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 136");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 137");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 138");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 139");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 140");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 141");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S3)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 142");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S3 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 143");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 144");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 145");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 146");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 147");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S3)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 148");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S3 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 150");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S5)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 151");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S5 );
          end

      
      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 153");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 154");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S0 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 156");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 157");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 158");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 159");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 160");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S3)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 161");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S3 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 163");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S5)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 164");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S5 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 166");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 167");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 168");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S4)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 169");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S4 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=1;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 170");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 171");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 172");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S4)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 173");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S4 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_X<=0;#1;
          if ((t_Z_BAR) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 174");
             $display("Actual Value is ", t_Z_BAR );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          clockTick();
          if ((t_s) !== (t_S5)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 175");
             $display("Actual Value is ", t_s );
             $display("Expected Value is ", t_S5 );
          end


      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

