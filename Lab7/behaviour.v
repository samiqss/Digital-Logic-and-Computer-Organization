//================================================================--
// Design Unit	: lab7 (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement non-resetting seq. detector 1100 1000 
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

module lab7 (Z_BAR, state,  clk, X, reset); 

   output reg Z_BAR;
   input wire clk, reset, X;
   output reg [0:2] state;
   reg [0:2] nextState;

   parameter S0 = 3'b001, S1 = 3'b101, S2 = 3'b111;
   parameter S3 = 3'b010, S4 = 3'b011, S5 = 3'b000;

   // state assignment

   always @(posedge clk, negedge reset) begin
      if (reset == 0)
         state<=S0;
      else
         state<=nextState;
   end

   // next state and output  functions

   always @(state, X) begin
      case (state)
         S0: begin
            if (X == 0) begin
               Z_BAR<=1;
               nextState<=S0;
            end else begin
               Z_BAR<=1;
               nextState<=S1;
            end
         end
         S1: begin
            if (X == 0) begin
               Z_BAR<=1;
               nextState<=S4;
            end else begin
               Z_BAR<=1;
               nextState<=S2;
            end
         end
         S2: begin
            if (X == 0) begin
               Z_BAR<=1;
               nextState<=S3;
            end else begin
               Z_BAR<=1;
               nextState<=S2;
            end
         end
         S3: begin
            if (X == 0) begin
               Z_BAR<=0;
               nextState<=S5;
            end else begin
               Z_BAR<=1;
               nextState<=S1;
            end
         end
         S4: begin
            if (X == 0) begin
               Z_BAR<=1;
               nextState<=S5;
            end else begin
               Z_BAR<=1;
               nextState<=S1;
            end
         end
         S5: begin
            if (X == 0) begin
               Z_BAR<=0;
               nextState<=S0;
            end else begin
               Z_BAR<=1;
               nextState<=S1;
            end
         end
     endcase 
   end

endmodule
