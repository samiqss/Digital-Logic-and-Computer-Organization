//================================================================--
// Design Unit	: lab9 (structural)
//
// File Name	: ttl.v
//
// Purpose	: implement traffic light controller
//
// Author	: Peter Walsh, Vancouver Island University
// 		 (Edited By: Sami Al-Qusus)
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
// 1.1		PW	June 20 2013 review
// 1.2          SA      Nov  22 2018 Modified for Lab9
//================================================================--

module lab9 (state, clk,sto, lto, car, reset, Hlight, Flight);
	
	output wire hw_R, hw_G, hw_Y, fr_R, fr_G, fr_Y;
	input wire clk, reset, sto, lto, car;
	output wire [0:1] state;
	output wire [0:2] Hlight;
	output wire [0:2] Flight;
	parameter HG = 2'b00, HY=2'b01, FG = 2'b11, FY = 2'b10;
	parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0;
	wire DA, DB, QA, QA_BAR, QB, QB_BAR;

	sn74151 muxA(QA,QA,QA,QA,DA,,GND,GND,sto,VCC,VCC,QB,QB,QB,QB,VCC);
	sn74151 muxB(QA_BAR,hw_Y,QB,QB,DB,,GND,GND,sto,lto,car,QA_BAR,hw_Y,QB,hw_Y,VCC);
	sn7402 nor_gates(hw_G,QA,QB,hw_Y,QA,QB_BAR,GND,QA_BAR,QB_BAR,fr_G,QA_BAR,QB,fr_Y,VCC);
	sn7474 dff(reset,DA,clk,VCC,QA,QA_BAR,GND,QB_BAR,QB,VCC,clk,DB,reset,VCC);

	assign state[0]=QA;
	assign state[1]=QB;
	
	assign hw_R=QA;
	assign fr_R=QA_BAR;

	assign Hlight[0]=hw_R;
	assign Hlight[1]=hw_G;
	assign Hlight[2]=hw_Y;

	assign Flight[0]=fr_R;
	assign Flight[1]=fr_G;
	assign Flight[2]=fr_Y;

endmodule
