//================================================================--
// Design Unit	: data_path (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement MMA data path 
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author		Date	  Changes
// 1.0		PW		Nov 2016   New version
// 2.0          Sami Al-Qusus   Nov 2018   MMA 
//================================================================--

`include "controlSignal.v"

module data_path (control, IR, int_rbus, int_wbus, int_abus, Z, clk); 

   input wire clk;
   input wire [15:0] int_rbus;
   output wire [15:0] int_abus;
   output wire [15:0] int_wbus;
   output wire Z;
   output reg [3:0] IR;
   input wire [0:`MAX_CONTROL_LINES-1] control;


   reg [15:0] R0, ACC, RN;
   reg [15:0] PC, MR;
   reg [15:0] wbus, rbus, alu;
   reg [15:0] abus;

   always @(posedge clk) begin

      if (control[`INIT_PC] == 1'b1)
         PC <= 16'h0000;

      if (control[`INC_PC] == 1'b1)
          PC <= PC + 1;

      if (control[`IR_RBUS] == 1'b1)
          IR <= int_rbus[15:12];

      if (control[`R0_RBUS] == 1'b1)
          R0 <= int_rbus[11:0];

	     if (control[`ACC_RBUS] == 1'b1)
    	          ACC <= int_rbus;

     	
	  if (control[`ACC_ALU] == 1'b1)
        	  ACC <= alu;
    
     
     if (control[`PC_R0] == 1'b1)
         PC <= R0;

      if (control[`MR_R0] == 1'b1)
         MR <= R0;

   end
  
  // always@(control[`ACC_RBUS], control[`ACC_ALU], RBUS, ALU) begin
//	   if (control[`ACC_RBUS] == 1'b1)
//		   ACC <= int_rbus;
//	   if (control[`ACC_ALU] == 1'b1)
//		   ACC <= alu;
 //  end

   always@(control[`ABUS_PC], control[`ABUS_MR], PC, MR) begin

      if (control[`ABUS_PC] == 1'b1)
          abus <= PC;

      if (control[`ABUS_MR] == 1'b1)
          abus <= MR;
   end 

   always@(control[`ADD_OP], control[`SUB_OP], R0, ACC) begin

      if (control[`ADD_OP] == 1'b1)
         alu <= R0 + ACC;

      if (control[`SUB_OP] == 1'b1) begin
         RN = ~R0 + 1'b1; // blocking assignment
         alu <= ACC + RN;
      end

   end

   always@(control[`WBUS_ACC], ACC) begin

      if (control[`WBUS_ACC] == 1'b1)
         wbus <= ACC;
   end

   assign Z = (alu == 16'b0000000000000000) ? 1'b1 : 1'b0;
   assign int_abus = abus;
   assign int_wbus = wbus;

endmodule
