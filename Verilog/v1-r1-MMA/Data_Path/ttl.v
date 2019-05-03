//================================================================--
// Design Unit	: moore (structural)
//
// File Name	: ttl.v
//
// Purpose	: implement the FSM spcified in ./README
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

module moore (z, s, clk, x, reset); 

   output z;
   input wire clk, reset, x;
   output reg [0:1] s;
 
   parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
   parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0;
   wire  Q0, Q0_BAR, Q1, Q1_BAR, D0, D1, I1, I2, I3;

   sn7408 and_gates(Q0_BAR, Q1, I1, Q0, Q1_BAR, I2, GND, I3 ,x ,Q1_BAR , ,DC ,DC ,VCC);
   sn7432 or_gates(Q1, Q0, z, I1, I2, D0, GND, D1, I2, I3 , ,DC ,DC , VCC);
   sn74175 dff(reset, Q0, Q0_BAR, D0, D1, Q1_BAR, Q1, GND, clk , , ,DC ,DC , , ,VCC);

   always @(Q0) begin
      s[0]<=Q0;
   end

   always @(Q1) begin
      s[1]<=Q1;
   end

endmodule
