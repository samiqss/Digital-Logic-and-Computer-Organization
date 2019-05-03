//================================================================--
// Design Unit	: lab3 (structural)
//
// File Name	: ttl.v
//
// Purpose	: implement LED driver (characters A through F)
//
// Note		:
//
// Limitations	:
//
// Errors	: none known
//
// Library 	: sn7408, sn7404, sn7432, sn7411 
//
// Dependences	: none
//
// Author	: Peter Walsh, Vancouver Island University
//                (Edited by: Sami Al-Qusus)
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
// 2.0          SA      Oct  11 Made changes for my Lab3
//================================================================--

module lab3 (w, x, y, z, a, b, c, d, e, f, g, dp); 

   output  a, b, c, d, e, f, g, dp;
   input w, x, y, z;

   parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0;
   wire I1, I2, I3, I4, W_BAR,X_BAR, Y_BAR, Z_BAR,IA,IB,ID,IDP;

   sn7404 inv1_gates(w, W_BAR, x, X_BAR, y, Y_BAR, GND, Z_BAR, z, ,DC , ,DC , VCC);
   sn7404 inv2_gates(IA, a, IB, b, ID, d, GND, dp, IDP, ,DC , ,DC , VCC);
   sn7432 or_gates(X_BAR, z, I1, y ,Z_BAR ,I2 , GND, I3,Z_BAR ,x ,I4,x ,y, VCC);
   sn7408 and_gates(x, I2, IB, I4, w, IDP, GND, , DC, DC, ,DC,DC ,VCC);
   sn7411 and_3input_gates(I1, I2, I3, I1, I2, ID, GND, , DC, DC,DC ,IA,Y_BAR ,VCC);

   assign g=y;
   assign c=b;
   assign e=a;
   assign f=a;
//   always @(y) begin
  //    g<=y;
  // end

  
endmodule
