//================================================================--
// Design Unit  : cew testbench lab8
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

   reg t_reset, t_clk, t_SET, t_CLR;
   wire [0:1] t_state;

   // state  encoding
   localparam t_S0 = 2'b00, t_S1 = 2'b01, t_S2 = 2'b11, t_S3 = 2'b10;

   lab8 cut (t_state,  t_clk, t_SET, t_CLR, t_reset);

   task clockTick; 
      begin // nasty syntax
         t_clk<=0; #3; 
         t_clk<=1; #6;
         t_clk<=0; #3;
      end
   endtask

   task setState;

      input [0:1]  x;

      begin

         t_reset<=1;#1;t_reset<=0;#1; t_reset<=1;#1;
         case (x)
            t_S0: begin
            end
            t_S1: begin
              t_SET<=0;t_CLR<=0;clockTick(); 
            end
            t_S2: begin
              t_SET<=0;t_CLR<=0;clockTick(); 
              t_SET<=0;t_CLR<=0;clockTick(); 
            end
            t_S3: begin
              t_SET<=0;t_CLR<=0;clockTick(); 
              t_SET<=0;t_CLR<=0;clockTick(); 
              t_SET<=0;t_CLR<=0;clockTick(); 
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
          if ((t_state) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 72");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=0;t_CLR<=0;clockTick();
          if ((t_state) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 73");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          setState(t_S0);
          if ((t_state) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 74");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=0;t_CLR<=1;clockTick();
          if ((t_state) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 75");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          setState(t_S0);
          if ((t_state) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 76");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=1;t_CLR<=0;clockTick();
          if ((t_state) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 77");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S2 );
          end


      // State t_S1
      cew_Test_Count=cew_Test_Count+1;
          setState(t_S1);
          if ((t_state) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 80");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=0;t_CLR<=0;clockTick();
          if ((t_state) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 81");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          setState(t_S1);
          if ((t_state) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 82");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=0;t_CLR<=1;clockTick();
          if ((t_state) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 83");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          setState(t_S1);
          if ((t_state) !== (t_S1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 84");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=1;t_CLR<=0;clockTick();
          if ((t_state) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 85");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S2 );
          end


      // State t_S2
      cew_Test_Count=cew_Test_Count+1;
          setState(t_S2);
          if ((t_state) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 88");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=0;t_CLR<=0;clockTick();
          if ((t_state) !== (t_S3)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 89");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S3 );
          end

      cew_Test_Count=cew_Test_Count+1;
          setState(t_S2);
          if ((t_state) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 90");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=0;t_CLR<=1;clockTick();
          if ((t_state) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 91");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          setState(t_S2);
          if ((t_state) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 92");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=1;t_CLR<=0;clockTick();
          if ((t_state) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 93");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S2 );
          end


      // State t_S3
      cew_Test_Count=cew_Test_Count+1;
          setState(t_S3);
          if ((t_state) !== (t_S3)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 96");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S3 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=0;t_CLR<=0;clockTick();
          if ((t_state) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 97");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          setState(t_S3);
          if ((t_state) !== (t_S3)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 98");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S3 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=0;t_CLR<=1;clockTick();
          if ((t_state) !== (t_S0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 99");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          setState(t_S3);
          if ((t_state) !== (t_S3)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 100");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S3 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_SET<=1;t_CLR<=0;clockTick();
          if ((t_state) !== (t_S2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 101");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_S2 );
          end


      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

