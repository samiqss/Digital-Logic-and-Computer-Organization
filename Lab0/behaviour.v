//================================================================--
// Design Unit	: lab0 (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: 2 input xor gate
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

module lab0 (C, A, B); 

   output reg C;
   input wire A, B;

   always @(A, B) begin
      C = A ^ B;
   end

endmodule
