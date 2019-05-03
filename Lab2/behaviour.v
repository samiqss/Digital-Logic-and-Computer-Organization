//================================================================--
// Design Unit	: lab2 (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement logic diagram from Exp 2
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

module lab2 (E, A, B, C, D); 

   output reg E;
   input wire A, B, C, D;

   always @(A, B, C, D) begin
      // structural logic description (not minimized)
      E <= ((~A & ~C) & (B ^ D)) | (~B & C);
   end

endmodule
