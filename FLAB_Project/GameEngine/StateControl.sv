`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/09/2016 01:54:19 PM
// Design Name:
// Module Name: StateEnable
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module StateControl(input logic clk,endGame,gameCompleted,
                    input logic start,
                    output logic act,reset,
                    output logic[7:0][23:0] out );
   typedef enum logic[1:0]{S0,S1,S2,S3} stateType;
   stateType[1:0] state,nextState;
   logic clk_en,load;
   logic[28:0] count;
   //initial enable = 0;
   logic[7:0][5:0] seeds;
   logic[2:0] smile;
   logic[2:0] upset;
   logic check;
   initial load = 1;
   logic[7:0][23:0] result1;
   logic[7:0][23:0] result2;
   logic[7:0][23:0] result3;
   logic control;

    always@ (posedge clk) begin
            count <=(endGame)?29'd0:count + 1;
            if (count==29'd8000000) //D: last value for counter
                count <= 29'd0; //N: length of counter
            if (count==29'd0)
                clk_en <= 1'b1;
            else
                clk_en <= 1'b0;
            if(count == 29'd6)//needs 6 rising edge clocks first to pass seed!
                load <=0;
    end

    assign control = check & clk_en;
    RandomColoring rands[7:0]({8{clk}},{8{clk_en}},{8{load}},{seeds[7:0]},{result1[7:0]});

    Smiley smiley(clk,control,load,smile,result2);
    Upset sulk(clk,control,load,upset,result3);

   always_ff@(posedge clk)
        begin
            state<=nextState;
        end

   always_comb begin
      if(start == 1'b1)
            reset = 1'b1;
      case(state)
        S0: begin
            //random cloring
            check = 1'b1;
            seeds[0] = 6'b110100;
            seeds[1] = 6'b010011;
            seeds[2] = 6'b010100;
            seeds[3] = 6'b001100;
            seeds[4] = 6'b100101;
            seeds[5] = 6'b101000;
            seeds[6] = 6'b000101;
            seeds[7] = 6'b100111;
            out[7:0] = result1[7:0];
            nextState =(start)?S1:S0;
        end
        S1: begin
            reset = 1'b0;
            check = 1'b1;
            out[7:0] = {8{1'b0}};
            nextState =(endGame)?((gameCompleted)?S2:S3):S1;
        end
        S2: begin
            smile = 3'b001;
            check = 1'b0;
            out[7:0] = result2[7:0];
             //smile
             nextState =(start)?S0:S2; //gameCompleted case
        end
        S3: begin
            upset = 3'b001;
            check = 1'b0;
            out[7:0] = result3[7:0];
             //upset
             nextState =(start)?S0:S3;//game over case
        end
        default: nextState = S0;
      endcase
   end

   assign act = (state == S1);//game acts!


endmodule
