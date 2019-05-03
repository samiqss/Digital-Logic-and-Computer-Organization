//================================================================--
// Design Unit	: lab2 (structural)
//
// File Name	: ttl.v
//
// Purpose	: implement function from lab2
//
// Note		:
//
// Limitations	:
//
// Errors	: none known
//
// Library 	: sn7408, sn7432, sn7404, sn7486
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
//================================================================--

module lab2 (E, A, B, C, D); 

   output E;
   input A, B, C, D;

   parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0;
   wire I1, I2, I3, I4, A_BAR, B_BAR, C_BAR, D_BAR;

   sn7408 and_gates(A_BAR, C_BAR, I1, B_BAR, C, I3, GND, I4, I2, I1, ,DC ,DC ,VCC);
   sn7486 xor_gates(B, D, I2,DC ,DC , , GND, ,DC ,DC , ,DC ,DC ,VCC);
   sn7432 or_gates(I3, I4, E, DC ,DC , , GND, ,DC ,DC , ,DC ,DC , VCC);
   sn7404 inv_gates(A, A_BAR, B, B_BAR, C, C_BAR, GND, D_BAR, D, ,DC , ,DC , VCC);

endmodule
