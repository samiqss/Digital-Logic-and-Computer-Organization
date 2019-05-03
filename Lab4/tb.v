//================================================================--
// Design Unit  : cew testbench for lab4
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

   wire t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp;
   reg t_w, t_x, t_y, t_z;
   reg [7:0] t_o;

   integer i;


   lab4 cut(t_w, t_x, t_y, t_z, t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp);

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      for (i=0; i<10; i=i+1)
         begin
         cew_Test_Count=cew_Test_Count+1;
          t_w=i[3];t_x=i[2];t_y=i[1];t_z=i[0];#1;
          if ((t_dp) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 39");
             $display("Actual Value is ", t_dp );
             $display("Expected Value is ", 0 );
          end

         end

      t_w=0;t_x=0;t_y=0;t_z=0;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b11111100)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 44");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b11111100 );
          end
 // 0

      t_w=0;t_x=0;t_y=0;t_z=1;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b01100000)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 48");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b01100000 );
          end
 // 1

      t_w=0;t_x=0;t_y=1;t_z=0;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b11011010)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 52");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b11011010 );
          end
 // 2

      t_w=0;t_x=0;t_y=1;t_z=1;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b11110010)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 56");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b11110010 );
          end
 // 3

      t_w=0;t_x=1;t_y=0;t_z=0;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b01100110)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 60");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b01100110 );
          end
 // 4

      t_w=0;t_x=1;t_y=0;t_z=1;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b10110110)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 64");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b10110110 );
          end
 // 5

      t_w=0;t_x=1;t_y=1;t_z=0;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b10111110)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 68");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b10111110 );
          end
 // 6

      t_w=0;t_x=1;t_y=1;t_z=1;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b11100000)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 72");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b11100000 );
          end
 // 7

      t_w=1;t_x=0;t_y=0;t_z=0;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b11111110)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 76");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b11111110 );
          end
 // 8

      t_w=1;t_x=0;t_y=0;t_z=1;#1;
      t_o={t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_dp};
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_o) !== (8'b11110110)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 80");
             $display("Actual Value is ", t_o );
             $display("Expected Value is ", 8'b11110110 );
          end
 // 9

      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #10 $finish();
   end

endmodule

