//================================================================--
// Design Unit	: lab9 (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement traffic light controller
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

module lab9 (state,  clk, sto, lto, car, reset, Hlights, Flights); 

   output reg [2:0] Hlights, Flights;
   // light order is red green yellow 
   // eg HG -> Hlights==010 -> green highway on others off.
   input wire clk, reset, sto, lto, car;
   output reg [1:0] state;
   reg [1:0] nextState;
   reg [2:0] inp;

   parameter HG = 2'b00, HY = 2'b01, FG = 2'b11, FY = 2'b10;

   // state assignment

   always @(posedge clk, negedge reset) begin
      if (reset == 0)
         state<=HG;
      else
         state<=nextState;
   end

   // next state functions

   always @(state, sto, lto, car) begin
      inp={sto,lto,car};
      case (state)
         HG: begin
            Hlights= 3'b 010;
            Flights= 3'b 100;
            case  (inp)
               3'b000: nextState<=HG;
               3'b001: nextState<=HG;
               3'b010: nextState<=HG;
               3'b011: nextState<=HY;
               3'b100: nextState<=HG;
               3'b101: nextState<=HG;
               3'b110: nextState<=HG;
               3'b111: nextState<=HY;
            endcase
         end
         HY: begin
            Hlights= 3'b 001;
            Flights= 3'b 100;
            case  (inp)
               3'b000: nextState<=HY;
               3'b001: nextState<=HY;
               3'b010: nextState<=HY;
               3'b011: nextState<=HY;
               3'b100: nextState<=FG;
               3'b101: nextState<=FG;
               3'b110: nextState<=FG;
               3'b111: nextState<=FG;
            endcase
         end
         FG: begin
            Hlights= 3'b 100;
            Flights= 3'b 010;
            case  (inp)
               3'b000: nextState<=FG;
               3'b001: nextState<=FG;
               3'b010: nextState<=FY;
               3'b011: nextState<=FY;
               3'b100: nextState<=FY;
               3'b101: nextState<=FG;
               3'b110: nextState<=FY;
               3'b111: nextState<=FY;
            endcase
         end
         FY: begin
            Hlights= 3'b 100;
            Flights= 3'b 001;
            case  (inp)
               3'b000: nextState<=FY;
               3'b001: nextState<=FY;
               3'b010: nextState<=FY;
               3'b011: nextState<=FY;
               3'b100: nextState<=HG;
               3'b101: nextState<=HG;
               3'b110: nextState<=HG;
               3'b111: nextState<=HG;
            endcase
         end

     endcase 
   end

endmodule
