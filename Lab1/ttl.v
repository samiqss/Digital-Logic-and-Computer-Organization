//================================================================--
// Design Unit	: lab1 (structural)
//
// File Name	: lab1.v
//
// Purpose	: implement logic diagram from Exp 1.
//
// Note		:
//
// Limitations	:
//
// Errors	: none known
//
// Library      : sn7400, sn7432, sn7408
//
// Dependences	: none
//
// Author	: Peter Walsh, Vancouver Island University
//                (Edited by Sami Al-Qusus)
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
// 2.0          SA      Sept 20 Edit to fit my lab1
//================================================================--

module lab1 (D, A, B, C); 

   output D;
   input A, B, C;
   wire I1, I2, I3, I4;

   parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0;


   sn7408 and_gates(I1,I2,I4, DC, DC, , GND, ,DC ,DC , ,DC ,DC , VCC);
   sn7432 or_gates(A, B,I1, A,C, I2,GND,I3 , B,C , ,DC ,DC , VCC);
   sn7400 nand_gates(I3, I4, D, DC, DC, , GND, ,DC ,DC , ,DC ,DC , VCC);

endmodule
