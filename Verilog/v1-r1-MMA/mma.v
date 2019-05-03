//================================================================--
// Design Unit  : mma v1 r1
//
// File Name    : mma.v
//
// Purpose      : main for ssbc
//
// Author       : Peter Walsh, Vancouver Island University
//
// System       : icarus (Linux)
//
//------------------------------------------------------------------
// Revision List
// Version      Author  	Date       Changes
// 1.0          PW      	Nov 2016   New version
// 2.0          Sami Al-Qusus   Nov 2018   Modified for MMA 
//================================================================--

`include "controlSignal.v"

module mma();

   integer tmp, ch;
   parameter STDIN = 32'h8000_0000;

   wire [15:0] t_int_rbus;
   wire [15:0] t_int_abus;
   wire [15:0] t_int_wbus;
   wire t_Z;
   wire [3:0] t_opcode;
   wire [15:0] t_psw;
   wire [15:0] t_porta;
   wire [15:0] t_portc;
   reg  [15:0] t_portb;
   reg  [15:0] t_portd;
   wire [0:`MAX_CONTROL_LINES-1] t_control;
   wire t_halt, t_fault, t_break;
   reg  t_clk, t_reset;

   control_unit CU (t_control, t_clk, t_opcode, t_psw, t_reset, t_halt, t_fault, t_break);
   memory_unit  MU (t_control[`WE], t_int_rbus, t_int_wbus, t_int_abus, t_porta, t_portb, t_portc, t_portd, t_psw, t_Z, t_clk, t_reset);
   data_path DP (t_control, t_opcode, t_int_rbus, t_int_wbus, t_int_abus, t_Z, t_clk);

   function [15:0] getw;

      input  integer fh;
      integer i, ch;

      begin
         i = 15;
         ch = $fgetc(fh); // priming read
         while  ((i >= 0) && (!$feof(fh)) && (ch != "\n")) begin
            if (ch == "0")
               getw[i] = 1'b0;
            else  if (ch == "1")
               getw[i] = 1'b1;

            ch = $fgetc(fh);
            i = i -1;
         end
      end
   endfunction

   task clockTick;
      begin // nasty syntax
         t_clk<=0; #3;
         t_clk<=1; #6;
         t_clk<=0; #3;
      end
   endtask


   task printMenu;

      begin
        $display("+------------------------+ ");
        $display("|  R: RESET              | ");
        $display("|  b: BREAK              | ");
        $display("|  r: RUN                | ");
        $display("|  A: READ PORT A        | ");
        $display("|  B: WRITE PORT B       | ");
        $display("|  C: READ PORT C        | ");
        $display("|  D: WRITE PORT D       | ");
        $display("|  s: STATUS             | ");
        $display("|  t: TOP                | ");
        $display("|  p: PSW                | ");
        $display("|  q: QUIT               | ");
        $display("|                        | ");
        $display("|  Enter menu selection: | ");
        $display("+------------------------+ ");
      end

   endtask

   initial begin

       while (1) begin
         printMenu();

         ch = $fgetc(STDIN);
         //tmp = $fscanf(STDIN, "%c", ch);
         tmp = ch;
         while ((tmp != "\n") && (!$feof(STDIN)))
            tmp = $fgetc(STDIN);

         case (ch)
            "R" : begin
               t_reset <= 1'b1; #1; 
               t_reset <= 1'b0; #1; 
            end
            "b" : begin 
               clockTick();
               while ((t_break != 1'b1) && (t_halt != 1'b1) && (t_fault != 1'b1))
                 clockTick();
            end
            "r" : while ((t_halt != 1'b1) && (t_fault != 1'b1))  begin
               clockTick();
            end
            "A" : $display("Port A value: %b", t_porta);
            "B" : begin
               $display("Enter Port B value in binary (16 bits) ");
               t_portb <= getw(STDIN);
            end
            "C" : $display("Port C value: %b", t_portc);
            "D" : begin
               $display("Enter Port D value in binary (16 bits) ");
               t_portd <= getw(STDIN);
            end
            "s" : begin
               $display("The value of halt is ", t_halt);
               $display("The value of fault is ", t_fault);
            end
            "t" : $display("command top is not supported");
            "p" : $display("%b", t_psw);
            "q" : $finish();
         endcase

      end
   end

endmodule

