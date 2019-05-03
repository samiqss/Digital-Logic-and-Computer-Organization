//================================================================--
// Design Unit	: Control Unit (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement the MMA Control Unit FSM
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author  	Date	    Changes
// 1.0		PW	        Nov 2016   New version
// 2.0          Sami Al-Qusus   Nov 2018   MMA 
//================================================================--

`include "controlSignal.v"
`include "controlParam.v"

module control_unit (control, clk, opcode, psw, reset, halt, fault, break); 

   input wire clk;
   input wire reset;
   input wire [3:0] opcode;
   input wire [15:0] psw;
   output reg [0:`MAX_CONTROL_LINES-1] control;
   output reg halt, fault, break;

   reg [4:0] state, nextState;

   task clearControl;

      integer i;

      begin
         for (i=0; i<`MAX_CONTROL_LINES; i=i+1)
            control[i] <= 1'b0;
         #1;
      end

   endtask

   // state assignment

   always @(posedge clk, posedge reset) begin
      if (reset == 1'b1) begin
         state <= `INIT0;
         halt <= 1'b0;
         fault <= 1'b0;
         break <= 1'b0;
      end else 
         state <= nextState;
   end

   // next state and output  functions

   always @(state, opcode, psw) begin
      case (state)
         `INIT0: begin
            clearControl();
            control[`INIT_PC] <= 1'b1; 
            nextState <= `INIT1;
         end
         `INIT1: begin
            clearControl();
            control[`ABUS_PC] <= 1'b1; 
            control[`WE] <= 1'b0; 
            break <= 1'b0;
            nextState <= `INIT2;
         end
         `INIT2: begin
            clearControl();
            control[`IR_RBUS] <= 1'b1; 
            control[`INC_PC] <= 1'b1; 
            nextState <= `INIT3;
         end
         `INIT3: begin
            clearControl();
            case (opcode) 
               4'h0 : begin
                  // nop
                  break <= 1'b1;
                  nextState <= `INIT1;
               end
               4'h1 : begin
                  // halt
                  break <= 1'b1;
                  halt <= 1'b1;
               end
               4'h2 : begin
                  nextState <= `LDA0;
               end
               4'h3 : begin
                  nextState <= `STO0;
               end
	       4'h4 : begin
		  nextState <= `ADD0;
	       end
	       4'h5 : begin
		  nextState <= `SUB0;
	       end
	       4'h6 : begin
                   nextState <= `JMP0;
               end
               4'h7 : begin
                  nextState <= `JNE0;
               end
               default : fault <= 1'b1;
            endcase
         end
         `LDA0 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1; 
          //  control[`MR_R0] <= 1'b1;
            nextState <= `LDA1;
         end
	 `LDA1 : begin
		 clearControl();
		 control[`MR_R0] <= 1'b1;
		 nextState <= `LDA2;
	 end
         `LDA2 : begin
            clearControl();
            control[`ABUS_MR]<= 1'b1;
            control[`WE] <= 1'b0; 
            nextState <= `LDA3;
         end
         `LDA3 : begin
          clearControl();
            control[`ACC_RBUS]<= 1'b1;
            nextState <= `LDA4;
         end
         `LDA4 : begin
          clearControl();
            //control[`INC_PC]<= 1'b1;
            nextState <= `INIT1;
         end
         `STO0 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1; 
          //  control[`MR_R0] <= 1'b1;
            nextState <= `STO1;
         end
	 `STO1 : begin
		 clearControl();
		 control[`MR_R0] <= 1'b1;
		 nextState <= `STO2;
	 end
         `STO2 : begin
		 clearControl();
            control[`WBUS_ACC] <= 1'b1; 
            control[`ABUS_MR]<= 1'b1;
            control[`WE] <= 1'b1;
            nextState <= `INIT1;
         end
         `ADD0 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1; 
	    nextState <= `ADD1;
    	  end
	  `ADD1 : begin
            clearControl();
            control[`MR_R0] <= 1'b1;
            nextState <= `ADD2;
         end
         `ADD2 : begin
            clearControl();
            control[`ABUS_MR] <= 1'b1;
            control[`WE] <= 1'b0;
            nextState <= `ADD3;
         end
         `ADD3 : begin
            clearControl();
            control[`R0_RBUS]<= 1'b1;
            nextState <= `ADD4;
         end
         `ADD4 : begin
            clearControl();
            control[`ADD_OP] <= 1'b1;
            nextState <= `ADD5;
         end
         `ADD5 : begin
            clearControl();
            control[`ACC_ALU] <= 1'b1;
            nextState <= `ADD6;
         end
     
         `ADD6 : begin
		 clearControl();
           // control[`INC_PC] <= 1'b1;
            break <= 1'b0;
            nextState <= `INIT1;
         end
         `SUB0 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1; 
          //  control[`MR_R0] <= 1'b1;
            nextState <= `SUB1;
         end
	 `SUB1 : begin
	   clearControl();
       	   control[`MR_R0] <= 1'b1;
 	   nextState <= `SUB2;
	end 
	`SUB2 : begin
            clearControl();
            control[`ABUS_MR] <= 1'b1;
            control[`WE] <= 1'b0;
	    nextState <= `SUB3;
    end
         `SUB3 : begin
            clearControl();
            control[`R0_RBUS]<= 1'b1;
            nextState <= `SUB4;
         end
         `SUB4 : begin
            clearControl();
            control[`SUB_OP] <= 1'b1;
            nextState <= `SUB5;
         end
         `SUB5 : begin
            clearControl();
            control[`ACC_ALU] <= 1'b1;
            nextState <= `SUB6;
         end
         `SUB6 : begin
		 clearControl();
            //control[`INC_PC] <= 1'b1;
            break <= 1'b0;
            nextState <= `INIT1;
         end
         
	 
         `JMP0 : begin
	     	clearControl();
	     	control[`R0_RBUS]<= 1'b1;
	     	nextState <= `JMP1;
	 end
	 
	 `JMP1 : begin
		 clearControl();
	     control[`PC_R0] <= 1'b1;
	     break <= 1'b0;
	     nextState <= `INIT1;
     	end
	 `JNE0 : begin
		 clearControl();
		 control[`R0_RBUS]<= 1'b1;
		 nextState <= `JNE1;
	 end
         `JNE1 : begin
            clearControl();
            if (psw[15] == 1'b0) begin
               // jump
               clearControl();
               control[`PC_R0] <= 1'b1;
               break <= 1'b0;
               nextState <= `INIT1;
            end else begin
               nextState <= `INIT1;
            end
         end   
      endcase
   end

endmodule
