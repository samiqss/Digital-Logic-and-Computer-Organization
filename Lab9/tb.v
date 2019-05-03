//================================================================--
// Design Unit  : cew testbench lab9
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

   reg t_reset, t_clk, t_sto, t_lto, t_car;
   wire [2:0] t_Hlights, t_Flights;
   wire [1:0] t_state;

   // state  encoding
   localparam t_HG = 2'b00, t_HY = 2'b01, t_FG = 2'b11, t_FY = 2'b10;

   lab9 cut (t_state,  t_clk, t_sto, t_lto, t_car, t_reset, t_Hlights, t_Flights);

   task clockTick; 
      begin // nasty syntax
         t_clk=0; #3; 
         t_clk=1; #6;
         t_clk=0; #3;
      end
   endtask

   task setState;

      input [1:0]  x;

      begin

         t_reset<=1;#1;t_reset<=0;#1; t_reset<=1;#1;
         case (x)
            t_HG: begin
            end
            t_HY: begin
              t_sto=0;t_lto=1;t_car=1;clockTick(); 
            end
            t_FG: begin
              t_sto=0;t_lto=1;t_car=1;clockTick(); 
              t_sto=1;t_lto=0;t_car=0;clockTick(); 
            end
            t_FY: begin
              t_sto=0;t_lto=1;t_car=1;clockTick(); 
              t_sto=1;t_lto=0;t_car=0;clockTick(); 
              t_sto=0;t_lto=1;t_car=0;clockTick(); 
            end
         endcase
      end
 
   endtask

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      // State t_HG
      cew_Test_Count=cew_Test_Count+1;
          setState(t_HG);
          if ((t_state) !== (t_HG)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 73");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_HG );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_Hlights) !== (3'b 010)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 74");
             $display("Actual Value is ", t_Hlights );
             $display("Expected Value is ", 3'b 010 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_Flights) !== (3'b 100)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 75");
             $display("Actual Value is ", t_Flights );
             $display("Expected Value is ", 3'b 100 );
          end


      // State t_HY
      cew_Test_Count=cew_Test_Count+1;
          setState(t_HY);
          if ((t_state) !== (t_HY)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 78");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_HY );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_Hlights) !== (3'b 001)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 79");
             $display("Actual Value is ", t_Hlights );
             $display("Expected Value is ", 3'b 001 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_Flights) !== (3'b 100)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 80");
             $display("Actual Value is ", t_Flights );
             $display("Expected Value is ", 3'b 100 );
          end


      // State t_FG
      cew_Test_Count=cew_Test_Count+1;
          setState(t_FG);
          if ((t_state) !== (t_FG)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 83");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_FG );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_Hlights) !== (3'b 100)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 84");
             $display("Actual Value is ", t_Hlights );
             $display("Expected Value is ", 3'b 100 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_Flights) !== (3'b 010)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 85");
             $display("Actual Value is ", t_Flights );
             $display("Expected Value is ", 3'b 010 );
          end


      // State t_FY_
      cew_Test_Count=cew_Test_Count+1;
          setState(t_FY);
          if ((t_state) !== (t_FY)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 88");
             $display("Actual Value is ", t_state );
             $display("Expected Value is ", t_FY );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_Hlights) !== (3'b 100)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 89");
             $display("Actual Value is ", t_Hlights );
             $display("Expected Value is ", 3'b 100 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_Flights) !== (3'b 001)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 90");
             $display("Actual Value is ", t_Flights );
             $display("Expected Value is ", 3'b 001 );
          end


      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

