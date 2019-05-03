//================================================================--
// Design Unit  : cew testbench for data_path
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


   reg t_clk;
   reg [15:0] t_int_rbus;
   wire [11:0] t_int_abus;
   wire [15:0] t_int_wbus;
   wire t_Z;
   wire [3:0] t_IR;
   reg [0:`MAX_CONTROL_LINES-1] t_control;

   data_path cut (t_control, t_IR, t_int_rbus, t_int_wbus, t_int_abus, t_Z, t_clk);

   task clearControl;

      integer i;

      begin
         for (i=0; i<`MAX_CONTROL_LINES; i=i+1)
            t_control[i] <= 1'b0;
         #1;
      end

   endtask

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

      // move data from PC to abus

      clearControl();
      t_control[`INIT_PC] <= 1'b1;
      clockTick();
      t_control[`INC_PC] <= 1'b1;
      clockTick();
      t_control[`ABUS_PC] <= 1'b1;#1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_int_abus) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 70");
             $display("Actual Value is ", t_int_abus );
             $display("Expected Value is ", 1 );
          end


    
      // move data from rbus to IR

      clearControl();
      t_int_rbus <= 4'h0;
      t_control[`IR_RBUS] <= 1'b1; 
      clockTick();
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_IR) !== (4'h0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 79");
             $display("Actual Value is ", t_IR );
             $display("Expected Value is ", 4'h0 );
          end


      // move data from rbus to alu(add) to wbus and flags

      clearControl();
      t_int_rbus <= 16'h00;
      t_control[`R0_RBUS] <= 1'b1;
      t_control[`ACC_RBUS] <= 1'b1;
      clockTick();
      t_control[`ADD_OP] <= 1'b1;
      t_control[`ACC_ALU] <= 1'b1;
      clockTick();
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_Z) !== (1'b1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 91");
             $display("Actual Value is ", t_Z );
             $display("Expected Value is ", 1'b1 );
          end

      t_control[`WBUS_ACC] <= 1'b1;#1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_int_wbus) !== (16'h00)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 93");
             $display("Actual Value is ", t_int_wbus );
             $display("Expected Value is ", 16'h00 );
          end


      // move data from rbus to PC to abus 
    
      clearControl();
      t_int_rbus <= 16'h01;
      t_control[`R0_RBUS] <= 1'b1;
      clockTick();
      t_control[`PC_R0] <= 1'b1;
      clockTick();
      t_control[`ABUS_PC] <= 1'b1;#1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_int_abus) !== (16'h01)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 104");
             $display("Actual Value is ", t_int_abus );
             $display("Expected Value is ", 16'h01 );
          end


      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

