//================================================================--
// Design Unit	: lab8 (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement 2-bit Grey code counter
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
// 1.1		PW	June 20 2013 review
//================================================================--

module lab8 (state,  clk, SET, CLR, reset); 

   input wire clk, reset, SET, CLR;
   output reg [0:1] state;
   reg [0:1] nextState;

   parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b11, S3 = 2'b10;

   // state assignment

   always @(posedge clk, negedge reset) begin
      if (reset == 0)
         state<=S0;
      else
         state<=nextState;
   end

   // next state functions

   always @(state, SET, CLR) begin
      case (state)
         S0: begin
            if ((SET == 0) && (CLR == 0)) 
               nextState<=S1;
            else if ((SET == 0) && (CLR == 1))
               nextState<=S0;
            else if ((SET == 1) && (CLR == 0))
               nextState<=S2;
         end
         S1: begin
            if ((SET == 0) && (CLR == 0)) 
               nextState<=S2;
            else if ((SET == 0) && (CLR == 1))
               nextState<=S0;
            else if ((SET == 1) && (CLR == 0))
               nextState<=S2;
         end
         S2: begin
            if ((SET == 0) && (CLR == 0)) 
               nextState<=S3;
            else if ((SET == 0) && (CLR == 1))
               nextState<=S0;
            else if ((SET == 1) && (CLR == 0))
               nextState<=S2;
         end
         S3: begin
            if ((SET == 0) && (CLR == 0)) 
               nextState<=S0;
            else if ((SET == 0) && (CLR == 1))
               nextState<=S0;
            else if ((SET == 1) && (CLR == 0))
               nextState<=S2;
         end

     endcase 
   end

endmodule
