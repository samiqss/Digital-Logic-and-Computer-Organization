//================================================================--
// Design Unit  : cew testbench for memory_unit
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















module test_bench();

   integer cew_Test_Count=0;
          integer cew_Error_Count=0;


   reg t_we, t_clk, t_reset;
   wire [15:0] t_int_rbus;
   reg [15:0] t_int_abus;
   reg [15:0] t_int_wbus;
   wire [15:0] t_porta;
   reg [15:0] t_portb;
   wire [15:0] t_portc;
   wire [15:0] t_psw;
   reg [15:0] t_portd;
   reg  t_Z;


   memory_unit  cut (t_we, t_int_rbus, t_int_wbus, t_int_abus, t_porta, t_portb, t_portc, t_portd, t_psw, t_Z, t_clk, t_reset);
   integer i;

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

      t_reset<=1;#1;t_reset<=0;#1; 
    
      // Test Reading from mac file
 
      cew_Test_Count=cew_Test_Count+1;
          t_we=1'b0;t_int_abus=16'h0000;clockTick();
          if ((t_int_rbus) !== (16'h00)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 56");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", 16'h00 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_we=1'b0;t_int_abus=16'h0001;clockTick();
          if ((t_int_rbus) !== (16'h01)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 57");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", 16'h01 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_we=1'b0;t_int_abus=16'h0002;clockTick();
          if ((t_int_rbus) !== (16'h02)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 58");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", 16'h02 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_we=1'b0;t_int_abus=16'h0003;clockTick();
          if ((t_int_rbus) !== (16'h03)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 59");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", 16'h03 );
          end


      // Test Read/Write cycles for the first 256 memory words

      cew_Test_Count=cew_Test_Count+1;
          t_we=1'b1;t_int_abus=16'h0003;t_int_wbus = 16'h25;clockTick();
          if ((t_int_rbus) !== (16'h25)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 63");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", 16'h25 );
          end


      for (i=0; i<255; i=i+1) begin
         cew_Test_Count=cew_Test_Count+1;
          t_we=1'b1;t_int_abus=i;t_int_wbus=i;clockTick();
          if ((t_int_rbus) !== (i)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 66");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", i );
          end

      end

      for (i=0; i<255; i=i+1) begin
         cew_Test_Count=cew_Test_Count+1;
          t_we=1'b0;t_int_abus=i;clockTick();
          if ((t_int_rbus) !== (i)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 70");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", i );
          end

      end


      // Test Flags and PSW


      cew_Test_Count=cew_Test_Count+1;
          t_Z=0;#1;
          if ((t_psw) !== (16'b0000000000000000)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 77");
             $display("Actual Value is ", t_psw );
             $display("Expected Value is ", 16'b0000000000000000 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_we=1'b0;t_int_abus=16'hFFB;clockTick();
          if ((t_int_rbus) !== (16'b0000000000000000)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 78");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", 16'b0000000000000000 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_Z=1;#1;
          if ((t_psw) !== (16'b1000000000000000)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 80");
             $display("Actual Value is ", t_psw );
             $display("Expected Value is ", 16'b1000000000000000 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_we=1'b0;t_int_abus=16'hFFB;clockTick();
          if ((t_int_rbus) !== (16'b1000000000000000)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 81");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", 16'b1000000000000000 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_we=1'b1;t_int_abus=16'hFFB;t_int_wbus=16'hFF;clockTick();
          if ((t_psw) !== (16'hFF)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 83");
             $display("Actual Value is ", t_psw );
             $display("Expected Value is ", 16'hFF );
          end


      // Test Reading and Writting to/from ports.

      cew_Test_Count=cew_Test_Count+1;
          t_we=1'b1;t_int_abus=16'hFFC;t_int_wbus=16'hFF;clockTick();
          if ((t_porta) !== (16'hFF)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 87");
             $display("Actual Value is ", t_porta );
             $display("Expected Value is ", 16'hFF );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_we=1'b1;t_int_abus=16'hFFE;t_int_wbus=16'hEE;clockTick();
          if ((t_portc) !== (16'hEE)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 88");
             $display("Actual Value is ", t_portc );
             $display("Expected Value is ", 16'hEE );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_portb=16'hDD;t_we=1'b0;t_int_abus=16'hFFD;clockTick();
          if ((t_int_rbus) !== (16'hDD)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 90");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", 16'hDD );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_portd=16'hCC;t_we=1'b0;t_int_abus=16'hFFF;clockTick();
          if ((t_int_rbus) !== (16'hCC)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 91");
             $display("Actual Value is ", t_int_rbus );
             $display("Expected Value is ", 16'hCC );
          end


      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

