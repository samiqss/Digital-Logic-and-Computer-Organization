//================================================================--
// Design Unit	: lab8 (structural)
//
// File Name	: ttl.v
//
// Purpose	: implement 2-bit Grey code counter
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

module lab8 (state,  clk, SET, CLR, reset);

   input wire clk, reset, SET, CLR;
   output wire [0:1] state;
 
   parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b11, S3 = 2'b10;
   parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0;
   wire  JA, KA, JB, KB, QA, QA_BAR, QB, QB_BAR, SET_BAR, CLR_BAR, I1, I2, I3, I4;

   sn7408 and_gates();
   sn7432 or_gates();
   sn7404 inv_gates();

   sn7476 jkff();

   assign state[0]=QA;
   assign state[1]=QB;
endmodule
