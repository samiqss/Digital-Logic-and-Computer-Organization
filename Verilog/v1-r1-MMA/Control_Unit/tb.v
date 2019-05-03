//================================================================--
// Design Unit  : cew testbench for control_unit
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
// 1.0          PW      Nov 2016  New version
//================================================================--














`include "controlSignal.v" 


module test_bench();

   integer cew_Test_Count=0;
          integer cew_Error_Count=0;

   reg t_reset, t_clk;
   wire  t_fault, t_halt, t_break;
   wire  [0:`MAX_CONTROL_LINES-1] t_control;
   reg [3:0] t_opcode;
   reg [15:0] t_psw;


   control_unit cut (t_control, t_clk, t_opcode, t_psw, t_reset, t_halt, t_fault, t_break);

   task clockTick; 
      begin // nasty syntax
         t_clk<=0; #3; 
         t_clk<=1; #6;
         t_clk<=0; #3;
      end
   endtask

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      t_reset<=0;#1;t_reset<=1;#1; t_reset<=0;#1;
      t_opcode <= 4'b0001;
      clockTick();
      clockTick();
      clockTick();
      clockTick();
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_halt) !== (1'b1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 52");
             $display("Actual Value is ", t_halt );
             $display("Expected Value is ", 1'b1 );
          end


      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

