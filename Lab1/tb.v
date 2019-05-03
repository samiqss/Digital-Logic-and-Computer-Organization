//================================================================--
// Design Unit  : cew testbench for lab1
//
// File Name    : tb.cew
//
// Purpose      : design verification
//
// Note         :
//
// Limitations  :
//
// Errors       : none known
//
// Library      : lab1 
//
// Dependences  : none
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

   wire t_D;
   reg t_A, t_B, t_C;

   lab1 cut(t_D, t_A, t_B, t_C);

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      cew_Test_Count=cew_Test_Count+1;
          t_A=0;t_B=0;t_C=0;#1;
          if ((t_D) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 43");
             $display("Actual Value is ", t_D );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_A=0;t_B=0;t_C=1;#1;
          if ((t_D) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 44");
             $display("Actual Value is ", t_D );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_A=0;t_B=1;t_C=0;#1;
          if ((t_D) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 45");
             $display("Actual Value is ", t_D );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_A=0;t_B=1;t_C=1;#1;
          if ((t_D) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 46");
             $display("Actual Value is ", t_D );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_A=1;t_B=0;t_C=0;#1;
          if ((t_D) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 47");
             $display("Actual Value is ", t_D );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_A=1;t_B=0;t_C=1;#1;
          if ((t_D) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 48");
             $display("Actual Value is ", t_D );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_A=1;t_B=1;t_C=0;#1;
          if ((t_D) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 49");
             $display("Actual Value is ", t_D );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_A=1;t_B=1;t_C=1;#1;
          if ((t_D) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 50");
             $display("Actual Value is ", t_D );
             $display("Expected Value is ", 0 );
          end

      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

