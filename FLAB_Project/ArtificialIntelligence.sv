`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ONUR SÖNMEZ
// 
// Create Date: 12/21/2016 05:09:55 PM
// Design Name: 
// Module Name: ArtificialIntelligence
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

//Arrange the motion of bird according to coming obstacles, and it is artificially acting
module ArtificialIntelligence(input logic[7:0]  birdTail,
                              input logic[7:0]  birdHead,
                              input logic[7:0] obstacle,
                              output logic push    );
  logic[7:0] low;     
  always_comb begin
     if(obstacle[1]== 0)begin
          low[0] = 1;
          low[7:1]={7{1'b0}};
     end
     else if(obstacle[2]== 0)begin
          low[1:0] = {2{1'b1}};
          low[7:2]={6{1'b0}};
     end
     else if(obstacle[3]== 0)begin
          low[2:0] = {3{1'b1}};
          low[7:3]={5{1'b0}};
     end 
     else if(obstacle[4]== 0)begin
          low[3:0] = {4{1'b1}};
          low[7:4]={4{1'b0}};
     end
     else begin
          low[4:0] = {5{1'b1}};
          low[7:5]={3{1'b0}};
    end     
   end
     
     always_comb begin
        if( birdTail  <= low + 1 | birdHead <= low + 1 )
            push <= 1;
        else
            push <= 0;
     end
endmodule