//================================================================--
// Design Unit	: lab1 (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement logic diagram from Exp 1
//
// Note		:
//
// Limitations	:
//
// Errors	: none known
//
// Library 	: none
//
// Dependences	: none
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

module lab1 (D, A, B, C); 

   output reg D;
   input wire A, B, C;

   always @(A, B, C) begin
      D <= ((A | B) & (A | C)) ~& (B | C);
   end

endmodule
