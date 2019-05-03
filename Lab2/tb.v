//================================================================--
// Design Unit  : cew testbench for lab2
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
// Library      : lab2
//
// Dependences  : none
//
// Author       : Peter Walsh, Vancouver Island University
//		  (Edited By: Sami Al-Qusus)
// System       : icarus (Linux)
//
//------------------------------------------------------------------
// Revision List
// Version      Author  Date    Changes
// 1.0          PW      Sep 10  New version
// 2.0          SA      Oct 4   Added requested code for Lab2
//================================================================--















module test_bench();

   integer cew_Test_Count=0;
          integer cew_Error_Count=0;

   wire t_E;
   reg t_A, t_B, t_C, t_D;
   integer i;

   // Gold function
    function gold;
       input w,x,y,z;
 
       gold=((~w&x&~y&~z)|(~w&~x&z)|(~x&y));

    endfunction


   lab2 cut(t_E, t_A, t_B, t_C, t_D);

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);
      for (i=0; i<16; i=i+1)
	begin
        cew_Test_Count=cew_Test_Count+1;
          t_A=i[3];t_B=i[2];t_C=i[1];t_D=i[0];#1;
          if ((t_E) !== (gold(t_A,t_B,t_C,t_D))) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 55");
             $display("Actual Value is ", t_E );
             $display("Expected Value is ", gold(t_A,t_B,t_C,t_D) );
          end

      end
      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

