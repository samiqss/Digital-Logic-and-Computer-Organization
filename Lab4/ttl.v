//================================================================--
// Design Unit	: lab4 (structural)
//
// File Name	: ttl.v
//
// Purpose	: implement LED driver (digits 0 through 9)
//
// Note		:
//
// Limitations	:
//
// Errors	: none known
//
// Library 	: sn7432, sn7410, sn7413, sn74154
//
// Dependences	: none
//
// Author	: Peter Walsh, Vancouver Island University
//	          (Edited by Sami Al-Qusus Oct 25, 2018)
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
//================================================================--

module lab4 (w, x, y, z, a, b, c, d, e, f, g, dp); 

   output a, b, c, d, e, f, g, dp;
   input w, x, y, z;

   parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0;
   reg dp=0, G1_BAR=0, G2_BAR=0;
   wire  I1,I2,I3,I4,I5,D0_BAR,D1_BAR,D2_BAR,D3_BAR,D4_BAR,D5_BAR,D6_BAR,D7_BAR,D8_BAR,D9_BAR,D10_BAR,D11_BAR,D12_BAR,D13_BAR,D14_BAR,D15_BAR;

   sn74154 decoder(D0_BAR,D1_BAR,D2_BAR,D3_BAR,D4_BAR,D5_BAR,D6_BAR,D7_BAR,D8_BAR,D9_BAR,D10_BAR,GND,D11_BAR,D12_BAR,D13_BAR,D14_BAR,D15_BAR,G1_BAR,G2_BAR,w,x,y,z,VCC);
   sn7408 and1_gate(D1_BAR,D4_BAR,a,D5_BAR,D6_BAR,b,GND,d,a,D7_BAR,I1,D3_BAR,D5_BAR,VCC);
   sn7408 and2_gate(D9_BAR,d,I2,I2,I1,e,GND,I3,D2_BAR,D1_BAR,I4,D3_BAR,D7_BAR,VCC);
   sn7408 and3_gate(I3,I4,f,D0_BAR,D1_BAR,I5,GND,g,I5,D7_BAR,,DC,DC,VCC);
   wire c=D2_BAR;
endmodule
