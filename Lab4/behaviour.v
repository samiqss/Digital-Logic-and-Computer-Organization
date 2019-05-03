//================================================================--
// Design Unit	: lab4 (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement seven segment driver (eq from espresso)
//
//espresso -o eqntott esp.in
//a = (y&!z) | (y&z) | (!x&!y&!z) | (x&!y&z) | (w);
//b = (!y&!z) | (!x&z) | (!x&y) | (y&z);
//c = (!x&z) | (x&!z) | (y&z) | (!x&!y&!z) | (x&!y&z);
//d = (y&!z) | (!x&y) | (!x&!y&!z) | (x&!y&z) | (w);
//e = (y&!z) | (!x&!y&!z);
//f = (x&!z) | (!x&!y&!z) | (x&!y&z) | (w);
//g = (!x&y) | (x&!z) | (x&!y&z) | (w);
//dp = ;
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

module lab4 (w, x, y, z, a, b, c, d, e, f, g, dp);

   output reg a, b, c, d, e, f, g, dp;
   input wire w, x, y, z;

   always @(w, x, y ,z) begin
      a = (y & ~z) | (y & z) | (~x & ~y & ~z) | (x & ~y &z) | (w);
      b = (~y & ~z) | (~x & z) | (~x & y) | (y & z);
      c = (~x & z) | (x & ~z) | (y & z) | (~x & ~y & ~z) | (x & ~y & z);
      d = (y & ~z) | (~x & y) | (~x & ~y & ~z) | (x & ~y & z) | (w);
      e = (y & ~z) | (~x & ~y & ~z);
      f = (x & ~z) | (~x & ~y & ~z) | (x & ~y & z) | (w);
      g = (~x & y) | (x & ~z) | (x & ~y & z) | (w);
      dp = 0;
   end

endmodule
