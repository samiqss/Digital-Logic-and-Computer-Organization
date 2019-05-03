//================================================================--
// Design Unit	: lab0 (structural)
//
// File Name	: ttl.v
//
// Purpose	: implement 2 input xor gate uning SOP function
//
// Note		:
//
// Limitations	:
//
// Errors	: none known
//
// Library 	: sn7408, sn7432, sn7404
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

   output wire C;
   input wire A, B;

   parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0;
   wire I1, I2, A_BAR, B_BAR;


   sn7408 and_gates(A, B_BAR, I1, A_BAR, B, I2, GND, ,DC ,DC , ,DC ,DC , VCC);
   sn7432 or_gates(I1, I2, C, DC, DC, , GND, ,DC ,DC , ,DC ,DC , VCC);
   sn7404 inv_gates(A, A_BAR, B, B_BAR, DC, , GND, ,DC , ,DC , ,DC , VCC);

endmodule
