//================================================================--
// Design Unit	: control names (include)
//
// File Name	: controlSignal.v
//
// Purpose	: include file with control signal names
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author		Date	   Changes
// 1.0		PW		Nov 2016   New version
// 2.0          Sami Al-Qusus   Nov 2018   Modified for MMA 
//================================================================--

//Control signals are all asserted active-high.
//The define macros below are used to enhance readability
//by replacing references like control[0] with control[HALT].
//
//Registers
//---------
//Program counter (PC) 12 bits
//ALU registers (R0, R1, R2, R3) 8 bits each
//Instruction Register (IR) 16 bits
//
//Busses/Signals
//--------------
//Internal address bus (int_abus) 12 bits
//Internal read data bus (int_rbus) 16 bits
//Internal write data bus (int_wbus) 16 bits
//ALU output (alu_out) 8 bits

`define MAX_CONTROL_LINES 14
//control[0:MAX_CONTROL_LINES-1]

`define WE 0 
// (WE) ? MEM mwmoey write cycle : memory read cycle
`define INIT_PC 1
// PC <= 0 
`define INC_PC 2
// PC <=  PC + 1
`define IR_RBUS 3
// IR <= int_rbus 
`define R0_RBUS 4
// R0 <= int_rbus 
`define ACC_RBUS 5
// R1 <= int_rbus 
`define WBUS_ACC 6
// int_wbus <= ACC
`define ACC_ALU 7
// int_wbus <= alu
`define ADD_OP 8
// R0 + R1
`define SUB_OP 9 
// R1 - R0
`define ABUS_MR 10
// int_abus <= MR
`define ABUS_PC 11
// int_abus <= PC
`define PC_R0 12
// PC <= R0
`define MR_R0 13
// MR <=  R0
