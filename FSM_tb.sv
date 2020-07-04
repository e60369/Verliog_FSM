//This is the testbench that we will use to fully test our FSM.
`timescale 1ns/1ps
module FSM_tb ();
logic KEY0, SW0, SW1, SW2, SW3, SW4;
wire [2:0] state;
wire [1:0] Z;

initial 
   begin
	SW0 = 1; SW1 = 0; SW2 = 0; SW3 = 0; SW4 = 0; #10;
	SW0 = 0; SW1 = 0; SW2 = 1; SW3 = 0; SW4 = 0; #10;
	SW0 = 0; SW1 = 1; SW2 = 0; SW3 = 0; SW4 = 0; #10; 
	SW0 = 0; SW1 = 1; SW2 = 0; SW3 = 0; SW4 = 0; #10; 
	SW0 = 0; SW1 = 1; SW2 = 0; SW3 = 0; SW4 = 0; #10; 
	SW0 = 0; SW1 = 0; SW2 = 0; SW3 = 0; SW4 = 1; #10;
	SW0 = 0; SW1 = 0; SW2 = 0; SW3 = 1; SW4 = 0; #10;
	SW0 = 0; SW1 = 1; SW2 = 0; SW3 = 0; SW4 = 0; #10;
   end

initial 
   begin
      KEY0 = 1;
       repeat(18) 
         begin
	    #5 KEY0 = ~KEY0;
 	 end
   end
	
FSM F1(KEY0,SW0,SW1,SW2,SW3,SW4,state,Z);//OK
endmodule

