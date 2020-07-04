//This is the parent module for Quartus programing purposes which assigns the inputs/output to our DE0-CV.
module FSM_pv (input KEY0,SW0,SW1,SW2,SW3,SW4,output logic [6:0] HEX0,HEX1,HEX2,HEX3,output logic [6:0] LED_SW);
reg [7:0] Message [3:0];
wire [2:0] state;
logic [1:0] Z;

   always @ (*) 
       begin
        Message[3] = " ";
        Message[2] = " ";
        Message[1] = " ";
        Message[0] = " ";
	LED_SW = 0;
	
        case (KEY0)
            1'b0 : begin
		case (state)
		   3'b000 : begin
			if (SW0) begin
                 		 Message[3] = "M";
                 		 Message[2] = "U";
                 		 Message[1] = "R";
                 		 Message[0] = "P";
				 LED_SW[0] = 1; 
				 LED_SW[5] = 1;
				 LED_SW[6] = 0; 
				 end
			else if (SW2) begin
				 Message[3] = "S";
                 		 Message[2] = "_";
                 		 Message[1] = "0";
                 		 Message[0] = "1";
				 LED_SW[2] = 1; 
				 LED_SW[5] = 0;
				 LED_SW[6] = 1; 
				 end
			else if (SW3) begin
				 Message[3] = "S";
                 		 Message[2] = "_";
                 		 Message[1] = "0";
                 		 Message[0] = "3";
				 LED_SW[3] = 1; 
				 LED_SW[5] = 0;
				 LED_SW[6] = 0; 
				 end
			     end
		  3'b001 : begin
			if (SW0) begin
                 		 Message[3] = "M";
                 		 Message[2] = "U";
                 		 Message[1] = "R";
                 		 Message[0] = "P";
				 LED_SW[0] = 1; 
				 LED_SW[5] = 1;
				 LED_SW[6] = 0; 
				 end
			else if (SW1) begin
				 Message[3] = "S";
                 		 Message[2] = "_";
                 		 Message[1] = "0";
                 		 Message[0] = "2";
				 LED_SW[1] = 1; 
				 LED_SW[5] = 0;
				 LED_SW[6] = 0; 
				 end
			     end
		3'b010 : begin
			if (SW0) begin
                 		 Message[3] = "M";
                 		 Message[2] = "U";
                 		 Message[1] = "R";
                 		 Message[0] = "P";
				 LED_SW[0] = 1; 
				 LED_SW[5] = 1;
				 LED_SW[6] = 0; 
				 end
			else if (SW1) begin
				 Message[3] = "S";
                 		 Message[2] = "_";
                 		 Message[1] = "0";
                 		 Message[0] = "1";
				 LED_SW[1] = 1; 
				 LED_SW[5] = 0;
				 LED_SW[6] = 1; 
				 end
			else if (SW4) begin
				 Message[3] = "S";
                 		 Message[2] = "_";
                 		 Message[1] = "0";
                 		 Message[0] = "3";
				 LED_SW[4] = 1; 
				 LED_SW[5] = 0;
				 LED_SW[6] = 0; 
				 end
			     end
		3'b011 : begin
			if (SW0) begin
                 		 Message[3] = "M";
                 		 Message[2] = "U";
                 		 Message[1] = "R";
                 		 Message[0] = "P";
				 LED_SW[0] = 1; 
				 LED_SW[5] = 1;
				 LED_SW[6] = 0; 
				 end
			else if (SW1) begin
				 Message[3] = "S";
                 		 Message[2] = "_";
                 		 Message[1] = "0";
                 		 Message[0] = "1";
				 LED_SW[1] = 1; 
				 LED_SW[5] = 0;
				 LED_SW[6] = 1; 
				 end
			else if (SW3) begin
				 Message[3] = "S";
                 		 Message[2] = "_";
                 		 Message[1] = "0";
                 		 Message[0] = "4";
				 LED_SW[3] = 1; 
				 LED_SW[5] = 1;
				 LED_SW[6] = 1; 
				 end
			     end
		3'b100 : begin
			if (SW0) begin
                 		 Message[3] = "M";
                 		 Message[2] = "U";
                 		 Message[1] = "R";
                 		 Message[0] = "P";
				 LED_SW[0] = 1; 
				 LED_SW[5] = 1;
				 LED_SW[6] = 0; 
				 end
			else if (SW1) begin
				 Message[3] = "S";
                 		 Message[2] = "_";
                 		 Message[1] = "0";
                 		 Message[0] = "1";
				 LED_SW[1] = 1; 
				 LED_SW[5] = 0;
				 LED_SW[6] = 1; 
				 end
			     end
			endcase
		     end
		default : begin
		 Message[3] = " ";
       		 Message[2] = " ";
       		 Message[1] = " ";
       		 Message[0] = " ";
		 LED_SW = 0;
			 end
		  endcase
		end
ASCII27Seg SevH3 (Message[3], HEX3);
ASCII27Seg SevH2 (Message[2], HEX2);
ASCII27Seg SevH1 (Message[1], HEX1);
ASCII27Seg SevH0 (Message[0], HEX0);
FSM F1 (KEY0,SW0,SW1,SW2,SW3,SW4,state,Z);
endmodule

//This is the parent module in which we define our FSM
module FSM (input KEY0,SW0,SW1,SW2,SW3,SW4, output logic [2:0] state, output logic [1:0] Z);//OK
localparam S0 = 3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;//OK
logic [2:0] next_state;

//This is the implementation of our state transition table. 
always_comb 
  begin
   next_state = state;
   Z = 2'b01;
   case (state)
	S0 : begin
		Z = 2'b01;
		if (SW2)
 		next_state = S1;
		else if (SW3)
		next_state = S3; 
		else
		next_state = state;
	      end
	S1 : begin
		Z = 2'b10;
		if (SW1)
		next_state = S2;
		else
		next_state = state;
	     end
	S2 : begin
		Z = 2'b00;
		if (SW1)
		next_state = S1;
		else if (SW4)
		next_state = S3;
		else
		next_state = state;
	      end
	S3 : begin
		Z = 2'b00;
		if (SW1)
		next_state = S1;
		else if (SW3)
		next_state = S4;
		else
		next_state = state;
	     end
	S4 : begin
		Z = 2'b11;
		if (SW0)
		next_state = S0;
		else if (SW1)
		next_state = S1;
		else
		next_state = state;
	     end
	default : begin next_state = S0; Z = 2'b01; end
   endcase
  end

//This flip flop sets the state to next_state on each tick of the clock unless SW0 is toggled.
always_ff @ (posedge KEY0 or posedge SW0)
	if (SW0)
	   state <= S0;
	else
	   state <= next_state;
endmodule

/*This is a debounce module, not used in our FSM, but here to demonstrate that it could be in used 
if our board didn't already have the hardware to do this.*/
module Debounce #(parameter cntSize = 8)
( 
input reset,
input Clk,
input PB,
output reg pulse
);

reg [cntSize-1:0] cnt;

 always @ (posedge Clk)
   if (reset)
	cnt <= {cntSize{1'b0}};
   else 
	begin
	   cnt <= {cnt[cntSize-2:0],PB};
	   if (&cnt)	   pulse <= 1'b1;
	   else if (~|cnt) pulse <= 1'b0;
	end
endmodule


//This is the ASCII to 7-Segement Decoder.
module ASCII27Seg (input [7:0] AsciiCode, output reg [6:0] HexSeg);
    always @ (*) begin
        HexSeg = 7'd0;
        $display ("AsciiCode %b", AsciiCode);
        case (AsciiCode)
//            A
            8'h41 : begin
		  HexSeg[3] = 1;
	       end
//            a
            8'h61 : begin
		  HexSeg[3] = 1;
	       end
//            B
            8'h42 : begin
                  HexSeg[0] = 1; HexSeg[1] = 1;
               end
//            b
            8'h62 : begin
                  HexSeg[0] = 1; HexSeg[1] = 1;
               end
//            C
            8'h43 : begin
                  HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[6] = 1;
               end
//            c
            8'h63 : begin
                  HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[6] = 1;
               end
//            D
            8'h44 : begin
                  HexSeg[0] = 1; HexSeg[5] = 1;
               end
//            d
            8'h64 : begin
                  HexSeg[0] = 1; HexSeg[5] = 1;
               end
//            E
            8'h45 : begin
                  HexSeg[1] = 1; HexSeg[2] = 1;
               end
//            e
            8'h65 : begin
                  HexSeg[1] = 1; HexSeg[2] = 1;
               end
//            F
            8'h46 : begin
                  HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1;
               end
//            f
            8'h66 : begin
                  HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1;
               end
//            G
            8'h47 : begin
                  HexSeg[4] = 1;
               end
//            g
            8'h67 : begin
                  HexSeg[4] = 1;
               end
//            H
            8'h48 : begin
                  HexSeg[0] = 1; HexSeg[3] = 1;
               end
//            h
            8'h68 : begin
                  HexSeg[0] = 1; HexSeg[3] = 1;
               end
//            I
            8'h49 : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1; HexSeg[6] = 1;
               end
//            i
            8'h69 : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1; HexSeg[6] = 1;
               end
//            J
            8'h4A : begin
                  HexSeg[0] = 1; HexSeg[5] = 1; HexSeg[6] = 1;     
               end
//            j
            8'h6A : begin
                  HexSeg[0] = 1; HexSeg[5] = 1; HexSeg[6] = 1;
               end
//            K
            8'h4B : begin
                  HexSeg[0] = 1; HexSeg[3] = 1;
               end
//            k
            8'h6B : begin
                  HexSeg[0] = 1; HexSeg[3] = 1;
               end
//            L
            8'h4C : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[6] = 1;
               end
//            l
            8'h6C : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[6] = 1;
               end
//            M
            8'h4D : begin
                  HexSeg[1] = 1; HexSeg[3] = 1; HexSeg[5] = 1; HexSeg[6] = 1;
               end
//            m
            8'h6D : begin
                  HexSeg[1] = 1; HexSeg[3] = 1; HexSeg[5] = 1; HexSeg[6] = 1;
               end
//            N
            8'h4E : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[3] = 1; HexSeg[5] = 1;
               end
//            n
            8'h6E : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[3] = 1; HexSeg[5] = 1;
               end
//            O
            8'h4F : begin
                  HexSeg[6] = 1;
               end
//            o
            8'h6F : begin
                  HexSeg[6] = 1;
               end
//            P
            8'h50 : begin
                  HexSeg[2] = 1; HexSeg[3] = 1;
               end
//            p
            8'h70 : begin
                  HexSeg[2] = 1; HexSeg[3] = 1;
               end
//            Q
            8'h51 : begin
                  HexSeg[3] = 1; HexSeg[4] = 1;
               end
//            q
            8'h71 : begin
                  HexSeg[3] = 1; HexSeg[4] = 1;
               end
//            R
            8'h52 : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1; HexSeg[5] = 1;
               end
//            r
            8'h72 : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1; HexSeg[5] = 1;
               end
//            S
            8'h53 : begin
                  HexSeg[1] = 1; HexSeg[4] = 1;
               end
//            s
            8'h73 : begin
                  HexSeg[1] = 1; HexSeg[4] = 1;
               end
//            T
            8'h54 : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1;
               end
//            t
            8'h74 : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1;
               end
//            U
            8'h55 : begin
                  HexSeg[0] = 1; HexSeg[6] = 1;
               end
//            u
            8'h75 : begin
                  HexSeg[0] = 1; HexSeg[6] = 1;
               end
//            V
            8'h56 : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[5] = 1; HexSeg[6] = 1;
               end
//            v
            8'h76 : begin
                  HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[5] = 1; HexSeg[6] = 1;
               end
//            W
            8'h57 : begin
                  HexSeg[0] = 1; HexSeg[2] = 1; HexSeg[4] = 1; HexSeg[6] = 1;
               end
//            w
            8'h77 : begin
                  HexSeg[0] = 1; HexSeg[2] = 1; HexSeg[4] = 1; HexSeg[6] = 1;
               end
//            X
            8'h58 : begin
                  HexSeg[0] = 1; HexSeg[3] = 1;
               end
//            x
            8'h78 : begin
                  HexSeg[0] = 1; HexSeg[3] = 1;
               end
//            Y
            8'h59 : begin
                  HexSeg[0] = 1; HexSeg[4] = 1;
               end
//            y
            8'h79 : begin
                  HexSeg[0] = 1; HexSeg[4] = 1;
               end
//            Z
            8'h5A : begin
                  HexSeg[2] = 1; HexSeg[5] = 1;
               end
//            z
            8'h7A : begin
                  HexSeg[2] = 1; HexSeg[5] = 1;
               end
//            0
            8'h30 : begin
                  HexSeg[6] = 1;
               end
//            1
            8'h31 : begin
                  HexSeg[0] = 1; HexSeg[3] = 1; HexSeg[4] = 1; HexSeg[5] = 1; HexSeg[6] = 1;
               end
//            2
            8'h32 : begin
                  HexSeg[2] = 1; HexSeg[5] = 1;
               end
//            3
            8'h33 : begin
                  HexSeg[4] = 1; HexSeg[5] = 1;
               end
//            4
            8'h34 : begin
                  HexSeg[0] = 1; HexSeg[3] = 1; HexSeg[4] = 1;
               end
//            5
            8'h35 : begin
                  HexSeg[1] = 1; HexSeg[4] = 1;
               end
//            6
            8'h36 : begin
                  HexSeg[1] = 1;
               end
//            7
            8'h37 : begin
                  HexSeg[3] = 1; HexSeg[4] = 1; HexSeg[5] = 1; HexSeg[6] = 1;
               end
//            8
            8'h38 : begin
               end
//            9
            8'h39 : begin
                  HexSeg[4] = 1;
               end
        default : HexSeg = 7'b1111111;
      endcase
    end
endmodule
