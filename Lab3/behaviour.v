//================================================================--
// Design Unit	: lab3 (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement seven segment driver (eq from espresso)
//
//espresso -o eqntott esp.in
//a = (x&!z) | (y) | (!y&z);
//b = (!x) | (!y&z);
//c = (!x) | (!y&z);
//d = (!x&z) | (x&!z) | (!y&z);
//e = (x&!z) | (y) | (!y&z);
//f = (x&!z) | (y) | (!y&z);
//g = (y);
//dp = (!x&!y) | (!w);
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

module lab3 (w, x, y, z, a, b, c, d, e, f, g, dp);

   output reg a, b, c, d, e, f, g, dp;
   input wire w, x, y, z;

   always @(w, x, y ,z) begin
      a <= (x & ~z) | (y) | (~y & z);
      b <= (~x) | (~y & z);
      c <= (~x) | (~y & z);
      d <= (~x & z) | (x & ~z) | (~y & z);
      e <= (x & ~z) | (y) | (~y & z);
      f <= (x & ~z) | (y) | (~y & z);
      g <= (y);
      dp <= (~x & ~y) | (~w);

   end

endmodule
