//================================================================--
// Design Unit  : cew testbench for lab3
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
// Library      : lab3 
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

   wire t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp;
   reg t_w, t_x, t_y, t_z;
   reg [7:0] t_o;

   integer i;


   lab3 cut(t_w, t_x, t_y, t_z, t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp);

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);


      for (i=0; i<10; i=i+1)
         begin
         cew_Test_Count=cew_Test_Count+1;
          t_w=i[3];t_x=i[2];t_y=i[1];t_z=i[0];#1;
          if ((t_dp) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 50");
             $display("Actual Value is ", t_dp );
             $display("Expected Value is ", 1 );
          end

         end

      t_w=1;t_x=0;t_y=1;t_z=0;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};#1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b11101110)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 55");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b11101110 );
          end
 // A

      t_w=1;t_x=0;t_y=1;t_z=1;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};#1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b11111110)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 59");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b11111110 );
          end
 // B

      t_w=1;t_x=1;t_y=0;t_z=0;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};#1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b10011100)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 63");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b10011100 );
          end
 // C

      t_w=1;t_x=1;t_y=0;t_z=1;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};#1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b11111100)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 67");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b11111100 );
          end
 // D

      t_w=1;t_x=1;t_y=1;t_z=0;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};#1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b10011110)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 71");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b10011110 );
          end
 // E

      t_w=1;t_x=1;t_y=1;t_z=1;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};#1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b10001110)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 75");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b10001110 );
          end
 // F


      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

