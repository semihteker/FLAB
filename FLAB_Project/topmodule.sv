`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur SÖNMEZ
// 
// Create Date: 11/15/2016 08:33:20 AM
// Design Name: 
// Module Name: topmodule
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Top module of project
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module topmodule(input logic buttonIn,clk,start,mode,art,
                 input logic[1:0] difficultyLevel,
                 input logic cont,//acquiring from switch,the game can be paused
                 output logic[15:0] progressBar,//16 bit progress bar
                 output logic[7:0] rowsOut,
                 output logic shcp, stcp, mr, oe, ds,
                 output logic a,b,c,d,e,f,g,dp,
                 output logic[3:0] an);

logic reset,isPassed,collision,gameOver,gameFinished,buttonOut,genRandom1,genRandom2;
logic clk_en, obstacle_en,load;
logic[7:0][23:0] bird;
logic[7:0][23:0] obs;
logic[7:0][23:0] stateOut;
logic[7:0][23:0] in;
logic[1:0][23:0] obstacle1;   
logic[1:0][23:0] obstacle0;
logic[23:0] concat1;
logic[23:0] concat2;
logic[23:0] last;
logic[28:0] count;
logic[28:0] countObs;
logic[28:0] size;
logic[5:0] seed1;
logic[5:0] seed0;
logic act,endGame,control;
logic[2:0] nums;

initial load = 1;
assign seed1 =6'b010100;
assign seed0 =6'b100010;
initial genRandom1 = 1;
initial genRandom2 = 1;

//CLOCK DIVISIONS!
always@ (posedge clk) begin
    if( act == 1'b1) begin
     count <=(reset)?29'd0:count + 1;
     if (count==29'd40000000)//45 //D: last value for counter
         count <= 29'd0; //N: length of counter
     if( buttonOut == 1'b1 )//amazing hoo!
         clk_en <= 1'b1;
     else if (count==29'd0)
         clk_en <= 1'b1;
     else
         clk_en <= 1'b0;
     end
 end
  always@ (posedge clk) begin
   if( act == 1'b1) begin
   countObs <=countObs + 1;
   if (countObs == size)//10 //D: last value for counter
       countObs <= 29'd0; //N: length of counter
   if (countObs==29'd0)
       obstacle_en <= 1'b1;
   else
       obstacle_en <= 1'b0;  
    if(countObs == 29'd6)//needs 6 rising edge clocks first!
        load <= 0; 
   end 
end

//Picks the mode of game (artificial or user-controller)
logic push,birdMot;
always_comb begin
    if( art == 1)
        birdMot = push;
    else
        birdMot = buttonOut;
end 

DifficultyLevel difficulty(difficultyLevel,size,nums);//difficulty
ButtonSynchronizer but(buttonIn,clk,reset,buttonOut);//call button synchronizer module
random_generator ran1(clk,genRandom1,load,mode,seed1,obstacle1[1],obstacle1[0]);
random_generator ran0(clk,genRandom2,load,mode,seed0,obstacle0[1],obstacle0[0]);
ArtificialIntelligence simulation(bird[6],bird[5],last,push);
ObstacleMotion obst(obstacle1,obstacle0,cont,obstacle_en,reset,genRandom1,genRandom2,obs,last,isPassed);

UpdateProgressBar update(obstacle_en,isPassed,reset,nums,progressBar,gameFinished);// update progress bar
BirdMotion motion(birdMot,cont,clk_en,reset,bird[5],bird[6],gameOver);
StateControl stateControl(clk,endGame,gameFinished,start,act,reset,stateOut);

//arranging according to the state of game
always_comb begin  
  if(endGame == 1'b1)
    in[7:0] = {stateOut[7:0]};
  else  
    in[7:0] = {bird[7:0]} + 
               {obs[7:0]} + 
               {stateOut[7:0]};//concat bird and obstacle motion
end

//control points !
controller cont1[23:0]({bird[6][23:0]},{obs[6][23:0]},{concat1[23:0]});
controller cont2[23:0]({bird[5][23:0]},{obs[5][23:0]},{concat2[23:0]});

//Collision Detector
always_comb begin
        if( concat1 == 24'd0 && concat2 == 24'd0) 
            collision = 1'b0;
        else 
            collision = 1'b1;
        if( bird[5] == 24'd0 && obs[5] != 24'd0)
            collision = 1'b1;
end

PlayChecker checkGame(gameOver,gameFinished,collision,endGame);//checks if the game over
LedMatrix led(clk, in, rowsOut,shcp, stcp, mr, oe, ds);
SevSeg_4digit s(clk, difficultyLevel[0],difficultyLevel[1], difficultyLevel[2], difficultyLevel[3],a, b, c, d, e, f, g, dp,an);
                 
endmodule
